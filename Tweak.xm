
@interface SBLockScreenManager : NSObject
+ (id)sharedInstance;
- (BOOL)isUILocked;
- (id)lockScreenViewController;
@end
@interface SBLockScreenViewController : NSObject
- (void)dismissCameraImmediately;
- (BOOL)cameraIsVisible;
- (BOOL)cameraIsActive;
@end


%hook SBCCQuickLaunchSectionController

- (void)_activateAppWithBundleId:(NSString *)bundleID url:(NSURL *)url {
	SBLockScreenManager *ls = [%c(SBLockScreenManager) sharedInstance];
	
	if ([ls.lockScreenViewController cameraIsActive] || [ls.lockScreenViewController cameraIsVisible]) {
		if ([ls.lockScreenViewController respondsToSelector:@selector(dismissCameraImmediately)]) {
			[ls.lockScreenViewController dismissCameraImmediately];
		}
	}
	
	%orig;
}

%end

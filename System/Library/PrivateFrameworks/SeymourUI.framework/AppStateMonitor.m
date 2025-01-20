@interface AppStateMonitor
- (void)publishAppDidBecomeActive;
- (void)publishAppDidEnterBackground;
- (void)publishAppWillEnterForeground;
- (void)publishAppWillResignActive;
- (void)publishAppWillTerminate;
- (void)publishSignificantTimeChanged;
@end

@implementation AppStateMonitor

- (void)publishAppDidBecomeActive
{
}

- (void)publishAppWillEnterForeground
{
}

- (void)publishAppWillResignActive
{
}

- (void)publishAppDidEnterBackground
{
}

- (void)publishAppWillTerminate
{
}

- (void)publishSignificantTimeChanged
{
}

@end
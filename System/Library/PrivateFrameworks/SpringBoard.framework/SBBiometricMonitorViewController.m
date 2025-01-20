@interface SBBiometricMonitorViewController
- (void)loadView;
@end

@implementation SBBiometricMonitorViewController

- (void)loadView
{
  v4 = objc_alloc_init(SBBiometricMonitorView);
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBBiometricMonitorView *)v4 setBackgroundColor:v3];

  [(SBBiometricMonitorViewController *)self setView:v4];
}

@end
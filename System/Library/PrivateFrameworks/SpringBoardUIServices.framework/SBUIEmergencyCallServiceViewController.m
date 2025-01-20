@interface SBUIEmergencyCallServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (SBUIEmergencyCallServiceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIColor)tintColor;
- (int64_t)backgroundStyle;
- (void)backgroundStyle:(id)a3;
- (void)noteTintColorForBackgroundStyleChanged:(id)a3;
- (void)setBackgroundStyle:(int64_t)a3;
@end

@implementation SBUIEmergencyCallServiceViewController

- (SBUIEmergencyCallServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBUIEmergencyCallServiceViewController;
  v4 = [(SBUIEmergencyCallServiceViewController *)&v11 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = 2;
    v6 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:2010];
    v7 = [v6 colorTint];
    [v6 colorTintAlpha];
    uint64_t v8 = objc_msgSend(v7, "colorWithAlphaComponent:");
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v8;
  }
  return v5;
}

- (void)backgroundStyle:(id)a3
{
  if (a3) {
    (*((void (**)(id, int64_t))a3 + 2))(a3, self->_backgroundStyle);
  }
}

- (void)noteTintColorForBackgroundStyleChanged:(id)a3
{
  p_tintColor = &self->_tintColor;
  id v5 = a3;
  if ((-[UIColor isEqual:](*p_tintColor, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_tintColor, a3);
  }
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD3D990];
}

+ (id)_exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD2F438];
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
}

@end
@interface SBRecordingIndicatorWindow
- (BOOL)isActive;
- (SBRecordingIndicatorWindow)initWithWindowScene:(id)a3 debugName:(id)a4;
@end

@implementation SBRecordingIndicatorWindow

- (SBRecordingIndicatorWindow)initWithWindowScene:(id)a3 debugName:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F42D90];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 mainScreen];
  v10 = NSString;
  v11 = [v9 displayIdentity];
  v12 = [v10 stringWithFormat:@"%@-%@", v7, v11];

  v16.receiver = self;
  v16.super_class = (Class)SBRecordingIndicatorWindow;
  v13 = [(SBWindow *)&v16 initWithWindowScene:v8 rootViewController:0 layoutStrategy:0 role:@"SBTraitsParticipantRoleRecordingIndicator" debugName:v12];

  v14 = v13;
  [(SBRecordingIndicatorWindow *)v14 setOpaque:0];

  return v14;
}

- (BOOL)isActive
{
  return 0;
}

@end
@interface UIInputViewSetNotificationInfo
+ (id)info;
- (BOOL)assistantOnScreenOnly;
- (BOOL)changedAccessoryOnly;
- (BOOL)containsChange;
- (BOOL)dueToRotation;
- (BOOL)forWritingToolsSheet;
- (BOOL)forceNotification;
- (BOOL)nonKeyboardOverride;
- (BOOL)shouldSendInClient;
- (BOOL)waitingForInputUI;
- (BOOL)wasCausedRemotely;
- (CGPoint)beginCenter;
- (CGPoint)endCenter;
- (CGRect)assistantFrame;
- (CGRect)beginFrame;
- (CGRect)bounds;
- (CGRect)endFrame;
- (NSDictionary)privateUserInfo;
- (NSDictionary)userInfo;
- (NSString)debugInfo;
- (UIInputViewSetNotificationInfo)init;
- (double)duration;
- (id)description;
- (id)inverseInfo;
- (id)rotationUserInfo;
- (unint64_t)assistantPosition;
- (unint64_t)options;
- (unint64_t)type;
- (void)addKeyboardNotificationDebuggingInfo:(id)a3;
- (void)populateEndInfoWithFrame:(CGRect)a3;
- (void)populateStartInfoWithFrame:(CGRect)a3;
- (void)populateWithAnimationStyle:(id)a3;
- (void)setAssistantFrame:(CGRect)a3;
- (void)setAssistantOnScreenOnly:(BOOL)a3;
- (void)setAssistantPosition:(unint64_t)a3;
- (void)setBeginCenter:(CGPoint)a3;
- (void)setBeginFrame:(CGRect)a3;
- (void)setBounds:(CGRect)a3;
- (void)setChangedAccessoryOnly:(BOOL)a3;
- (void)setDebugInfo:(id)a3;
- (void)setDueToRotation:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEndCenter:(CGPoint)a3;
- (void)setEndFrame:(CGRect)a3;
- (void)setForWritingToolsSheet:(BOOL)a3;
- (void)setForceNotification:(BOOL)a3;
- (void)setNonKeyboardOverride:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setShouldSendInClient:(BOOL)a3;
- (void)setType:(unint64_t)a3;
- (void)setWaitingForInputUI:(BOOL)a3;
- (void)setWasCausedRemotely:(BOOL)a3;
@end

@implementation UIInputViewSetNotificationInfo

+ (id)info
{
  v2 = objc_alloc_init(UIInputViewSetNotificationInfo);
  return v2;
}

- (UIInputViewSetNotificationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIInputViewSetNotificationInfo;
  v2 = [(UIInputViewSetNotificationInfo *)&v6 init];
  if (v2)
  {
    if (+[UIKeyboard usesInputSystemUI])
    {
      v3 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
      v4 = [v3 currentUIState];
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](v2, "setWasCausedRemotely:", [v4 isLocal] ^ 1);
    }
    else
    {
      v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](v2, "setWasCausedRemotely:", [v3 handlingRemoteEvent]);
    }
  }
  return v2;
}

- (id)inverseInfo
{
  uint64_t v3 = [(id)objc_opt_class() info];
  *(double *)(v3 + 24) = self->_duration;
  *(void *)(v3 + 32) = self->_options;
  [(UIInputViewSetNotificationInfo *)self endFrame];
  objc_msgSend((id)v3, "populateStartInfoWithFrame:");
  [(UIInputViewSetNotificationInfo *)self beginFrame];
  objc_msgSend((id)v3, "populateEndInfoWithFrame:");
  return (id)v3;
}

- (NSDictionary)userInfo
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  v4 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self beginFrame];
  v5 = objc_msgSend(v4, "valueWithCGRect:");
  [v3 setObject:v5 forKey:@"UIKeyboardFrameBeginUserInfoKey"];

  objc_super v6 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self endFrame];
  v7 = objc_msgSend(v6, "valueWithCGRect:");
  [v3 setObject:v7 forKey:@"UIKeyboardFrameEndUserInfoKey"];

  v8 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self beginCenter];
  v9 = objc_msgSend(v8, "valueWithCGPoint:");
  [v3 setObject:v9 forKey:@"UIKeyboardCenterBeginUserInfoKey"];

  v10 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self endCenter];
  v11 = objc_msgSend(v10, "valueWithCGPoint:");
  [v3 setObject:v11 forKey:@"UIKeyboardCenterEndUserInfoKey"];

  v12 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self bounds];
  v13 = objc_msgSend(v12, "valueWithCGRect:");
  [v3 setObject:v13 forKey:@"UIKeyboardBoundsUserInfoKey"];

  v14 = NSNumber;
  [(UIInputViewSetNotificationInfo *)self duration];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  [v3 setObject:v15 forKey:@"UIKeyboardAnimationDurationUserInfoKey"];

  unint64_t v16 = [(UIInputViewSetNotificationInfo *)self options];
  v17 = [NSNumber numberWithInteger:(v16 >> 16) & 0xF];
  [v3 setObject:v17 forKey:@"UIKeyboardAnimationCurveUserInfoKey"];

  if (+[_UIRemoteKeyboards enabled])
  {
    v18 = objc_msgSend(NSNumber, "numberWithInt:", -[UIInputViewSetNotificationInfo wasCausedRemotely](self, "wasCausedRemotely") ^ 1);
    [v3 setObject:v18 forKey:@"UIKeyboardIsLocalUserInfoKey"];
  }
  return (NSDictionary *)v3;
}

- (id)rotationUserInfo
{
  v2 = [(UIInputViewSetNotificationInfo *)self userInfo];
  [v2 removeObjectForKey:@"UIKeyboardAnimationCurveUserInfoKey"];
  [v2 removeObjectForKey:@"UIKeyboardBoundsUserInfoKey"];
  return v2;
}

- (NSDictionary)privateUserInfo
{
  uint64_t v3 = [(UIInputViewSetNotificationInfo *)self userInfo];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[UIInputViewSetNotificationInfo changedAccessoryOnly](self, "changedAccessoryOnly"));
  [v3 setObject:v4 forKey:@"UIKeyboardChangedAccessoryOnly"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[UIInputViewSetNotificationInfo assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  [v3 setObject:v5 forKey:@"UIKeyboardAssistantOnScreenOnlyUserInfoKey"];

  objc_super v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UIInputViewSetNotificationInfo assistantPosition](self, "assistantPosition"));
  [v3 setObject:v6 forKey:@"UIKeyboardAssistantPositionUserInfoKey"];

  v7 = (void *)MEMORY[0x1E4F29238];
  [(UIInputViewSetNotificationInfo *)self assistantFrame];
  v29[0] = v8;
  v29[1] = v9;
  v29[2] = v10;
  v29[3] = v11;
  v12 = [v7 valueWithBytes:v29 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [v3 setObject:v12 forKey:@"UIKeyboardFloatingRectUserInfoKey"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[UIInputViewSetNotificationInfo dueToRotation](self, "dueToRotation"));
  [v3 setObject:v13 forKey:@"UIKeyboardOriginatedFromRotationUserInfoKey"];

  v14 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  [v14 keyboardFrameIncludingRemoteIAV];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  if (CGRectIsEmpty(v31))
  {
    [(UIInputViewSetNotificationInfo *)self endFrame];
    CGFloat v16 = v23;
    CGFloat v18 = v24;
    CGFloat v20 = v25;
    CGFloat v22 = v26;
  }
  v32.origin.x = v16;
  v32.origin.y = v18;
  v32.size.width = v20;
  v32.size.height = v22;
  v27 = [NSNumber numberWithDouble:CGRectGetHeight(v32)];
  [v3 setObject:v27 forKey:@"UIKeyboardEndIntersectionHeightIncludingAccessory"];

  return (NSDictionary *)v3;
}

- (BOOL)containsChange
{
  if (self->_forceNotification) {
    return 1;
  }
  [(UIInputViewSetNotificationInfo *)self beginFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UIInputViewSetNotificationInfo *)self endFrame];
  v17.origin.x = v12;
  v17.origin.y = v13;
  v17.size.width = v14;
  v17.size.height = v15;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return !CGRectEqualToRect(v16, v17);
}

- (void)populateWithAnimationStyle:(id)a3
{
  id v4 = a3;
  [v4 duration];
  -[UIInputViewSetNotificationInfo setDuration:](self, "setDuration:");
  uint64_t v5 = [v4 extraOptions];

  [(UIInputViewSetNotificationInfo *)self setOptions:v5 | 0x70000];
}

- (void)populateStartInfoWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UIInputViewSetNotificationInfo setBeginFrame:](self, "setBeginFrame:");
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v12);
  -[UIInputViewSetNotificationInfo setBeginCenter:](self, "setBeginCenter:", MidX, MidY);
}

- (void)populateEndInfoWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UIInputViewSetNotificationInfo setEndFrame:](self, "setEndFrame:");
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.double width = width;
  v12.size.double height = height;
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  -[UIInputViewSetNotificationInfo setEndCenter:](self, "setEndCenter:", MidX, CGRectGetMidY(v13));
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIInputViewSetNotificationInfo setBounds:](self, "setBounds:", v9, v10, width, height);
}

- (void)addKeyboardNotificationDebuggingInfo:(id)a3
{
  id v9 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = [(UIInputViewSetNotificationInfo *)self debugInfo];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      double v6 = NSString;
      CGFloat v7 = [(UIInputViewSetNotificationInfo *)self debugInfo];
      double v8 = [v6 stringWithFormat:@"%@ > %@", v7, v9];
      [(UIInputViewSetNotificationInfo *)self setDebugInfo:v8];
    }
    else
    {
      [(UIInputViewSetNotificationInfo *)self setDebugInfo:v9];
    }
  }
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(UIInputViewSetNotificationInfo *)self userInfo];
  double v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  CGFloat v7 = [(UIInputViewSetNotificationInfo *)self debugInfo];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    id v9 = [(UIInputViewSetNotificationInfo *)self debugInfo];
    [v6 appendFormat:@"Notifications debug: %@", v9];
  }
  return v6;
}

- (CGRect)beginFrame
{
  double x = self->_beginFrame.origin.x;
  double y = self->_beginFrame.origin.y;
  double width = self->_beginFrame.size.width;
  double height = self->_beginFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBeginFrame:(CGRect)a3
{
  self->_beginFrame = a3;
}

- (CGRect)endFrame
{
  double x = self->_endFrame.origin.x;
  double y = self->_endFrame.origin.y;
  double width = self->_endFrame.size.width;
  double height = self->_endFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (BOOL)changedAccessoryOnly
{
  return self->_changedAccessoryOnly;
}

- (void)setChangedAccessoryOnly:(BOOL)a3
{
  self->_changedAccessoryOnldouble y = a3;
}

- (BOOL)assistantOnScreenOnly
{
  return self->_assistantOnScreenOnly;
}

- (void)setAssistantOnScreenOnly:(BOOL)a3
{
  self->_assistantOnScreenOnldouble y = a3;
}

- (unint64_t)assistantPosition
{
  return self->_assistantPosition;
}

- (void)setAssistantPosition:(unint64_t)a3
{
  self->_assistantPosition = a3;
}

- (CGRect)assistantFrame
{
  double x = self->_assistantFrame.origin.x;
  double y = self->_assistantFrame.origin.y;
  double width = self->_assistantFrame.size.width;
  double height = self->_assistantFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAssistantFrame:(CGRect)a3
{
  self->_assistantFrame = a3;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (BOOL)wasCausedRemotely
{
  return self->_wasCausedRemotely;
}

- (void)setWasCausedRemotely:(BOOL)a3
{
  self->_wasCausedRemoteldouble y = a3;
}

- (BOOL)dueToRotation
{
  return self->_dueToRotation;
}

- (void)setDueToRotation:(BOOL)a3
{
  self->_dueToRotation = a3;
}

- (BOOL)forWritingToolsSheet
{
  return self->_forWritingToolsSheet;
}

- (void)setForWritingToolsSheet:(BOOL)a3
{
  self->_forWritingToolsSheet = a3;
}

- (BOOL)shouldSendInClient
{
  return self->_shouldSendInClient;
}

- (void)setShouldSendInClient:(BOOL)a3
{
  self->_shouldSendInClient = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (BOOL)waitingForInputUI
{
  return self->_waitingForInputUI;
}

- (void)setWaitingForInputUI:(BOOL)a3
{
  self->_waitingForInputUI = a3;
}

- (CGPoint)beginCenter
{
  double x = self->_beginCenter.x;
  double y = self->_beginCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBeginCenter:(CGPoint)a3
{
  self->_beginCenter = a3;
}

- (CGPoint)endCenter
{
  double x = self->_endCenter.x;
  double y = self->_endCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setEndCenter:(CGPoint)a3
{
  self->_endCenter = a3;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (NSString)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
}

- (BOOL)nonKeyboardOverride
{
  return self->_nonKeyboardOverride;
}

- (void)setNonKeyboardOverride:(BOOL)a3
{
  self->_nonKeyboardOverride = a3;
}

- (void).cxx_destruct
{
}

@end
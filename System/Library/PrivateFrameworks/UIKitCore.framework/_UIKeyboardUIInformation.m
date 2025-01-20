@interface _UIKeyboardUIInformation
+ (BOOL)supportsSecureCoding;
+ (id)animationFence;
- (BKSAnimationFenceHandle)animationFence;
- (BOOL)animated;
- (BOOL)assistantBarVisible;
- (BOOL)assistantOnScreenOnly;
- (BOOL)changedAccessoryOnly;
- (BOOL)dueToRotation;
- (BOOL)forceNotification;
- (BOOL)hasValidNotification;
- (BOOL)isLocal;
- (BOOL)isStartNotification;
- (BOOL)keyboardOnScreen;
- (BOOL)requiresHeightForIntegratedAssistantBar;
- (BOOL)resizing;
- (BOOL)tracking;
- (BOOL)wasCausedRemotely;
- (CGRect)assistantFrame;
- (CGRect)beginFrame;
- (CGRect)endFrame;
- (CGRect)keyboardPosition;
- (NSString)applicationIdentifier;
- (NSString)bundleIdentifier;
- (NSString)currentInputMode;
- (_UIKeyboardUIInformation)initWithCoder:(id)a3;
- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 fence:(id)a7;
- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 fence:(id)a8;
- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 wantsFence:(BOOL)a8;
- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 wantsFence:(BOOL)a7;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyWithoutFence;
- (id)description;
- (id)notificationInfo;
- (int64_t)orientation;
- (unint64_t)assistantPosition;
- (unint64_t)keyboardScenePresentationMode;
- (unint64_t)notification;
- (unint64_t)options;
- (unint64_t)uiPosition;
- (void)addNotificationInfo:(id)a3 isStart:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)resetAnimationFencing;
- (void)setApplicationIdentifier:(id)a3;
- (void)setAssistantBarVisible:(BOOL)a3;
- (void)setAssistantFrame:(CGRect)a3;
- (void)setAssistantOnScreenOnly:(BOOL)a3;
- (void)setAssistantPosition:(unint64_t)a3;
- (void)setBeginFrame:(CGRect)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setChangedAccessoryOnly:(BOOL)a3;
- (void)setCurrentInputMode:(id)a3;
- (void)setDueToRotation:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEndFrame:(CGRect)a3;
- (void)setForceNotification:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setKeyboardScenePresentationMode:(unint64_t)a3;
- (void)setNotification:(unint64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setRequiresHeightForIntegratedAssistantBar:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setStartNotification:(BOOL)a3;
- (void)setUiPosition:(unint64_t)a3;
- (void)setWasCausedRemotely:(BOOL)a3;
@end

@implementation _UIKeyboardUIInformation

- (BOOL)keyboardOnScreen
{
  return self->_keyboardOnScreen;
}

- (void)resetAnimationFencing
{
  [(BKSAnimationFenceHandle *)self->_animationFence invalidate];
  animationFence = self->_animationFence;
  self->_animationFence = 0;
}

- (BKSAnimationFenceHandle)animationFence
{
  return (BKSAnimationFenceHandle *)objc_getProperty(self, a2, 24, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  applicationIdentifier = self->_applicationIdentifier;
  id v15 = a3;
  [v15 encodeObject:applicationIdentifier forKey:@"ApplicationIdentifier"];
  [v15 encodeObject:self->_bundleIdentifier forKey:@"BundleIdentifier"];
  [v15 encodeObject:self->_animationFence forKey:@"AnimationFence"];
  v5 = (void *)MEMORY[0x1E4F29238];
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  v6 = objc_msgSend(v5, "valueWithCGRect:");
  [v15 encodeObject:v6 forKey:@"Position"];

  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardOnScreen](self, "keyboardOnScreen"), @"OnScreen");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"), @"AssistantVisible");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation requiresHeightForIntegratedAssistantBar](self, "requiresHeightForIntegratedAssistantBar"), @"IntegratedAssistant");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation animated](self, "animated"), @"Animated");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation tracking](self, "tracking"), @"Tracking");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation resizing](self, "resizing"), @"Resizing");
  objc_msgSend(v15, "encodeInt32:forKey:", -[_UIKeyboardUIInformation orientation](self, "orientation"), @"Orientation");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation isLocal](self, "isLocal"), @"IsLocal");
  v7 = [(_UIKeyboardUIInformation *)self currentInputMode];
  [v15 encodeObject:v7 forKey:@"CurrentInputMode"];

  objc_msgSend(v15, "encodeInt32:forKey:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"), @"UIPosition");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation keyboardScenePresentationMode](self, "keyboardScenePresentationMode") != 0, @"KeyboardScenePresentationMode");
  objc_msgSend(v15, "encodeInteger:forKey:", -[_UIKeyboardUIInformation notification](self, "notification"), @"UIIVSNotificationType");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation isStartNotification](self, "isStartNotification"), @"NotificationIsStartNotification");
  v8 = (void *)MEMORY[0x1E4F29238];
  [(_UIKeyboardUIInformation *)self beginFrame];
  v9 = objc_msgSend(v8, "valueWithCGRect:");
  [v15 encodeObject:v9 forKey:@"NotificationsBeginFrame"];

  v10 = (void *)MEMORY[0x1E4F29238];
  [(_UIKeyboardUIInformation *)self endFrame];
  v11 = objc_msgSend(v10, "valueWithCGRect:");
  [v15 encodeObject:v11 forKey:@"NotificationsEndFrame"];

  [(_UIKeyboardUIInformation *)self duration];
  *(float *)&double v12 = v12;
  [v15 encodeFloat:@"NotificationsDuration" forKey:v12];
  objc_msgSend(v15, "encodeInteger:forKey:", -[_UIKeyboardUIInformation options](self, "options"), @"NotificationsAnimationOptions");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"), @"NotificationsAccessoryChanged");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"), @"NotificationsAssistantPosition");
  v13 = (void *)MEMORY[0x1E4F29238];
  [(_UIKeyboardUIInformation *)self assistantFrame];
  v14 = objc_msgSend(v13, "valueWithCGRect:");
  [v15 encodeObject:v14 forKey:@"NotificationsAssistantFrame"];

  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"), @"NotificationsForceNotification");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"), @"NotificationsCausedRemotely");
  objc_msgSend(v15, "encodeBool:forKey:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"), @"NotificationsDueToRotation");
}

- (CGRect)keyboardPosition
{
  objc_copyStruct(v6, &self->_keyboardPosition, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)uiPosition
{
  return self->_uiPosition;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)wasCausedRemotely
{
  return self->_wasCausedRemotely;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (BOOL)resizing
{
  return self->_resizing;
}

- (BOOL)requiresHeightForIntegratedAssistantBar
{
  return self->_requiresHeightForIntegratedAssistantBar;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (unint64_t)options
{
  return self->_options;
}

- (unint64_t)notification
{
  return self->_notification;
}

- (unint64_t)keyboardScenePresentationMode
{
  return self->_keyboardScenePresentationMode;
}

- (BOOL)isStartNotification
{
  return self->_startNotification;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
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

- (double)duration
{
  return self->_duration;
}

- (BOOL)dueToRotation
{
  return self->_dueToRotation;
}

- (NSString)currentInputMode
{
  return self->_currentInputMode;
}

- (BOOL)changedAccessoryOnly
{
  return self->_changedAccessoryOnly;
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

- (BOOL)assistantOnScreenOnly
{
  return self->_assistantOnScreenOnly;
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

- (BOOL)assistantBarVisible
{
  return self->_assistantBarVisible;
}

- (BOOL)animated
{
  return self->_animated;
}

- (_UIKeyboardUIInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)_UIKeyboardUIInformation;
  double v5 = [(_UIKeyboardUIInformation *)&v38 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C108260]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplicationIdentifier"];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnimationFence"];
    animationFence = v5->_animationFence;
    v5->_animationFence = (BKSAnimationFenceHandle *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Position"];
    [v13 CGRectValue];
    v5->_keyboardPosition.origin.double x = v14;
    v5->_keyboardPosition.origin.double y = v15;
    v5->_keyboardPosition.size.double width = v16;
    v5->_keyboardPosition.size.double height = v17;

    v5->_keyboardOnScreen = [v4 decodeBoolForKey:@"OnScreen"];
    v5->_assistantBarVisible = [v4 decodeBoolForKey:@"AssistantVisible"];
    v5->_requiresHeightForIntegratedAssistantBar = [v4 decodeBoolForKey:@"IntegratedAssistant"];
    v5->_animated = [v4 decodeBoolForKey:@"Animated"];
    v5->_tracking = [v4 decodeBoolForKey:@"Tracking"];
    v5->_resizing = [v4 decodeBoolForKey:@"Resizing"];
    v5->_orientation = (int)[v4 decodeInt32ForKey:@"Orientation"];
    v5->_isLocal = [v4 decodeBoolForKey:@"IsLocal"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentInputMode"];
    currentInputMode = v5->_currentInputMode;
    v5->_currentInputMode = (NSString *)v18;

    v5->_uiPosition = (int)[v4 decodeInt32ForKey:@"UIPosition"];
    v5->_keyboardScenePresentationMode = [v4 decodeBoolForKey:@"KeyboardScenePresentationMode"];
    v5->_notification = [v4 decodeIntegerForKey:@"UIIVSNotificationType"];
    v5->_startNotification = [v4 decodeBoolForKey:@"NotificationIsStartNotification"];
    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationsBeginFrame"];
    [v20 CGRectValue];
    v5->_beginFrame.origin.double x = v21;
    v5->_beginFrame.origin.double y = v22;
    v5->_beginFrame.size.double width = v23;
    v5->_beginFrame.size.double height = v24;

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationsEndFrame"];
    [v25 CGRectValue];
    v5->_endFrame.origin.double x = v26;
    v5->_endFrame.origin.double y = v27;
    v5->_endFrame.size.double width = v28;
    v5->_endFrame.size.double height = v29;

    [v4 decodeFloatForKey:@"NotificationsDuration"];
    v5->_duration = v30;
    v5->_options = [v4 decodeIntegerForKey:@"NotificationsAnimationOptions"];
    v5->_changedAccessoryOnldouble y = [v4 decodeBoolForKey:@"NotificationsAccessoryChanged"];
    v5->_assistantOnScreenOnldouble y = [v4 decodeBoolForKey:@"NotificationsAssistantPosition"];
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"NotificationsAssistantFrame"];
    [v31 CGRectValue];
    v5->_assistantFrame.origin.double x = v32;
    v5->_assistantFrame.origin.double y = v33;
    v5->_assistantFrame.size.double width = v34;
    v5->_assistantFrame.size.double height = v35;

    v5->_forceNotification = [v4 decodeBoolForKey:@"NotificationsForceNotification"];
    v5->_wasCausedRemoteldouble y = [v4 decodeBoolForKey:@"NotificationsCausedRemotely"];
    v5->_dueToRotation = [v4 decodeBoolForKey:@"NotificationsDueToRotation"];
    v36 = v5;
  }

  return v5;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 wantsFence:(BOOL)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v16 = +[UIKeyboard activeKeyboard];
  uint64_t v17 = [v16 _keyboardOrientation];
  if (a7)
  {
    uint64_t v18 = [(id)objc_opt_class() animationFence];
    v19 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v10, v9, v8, v17, v18, x, y, width, height);
  }
  else
  {
    v19 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v10, v9, v8, v17, 0, x, y, width, height);
  }

  return v19;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 fence:(id)a8
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyboardUIInformation;
  v19 = [(_UIKeyboardUIInformation *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_animationFence, a8);
    v20->_keyboardPosition.origin.CGFloat x = x;
    v20->_keyboardPosition.origin.CGFloat y = y;
    v20->_keyboardPosition.size.CGFloat width = width;
    v20->_keyboardPosition.size.CGFloat height = height;
    v20->_keyboardOnScreen = a4;
    v20->_animated = a5;
    v20->_tracking = a6;
    v20->_orientation = a7;
    v20->_notification = 0;
    CGPoint v21 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v20->_beginFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v20->_beginFrame.size = v22;
    v20->_endFrame.origin = v21;
    v20->_endFrame.size = v22;
    v20->_duration = 0.0;
  }

  return v20;
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 fence:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_UIKeyboardUIInformation;
  uint64_t v17 = [(_UIKeyboardUIInformation *)&v23 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_animationFence, a7);
    v18->_keyboardPosition.origin.CGFloat x = x;
    v18->_keyboardPosition.origin.CGFloat y = y;
    v18->_keyboardPosition.size.CGFloat width = width;
    v18->_keyboardPosition.size.CGFloat height = height;
    v18->_keyboardOnScreen = a4;
    v18->_animated = a5;
    v18->_tracking = a6;
    v19 = +[UIKeyboard activeKeyboard];
    v18->_orientation = [v19 _keyboardOrientation];

    v18->_notification = 0;
    CGPoint v20 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v21 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v18->_beginFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v18->_beginFrame.size = v21;
    v18->_endFrame.origin = v20;
    v18->_endFrame.size = v21;
    v18->_duration = 0.0;
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
  objc_storeStrong((id *)&self->_animationFence, 0);
}

- (_UIKeyboardUIInformation)initWithKeyboardFrame:(CGRect)a3 onScreen:(BOOL)a4 animated:(BOOL)a5 tracking:(BOOL)a6 orientation:(int64_t)a7 wantsFence:(BOOL)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a8)
  {
    uint64_t v17 = [(id)objc_opt_class() animationFence];
    id v18 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", v11, v10, v9, a7, v17, x, y, width, height);
  }
  else
  {
    id v18 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](self, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", a4, a5, a6, a7, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  double v5 = objc_msgSend(v4, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", self->_keyboardOnScreen, self->_animated, self->_tracking, self->_orientation, self->_animationFence);
  objc_msgSend(v5, "setIsLocal:", -[_UIKeyboardUIInformation isLocal](self, "isLocal"));
  v6 = [(_UIKeyboardUIInformation *)self currentInputMode];
  uint64_t v7 = (void *)[v6 copy];
  [v5 setCurrentInputMode:v7];

  objc_msgSend(v5, "setUiPosition:", -[_UIKeyboardUIInformation uiPosition](self, "uiPosition"));
  objc_msgSend(v5, "setKeyboardScenePresentationMode:", -[_UIKeyboardUIInformation keyboardScenePresentationMode](self, "keyboardScenePresentationMode"));
  objc_msgSend(v5, "setAssistantBarVisible:", -[_UIKeyboardUIInformation assistantBarVisible](self, "assistantBarVisible"));
  objc_msgSend(v5, "setRequiresHeightForIntegratedAssistantBar:", -[_UIKeyboardUIInformation requiresHeightForIntegratedAssistantBar](self, "requiresHeightForIntegratedAssistantBar"));
  BOOL v8 = [(_UIKeyboardUIInformation *)self applicationIdentifier];
  BOOL v9 = (void *)[v8 copy];
  [v5 setApplicationIdentifier:v9];

  BOOL v10 = [(_UIKeyboardUIInformation *)self bundleIdentifier];
  BOOL v11 = (void *)[v10 copy];
  [v5 setBundleIdentifier:v11];

  objc_msgSend(v5, "setNotification:", -[_UIKeyboardUIInformation notification](self, "notification"));
  objc_msgSend(v5, "setStartNotification:", -[_UIKeyboardUIInformation isStartNotification](self, "isStartNotification"));
  [(_UIKeyboardUIInformation *)self beginFrame];
  objc_msgSend(v5, "setBeginFrame:");
  [(_UIKeyboardUIInformation *)self endFrame];
  objc_msgSend(v5, "setEndFrame:");
  [(_UIKeyboardUIInformation *)self duration];
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(v5, "setOptions:", -[_UIKeyboardUIInformation options](self, "options"));
  objc_msgSend(v5, "setResizing:", -[_UIKeyboardUIInformation resizing](self, "resizing"));
  objc_msgSend(v5, "setChangedAccessoryOnly:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"));
  objc_msgSend(v5, "setAssistantOnScreenOnly:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  [(_UIKeyboardUIInformation *)self assistantFrame];
  objc_msgSend(v5, "setAssistantFrame:");
  objc_msgSend(v5, "setForceNotification:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"));
  objc_msgSend(v5, "setWasCausedRemotely:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"));
  objc_msgSend(v5, "setDueToRotation:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"));
  return v5;
}

- (id)copyWithoutFence
{
  double v3 = [_UIKeyboardUIInformation alloc];
  [(_UIKeyboardUIInformation *)self keyboardPosition];
  BOOL v8 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:](v3, "initWithKeyboardFrame:onScreen:animated:tracking:orientation:fence:", [(_UIKeyboardUIInformation *)self keyboardOnScreen], self->_animated, self->_tracking, self->_orientation, 0, v4, v5, v6, v7);
  [(_UIKeyboardUIInformation *)v8 setIsLocal:[(_UIKeyboardUIInformation *)self isLocal]];
  BOOL v9 = [(_UIKeyboardUIInformation *)self currentInputMode];
  BOOL v10 = (void *)[v9 copy];
  [(_UIKeyboardUIInformation *)v8 setCurrentInputMode:v10];

  [(_UIKeyboardUIInformation *)v8 setUiPosition:[(_UIKeyboardUIInformation *)self uiPosition]];
  BOOL v11 = [(_UIKeyboardUIInformation *)self applicationIdentifier];
  double v12 = (void *)[v11 copy];
  [(_UIKeyboardUIInformation *)v8 setApplicationIdentifier:v12];

  v13 = [(_UIKeyboardUIInformation *)self bundleIdentifier];
  CGFloat v14 = (void *)[v13 copy];
  [(_UIKeyboardUIInformation *)v8 setBundleIdentifier:v14];

  [(_UIKeyboardUIInformation *)v8 setKeyboardScenePresentationMode:[(_UIKeyboardUIInformation *)self keyboardScenePresentationMode]];
  [(_UIKeyboardUIInformation *)v8 setAssistantBarVisible:[(_UIKeyboardUIInformation *)self assistantBarVisible]];
  [(_UIKeyboardUIInformation *)v8 setRequiresHeightForIntegratedAssistantBar:[(_UIKeyboardUIInformation *)self requiresHeightForIntegratedAssistantBar]];
  [(_UIKeyboardUIInformation *)v8 setResizing:[(_UIKeyboardUIInformation *)self resizing]];
  [(_UIKeyboardUIInformation *)v8 setNotification:[(_UIKeyboardUIInformation *)self notification]];
  [(_UIKeyboardUIInformation *)v8 setStartNotification:[(_UIKeyboardUIInformation *)self isStartNotification]];
  [(_UIKeyboardUIInformation *)self beginFrame];
  -[_UIKeyboardUIInformation setBeginFrame:](v8, "setBeginFrame:");
  [(_UIKeyboardUIInformation *)self endFrame];
  -[_UIKeyboardUIInformation setEndFrame:](v8, "setEndFrame:");
  [(_UIKeyboardUIInformation *)self duration];
  -[_UIKeyboardUIInformation setDuration:](v8, "setDuration:");
  [(_UIKeyboardUIInformation *)v8 setOptions:[(_UIKeyboardUIInformation *)self options]];
  [(_UIKeyboardUIInformation *)v8 setChangedAccessoryOnly:[(_UIKeyboardUIInformation *)self changedAccessoryOnly]];
  [(_UIKeyboardUIInformation *)v8 setAssistantOnScreenOnly:[(_UIKeyboardUIInformation *)self assistantOnScreenOnly]];
  [(_UIKeyboardUIInformation *)self assistantFrame];
  -[_UIKeyboardUIInformation setAssistantFrame:](v8, "setAssistantFrame:");
  [(_UIKeyboardUIInformation *)v8 setForceNotification:[(_UIKeyboardUIInformation *)self forceNotification]];
  [(_UIKeyboardUIInformation *)v8 setWasCausedRemotely:[(_UIKeyboardUIInformation *)self wasCausedRemotely]];
  [(_UIKeyboardUIInformation *)v8 setDueToRotation:[(_UIKeyboardUIInformation *)self dueToRotation]];
  return v8;
}

- (id)description
{
  CGSize v22 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)_UIKeyboardUIInformation;
  objc_super v23 = [(_UIKeyboardUIInformation *)&v24 description];
  bundleIdentifier = self->_bundleIdentifier;
  applicationIdentifier = self->_applicationIdentifier;
  animationFence = self->_animationFence;
  double v3 = StringFromCGRect(self->_keyboardPosition.origin.x, self->_keyboardPosition.origin.y, self->_keyboardPosition.size.width, self->_keyboardPosition.size.height);
  if (self->_animated) {
    double v4 = @"YES";
  }
  else {
    double v4 = @"NO";
  }
  if (self->_keyboardOnScreen) {
    double v5 = @"YES";
  }
  else {
    double v5 = @"NO";
  }
  if (self->_tracking) {
    double v6 = @"YES";
  }
  else {
    double v6 = @"NO";
  }
  if (self->_resizing) {
    double v7 = @"YES";
  }
  else {
    double v7 = @"NO";
  }
  if (self->_isLocal) {
    BOOL v8 = @"YES";
  }
  else {
    BOOL v8 = @"NO";
  }
  unint64_t uiPosition = self->_uiPosition;
  if (uiPosition > 3) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = off_1E5311B00[uiPosition];
  }
  BOOL v11 = v8;
  double v12 = v7;
  v13 = v6;
  CGFloat v14 = v5;
  CGFloat v15 = v4;
  if ([(_UIKeyboardUIInformation *)self hasValidNotification]) {
    id v16 = @"YES";
  }
  else {
    id v16 = @"NO";
  }
  objc_msgSend(v22, "stringWithFormat:", @"<%@; appId %@ bundleId %@ animation fence %@; position %@; animated %@; on screen %@; tracking %@; resizing %@; local %@, dock state: %@, hasValidNotif: %@>",
    v23,
    applicationIdentifier,
    bundleIdentifier,
    animationFence,
    v3,
    v15,
    v14,
    v13,
    v12,
    v11,
    v10,
  uint64_t v17 = v16);

  return v17;
}

+ (id)animationFence
{
  return +[UIScene _synchronizedDrawingFence];
}

- (id)notificationInfo
{
  double v3 = +[UIInputViewSetNotificationInfo info];
  [(_UIKeyboardUIInformation *)self beginFrame];
  objc_msgSend(v3, "populateStartInfoWithFrame:");
  [(_UIKeyboardUIInformation *)self endFrame];
  objc_msgSend(v3, "populateEndInfoWithFrame:");
  [(_UIKeyboardUIInformation *)self duration];
  objc_msgSend(v3, "setDuration:");
  objc_msgSend(v3, "setOptions:", -[_UIKeyboardUIInformation options](self, "options"));
  objc_msgSend(v3, "setChangedAccessoryOnly:", -[_UIKeyboardUIInformation changedAccessoryOnly](self, "changedAccessoryOnly"));
  objc_msgSend(v3, "setAssistantOnScreenOnly:", -[_UIKeyboardUIInformation assistantOnScreenOnly](self, "assistantOnScreenOnly"));
  [(_UIKeyboardUIInformation *)self assistantFrame];
  objc_msgSend(v3, "setAssistantFrame:");
  objc_msgSend(v3, "setForceNotification:", -[_UIKeyboardUIInformation forceNotification](self, "forceNotification"));
  objc_msgSend(v3, "setWasCausedRemotely:", -[_UIKeyboardUIInformation wasCausedRemotely](self, "wasCausedRemotely"));
  objc_msgSend(v3, "setDueToRotation:", -[_UIKeyboardUIInformation dueToRotation](self, "dueToRotation"));
  objc_msgSend(v3, "setType:", -[_UIKeyboardUIInformation notification](self, "notification"));
  return v3;
}

- (BOOL)hasValidNotification
{
  return [(_UIKeyboardUIInformation *)self notification] != 0;
}

- (void)addNotificationInfo:(id)a3 isStart:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 beginFrame];
  -[_UIKeyboardUIInformation setBeginFrame:](self, "setBeginFrame:");
  [v6 endFrame];
  -[_UIKeyboardUIInformation setEndFrame:](self, "setEndFrame:");
  [v6 duration];
  -[_UIKeyboardUIInformation setDuration:](self, "setDuration:");
  -[_UIKeyboardUIInformation setOptions:](self, "setOptions:", [v6 options]);
  -[_UIKeyboardUIInformation setChangedAccessoryOnly:](self, "setChangedAccessoryOnly:", [v6 changedAccessoryOnly]);
  -[_UIKeyboardUIInformation setAssistantOnScreenOnly:](self, "setAssistantOnScreenOnly:", [v6 assistantOnScreenOnly]);
  [v6 assistantFrame];
  -[_UIKeyboardUIInformation setAssistantFrame:](self, "setAssistantFrame:");
  -[_UIKeyboardUIInformation setForceNotification:](self, "setForceNotification:", [v6 forceNotification]);
  -[_UIKeyboardUIInformation setWasCausedRemotely:](self, "setWasCausedRemotely:", [v6 wasCausedRemotely]);
  -[_UIKeyboardUIInformation setDueToRotation:](self, "setDueToRotation:", [v6 dueToRotation]);
  uint64_t v7 = [v6 type];

  [(_UIKeyboardUIInformation *)self setNotification:v7];
  [(_UIKeyboardUIInformation *)self setStartNotification:v4];
}

- (void)setAssistantBarVisible:(BOOL)a3
{
  self->_assistantBarVisible = a3;
}

- (void)setRequiresHeightForIntegratedAssistantBar:(BOOL)a3
{
  self->_requiresHeightForIntegratedAssistantBar = a3;
}

- (void)setResizing:(BOOL)a3
{
  self->_resizing = a3;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (void)setCurrentInputMode:(id)a3
{
}

- (void)setUiPosition:(unint64_t)a3
{
  self->_unint64_t uiPosition = a3;
}

- (void)setKeyboardScenePresentationMode:(unint64_t)a3
{
  self->_keyboardScenePresentationMode = a3;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void)setBeginFrame:(CGRect)a3
{
  self->_beginFrame = a3;
}

- (void)setEndFrame:(CGRect)a3
{
  self->_endFrame = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (void)setChangedAccessoryOnly:(BOOL)a3
{
  self->_changedAccessoryOnldouble y = a3;
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

- (void)setAssistantFrame:(CGRect)a3
{
  self->_assistantFrame = a3;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (void)setWasCausedRemotely:(BOOL)a3
{
  self->_wasCausedRemoteldouble y = a3;
}

- (void)setDueToRotation:(BOOL)a3
{
  self->_dueToRotation = a3;
}

- (void)setStartNotification:(BOOL)a3
{
  self->_startNotification = a3;
}

- (void)setNotification:(unint64_t)a3
{
  self->_notification = a3;
}

@end
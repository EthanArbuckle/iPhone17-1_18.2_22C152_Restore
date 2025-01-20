@interface FMFServerUserNotification
- (BOOL)dismissMsgOnLock;
- (BOOL)dismissMsgOnUnlock;
- (BOOL)playSound;
- (BOOL)showMessage;
- (BOOL)showMsgInLockScreen;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)msgText;
- (NSString)msgTitle;
- (double)timeout;
- (id)alternateButtonAction;
- (id)defaultButtonAction;
- (int64_t)alertLevel;
- (int64_t)category;
- (void)activate;
- (void)setAlertLevel:(int64_t)a3;
- (void)setAlternateButtonAction:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setCategory:(int64_t)a3;
- (void)setDefaultButtonAction:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDismissMsgOnLock:(BOOL)a3;
- (void)setDismissMsgOnUnlock:(BOOL)a3;
- (void)setMsgText:(id)a3;
- (void)setMsgTitle:(id)a3;
- (void)setPlaySound:(BOOL)a3;
- (void)setShowMessage:(BOOL)a3;
- (void)setShowMsgInLockScreen:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation FMFServerUserNotification

- (void)activate
{
  id v3 = +[FMFServerUserNotificationManager sharedInstance];
  [v3 activateNotification:self];
}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
}

- (BOOL)showMessage
{
  return self->_showMessage;
}

- (void)setShowMessage:(BOOL)a3
{
  self->_showMessage = a3;
}

- (BOOL)playSound
{
  return self->_playSound;
}

- (void)setPlaySound:(BOOL)a3
{
  self->_playSound = a3;
}

- (NSString)msgTitle
{
  return self->_msgTitle;
}

- (void)setMsgTitle:(id)a3
{
}

- (NSString)msgText
{
  return self->_msgText;
}

- (void)setMsgText:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (id)defaultButtonAction
{
  return self->_defaultButtonAction;
}

- (void)setDefaultButtonAction:(id)a3
{
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
}

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)showMsgInLockScreen
{
  return self->_showMsgInLockScreen;
}

- (void)setShowMsgInLockScreen:(BOOL)a3
{
  self->_showMsgInLockScreen = a3;
}

- (BOOL)dismissMsgOnUnlock
{
  return self->_dismissMsgOnUnlock;
}

- (void)setDismissMsgOnUnlock:(BOOL)a3
{
  self->_dismissMsgOnUnlock = a3;
}

- (BOOL)dismissMsgOnLock
{
  return self->_dismissMsgOnLock;
}

- (void)setDismissMsgOnLock:(BOOL)a3
{
  self->_dismissMsgOnLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_defaultButtonAction, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_msgText, 0);

  objc_storeStrong((id *)&self->_msgTitle, 0);
}

@end
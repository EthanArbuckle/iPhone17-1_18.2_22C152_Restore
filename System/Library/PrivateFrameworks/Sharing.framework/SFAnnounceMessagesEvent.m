@interface SFAnnounceMessagesEvent
+ (NSString)eventName;
+ (id)stringForExitView:(int64_t)a3;
- (BOOL)allowsSiriWhenLocked;
- (BOOL)announceMessagesAlreadyEnabled;
- (BOOL)skippedTutorialCards;
- (BOOL)userAutomaticallyEnrolled;
- (BOOL)userExplicitlyOptedIn;
- (BOOL)userExplicitlyOptedOut;
- (NSDictionary)eventPayload;
- (int64_t)pairingExitView;
- (void)setAllowsSiriWhenLocked:(BOOL)a3;
- (void)setAnnounceMessagesAlreadyEnabled:(BOOL)a3;
- (void)setPairingExitView:(int64_t)a3;
- (void)setSkippedTutorialCards:(BOOL)a3;
- (void)setUserAutomaticallyEnrolled:(BOOL)a3;
- (void)setUserExplicitlyOptedIn:(BOOL)a3;
- (void)setUserExplicitlyOptedOut:(BOOL)a3;
- (void)submitEvent;
@end

@implementation SFAnnounceMessagesEvent

+ (NSString)eventName
{
  return (NSString *)@"com.apple.Sharing.SiriAnnounceMessages";
}

+ (id)stringForExitView:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5BBE478[a3 - 1];
  }
}

- (NSDictionary)eventPayload
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"allowsSiriWhenLocked";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent allowsSiriWhenLocked](self, "allowsSiriWhenLocked"));
  v13[0] = v3;
  v12[1] = @"announceMessagesAlreadyEnabled";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent announceMessagesAlreadyEnabled](self, "announceMessagesAlreadyEnabled"));
  v13[1] = v4;
  v12[2] = @"pairingExitView";
  v5 = objc_msgSend((id)objc_opt_class(), "stringForExitView:", -[SFAnnounceMessagesEvent pairingExitView](self, "pairingExitView"));
  v13[2] = v5;
  v12[3] = @"skippedTutorialCards";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent skippedTutorialCards](self, "skippedTutorialCards"));
  v13[3] = v6;
  v12[4] = @"userAutomaticallyEnrolled";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent userAutomaticallyEnrolled](self, "userAutomaticallyEnrolled"));
  v13[4] = v7;
  v12[5] = @"userExplicitlyOptedIn";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent userExplicitlyOptedIn](self, "userExplicitlyOptedIn"));
  v13[5] = v8;
  v12[6] = @"userExplicitlyOptedOut";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[SFAnnounceMessagesEvent userExplicitlyOptedOut](self, "userExplicitlyOptedOut"));
  v13[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];

  return (NSDictionary *)v10;
}

- (void)submitEvent
{
  id v4 = +[SFAnnounceMessagesEvent eventName];
  v3 = [(SFAnnounceMessagesEvent *)self eventPayload];
  SFMetricsLog(v4, v3);
}

- (BOOL)allowsSiriWhenLocked
{
  return self->_allowsSiriWhenLocked;
}

- (void)setAllowsSiriWhenLocked:(BOOL)a3
{
  self->_allowsSiriWhenLocked = a3;
}

- (BOOL)announceMessagesAlreadyEnabled
{
  return self->_announceMessagesAlreadyEnabled;
}

- (void)setAnnounceMessagesAlreadyEnabled:(BOOL)a3
{
  self->_announceMessagesAlreadyEnabled = a3;
}

- (int64_t)pairingExitView
{
  return self->_pairingExitView;
}

- (void)setPairingExitView:(int64_t)a3
{
  self->_pairingExitView = a3;
}

- (BOOL)skippedTutorialCards
{
  return self->_skippedTutorialCards;
}

- (void)setSkippedTutorialCards:(BOOL)a3
{
  self->_skippedTutorialCards = a3;
}

- (BOOL)userAutomaticallyEnrolled
{
  return self->_userAutomaticallyEnrolled;
}

- (void)setUserAutomaticallyEnrolled:(BOOL)a3
{
  self->_userAutomaticallyEnrolled = a3;
}

- (BOOL)userExplicitlyOptedIn
{
  return self->_userExplicitlyOptedIn;
}

- (void)setUserExplicitlyOptedIn:(BOOL)a3
{
  self->_userExplicitlyOptedIn = a3;
}

- (BOOL)userExplicitlyOptedOut
{
  return self->_userExplicitlyOptedOut;
}

- (void)setUserExplicitlyOptedOut:(BOOL)a3
{
  self->_userExplicitlyOptedOut = a3;
}

@end
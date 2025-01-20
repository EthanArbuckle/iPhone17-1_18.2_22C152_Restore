@interface TUConversationInvitationPreference
+ (BOOL)supportsSecureCoding;
+ (NSSet)incomingCallAndNotificationInvitationPreferences;
+ (NSSet)incomingCallInvitationPreferences;
+ (NSSet)letMeInResponseInvitationPreferences;
+ (NSSet)noNotificationInvitationPreferences;
+ (NSSet)screenShareRequestInvitationPreferences;
+ (NSSet)standardInvitationPreferencesForLink;
+ (id)invitationPreferencesForAllHandlesWithStyles:(int64_t)a3;
+ (int64_t)validateNotificationStyles:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInvitationPreference:(id)a3;
- (TUConversationInvitationPreference)initWithCoder:(id)a3;
- (TUConversationInvitationPreference)initWithHandleType:(int64_t)a3 notificationStyles:(int64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)handleType;
- (int64_t)notificationStyles;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationInvitationPreference

- (TUConversationInvitationPreference)initWithHandleType:(int64_t)a3 notificationStyles:(int64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TUConversationInvitationPreference;
  v6 = [(TUConversationInvitationPreference *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_handleType = a3;
    v6->_notificationStyles = [(id)objc_opt_class() validateNotificationStyles:a4];
  }
  return v7;
}

+ (int64_t)validateNotificationStyles:(int64_t)a3
{
  int64_t v3 = a3 & 2;
  if ((a3 & 4) != 0) {
    int64_t v3 = a3 & 0xA | 4;
  }
  int64_t v4 = v3 | a3 & 0x10;
  if (a3) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)description
{
  int64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" handleType=%ld", -[TUConversationInvitationPreference handleType](self, "handleType"));
  objc_msgSend(v3, "appendFormat:", @" notificationStyles=%ld", -[TUConversationInvitationPreference notificationStyles](self, "notificationStyles"));
  if ([(TUConversationInvitationPreference *)self notificationStyles]) {
    int64_t v4 = @"YES";
  }
  else {
    int64_t v4 = @"NO";
  }
  [v3 appendFormat:@" notificationStyles.NoNotification=%@", v4];
  if (([(TUConversationInvitationPreference *)self notificationStyles] & 2) != 0) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  [v3 appendFormat:@" notificationStyles.UserNotification=%@", v5];
  if (([(TUConversationInvitationPreference *)self notificationStyles] & 4) != 0) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@" notificationStyles.IncomingCall=%@", v6];
  if (([(TUConversationInvitationPreference *)self notificationStyles] & 8) != 0) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@" notificationStyles.IndefiniteCall=%@", v7];
  if (([(TUConversationInvitationPreference *)self notificationStyles] & 0x10) != 0) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@" notificationStyles.ScreenShareRequest=%@", v8];
  [v3 appendString:@">"];
  objc_super v9 = (void *)[v3 copy];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationInvitationPreference *)self isEqualToInvitationPreference:v4];

  return v5;
}

- (BOOL)isEqualToInvitationPreference:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUConversationInvitationPreference *)self handleType];
  if (v5 == [v4 handleType])
  {
    int64_t v6 = [(TUConversationInvitationPreference *)self notificationStyles];
    BOOL v7 = v6 == [v4 notificationStyles];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t v3 = [(TUConversationInvitationPreference *)self handleType];
  return [(TUConversationInvitationPreference *)self notificationStyles] ^ v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t handleType = self->_handleType;
  int64_t notificationStyles = self->_notificationStyles;

  return (id)[v4 initWithHandleType:handleType notificationStyles:notificationStyles];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationInvitationPreference)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = NSStringFromSelector(sel_handleType);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  BOOL v7 = NSStringFromSelector(sel_notificationStyles);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];

  return [(TUConversationInvitationPreference *)self initWithHandleType:v6 notificationStyles:v8];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t handleType = self->_handleType;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_handleType);
  [v5 encodeInteger:handleType forKey:v6];

  int64_t notificationStyles = self->_notificationStyles;
  NSStringFromSelector(sel_notificationStyles);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:notificationStyles forKey:v8];
}

+ (id)invitationPreferencesForAllHandlesWithStyles:(int64_t)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v5 = [[TUConversationInvitationPreference alloc] initWithHandleType:2 notificationStyles:a3];
  uint64_t v6 = -[TUConversationInvitationPreference initWithHandleType:notificationStyles:]([TUConversationInvitationPreference alloc], "initWithHandleType:notificationStyles:", 3, a3, v5);
  v11[1] = v6;
  BOOL v7 = [[TUConversationInvitationPreference alloc] initWithHandleType:1 notificationStyles:a3];
  v11[2] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  objc_super v9 = (void *)[v4 initWithArray:v8];

  return v9;
}

+ (NSSet)standardInvitationPreferencesForLink
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:2];
}

+ (NSSet)letMeInResponseInvitationPreferences
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:1];
}

+ (NSSet)noNotificationInvitationPreferences
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:1];
}

+ (NSSet)incomingCallInvitationPreferences
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:4];
}

+ (NSSet)incomingCallAndNotificationInvitationPreferences
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:6];
}

+ (NSSet)screenShareRequestInvitationPreferences
{
  v2 = objc_opt_class();

  return (NSSet *)[v2 invitationPreferencesForAllHandlesWithStyles:16];
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (int64_t)notificationStyles
{
  return self->_notificationStyles;
}

@end
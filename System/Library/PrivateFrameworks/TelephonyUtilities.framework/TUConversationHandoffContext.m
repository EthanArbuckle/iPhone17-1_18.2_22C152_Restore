@interface TUConversationHandoffContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHandoffContext:(id)a3;
- (BOOL)prefersToPlayDuringWombat;
- (NSSet)invitationPreferences;
- (TUConversationHandoffContext)init;
- (TUConversationHandoffContext)initWithCoder:(id)a3;
- (TUConversationPresentationContext)presentationContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setInvitationPreferences:(id)a3;
- (void)setPrefersToPlayDuringWombat:(BOOL)a3;
- (void)setPresentationContext:(id)a3;
@end

@implementation TUConversationHandoffContext

- (TUConversationHandoffContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUConversationHandoffContext;
  v2 = [(TUConversationHandoffContext *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_prefersToPlayDuringWombat = 1;
    uint64_t v4 = +[TUConversationInvitationPreference noNotificationInvitationPreferences];
    invitationPreferences = v3->_invitationPreferences;
    v3->_invitationPreferences = (NSSet *)v4;

    presentationContext = v3->_presentationContext;
    v3->_presentationContext = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationHandoffContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TUConversationHandoffContext;
  v5 = [(TUConversationHandoffContext *)&v18 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_prefersToPlayDuringWombat);
    v5->_prefersToPlayDuringWombat = [v4 decodeBoolForKey:v6];

    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = NSStringFromSelector(sel_invitationPreferences);
    uint64_t v11 = [v4 decodeObjectOfClasses:v9 forKey:v10];
    invitationPreferences = v5->_invitationPreferences;
    v5->_invitationPreferences = (NSSet *)v11;

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector(sel_presentationContext);
    uint64_t v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    presentationContext = v5->_presentationContext;
    v5->_presentationContext = (TUConversationPresentationContext *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationHandoffContext *)self prefersToPlayDuringWombat];
  v6 = NSStringFromSelector(sel_prefersToPlayDuringWombat);
  [v4 encodeBool:v5 forKey:v6];

  v7 = [(TUConversationHandoffContext *)self invitationPreferences];
  uint64_t v8 = NSStringFromSelector(sel_invitationPreferences);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(TUConversationHandoffContext *)self presentationContext];
  v9 = NSStringFromSelector(sel_presentationContext);
  [v4 encodeObject:v10 forKey:v9];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setPrefersToPlayDuringWombat:", -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  BOOL v5 = [(TUConversationHandoffContext *)self invitationPreferences];
  [v4 setInvitationPreferences:v5];

  v6 = [(TUConversationHandoffContext *)self presentationContext];
  [v4 setPresentationContext:v6];

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" prefersToPlayDuringWombat=%d", -[TUConversationHandoffContext prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  id v4 = [(TUConversationHandoffContext *)self invitationPreferences];

  if (v4)
  {
    BOOL v5 = [(TUConversationHandoffContext *)self invitationPreferences];
    [v3 appendFormat:@" invitationPreferences=%@", v5];
  }
  v6 = [(TUConversationHandoffContext *)self presentationContext];

  if (v6)
  {
    v7 = [(TUConversationHandoffContext *)self presentationContext];
    [v3 appendFormat:@" presentationContext=%@", v7];
  }
  [v3 appendString:@">"];
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (unint64_t)hash
{
  if ([(TUConversationHandoffContext *)self prefersToPlayDuringWombat]) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  id v4 = [(TUConversationHandoffContext *)self invitationPreferences];
  uint64_t v5 = [v4 hash];
  v6 = [(TUConversationHandoffContext *)self presentationContext];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUConversationHandoffContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationHandoffContext *)self isEqualToHandoffContext:v4];
  }

  return v5;
}

- (BOOL)isEqualToHandoffContext:(id)a3
{
  id v4 = a3;
  int v5 = [(TUConversationHandoffContext *)self prefersToPlayDuringWombat];
  if (v5 == [v4 prefersToPlayDuringWombat])
  {
    unint64_t v7 = [(TUConversationHandoffContext *)self invitationPreferences];
    uint64_t v8 = [v4 invitationPreferences];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = [(TUConversationHandoffContext *)self presentationContext];
      id v10 = [v4 presentationContext];
      char v6 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (NSSet)invitationPreferences
{
  return self->_invitationPreferences;
}

- (void)setInvitationPreferences:(id)a3
{
}

- (TUConversationPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationContext, 0);

  objc_storeStrong((id *)&self->_invitationPreferences, 0);
}

@end
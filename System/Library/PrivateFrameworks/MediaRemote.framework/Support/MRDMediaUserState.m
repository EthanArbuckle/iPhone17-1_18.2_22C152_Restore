@interface MRDMediaUserState
+ (BOOL)groupSessionsSupportedForAccountRegion;
- (BOOL)groupSessionsSupportedForAccountRegion;
- (BOOL)hasAcceptedDisplayNameAcknowledgement;
- (BOOL)hasAcceptedPrivacyAcknowledgement;
- (BOOL)identitySupportsCollaboration;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserState:(id)a3;
- (BOOL)isFullSubscriber;
- (BOOL)isMinor;
- (ICMediaUserState)userState;
- (MRDMediaUserState)initWithUserState:(id)a3;
- (MRUserIdentity)userIdentity;
- (NSString)identifier;
- (NSString)storefrontCountryCode;
- (id)frameworkState;
- (id)userIdentityWithDisplayName:(id)a3;
- (unint64_t)hash;
- (void)setUserState:(id)a3;
@end

@implementation MRDMediaUserState

+ (BOOL)groupSessionsSupportedForAccountRegion
{
  return +[ICMusicUserState groupSessionCapableStatus] != 0;
}

- (MRDMediaUserState)initWithUserState:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MRDMediaUserState;
    v6 = [(MRDMediaUserState *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_userState, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)hasAcceptedPrivacyAcknowledgement
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 dsid];
  v4 = +[ICUserIdentity specificAccountWithDSID:v3];
  id v5 = +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:v4];
  char v6 = [v5 privacyAcknowledgementRequiredForMusic] ^ 1;

  return v6;
}

- (BOOL)hasAcceptedDisplayNameAcknowledgement
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 music];
  v4 = [v3 userProfile];
  unsigned __int8 v5 = [v4 displayNameAccepted];

  return v5;
}

- (BOOL)isMinor
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 music];
  v4 = [v3 subscriptionStatus];

  if (v4) {
    unsigned __int8 v5 = [v4 isMinorAccountHolder];
  }
  else {
    unsigned __int8 v5 = 1;
  }

  return v5;
}

- (BOOL)isFullSubscriber
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 music];
  v4 = [v3 subscriptionStatus];

  if (v4) {
    unsigned __int8 v5 = [v4 hasCapability:1];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)identitySupportsCollaboration
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 music];
  v4 = [v3 userProfile];

  if (v4) {
    unsigned __int8 v5 = [v4 collaborationAllowed];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)groupSessionsSupportedForAccountRegion
{
  v2 = objc_opt_class();

  return [v2 groupSessionsSupportedForAccountRegion];
}

- (NSString)storefrontCountryCode
{
  v2 = [(MRDMediaUserState *)self userState];
  v3 = [v2 countryCode];

  return (NSString *)v3;
}

- (id)userIdentityWithDisplayName:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003BDE8;
  block[3] = &unk_100415CC8;
  block[4] = self;
  uint64_t v3 = qword_10047DED8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10047DED8, block);
  }
  unsigned __int8 v5 = +[MRUserIdentity basicIdentityWithIdentifier:qword_10047DEE0 displayName:v4];

  return v5;
}

- (MRUserIdentity)userIdentity
{
  uint64_t v3 = [(MRDMediaUserState *)self userState];
  id v4 = [v3 music];
  unsigned __int8 v5 = [v4 userProfile];

  char v6 = [v5 socialProfile];
  v7 = [v6 socialProfileID];

  if (v7)
  {
    v8 = [v5 socialProfile];
    v9 = [v8 socialProfileID];
    objc_super v10 = [v5 socialProfile];
    v11 = [v10 name];
    v12 = +[MRUserIdentity resolvableIdentityWithIdentifier:v9 displayName:v11];

LABEL_5:
    goto LABEL_6;
  }
  v13 = [v5 name];

  if (v13)
  {
    v8 = [v5 name];
    v12 = [(MRDMediaUserState *)self userIdentityWithDisplayName:v8];
    goto LABEL_5;
  }
  v15 = _MRLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10032B1E8(self, v15);
  }

  v12 = 0;
LABEL_6:

  return (MRUserIdentity *)v12;
}

- (unint64_t)hash
{
  v2 = [(MRDMediaUserState *)self userState];
  uint64_t v3 = [v2 identifier];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRDMediaUserState *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(MRDMediaUserState *)self isEqualToUserState:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToUserState:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(MRDMediaUserState *)self userState];
  char v6 = [v4 userState];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (ICMediaUserState)userState
{
  return self->_userState;
}

- (void)setUserState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userState, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)frameworkState
{
  id v3 = objc_alloc_init((Class)MRMediaUserState);
  id v4 = [(MRDMediaUserState *)self identifier];
  [v3 setIdentifier:v4];

  objc_msgSend(v3, "setIsMinor:", -[MRDMediaUserState isMinor](self, "isMinor"));
  objc_msgSend(v3, "setIsFullSubscriber:", -[MRDMediaUserState isFullSubscriber](self, "isFullSubscriber"));
  objc_msgSend(v3, "setHasAcceptedPrivacyAcknowledgement:", -[MRDMediaUserState hasAcceptedPrivacyAcknowledgement](self, "hasAcceptedPrivacyAcknowledgement"));
  objc_msgSend(v3, "setHasAcceptedDisplayNameAcknowledgement:", -[MRDMediaUserState hasAcceptedDisplayNameAcknowledgement](self, "hasAcceptedDisplayNameAcknowledgement"));
  objc_msgSend(v3, "setIdentitySupportsCollaboration:", -[MRDMediaUserState identitySupportsCollaboration](self, "identitySupportsCollaboration"));
  objc_msgSend(v3, "setGroupSessionsSupportedForAccountRegion:", -[MRDMediaUserState groupSessionsSupportedForAccountRegion](self, "groupSessionsSupportedForAccountRegion"));
  BOOL v5 = [(MRDMediaUserState *)self storefrontCountryCode];
  [v3 setStorefrontCountryCode:v5];

  char v6 = [(MRDMediaUserState *)self userIdentity];
  [v3 setUserIdentity:v6];

  return v3;
}

@end
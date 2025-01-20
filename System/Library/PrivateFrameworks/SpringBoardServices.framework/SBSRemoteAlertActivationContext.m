@interface SBSRemoteAlertActivationContext
+ (BOOL)supportsSecureCoding;
+ (id)activationContextWithLegacyAlertOptions:(id)a3;
- (BOOL)isActivatingForSiri;
- (BOOL)isSwitcherEligible;
- (BOOL)shouldDismissPresentedBanners;
- (BOOL)shouldInvalidateWhenDeactivated;
- (BOOL)shouldStashPictureInPictureIfNeeded;
- (NSDictionary)legacyAlertOptions;
- (NSDictionary)userInfo;
- (NSSet)actions;
- (NSString)description;
- (NSString)reason;
- (NSUUID)activityContinuationIdentifier;
- (SBSRemoteAlertActivationContext)init;
- (SBSRemoteAlertActivationContext)initWithActions:(id)a3;
- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4;
- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4 userInfo:(id)a5;
- (SBSRemoteAlertActivationContext)initWithCoder:(id)a3;
- (SBSRemoteAlertActivationContext)initWithXPCDictionary:(id)a3;
- (SBSRemoteAlertPresentationTarget)presentationTarget;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)presentationMode;
- (unint64_t)initialSupportedInterfaceOrientations;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setActions:(id)a3;
- (void)setActivatingForSiri:(BOOL)a3;
- (void)setActivityContinuationIdentifier:(id)a3;
- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setLegacyAlertOptions:(id)a3;
- (void)setPresentationMode:(int64_t)a3;
- (void)setPresentationTarget:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldDismissPresentedBanners:(BOOL)a3;
- (void)setShouldInvalidateWhenDeactivated:(BOOL)a3;
- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3;
- (void)setSwitcherEligible:(BOOL)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation SBSRemoteAlertActivationContext

- (SBSRemoteAlertActivationContext)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v4 = [(SBSRemoteAlertActivationContext *)self initWithActions:v3];

  return v4;
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3
{
  return [(SBSRemoteAlertActivationContext *)self initWithActions:a3 presentationTarget:0];
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4
{
  return [(SBSRemoteAlertActivationContext *)self initWithActions:a3 presentationTarget:a4 userInfo:0];
}

- (SBSRemoteAlertActivationContext)initWithActions:(id)a3 presentationTarget:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSRemoteAlertActivationContext;
  v11 = [(SBSRemoteAlertActivationContext *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    actions = v11->_actions;
    v11->_actions = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_presentationTarget, a4);
    uint64_t v14 = [v10 copy];
    userInfo = v11->_userInfo;
    v11->_userInfo = (NSDictionary *)v14;

    v11->_presentationMode = 0;
  }

  return v11;
}

+ (id)activationContextWithLegacyAlertOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setLegacyAlertOptions:v4];

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBSRemoteAlertActivationContext *)self descriptionWithMultilinePrefix:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[[objc_opt_class() allocWithZone:a3] initWithActions:self->_actions presentationTarget:self->_presentationTarget userInfo:self->_userInfo] autorelease];
  id v5 = v4;
  if (v4)
  {
    [v4 setReason:self->_reason];
    [v5 setActivatingForSiri:self->_activatingForSiri];
    [v5 setShouldDismissPresentedBanners:self->_shouldDismissPresentedBanners];
    [v5 setShouldStashPictureInPictureIfNeeded:self->_shouldStashPictureInPictureIfNeeded];
    [v5 setActivityContinuationIdentifier:self->_activityContinuationIdentifier];
    [v5 setPresentationMode:self->_presentationMode];
    [v5 setInitialSupportedInterfaceOrientations:self->_initialSupportedInterfaceOrientations];
  }
  return v5;
}

- (SBSRemoteAlertActivationContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  v6 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v7 = BSDeserializeCFValueFromXPCDictionaryWithKey();
  id v8 = [(SBSRemoteAlertActivationContext *)self initWithActions:v5 presentationTarget:v6 userInfo:v7];
  if (v8)
  {
    uint64_t v9 = BSDeserializeCFValueFromXPCDictionaryWithKey();
    legacyAlertOptions = v8->_legacyAlertOptions;
    v8->_legacyAlertOptions = (NSDictionary *)v9;

    uint64_t v11 = BSDeserializeStringFromXPCDictionaryWithKey();
    reason = v8->_reason;
    v8->_reason = (NSString *)v11;

    v8->_activatingForSiri = xpc_dictionary_get_BOOL(v4, "activatingForSiri");
    objc_opt_class();
    uint64_t v13 = BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
    activityContinuationIdentifier = v8->_activityContinuationIdentifier;
    v8->_activityContinuationIdentifier = (NSUUID *)v13;

    v8->_switcherEligible = xpc_dictionary_get_BOOL(v4, "switcherEligible");
    v8->_shouldInvalidateWhenDeactivated = xpc_dictionary_get_BOOL(v4, "shouldInvalidateWhenDeactivated");
    v8->_shouldDismissPresentedBanners = xpc_dictionary_get_BOOL(v4, "shouldDismissPresentedBanners");
    v8->_shouldStashPictureInPictureIfNeeded = xpc_dictionary_get_BOOL(v4, "shouldStashPictureInPictureIfNeeded");
    v8->_presentationMode = xpc_dictionary_get_int64(v4, "presentationMode");
    v8->_initialSupportedInterfaceOrientations = xpc_dictionary_get_int64(v4, "initialSupportedInterfaceOrientations");
  }

  return v8;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (self->_reason) {
    BSSerializeStringToXPCDictionaryWithKey();
  }
  if (self->_legacyAlertOptions) {
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
  if (self->_activityContinuationIdentifier) {
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  if ([(NSSet *)self->_actions count]) {
    BSSerializeSetToXPCDictionaryWithKey();
  }
  if (self->_presentationTarget) {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  id v4 = xdict;
  if (self->_userInfo)
  {
    BSSerializeCFValueToXPCDictionaryWithKey();
    id v4 = xdict;
  }
  xpc_dictionary_set_BOOL(v4, "activatingForSiri", self->_activatingForSiri);
  xpc_dictionary_set_BOOL(xdict, "switcherEligible", self->_switcherEligible);
  xpc_dictionary_set_BOOL(xdict, "shouldInvalidateWhenDeactivated", self->_shouldInvalidateWhenDeactivated);
  xpc_dictionary_set_BOOL(xdict, "shouldDismissPresentedBanners", self->_shouldDismissPresentedBanners);
  xpc_dictionary_set_BOOL(xdict, "shouldStashPictureInPictureIfNeeded", self->_shouldStashPictureInPictureIfNeeded);
  xpc_dictionary_set_int64(xdict, "presentationMode", self->_presentationMode);
  xpc_dictionary_set_int64(xdict, "initialSupportedInterfaceOrientations", self->_initialSupportedInterfaceOrientations);
}

id __59__SBSRemoteAlertActivationContext_encodeWithXPCDictionary___block_invoke()
{
  v0 = (void *)BSCreateSerializedBSXPCEncodableObject();
  return v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertActivationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  v7 = [v5 setWithObjects:v6, nil];
  id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"actions"];

  uint64_t v9 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"presentationTarget"];

  if (v8) {
    [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  }
  else {
  uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
  }
  uint64_t v12 = [(SBSRemoteAlertActivationContext *)self initWithActions:v11 presentationTarget:v10];

  if (v12)
  {
    uint64_t v13 = [v4 decodePropertyListForKey:@"legacyOptions"];
    if ([v13 isNSDictionary]) {
      objc_storeStrong((id *)&v12->_legacyAlertOptions, v13);
    }
    uint64_t v14 = [v4 decodePropertyListForKey:@"userInfo"];
    if ([v14 isNSDictionary]) {
      objc_storeStrong((id *)&v12->_userInfo, v14);
    }
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    v12->_activatingForSiri = [v4 decodeBoolForKey:@"activatingForSiri"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityContinuationIdentifier"];
    activityContinuationIdentifier = v12->_activityContinuationIdentifier;
    v12->_activityContinuationIdentifier = (NSUUID *)v17;

    v12->_switcherEligible = [v4 decodeBoolForKey:@"switcherEligible"];
    v12->_shouldInvalidateWhenDeactivated = [v4 decodeBoolForKey:@"shouldInvalidateWhenDeactivated"];
    v12->_shouldDismissPresentedBanners = [v4 decodeBoolForKey:@"shouldDismissPresentedBanners"];
    v12->_shouldStashPictureInPictureIfNeeded = [v4 decodeBoolForKey:@"shouldStashPictureInPictureIfNeeded"];
    v12->_presentationMode = [v4 decodeIntegerForKey:@"presentationMode"];
    v12->_initialSupportedInterfaceOrientations = [v4 decodeIntegerForKey:@"initialSupportedInterfaceOrientations"];
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  actions = self->_actions;
  if (actions)
  {
    id v5 = [(NSSet *)actions allObjects];
    [v12 encodeObject:v5 forKey:@"actions"];
  }
  activityContinuationIdentifier = self->_activityContinuationIdentifier;
  if (activityContinuationIdentifier) {
    [v12 encodeObject:activityContinuationIdentifier forKey:@"activityContinuationIdentifier"];
  }
  legacyAlertOptions = self->_legacyAlertOptions;
  id v8 = v12;
  if (legacyAlertOptions)
  {
    [v12 encodeObject:legacyAlertOptions forKey:@"legacyOptions"];
    id v8 = v12;
  }
  reason = self->_reason;
  if (reason)
  {
    [v12 encodeObject:reason forKey:@"reason"];
    id v8 = v12;
  }
  presentationTarget = self->_presentationTarget;
  if (presentationTarget)
  {
    [v12 encodeObject:presentationTarget forKey:@"presentationTarget"];
    id v8 = v12;
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    [v12 encodeObject:userInfo forKey:@"userInfo"];
    id v8 = v12;
  }
  [v8 encodeBool:self->_activatingForSiri forKey:@"activatingForSiri"];
  [v12 encodeBool:self->_switcherEligible forKey:@"switcherEligible"];
  [v12 encodeBool:self->_shouldInvalidateWhenDeactivated forKey:@"shouldInvalidateWhenDeactivated"];
  [v12 encodeBool:self->_shouldDismissPresentedBanners forKey:@"shouldDismissPresentedBanners"];
  [v12 encodeBool:self->_shouldStashPictureInPictureIfNeeded forKey:@"shouldStashPictureInPictureIfNeeded"];
  [v12 encodeInteger:self->_presentationMode forKey:@"presentationMode"];
  [v12 encodeInteger:self->_initialSupportedInterfaceOrientations forKey:@"initialSupportedInterfaceOrientations"];
}

- (id)succinctDescription
{
  v2 = [(SBSRemoteAlertActivationContext *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSRemoteAlertActivationContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSRemoteAlertActivationContext *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_reason withName:@"reason"];
  id v6 = (id)[v4 appendObject:self->_actions withName:@"actions"];
  id v7 = (id)[v4 appendObject:self->_activityContinuationIdentifier withName:@"activityContinuationIdentifier" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_legacyAlertOptions withName:@"legacyAlertOptions" skipIfNil:1];
  uint64_t v9 = [(SBSRemoteAlertPresentationTarget *)self->_presentationTarget description];
  id v10 = (id)[v4 appendObject:v9 withName:@"presentationTarget"];

  id v11 = (id)[v4 appendBool:self->_activatingForSiri withName:@"activatingForSiri"];
  id v12 = (id)[v4 appendBool:self->_shouldInvalidateWhenDeactivated withName:@"shouldInvalidateWhenDeactivated"];
  id v13 = (id)[v4 appendBool:self->_shouldDismissPresentedBanners withName:@"shouldDismissPresentedBanners" ifEqualTo:1];
  id v14 = (id)[v4 appendBool:self->_shouldStashPictureInPictureIfNeeded withName:@"shouldStashPictureInPictureIfNeeded" ifEqualTo:1];
  id v15 = (id)[v4 appendInteger:self->_presentationMode withName:@"presentationMode"];
  if (self->_initialSupportedInterfaceOrientations)
  {
    v16 = BSInterfaceOrientationMaskDescription();
    id v17 = (id)[v4 appendObject:v16 withName:@"initialSupportedInterfaceOrientations"];
  }
  v18 = [(NSDictionary *)self->_userInfo description];
  id v19 = (id)[v4 appendObject:v18 withName:0];

  return v4;
}

- (void)setLegacyAlertOptions:(id)a3
{
  id v4 = (NSDictionary *)a3;
  legacyAlertOptions = self->_legacyAlertOptions;
  if (legacyAlertOptions != v4)
  {
    id v13 = v4;
    if (![(NSDictionary *)legacyAlertOptions isEqualToDictionary:v4])
    {
      id v6 = (NSDictionary *)[(NSDictionary *)v13 copy];
      id v7 = self->_legacyAlertOptions;
      self->_legacyAlertOptions = v6;

      if (self->_legacyAlertOptions)
      {
        id v8 = [(SBSRemoteAlertActivationContext *)self reason];

        if (!v8)
        {
          uint64_t v9 = [(NSDictionary *)self->_legacyAlertOptions bs_safeStringForKey:@"CustomActivationReason"];
          [(SBSRemoteAlertActivationContext *)self setReason:v9];
        }
        id v10 = [(SBSRemoteAlertActivationContext *)self activityContinuationIdentifier];

        if (!v10)
        {
          id v11 = [(NSDictionary *)self->_legacyAlertOptions bs_safeStringForKey:@"ActivityContinuationIdentifier"];
          if (v11)
          {
            id v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
            if (v12) {
              [(SBSRemoteAlertActivationContext *)self setActivityContinuationIdentifier:v12];
            }
          }
        }
        [(SBSRemoteAlertActivationContext *)self setActivatingForSiri:[(NSDictionary *)self->_legacyAlertOptions bs_BOOLForKey:@"ActivateForAssistant"]];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)isActivatingForSiri
{
  return self->_activatingForSiri;
}

- (void)setActivatingForSiri:(BOOL)a3
{
  self->_activatingForSiri = a3;
}

- (BOOL)shouldDismissPresentedBanners
{
  return self->_shouldDismissPresentedBanners;
}

- (void)setShouldDismissPresentedBanners:(BOOL)a3
{
  self->_shouldDismissPresentedBanners = a3;
}

- (BOOL)shouldStashPictureInPictureIfNeeded
{
  return self->_shouldStashPictureInPictureIfNeeded;
}

- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3
{
  self->_shouldStashPictureInPictureIfNeeded = a3;
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSUUID)activityContinuationIdentifier
{
  return self->_activityContinuationIdentifier;
}

- (void)setActivityContinuationIdentifier:(id)a3
{
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
}

- (NSDictionary)legacyAlertOptions
{
  return self->_legacyAlertOptions;
}

- (BOOL)shouldInvalidateWhenDeactivated
{
  return self->_shouldInvalidateWhenDeactivated;
}

- (void)setShouldInvalidateWhenDeactivated:(BOOL)a3
{
  self->_shouldInvalidateWhenDeactivated = a3;
}

- (BOOL)isSwitcherEligible
{
  return self->_switcherEligible;
}

- (void)setSwitcherEligible:(BOOL)a3
{
  self->_switcherEligible = a3;
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyAlertOptions, 0);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_activityContinuationIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
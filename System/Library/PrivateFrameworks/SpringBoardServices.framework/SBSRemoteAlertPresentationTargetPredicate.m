@interface SBSRemoteAlertPresentationTargetPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateForLaunchingApplicationIdentity:(id)a3;
+ (id)predicateForProcess:(id)a3;
- (BSProcessHandle)process;
- (LSApplicationIdentity)launchingApplicationIdentity;
- (NSString)description;
- (NSString)scenePersistentIdentifier;
- (SBSRemoteAlertPresentationTargetPredicate)initWithCoder:(id)a3;
- (SBSRemoteAlertPresentationTargetPredicate)initWithXPCDictionary:(id)a3;
- (id)_init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setLaunchingApplicationIdentity:(id)a3;
- (void)setProcess:(id)a3;
- (void)setScenePersistentIdentifier:(id)a3;
@end

@implementation SBSRemoteAlertPresentationTargetPredicate

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBSRemoteAlertPresentationTargetPredicate;
  return [(SBSRemoteAlertPresentationTargetPredicate *)&v3 init];
}

+ (id)predicateForProcess:(id)a3
{
  id v3 = a3;
  id v4 = [[SBSRemoteAlertPresentationTargetPredicate alloc] _init];
  [v4 setProcess:v3];

  return v4;
}

+ (id)predicateForLaunchingApplicationIdentity:(id)a3
{
  id v3 = a3;
  id v4 = [[SBSRemoteAlertPresentationTargetPredicate alloc] _init];
  [v4 setLaunchingApplicationIdentity:v3];

  return v4;
}

- (SBSRemoteAlertPresentationTargetPredicate)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  objc_opt_class();
  uint64_t v6 = BSCreateDeserializedNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey();
  v7 = (void *)v6;
  if (v5)
  {
    uint64_t v8 = +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:v5];
  }
  else
  {
    if (!v6)
    {
      v9 = 0;
      goto LABEL_8;
    }
    uint64_t v8 = +[SBSRemoteAlertPresentationTargetPredicate predicateForLaunchingApplicationIdentity:v6];
  }
  v9 = (SBSRemoteAlertPresentationTargetPredicate *)v8;
  if (v8)
  {
    v10 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
    [(SBSRemoteAlertPresentationTargetPredicate *)v9 setScenePersistentIdentifier:v10];
  }
LABEL_8:

  return v9;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  if (self->_process)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  }
  else if (self->_launchingApplicationIdentity)
  {
    BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey();
  }
  BSSerializeStringToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SBSRemoteAlertPresentationTargetPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v10, v11);
[v8 raise:v9 format:@"An %@ can only be decoded with an instance of NSXPCCoder; attempting to decode with %@",
v10, v11];
      v5,
      v12);
    v13 = 0;
LABEL_9:

    goto LABEL_10;
  }
  id v5 = v4;
  if ([v5 containsValueForKey:@"process"])
  {
    uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"process"];
    uint64_t v7 = +[SBSRemoteAlertPresentationTargetPredicate predicateForProcess:v6];
  }
  else
  {
    if (![v5 containsValueForKey:@"launchingIdentity"])
    {
      v13 = 0;
      goto LABEL_10;
    }
    uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"launchingIdentity"];
    uint64_t v7 = +[SBSRemoteAlertPresentationTargetPredicate predicateForLaunchingApplicationIdentity:v6];
  }
  v13 = (SBSRemoteAlertPresentationTargetPredicate *)v7;

  if (v13)
  {
    v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"scenePersistentIdentifier"];
    [(SBSRemoteAlertPresentationTargetPredicate *)v13 setScenePersistentIdentifier:v12];
    goto LABEL_9;
  }
LABEL_10:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v12;
    id v5 = v4;
    if (self->_process || self->_launchingApplicationIdentity) {
      [v4 encodeObject:forKey:];
    }
    scenePersistentIdentifier = self->_scenePersistentIdentifier;
    if (scenePersistentIdentifier) {
      [v5 encodeObject:scenePersistentIdentifier forKey:@"scenePersistentIdentifier"];
    }
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v8);
    uint64_t v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v8, [v6 class], [v9 class]);
[v9 encodeWithCoder:v10];
      v5,
      v10);
  }
}

- (NSString)description
{
  return (NSString *)[(SBSRemoteAlertPresentationTargetPredicate *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSRemoteAlertPresentationTargetPredicate *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSRemoteAlertPresentationTargetPredicate *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSRemoteAlertPresentationTargetPredicate *)self succinctDescriptionBuilder];
  id v5 = [(BSProcessHandle *)self->_process description];
  id v6 = (id)[v4 appendObject:v5 withName:@"process" skipIfNil:1];

  id v7 = (id)[v4 appendObject:self->_launchingApplicationIdentity withName:@"launchingApplicationIdentity" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_scenePersistentIdentifier withName:@"scenePersistentIdentifier" skipIfNil:1];
  return v4;
}

- (NSString)scenePersistentIdentifier
{
  return self->_scenePersistentIdentifier;
}

- (void)setScenePersistentIdentifier:(id)a3
{
}

- (BSProcessHandle)process
{
  return self->_process;
}

- (void)setProcess:(id)a3
{
}

- (LSApplicationIdentity)launchingApplicationIdentity
{
  return self->_launchingApplicationIdentity;
}

- (void)setLaunchingApplicationIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchingApplicationIdentity, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifier, 0);
}

@end
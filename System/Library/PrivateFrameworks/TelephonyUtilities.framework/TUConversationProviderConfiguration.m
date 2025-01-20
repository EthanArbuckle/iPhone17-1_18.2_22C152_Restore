@interface TUConversationProviderConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationProvider:(id)a3;
- (BOOL)supportsConversationHandoff;
- (BOOL)supportsLinks;
- (BOOL)supportsSharePlay;
- (BOOL)supportsVideo;
- (BOOL)wantsLeaveOnInvalidation;
- (NSSet)supportedMediaTypes;
- (NSString)bundleID;
- (NSString)pseudonymFeatureID;
- (NSString)serviceName;
- (TUConversationProviderConfiguration)initWithCoder:(id)a3;
- (TUConversationProviderConfiguration)initWithConfiguration:(id)a3;
- (TUConversationProviderConfiguration)initWithServiceName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setPseudonymFeatureID:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setSupportedMediaTypes:(id)a3;
- (void)setSupportsConversationHandoff:(BOOL)a3;
- (void)setSupportsLinks:(BOOL)a3;
- (void)setSupportsSharePlay:(BOOL)a3;
- (void)setWantsLeaveOnInvalidation:(BOOL)a3;
@end

@implementation TUConversationProviderConfiguration

- (TUConversationProviderConfiguration)initWithServiceName:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUConversationProviderConfiguration;
  v5 = [(TUConversationProviderConfiguration *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v6;

    *(_WORD *)&v5->_supportsLinks = 0;
    v5->_supportsConversationHandoff = 0;
    BOOL v8 = +[TUConversationManager allowsVideo];
    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    if (v8) {
      uint64_t v10 = objc_msgSend(v9, "initWithObjects:", &unk_1EED24540, &unk_1EED24558, 0);
    }
    else {
      uint64_t v10 = objc_msgSend(v9, "initWithObjects:", &unk_1EED24558, 0, v13);
    }
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSSet *)v10;
  }
  return v5;
}

- (TUConversationProviderConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationProviderConfiguration;
  v5 = [(TUConversationProviderConfiguration *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_serviceName, *((id *)v4 + 2));
    objc_storeStrong((id *)&v6->_pseudonymFeatureID, *((id *)v4 + 3));
    objc_storeStrong((id *)&v6->_bundleID, *((id *)v4 + 4));
    objc_storeStrong((id *)&v6->_supportedMediaTypes, *((id *)v4 + 5));
    v6->_supportsLinks = *((unsigned char *)v4 + 8);
    v6->_supportsSharePlay = *((unsigned char *)v4 + 9);
    v6->_supportsConversationHandoff = *((unsigned char *)v4 + 10);
    v6->_wantsLeaveOnInvalidation = *((unsigned char *)v4 + 11);
  }

  return v6;
}

- (BOOL)supportsVideo
{
  v2 = [(TUConversationProviderConfiguration *)self supportedMediaTypes];
  char v3 = [v2 containsObject:&unk_1EED24540];

  return v3;
}

- (void)setSupportedMediaTypes:(id)a3
{
  id v7 = a3;
  id v4 = v7;
  if (!+[TUConversationManager allowsVideo])
  {
    id v4 = [v7 objectsPassingTest:&__block_literal_global_46];
  }
  if ([v4 count] && !-[NSSet isEqualToSet:](self->_supportedMediaTypes, "isEqualToSet:", v4))
  {
    v5 = (NSSet *)[v4 copy];
    supportedMediaTypes = self->_supportedMediaTypes;
    self->_supportedMediaTypes = v5;
  }
}

BOOL __62__TUConversationProviderConfiguration_setSupportedMediaTypes___block_invoke(uint64_t a1, void *a2)
{
  return [a2 integerValue] != 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithConfiguration:self];
}

- (id)description
{
  char v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(TUConversationProviderConfiguration *)self bundleID];

  if (v4)
  {
    v5 = [(TUConversationProviderConfiguration *)self bundleID];
    [v3 appendFormat:@" bundleID=%@", v5];
  }
  uint64_t v6 = [(TUConversationProviderConfiguration *)self serviceName];

  if (v6)
  {
    id v7 = [(TUConversationProviderConfiguration *)self serviceName];
    [v3 appendFormat:@" serviceName=%@", v7];
  }
  objc_super v8 = [(TUConversationProviderConfiguration *)self pseudonymFeatureID];

  if (v8)
  {
    id v9 = [(TUConversationProviderConfiguration *)self pseudonymFeatureID];
    [v3 appendFormat:@" pseudonymFeatureID=%@", v9];
  }
  uint64_t v10 = [(TUConversationProviderConfiguration *)self supportedMediaTypes];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    v12 = [(TUConversationProviderConfiguration *)self supportedMediaTypes];
    uint64_t v13 = [v12 allObjects];
    objc_super v14 = [v13 componentsJoinedByString:@", "];
    [v3 appendFormat:@" supportedMediaTypes=%@", v14];
  }
  if ([(TUConversationProviderConfiguration *)self supportsConversationHandoff]) {
    objc_msgSend(v3, "appendFormat:", @" supportsConversationHandoff=%d", -[TUConversationProviderConfiguration supportsConversationHandoff](self, "supportsConversationHandoff"));
  }
  if ([(TUConversationProviderConfiguration *)self supportsLinks]) {
    objc_msgSend(v3, "appendFormat:", @" supportsLinks=%d", -[TUConversationProviderConfiguration supportsLinks](self, "supportsLinks"));
  }
  if ([(TUConversationProviderConfiguration *)self supportsSharePlay]) {
    objc_msgSend(v3, "appendFormat:", @" supportsSharePlay=%d", -[TUConversationProviderConfiguration supportsSharePlay](self, "supportsSharePlay"));
  }
  if ([(TUConversationProviderConfiguration *)self wantsLeaveOnInvalidation]) {
    objc_msgSend(v3, "appendFormat:", @" wantsLeaveOnInvalidation=%d", -[TUConversationProviderConfiguration wantsLeaveOnInvalidation](self, "wantsLeaveOnInvalidation"));
  }
  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUConversationProviderConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationProviderConfiguration *)self isEqualToConversationProvider:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  char v3 = [(TUConversationProviderConfiguration *)self serviceName];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationProviderConfiguration *)self bundleID];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(TUConversationProviderConfiguration *)self pseudonymFeatureID];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqualToConversationProvider:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationProviderConfiguration *)self serviceName];
  uint64_t v6 = [v4 serviceName];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(TUConversationProviderConfiguration *)self pseudonymFeatureID];
    unint64_t v8 = [v4 pseudonymFeatureID];
    if (!TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      LOBYTE(v15) = 0;
LABEL_15:

      goto LABEL_16;
    }
    id v9 = [(TUConversationProviderConfiguration *)self bundleID];
    uint64_t v10 = [v4 bundleID];
    if (!TUStringsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
    {
      LOBYTE(v15) = 0;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v11 = [(TUConversationProviderConfiguration *)self supportedMediaTypes];
    v12 = [v4 supportedMediaTypes];
    if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
    {
      v20 = v11;
      int v13 = [(TUConversationProviderConfiguration *)self supportsLinks];
      if (v13 != [v4 supportsLinks]
        || (int v14 = [(TUConversationProviderConfiguration *)self supportsSharePlay],
            v14 != [v4 supportsSharePlay]))
      {
        LOBYTE(v15) = 0;
        uint64_t v11 = v20;
LABEL_13:

        goto LABEL_14;
      }
      int v16 = [(TUConversationProviderConfiguration *)self supportsConversationHandoff];
      BOOL v17 = v16 == [v4 supportsConversationHandoff];
      uint64_t v11 = v20;
      if (v17)
      {
        BOOL v19 = [(TUConversationProviderConfiguration *)self wantsLeaveOnInvalidation];
        int v15 = v19 ^ [v4 wantsLeaveOnInvalidation] ^ 1;
        goto LABEL_13;
      }
    }
    LOBYTE(v15) = 0;
    goto LABEL_13;
  }
  LOBYTE(v15) = 0;
LABEL_16:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationProviderConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationProviderConfiguration *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_serviceName);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(sel_bundleID);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    int v15 = NSStringFromSelector(sel_pseudonymFeatureID);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    pseudonymFeatureID = v5->_pseudonymFeatureID;
    v5->_pseudonymFeatureID = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v21 = NSStringFromSelector(sel_supportedMediaTypes);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSSet *)v22;

    v24 = NSStringFromSelector(sel_supportsLinks);
    v5->_supportsLinks = [v4 decodeBoolForKey:v24];

    v25 = NSStringFromSelector(sel_supportsSharePlay);
    v5->_supportsSharePlay = [v4 decodeBoolForKey:v25];

    v26 = NSStringFromSelector(sel_supportsConversationHandoff);
    v5->_supportsConversationHandoff = [v4 decodeBoolForKey:v26];

    v27 = NSStringFromSelector(sel_wantsLeaveOnInvalidation);
    v5->_wantsLeaveOnInvalidation = [v4 decodeBoolForKey:v27];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationProviderConfiguration *)self serviceName];
  uint64_t v6 = NSStringFromSelector(sel_serviceName);
  [v4 encodeObject:v5 forKey:v6];

  id v7 = [(TUConversationProviderConfiguration *)self bundleID];
  uint64_t v8 = NSStringFromSelector(sel_bundleID);
  [v4 encodeObject:v7 forKey:v8];

  id v9 = [(TUConversationProviderConfiguration *)self pseudonymFeatureID];
  uint64_t v10 = NSStringFromSelector(sel_pseudonymFeatureID);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(TUConversationProviderConfiguration *)self supportedMediaTypes];
  uint64_t v12 = NSStringFromSelector(sel_supportedMediaTypes);
  [v4 encodeObject:v11 forKey:v12];

  BOOL v13 = [(TUConversationProviderConfiguration *)self supportsLinks];
  uint64_t v14 = NSStringFromSelector(sel_supportsLinks);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(TUConversationProviderConfiguration *)self supportsSharePlay];
  uint64_t v16 = NSStringFromSelector(sel_supportsSharePlay);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUConversationProviderConfiguration *)self supportsConversationHandoff];
  v18 = NSStringFromSelector(sel_supportsConversationHandoff);
  [v4 encodeBool:v17 forKey:v18];

  BOOL v19 = [(TUConversationProviderConfiguration *)self wantsLeaveOnInvalidation];
  NSStringFromSelector(sel_wantsLeaveOnInvalidation);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v19 forKey:v20];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (BOOL)supportsLinks
{
  return self->_supportsLinks;
}

- (void)setSupportsLinks:(BOOL)a3
{
  self->_supportsLinks = a3;
}

- (BOOL)supportsSharePlay
{
  return self->_supportsSharePlay;
}

- (void)setSupportsSharePlay:(BOOL)a3
{
  self->_supportsSharePlay = a3;
}

- (BOOL)supportsConversationHandoff
{
  return self->_supportsConversationHandoff;
}

- (void)setSupportsConversationHandoff:(BOOL)a3
{
  self->_supportsConversationHandoff = a3;
}

- (BOOL)wantsLeaveOnInvalidation
{
  return self->_wantsLeaveOnInvalidation;
}

- (void)setWantsLeaveOnInvalidation:(BOOL)a3
{
  self->_wantsLeaveOnInvalidation = a3;
}

- (NSString)pseudonymFeatureID
{
  return self->_pseudonymFeatureID;
}

- (void)setPseudonymFeatureID:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSSet)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_pseudonymFeatureID, 0);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
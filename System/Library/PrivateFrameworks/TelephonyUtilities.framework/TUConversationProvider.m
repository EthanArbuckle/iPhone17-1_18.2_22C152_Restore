@interface TUConversationProvider
+ (BOOL)matchesDefaultProviderIdentifier:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (TUConversationProvider)expanseProvider;
+ (TUConversationProvider)faceTimeProvider;
+ (TUConversationProvider)unknownProvider;
+ (id)providerForIdentifier:(id)a3;
- (BOOL)isDefaultProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationProvider:(id)a3;
- (BOOL)supportsAVMode:(unint64_t)a3;
- (BOOL)supportsLinks;
- (BOOL)supportsMediaType:(int64_t)a3;
- (BOOL)supportsSharePlay;
- (BOOL)supportsVideo;
- (NSArray)supportedMediaTypes;
- (NSString)identifier;
- (OS_tcc_identity)assumedIdentity;
- (TUConversationProvider)initWithCoder:(id)a3;
- (TUConversationProvider)initWithConfiguration:(id)a3;
- (TUConversationProvider)initWithConversationProvider:(id)a3;
- (TUConversationProviderConfiguration)providerConfiguration;
- (id)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)pseudonymFeatureID;
- (unint64_t)defaultAVMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUConversationProvider

- (OS_tcc_identity)assumedIdentity
{
  v2 = [(TUConversationProvider *)self bundleIdentifier];
  if ([v2 length])
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "tu_assumedIdentityForBundleIdentifier:", v2);
  }
  else
  {
    v3 = 0;
  }

  return (OS_tcc_identity *)v3;
}

+ (TUConversationProvider)expanseProvider
{
  if (expanseProvider_onceToken != -1) {
    dispatch_once(&expanseProvider_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)expanseProvider_expanseProvider;

  return (TUConversationProvider *)v2;
}

void __41__TUConversationProvider_expanseProvider__block_invoke()
{
  v4 = [[TUConversationProviderConfiguration alloc] initWithServiceName:@"com.apple.private.expanse"];
  v0 = TUPreferredFaceTimeBundleIdentifier();
  [(TUConversationProviderConfiguration *)v4 setBundleID:v0];

  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EED24138, &unk_1EED24150, &unk_1EED24168, 0);
  [(TUConversationProviderConfiguration *)v4 setSupportedMediaTypes:v1];

  [(TUConversationProviderConfiguration *)v4 setSupportsLinks:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsSharePlay:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsConversationHandoff:1];
  v2 = [[TUConversationProvider alloc] initWithConfiguration:v4];
  v3 = (void *)expanseProvider_expanseProvider;
  expanseProvider_expanseProvider = (uint64_t)v2;
}

+ (TUConversationProvider)faceTimeProvider
{
  if (faceTimeProvider_onceToken != -1) {
    dispatch_once(&faceTimeProvider_onceToken, &__block_literal_global_13_0);
  }
  v2 = (void *)faceTimeProvider_faceTimeProvider;

  return (TUConversationProvider *)v2;
}

void __42__TUConversationProvider_faceTimeProvider__block_invoke()
{
  v4 = [[TUConversationProviderConfiguration alloc] initWithServiceName:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];
  v0 = TUPreferredFaceTimeBundleIdentifier();
  [(TUConversationProviderConfiguration *)v4 setBundleID:v0];

  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EED24138, &unk_1EED24150, &unk_1EED24168, 0);
  [(TUConversationProviderConfiguration *)v4 setSupportedMediaTypes:v1];

  [(TUConversationProviderConfiguration *)v4 setSupportsLinks:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsSharePlay:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsConversationHandoff:1];
  v2 = [[TUConversationProvider alloc] initWithConfiguration:v4];
  v3 = (void *)faceTimeProvider_faceTimeProvider;
  faceTimeProvider_faceTimeProvider = (uint64_t)v2;
}

+ (TUConversationProvider)unknownProvider
{
  if (unknownProvider_onceToken != -1) {
    dispatch_once(&unknownProvider_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)unknownProvider_unknownProvider;

  return (TUConversationProvider *)v2;
}

void __41__TUConversationProvider_unknownProvider__block_invoke()
{
  v4 = [[TUConversationProviderConfiguration alloc] initWithServiceName:@"com.apple.private.unknown"];
  v0 = TUPreferredFaceTimeBundleIdentifier();
  [(TUConversationProviderConfiguration *)v4 setBundleID:v0];

  v1 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EED24138, &unk_1EED24150, &unk_1EED24168, 0);
  [(TUConversationProviderConfiguration *)v4 setSupportedMediaTypes:v1];

  [(TUConversationProviderConfiguration *)v4 setSupportsLinks:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsSharePlay:1];
  [(TUConversationProviderConfiguration *)v4 setSupportsConversationHandoff:1];
  v2 = [[TUConversationProvider alloc] initWithConfiguration:v4];
  v3 = (void *)unknownProvider_unknownProvider;
  unknownProvider_unknownProvider = (uint64_t)v2;
}

- (BOOL)isDefaultProvider
{
  v3 = +[TUConversationProvider expanseProvider];
  if ([(TUConversationProvider *)self isEqual:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = +[TUConversationProvider faceTimeProvider];
    if ([(TUConversationProvider *)self isEqual:v5])
    {
      BOOL v4 = 1;
    }
    else
    {
      v6 = +[TUConversationProvider unknownProvider];
      BOOL v4 = [(TUConversationProvider *)self isEqual:v6];
    }
  }

  return v4;
}

+ (BOOL)matchesDefaultProviderIdentifier:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[TUConversationProvider expanseProvider];
  v5 = [v4 identifier];
  if ([v5 isEqualToString:v3])
  {
    char v6 = 1;
  }
  else
  {
    v7 = +[TUConversationProvider faceTimeProvider];
    v8 = [v7 identifier];
    if ([v8 isEqualToString:v3])
    {
      char v6 = 1;
    }
    else
    {
      v9 = +[TUConversationProvider unknownProvider];
      v10 = [v9 identifier];
      char v6 = [v10 isEqualToString:v3];
    }
  }

  return v6;
}

- (TUConversationProvider)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUConversationProvider;
  char v6 = [(TUConversationProvider *)&v14 init];
  if (v6)
  {
    v7 = [v5 serviceName];
    uint64_t v8 = [v7 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = [v5 supportedMediaTypes];
    uint64_t v11 = [v10 allObjects];
    supportedMediaTypes = v6->_supportedMediaTypes;
    v6->_supportedMediaTypes = (NSArray *)v11;

    objc_storeStrong((id *)&v6->_providerConfiguration, a3);
  }

  return v6;
}

- (TUConversationProvider)initWithConversationProvider:(id)a3
{
  BOOL v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationProvider;
  id v5 = [(TUConversationProvider *)&v8 init];
  char v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_identifier, v4[1]);
    objc_storeStrong((id *)&v6->_supportedMediaTypes, v4[2]);
    objc_storeStrong((id *)&v6->_providerConfiguration, v4[3]);
  }

  return v6;
}

- (unint64_t)defaultAVMode
{
  unint64_t v3 = 2;
  if (![(TUConversationProvider *)self supportsAVMode:2]) {
    return [(TUConversationProvider *)self supportsAVMode:1];
  }
  return v3;
}

- (BOOL)supportsVideo
{
  return [(TUConversationProvider *)self supportsAVMode:2];
}

- (BOOL)supportsSharePlay
{
  v2 = [(TUConversationProvider *)self providerConfiguration];
  char v3 = [v2 supportsSharePlay];

  return v3;
}

- (BOOL)supportsLinks
{
  v2 = [(TUConversationProvider *)self providerConfiguration];
  char v3 = [v2 supportsLinks];

  return v3;
}

- (id)bundleIdentifier
{
  v2 = [(TUConversationProvider *)self providerConfiguration];
  char v3 = [v2 bundleID];

  return v3;
}

- (id)pseudonymFeatureID
{
  v2 = [(TUConversationProvider *)self providerConfiguration];
  char v3 = [v2 pseudonymFeatureID];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = [TUConversationProvider alloc];

  return [(TUConversationProvider *)v4 initWithConversationProvider:self];
}

- (id)description
{
  char v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = [(TUConversationProvider *)self identifier];
  v7 = [(TUConversationProvider *)self providerConfiguration];
  objc_super v8 = [v3 stringWithFormat:@"<%@ %p identifier: %@ providerConfiguration: %@>", v5, self, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (TUConversationProvider *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationProvider *)self isEqualToConversationProvider:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  char v3 = [(TUConversationProvider *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUConversationProvider *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(TUConversationProvider *)self pseudonymFeatureID];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqualToConversationProvider:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationProvider *)self identifier];
  uint64_t v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(TUConversationProvider *)self supportedMediaTypes];
    unint64_t v8 = [v4 supportedMediaTypes];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = [(TUConversationProvider *)self providerConfiguration];
      v10 = [v4 providerConfiguration];
      char v11 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationProvider;
  BOOL v5 = [(TUConversationProvider *)&v21 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_identifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = NSStringFromSelector(sel_supportedMediaTypes);
    uint64_t v14 = [v4 decodeObjectOfClasses:v12 forKey:v13];
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = NSStringFromSelector(sel_providerConfiguration);
    uint64_t v18 = [v4 decodeObjectOfClass:v16 forKey:v17];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (TUConversationProviderConfiguration *)v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationProvider *)self identifier];
  uint64_t v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(TUConversationProvider *)self supportedMediaTypes];
  uint64_t v8 = NSStringFromSelector(sel_supportedMediaTypes);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(TUConversationProvider *)self providerConfiguration];
  v9 = NSStringFromSelector(sel_providerConfiguration);
  [v4 encodeObject:v10 forKey:v9];
}

+ (id)providerForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[TUConversationProvider faceTimeProvider];
  BOOL v5 = [v4 identifier];
  int v6 = [v3 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = +[TUConversationProvider faceTimeProvider];
  }
  else
  {
    uint64_t v8 = +[TUConversationProvider expanseProvider];
    v9 = [v8 identifier];
    int v10 = [v3 isEqualToString:v9];

    if (v10) {
      +[TUConversationProvider expanseProvider];
    }
    else {
    uint64_t v7 = +[TUConversationProvider unknownProvider];
    }
  }
  uint64_t v11 = (void *)v7;

  return v11;
}

- (BOOL)supportsAVMode:(unint64_t)a3
{
  return a3 <= 2 && [(TUConversationProvider *)self supportsMediaType:3 - a3];
}

- (BOOL)supportsMediaType:(int64_t)a3
{
  id v4 = [(TUConversationProvider *)self supportedMediaTypes];
  BOOL v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (TUConversationProviderConfiguration)providerConfiguration
{
  return self->_providerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
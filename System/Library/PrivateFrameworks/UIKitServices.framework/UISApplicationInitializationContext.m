@interface UISApplicationInitializationContext
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)defaultContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportAppSceneRequests;
- (FBSSceneIdentityToken)defaultSceneToken;
- (NSSet)persistedSceneIdentifiers;
- (NSString)description;
- (UISApplicationInitializationContext)initWithBSXPCCoder:(id)a3;
- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5;
- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5 supportAppSceneRequests:(BOOL)a6;
- (UISApplicationInitializationContext)initWithMainDisplayContext:(id)a3 launchDisplayContext:(id)a4 deviceContext:(id)a5 persistedSceneIdentifiers:(id)a6 supportAppSceneRequests:(BOOL)a7;
- (UISApplicationInitializationContext)initWithUISApplicationInitializationContext:(id)a3;
- (UISApplicationInitializationContext)initWithXPCDictionary:(id)a3;
- (UISCompatibilityContext)compatibilityContext;
- (UISDeviceContext)deviceContext;
- (UISDisplayContext)launchDisplayContext;
- (UISDisplayContext)mainDisplayContext;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation UISApplicationInitializationContext

- (FBSSceneIdentityToken)defaultSceneToken
{
  return self->_defaultSceneToken;
}

- (NSSet)persistedSceneIdentifiers
{
  return self->_persistedSceneIdentifiers;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (UISApplicationInitializationContext)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UISMainDisplayContextKey"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UISLaunchDisplayContextKey"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UISDeviceContextKey"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UISCompatibilityContextKey"];
  uint64_t v9 = objc_opt_class();
  v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"_UISPersistedSceneIdentifiersKey"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_UISDefaultSceneTokenKey"];
  uint64_t v12 = [v4 decodeBoolForKey:@"_UISSupportAppSceneRequestsKey"];

  v13 = [(UISApplicationInitializationContext *)self initWithMainDisplayContext:v5 launchDisplayContext:v6 deviceContext:v7 persistedSceneIdentifiers:v10 supportAppSceneRequests:v12];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_defaultSceneToken, v11);
    objc_storeStrong((id *)&v14->_compatibilityContext, v8);
  }

  return v14;
}

- (UISApplicationInitializationContext)initWithMainDisplayContext:(id)a3 launchDisplayContext:(id)a4 deviceContext:(id)a5 persistedSceneIdentifiers:(id)a6 supportAppSceneRequests:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13 && v14)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UISApplicationInitializationContext.m", 116, @"%s: Invalid display contexts specified. Providing a launch display context without an initial display context is not supported: mainDisplayContext: %@; launchDisplayContext: %@",
      "-[UISApplicationInitializationContext initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedScene"
      "Identifiers:supportAppSceneRequests:]",
      0,
      v14);
  }
  v28.receiver = self;
  v28.super_class = (Class)UISApplicationInitializationContext;
  v17 = [(UISApplicationInitializationContext *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [v13 copy];
    mainDisplayContext = v17->_mainDisplayContext;
    v17->_mainDisplayContext = (UISDisplayContext *)v18;

    uint64_t v20 = [v14 copy];
    launchDisplayContext = v17->_launchDisplayContext;
    v17->_launchDisplayContext = (UISDisplayContext *)v20;

    uint64_t v22 = [v15 copy];
    deviceContext = v17->_deviceContext;
    v17->_deviceContext = (UISDeviceContext *)v22;

    uint64_t v24 = [v16 copy];
    persistedSceneIdentifiers = v17->_persistedSceneIdentifiers;
    v17->_persistedSceneIdentifiers = (NSSet *)v24;

    v17->_supportAppSceneRequests = a7;
  }

  return v17;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  mainDisplayContext = self->_mainDisplayContext;
  id v5 = a3;
  [v5 encodeObject:mainDisplayContext forKey:@"_UISMainDisplayContextKey"];
  [v5 encodeObject:self->_launchDisplayContext forKey:@"_UISLaunchDisplayContextKey"];
  [v5 encodeObject:self->_deviceContext forKey:@"_UISDeviceContextKey"];
  [v5 encodeObject:self->_compatibilityContext forKey:@"_UISCompatibilityContextKey"];
  [v5 encodeCollection:self->_persistedSceneIdentifiers forKey:@"_UISPersistedSceneIdentifiersKey"];
  [v5 encodeObject:self->_defaultSceneToken forKey:@"_UISDefaultSceneTokenKey"];
  [v5 encodeBool:self->_supportAppSceneRequests forKey:@"_UISSupportAppSceneRequestsKey"];
}

- (UISDisplayContext)mainDisplayContext
{
  return self->_mainDisplayContext;
}

- (UISDeviceContext)deviceContext
{
  return self->_deviceContext;
}

- (BOOL)supportAppSceneRequests
{
  return self->_supportAppSceneRequests;
}

+ (id)defaultContext
{
  v3 = +[UISDeviceContext defaultContext];
  id v4 = objc_alloc((Class)a1);
  id v5 = +[UISDisplayContext defaultContext];
  id v6 = v3;
  v7 = v6;
  if (v6)
  {
    int v8 = [v6 deviceInfoIntegerValueForKey:@"UISDeviceContextDeviceClassKey"];
    if ((v8 + 1) <= 4) {
      uint64_t v9 = (0x19u >> (v8 + 1)) & 1;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  v10 = (void *)[v4 initWithMainDisplayContext:v5 launchDisplayContext:0 deviceContext:v7 persistedSceneIdentifiers:0 supportAppSceneRequests:v9];
  return v10;
}

- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v12 = v11;
  if (v11
    && (unsigned int v13 = [v11 deviceInfoIntegerValueForKey:@"UISDeviceContextDeviceClassKey"] + 1, v13 <= 4))
  {
    uint64_t v14 = (0x19u >> v13) & 1;
  }
  else
  {
    uint64_t v14 = 0;
  }

  id v15 = [(UISApplicationInitializationContext *)self initWithMainDisplayContext:v8 launchDisplayContext:0 deviceContext:v12 persistedSceneIdentifiers:v10 supportAppSceneRequests:v14];
  return v15;
}

- (UISApplicationInitializationContext)initWithDisplayContext:(id)a3 deviceContext:(id)a4 persistedSceneIdentifiers:(id)a5 supportAppSceneRequests:(BOOL)a6
{
  return [(UISApplicationInitializationContext *)self initWithMainDisplayContext:a3 launchDisplayContext:0 deviceContext:a4 persistedSceneIdentifiers:a5 supportAppSceneRequests:a6];
}

- (UISApplicationInitializationContext)initWithUISApplicationInitializationContext:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UISApplicationInitializationContext;
  id v5 = [(UISApplicationInitializationContext *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 1) copy];
    mainDisplayContext = v5->_mainDisplayContext;
    v5->_mainDisplayContext = (UISDisplayContext *)v6;

    uint64_t v8 = [*((id *)v4 + 2) copy];
    launchDisplayContext = v5->_launchDisplayContext;
    v5->_launchDisplayContext = (UISDisplayContext *)v8;

    uint64_t v10 = [*((id *)v4 + 3) copy];
    deviceContext = v5->_deviceContext;
    v5->_deviceContext = (UISDeviceContext *)v10;

    uint64_t v12 = [*((id *)v4 + 4) copy];
    compatibilityContext = v5->_compatibilityContext;
    v5->_compatibilityContext = (UISCompatibilityContext *)v12;

    uint64_t v14 = [*((id *)v4 + 5) copy];
    persistedSceneIdentifiers = v5->_persistedSceneIdentifiers;
    v5->_persistedSceneIdentifiers = (NSSet *)v14;

    uint64_t v16 = [*((id *)v4 + 6) copy];
    defaultSceneToken = v5->_defaultSceneToken;
    v5->_defaultSceneToken = (FBSSceneIdentityToken *)v16;

    v5->_supportAppSceneRequests = *((unsigned char *)v4 + 56);
  }

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UISApplicationInitializationContext.m", 205, @"%s is not supported", "-[UISApplicationInitializationContext encodeWithXPCDictionary:]");
}

- (UISApplicationInitializationContext)initWithXPCDictionary:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UISApplicationInitializationContext.m", 209, @"%s is not supported", "-[UISApplicationInitializationContext initWithXPCDictionary:]");

  return 0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [UISMutableApplicationInitializationContext alloc];
  return [(UISApplicationInitializationContext *)v4 initWithUISApplicationInitializationContext:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UISApplicationInitializationContext *)a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    v7 = [(UISApplicationInitializationContext *)self mainDisplayContext];
    uint64_t v8 = [(UISApplicationInitializationContext *)v6 mainDisplayContext];
    if (BSEqualObjects())
    {
      id v9 = [(UISApplicationInitializationContext *)self launchDisplayContext];
      uint64_t v10 = [(UISApplicationInitializationContext *)v6 launchDisplayContext];
      if (BSEqualObjects())
      {
        id v11 = [(UISApplicationInitializationContext *)self compatibilityContext];
        uint64_t v12 = [(UISApplicationInitializationContext *)v6 compatibilityContext];
        if (BSEqualObjects())
        {
          uint64_t v13 = [(UISApplicationInitializationContext *)self deviceContext];
          uint64_t v14 = [(UISApplicationInitializationContext *)v6 deviceContext];
          uint64_t v22 = (void *)v13;
          if ((void *)v13 == v14)
          {
            id v21 = v14;
            uint64_t v16 = [(UISApplicationInitializationContext *)self defaultSceneToken];
            [(UISApplicationInitializationContext *)v6 defaultSceneToken];
            v17 = uint64_t v20 = (void *)v16;
            if (BSEqualObjects())
            {
              BOOL v18 = [(UISApplicationInitializationContext *)self supportAppSceneRequests];
              BOOL v15 = v18 ^ [(UISApplicationInitializationContext *)v6 supportAppSceneRequests] ^ 1;
            }
            else
            {
              LOBYTE(v15) = 0;
            }

            uint64_t v14 = v21;
          }
          else
          {
            LOBYTE(v15) = 0;
          }
        }
        else
        {
          LOBYTE(v15) = 0;
        }
      }
      else
      {
        LOBYTE(v15) = 0;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v15) = 0;
  }
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = [(FBSSceneIdentityToken *)self->_defaultSceneToken hash];
  BOOL supportAppSceneRequests = self->_supportAppSceneRequests;
  id v5 = [(UISApplicationInitializationContext *)self mainDisplayContext];
  uint64_t v6 = [v5 hash];
  v7 = [(UISApplicationInitializationContext *)self launchDisplayContext];
  uint64_t v8 = [v7 hash] ^ v6;
  id v9 = [(UISApplicationInitializationContext *)self deviceContext];
  uint64_t v10 = [v9 hash];
  id v11 = [(UISApplicationInitializationContext *)self compatibilityContext];
  unint64_t v12 = v3 + supportAppSceneRequests + (v8 ^ v10 ^ [v11 hash]);

  return v12;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F62810] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_mainDisplayContext withName:@"MainDisplayContext"];
  id v5 = (id)[v3 appendObject:self->_launchDisplayContext withName:@"LaunchDisplayContext"];
  id v6 = (id)[v3 appendObject:self->_deviceContext withName:@"DeviceContext"];
  id v7 = (id)[v3 appendObject:self->_compatibilityContext withName:@"CompatibilityContext"];
  id v8 = (id)[v3 appendObject:self->_defaultSceneToken withName:@"DefaultSceneToken"];
  id v9 = (id)[v3 appendBool:self->_supportAppSceneRequests withName:@"SupportAppSceneRequests"];
  uint64_t v10 = [v3 build];

  return (NSString *)v10;
}

- (UISDisplayContext)launchDisplayContext
{
  return self->_launchDisplayContext;
}

- (UISCompatibilityContext)compatibilityContext
{
  return self->_compatibilityContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultSceneToken, 0);
  objc_storeStrong((id *)&self->_persistedSceneIdentifiers, 0);
  objc_storeStrong((id *)&self->_compatibilityContext, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_launchDisplayContext, 0);
  objc_storeStrong((id *)&self->_mainDisplayContext, 0);
}

@end
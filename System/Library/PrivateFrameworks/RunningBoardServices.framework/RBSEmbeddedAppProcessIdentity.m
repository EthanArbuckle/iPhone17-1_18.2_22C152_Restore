@interface RBSEmbeddedAppProcessIdentity
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)isAnonymous;
- (BOOL)isApplication;
- (BOOL)isEmbeddedApplication;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (RBSEmbeddedAppProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSEmbeddedAppProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initEmbeddedApp:(id)a3 personaString:(id)a4;
- (id)_initEmbeddedAppWithAppInfo:(id)a3;
- (id)_initEmbeddedAppWithBundleID:(id)a3;
- (id)copyWithPersonaString:(id)a3;
- (id)debugDescription;
- (id)embeddedApplicationIdentifier;
- (id)encodeForJob;
- (id)personaString;
- (unsigned)defaultManageFlags;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSEmbeddedAppProcessIdentity

- (id)embeddedApplicationIdentifier
{
  return self->_embeddedApplicationIdentifier;
}

- (BOOL)isApplication
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  id v5 = a3;
  [v5 encodeObject:embeddedApplicationIdentifier forKey:@"_embeddedApplicationIdentifier"];
  [v5 encodeObject:self->_personaString forKey:@"_personaString"];
}

- (BOOL)isAnonymous
{
  return 0;
}

- (RBSEmbeddedAppProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_embeddedApplicationIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_personaString"];

  if (!v6 && _os_feature_enabled_impl())
  {
    v7 = rbs_general_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity initWithRBSXPCCoder:]();
    }
  }
  v8 = (RBSEmbeddedAppProcessIdentity *)[(RBSEmbeddedAppProcessIdentity *)self _initEmbeddedApp:v5 personaString:v6];

  return v8;
}

- (id)_initEmbeddedApp:(id)a3 personaString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)RBSEmbeddedAppProcessIdentity;
  v8 = [(RBSProcessIdentity *)&v18 _init];
  v9 = v8;
  if (v8)
  {
    v8[2] = 0;
    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v10;

    uint64_t v12 = [v6 copy];
    v13 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v12;

    uint64_t v14 = [NSString stringWithFormat:@"app<%@(%@)>", *((void *)v9 + 7), *((void *)v9 + 8)];
    v15 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v14;

    *((void *)v9 + 3) = [*((id *)v9 + 7) hash];
    v16 = v9;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSEmbeddedAppProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = v5 == objc_opt_class() && [(RBSProcessIdentity *)self isEqualToIdentity:v4];
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4 = a3;
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  uint64_t v6 = [v4 embeddedApplicationIdentifier];
  if (embeddedApplicationIdentifier == (NSString *)v6)
  {

    goto LABEL_10;
  }
  uint64_t v7 = v6;
  if (embeddedApplicationIdentifier) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    LOBYTE(v9) = 0;
LABEL_48:

    goto LABEL_49;
  }
  int v9 = [(NSString *)embeddedApplicationIdentifier isEqual:v6];

  if (v9)
  {
LABEL_10:
    uint64_t v10 = self->_personaString;
    v11 = [v4 personaString];
    uint64_t v7 = v10;
    unint64_t v12 = v11;
    if (v7 | v12)
    {
      v13 = (void *)_personalPersonaUniqueStringOverride;
      if (!_personalPersonaUniqueStringOverride)
      {
        if (_personalPersonaString_onceToken != -1) {
          dispatch_once(&_personalPersonaString_onceToken, &__block_literal_global_11);
        }
        v13 = (void *)_personalPersonaString_personalPersonaString;
      }
      id v14 = v13;
      id v15 = v14;
      if (v7) {
        BOOL v16 = v14 == (id)v7;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16)
      {
        int v17 = 1;
      }
      else
      {
        if (!v14)
        {
          if (!v12) {
            goto LABEL_42;
          }
          char v18 = 0;
          LOBYTE(v17) = 0;
          goto LABEL_34;
        }
        int v17 = [(id)v7 isEqualToString:v14];
      }
      char v18 = 1;
      if (v12 && v15 != (id)v12)
      {
        if (v15)
        {
          char v18 = [(id)v12 isEqualToString:v15];
          goto LABEL_28;
        }
        char v18 = 0;
LABEL_34:
        if ((v17 & 1) == 0 && (v18 & 1) == 0)
        {
          if (v7 == v12)
          {
LABEL_30:

            goto LABEL_46;
          }
          if (v7 && v12 != 0)
          {
            char v20 = [(id)v7 isEqualToString:v12];

            if (v20) {
              goto LABEL_46;
            }
            goto LABEL_43;
          }
        }
LABEL_42:

LABEL_43:
        if (_os_feature_enabled_impl())
        {
          LOBYTE(v9) = 0;
LABEL_47:

          goto LABEL_48;
        }
LABEL_46:
        LOBYTE(v9) = 1;
        goto LABEL_47;
      }
    }
    else
    {
      id v15 = 0;
      int v17 = 1;
      char v18 = 1;
    }
LABEL_28:
    if (v17 && (v18 & 1) != 0) {
      goto LABEL_30;
    }
    goto LABEL_34;
  }
LABEL_49:

  return v9;
}

- (id)personaString
{
  return self->_personaString;
}

- (BOOL)isEmbeddedApplication
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaString, 0);
  objc_storeStrong((id *)&self->_embeddedApplicationIdentifier, 0);
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  return 1;
}

- (RBSEmbeddedAppProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    BOOL v8 = rbs_general_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:]((uint64_t)v7, v8);
    }
  }
  string = xpc_dictionary_get_string(v6, "EAI");
  if (string)
  {
    uint64_t v10 = [NSString stringWithUTF8String:string];
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = xpc_dictionary_get_string(v6, "PERS");
  if (v11)
  {
    unint64_t v12 = [NSString stringWithUTF8String:v11];
    if (v10)
    {
LABEL_10:
      self = (RBSEmbeddedAppProcessIdentity *)[(RBSEmbeddedAppProcessIdentity *)self _initEmbeddedApp:v10 personaString:v12];
      v13 = self;
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v12 = 0;
    if (v10) {
      goto LABEL_10;
    }
  }
  id v14 = rbs_general_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[RBSEmbeddedAppProcessIdentity initWithDecodeFromJob:uuid:]();
  }

  v13 = 0;
LABEL_15:

  return v13;
}

- (unsigned)defaultManageFlags
{
  return -1;
}

- (id)encodeForJob
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 2);
  embeddedApplicationIdentifier = self->_embeddedApplicationIdentifier;
  if (embeddedApplicationIdentifier) {
    xpc_dictionary_set_string(empty, "EAI", [(NSString *)embeddedApplicationIdentifier UTF8String]);
  }
  personaString = self->_personaString;
  if (personaString) {
    xpc_dictionary_set_string(empty, "PERS", [(NSString *)personaString UTF8String]);
  }
  return empty;
}

- (id)copyWithPersonaString:(id)a3
{
  id v4 = a3;
  if (!v4 && _os_feature_enabled_impl())
  {
    uint64_t v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity copyWithPersonaString:]();
    }
  }
  id v6 = [[RBSEmbeddedAppProcessIdentity alloc] _initEmbeddedApp:self->_embeddedApplicationIdentifier personaString:v4];
  v6[2] = self->super._pid;

  return v6;
}

- (id)_initEmbeddedAppWithBundleID:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = rbs_general_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithBundleID:]();
    }
  }
  id v6 = [(RBSEmbeddedAppProcessIdentity *)self _initEmbeddedApp:v4 personaString:0];

  return v6;
}

- (id)_initEmbeddedAppWithAppInfo:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 bundleID];
  if (v5)
  {
    id v6 = [v4 personaString];
    if (!v6 && _os_feature_enabled_impl())
    {
      id v7 = rbs_general_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[RBSEmbeddedAppProcessIdentity _initEmbeddedAppWithAppInfo:]();
      }
    }
    self = (RBSEmbeddedAppProcessIdentity *)[(RBSEmbeddedAppProcessIdentity *)self _initEmbeddedApp:v5 personaString:v6];
    BOOL v8 = self;
  }
  else
  {
    id v6 = rbs_general_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [v4 description];
      int v11 = 138543362;
      unint64_t v12 = v9;
      _os_log_impl(&dword_191FE8000, v6, OS_LOG_TYPE_DEFAULT, "_initEmbeddedAppWithAppInfoProvider failed - unable to find bundleID for %{public}@", (uint8_t *)&v11, 0xCu);
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (id)debugDescription
{
  v3 = self->_embeddedApplicationIdentifier;
  uint64_t v4 = [(RBSProcessIdentity *)self auid];
  uint64_t v5 = self->_personaString;
  id v6 = NSString;
  if (v4) {
    id v7 = @" AUID=";
  }
  else {
    id v7 = &stru_1EE2E2768;
  }
  if (v4)
  {
    BOOL v8 = [NSNumber numberWithUnsignedInt:v4];
  }
  else
  {
    BOOL v8 = &stru_1EE2E2768;
  }
  int v9 = @" PERS=";
  if (v5)
  {
    uint64_t v10 = (__CFString *)v5;
  }
  else
  {
    int v9 = &stru_1EE2E2768;
    uint64_t v10 = &stru_1EE2E2768;
  }
  int v11 = [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@%@%@>", @"embeddedApplication", v3, &stru_1EE2E2768, &stru_1EE2E2768, v7, v8, v9, v10];
  if (v4) {

  }
  return v11;
}

- (void)_initEmbeddedAppWithBundleID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_191FE8000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous", v2, v3, v4, v5, v6);
}

- (void)_initEmbeddedAppWithAppInfo:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_191FE8000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (infoProvider)", v2, v3, v4, v5, v6);
}

- (void)copyWithPersonaString:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_191FE8000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (copy)", v2, v3, v4, v5, v6);
}

- (void)initWithRBSXPCCoder:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_6(&dword_191FE8000, v0, v1, "Creating RBSProcessIdentity from bundle identifier only - result is ambiguous (decoder)", v2, v3, v4, v5, v6);
}

- (void)initWithDecodeFromJob:uuid:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_191FE8000, v0, OS_LOG_TYPE_ERROR, "initWithDecodeFromJob tried to decode embedded app without bundleID", v1, 2u);
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_191FE8000, a2, OS_LOG_TYPE_FAULT, "There is no reason an app identity should have a UUID: %@", (uint8_t *)&v2, 0xCu);
}

@end
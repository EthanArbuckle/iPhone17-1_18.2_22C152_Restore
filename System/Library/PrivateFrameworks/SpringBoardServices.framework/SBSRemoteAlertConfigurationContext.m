@interface SBSRemoteAlertConfigurationContext
+ (BOOL)supportsSecureCoding;
+ (id)configurationContextWithLegacyAlertOptions:(id)a3;
- (NSDictionary)legacyAlertOptions;
- (NSDictionary)userInfo;
- (NSSet)actions;
- (OS_xpc_object)xpcEndpoint;
- (SBSRemoteAlertConfigurationContext)initWithCoder:(id)a3;
- (SBSRemoteAlertConfigurationContext)initWithXPCDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setActions:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setXpcEndpoint:(id)a3;
@end

@implementation SBSRemoteAlertConfigurationContext

+ (id)configurationContextWithLegacyAlertOptions:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = [v4 bs_safeDictionaryForKey:@"UserInfo"];
  [v5 setUserInfo:v6];

  if (v5)
  {
    uint64_t v7 = [v4 copy];
    v8 = (void *)v5[4];
    v5[4] = v7;
  }
  return v5;
}

- (SBSRemoteAlertConfigurationContext)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSRemoteAlertConfigurationContext;
  v5 = [(SBSRemoteAlertConfigurationContext *)&v15 init];
  if (v5)
  {
    uint64_t v6 = BSDeserializeCFValueFromXPCDictionaryWithKey();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v6;

    uint64_t v8 = xpc_dictionary_get_value(v4, "c__endpoint");
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (OS_xpc_object *)v8;

    uint64_t v10 = BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    actions = v5->_actions;
    v5->_actions = (NSSet *)v10;

    uint64_t v12 = BSDeserializeCFValueFromXPCDictionaryWithKey();
    legacyAlertOptions = v5->_legacyAlertOptions;
    v5->_legacyAlertOptions = (NSDictionary *)v12;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4 = a3;
  xpcEndpoint = self->_xpcEndpoint;
  if (xpcEndpoint) {
    xpc_dictionary_set_value(v4, "c__endpoint", xpcEndpoint);
  }
  if (self->_userInfo) {
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
  if ([(NSSet *)self->_actions count]) {
    BSSerializeSetToXPCDictionaryWithKey();
  }
  if (self->_legacyAlertOptions) {
    BSSerializeCFValueToXPCDictionaryWithKey();
  }
  MEMORY[0x1F41817F8]();
}

id __62__SBSRemoteAlertConfigurationContext_encodeWithXPCDictionary___block_invoke()
{
  v0 = (void *)BSCreateSerializedBSXPCEncodableObject();
  return v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"SBSRemoteAlertConfigurationContext.m" lineNumber:87 description:@"This class may only be encoded by an NSXPCCoder."];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v11 encodeObject:userInfo forKey:@"__userInfo"];
  }
  xpcEndpoint = self->_xpcEndpoint;
  if (xpcEndpoint) {
    [v11 encodeXPCObject:xpcEndpoint forKey:@"__endpoint"];
  }
  if ([(NSSet *)self->_actions count])
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    BSSerializeSetToXPCDictionaryWithKey();
    [v11 encodeXPCObject:v8 forKey:@"__actions"];
  }
  legacyAlertOptions = self->_legacyAlertOptions;
  uint64_t v10 = v11;
  if (legacyAlertOptions)
  {
    [v11 encodeObject:legacyAlertOptions forKey:@"__legacyAlertOptions"];
    uint64_t v10 = v11;
  }
}

id __54__SBSRemoteAlertConfigurationContext_encodeWithCoder___block_invoke()
{
  v0 = (void *)BSCreateSerializedBSXPCEncodableObject();
  return v0;
}

- (SBSRemoteAlertConfigurationContext)initWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26.receiver = self;
    v26.super_class = (Class)SBSRemoteAlertConfigurationContext;
    uint64_t v6 = [(SBSRemoteAlertConfigurationContext *)&v26 init];
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      v13 = [v7 setWithObjects:v8, v9, v10, v11, v12, nil];
      uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"__userInfo"];
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v14;

      if (v6->_userInfo)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:a2 object:v6 file:@"SBSRemoteAlertConfigurationContext.m" lineNumber:122 description:@"User info must be a dictionary type."];
        }
      }
      uint64_t v16 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"__endpoint"];
      xpcEndpoint = v6->_xpcEndpoint;
      v6->_xpcEndpoint = (OS_xpc_object *)v16;

      v18 = [v5 decodeXPCObjectOfType:MEMORY[0x1E4F14590] forKey:@"__actions"];
      uint64_t v19 = BSDeserializeSetOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
      actions = v6->_actions;
      v6->_actions = (NSSet *)v19;

      v21 = [v5 decodePropertyListForKey:@"__legacyAlertOptions"];
      if ([v21 isNSDictionary]) {
        objc_storeStrong((id *)&v6->_legacyAlertOptions, v21);
      }
    }
    self = v6;
    v22 = self;
  }
  else
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBSRemoteAlertConfigurationContext.m" lineNumber:114 description:@"This class may only be decoded by an NSXPCCoder."];

    v22 = 0;
  }

  return v22;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (OS_xpc_object)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (NSDictionary)legacyAlertOptions
{
  return self->_legacyAlertOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyAlertOptions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
@interface XBLaunchInterface
+ (BOOL)supportsSecureCoding;
- (BOOL)_isDefault;
- (BOOL)isConfiguration;
- (BOOL)isStoryboard;
- (BOOL)isXIB;
- (NSArray)urlSchemes;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (XBLaunchInterface)initWithCoder:(id)a3;
- (XBLaunchInterface)initWithConfiguration:(id)a3 identifier:(id)a4 urlSchemes:(id)a5 isDefault:(BOOL)a6;
- (XBLaunchInterface)initWithType:(unint64_t)a3 name:(id)a4 identifier:(id)a5 urlSchemes:(id)a6 isDefault:(BOOL)a7;
- (XBLaunchInterface)initWithXPCDictionary:(id)a3;
- (XBLaunchInterfaceConfiguration)configuration;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUrlSchemes:(id)a3;
- (void)set_default:(BOOL)a3;
@end

@implementation XBLaunchInterface

- (XBLaunchInterface)initWithCoder:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)XBLaunchInterface;
  v6 = [(XBLaunchInterface *)&v29 init];
  if (v6)
  {
    if (([v5 allowsKeyedCoding] & 1) == 0)
    {
      v27 = [MEMORY[0x263F08690] currentHandler];
      [v27 handleFailureInMethod:a2, v6, @"XBApplicationLaunchCompatibilityInfo.m", 423, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
    }
    v28 = [NSString stringWithUTF8String:"type"];
    v6->_type = [v5 decodeInt64ForKey:v28];
    v7 = [NSString stringWithUTF8String:"name"];
    v8 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v7];
    uint64_t v9 = [v8 copy];
    name = v6->_name;
    v6->_name = (NSString *)v9;

    v11 = [NSString stringWithUTF8String:"identifier"];
    v12 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v11];
    uint64_t v13 = [v12 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    v15 = [NSString stringWithUTF8String:"configuration"];
    uint64_t v16 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v15];
    configuration = v6->_configuration;
    v6->_configuration = (XBLaunchInterfaceConfiguration *)v16;

    v18 = [NSString stringWithUTF8String:"default"];
    v6->_default = [v5 decodeBoolForKey:v18];
    v19 = [NSString stringWithUTF8String:"urlSchemes"];
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v23 = [v5 decodeObjectOfClasses:v22 forKey:v19];
    uint64_t v24 = [v23 copy];
    urlSchemes = v6->_urlSchemes;
    v6->_urlSchemes = (NSArray *)v24;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_urlSchemes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (XBLaunchInterface)initWithType:(unint64_t)a3 name:(id)a4 identifier:(id)a5 urlSchemes:(id)a6 isDefault:(BOOL)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)XBLaunchInterface;
  v15 = [(XBLaunchInterface *)&v24 init];
  uint64_t v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    identifier = v16->_identifier;
    v16->_identifier = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    urlSchemes = v16->_urlSchemes;
    v16->_urlSchemes = (NSArray *)v21;

    v16->_default = a7;
  }

  return v16;
}

- (XBLaunchInterface)initWithConfiguration:(id)a3 identifier:(id)a4 urlSchemes:(id)a5 isDefault:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)XBLaunchInterface;
  id v14 = [(XBLaunchInterface *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = 2;
    uint64_t v16 = [v12 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    urlSchemes = v15->_urlSchemes;
    v15->_urlSchemes = (NSArray *)v18;

    v15->_default = a6;
    objc_storeStrong((id *)&v15->_configuration, a3);
  }

  return v15;
}

- (XBLaunchInterface)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)XBLaunchInterface;
  id v5 = [(XBLaunchInterface *)&v15 init];
  if (v5)
  {
    v5->_type = xpc_dictionary_get_int64(v4, "type");
    uint64_t v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    uint64_t v10 = BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
    configuration = v5->_configuration;
    v5->_configuration = (XBLaunchInterfaceConfiguration *)v10;

    v5->_default = xpc_dictionary_get_BOOL(v4, "default");
    uint64_t v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    urlSchemes = v5->_urlSchemes;
    v5->_urlSchemes = (NSArray *)v12;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  int64_t type = self->_type;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_int64(xdict, "type", type);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "default", self->_default);
  BSSerializeCFValueToXPCDictionaryWithKey();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"XBApplicationLaunchCompatibilityInfo.m", 442, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
  }
  id v12 = [NSString stringWithUTF8String:"type"];
  [v5 encodeInt64:self->_type forKey:v12];
  uint64_t v6 = [NSString stringWithUTF8String:"name"];
  [v5 encodeObject:self->_name forKey:v6];
  v7 = [NSString stringWithUTF8String:"identifier"];
  [v5 encodeObject:self->_identifier forKey:v7];
  uint64_t v8 = [NSString stringWithUTF8String:"configuration"];
  [v5 encodeObject:self->_configuration forKey:v8];
  uint64_t v9 = [NSString stringWithUTF8String:"default"];
  [v5 encodeBool:self->_default forKey:v9];
  uint64_t v10 = [NSString stringWithUTF8String:"urlSchemes"];
  [v5 encodeObject:self->_urlSchemes forKey:v10];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_name withName:@"name"];
  id v5 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v6 = (id)[v3 appendObject:self->_configuration withName:@"configuration"];
  unint64_t type = self->_type;
  uint64_t v8 = @"(null)";
  if (type == 1) {
    uint64_t v8 = @"Storyboard";
  }
  if (type) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = @"XIB";
  }
  id v10 = (id)[v3 appendObject:v9 withName:@"type"];
  id v11 = (id)[v3 appendObject:self->_urlSchemes withName:@"urlSchemes"];
  id v12 = (id)[v3 appendBool:self->_default withName:@"default"];
  id v13 = [v3 build];

  return (NSString *)v13;
}

- (BOOL)isStoryboard
{
  return self->_type == 1;
}

- (BOOL)isXIB
{
  return self->_type == 0;
}

- (BOOL)isConfiguration
{
  return self->_type == 2;
}

- (BOOL)_isDefault
{
  return self->_default;
}

- (void)set_default:(BOOL)a3
{
  self->_default = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSArray)urlSchemes
{
  return self->_urlSchemes;
}

- (void)setUrlSchemes:(id)a3
{
}

- (XBLaunchInterfaceConfiguration)configuration
{
  return self->_configuration;
}

@end
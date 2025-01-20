@interface XBLaunchInterfaceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)imageRespectsSafeAreaInsets;
- (NSArray)bars;
- (NSString)colorName;
- (NSString)description;
- (NSString)imageName;
- (NSString)navigationBarImageName;
- (NSString)tabBarImageName;
- (NSString)toolbarImageName;
- (XBLaunchInterfaceConfiguration)initWithCoder:(id)a3;
- (XBLaunchInterfaceConfiguration)initWithConfigurationDictionary:(id)a3;
- (XBLaunchInterfaceConfiguration)initWithXPCDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation XBLaunchInterfaceConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabBarImageName, 0);
  objc_storeStrong((id *)&self->_toolbarImageName, 0);
  objc_storeStrong((id *)&self->_navigationBarImageName, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

- (XBLaunchInterfaceConfiguration)initWithCoder:(id)a3
{
  id v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)XBLaunchInterfaceConfiguration;
  v6 = [(XBLaunchInterfaceConfiguration *)&v37 init];
  if (v6)
  {
    if (([v5 allowsKeyedCoding] & 1) == 0)
    {
      v34 = [MEMORY[0x263F08690] currentHandler];
      [v34 handleFailureInMethod:a2, v6, @"XBApplicationLaunchCompatibilityInfo.m", 298, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
    }
    v36 = [NSString stringWithUTF8String:"colorName"];
    v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v36];
    uint64_t v8 = [v7 copy];
    colorName = v6->_colorName;
    v6->_colorName = (NSString *)v8;

    v35 = [NSString stringWithUTF8String:"imageName"];
    v10 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v35];
    uint64_t v11 = [v10 copy];
    imageName = v6->_imageName;
    v6->_imageName = (NSString *)v11;

    v13 = [NSString stringWithUTF8String:"imageRespectsSafeAreaInsets"];
    v6->_imageRespectsSafeAreaInsets = [v5 decodeBoolForKey:v13];
    v14 = [NSString stringWithUTF8String:"navigationBarImageName"];
    v15 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v14];
    uint64_t v16 = [v15 copy];
    navigationBarImageName = v6->_navigationBarImageName;
    v6->_navigationBarImageName = (NSString *)v16;

    v18 = [NSString stringWithUTF8String:"toolbarImageName"];
    v19 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v18];
    uint64_t v20 = [v19 copy];
    toolbarImageName = v6->_toolbarImageName;
    v6->_toolbarImageName = (NSString *)v20;

    v22 = [NSString stringWithUTF8String:"tabBarImageName"];
    v23 = [v5 decodeObjectOfClass:objc_opt_class() forKey:v22];
    uint64_t v24 = [v23 copy];
    tabBarImageName = v6->_tabBarImageName;
    v6->_tabBarImageName = (NSString *)v24;

    v26 = [NSString stringWithUTF8String:"bars"];
    v27 = (void *)MEMORY[0x263EFFA08];
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v30 = [v5 decodeObjectOfClasses:v29 forKey:v26];
    uint64_t v31 = [v30 copy];
    bars = v6->_bars;
    v6->_bars = (NSArray *)v31;
  }
  return v6;
}

- (XBLaunchInterfaceConfiguration)initWithConfigurationDictionary:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)XBLaunchInterfaceConfiguration;
  id v5 = [(XBLaunchInterfaceConfiguration *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8C0] array];
    bars = v5->_bars;
    v5->_bars = (NSArray *)v6;

    uint64_t v8 = [v4 valueForKey:@"UIColorName"];
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v8;

    uint64_t v10 = [v4 valueForKey:@"UIImageName"];
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v10;

    v12 = [v4 valueForKey:@"UIImageRespectsSafeAreaInsets"];
    v5->_imageRespectsSafeAreaInsets = [v12 BOOLValue];

    v13 = [v4 valueForKey:@"UINavigationBar"];
    if (v13)
    {
      uint64_t v14 = [(NSArray *)v5->_bars arrayByAddingObject:@"UINavigationBar"];
      v15 = v5->_bars;
      v5->_bars = (NSArray *)v14;

      uint64_t v16 = [v13 valueForKey:@"UIImageName"];
      navigationBarImageName = v5->_navigationBarImageName;
      v5->_navigationBarImageName = (NSString *)v16;
    }
    v18 = [v4 valueForKey:@"UIToolbar"];
    if (v18)
    {
      uint64_t v19 = [(NSArray *)v5->_bars arrayByAddingObject:@"UIToolbar"];
      uint64_t v20 = v5->_bars;
      v5->_bars = (NSArray *)v19;

      uint64_t v21 = [v18 valueForKey:@"UIImageName"];
      toolbarImageName = v5->_toolbarImageName;
      v5->_toolbarImageName = (NSString *)v21;
    }
    v23 = [v4 valueForKey:@"UITabBar"];
    if (v23)
    {
      uint64_t v24 = [(NSArray *)v5->_bars arrayByAddingObject:@"UITabBar"];
      v25 = v5->_bars;
      v5->_bars = (NSArray *)v24;

      uint64_t v26 = [v23 valueForKey:@"UIImageName"];
      tabBarImageName = v5->_tabBarImageName;
      v5->_tabBarImageName = (NSString *)v26;
    }
  }

  return v5;
}

- (XBLaunchInterfaceConfiguration)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)XBLaunchInterfaceConfiguration;
  id v5 = [(XBLaunchInterfaceConfiguration *)&v19 init];
  if (v5)
  {
    uint64_t v6 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    colorName = v5->_colorName;
    v5->_colorName = (NSString *)v6;

    uint64_t v8 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v8;

    v5->_imageRespectsSafeAreaInsets = xpc_dictionary_get_BOOL(v4, "imageRespectsSafeAreaInsets");
    uint64_t v10 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    navigationBarImageName = v5->_navigationBarImageName;
    v5->_navigationBarImageName = (NSString *)v10;

    uint64_t v12 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    toolbarImageName = v5->_toolbarImageName;
    v5->_toolbarImageName = (NSString *)v12;

    uint64_t v14 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    tabBarImageName = v5->_tabBarImageName;
    v5->_tabBarImageName = (NSString *)v14;

    uint64_t v16 = BSCreateDeserializedCFValueFromXPCDictionaryWithKey();
    bars = v5->_bars;
    v5->_bars = (NSArray *)v16;
  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "imageRespectsSafeAreaInsets", self->_imageRespectsSafeAreaInsets);
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
  BSSerializeCFValueToXPCDictionaryWithKey();
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
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"XBApplicationLaunchCompatibilityInfo.m", 319, @"Invalid parameter not satisfying: %@", @"[coder allowsKeyedCoding]" object file lineNumber description];
  }
  id v13 = [NSString stringWithUTF8String:"colorName"];
  [v5 encodeObject:self->_colorName forKey:v13];
  uint64_t v6 = [NSString stringWithUTF8String:"imageName"];
  [v5 encodeObject:self->_imageName forKey:v6];
  v7 = [NSString stringWithUTF8String:"imageRespectsSafeAreaInsets"];
  [v5 encodeBool:self->_imageRespectsSafeAreaInsets forKey:v7];
  uint64_t v8 = [NSString stringWithUTF8String:"navigationBarImageName"];
  [v5 encodeObject:self->_navigationBarImageName forKey:v8];
  v9 = [NSString stringWithUTF8String:"toolbarImageName"];
  [v5 encodeObject:self->_toolbarImageName forKey:v9];
  uint64_t v10 = [NSString stringWithUTF8String:"tabBarImageName"];
  [v5 encodeObject:self->_tabBarImageName forKey:v10];
  uint64_t v11 = [NSString stringWithUTF8String:"bars"];
  [v5 encodeObject:self->_bars forKey:v11];
}

- (NSString)description
{
  v3 = [MEMORY[0x263F3F658] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_colorName withName:@"colorName"];
  id v5 = (id)[v3 appendObject:self->_imageName withName:@"imageName"];
  id v6 = (id)[v3 appendBool:self->_imageRespectsSafeAreaInsets withName:@"imageRespectsSafeAreaInsets"];
  id v7 = (id)[v3 appendObject:self->_navigationBarImageName withName:@"navigationBarImageName"];
  id v8 = (id)[v3 appendObject:self->_toolbarImageName withName:@"toolbarImageName"];
  id v9 = (id)[v3 appendObject:self->_tabBarImageName withName:@"tabBarImageName"];
  id v10 = (id)[v3 appendObject:self->_bars withName:@"bars"];
  uint64_t v11 = [v3 build];

  return (NSString *)v11;
}

- (NSString)colorName
{
  return self->_colorName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (BOOL)imageRespectsSafeAreaInsets
{
  return self->_imageRespectsSafeAreaInsets;
}

- (NSArray)bars
{
  return self->_bars;
}

- (NSString)navigationBarImageName
{
  return self->_navigationBarImageName;
}

- (NSString)toolbarImageName
{
  return self->_toolbarImageName;
}

- (NSString)tabBarImageName
{
  return self->_tabBarImageName;
}

@end
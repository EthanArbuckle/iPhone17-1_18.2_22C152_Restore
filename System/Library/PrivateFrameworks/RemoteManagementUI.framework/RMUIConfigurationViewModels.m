@interface RMUIConfigurationViewModels
+ (BOOL)supportsSecureCoding;
- (NSArray)pluginSectionViewModels;
- (NSArray)pluginViewModels;
- (NSArray)profileViewModels;
- (RMUIConfigurationViewModels)initWithCoder:(id)a3;
- (RMUIConfigurationViewModels)initWithProfileViewModels:(id)a3 pluginSectionViewModels:(id)a4 pluginViewModels:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMUIConfigurationViewModels

- (RMUIConfigurationViewModels)initWithProfileViewModels:(id)a3 pluginSectionViewModels:(id)a4 pluginViewModels:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RMUIConfigurationViewModels;
  v12 = [(RMUIConfigurationViewModels *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profileViewModels, a3);
    objc_storeStrong((id *)&v13->_pluginSectionViewModels, a4);
    objc_storeStrong((id *)&v13->_pluginViewModels, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RMUIConfigurationViewModels *)self profileViewModels];
  [v4 encodeObject:v5 forKey:@"profileViewModels"];

  v6 = [(RMUIConfigurationViewModels *)self pluginSectionViewModels];
  [v4 encodeObject:v6 forKey:@"pluginSectionViewModels"];

  id v7 = [(RMUIConfigurationViewModels *)self pluginViewModels];
  [v4 encodeObject:v7 forKey:@"pluginViewModels"];
}

- (RMUIConfigurationViewModels)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RMUIConfigurationViewModels;
  v5 = [(RMUIConfigurationViewModels *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"profileViewModels"];
    profileViewModels = v5->_profileViewModels;
    v5->_profileViewModels = (NSArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pluginSectionViewModels"];
    pluginSectionViewModels = v5->_pluginSectionViewModels;
    v5->_pluginSectionViewModels = (NSArray *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"pluginViewModels"];
    pluginViewModels = v5->_pluginViewModels;
    v5->_pluginViewModels = (NSArray *)v19;
  }
  return v5;
}

- (NSArray)profileViewModels
{
  return self->_profileViewModels;
}

- (NSArray)pluginSectionViewModels
{
  return self->_pluginSectionViewModels;
}

- (NSArray)pluginViewModels
{
  return self->_pluginViewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginViewModels, 0);
  objc_storeStrong((id *)&self->_pluginSectionViewModels, 0);

  objc_storeStrong((id *)&self->_profileViewModels, 0);
}

@end
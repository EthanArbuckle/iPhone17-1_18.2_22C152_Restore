@interface RMUIPluginSectionViewModel
+ (BOOL)supportsSecureCoding;
+ (id)newPluginSectionViewModelWithHeading:(id)a3 viewModels:(id)a4;
- (NSArray)viewModels;
- (NSString)heading;
- (RMUIPluginSectionViewModel)initWithCoder:(id)a3;
- (RMUIPluginSectionViewModel)initWithHeading:(id)a3 viewModels:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setHeading:(id)a3;
- (void)setViewModels:(id)a3;
@end

@implementation RMUIPluginSectionViewModel

+ (id)newPluginSectionViewModelWithHeading:(id)a3 viewModels:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[RMUIPluginSectionViewModel alloc] initWithHeading:v6 viewModels:v5];

  return v7;
}

- (RMUIPluginSectionViewModel)initWithHeading:(id)a3 viewModels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMUIPluginSectionViewModel;
  v9 = [(RMUIPluginSectionViewModel *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heading, a3);
    objc_storeStrong((id *)&v10->_viewModels, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMUIPluginSectionViewModel *)self heading];
  [v4 encodeObject:v5 forKey:@"heading"];

  id v6 = [(RMUIPluginSectionViewModel *)self viewModels];
  [v4 encodeObject:v6 forKey:@"viewModels"];
}

- (RMUIPluginSectionViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RMUIPluginSectionViewModel;
  id v5 = [(RMUIPluginSectionViewModel *)&v15 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"heading"];
    heading = v5->_heading;
    v5->_heading = (NSString *)v7;

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"viewModels"];
    viewModels = v5->_viewModels;
    v5->_viewModels = (NSArray *)v12;
  }
  return v5;
}

- (NSString)heading
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setHeading:(id)a3
{
}

- (NSArray)viewModels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);

  objc_storeStrong((id *)&self->_heading, 0);
}

@end
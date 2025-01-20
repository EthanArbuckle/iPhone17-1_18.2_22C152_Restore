@interface RMUIInteractiveProfileFooterViewModel
+ (BOOL)supportsSecureCoding;
- (NSString)title;
- (RMUIInteractiveProfileFooterViewModel)initWithCoder:(id)a3;
- (void)clearModel;
- (void)encodeWithCoder:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation RMUIInteractiveProfileFooterViewModel

- (void)clearModel
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(RMUIInteractiveProfileFooterViewModel *)self title];
  [v4 encodeObject:v5 forKey:@"title"];
}

- (RMUIInteractiveProfileFooterViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RMUIInteractiveProfileFooterViewModel;
  id v5 = [(RMUIInteractiveProfileFooterViewModel *)&v10 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;
  }
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
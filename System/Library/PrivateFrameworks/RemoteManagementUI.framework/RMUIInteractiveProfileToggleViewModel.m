@interface RMUIInteractiveProfileToggleViewModel
+ (BOOL)supportsSecureCoding;
- (BOOL)toggleState;
- (NSString)title;
- (RMUIInteractiveProfileToggleViewModel)initWithCoder:(id)a3;
- (void)clearModel;
- (void)encodeWithCoder:(id)a3;
- (void)setTitle:(id)a3;
- (void)setToggleState:(BOOL)a3;
@end

@implementation RMUIInteractiveProfileToggleViewModel

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
  v5 = [(RMUIInteractiveProfileToggleViewModel *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  objc_msgSend(NSNumber, "numberWithBool:", -[RMUIInteractiveProfileToggleViewModel toggleState](self, "toggleState"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"toggleState"];
}

- (RMUIInteractiveProfileToggleViewModel)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RMUIInteractiveProfileToggleViewModel;
  v5 = [(RMUIInteractiveProfileToggleViewModel *)&v11 init];
  if (v5)
  {
    id v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"toggleState"];
    v5->_toggleState = [v9 BOOLValue];
  }
  return v5;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTitle:(id)a3
{
}

- (BOOL)toggleState
{
  return self->_toggleState;
}

- (void)setToggleState:(BOOL)a3
{
  self->_toggleState = a3;
}

- (void).cxx_destruct
{
}

@end
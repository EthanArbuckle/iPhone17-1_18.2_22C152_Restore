@interface SFUIBarButtonItemPopoverSourceInfo
- (NSString)description;
- (SFUIBarButtonItemPopoverSourceInfo)initWithItem:(id)a3;
- (UIBarButtonItem)barButtonItem;
@end

@implementation SFUIBarButtonItemPopoverSourceInfo

- (SFUIBarButtonItemPopoverSourceInfo)initWithItem:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFUIBarButtonItemPopoverSourceInfo;
  v6 = [(SFUIBarButtonItemPopoverSourceInfo *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_item, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p item = %@>", v5, self, self->_item];;

  return (NSString *)v6;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_item;
}

- (void).cxx_destruct
{
}

@end
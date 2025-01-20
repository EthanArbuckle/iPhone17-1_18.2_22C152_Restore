@interface SBHTestFakeWidgetIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_isValidWithError:(id *)a3;
- (NSString)sizeClass;
- (SBHCustomIconElement)element;
- (SBHTestFakeWidgetIconDescriptor)init;
- (SBHTestFakeWidgetIconDescriptor)initWithElement:(id)a3 sizeClass:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sbh_iconDescriptorType;
@end

@implementation SBHTestFakeWidgetIconDescriptor

- (SBHTestFakeWidgetIconDescriptor)initWithElement:(id)a3 sizeClass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHTestFakeWidgetIconDescriptor;
  v9 = [(SBHTestFakeWidgetIconDescriptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_element, a3);
    objc_storeStrong((id *)&v10->_sizeClass, a4);
  }

  return v10;
}

- (SBHTestFakeWidgetIconDescriptor)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  element = self->_element;
  sizeClass = self->_sizeClass;
  return (id)[v4 initWithElement:element sizeClass:sizeClass];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHTestFakeWidgetIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    id v7 = [(SBHTestFakeWidgetIconDescriptor *)v6 element];
    if ([v7 isEqual:self->_element])
    {
      id v8 = [(SBHTestFakeWidgetIconDescriptor *)v6 sizeClass];
      if (v8 == self->_sizeClass)
      {
        char v10 = 1;
      }
      else
      {
        v9 = [(SBHTestFakeWidgetIconDescriptor *)v6 sizeClass];
        char v10 = [v9 isEqualToString:self->_sizeClass];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return self->_element != 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 2;
}

- (SBHCustomIconElement)element
{
  return self->_element;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_element, 0);
}

@end
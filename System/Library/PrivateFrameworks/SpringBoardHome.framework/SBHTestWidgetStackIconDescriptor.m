@interface SBHTestWidgetStackIconDescriptor
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_isValidWithError:(id *)a3;
- (NSArray)widgetIconDescriptors;
- (NSString)sizeClass;
- (SBHTestWidgetStackIconDescriptor)init;
- (SBHTestWidgetStackIconDescriptor)initWithWidgetIconDescriptors:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sbh_iconDescriptorType;
@end

@implementation SBHTestWidgetStackIconDescriptor

- (SBHTestWidgetStackIconDescriptor)initWithWidgetIconDescriptors:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHTestWidgetStackIconDescriptor;
  v5 = [(SBHTestWidgetStackIconDescriptor *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
    widgetIconDescriptors = v5->_widgetIconDescriptors;
    v5->_widgetIconDescriptors = (NSArray *)v6;

    v8 = [v4 firstObject];
    uint64_t v9 = [v8 sizeClass];
    sizeClass = v5->_sizeClass;
    v5->_sizeClass = (NSString *)v9;
  }
  return v5;
}

- (SBHTestWidgetStackIconDescriptor)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  widgetIconDescriptors = self->_widgetIconDescriptors;
  return (id)[v4 initWithWidgetIconDescriptors:widgetIconDescriptors];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHTestWidgetStackIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v7 = [(SBHTestWidgetStackIconDescriptor *)v6 widgetIconDescriptors];
    int v8 = [v7 isEqualToArray:self->_widgetIconDescriptors];

    if (v8)
    {
      uint64_t v9 = [(SBHTestWidgetStackIconDescriptor *)v6 sizeClass];
      v10 = [(SBHTestWidgetStackIconDescriptor *)self sizeClass];
      BOOL v11 = v9 == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 3;
}

- (NSArray)widgetIconDescriptors
{
  return self->_widgetIconDescriptors;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_widgetIconDescriptors, 0);
}

@end
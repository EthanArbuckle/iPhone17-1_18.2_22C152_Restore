@interface SBHTestWidgetIconDescriptor
+ (id)widgetIconDescriptorFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)sbh_isValidWithError:(id *)a3;
- (NSString)bundleIdentifier;
- (NSString)containerBundleIdentifier;
- (NSString)sizeClass;
- (NSString)widgetIdentifier;
- (SBHTestWidgetIconDescriptor)init;
- (SBHTestWidgetIconDescriptor)initWithBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 widgetIdentifier:(id)a5 sizeClass:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)sbh_iconDescriptorType;
@end

@implementation SBHTestWidgetIconDescriptor

+ (id)widgetIconDescriptorFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"containerBundleIdentifier"];
  v5 = [v3 objectForKeyedSubscript:@"bundleIdentifier"];
  v6 = [v3 objectForKeyedSubscript:@"widgetIdentifier"];
  v7 = [v3 objectForKeyedSubscript:@"gridSize"];

  v8 = [SBHTestWidgetIconDescriptor alloc];
  v9 = SBHIconGridSizeClassForString(v7);
  v10 = [(SBHTestWidgetIconDescriptor *)v8 initWithBundleIdentifier:v5 containerBundleIdentifier:v4 widgetIdentifier:v6 sizeClass:v9];

  return v10;
}

- (SBHTestWidgetIconDescriptor)initWithBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 widgetIdentifier:(id)a5 sizeClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBHTestWidgetIconDescriptor;
  v14 = [(SBHTestWidgetIconDescriptor *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    widgetIdentifier = v14->_widgetIdentifier;
    v14->_widgetIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_sizeClass, a6);
  }

  return v14;
}

- (SBHTestWidgetIconDescriptor)init
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  bundleIdentifier = self->_bundleIdentifier;
  containerBundleIdentifier = self->_containerBundleIdentifier;
  widgetIdentifier = self->_widgetIdentifier;
  sizeClass = self->_sizeClass;
  return (id)[v4 initWithBundleIdentifier:bundleIdentifier containerBundleIdentifier:containerBundleIdentifier widgetIdentifier:widgetIdentifier sizeClass:sizeClass];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHTestWidgetIconDescriptor *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(SBHTestWidgetIconDescriptor *)v6 bundleIdentifier];
    if ([v7 isEqualToString:self->_bundleIdentifier])
    {
      v8 = [(SBHTestWidgetIconDescriptor *)v6 containerBundleIdentifier];
      if ([v8 isEqualToString:self->_containerBundleIdentifier])
      {
        v9 = [(SBHTestWidgetIconDescriptor *)v6 widgetIdentifier];
        if ([v9 isEqualToString:self->_widgetIdentifier])
        {
          id v10 = [(SBHTestWidgetIconDescriptor *)v6 sizeClass];
          if (v10 == self->_sizeClass)
          {
            char v12 = 1;
          }
          else
          {
            id v11 = [(SBHTestWidgetIconDescriptor *)v6 sizeClass];
            char v12 = [v11 isEqualToString:self->_sizeClass];
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)sbh_isValidWithError:(id *)a3
{
  return 0;
}

- (unint64_t)sbh_iconDescriptorType
{
  return 2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
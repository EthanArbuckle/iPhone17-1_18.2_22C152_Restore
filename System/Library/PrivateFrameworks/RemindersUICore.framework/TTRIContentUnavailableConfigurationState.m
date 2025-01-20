@interface TTRIContentUnavailableConfigurationState
+ (Class)implClass;
- (NSString)searchControllerText;
- (TTRIContentUnavailableConfigurationState)initWithTraitCollection:(id)a3;
- (UITraitCollection)traitCollection;
- (id)asUIKit;
- (id)customStateForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setCustomState:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setSearchControllerText:(id)a3;
@end

@implementation TTRIContentUnavailableConfigurationState

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (NSString)searchControllerText
{
  v2 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  v3 = [v2 searchControllerText];

  return (NSString *)v3;
}

- (void)setSearchControllerText:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  [v5 setSearchControllerText:v4];
}

- (TTRIContentUnavailableConfigurationState)initWithTraitCollection:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4FB1660];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithTraitCollection:v5];

  v7 = [(id)objc_opt_class() instanceWrappingImpl:v6];

  return v7;
}

- (UITraitCollection)traitCollection
{
  v2 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  v3 = [v2 traitCollection];

  return (UITraitCollection *)v3;
}

- (id)customStateForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  v6 = [v5 customStateForKey:v4];

  return v6;
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  [v8 setCustomState:v7 forKey:v6];
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TTRIContentUnavailableConfigurationState *)self asUIKit];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

@end
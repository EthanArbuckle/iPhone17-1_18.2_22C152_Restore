@interface IMTraitCollectionConfigurationPredicate
+ (id)predicateWithTraitCollection:(id)a3;
- (BOOL)evaluateWithContext:(id)a3;
- (UITraitCollection)traitCollection;
- (void)setTraitCollection:(id)a3;
@end

@implementation IMTraitCollectionConfigurationPredicate

+ (id)predicateWithTraitCollection:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IMTraitCollectionConfigurationPredicate);
  [(IMTraitCollectionConfigurationPredicate *)v4 setTraitCollection:v3];

  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  v4 = [a3 traitCollection];
  v5 = [(IMTraitCollectionConfigurationPredicate *)self traitCollection];
  unsigned __int8 v6 = [v4 containsTraitsInCollection:v5];

  return v6;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (void)setTraitCollection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
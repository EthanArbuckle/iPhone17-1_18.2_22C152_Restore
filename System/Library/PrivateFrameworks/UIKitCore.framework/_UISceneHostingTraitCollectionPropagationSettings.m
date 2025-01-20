@interface _UISceneHostingTraitCollectionPropagationSettings
+ (id)protocol;
- (UIColor)tintColor;
- (UITraitCollection)traitCollection;
- (void)setTintColor:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation _UISceneHostingTraitCollectionPropagationSettings

+ (id)protocol
{
  return &unk_1ED5F4E30;
}

- (void)setTraitCollection:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(_UISceneHostingTraitCollectionPropagationSettings *)self setValue:v5 forProperty:a2];
}

- (UITraitCollection)traitCollection
{
  v2 = [(_UISceneHostingTraitCollectionPropagationSettings *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  v3 = +[UITraitCollection bs_secureDecodedFromData:v2];

  return (UITraitCollection *)v3;
}

- (void)setTintColor:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9B8], "bs_secureDataFromObject:", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(_UISceneHostingTraitCollectionPropagationSettings *)self setValue:v5 forProperty:a2];
}

- (UIColor)tintColor
{
  v2 = [(_UISceneHostingTraitCollectionPropagationSettings *)self valueForProperty:a2 expectedClass:objc_opt_class()];
  v3 = +[UIColor bs_secureDecodedFromData:v2];

  return (UIColor *)v3;
}

@end
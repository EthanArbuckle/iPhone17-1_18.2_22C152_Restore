@interface WFiTunesArtistContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)getListSubtitle:(id)a3;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFiTunesArtistContentItem

- (BOOL)getListSubtitle:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6 = [(WFiTunesObjectContentItem *)self object];
    v7 = [v6 genre];
    (*((void (**)(id, void *))a3 + 2))(v5, v7);
  }
  return 1;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    v10 = (void *)MEMORY[0x1E4F5A9A0];
    v11 = [(WFiTunesArtistContentItem *)self name];
    v9 = [v10 object:v11];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFiTunesArtistContentItem;
    v9 = [(WFiTunesObjectContentItem *)&v13 generateObjectRepresentationForClass:a3 options:v8 error:a5];
  }

  return v9;
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d iTunes artists");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"iTunes artists", @"iTunes artists");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"iTunes artist", @"iTunes artist");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F5AA90];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x1E4F5A860];
  id v3 = [a1 propertyForName:@"Name"];
  v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F5A880];
  id v3 = WFLocalizedContentPropertyNameMarker(@"Genre");
  v4 = [v2 keyPath:@"object.genre" name:v3 class:objc_opt_class()];
  v10[0] = v4;
  id v5 = (void *)MEMORY[0x1E4F5A880];
  v6 = WFLocalizedContentPropertyNameMarker(@"Type");
  v7 = [v5 keyPath:@"object.type" name:v6 class:objc_opt_class()];
  v10[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

@end
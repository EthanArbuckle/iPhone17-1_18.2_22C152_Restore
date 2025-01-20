@interface VUIMediaCollectionsToRecentlyAddedToMediaCollectionsValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)transformedValue:(id)a3;
@end

@implementation VUIMediaCollectionsToRecentlyAddedToMediaCollectionsValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB3C98];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithDateForEntityBlock:&__block_literal_global_68];
  [v5 setMaxEntities:20];
  v6 = [v5 transformedValue:v4];

  return v6;
}

uint64_t __89__VUIMediaCollectionsToRecentlyAddedToMediaCollectionsValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addedToDate];
}

@end
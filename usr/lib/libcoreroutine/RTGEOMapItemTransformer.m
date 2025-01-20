@interface RTGEOMapItemTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation RTGEOMapItemTransformer

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
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F34DEB78])
  {
    v4 = [MEMORY[0x1E4F646E0] mapItemStorageForGEOMapItem:v3];
    v5 = [v4 data];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F646E0]) initWithData:v3];
  }
  else {
    v4 = 0;
  }

  return v4;
}

@end
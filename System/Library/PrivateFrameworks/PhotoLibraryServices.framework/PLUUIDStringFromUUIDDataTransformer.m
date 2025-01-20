@interface PLUUIDStringFromUUIDDataTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation PLUUIDStringFromUUIDDataTransformer

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length] == 16)
  {
    v4 = (objc_class *)MEMORY[0x1E4F8BA08];
    id v5 = v3;
    v6 = (void *)[[v4 alloc] initWithUUIDData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_class();
    if (v4 == objc_opt_class()) {
      [v3 UUIDData];
    }
    else {
    id v5 = PLUUIDDataFromString();
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end
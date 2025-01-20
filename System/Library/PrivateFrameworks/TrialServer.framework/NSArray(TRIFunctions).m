@interface NSArray(TRIFunctions)
- (id)tri_contains:()TRIFunctions;
- (id)tri_intersects:()TRIFunctions;
@end

@implementation NSArray(TRIFunctions)

- (id)tri_intersects:()TRIFunctions
{
  v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithArray:a1];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];

  v8 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v6, "intersectsSet:", v7));
  return v8;
}

- (id)tri_contains:()TRIFunctions
{
  v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithArray:a1];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v5];

  v8 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", objc_msgSend(v7, "isSubsetOfSet:", v6));
  return v8;
}

@end
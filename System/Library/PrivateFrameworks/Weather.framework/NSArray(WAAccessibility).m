@interface NSArray(WAAccessibility)
+ (id)waaxArrayByIgnoringNilElementsWithCount:()WAAccessibility;
@end

@implementation NSArray(WAAccessibility)

+ (id)waaxArrayByIgnoringNilElementsWithCount:()WAAccessibility
{
  uint64_t v9 = a3;
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:a3];
  for (i = &a9; v9; --v9)
  {
    v11 = i++;
    if (*v11) {
      objc_msgSend(v10, "addObject:");
    }
  }
  v12 = (void *)[v10 copy];

  return v12;
}

@end
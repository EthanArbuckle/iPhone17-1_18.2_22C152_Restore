@interface NSArray(UIRemovalAdditions)
- (id)ui_arrayByRemovingLastObjectEqualTo:()UIRemovalAdditions;
@end

@implementation NSArray(UIRemovalAdditions)

- (id)ui_arrayByRemovingLastObjectEqualTo:()UIRemovalAdditions
{
  CFIndex v5 = [a1 count];
  v12.location = 0;
  v12.length = v5;
  CFIndex LastIndexOfValue = CFArrayGetLastIndexOfValue((CFArrayRef)a1, v12, a3);
  if (LastIndexOfValue != -1)
  {
    CFIndex v7 = LastIndexOfValue;
    v8 = objc_msgSend(a1, "subarrayWithRange:", 0, LastIndexOfValue);
    if (v5 != v7 + 1) {
      v8 = objc_msgSend(v8, "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "subarrayWithRange:", v7 + 1, v5 - (v7 + 1)));
    }
    if (v8) {
      return v8;
    }
  }
  id v10 = a1;
  return v10;
}

@end
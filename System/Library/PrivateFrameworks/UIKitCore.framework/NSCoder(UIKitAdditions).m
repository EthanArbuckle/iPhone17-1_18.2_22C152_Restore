@interface NSCoder(UIKitAdditions)
- (id)_ui_decodeTextAttributesForKey:()UIKitAdditions;
- (uint64_t)_ui_decodeBoolForKey:()UIKitAdditions defaultValue:;
- (uint64_t)_ui_isInterprocess;
- (void)_ui_encodeTextAttributes:()UIKitAdditions forKey:;
@end

@implementation NSCoder(UIKitAdditions)

- (uint64_t)_ui_isInterprocess
{
  return objc_opt_isKindOfClass() & 1;
}

- (uint64_t)_ui_decodeBoolForKey:()UIKitAdditions defaultValue:
{
  id v6 = a3;
  if ([a1 containsValueForKey:v6]) {
    a4 = [a1 decodeBoolForKey:v6];
  }

  return a4;
}

- (void)_ui_encodeTextAttributes:()UIKitAdditions forKey:
{
  if (a3)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F28B18];
    id v7 = a4;
    id v8 = a3;
    id v9 = (id)[[v6 alloc] initWithString:@" " attributes:v8];

    [a1 encodeObject:v9 forKey:v7];
  }
}

- (id)_ui_decodeTextAttributesForKey:()UIKitAdditions
{
  id v4 = a3;
  v5 = [a1 decodeObjectOfClass:objc_opt_class() forKey:v4];

  id v6 = [v5 attributesAtIndex:0 effectiveRange:0];

  return v6;
}

@end
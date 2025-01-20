@interface NSUserDefaults(PDSKVStore)
- (id)numberForKey:()PDSKVStore;
@end

@implementation NSUserDefaults(PDSKVStore)

- (id)numberForKey:()PDSKVStore
{
  v1 = objc_msgSend(a1, "objectForKey:");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

@end
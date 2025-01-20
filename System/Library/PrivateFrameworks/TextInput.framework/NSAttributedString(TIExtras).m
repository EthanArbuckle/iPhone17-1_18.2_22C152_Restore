@interface NSAttributedString(TIExtras)
- (id)_UIKBStringWideAttributeValueForKey:()TIExtras;
@end

@implementation NSAttributedString(TIExtras)

- (id)_UIKBStringWideAttributeValueForKey:()TIExtras
{
  id v4 = a3;
  if ([a1 length])
  {
    uint64_t v5 = [a1 length];
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v6 = [a1 attribute:v4 atIndex:0 effectiveRange:&v12];
    v7 = (void *)v6;
    if (v5 == v13 && v12 == 0) {
      v9 = (void *)v6;
    }
    else {
      v9 = 0;
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end
@interface NSString(ICAttributedString)
- (id)ic_attributedStringByAppendingAttributedString:()ICAttributedString;
@end

@implementation NSString(ICAttributedString)

- (id)ic_attributedStringByAppendingAttributedString:()ICAttributedString
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:a1];
  v6 = objc_msgSend(v5, "ic_attributedStringByAppendingAttributedString:", v4);

  return v6;
}

@end
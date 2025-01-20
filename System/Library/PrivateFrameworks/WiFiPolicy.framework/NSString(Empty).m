@interface NSString(Empty)
- (BOOL)isEmpty;
@end

@implementation NSString(Empty)

- (BOOL)isEmpty
{
  return objc_msgSend((id)objc_msgSend(a1, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet")), "length") == 0;
}

@end
@interface NSError(WebKitInternal)
- (uint64_t)_webkit_initWithDomain:()WebKitInternal code:URL:;
@end

@implementation NSError(WebKitInternal)

- (uint64_t)_webkit_initWithDomain:()WebKitInternal code:URL:
{
  v9 = objc_msgSend((id)descriptions, "objectForKey:");
  uint64_t v10 = objc_msgSend(v9, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", a4));
  v11 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v12 = [a5 absoluteString];
  uint64_t v13 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", a5, @"NSErrorFailingURLKey", v12, *MEMORY[0x1E4F289C0], v10, *MEMORY[0x1E4F28568], 0);
  return [a1 initWithDomain:a3 code:(int)a4 userInfo:v13];
}

@end
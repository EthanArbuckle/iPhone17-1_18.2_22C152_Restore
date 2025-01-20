@interface NSString
- (id)__stringByStrippingAttachmentAndControlCharacters;
- (id)__stringByStrippingControlCharacters;
- (id)bd_stringByRemovingURLEscapes;
- (id)stringByRemovingCharactersFromSet:(id)a3;
- (id)trimmedString;
- (unsigned)unsignedIntValue;
@end

@implementation NSString

- (unsigned)unsignedIntValue
{
  v2 = [(NSString *)self trimmedString];
  unsigned int v3 = [v2 longLongValue];

  return v3;
}

- (id)trimmedString
{
  v2 = (__CFString *)[(NSString *)self mutableCopy];
  CFStringTrimWhitespace(v2);
  id v3 = [(__CFString *)v2 copy];

  return v3;
}

- (id)__stringByStrippingControlCharacters
{
  id v3 = sub_10000A4EC();
  v4 = [(NSString *)self stringByRemovingCharactersFromSet:v3];
  v5 = v4;
  if (!v4) {
    v4 = &stru_1000E5260;
  }
  v6 = v4;

  return v6;
}

- (id)__stringByStrippingAttachmentAndControlCharacters
{
  if (qword_1000EE078 != -1) {
    dispatch_once(&qword_1000EE078, &stru_1000E04E8);
  }
  id v3 = [(NSString *)self stringByRemovingCharactersFromSet:qword_1000EE070];
  v4 = v3;
  if (!v3) {
    id v3 = &stru_1000E5260;
  }
  v5 = v3;

  return v5;
}

- (id)stringByRemovingCharactersFromSet:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSString *)self length];
  if (v5 << 32
    && (v12.length = (int)v5,
        v12.location = 0,
        CFStringFindCharacterFromSet((CFStringRef)self, (CFCharacterSetRef)v4, v12, 0, 0)))
  {
    id v6 = objc_alloc_init((Class)NSMutableString);
    if ([(NSString *)self length])
    {
      unint64_t v7 = 0;
      do
      {
        uint64_t v8 = [(NSString *)self characterAtIndex:v7];
        if (([v4 characterIsMember:v8] & 1) == 0) {
          objc_msgSend(v6, "appendFormat:", @"%C", v8);
        }
        ++v7;
      }
      while (v7 < [(NSString *)self length]);
    }
    v9 = (NSString *)[v6 copy];
  }
  else
  {
    v9 = self;
  }

  return v9;
}

- (id)bd_stringByRemovingURLEscapes
{
  v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, (CFStringRef)self, &stru_1000E5260);

  return v2;
}

@end
@interface NSData(PKDataAdditions)
+ (id)dataWithCGImage:()PKDataAdditions;
+ (id)dataWithHexEncodedString:()PKDataAdditions;
- (BOOL)hasPDFMIMEType;
- (id)SHA1Hash;
- (id)SHA256Hash;
- (id)URLBase64EncodedString;
- (id)fileSafeBase64Encoding;
- (id)hexEncoding;
@end

@implementation NSData(PKDataAdditions)

- (id)SHA256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];
  return v2;
}

- (id)fileSafeBase64Encoding
{
  id v1 = [a1 base64EncodedStringWithOptions:0];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

  return v2;
}

- (id)SHA1Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:20];
  return v2;
}

- (id)hexEncoding
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v3 = [a1 length];
  uint64_t v4 = [a1 bytes];
  if (v3)
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", @"%02x", v6);
      --v3;
    }
    while (v3);
  }
  return v2;
}

+ (id)dataWithHexEncodedString:()PKDataAdditions
{
  id v3 = a3;
  __str[2] = 0;
  uint64_t v4 = malloc_type_malloc((unint64_t)[v3 length] >> 1, 0xC0B863EAuLL);
  if ([v3 length])
  {
    unint64_t v5 = 0;
    unsigned int v6 = v4;
    do
    {
      __str[0] = [v3 characterAtIndex:v5];
      __str[1] = [v3 characterAtIndex:v5 + 1];
      v9 = 0;
      *v6++ = strtol(__str, &v9, 16);
      v5 += 2;
    }
    while (v5 < [v3 length]);
  }
  v7 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v4, (unint64_t)objc_msgSend(v3, "length") >> 1, 1);

  return v7;
}

+ (id)dataWithCGImage:()PKDataAdditions
{
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  unint64_t v5 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)[(id)*MEMORY[0x1E4F44460] identifier], 1uLL, 0);
  CGImageDestinationAddImage(v5, a3, 0);
  unsigned int v6 = 0;
  if (CGImageDestinationFinalize(v5))
  {
    unsigned int v6 = [MEMORY[0x1E4F1C9B8] dataWithData:Mutable];
  }
  CFRelease(Mutable);
  CFRelease(v5);
  return v6;
}

- (BOOL)hasPDFMIMEType
{
  char v2 = 0;
  [a1 getBytes:&v2 length:1];
  return v2 == 37;
}

- (id)URLBase64EncodedString
{
  id v1 = [a1 base64EncodedStringWithOptions:0];
  char v2 = [v1 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  id v3 = [v2 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  return v3;
}

@end
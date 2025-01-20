@interface NSData(Base64)
+ (id)dataFromBase64String:()Base64;
- (id)base64EncodedString;
@end

@implementation NSData(Base64)

+ (id)dataFromBase64String:()Base64
{
  [a3 dataUsingEncoding:1];
  uint64_t v7 = 0;
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = NewBase64Decode((char *)[v3 bytes], objc_msgSend(v3, "length"), &v7);
  v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:v7];
  free(v4);

  return v5;
}

- (id)base64EncodedString
{
  uint64_t v6 = 0;
  id v1 = a1;
  v2 = NewBase64Encode([v1 bytes], objc_msgSend(v1, "length"), 0, &v6);
  id v3 = [NSString alloc];
  v4 = (void *)[v3 initWithBytes:v2 length:v6 encoding:1];
  free(v2);

  return v4;
}

@end
@interface NSData(Base64)
+ (id)dataWithBase64:()Base64;
@end

@implementation NSData(Base64)

+ (id)dataWithBase64:()Base64
{
  v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
}

@end
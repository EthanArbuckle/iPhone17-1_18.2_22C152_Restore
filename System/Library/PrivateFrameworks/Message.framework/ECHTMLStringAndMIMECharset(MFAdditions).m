@interface ECHTMLStringAndMIMECharset(MFAdditions)
+ (id)mf_utf8HTMLStringWithString:()MFAdditions;
@end

@implementation ECHTMLStringAndMIMECharset(MFAdditions)

+ (id)mf_utf8HTMLStringWithString:()MFAdditions
{
  id v4 = a3;
  id v5 = [a1 alloc];
  v6 = [MEMORY[0x1E4F73528] charsetForEncoding:134217984];
  v7 = (void *)[v5 initWithString:v4 charset:v6];

  return v7;
}

@end
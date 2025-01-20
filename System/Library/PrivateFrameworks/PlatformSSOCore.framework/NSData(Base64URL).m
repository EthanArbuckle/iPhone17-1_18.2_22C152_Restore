@interface NSData(Base64URL)
- (id)psso_base64URLEncodedString;
- (id)psso_initWithBase64URLEncodedString:()Base64URL;
@end

@implementation NSData(Base64URL)

- (id)psso_base64URLEncodedString
{
  v1 = [a1 base64EncodedStringWithOptions:0];
  v2 = [v1 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];

  v3 = [v2 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

  v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"="];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (id)psso_initWithBase64URLEncodedString:()Base64URL
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 length] & 3;
    v6 = &stru_2707C1488;
    if (v5 == 2) {
      v6 = @"==";
    }
    if (v5 == 3) {
      v7 = @"=";
    }
    else {
      v7 = v6;
    }
    v8 = [v4 stringByReplacingOccurrencesOfString:@"-" withString:@"+"];

    v9 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

    v10 = [v9 stringByAppendingString:v7];

    v11 = (void *)[a1 initWithBase64EncodedString:v10 options:0];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end
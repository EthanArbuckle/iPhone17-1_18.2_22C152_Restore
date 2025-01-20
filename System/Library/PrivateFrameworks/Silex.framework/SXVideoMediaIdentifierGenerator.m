@interface SXVideoMediaIdentifierGenerator
- (id)identifierForURL:(id)a3;
@end

@implementation SXVideoMediaIdentifierGenerator

- (id)identifierForURL:(id)a3
{
  v3 = [a3 absoluteString];
  v4 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  if ([v5 length])
  {
    v6 = objc_msgSend(v5, "nf_sha1");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
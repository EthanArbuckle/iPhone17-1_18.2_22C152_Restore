@interface SXEmailActionSerializer
- (id)URLForAction:(id)a3 type:(int64_t)a4;
@end

@implementation SXEmailActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [MEMORY[0x263F089D8] stringWithFormat:@"mailto:"];
    v6 = [v4 recipient];

    if (v6)
    {
      v7 = [v4 recipient];
      [v5 appendString:v7];
    }
    v8 = [v4 subject];

    if (v8)
    {
      v9 = [v4 subject];
      v10 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
      v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

      [v5 appendFormat:@"?subject=%@", v11];
    }
    v12 = [NSURL URLWithString:v5];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
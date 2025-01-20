@interface SXEmbedResource
- (id)expirationDateWithValue:(id)a3 withType:(int)a4;
@end

@implementation SXEmbedResource

- (id)expirationDateWithValue:(id)a3 withType:(int)a4
{
  if (a4 == 3)
  {
    v4 = (void *)MEMORY[0x263F08790];
    id v5 = a3;
    v6 = [v4 dateFormatterWithFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    v7 = [v6 dateFromString:v5];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
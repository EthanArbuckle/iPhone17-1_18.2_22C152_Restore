@interface STWatchFace
- (id)_aceContextObjectValue;
@end

@implementation STWatchFace

- (id)_aceContextObjectValue
{
  id v3 = objc_alloc_init(MEMORY[0x263F64768]);
  v4 = [(STSiriModelObject *)self identifier];
  v5 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  v7 = (void *)[[NSString alloc] initWithFormat:@"watch-face:%@", v6];
  v8 = (void *)[objc_alloc(NSURL) initWithString:v7];
  [v3 setIdentifier:v8];

  return v3;
}

@end
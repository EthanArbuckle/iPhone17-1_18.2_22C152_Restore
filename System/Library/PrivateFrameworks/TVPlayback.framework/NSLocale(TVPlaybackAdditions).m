@interface NSLocale(TVPlaybackAdditions)
- (id)tvp_subtitleLanguageCode;
@end

@implementation NSLocale(TVPlaybackAdditions)

- (id)tvp_subtitleLanguageCode
{
  v2 = [a1 objectForKey:*MEMORY[0x263EFF508]];
  v3 = [a1 objectForKey:*MEMORY[0x263EFF540]];
  v4 = objc_opt_new();
  if ([v2 length]) {
    [v4 addObject:v2];
  }
  if ([v3 length]) {
    [v4 addObject:v3];
  }
  v5 = [v4 componentsJoinedByString:@"-"];

  return v5;
}

@end
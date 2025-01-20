@interface VUIJSVideosNativeInterface
- (NSString)language;
- (id)generateHash:(id)a3;
- (id)locStringForKey:(id)a3;
- (id)locStringForKeyWithCounts:(id)a3 :(id)a4;
- (void)setLocDictionary:(id)a3;
@end

@implementation VUIJSVideosNativeInterface

- (NSString)language
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 arrayForKey:@"AppleLanguages"];

  v4 = [v3 firstObject];

  return (NSString *)v4;
}

- (id)locStringForKey:(id)a3
{
  id v3 = a3;
  v4 = +[VUILocalizationManager sharedInstance];
  v5 = [v4 localizedStringForKey:v3];

  return v5;
}

- (id)locStringForKeyWithCounts:(id)a3 :(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[VUILocalizationManager sharedInstance];
  v8 = [v7 localizedStringForKey:v6 withCounts:v5];

  return v8;
}

- (void)setLocDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[VUILocalizationManager sharedInstance];
  [v4 updateWithJSDictionary:v3];
}

- (id)generateHash:(id)a3
{
  id v3 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:0 error:0];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  id v5 = v3;
  id v6 = objc_msgSend(v4, "numberWithUnsignedLong:", crc32(0, (const Bytef *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length")));

  return v6;
}

@end
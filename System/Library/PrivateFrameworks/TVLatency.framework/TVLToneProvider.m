@interface TVLToneProvider
+ (id)provideToneWithIdentifier:(id)a3 error:(id *)a4;
+ (id)urlForResource:(id)a3;
@end

@implementation TVLToneProvider

+ (id)provideToneWithIdentifier:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x263EF9380];
  id v6 = a3;
  id v7 = [v5 alloc];
  v8 = +[TVLToneProvider urlForResource:v6];

  v9 = (void *)[v7 initForReading:v8 error:a4];

  return v9;
}

+ (id)urlForResource:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.tvlatency"];
  id v6 = [v5 pathForResource:@"Tones" ofType:@"bundle"];
  id v7 = [v3 bundleWithPath:v6];
  v8 = [v7 URLForResource:v4 withExtension:0];

  return v8;
}

@end
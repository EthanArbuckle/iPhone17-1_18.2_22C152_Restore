@interface PUError
+ (id)errorWithCode:(unint64_t)a3 description:(id)a4;
- (PUError)init;
@end

@implementation PUError

+ (id)errorWithCode:(unint64_t)a3 description:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v11 = *MEMORY[0x263F08320];
  v12[0] = a4;
  v6 = NSDictionary;
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"com.apple.pairedunlock" code:a3 userInfo:v8];

  return v9;
}

- (PUError)init
{
  return 0;
}

@end
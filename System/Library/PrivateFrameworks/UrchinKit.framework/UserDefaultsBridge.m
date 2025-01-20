@interface UserDefaultsBridge
+ (id)createWithSuiteName:(id)a3 container:(id)a4;
@end

@implementation UserDefaultsBridge

+ (id)createWithSuiteName:(id)a3 container:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFFA40];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] _initWithSuiteName:v7 container:v6];

  return v8;
}

@end
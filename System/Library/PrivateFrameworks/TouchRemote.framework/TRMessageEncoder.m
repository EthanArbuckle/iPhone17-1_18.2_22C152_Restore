@interface TRMessageEncoder
+ (id)encodeMessage:(id)a3;
@end

@implementation TRMessageEncoder

+ (id)encodeMessage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v5 encodeObject:v4 forKey:*MEMORY[0x263F081D0]];

  [v5 finishEncoding];
  v6 = [v5 encodedData];

  return v6;
}

@end
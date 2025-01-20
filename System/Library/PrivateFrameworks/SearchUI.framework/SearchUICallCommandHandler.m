@interface SearchUICallCommandHandler
- (id)defaultSymbolName;
- (id)destinationPunchout;
@end

@implementation SearchUICallCommandHandler

- (id)destinationPunchout
{
  v3 = objc_opt_new();
  [v3 setScheme:@"tel"];
  v4 = [(SearchUICommandHandler *)self command];
  v5 = [v4 phoneNumber];
  [v3 setPath:v5];

  v6 = (void *)MEMORY[0x1E4F9A2F8];
  v7 = [v3 URL];
  v8 = [v6 punchoutWithURL:v7];

  return v8;
}

- (id)defaultSymbolName
{
  return @"phone";
}

@end
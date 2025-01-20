@interface SearchUISendEmailHandler
- (id)defaultSymbolName;
- (id)destinationPunchout;
@end

@implementation SearchUISendEmailHandler

- (id)destinationPunchout
{
  v3 = objc_opt_new();
  [v3 setScheme:@"mailto"];
  v4 = [(SearchUICommandHandler *)self command];
  v5 = [v4 email];
  [v3 setPath:v5];

  v6 = (void *)MEMORY[0x1E4F9A2F8];
  v7 = [v3 URL];
  v8 = [v6 punchoutWithURL:v7];

  return v8;
}

- (id)defaultSymbolName
{
  return @"envelope";
}

@end
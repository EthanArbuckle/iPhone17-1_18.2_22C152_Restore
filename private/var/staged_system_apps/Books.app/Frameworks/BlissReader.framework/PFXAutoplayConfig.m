@interface PFXAutoplayConfig
+ (id)autoplayConfigWithState:(id)a3;
@end

@implementation PFXAutoplayConfig

+ (id)autoplayConfigWithState:(id)a3
{
  id v3 = [a3 currentHtmlStackEntry];
  v4 = (const xmlChar *)[v3 xmlValueForAttribute:PFXWidgetConstantDataAutoplay[0]];
  if (v4) {
    BOOL v5 = xmlStrEqual(v4, (const xmlChar *)"yes") != 0;
  }
  else {
    BOOL v5 = 0;
  }
  v6 = [[THWAutoplayConfig alloc] initWithAutoplayEnabled:v5];

  return v6;
}

@end
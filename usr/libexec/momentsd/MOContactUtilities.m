@interface MOContactUtilities
+ (id)cNContactIdentifierFromPPContactIdentifier:(id)a3;
@end

@implementation MOContactUtilities

+ (id)cNContactIdentifierFromPPContactIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"CN:"])
  {
    v4 = [v3 substringFromIndex:@"CN:".length];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
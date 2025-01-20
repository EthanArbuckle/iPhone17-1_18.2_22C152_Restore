@interface PFXValidatedElementReader
- (BOOL)isParentValid:(id)a3;
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFXValidatedElementReader

- (BOOL)mapStartElementWithState:(id)a3
{
  id v4 = [a3 currentXmlStackEntry];

  return [(PFXValidatedElementReader *)self isParentValid:v4];
}

- (BOOL)isParentValid:(id)a3
{
  return 0;
}

@end
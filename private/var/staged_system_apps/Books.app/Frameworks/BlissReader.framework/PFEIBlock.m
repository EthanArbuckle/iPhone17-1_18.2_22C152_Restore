@interface PFEIBlock
- (BOOL)mapStartElementWithState:(id)a3;
@end

@implementation PFEIBlock

- (BOOL)mapStartElementWithState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFEIBlock;
  BOOL v4 = -[PFXBlock mapStartElementWithState:](&v6, "mapStartElementWithState:");
  [a3 setCfiPathForCurrentStorage];
  return v4;
}

@end
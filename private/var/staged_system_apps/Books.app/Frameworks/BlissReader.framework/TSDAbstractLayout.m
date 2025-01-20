@interface TSDAbstractLayout
- (id)firstTarget;
- (id)lastTarget;
- (id)nextTargetFromLayout:(id)a3 column:(id)a4;
- (id)previousTargetFromLayout:(id)a3 column:(id)a4;
@end

@implementation TSDAbstractLayout

- (id)nextTargetFromLayout:(id)a3 column:(id)a4
{
  id v5 = [[self navigableLayouts:a3, a4] tsu_objectAfterObjectIdenticalTo:a3];
  if (!v5 || (id result = [v5 firstTarget]) == 0)
  {
    id v7 = [(TSDAbstractLayout *)self parent];
    return [v7 nextTargetFromLayout:self column:0];
  }
  return result;
}

- (id)firstTarget
{
  id v2 = [self navigableLayouts].firstObject;

  return [v2 firstTarget];
}

- (id)previousTargetFromLayout:(id)a3 column:(id)a4
{
  id v5 = [self navigableLayouts:a3, a4 tsu_objectBeforeObjectIdenticalTo:a3];
  if (!v5 || (id result = [v5 lastTarget]) == 0)
  {
    id v7 = [(TSDAbstractLayout *)self parent];
    return [v7 previousTargetFromLayout:self column:0];
  }
  return result;
}

- (id)lastTarget
{
  id v2 = [[-[TSDAbstractLayout navigableLayouts](self, "navigableLayouts")] lastObject];

  return [v2 lastTarget];
}

@end
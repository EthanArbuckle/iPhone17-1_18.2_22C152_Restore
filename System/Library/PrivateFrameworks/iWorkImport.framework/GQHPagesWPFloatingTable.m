@interface GQHPagesWPFloatingTable
+ (int)beginCells:(id)a3 state:(id)a4;
+ (int)beginTable:(id)a3 state:(id)a4;
+ (int)endCells:(id)a3 state:(id)a4;
+ (int)endTable:(id)a3 state:(id)a4;
+ (int)handleCell:(id)a3 state:(id)a4;
@end

@implementation GQHPagesWPFloatingTable

+ (int)beginTable:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)endTable:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)beginCells:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)endCells:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)handleCell:(id)a3 state:(id)a4
{
  return 1;
}

@end
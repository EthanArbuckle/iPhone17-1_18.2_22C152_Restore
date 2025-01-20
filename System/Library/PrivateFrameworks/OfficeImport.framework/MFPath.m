@interface MFPath
- (BOOL)isOpen;
- (CGPoint)currentPoint;
- (id)copyWithZone:(_NSZone *)a3;
- (int)abort;
- (int)begin;
- (int)closeFigure;
- (int)end;
- (int)fill:(id)a3;
- (int)flatten;
- (int)state;
- (int)stroke:(id)a3;
- (int)widen:(id)a3;
@end

@implementation MFPath

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (int)state
{
  return 0;
}

- (BOOL)isOpen
{
  return 0;
}

- (int)begin
{
  return -1;
}

- (int)end
{
  return -1;
}

- (int)abort
{
  return -1;
}

- (CGPoint)currentPoint
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.y = v3;
  result.x = v2;
  return result;
}

- (int)closeFigure
{
  return -1;
}

- (int)flatten
{
  return -1;
}

- (int)widen:(id)a3
{
  return -1;
}

- (int)stroke:(id)a3
{
  return -1;
}

- (int)fill:(id)a3
{
  return -1;
}

@end
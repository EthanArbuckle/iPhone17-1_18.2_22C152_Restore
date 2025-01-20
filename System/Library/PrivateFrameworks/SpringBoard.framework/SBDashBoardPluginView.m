@interface SBDashBoardPluginView
- (CGRect)presentationRegion;
- (id)presentationRegions;
- (void)setPresentationRegion:(CGRect)a3;
@end

@implementation SBDashBoardPluginView

- (id)presentationRegions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [(SBDashBoardPluginView *)self presentationRegion];
  double x = v12.origin.x;
  double y = v12.origin.y;
  double width = v12.size.width;
  double height = v12.size.height;
  if (CGRectEqualToRect(v12, *MEMORY[0x1E4F1DB28]))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(MEMORY[0x1E4F5E468], "regionForCoordinateSpace:withExtent:", self, x, y, width, height);
    v10[0] = v8;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  return v7;
}

- (CGRect)presentationRegion
{
  double x = self->_presentationRegion.origin.x;
  double y = self->_presentationRegion.origin.y;
  double width = self->_presentationRegion.size.width;
  double height = self->_presentationRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationRegion:(CGRect)a3
{
  self->_presentationRegion = a3;
}

@end
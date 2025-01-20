@interface SBIconDragPlaceholderIconViewController
- (BOOL)isEditing;
- (BOOL)showsSquareCorners;
- (CGRect)visibleBounds;
- (SBIconImageInfo)iconImageInfo;
- (double)continuousCornerRadius;
- (void)setEditing:(BOOL)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
@end

@implementation SBIconDragPlaceholderIconViewController

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  self->iconImageInfo.size.width = v3;
  self->iconImageInfo.size.height = v4;
  self->iconImageInfo.scale = v5;
  self->iconImageInfo.continuousCornerRadius = v6;
}

- (BOOL)isEditing
{
  return self->editing;
}

- (void)setEditing:(BOOL)a3
{
  self->editing = a3;
}

- (BOOL)showsSquareCorners
{
  return self->showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->showsSquareCorners = a3;
}

- (double)continuousCornerRadius
{
  return self->continuousCornerRadius;
}

- (CGRect)visibleBounds
{
  double x = self->visibleBounds.origin.x;
  double y = self->visibleBounds.origin.y;
  double width = self->visibleBounds.size.width;
  double height = self->visibleBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end
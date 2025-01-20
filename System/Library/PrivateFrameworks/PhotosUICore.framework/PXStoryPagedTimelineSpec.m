@interface PXStoryPagedTimelineSpec
- (BOOL)displayOneAssetPerPage;
- (CGSize)keyPageSize;
- (CGSize)regularPageSize;
- (double)keyInterpageSpacing;
- (double)regularInterpageSpacing;
- (id)description;
- (void)setDisplayOneAssetPerPage:(BOOL)a3;
- (void)setKeyInterpageSpacing:(double)a3;
- (void)setKeyPageSize:(CGSize)a3;
- (void)setRegularInterpageSpacing:(double)a3;
- (void)setRegularPageSize:(CGSize)a3;
@end

@implementation PXStoryPagedTimelineSpec

- (void)setDisplayOneAssetPerPage:(BOOL)a3
{
  self->_displayOneAssetPerPage = a3;
}

- (BOOL)displayOneAssetPerPage
{
  return self->_displayOneAssetPerPage;
}

- (void)setKeyInterpageSpacing:(double)a3
{
  self->_keyInterpageSpacing = a3;
}

- (double)keyInterpageSpacing
{
  return self->_keyInterpageSpacing;
}

- (void)setRegularInterpageSpacing:(double)a3
{
  self->_regularInterpageSpacing = a3;
}

- (double)regularInterpageSpacing
{
  return self->_regularInterpageSpacing;
}

- (void)setKeyPageSize:(CGSize)a3
{
  self->_keyPageSize = a3;
}

- (CGSize)keyPageSize
{
  double width = self->_keyPageSize.width;
  double height = self->_keyPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRegularPageSize:(CGSize)a3
{
  self->_regularPageSize = a3;
}

- (CGSize)regularPageSize
{
  double width = self->_regularPageSize.width;
  double height = self->_regularPageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CGSize regularPageSize = self->_regularPageSize;
  CGSize keyPageSize = self->_keyPageSize;
  double regularInterpageSpacing = self->_regularInterpageSpacing;
  double keyInterpageSpacing = self->_keyInterpageSpacing;
  if (self->_displayOneAssetPerPage) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = v7;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; regularPageSize={%g, %g}; keyPageSize={%g, %g}; regularInterpageSpacing=%g; keyInterpageSpacing=%g; displayOneAssetPerPage=%@>",
    v4,
    self,
    regularPageSize,
    keyPageSize,
    *(void *)&regularInterpageSpacing,
    *(void *)&keyInterpageSpacing,
  v9 = v8);

  return v9;
}

@end
@interface PXTimelineDataSourceOptions
- (BOOL)includeAssets;
- (BOOL)includeSuggestions;
- (CGSize)widgetSize;
- (PXTimelineDataSourceOptions)initWithMemoriesOnly;
- (id)initForWidgetWithSize:(CGSize)a3;
- (void)setIncludeAssets:(BOOL)a3;
- (void)setIncludeSuggestions:(BOOL)a3;
- (void)setWidgetSize:(CGSize)a3;
@end

@implementation PXTimelineDataSourceOptions

- (void)setIncludeAssets:(BOOL)a3
{
  self->_includeAssets = a3;
}

- (BOOL)includeAssets
{
  return self->_includeAssets;
}

- (void)setIncludeSuggestions:(BOOL)a3
{
  self->_includeSuggestions = a3;
}

- (BOOL)includeSuggestions
{
  return self->_includeSuggestions;
}

- (void)setWidgetSize:(CGSize)a3
{
  self->_widgetSize = a3;
}

- (CGSize)widgetSize
{
  double width = self->_widgetSize.width;
  double height = self->_widgetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXTimelineDataSourceOptions)initWithMemoriesOnly
{
  v3.receiver = self;
  v3.super_class = (Class)PXTimelineDataSourceOptions;
  CGSize result = [(PXTimelineDataSourceOptions *)&v3 init];
  if (result)
  {
    result->_widgetSize = (CGSize)*MEMORY[0x1E4F1DB30];
    *(_WORD *)&result->_includeSuggestions = 0;
  }
  return result;
}

- (id)initForWidgetWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)PXTimelineDataSourceOptions;
  id result = [(PXTimelineDataSourceOptions *)&v6 init];
  if (result)
  {
    *((CGFloat *)result + 2) = width;
    *((CGFloat *)result + 3) = height;
    *((_WORD *)result + 4) = 257;
  }
  return result;
}

@end
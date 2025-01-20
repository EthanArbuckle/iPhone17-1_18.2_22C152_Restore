@interface PXEditorialSectionBodyLayout
- (BOOL)disableClipping;
- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize;
- (CGRect)sectionRect;
- (void)setDisableClipping:(BOOL)a3;
@end

@implementation PXEditorialSectionBodyLayout

- (void)setDisableClipping:(BOOL)a3
{
  self->_disableClipping = a3;
}

- (BOOL)disableClipping
{
  return self->_disableClipping;
}

- (BOOL)disableDebugAssertionForAnchorUpdatesWithZeroContentSize
{
  return 1;
}

- (CGRect)sectionRect
{
  if ([(PXEditorialSectionBodyLayout *)self disableClipping])
  {
    double v3 = *MEMORY[0x1E4F1DB20];
    double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXEditorialSectionBodyLayout;
    [(PXDayAssetsSectionBodyLayout *)&v7 sectionRect];
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

@end
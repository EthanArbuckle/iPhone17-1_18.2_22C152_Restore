@interface PXStoryConcreteTimelineSpec
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration;
- (BOOL)isEqual:(id)a3;
- (CGSize)viewportSize;
- (NSIndexSet)allowedTransitionKinds;
- (PXStoryConcreteTimelineSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (UIEdgeInsets)safeAreaInsets;
- (char)fallbackTransitionKind;
- (double)nUpDividerWidth;
- (int64_t)layoutDirection;
- (unint64_t)allowedInlineTitles;
- (unint64_t)hash;
- (unint64_t)storyTransitionCurveType;
- (void)setAllowedInlineTitles:(unint64_t)a3;
- (void)setAllowedTransitionKinds:(id)a3;
- (void)setFallbackTransitionKind:(char)a3;
- (void)setFixedSegmentDuration:(id *)a3;
- (void)setStoryTransitionCurveType:(unint64_t)a3;
@end

@implementation PXStoryConcreteTimelineSpec

- (void).cxx_destruct
{
}

- (void)setStoryTransitionCurveType:(unint64_t)a3
{
  self->_storyTransitionCurveType = a3;
}

- (unint64_t)storyTransitionCurveType
{
  return self->_storyTransitionCurveType;
}

- (void)setFallbackTransitionKind:(char)a3
{
  self->_fallbackTransitionKind = a3;
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (void)setAllowedTransitionKinds:(id)a3
{
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (void)setFixedSegmentDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_fixedSegmentDuration.value = *(_OWORD *)&a3->var0;
  self->_fixedSegmentDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (void)setAllowedInlineTitles:(unint64_t)a3
{
  self->_allowedInlineTitles = a3;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (double)nUpDividerWidth
{
  return self->_nUpDividerWidth;
}

- (UIEdgeInsets)safeAreaInsets
{
  double top = self->_safeAreaInsets.top;
  double left = self->_safeAreaInsets.left;
  double bottom = self->_safeAreaInsets.bottom;
  double right = self->_safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)viewportSize
{
  double width = self->_viewportSize.width;
  double height = self->_viewportSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)hash
{
  [(PXStoryConcreteTimelineSpec *)self viewportSize];
  uint64_t v5 = (uint64_t)v3 ^ (2 * (uint64_t)v4);
  [(PXStoryConcreteTimelineSpec *)self fixedSegmentDuration];
  uint64_t v6 = v5 ^ (4 * v11);
  v7 = [(PXStoryConcreteTimelineSpec *)self allowedTransitionKinds];
  uint64_t v8 = v6 ^ (8 * [v7 hash]);

  uint64_t v9 = v8 ^ (16 * [(PXStoryConcreteTimelineSpec *)self fallbackTransitionKind]);
  return v9 ^ (32 * [(PXStoryConcreteTimelineSpec *)self storyTransitionCurveType]);
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (PXStoryConcreteTimelineSpec *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      [(PXStoryConcreteTimelineSpec *)self viewportSize];
      double v7 = v6;
      double v9 = v8;
      [(PXStoryConcreteTimelineSpec *)v5 viewportSize];
      if (v7 == v11 && v9 == v10)
      {
        [(PXStoryConcreteTimelineSpec *)self safeAreaInsets];
        [(PXStoryConcreteTimelineSpec *)v5 safeAreaInsets];
        PXEdgeInsetsEqualToEdgeInsets();
      }
      BOOL v13 = 0;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (PXStoryConcreteTimelineSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryConcreteTimelineSpec;
  double v7 = [(PXFeatureSpec *)&v17 initWithExtendedTraitCollection:v6 options:a4];
  double v8 = v7;
  if (v7)
  {
    p_viewportSize = &v7->_viewportSize;
    [v6 layoutReferenceSize];
    *(void *)&p_viewportSize->double width = v10;
    v8->_viewportSize.double height = v11;
    [v6 peripheryInsets];
    v8->_safeAreaInsets.double top = v12;
    v8->_safeAreaInsets.double left = v13;
    v8->_safeAreaInsets.double bottom = v14;
    v8->_safeAreaInsets.double right = v15;
    PXSizeIsValid();
  }

  return 0;
}

@end
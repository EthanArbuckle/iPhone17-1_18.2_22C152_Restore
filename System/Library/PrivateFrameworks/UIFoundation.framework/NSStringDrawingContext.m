@interface NSStringDrawingContext
- (BOOL)cachesLayout;
- (BOOL)drawsDebugBaselines;
- (BOOL)hasTruncatedRanges;
- (BOOL)usesSimpleTextEffects;
- (BOOL)wantsBaselineOffset;
- (BOOL)wantsMultilineDeviceMetrics;
- (BOOL)wantsNumberOfLineFragments;
- (BOOL)wantsScaledBaselineOffset;
- (BOOL)wantsScaledLineHeight;
- (BOOL)wrapsForTruncationMode;
- (CGFloat)actualScaleFactor;
- (CGFloat)actualTrackingAdjustment;
- (CGFloat)minimumScaleFactor;
- (CGFloat)minimumTrackingAdjustment;
- (CGRect)multilineDeviceMetricsRect;
- (CGRect)totalBounds;
- (CUICatalog)cuiCatalog;
- (CUIStyleEffectConfiguration)cuiStyleEffects;
- (NSString)description;
- (NSStringDrawingContext)init;
- (double)baselineOffset;
- (double)firstBaselineOffset;
- (double)scaledBaselineOffset;
- (double)scaledLineHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)layout;
- (id)layoutManager:(id)a3 linkAttributesForAttributes:(id)a4 forCharacterAtIndex:(unint64_t)a5;
- (id)linkTextAttributesProvider;
- (int64_t)applicationFrameworkContext;
- (unint64_t)activeRenderers;
- (unint64_t)maximumNumberOfLines;
- (unint64_t)numberOfLineFragments;
- (void)dealloc;
- (void)setActiveRenderers:(unint64_t)a3;
- (void)setActualScaleFactor:(double)a3;
- (void)setActualTrackingAdjustment:(double)a3;
- (void)setApplicationFrameworkContext:(int64_t)a3;
- (void)setBaselineOffset:(double)a3;
- (void)setCachesLayout:(BOOL)a3;
- (void)setCuiCatalog:(id)a3;
- (void)setCuiStyleEffects:(id)a3;
- (void)setDrawsDebugBaselines:(BOOL)a3;
- (void)setFirstBaselineOffset:(double)a3;
- (void)setHasTruncatedRanges:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setLinkTextAttributesProvider:(id)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor;
- (void)setMinimumTrackingAdjustment:(CGFloat)minimumTrackingAdjustment;
- (void)setMultilineDeviceMetricsRect:(CGRect)a3;
- (void)setNumberOfLineFragments:(unint64_t)a3;
- (void)setScaledBaselineOffset:(double)a3;
- (void)setScaledLineHeight:(double)a3;
- (void)setTotalBounds:(CGRect)a3;
- (void)setUsesSimpleTextEffects:(BOOL)a3;
- (void)setWantsBaselineOffset:(BOOL)a3;
- (void)setWantsMultilineDeviceMetrics:(BOOL)a3;
- (void)setWantsNumberOfLineFragments:(BOOL)a3;
- (void)setWantsScaledBaselineOffset:(BOOL)a3;
- (void)setWantsScaledLineHeight:(BOOL)a3;
- (void)setWrapsForTruncationMode:(BOOL)a3;
@end

@implementation NSStringDrawingContext

- (double)firstBaselineOffset
{
  return self->_firstBaselineOffset;
}

- (double)scaledLineHeight
{
  return self->_scaledLineHeight;
}

- (CGFloat)actualScaleFactor
{
  return self->_actualScaleFactor;
}

- (void)setLayout:(id)a3
{
}

- (id)layout
{
  return self->_layout;
}

- (BOOL)cachesLayout
{
  return (*(_WORD *)&self->_sdcFlags >> 7) & 1;
}

- (BOOL)hasTruncatedRanges
{
  return self->_hasTruncatedRanges;
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (BOOL)wrapsForTruncationMode
{
  return (*(_WORD *)&self->_sdcFlags >> 1) & 1;
}

- (void)setTotalBounds:(CGRect)a3
{
  self->_totalBounds = a3;
}

- (BOOL)wantsBaselineOffset
{
  return (*(_WORD *)&self->_sdcFlags >> 2) & 1;
}

- (void)setNumberOfLineFragments:(unint64_t)a3
{
  self->_numberOfLineFragments = a3;
}

- (unint64_t)activeRenderers
{
  return ((unint64_t)*(_WORD *)&self->_sdcFlags >> 9) & 0xF;
}

- (BOOL)wantsMultilineDeviceMetrics
{
  return (*(_WORD *)&self->_sdcFlags >> 6) & 1;
}

- (void)setActiveRenderers:(unint64_t)a3
{
  *(_WORD *)&self->_sdcFlags = *(_WORD *)&self->_sdcFlags & 0xE1FF | ((a3 & 0xF) << 9);
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

- (void)setFirstBaselineOffset:(double)a3
{
  self->_firstBaselineOffset = a3;
}

- (int64_t)applicationFrameworkContext
{
  return (unint64_t)*(_WORD *)&self->_sdcFlags >> 13;
}

- (void)setActualScaleFactor:(double)a3
{
  self->_actualScaleFactor = a3;
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  self->_maximumNumberOfLines = a3;
}

- (BOOL)drawsDebugBaselines
{
  return (*(_WORD *)&self->_sdcFlags >> 5) & 1;
}

- (void)setHasTruncatedRanges:(BOOL)a3
{
  self->_hasTruncatedRanges = a3;
}

- (void)setCachesLayout:(BOOL)a3
{
  __int16 sdcFlags = (__int16)self->_sdcFlags;
  if (((((sdcFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      __int16 v4 = 128;
    }
    else {
      __int16 v4 = 0;
    }
    *(_WORD *)&self->___int16 sdcFlags = sdcFlags & 0xFF7F | v4;
    [(NSStringDrawingContext *)self setLayout:0];
  }
}

- (void)setWantsBaselineOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFB | v3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (CGFloat)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setScaledLineHeight:(double)a3
{
  self->_scaledLineHeight = a3;
}

- (void)setScaledBaselineOffset:(double)a3
{
  self->_scaledBaselineOffset = a3;
}

- (NSStringDrawingContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSStringDrawingContext;
  v2 = [(NSStringDrawingContext *)&v4 init];
  if (v2) {
    [(NSStringDrawingContext *)v2 setApplicationFrameworkContext:_NSTextScalingTypeForCurrentEnvironment()];
  }
  return v2;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  if (!a3) {
    LOWORD(a3) = _NSTextScalingTypeForCurrentEnvironment();
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0x1FFF | ((_WORD)a3 << 13);
}

- (BOOL)wantsScaledLineHeight
{
  return (*(_WORD *)&self->_sdcFlags >> 4) & 1;
}

- (BOOL)wantsScaledBaselineOffset
{
  return (*(_WORD *)&self->_sdcFlags >> 3) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[NSStringDrawingContext allocWithZone:a3] init];
  [(NSStringDrawingContext *)self minimumScaleFactor];
  -[NSStringDrawingContext setMinimumScaleFactor:](v4, "setMinimumScaleFactor:");
  [(NSStringDrawingContext *)self minimumTrackingAdjustment];
  -[NSStringDrawingContext setMinimumTrackingAdjustment:](v4, "setMinimumTrackingAdjustment:");
  [(NSStringDrawingContext *)v4 setWantsNumberOfLineFragments:[(NSStringDrawingContext *)self wantsNumberOfLineFragments]];
  [(NSStringDrawingContext *)v4 setWrapsForTruncationMode:[(NSStringDrawingContext *)self wrapsForTruncationMode]];
  [(NSStringDrawingContext *)v4 setMaximumNumberOfLines:[(NSStringDrawingContext *)self maximumNumberOfLines]];
  [(NSStringDrawingContext *)v4 setWantsBaselineOffset:[(NSStringDrawingContext *)self wantsBaselineOffset]];
  [(NSStringDrawingContext *)v4 setWantsScaledBaselineOffset:[(NSStringDrawingContext *)self wantsScaledBaselineOffset]];
  [(NSStringDrawingContext *)v4 setWantsScaledLineHeight:[(NSStringDrawingContext *)self wantsScaledLineHeight]];
  [(NSStringDrawingContext *)v4 setDrawsDebugBaselines:[(NSStringDrawingContext *)self drawsDebugBaselines]];
  [(NSStringDrawingContext *)v4 setCachesLayout:[(NSStringDrawingContext *)self cachesLayout]];
  [(NSStringDrawingContext *)v4 setLayout:[(NSStringDrawingContext *)self layout]];
  [(NSStringDrawingContext *)v4 setCuiCatalog:[(NSStringDrawingContext *)self cuiCatalog]];
  [(NSStringDrawingContext *)v4 setCuiStyleEffects:[(NSStringDrawingContext *)self cuiStyleEffects]];
  [(NSStringDrawingContext *)v4 setUsesSimpleTextEffects:[(NSStringDrawingContext *)self usesSimpleTextEffects]];
  [(NSStringDrawingContext *)v4 setApplicationFrameworkContext:[(NSStringDrawingContext *)self applicationFrameworkContext]];
  [(NSStringDrawingContext *)v4 setLinkTextAttributesProvider:[(NSStringDrawingContext *)self linkTextAttributesProvider]];
  [(NSStringDrawingContext *)v4 setWantsMultilineDeviceMetrics:[(NSStringDrawingContext *)self wantsMultilineDeviceMetrics]];
  [(NSStringDrawingContext *)self multilineDeviceMetricsRect];
  -[NSStringDrawingContext setMultilineDeviceMetricsRect:](v4, "setMultilineDeviceMetricsRect:");
  return v4;
}

- (void)setWantsNumberOfLineFragments:(BOOL)a3
{
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFE | a3;
}

- (void)setWrapsForTruncationMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFFD | v3;
}

- (void)setCuiStyleEffects:(id)a3
{
}

- (void)setMinimumScaleFactor:(CGFloat)minimumScaleFactor
{
  self->_minimumScaleFactor = minimumScaleFactor;
}

- (void)setLinkTextAttributesProvider:(id)a3
{
}

- (BOOL)wantsNumberOfLineFragments
{
  return *(_WORD *)&self->_sdcFlags & 1;
}

- (void)setWantsScaledLineHeight:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFEF | v3;
}

- (void)setWantsScaledBaselineOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFF7 | v3;
}

- (void)setMinimumTrackingAdjustment:(CGFloat)minimumTrackingAdjustment
{
  self->_minimumTrackingAdjustment = minimumTrackingAdjustment;
}

- (CGFloat)minimumTrackingAdjustment
{
  return self->_minimumTrackingAdjustment;
}

- (BOOL)usesSimpleTextEffects
{
  return HIBYTE(*(_WORD *)&self->_sdcFlags) & 1;
}

- (void)setWantsMultilineDeviceMetrics:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFBF | v3;
}

- (void)setUsesSimpleTextEffects:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFEFF | v3;
}

- (void)setMultilineDeviceMetricsRect:(CGRect)a3
{
  self->_multilineDeviceMetricsRect = a3;
}

- (void)setDrawsDebugBaselines:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 sdcFlags = *(_WORD *)&self->_sdcFlags & 0xFFDF | v3;
}

- (void)setCuiCatalog:(id)a3
{
}

- (CGRect)multilineDeviceMetricsRect
{
  double x = self->_multilineDeviceMetricsRect.origin.x;
  double y = self->_multilineDeviceMetricsRect.origin.y;
  double width = self->_multilineDeviceMetricsRect.size.width;
  double height = self->_multilineDeviceMetricsRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)linkTextAttributesProvider
{
  return objc_getProperty(self, a2, 152, 1);
}

- (CUIStyleEffectConfiguration)cuiStyleEffects
{
  return self->_CUIStyleEffects;
}

- (CUICatalog)cuiCatalog
{
  return self->_CUICatalog;
}

- (double)scaledBaselineOffset
{
  return self->_scaledBaselineOffset;
}

- (unint64_t)numberOfLineFragments
{
  return self->_numberOfLineFragments;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSStringDrawingContext;
  [(NSStringDrawingContext *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v6.receiver = self;
  v6.super_class = (Class)NSStringDrawingContext;
  objc_super v4 = [(NSStringDrawingContext *)&v6 description];
  return (NSString *)[v3 stringWithFormat:@"%@\nminimumScaleFactor:%f minimumTrackingAdjustment:%f actualScaleFactor:%f actualTrackingAdjustment:%f totalBounds:%@", v4, *(void *)&self->_minimumScaleFactor, *(void *)&self->_minimumTrackingAdjustment, *(void *)&self->_actualScaleFactor, *(void *)&self->_actualTrackingAdjustment, NSStringFromRect(self->_totalBounds)];
}

- (id)layoutManager:(id)a3 linkAttributesForAttributes:(id)a4 forCharacterAtIndex:(unint64_t)a5
{
  id result = self->_linkTextAttributesProvider;
  if (result) {
    return (id)(*((uint64_t (**)(id, id, unint64_t))result + 2))(result, a4, a5);
  }
  return result;
}

- (CGRect)totalBounds
{
  double x = self->_totalBounds.origin.x;
  double y = self->_totalBounds.origin.y;
  double width = self->_totalBounds.size.width;
  double height = self->_totalBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGFloat)actualTrackingAdjustment
{
  return self->_actualTrackingAdjustment;
}

- (void)setActualTrackingAdjustment:(double)a3
{
  self->_actualTrackingAdjustment = a3;
}

@end
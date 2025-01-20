@interface SBHSidebarVisualConfiguration
- (BOOL)isContentFullscreen;
- (BOOL)isEqual:(id)a3;
- (NSDirectionalEdgeInsets)insets;
- (NSString)description;
- (SBHSidebarVisualConfiguration)init;
- (double)contentWidth;
- (double)effectiveContentWidthWithContainerWidth:(double)a3;
- (double)firstWidgetTopOffset;
- (double)searchBarTopOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setContentFullscreen:(BOOL)a3;
- (void)setContentWidth:(double)a3;
- (void)setFirstWidgetTopOffset:(double)a3;
- (void)setInsets:(NSDirectionalEdgeInsets)a3;
- (void)setSearchBarTopOffset:(double)a3;
@end

@implementation SBHSidebarVisualConfiguration

- (SBHSidebarVisualConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBHSidebarVisualConfiguration;
  result = [(SBHSidebarVisualConfiguration *)&v3 init];
  if (result) {
    result->_contentWidth = 400.0;
  }
  return result;
}

- (double)effectiveContentWidthWithContainerWidth:(double)a3
{
  if ([(SBHSidebarVisualConfiguration *)self isContentFullscreen])
  {
    [(SBHSidebarVisualConfiguration *)self insets];
    return a3 - v5 - v6;
  }
  else
  {
    [(SBHSidebarVisualConfiguration *)self contentWidth];
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    long long v5 = *(_OWORD *)&self->_insets.top;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_insets.bottom;
    *(_OWORD *)((char *)result + 40) = v5;
    *((void *)result + 2) = *(void *)&self->_contentWidth;
    *((unsigned char *)result + 8) = self->_contentFullscreen;
    *((void *)result + 3) = *(void *)&self->_searchBarTopOffset;
    *((void *)result + 4) = *(void *)&self->_firstWidgetTopOffset;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBHSidebarVisualConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7 = v4;
      BOOL v8 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v7->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v7->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_contentWidth == v7->_contentWidth&& self->_contentFullscreen == v7->_contentFullscreen&& self->_searchBarTopOffset == v7->_searchBarTopOffset&& self->_firstWidgetTopOffset == v7->_firstWidgetTopOffset;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  double contentWidth = self->_contentWidth;
  CGFloat v3 = self->_insets.top + self->_insets.leading + self->_insets.bottom + self->_insets.trailing + contentWidth;
  LOBYTE(contentWidth) = self->_contentFullscreen;
  return (unint64_t)(self->_firstWidgetTopOffset
                          + self->_searchBarTopOffset
                          + v3
                          + (double)*(unint64_t *)&contentWidth);
}

- (NSString)description
{
  return (NSString *)[(SBHSidebarVisualConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHSidebarVisualConfiguration *)self succinctDescriptionBuilder];
  CGFloat v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  CGFloat v3 = [(SBHSidebarVisualConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBHSidebarVisualConfiguration *)self succinctDescriptionBuilder];
  [(SBHSidebarVisualConfiguration *)self contentWidth];
  id v5 = (id)objc_msgSend(v4, "appendFloat:withName:", @"contentWidth");
  [(SBHSidebarVisualConfiguration *)self searchBarTopOffset];
  id v6 = (id)objc_msgSend(v4, "appendFloat:withName:", @"searchBarTopOffset");
  [(SBHSidebarVisualConfiguration *)self firstWidgetTopOffset];
  id v7 = (id)objc_msgSend(v4, "appendFloat:withName:", @"firstWidgetTopOffset");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBHSidebarVisualConfiguration isContentFullscreen](self, "isContentFullscreen"), @"isContentFullscreen");
  v9 = NSStringFromDirectionalEdgeInsets(self->_insets);
  [v4 appendString:v9 withName:@"insets"];

  return v4;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (void)setContentWidth:(double)a3
{
  self->_double contentWidth = a3;
}

- (double)searchBarTopOffset
{
  return self->_searchBarTopOffset;
}

- (void)setSearchBarTopOffset:(double)a3
{
  self->_searchBarTopOffset = a3;
}

- (double)firstWidgetTopOffset
{
  return self->_firstWidgetTopOffset;
}

- (void)setFirstWidgetTopOffset:(double)a3
{
  self->_firstWidgetTopOffset = a3;
}

- (BOOL)isContentFullscreen
{
  return self->_contentFullscreen;
}

- (void)setContentFullscreen:(BOOL)a3
{
  self->_contentFullscreen = a3;
}

- (NSDirectionalEdgeInsets)insets
{
  double top = self->_insets.top;
  double leading = self->_insets.leading;
  double bottom = self->_insets.bottom;
  double trailing = self->_insets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setInsets:(NSDirectionalEdgeInsets)a3
{
  self->_insets = a3;
}

@end
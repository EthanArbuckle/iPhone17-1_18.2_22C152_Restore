@interface SXComponentBlueprint
+ (BOOL)supportsSecureCoding;
- (BOOL)hasValidLayout;
- (BOOL)hasValidPosition;
- (BOOL)hasValidSize;
- (BOOL)isHidden;
- (CGRect)absoluteFrame;
- (CGRect)backgroundViewFrame;
- (CGRect)componentViewFrame;
- (CGRect)contentFrame;
- (CGRect)contentViewFrame;
- (CGRect)frame;
- (CGSize)suggestedSizeAfterInvalidation;
- (NSDictionary)infoFromLayouting;
- (SXComponent)component;
- (SXComponentBlueprint)initWithComponent:(id)a3 componentLayout:(id)a4 componentSizer:(id)a5;
- (SXComponentLayout)componentLayout;
- (SXComponentSizer)componentSizer;
- (SXComponentState)componentState;
- (SXLayoutBlueprint)parentLayoutBlueprint;
- (SXLayoutBlueprint)rootLayoutBlueprint;
- (UIEdgeInsets)borderInsets;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)layoutMargins;
- (_NSRange)columnRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)invalidateLayout;
- (void)invalidatePosition;
- (void)invalidateSize;
- (void)setAbsoluteFrame:(CGRect)a3;
- (void)setBackgroundViewFrame:(CGRect)a3;
- (void)setBorderInsets:(UIEdgeInsets)a3;
- (void)setColumnRange:(_NSRange)a3;
- (void)setComponentState:(id)a3;
- (void)setComponentViewFrame:(CGRect)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentViewFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setParentLayoutBlueprint:(id)a3;
- (void)setSuggestedSizeAfterInvalidation:(CGSize)a3;
- (void)storeInformationForRenderingPhase:(id)a3;
- (void)updatePosition:(CGPoint)a3;
- (void)updateSize:(CGSize)a3;
@end

@implementation SXComponentBlueprint

- (SXComponentBlueprint)initWithComponent:(id)a3 componentLayout:(id)a4 componentSizer:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SXComponentBlueprint;
  v12 = [(SXComponentBlueprint *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_component, a3);
    objc_storeStrong((id *)&v13->_componentLayout, a4);
    objc_storeStrong((id *)&v13->_componentSizer, a5);
    CGSize v14 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v13->_frame.origin = (CGPoint)*MEMORY[0x263F001A8];
    v13->_frame.size = v14;
    v13->_columnRange.location = [v10 columnRange];
    v13->_columnRange.length = v15;
    uint64_t v16 = objc_opt_new();
    componentState = v13->_componentState;
    v13->_componentState = (SXComponentState *)v16;
  }
  return v13;
}

- (void)updateSize:(CGSize)a3
{
  self->_frame.size = a3;
  self->_hasValidSize = 1;
}

- (void)updatePosition:(CGPoint)a3
{
  self->_frame.origin = a3;
  self->_hasValidPosition = 1;
}

- (BOOL)hasValidLayout
{
  return self->_hasValidPosition && self->_hasValidSize || self->_hidden;
}

- (SXLayoutBlueprint)rootLayoutBlueprint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  v3 = [WeakRetained parentLayoutBlueprint];

  if (v3)
  {
    do
    {
      v4 = [WeakRetained parentLayoutBlueprint];

      v5 = [v4 parentLayoutBlueprint];

      id WeakRetained = v4;
    }
    while (v5);
  }
  else
  {
    v4 = WeakRetained;
  }
  return (SXLayoutBlueprint *)v4;
}

- (void)invalidateLayout
{
  [(SXComponentBlueprint *)self invalidateSize];
  [(SXComponentBlueprint *)self invalidatePosition];
}

- (void)invalidatePosition
{
  if (self) {
    self->_hasValidPosition = 0;
  }
}

- (void)invalidateSize
{
  if (self) {
    self->_hasValidSize = 0;
  }
}

- (void)storeInformationForRenderingPhase:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong((id *)(v4 + 16), self->_component);
  objc_storeStrong((id *)(v4 + 40), self->_componentLayout);
  objc_storeStrong((id *)(v4 + 32), self->_componentSizer);
  long long v5 = *(_OWORD *)&self->_contentInsets.bottom;
  *(_OWORD *)(v4 + 128) = *(_OWORD *)&self->_contentInsets.top;
  *(_OWORD *)(v4 + 144) = v5;
  long long v6 = *(_OWORD *)&self->_layoutMargins.bottom;
  *(_OWORD *)(v4 + 160) = *(_OWORD *)&self->_layoutMargins.top;
  *(_OWORD *)(v4 + 176) = v6;
  objc_storeStrong((id *)(v4 + 56), self->_infoFromLayouting);
  *(_NSRange *)(v4 + 64) = self->_columnRange;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  objc_storeWeak((id *)(v4 + 48), WeakRetained);

  *(unsigned char *)(v4 + 8) = self->_hasValidSize;
  *(unsigned char *)(v4 + 9) = self->_hasValidPosition;
  CGSize size = self->_frame.size;
  *(CGPoint *)(v4 + 96) = self->_frame.origin;
  *(CGSize *)(v4 + 112) = size;
  CGSize v9 = self->_absoluteFrame.size;
  *(CGPoint *)(v4 + 224) = self->_absoluteFrame.origin;
  *(CGSize *)(v4 + 240) = v9;
  CGSize v10 = self->_componentViewFrame.size;
  *(CGPoint *)(v4 + 256) = self->_componentViewFrame.origin;
  *(CGSize *)(v4 + 272) = v10;
  CGSize v11 = self->_contentViewFrame.size;
  *(CGPoint *)(v4 + 288) = self->_contentViewFrame.origin;
  *(CGSize *)(v4 + 304) = v11;
  CGSize v12 = self->_contentFrame.size;
  *(CGPoint *)(v4 + 320) = self->_contentFrame.origin;
  *(CGSize *)(v4 + 336) = v12;
  *(CGSize *)(v4 + 80) = self->_suggestedSizeAfterInvalidation;
  objc_storeStrong((id *)(v4 + 24), self->_componentState);
  long long v13 = *(_OWORD *)&self->_borderInsets.bottom;
  *(_OWORD *)(v4 + 192) = *(_OWORD *)&self->_borderInsets.top;
  *(_OWORD *)(v4 + 208) = v13;
  CGSize v14 = self->_backgroundViewFrame.size;
  *(CGPoint *)(v4 + 352) = self->_backgroundViewFrame.origin;
  *(CGSize *)(v4 + 368) = v14;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v18 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v3);
  [(SXComponentBlueprint *)self frame];
  uint64_t v16 = NSStringFromCGRect(v22);
  BOOL v15 = [(SXComponentBlueprint *)self hasValidPosition];
  BOOL v4 = [(SXComponentBlueprint *)self hasValidSize];
  BOOL v5 = [(SXComponentBlueprint *)self hasValidLayout];
  long long v6 = [(SXComponentBlueprint *)self component];
  uint64_t v7 = objc_opt_class();
  v8 = [(SXComponentBlueprint *)self component];
  CGSize v9 = [v8 identifier];
  CGSize v10 = [(SXComponentBlueprint *)self componentLayout];
  v20.location = [v10 columnRange];
  CGSize v11 = NSStringFromRange(v20);
  v21.location = [(SXComponentBlueprint *)self columnRange];
  CGSize v12 = NSStringFromRange(v21);
  objc_msgSend(v18, "stringWithFormat:", @"<%@: %p; frame: %@; hasValidPosition: %d; hasValidSize: %d; hasValidLayout: %d, component: %@, identifier: %@, columnRange: %@, convertedColumnRange: %@>",
    v17,
    self,
    v16,
    v15,
    v4,
    v5,
    v7,
    v9,
    v11,
  long long v13 = v12);

  return v13;
}

- (SXComponent)component
{
  return self->_component;
}

- (SXComponentState)componentState
{
  return self->_componentState;
}

- (void)setComponentState:(id)a3
{
}

- (SXComponentSizer)componentSizer
{
  return self->_componentSizer;
}

- (SXComponentLayout)componentLayout
{
  return self->_componentLayout;
}

- (SXLayoutBlueprint)parentLayoutBlueprint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentLayoutBlueprint);
  return (SXLayoutBlueprint *)WeakRetained;
}

- (void)setParentLayoutBlueprint:(id)a3
{
}

- (_NSRange)columnRange
{
  NSUInteger length = self->_columnRange.length;
  NSUInteger location = self->_columnRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->_columnRange = a3;
}

- (BOOL)hasValidSize
{
  return self->_hasValidSize;
}

- (BOOL)hasValidPosition
{
  return self->_hasValidPosition;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)layoutMargins
{
  double top = self->_layoutMargins.top;
  double left = self->_layoutMargins.left;
  double bottom = self->_layoutMargins.bottom;
  double right = self->_layoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  self->_layoutMargins = a3;
}

- (UIEdgeInsets)borderInsets
{
  double top = self->_borderInsets.top;
  double left = self->_borderInsets.left;
  double bottom = self->_borderInsets.bottom;
  double right = self->_borderInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBorderInsets:(UIEdgeInsets)a3
{
  self->_borderInsets = a3;
}

- (CGRect)absoluteFrame
{
  double x = self->_absoluteFrame.origin.x;
  double y = self->_absoluteFrame.origin.y;
  double width = self->_absoluteFrame.size.width;
  double height = self->_absoluteFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAbsoluteFrame:(CGRect)a3
{
  self->_absoluteFrame = a3;
}

- (CGRect)componentViewFrame
{
  double x = self->_componentViewFrame.origin.x;
  double y = self->_componentViewFrame.origin.y;
  double width = self->_componentViewFrame.size.width;
  double height = self->_componentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setComponentViewFrame:(CGRect)a3
{
  self->_componentViewFrame = a3;
}

- (CGRect)contentViewFrame
{
  double x = self->_contentViewFrame.origin.x;
  double y = self->_contentViewFrame.origin.y;
  double width = self->_contentViewFrame.size.width;
  double height = self->_contentViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentViewFrame:(CGRect)a3
{
  self->_contentViewFrame = a3;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (CGRect)backgroundViewFrame
{
  double x = self->_backgroundViewFrame.origin.x;
  double y = self->_backgroundViewFrame.origin.y;
  double width = self->_backgroundViewFrame.size.width;
  double height = self->_backgroundViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundViewFrame:(CGRect)a3
{
  self->_backgroundViewFrame = a3;
}

- (CGSize)suggestedSizeAfterInvalidation
{
  double width = self->_suggestedSizeAfterInvalidation.width;
  double height = self->_suggestedSizeAfterInvalidation.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSuggestedSizeAfterInvalidation:(CGSize)a3
{
  self->_suggestedSizeAfterInvalidation = a3;
}

- (NSDictionary)infoFromLayouting
{
  return self->_infoFromLayouting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoFromLayouting, 0);
  objc_destroyWeak((id *)&self->_parentLayoutBlueprint);
  objc_storeStrong((id *)&self->_componentLayout, 0);
  objc_storeStrong((id *)&self->_componentSizer, 0);
  objc_storeStrong((id *)&self->_componentState, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
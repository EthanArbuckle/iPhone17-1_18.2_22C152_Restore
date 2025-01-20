@interface SBContinuousExposeAutoLayoutItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isFullyOccluded;
- (BOOL)isInDefaultPosition;
- (BOOL)isOverlapped;
- (BOOL)isPartiallyCoveredByPeekingItem;
- (CGPoint)anchorPosition;
- (CGPoint)compactedPosition;
- (CGPoint)position;
- (CGPoint)unoccludedPeekingPosition;
- (CGSize)size;
- (SBContinuousExposeAutoLayoutItem)initWithDisplayItem:(id)a3;
- (SBDisplayItem)displayItem;
- (id)_copyWithClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)setAnchorPosition:(CGPoint)a3;
- (void)setCompactedPosition:(CGPoint)a3;
- (void)setFullyOccluded:(BOOL)a3;
- (void)setInDefaultPosition:(BOOL)a3;
- (void)setOverlapped:(BOOL)a3;
- (void)setPartiallyCoveredByPeekingItem:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setSize:(CGSize)a3;
- (void)setUnoccludedPeekingPosition:(CGPoint)a3;
@end

@implementation SBContinuousExposeAutoLayoutItem

- (SBContinuousExposeAutoLayoutItem)initWithDisplayItem:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeAutoLayoutItem;
  v7 = [(SBContinuousExposeAutoLayoutItem *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBContinuousExposeAutoLayoutItem.m", 34, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];
    }
    objc_storeStrong((id *)v7 + 2, a3);
    *(_OWORD *)(v7 + 56) = SBInvalidPoint;
  }

  return (SBContinuousExposeAutoLayoutItem *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBContinuousExposeAutoLayoutItem *)self _copyWithClass:v4];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBContinuousExposeAutoLayoutItem *)self _copyWithClass:v4];
}

- (id)_copyWithClass:(Class)a3
{
  id v4 = [a3 alloc];
  v5 = (void *)[(SBDisplayItem *)self->_displayItem copy];
  uint64_t v6 = [v4 initWithDisplayItem:v5];

  *(CGSize *)(v6 + 24) = self->_size;
  *(CGPoint *)(v6 + 40) = self->_position;
  *(CGPoint *)(v6 + 56) = self->_unoccludedPeekingPosition;
  *(CGPoint *)(v6 + 72) = self->_anchorPosition;
  *(CGPoint *)(v6 + 88) = self->_compactedPosition;
  *(unsigned char *)(v6 + 8) = self->_inDefaultPosition;
  *(unsigned char *)(v6 + 9) = self->_overlapped;
  *(unsigned char *)(v6 + 10) = self->_fullyOccluded;
  *(unsigned char *)(v6 + 11) = self->_partiallyCoveredByPeekingItem;
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBContinuousExposeAutoLayoutItem *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeAutoLayoutItem;
    if ([(SBContinuousExposeAutoLayoutItem *)&v11 isEqual:v4])
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = v4;
      if (v5)
      {
        if (objc_opt_isKindOfClass()) {
          v7 = v6;
        }
        else {
          v7 = 0;
        }
      }
      else
      {
        v7 = 0;
      }
      v9 = v7;

      if (!v9 || ![(SBDisplayItem *)self->_displayItem isEqual:v9->_displayItem]) {
        goto LABEL_26;
      }
      BOOL v8 = 0;
      if (self->_size.width != v9->_size.width) {
        goto LABEL_27;
      }
      if (self->_size.height != v9->_size.height) {
        goto LABEL_27;
      }
      BOOL v8 = 0;
      if (self->_position.x != v9->_position.x) {
        goto LABEL_27;
      }
      if (self->_position.y != v9->_position.y) {
        goto LABEL_27;
      }
      BOOL v8 = 0;
      if (self->_unoccludedPeekingPosition.x != v9->_unoccludedPeekingPosition.x) {
        goto LABEL_27;
      }
      if (self->_unoccludedPeekingPosition.y != v9->_unoccludedPeekingPosition.y) {
        goto LABEL_27;
      }
      BOOL v8 = 0;
      if (self->_anchorPosition.x != v9->_anchorPosition.x) {
        goto LABEL_27;
      }
      if (self->_anchorPosition.y != v9->_anchorPosition.y) {
        goto LABEL_27;
      }
      BOOL v8 = 0;
      if (self->_compactedPosition.x != v9->_compactedPosition.x
        || self->_compactedPosition.y != v9->_compactedPosition.y)
      {
        goto LABEL_27;
      }
      if (self->_inDefaultPosition == v9->_inDefaultPosition
        && self->_overlapped == v9->_overlapped
        && self->_fullyOccluded == v9->_fullyOccluded)
      {
        BOOL v8 = self->_partiallyCoveredByPeekingItem == v9->_partiallyCoveredByPeekingItem;
      }
      else
      {
LABEL_26:
        BOOL v8 = 0;
      }
LABEL_27:

      goto LABEL_28;
    }
    BOOL v8 = 0;
  }
LABEL_28:

  return v8;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F758]);
  id v4 = (id)objc_msgSend(v3, "appendCGSize:", self->_size.width, self->_size.height);
  id v5 = (id)objc_msgSend(v3, "appendCGPoint:", self->_position.x, self->_position.y);
  id v6 = (id)objc_msgSend(v3, "appendCGPoint:", self->_unoccludedPeekingPosition.x, self->_unoccludedPeekingPosition.y);
  id v7 = (id)objc_msgSend(v3, "appendCGPoint:", self->_anchorPosition.x, self->_anchorPosition.y);
  id v8 = (id)objc_msgSend(v3, "appendCGPoint:", self->_compactedPosition.x, self->_compactedPosition.y);
  id v9 = (id)[v3 appendBool:self->_inDefaultPosition];
  id v10 = (id)[v3 appendBool:self->_overlapped];
  id v11 = (id)[v3 appendBool:self->_fullyOccluded];
  id v12 = (id)[v3 appendBool:self->_partiallyCoveredByPeekingItem];
  unint64_t v13 = [v3 hash];

  return v13;
}

- (id)description
{
  return [(SBContinuousExposeAutoLayoutItem *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)succinctDescription
{
  v2 = [(SBContinuousExposeAutoLayoutItem *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBContinuousExposeAutoLayoutItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBContinuousExposeAutoLayoutItem *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_displayItem withName:@"displayItem"];
  id v6 = (id)objc_msgSend(v4, "appendSize:withName:", @"size", self->_size.width, self->_size.height);
  id v7 = (id)objc_msgSend(v4, "appendPoint:withName:", @"position", self->_position.x, self->_position.y);
  return v4;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGPoint)position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (CGPoint)unoccludedPeekingPosition
{
  double x = self->_unoccludedPeekingPosition.x;
  double y = self->_unoccludedPeekingPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnoccludedPeekingPosition:(CGPoint)a3
{
  self->_unoccludedPeekingPosition = a3;
}

- (CGPoint)anchorPosition
{
  double x = self->_anchorPosition.x;
  double y = self->_anchorPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPosition:(CGPoint)a3
{
  self->_anchorPosition = a3;
}

- (CGPoint)compactedPosition
{
  double x = self->_compactedPosition.x;
  double y = self->_compactedPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCompactedPosition:(CGPoint)a3
{
  self->_compactedPosition = a3;
}

- (BOOL)isInDefaultPosition
{
  return self->_inDefaultPosition;
}

- (void)setInDefaultPosition:(BOOL)a3
{
  self->_inDefaultPosition = a3;
}

- (BOOL)isOverlapped
{
  return self->_overlapped;
}

- (void)setOverlapped:(BOOL)a3
{
  self->_overlapped = a3;
}

- (BOOL)isFullyOccluded
{
  return self->_fullyOccluded;
}

- (void)setFullyOccluded:(BOOL)a3
{
  self->_fullyOccluded = a3;
}

- (BOOL)isPartiallyCoveredByPeekingItem
{
  return self->_partiallyCoveredByPeekingItem;
}

- (void)setPartiallyCoveredByPeekingItem:(BOOL)a3
{
  self->_partiallyCoveredByPeekingItem = a3;
}

- (void).cxx_destruct
{
}

@end
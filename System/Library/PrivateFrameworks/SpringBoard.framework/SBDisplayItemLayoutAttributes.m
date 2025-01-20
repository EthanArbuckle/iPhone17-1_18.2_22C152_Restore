@interface SBDisplayItemLayoutAttributes
+ (CGPoint)normalizedPointForPoint:(CGPoint)a3 inBounds:(CGRect)a4;
+ (SBDisplayItemLayoutAttributes)layoutAttributesWithProtobufRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPositionSystemManaged;
- (CGPoint)centerInBounds:(CGRect)a3;
- (CGPoint)normalizedCenter;
- (CGPoint)unoccludedPeekingCenter;
- (CGSize)_sizeForAttributedSize:(SBDisplayItemAttributedSize *)a3 inBounds:(CGRect)a4 defaultSize:(CGSize)a5 screenEdgePadding:(double)a6;
- (CGSize)sizeInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5;
- (CGSize)userSizeBeforeOverlappingInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5;
- (SBDisplayItemAttributedSize)attributedSize;
- (SBDisplayItemAttributedSize)attributedUserSizeBeforeOverlapping;
- (SBDisplayItemLayoutAttributes)init;
- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7;
- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7 occlusionState:(int64_t)a8 attributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a9 unoccludedPeekingCenter:(CGPoint)a10 positionIsSystemManaged:(BOOL)a11;
- (SBDisplayItemLayoutAttributes)initWithPlistRepresentation:(id)a3;
- (id)attributesByModifyingAttributedSize:(SBDisplayItemAttributedSize *)a3;
- (id)attributesByModifyingAttributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a3;
- (id)attributesByModifyingContentOrientation:(int64_t)a3;
- (id)attributesByModifyingLastInteractionTime:(int64_t)a3;
- (id)attributesByModifyingNormalizedCenter:(CGPoint)a3;
- (id)attributesByModifyingOcclusionState:(int64_t)a3;
- (id)attributesByModifyingPositionIsSystemManaged:(BOOL)a3;
- (id)attributesByModifyingSizingPolicy:(int64_t)a3;
- (id)attributesByModifyingUnoccludedPeekingCenter:(CGPoint)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)plistRepresentation;
- (id)protobufRepresentation;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)contentOrientation;
- (int64_t)lastInteractionTime;
- (int64_t)occlusionState;
- (int64_t)sizingPolicy;
- (unint64_t)hash;
@end

@implementation SBDisplayItemLayoutAttributes

- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7 occlusionState:(int64_t)a8 attributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a9 unoccludedPeekingCenter:(CGPoint)a10 positionIsSystemManaged:(BOOL)a11
{
  CGFloat y = a10.y;
  CGFloat x = a10.x;
  CGFloat v18 = a7.y;
  CGFloat v19 = a7.x;
  v44.receiver = self;
  v44.super_class = (Class)SBDisplayItemLayoutAttributes;
  v21 = [(SBDisplayItemLayoutAttributes *)&v44 init];
  v22 = v21;
  if (v21)
  {
    v21->_contentOrientation = a3;
    v21->_lastInteractionTime = a4;
    v21->_sizingPolicCGFloat y = a5;
    CGSize private_opaqueSize = a6->_private_opaqueSize;
    CGPoint origin = a6->referenceBounds.origin;
    CGSize size = a6->referenceBounds.size;
    v21->_attributedSize.semanticSizeType = a6->semanticSizeType;
    v21->_attributedSize.referenceBounds.CGSize size = size;
    v21->_attributedSize.referenceBounds.CGPoint origin = origin;
    v21->_attributedSize._CGSize private_opaqueSize = private_opaqueSize;
    v21->_normalizedCenter.CGFloat x = v19;
    v21->_normalizedCenter.CGFloat y = v18;
    v21->_occlusionState = a8;
    CGSize v26 = a9->_private_opaqueSize;
    CGPoint v27 = a9->referenceBounds.origin;
    CGSize v28 = a9->referenceBounds.size;
    v21->_attributedUserSizeBeforeOverlapping.semanticSizeType = a9->semanticSizeType;
    v21->_attributedUserSizeBeforeOverlapping.referenceBounds.CGPoint origin = v27;
    v21->_attributedUserSizeBeforeOverlapping.referenceBounds.CGSize size = v28;
    v21->_attributedUserSizeBeforeOverlapping._CGSize private_opaqueSize = v26;
    v21->_unoccludedPeekingCenter.CGFloat x = x;
    v21->_unoccludedPeekingCenter.CGFloat y = y;
    v21->_positionIsSystemManaged = a11;
    v29 = [MEMORY[0x1E4F4F758] builder];
    id v30 = (id)[v29 appendInteger:v22->_contentOrientation];
    id v31 = (id)[v29 appendInteger:v22->_lastInteractionTime];
    id v32 = (id)[v29 appendInteger:v22->_sizingPolicy];
    id v33 = (id)objc_msgSend(v29, "appendCGSize:", v22->_attributedSize._private_opaqueSize.width, v22->_attributedSize._private_opaqueSize.height);
    id v34 = (id)objc_msgSend(v29, "appendCGRect:", v22->_attributedSize.referenceBounds.origin.x, v22->_attributedSize.referenceBounds.origin.y, v22->_attributedSize.referenceBounds.size.width, v22->_attributedSize.referenceBounds.size.height);
    id v35 = (id)[v29 appendInteger:v22->_attributedSize.semanticSizeType];
    id v36 = (id)objc_msgSend(v29, "appendCGPoint:", v22->_normalizedCenter.x, v22->_normalizedCenter.y);
    id v37 = (id)[v29 appendInteger:v22->_occlusionState];
    id v38 = (id)objc_msgSend(v29, "appendCGSize:", v22->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width, v22->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height);
    id v39 = (id)objc_msgSend(v29, "appendCGRect:", v22->_attributedUserSizeBeforeOverlapping.referenceBounds.origin.x, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.origin.y, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.size.width, v22->_attributedUserSizeBeforeOverlapping.referenceBounds.size.height);
    id v40 = (id)[v29 appendInteger:v22->_attributedUserSizeBeforeOverlapping.semanticSizeType];
    id v41 = (id)objc_msgSend(v29, "appendCGPoint:", v22->_unoccludedPeekingCenter.x, v22->_unoccludedPeekingCenter.y);
    id v42 = (id)[v29 appendBool:v22->_positionIsSystemManaged];
    v22->_hash = [v29 hash];
  }
  return v22;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBDisplayItemLayoutAttributes *)self succinctDescriptionBuilder];
  v5 = BSInterfaceOrientationDescription();
  [v4 appendString:v5 withName:@"contentOrientation"];

  int64_t lastInteractionTime = self->_lastInteractionTime;
  if (lastInteractionTime) {
    id v7 = (id)[v4 appendInteger:lastInteractionTime withName:@"lastInteractionTime"];
  }
  else {
    [v4 appendString:@"never" withName:@"lastInteractionTime"];
  }
  v8 = NSStringFromDisplayItemSizingPolicy(self->_sizingPolicy);
  [v4 appendString:v8 withName:@"sizingPolicy"];

  double v10 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v11 = self->_attributedSize._private_opaqueSize.width == *MEMORY[0x1E4F1DB30]
     && self->_attributedSize._private_opaqueSize.height == v9;
  if (v11 && !self->_attributedSize.semanticSizeType)
  {
    [v4 appendString:@"unspecified" withName:@"size"];
  }
  else
  {
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    CGSize private_opaqueSize = self->_attributedSize._private_opaqueSize;
    CGPoint v22 = origin;
    CGSize size = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    v13 = SBDisplayItemAttributedSizeDescription((uint64_t)&private_opaqueSize);
    [v4 appendString:v13 withName:@"size"];
  }
  if (self->_normalizedCenter.x == 0.0 && self->_normalizedCenter.y == 0.0) {
    [v4 appendString:@"unspecified" withName:@"center"];
  }
  else {
    id v14 = (id)objc_msgSend(v4, "appendPoint:withName:", @"center");
  }
  unint64_t v15 = self->_occlusionState - 1;
  if (v15 > 2) {
    v16 = @"unknown";
  }
  else {
    v16 = off_1E6B008E8[v15];
  }
  [v4 appendString:v16 withName:@"occlusionState"];
  if (self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width == v10
    && self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height == v9
    && !self->_attributedUserSizeBeforeOverlapping.semanticSizeType)
  {
    [v4 appendString:@"unspecified" withName:@"userConfiguredSizeBeforeOverlapping"];
  }
  else
  {
    CGPoint v17 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    CGSize private_opaqueSize = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    CGPoint v22 = v17;
    CGSize size = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    CGFloat v18 = SBDisplayItemAttributedSizeDescription((uint64_t)&private_opaqueSize);
    [v4 appendString:v18 withName:@"userConfiguredSizeBeforeOverlapping"];
  }
  if (self->_unoccludedPeekingCenter.x == 0.0 && self->_unoccludedPeekingCenter.y == 0.0) {
    [v4 appendString:@"unspecified" withName:@"unoccludedPeekingCenter"];
  }
  else {
    id v19 = (id)objc_msgSend(v4, "appendPoint:withName:", @"unoccludedPeekingCenter");
  }
  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBDisplayItemLayoutAttributes *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)attributesByModifyingSizingPolicy:(int64_t)a3
{
  if (self->_sizingPolicy == a3)
  {
    v4 = self;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v18[0] = self->_attributedSize._private_opaqueSize;
    v18[1] = origin;
    v18[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v13 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v16[1] = v13;
    v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v15) = positionIsSystemManaged;
    v4 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, a3, v18, occlusionState, v16, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
  }
  return v4;
}

- (id)attributesByModifyingContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation == a3)
  {
    v4 = self;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicCGFloat y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v18[0] = self->_attributedSize._private_opaqueSize;
    v18[1] = origin;
    v18[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v13 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v16[1] = v13;
    v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v15) = positionIsSystemManaged;
    v4 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", a3, lastInteractionTime, sizingPolicy, v18, occlusionState, v16, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
  }
  return v4;
}

- (int64_t)lastInteractionTime
{
  return self->_lastInteractionTime;
}

- (id)attributesByModifyingLastInteractionTime:(int64_t)a3
{
  if (self->_lastInteractionTime == a3)
  {
    v4 = self;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    sizingPolicCGFloat y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v18[0] = self->_attributedSize._private_opaqueSize;
    v18[1] = origin;
    v18[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v13 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v16[1] = v13;
    v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v15) = positionIsSystemManaged;
    v4 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, a3, sizingPolicy, v18, occlusionState, v16, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
  }
  return v4;
}

- (SBDisplayItemLayoutAttributes)init
{
  v4[0] = 0;
  v4[1] = 0;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v5 = *MEMORY[0x1E4F1DB28];
  long long v6 = v2;
  uint64_t v7 = 0;
  return -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:](self, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:", 0, 0, 0, v4, 0.0, 0.0);
}

- (SBDisplayItemLayoutAttributes)initWithContentOrientation:(int64_t)a3 lastInteractionTime:(int64_t)a4 sizingPolicy:(int64_t)a5 attributedSize:(SBDisplayItemAttributedSize *)a6 normalizedCenter:(CGPoint)a7
{
  v13[0] = 0;
  v13[1] = 0;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v14 = *MEMORY[0x1E4F1DB28];
  long long v15 = v7;
  uint64_t v16 = 0;
  CGPoint origin = a6->referenceBounds.origin;
  v11[0] = a6->_private_opaqueSize;
  v11[1] = origin;
  v11[2] = a6->referenceBounds.size;
  int64_t semanticSizeType = a6->semanticSizeType;
  LOBYTE(v10) = 0;
  return -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](self, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", a3, a4, a5, v11, 0, v13, a7.x, a7.y, 0.0, 0.0, v10);
}

- (SBDisplayItemAttributedSize)attributedSize
{
  CGPoint v3 = *(CGPoint *)&self[1].semanticSizeType;
  retstr->_CGSize private_opaqueSize = self[1].referenceBounds.size;
  retstr->referenceBounds.CGPoint origin = v3;
  retstr->referenceBounds.CGSize size = *(CGSize *)&self[2]._private_opaqueSize.height;
  retstr->int64_t semanticSizeType = *(void *)&self[2].referenceBounds.origin.y;
  return self;
}

+ (CGPoint)normalizedPointForPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.y;
  CGFloat v9 = a3.x / CGRectGetWidth(a4);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  double v10 = v8 / CGRectGetHeight(v13);
  double v11 = v9;
  result.CGFloat y = v10;
  result.CGFloat x = v11;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t contentOrientation = self->_contentOrientation;
  int64_t lastInteractionTime = self->_lastInteractionTime;
  sizingPolicCGFloat y = self->_sizingPolicy;
  int64_t occlusionState = self->_occlusionState;
  BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
  CGPoint origin = self->_attributedSize.referenceBounds.origin;
  v17[0] = self->_attributedSize._private_opaqueSize;
  v17[1] = origin;
  v17[2] = self->_attributedSize.referenceBounds.size;
  int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
  double x = self->_normalizedCenter.x;
  origin.double x = self->_normalizedCenter.y;
  CGPoint v12 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v15[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v15[1] = v12;
  v15[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  int64_t v16 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  LOBYTE(v14) = positionIsSystemManaged;
  return (id)objc_msgSend(v4, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v17, occlusionState, v15, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v14);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBDisplayItemLayoutAttributes *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  if (self->_lastInteractionTime != v4->_lastInteractionTime) {
    goto LABEL_13;
  }
  if (self->_sizingPolicy != v4->_sizingPolicy) {
    goto LABEL_13;
  }
  CGPoint origin = self->_attributedSize.referenceBounds.origin;
  CGSize private_opaqueSize = self->_attributedSize._private_opaqueSize;
  CGPoint v16 = origin;
  CGSize size = self->_attributedSize.referenceBounds.size;
  int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
  CGPoint v6 = v4->_attributedSize.referenceBounds.origin;
  CGSize v11 = v4->_attributedSize._private_opaqueSize;
  CGPoint v12 = v6;
  CGSize v13 = v4->_attributedSize.referenceBounds.size;
  int64_t v14 = v4->_attributedSize.semanticSizeType;
  if (!SBEqualDisplayItemAttributedSizes((uint64_t)&private_opaqueSize, (uint64_t)&v11)) {
    goto LABEL_13;
  }
  BOOL v7 = 0;
  if (self->_normalizedCenter.x != v4->_normalizedCenter.x || self->_normalizedCenter.y != v4->_normalizedCenter.y) {
    goto LABEL_15;
  }
  if (self->_occlusionState != v4->_occlusionState) {
    goto LABEL_13;
  }
  CGPoint v8 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  CGSize private_opaqueSize = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  CGPoint v16 = v8;
  CGSize size = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  int64_t semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  CGPoint v9 = v4->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  CGSize v11 = v4->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  CGPoint v12 = v9;
  CGSize v13 = v4->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  int64_t v14 = v4->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  if (!SBEqualDisplayItemAttributedSizes((uint64_t)&private_opaqueSize, (uint64_t)&v11))
  {
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_15;
  }
  BOOL v7 = 0;
  if (self->_unoccludedPeekingCenter.x == v4->_unoccludedPeekingCenter.x
    && self->_unoccludedPeekingCenter.y == v4->_unoccludedPeekingCenter.y)
  {
    BOOL v7 = self->_positionIsSystemManaged == v4->_positionIsSystemManaged;
  }
LABEL_15:

  return v7;
}

- (id)description
{
  return [(SBDisplayItemLayoutAttributes *)self descriptionWithMultilinePrefix:@"\t"];
}

- (CGSize)sizeInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5
{
  CGPoint origin = self->_attributedSize.referenceBounds.origin;
  v8[0] = self->_attributedSize._private_opaqueSize;
  v8[1] = origin;
  v8[2] = self->_attributedSize.referenceBounds.size;
  int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
  -[SBDisplayItemLayoutAttributes _sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:](self, "_sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a5);
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (CGPoint)centerInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
  {
    double x = width * self->_normalizedCenter.x;
    double y = height * self->_normalizedCenter.y;
  }
  else
  {
    double x = self->_normalizedCenter.x;
    double y = self->_normalizedCenter.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)userSizeBeforeOverlappingInBounds:(CGRect)a3 defaultSize:(CGSize)a4 screenEdgePadding:(double)a5
{
  CGPoint origin = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
  v8[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
  v8[1] = origin;
  v8[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
  int64_t semanticSizeType = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
  -[SBDisplayItemLayoutAttributes _sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:](self, "_sizeForAttributedSize:inBounds:defaultSize:screenEdgePadding:", v8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height, a5);
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (id)attributesByModifyingAttributedSize:(SBDisplayItemAttributedSize *)a3
{
  BOOL v5 = a3->_private_opaqueSize.width == self->_attributedSize._private_opaqueSize.width
    && a3->_private_opaqueSize.height == self->_attributedSize._private_opaqueSize.height;
  if (v5
    && CGRectEqualToRect(a3->referenceBounds, self->_attributedSize.referenceBounds)
    && a3->semanticSizeType == self->_attributedSize.semanticSizeType)
  {
    double v6 = self;
  }
  else
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = a3->referenceBounds.origin;
    v20[0] = a3->_private_opaqueSize;
    v20[1] = origin;
    v20[2] = a3->referenceBounds.size;
    int64_t semanticSizeType = a3->semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v15 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v18[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v18[1] = v15;
    v18[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v19 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v17) = positionIsSystemManaged;
    double v6 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
  }
  return v6;
}

- (id)attributesByModifyingNormalizedCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x == self->_normalizedCenter.x && a3.y == self->_normalizedCenter.y)
  {
    CGPoint v15 = self;
  }
  else
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v20[0] = self->_attributedSize._private_opaqueSize;
    v20[1] = origin;
    v20[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    CGPoint v14 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v18[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v18[1] = v14;
    v18[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v19 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v17) = positionIsSystemManaged;
    CGPoint v15 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, y, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
  }
  return v15;
}

- (id)attributesByModifyingOcclusionState:(int64_t)a3
{
  if (self->_occlusionState == a3)
  {
    id v4 = self;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v18[0] = self->_attributedSize._private_opaqueSize;
    v18[1] = origin;
    v18[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v13 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v16[1] = v13;
    v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v15) = positionIsSystemManaged;
    id v4 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v18, a3, v16, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
  }
  return v4;
}

- (id)attributesByModifyingAttributedUserSizeBeforeOverlapping:(SBDisplayItemAttributedSize *)a3
{
  BOOL v5 = a3->_private_opaqueSize.width == self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width
    && a3->_private_opaqueSize.height == self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height;
  if (v5
    && CGRectEqualToRect(a3->referenceBounds, self->_attributedUserSizeBeforeOverlapping.referenceBounds)
    && a3->semanticSizeType == self->_attributedUserSizeBeforeOverlapping.semanticSizeType)
  {
    id v6 = self;
  }
  else
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v20[0] = self->_attributedSize._private_opaqueSize;
    v20[1] = origin;
    v20[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v15 = a3->referenceBounds.origin;
    v18[0] = a3->_private_opaqueSize;
    v18[1] = v15;
    v18[2] = a3->referenceBounds.size;
    int64_t v19 = a3->semanticSizeType;
    LOBYTE(v17) = positionIsSystemManaged;
    id v6 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v20, occlusionState, v18, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v17);
  }
  return v6;
}

- (id)attributesByModifyingUnoccludedPeekingCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (a3.x == self->_unoccludedPeekingCenter.x && a3.y == self->_unoccludedPeekingCenter.y)
  {
    CGPoint v16 = self;
  }
  else
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    BOOL positionIsSystemManaged = self->_positionIsSystemManaged;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v21[0] = self->_attributedSize._private_opaqueSize;
    v21[1] = origin;
    v21[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double v14 = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v15 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v19[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v19[1] = v15;
    v19[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v20 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v18) = positionIsSystemManaged;
    CGPoint v16 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v7, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v21, occlusionState, v19, v14, origin.x, x, y, v18);
  }
  return v16;
}

- (id)attributesByModifyingPositionIsSystemManaged:(BOOL)a3
{
  if (self->_positionIsSystemManaged == a3)
  {
    id v4 = self;
  }
  else
  {
    id v6 = objc_alloc((Class)objc_opt_class());
    int64_t contentOrientation = self->_contentOrientation;
    int64_t lastInteractionTime = self->_lastInteractionTime;
    sizingPolicdouble y = self->_sizingPolicy;
    int64_t occlusionState = self->_occlusionState;
    CGPoint origin = self->_attributedSize.referenceBounds.origin;
    v18[0] = self->_attributedSize._private_opaqueSize;
    v18[1] = origin;
    v18[2] = self->_attributedSize.referenceBounds.size;
    int64_t semanticSizeType = self->_attributedSize.semanticSizeType;
    double x = self->_normalizedCenter.x;
    origin.double x = self->_normalizedCenter.y;
    CGPoint v13 = self->_attributedUserSizeBeforeOverlapping.referenceBounds.origin;
    v16[0] = self->_attributedUserSizeBeforeOverlapping._private_opaqueSize;
    v16[1] = v13;
    v16[2] = self->_attributedUserSizeBeforeOverlapping.referenceBounds.size;
    int64_t v17 = self->_attributedUserSizeBeforeOverlapping.semanticSizeType;
    LOBYTE(v15) = a3;
    id v4 = (SBDisplayItemLayoutAttributes *)objc_msgSend(v6, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", contentOrientation, lastInteractionTime, sizingPolicy, v18, occlusionState, v16, x, origin.x, self->_unoccludedPeekingCenter.x, self->_unoccludedPeekingCenter.y, v15);
  }
  return v4;
}

- (SBDisplayItemLayoutAttributes)initWithPlistRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = SBSafeCast(v5, v4);

  if (v6)
  {
    v67 = self;
    uint64_t v7 = objc_opt_class();
    CGPoint v8 = [v6 objectForKey:@"contentOrientation"];
    CGPoint v9 = SBSafeCast(v7, v8);

    v66 = v9;
    if (v9) {
      uint64_t v64 = [v9 integerValue];
    }
    else {
      uint64_t v64 = 0;
    }
    uint64_t v11 = objc_opt_class();
    CGPoint v12 = [v6 objectForKey:@"lastInteractionTime"];
    CGPoint v13 = SBSafeCast(v11, v12);

    v65 = v13;
    if (v13) {
      uint64_t v62 = [v13 integerValue];
    }
    else {
      uint64_t v62 = 0;
    }
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v6 objectForKey:@"sizingPolicy"];
    CGPoint v16 = SBSafeCast(v14, v15);

    v63 = v16;
    if (v16) {
      uint64_t v61 = [v16 integerValue];
    }
    else {
      uint64_t v61 = 0;
    }
    CGFloat width = *MEMORY[0x1E4F1DB30];
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    uint64_t v19 = objc_opt_class();
    int64_t v20 = [v6 objectForKey:@"size"];
    SBSafeCast(v19, v20);
    CFDictionaryRef v21 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    size.CGFloat width = 0.0;
    size.CGFloat height = 0.0;
    if (v21 && CGSizeMakeWithDictionaryRepresentation(v21, &size))
    {
      CGFloat width = size.width;
      CGFloat height = size.height;
    }
    double v22 = *MEMORY[0x1E4F1DB28];
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v26 = objc_opt_class();
    CGPoint v27 = [v6 objectForKey:@"referenceBounds"];
    SBSafeCast(v26, v27);
    CFDictionaryRef v28 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    memset(&rect, 0, sizeof(rect));
    double y = v23;
    double x = v22;
    double v68 = v25;
    double v69 = v24;
    if (v28)
    {
      double y = v23;
      double x = v22;
      double v68 = v25;
      double v69 = v24;
      if (CGRectMakeWithDictionaryRepresentation(v28, &rect))
      {
        double y = rect.origin.y;
        double x = rect.origin.x;
        double v68 = rect.size.height;
        double v69 = rect.size.width;
      }
    }
    CFDictionaryRef v60 = v28;
    uint64_t v29 = objc_opt_class();
    id v30 = [v6 objectForKey:@"semanticSizeType"];
    id v31 = SBSafeCast(v29, v30);

    if (v31) {
      uint64_t v59 = [v31 integerValue];
    }
    else {
      uint64_t v59 = 0;
    }
    uint64_t v32 = objc_opt_class();
    id v33 = [v6 objectForKey:@"center"];
    SBSafeCast(v32, v33);
    CFDictionaryRef v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    point.double x = 0.0;
    point.double y = 0.0;
    CGFloat v35 = 0.0;
    if (v34)
    {
      BOOL v36 = CGPointMakeWithDictionaryRepresentation(v34, &point);
      CGFloat v37 = 0.0;
      if (v36)
      {
        CGFloat v35 = point.x;
        CGFloat v37 = point.y;
      }
    }
    else
    {
      CGFloat v37 = 0.0;
    }
    double v57 = v37;
    double v58 = v35;
    uint64_t v38 = objc_opt_class();
    id v39 = [v6 objectForKey:@"userConfiguredSizeBeforeOverlapping"];
    SBSafeCast(v38, v39);
    CFDictionaryRef v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v75.CGFloat width = 0.0;
    v75.CGFloat height = 0.0;
    CGFloat v41 = width;
    CGFloat v42 = height;
    if (v21 && CGSizeMakeWithDictionaryRepresentation(v40, &v75))
    {
      CGFloat width = v75.width;
      CGFloat height = v75.height;
    }
    uint64_t v43 = objc_opt_class();
    objc_super v44 = [v6 objectForKey:@"referenceBoundsBeforeOverlapping"];
    SBSafeCast(v43, v44);
    CFDictionaryRef v45 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    memset(&v74, 0, sizeof(v74));
    if (v45 && CGRectMakeWithDictionaryRepresentation(v45, &v74))
    {
      double v22 = v74.origin.x;
      double v23 = v74.origin.y;
      double v24 = v74.size.width;
      double v25 = v74.size.height;
    }
    v79.origin.double x = v22;
    v79.origin.double y = v23;
    v79.size.CGFloat width = v24;
    v79.size.CGFloat height = v25;
    if (CGRectIsEmpty(v79))
    {
      double v22 = x;
      double v23 = y;
      double v24 = v69;
      double v25 = v68;
    }
    uint64_t v46 = objc_opt_class();
    v47 = [v6 objectForKey:@"semanticSizeTypeBeforeOverlapping"];
    v48 = SBSafeCast(v46, v47);

    if (v48) {
      uint64_t v49 = [v48 integerValue];
    }
    else {
      uint64_t v49 = 0;
    }
    uint64_t v50 = objc_opt_class();
    v51 = [v6 objectForKey:@"positionIsSystemManaged"];
    v52 = SBSafeCast(v50, v51);

    double v53 = *MEMORY[0x1E4F1DAD8];
    double v54 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    *(CGFloat *)v73 = v41;
    *(CGFloat *)&v73[1] = v42;
    *(double *)&v73[2] = x;
    *(double *)&v73[3] = y;
    *(double *)&v73[4] = v69;
    *(double *)&v73[5] = v68;
    v73[6] = v59;
    *(CGFloat *)v72 = width;
    *(CGFloat *)&v72[1] = height;
    *(double *)&v72[2] = v22;
    *(double *)&v72[3] = v23;
    *(double *)&v72[4] = v24;
    *(double *)&v72[5] = v25;
    v72[6] = v49;
    LOBYTE(v56) = 0;
    self = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v67, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v64, v62, v61, v73, 0, v72, v58, v57, v53, v54, v56);

    double v10 = self;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (id)plistRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [NSNumber numberWithInteger:self->_contentOrientation];
  if (v4) {
    [v3 setObject:v4 forKey:@"contentOrientation"];
  }
  uint64_t v5 = [NSNumber numberWithInteger:self->_lastInteractionTime];
  if (v5) {
    [v3 setObject:v5 forKey:@"lastInteractionTime"];
  }
  id v6 = [NSNumber numberWithInteger:self->_sizingPolicy];
  if (v6) {
    [v3 setObject:v6 forKey:@"sizingPolicy"];
  }
  CFDictionaryRef DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(self->_attributedSize._private_opaqueSize);
  if (DictionaryRepresentation)
  {
    CFDictionaryRef v8 = DictionaryRepresentation;
    [v3 setObject:DictionaryRepresentation forKey:@"size"];
    CFRelease(v8);
  }
  CFDictionaryRef v9 = CGRectCreateDictionaryRepresentation(self->_attributedSize.referenceBounds);
  if (v9)
  {
    CFDictionaryRef v10 = v9;
    [v3 setObject:v9 forKey:@"referenceBounds"];
    CFRelease(v10);
  }
  uint64_t v11 = [NSNumber numberWithInteger:self->_attributedSize.semanticSizeType];
  if (v11) {
    [v3 setObject:v11 forKey:@"semanticSizeType"];
  }
  CFDictionaryRef v12 = CGPointCreateDictionaryRepresentation(self->_normalizedCenter);
  if (v12)
  {
    CFDictionaryRef v13 = v12;
    [v3 setObject:v12 forKey:@"center"];
    CFRelease(v13);
  }
  CFDictionaryRef v14 = CGSizeCreateDictionaryRepresentation(self->_attributedUserSizeBeforeOverlapping._private_opaqueSize);
  if (v14)
  {
    CFDictionaryRef v15 = v14;
    [v3 setObject:v14 forKey:@"userConfiguredSizeBeforeOverlapping"];
    CFRelease(v15);
  }
  CFDictionaryRef v16 = CGRectCreateDictionaryRepresentation(self->_attributedUserSizeBeforeOverlapping.referenceBounds);
  if (v16)
  {
    CFDictionaryRef v17 = v16;
    [v3 setObject:v16 forKey:@"referenceBoundsBeforeOverlapping"];
    CFRelease(v17);
  }
  uint64_t v18 = [NSNumber numberWithInteger:self->_attributedUserSizeBeforeOverlapping.semanticSizeType];
  if (v18) {
    [v3 setObject:v18 forKey:@"semanticSizeTypeBeforeOverlapping"];
  }
  uint64_t v19 = [NSNumber numberWithBool:self->_positionIsSystemManaged];
  [v3 setObject:v19 forKey:@"positionIsSystemManaged"];

  return v3;
}

+ (SBDisplayItemLayoutAttributes)layoutAttributesWithProtobufRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v27 = -[SBPBDisplayItemLayoutAttributes sizeWidth]((uint64_t)v4);
    double v26 = -[SBPBDisplayItemLayoutAttributes sizeHeight]((uint64_t)v4);
    double v5 = -[SBPBDisplayItemLayoutAttributes referenceBoundsWidthForSize]((uint64_t)v4);
    double v6 = -[SBPBDisplayItemLayoutAttributes referenceBoundsHeightForSize]((uint64_t)v4);
    uint64_t v7 = (int)-[SBPBDisplayItemLayoutAttributes semanticSizeTypeForSize]((uint64_t)v4);
    double v8 = -[SBPBDisplayItemLayoutAttributes userSizeBeforeOverlappingInBoundsWidth]((uint64_t)v4);
    double v9 = -[SBPBDisplayItemLayoutAttributes userSizeBeforeOverlappingInBoundsHeight]((uint64_t)v4);
    double v10 = -[SBPBDisplayItemLayoutAttributes referenceBoundsWidthBeforeOverlapping]((uint64_t)v4);
    double v11 = -[SBPBDisplayItemLayoutAttributes referenceBoundsHeightBeforeOverlapping]((uint64_t)v4);
    uint64_t v12 = (int)-[SBPBDisplayItemLayoutAttributes semanticSizeTypeBeforeOverlapping]((uint64_t)v4);
    v31.origin.double x = 0.0;
    v31.origin.double y = 0.0;
    v31.size.CGFloat width = v10;
    v31.size.CGFloat height = v11;
    IsEmptdouble y = CGRectIsEmpty(v31);
    if (IsEmpty) {
      double v14 = v5;
    }
    else {
      double v14 = v10;
    }
    if (IsEmpty) {
      double v15 = v6;
    }
    else {
      double v15 = v11;
    }
    CFDictionaryRef v16 = [SBDisplayItemLayoutAttributes alloc];
    uint64_t v17 = -[SBPBDisplayItemLayoutAttributes contentOrientation]((uint64_t)v4);
    uint64_t v18 = -[SBPBDisplayItemLayoutAttributes lastInteractionTime]((uint64_t)v4);
    uint64_t v19 = -[SBPBDisplayItemLayoutAttributes sizingPolicy]((uint64_t)v4);
    double v20 = -[SBPBDisplayItemLayoutAttributes centerX]((uint64_t)v4);
    double v21 = -[SBPBDisplayItemLayoutAttributes centerY]((uint64_t)v4);
    BOOL IsSystem = -[SBPBDisplayItemLayoutAttributes positionIsSystemManaged]((BOOL)v4);

    *(double *)uint64_t v29 = v27;
    *(double *)&v29[1] = v26;
    v29[2] = 0;
    v29[3] = 0;
    *(double *)&v29[4] = v5;
    *(double *)&v29[5] = v6;
    v29[6] = v7;
    *(double *)CFDictionaryRef v28 = v8;
    *(double *)&v28[1] = v9;
    v28[2] = 0;
    v28[3] = 0;
    *(double *)&v28[4] = v14;
    *(double *)&v28[5] = v15;
    v28[6] = v12;
    LOBYTE(v25) = IsSystem;
    double v23 = -[SBDisplayItemLayoutAttributes initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:](v16, "initWithContentOrientation:lastInteractionTime:sizingPolicy:attributedSize:normalizedCenter:occlusionState:attributedUserSizeBeforeOverlapping:unoccludedPeekingCenter:positionIsSystemManaged:", v17, v18, v19, v29, 0, v28, v20, v21, 0.0, 0.0, v25);
  }
  else
  {
    double v23 = 0;
  }
  return v23;
}

- (id)protobufRepresentation
{
  uint64_t v3 = objc_alloc_init(SBPBDisplayItemLayoutAttributes);
  -[SBPBDisplayItemLayoutAttributes setContentOrientation:]((uint64_t)v3, self->_contentOrientation);
  -[SBPBDisplayItemLayoutAttributes setLastInteractionTime:]((uint64_t)v3, self->_lastInteractionTime);
  -[SBPBDisplayItemLayoutAttributes setSizingPolicy:]((uint64_t)v3, self->_sizingPolicy);
  -[SBPBDisplayItemLayoutAttributes setSizeWidth:]((uint64_t)v3, self->_attributedSize._private_opaqueSize.width);
  -[SBPBDisplayItemLayoutAttributes setSizeHeight:]((uint64_t)v3, self->_attributedSize._private_opaqueSize.height);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsWidthForSize:]((uint64_t)v3, self->_attributedSize.referenceBounds.size.width);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsHeightForSize:]((uint64_t)v3, self->_attributedSize.referenceBounds.size.height);
  -[SBPBDisplayItemLayoutAttributes setSemanticSizeTypeForSize:]((uint64_t)v3, self->_attributedSize.semanticSizeType);
  -[SBPBDisplayItemLayoutAttributes setCenterX:]((uint64_t)v3, self->_normalizedCenter.x);
  -[SBPBDisplayItemLayoutAttributes setCenterY:]((uint64_t)v3, self->_normalizedCenter.y);
  -[SBPBDisplayItemLayoutAttributes setUserSizeBeforeOverlappingInBoundsWidth:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.width);
  -[SBPBDisplayItemLayoutAttributes setUserSizeBeforeOverlappingInBoundsHeight:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping._private_opaqueSize.height);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsWidthBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.referenceBounds.size.width);
  -[SBPBDisplayItemLayoutAttributes setReferenceBoundsHeightBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.referenceBounds.size.height);
  -[SBPBDisplayItemLayoutAttributes setSemanticSizeTypeBeforeOverlapping:]((uint64_t)v3, self->_attributedUserSizeBeforeOverlapping.semanticSizeType);
  -[SBPBDisplayItemLayoutAttributes setPositionIsSystemManaged:]((uint64_t)v3, self->_positionIsSystemManaged);
  return v3;
}

- (id)succinctDescription
{
  long long v2 = [(SBDisplayItemLayoutAttributes *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (CGSize)_sizeForAttributedSize:(SBDisplayItemAttributedSize *)a3 inBounds:(CGRect)a4 defaultSize:(CGSize)a5 screenEdgePadding:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  double v8 = a4.size.height;
  double v9 = a4.size.width;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  if (!CGRectIsEmpty(a3->referenceBounds))
  {
    double v12 = a3->referenceBounds.size.width;
    double v11 = a3->referenceBounds.size.height;
  }
  if (BSFloatLessThanOrEqualToFloat() && BSFloatLessThanOrEqualToFloat())
  {
    double v13 = v12 * a3->_private_opaqueSize.width;
    double v14 = v11 * a3->_private_opaqueSize.height;
  }
  else
  {
    double v13 = a3->_private_opaqueSize.width;
    double v14 = a3->_private_opaqueSize.height;
  }
  if (BSFloatEqualToFloat() && BSFloatEqualToFloat())
  {
    switch(a3->semanticSizeType)
    {
      case 1:
        double width = v9;
        goto LABEL_27;
      case 2:
        double width = v13;
        goto LABEL_21;
      case 3:
        double width = v9;
LABEL_21:
        double v14 = v8;
        goto LABEL_27;
      case 4:
        goto LABEL_27;
      case 5:
        double width = v13;
        goto LABEL_23;
      case 6:
LABEL_23:
        double v14 = height;
        break;
      case 7:
        double width = v9 + a6 * -2.0;
        break;
      case 8:
        double v14 = v8 + a6 * -2.0;
        goto LABEL_26;
      case 9:
        double width = v9 - a6 * 2.0;
        double v14 = v8 - a6 * 2.0;
        break;
      default:
        goto LABEL_26;
    }
    goto LABEL_27;
  }
  if (!BSFloatLessThanFloat()
    || !BSFloatGreaterThanFloat()
    || !BSFloatGreaterThanFloat())
  {
LABEL_26:
    double width = v13;
LABEL_27:
    double v15 = fmax(width, 0.0);
    if (v9 <= v15) {
      double v15 = v9;
    }
    double v16 = fmax(v14, 0.0);
    if (v8 <= v16) {
      double v16 = v8;
    }
    goto LABEL_33;
  }
  double v15 = fmax(v13, 0.0);
  if (width <= v15) {
    double v15 = width;
  }
  double v16 = fmax(v14, 0.0);
  if (height <= v16) {
    double v16 = height;
  }
LABEL_33:
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (CGPoint)normalizedCenter
{
  double x = self->_normalizedCenter.x;
  double y = self->_normalizedCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)occlusionState
{
  return self->_occlusionState;
}

- (SBDisplayItemAttributedSize)attributedUserSizeBeforeOverlapping
{
  CGPoint v3 = *(CGPoint *)&self[2].semanticSizeType;
  retstr->_CGSize private_opaqueSize = self[2].referenceBounds.size;
  retstr->referenceBounds.CGPoint origin = v3;
  retstr->referenceBounds.CGSize size = *(CGSize *)&self[3]._private_opaqueSize.height;
  retstr->int64_t semanticSizeType = *(void *)&self[3].referenceBounds.origin.y;
  return self;
}

- (CGPoint)unoccludedPeekingCenter
{
  double x = self->_unoccludedPeekingCenter.x;
  double y = self->_unoccludedPeekingCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isPositionSystemManaged
{
  return self->_positionIsSystemManaged;
}

@end
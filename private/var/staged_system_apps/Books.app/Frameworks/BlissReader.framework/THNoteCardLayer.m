@interface THNoteCardLayer
- (BOOL)darkMode;
- (BOOL)draggedPastThreshold;
- (BOOL)filteredOut;
- (BOOL)flownOut;
- (BOOL)forceHidden;
- (BOOL)isBottomCard;
- (BOOL)isFlipped;
- (BOOL)isPointInsideFlipGlyph:(CGPoint)a3;
- (BOOL)isTopCard;
- (BOOL)p_isBottomCardParameters:(_THNoteTransformParameters *)a3;
- (BOOL)p_isTopCardParameters:(_THNoteTransformParameters *)a3;
- (CGPoint)dragAnchor;
- (CGPoint)dragOffset;
- (CGPoint)extendedDragOffsetInDirection:(CGPoint)a3;
- (NSArray)interactiveLayers;
- (THNoteCardContentLayer)backLayer;
- (THNoteCardContentLayer)downwardFacingLayer;
- (THNoteCardContentLayer)frontLayer;
- (THNoteCardContentLayer)upwardFacingLayer;
- (THNoteCardInfo)noteCardInfo;
- (THNoteCardLayer)initWithDelegate:(id)a3 darkMode:(BOOL)a4;
- (THNoteCardLayoutContext)layoutContext;
- (_THNoteCardDisplayAttributes)p_displayAttributesForParameters:(_THNoteTransformParameters *)a3;
- (_THNoteTransform)p_noteTransformForParameters:(SEL)a3;
- (id).cxx_construct;
- (int)poppedState;
- (int64_t)cardIndex;
- (int64_t)offsetFromTopOfDeck;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)cancelDragAnimated:(BOOL)a3 duration:(double)a4;
- (void)completeDragInDirection:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)dealloc;
- (void)flipAnimated:(BOOL)a3 duration:(double)a4;
- (void)layoutSublayers;
- (void)p_applyNoteTransform:(_THNoteTransform *)a3;
- (void)p_commonInitWithDarkMode:(BOOL)a3;
- (void)p_completeDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)p_completeFlippedDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)p_didSettle;
- (void)p_mayHaveSettled;
- (void)p_rebuildNoteTransform;
- (void)p_willUnsettle;
- (void)popAnimated:(BOOL)a3 duration:(double)a4;
- (void)removeFromSuperlayer;
- (void)reset;
- (void)setCardIndex:(int64_t)a3;
- (void)setCardIndex:(int64_t)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setCardIndex:(int64_t)a3 forceHidden:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)setDarkMode:(BOOL)a3;
- (void)setDragAnchor:(CGPoint)a3;
- (void)setDragOffset:(CGPoint)a3;
- (void)setFilteredOut:(BOOL)a3;
- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4;
- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7;
- (void)setFlipped:(BOOL)a3;
- (void)setFlownOut:(BOOL)a3;
- (void)setFlownOut:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5;
- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4;
- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)setForceHidden:(BOOL)a3;
- (void)setLayoutContext:(id)a3;
- (void)setNoteCardInfo:(id)a3;
- (void)setPoppedState:(int)a3;
- (void)setScaleFactor:(double)a3 darkerBackground:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6;
- (void)shuffleToIndex:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5 duration:(double)a6 completion:(id)a7;
- (void)unpopAnimated:(BOOL)a3 duration:(double)a4;
- (void)updateTransformAnimated:(BOOL)a3 duration:(double)a4;
@end

@implementation THNoteCardLayer

- (THNoteCardLayer)initWithDelegate:(id)a3 darkMode:(BOOL)a4
{
  BOOL v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)THNoteCardLayer;
  v6 = [(THNoteCardLayer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_delegate = (THNoteCardLayerDelegate *)a3;
    [(THNoteCardLayer *)v6 p_commonInitWithDarkMode:v4];
  }
  return v7;
}

- (void)dealloc
{
  self->_frontLayer = 0;
  self->_backLayer = 0;

  self->_completionAnimationCompletionBlock = 0;
  self->_layoutContext = 0;
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  [(THNoteCardLayer *)&v3 dealloc];
}

- (void)setLayoutContext:(id)a3
{
  [a3 noteCardSize];
  TSDRectWithSize();
  TSDRoundedRect();
  -[THNoteCardLayer setBounds:](self, "setBounds:");

  self->_layoutContext = (THNoteCardLayoutContext *)a3;
  [(THNoteCardContentLayer *)self->_frontLayer setLayoutContext:a3];
  [(THNoteCardContentLayer *)self->_backLayer setLayoutContext:a3];
  [(THNoteCardLayer *)self p_rebuildNoteTransform];

  [(THNoteCardLayer *)self setNeedsLayout];
}

- (THNoteCardContentLayer)upwardFacingLayer
{
  if (self->_transformParams.flipped) {
    return [(THNoteCardLayer *)self backLayer];
  }
  else {
    return [(THNoteCardLayer *)self frontLayer];
  }
}

- (THNoteCardContentLayer)downwardFacingLayer
{
  if (self->_transformParams.flipped) {
    return [(THNoteCardLayer *)self frontLayer];
  }
  else {
    return [(THNoteCardLayer *)self backLayer];
  }
}

- (int64_t)cardIndex
{
  return self->_transformParams.cardIndex;
}

- (void)setCardIndex:(int64_t)a3
{
  p_transformParams = &self->_transformParams;
  self->_transformParams.cardIndex = a3;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
  CGPoint filteredOutDirection = p_transformParams->filteredOutDirection;
  v8[4] = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  v8[5] = filteredOutDirection;
  v8[6] = *(_OWORD *)&p_transformParams->scaleFactor;
  CGPoint dragAnchor = p_transformParams->dragAnchor;
  v8[0] = *(_OWORD *)&p_transformParams->cardIndex;
  v8[1] = dragAnchor;
  long long v7 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  v8[2] = p_transformParams->dragOffset;
  v8[3] = v7;
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:v8] & 0xFFFFFFFFFFLL animated:0 duration:0.0];
}

- (BOOL)isTopCard
{
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  v6[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v6[5] = filteredOutDirection;
  v6[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v6[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v6[1] = dragAnchor;
  long long v4 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v6[2] = self->_transformParams.dragOffset;
  v6[3] = v4;
  return [(THNoteCardLayer *)self p_isTopCardParameters:v6];
}

- (BOOL)isBottomCard
{
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  v6[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v6[5] = filteredOutDirection;
  v6[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v6[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v6[1] = dragAnchor;
  long long v4 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v6[2] = self->_transformParams.dragOffset;
  v6[3] = v4;
  return [(THNoteCardLayer *)self p_isBottomCardParameters:v6];
}

- (int64_t)offsetFromTopOfDeck
{
  return (int64_t)[(THNoteCardLayerDelegate *)self->_delegate noteCardLayerCount]
       + ~self->_transformParams.cardIndex;
}

- (BOOL)darkMode
{
  return [(THNoteCardContentLayer *)self->_frontLayer darkMode];
}

- (void)setDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  -[THNoteCardContentLayer setDarkMode:](self->_backLayer, "setDarkMode:");
  frontLayer = self->_frontLayer;

  [(THNoteCardContentLayer *)frontLayer setDarkMode:v3];
}

- (BOOL)isFlipped
{
  return self->_transformParams.flipped;
}

- (void)setFlipped:(BOOL)a3
{
  if (self->_transformParams.flipped != a3)
  {
    self->_transformParams.flipped = a3;
    [(THNoteCardLayer *)self p_rebuildNoteTransform];
  }
}

- (int)poppedState
{
  return self->_transformParams.poppedState;
}

- (void)setPoppedState:(int)a3
{
  if (self->_transformParams.poppedState != a3)
  {
    self->_transformParams.poppedState = a3;
    [(THNoteCardLayer *)self p_rebuildNoteTransform];
  }
}

- (CGPoint)dragAnchor
{
  double x = self->_transformParams.dragAnchor.x;
  double y = self->_transformParams.dragAnchor.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragAnchor:(CGPoint)a3
{
  self->_transformParams.CGPoint dragAnchor = a3;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (CGPoint)dragOffset
{
  double x = self->_transformParams.dragOffset.x;
  double y = self->_transformParams.dragOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setDragOffset:(CGPoint)a3
{
  self->_transformParams.dragOffset = a3;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (BOOL)forceHidden
{
  return self->_transformParams.forceHidden;
}

- (void)setForceHidden:(BOOL)a3
{
  self->_transformParams.forceHidden = a3;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (BOOL)flownOut
{
  return self->_transformParams.flownOut;
}

- (void)setFlownOut:(BOOL)a3
{
  self->_transformParams.flownOut = a3;
  self->_transformParams.flownOutDirection = (CGPoint)xmmword_3446E0;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4
{
  self->_transformParams.flownOut = a3;
  self->_transformParams.flownOutDirection = a4;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (BOOL)filteredOut
{
  return self->_transformParams.filteredOut;
}

- (void)setFilteredOut:(BOOL)a3
{
  self->_transformParams.filteredOut = a3;
  self->_transformParams.CGPoint filteredOutDirection = (CGPoint)xmmword_3446E0;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4
{
  self->_transformParams.filteredOut = a3;
  self->_transformParams.CGPoint filteredOutDirection = a4;
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
}

- (BOOL)draggedPastThreshold
{
  [(THNoteCardLayer *)self bounds];
  [(THNoteCardLayer *)self bounds];
  TSDPointLength();
  double v4 = v3 + v3;
  if ([(THNoteCardLayer *)self isBottomCard]) {
    return v4 >= 0.100000001;
  }
  else {
    return v4 >= 0.5;
  }
}

- (BOOL)isPointInsideFlipGlyph:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(THNoteCardLayer *)self upwardFacingLayer];
  -[THNoteCardContentLayer convertPoint:fromLayer:](v6, "convertPoint:fromLayer:", self, x, y);
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(THNoteCardContentLayer *)v6 flipGlyphFrame];
  uint64_t v15 = v8;
  uint64_t v16 = v10;

  return CGRectContainsPoint(*(CGRect *)&v11, *(CGPoint *)&v15);
}

- (NSArray)interactiveLayers
{
  v2 = [(THNoteCardLayer *)self upwardFacingLayer];

  return [(THNoteCardContentLayer *)v2 interactiveLayers];
}

- (BOOL)p_isTopCardParameters:(_THNoteTransformParameters *)a3
{
  cardIndedouble x = (char *)a3->cardIndex;
  return cardIndex == (char *)[(THNoteCardLayerDelegate *)self->_delegate noteCardLayerCount] - 1;
}

- (BOOL)p_isBottomCardParameters:(_THNoteTransformParameters *)a3
{
  return a3->cardIndex == 0;
}

- (void)p_applyNoteTransform:(_THNoteTransform *)a3
{
  p_transform = &self->_transform;
  memcpy(&self->_transform, a3, sizeof(self->_transform));
  long long v5 = *(_OWORD *)&p_transform->xform.m33;
  v14[4] = *(_OWORD *)&p_transform->xform.m31;
  v14[5] = v5;
  long long v6 = *(_OWORD *)&p_transform->xform.m43;
  v14[6] = *(_OWORD *)&p_transform->xform.m41;
  v14[7] = v6;
  long long v7 = *(_OWORD *)&p_transform->xform.m13;
  v14[0] = *(_OWORD *)&p_transform->xform.m11;
  v14[1] = v7;
  long long v8 = *(_OWORD *)&p_transform->xform.m23;
  v14[2] = *(_OWORD *)&p_transform->xform.m21;
  v14[3] = v8;
  [(THNoteCardLayer *)self setTransform:v14];
  [(THNoteCardLayer *)self setZPosition:p_transform->zPosition];
  [(THNoteCardLayer *)self bounds];
  TSDRectWithCenterAndSize();
  TSDRoundedRect();
  TSDCenterOfRect();
  -[THNoteCardLayer setPosition:](self, "setPosition:");
  long long v9 = *(_OWORD *)&p_transform->sublayerXform.m33;
  v13[4] = *(_OWORD *)&p_transform->sublayerXform.m31;
  v13[5] = v9;
  long long v10 = *(_OWORD *)&p_transform->sublayerXform.m43;
  v13[6] = *(_OWORD *)&p_transform->sublayerXform.m41;
  v13[7] = v10;
  long long v11 = *(_OWORD *)&p_transform->sublayerXform.m13;
  v13[0] = *(_OWORD *)&p_transform->sublayerXform.m11;
  v13[1] = v11;
  long long v12 = *(_OWORD *)&p_transform->sublayerXform.m23;
  v13[2] = *(_OWORD *)&p_transform->sublayerXform.m21;
  v13[3] = v12;
  [(THNoteCardLayer *)self setSublayerTransform:v13];
}

- (void)p_rebuildNoteTransform
{
  if (self->_delegate)
  {
    CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
    v7[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
    v7[5] = filteredOutDirection;
    v7[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
    CGPoint dragAnchor = self->_transformParams.dragAnchor;
    v7[0] = *(_OWORD *)&self->_transformParams.cardIndex;
    v7[1] = dragAnchor;
    long long v5 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
    v7[2] = self->_transformParams.dragOffset;
    v7[3] = v5;
    [(THNoteCardLayer *)self p_noteTransformForParameters:v7];
    memcpy(__dst, __src, sizeof(__dst));
    [(THNoteCardLayer *)self p_applyNoteTransform:__dst];
  }
}

- (_THNoteTransform)p_noteTransformForParameters:(SEL)a3
{
  retstr->zPosition = 0.0;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v8 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&retstr->xform.m31 = v7;
  *(_OWORD *)&retstr->xform.m33 = v8;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&retstr->xform.m41 = v9;
  *(_OWORD *)&retstr->xform.m43 = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&retstr->xform.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&retstr->xform.m13 = v12;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v14 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&retstr->xform.m21 = v13;
  *(_OWORD *)&retstr->xform.m23 = v14;
  p_sublayerXform = &retstr->sublayerXform;
  *(_OWORD *)&retstr->sublayerXform.m43 = v10;
  *(_OWORD *)&retstr->sublayerXform.m41 = v9;
  *(_OWORD *)&retstr->sublayerXform.m33 = v8;
  *(_OWORD *)&retstr->sublayerXform.m31 = v7;
  *(_OWORD *)&retstr->sublayerXform.m23 = v14;
  *(_OWORD *)&retstr->sublayerXform.m21 = v13;
  *(_OWORD *)&retstr->sublayerXform.m13 = v12;
  *(_OWORD *)&retstr->sublayerXform.m11 = v11;
  retstr->position = CGPointZero;
  TSDPointLength();
  if (v16 <= 0.0)
  {
    double v21 = 1.0;
    double v20 = 0.0;
    double y = 0.0;
  }
  else
  {
    [(THNoteCardLayer *)self bounds];
    [(THNoteCardLayer *)self bounds];
    double x = a4->dragOffset.x;
    if (a4->flipped) {
      double y = 0.0;
    }
    else {
      double y = a4->dragOffset.y;
    }
    TSDPointLength();
    *(float *)&double v19 = v19 + v19;
    double v20 = fminf(atanf(*(float *)&v19) * 50.0, 75.0);
    double v21 = -x;
  }
  int64_t v22 = a4->cardIndex - (void)[(THNoteCardLayerDelegate *)self->_delegate noteCardLayerCount] + 1;
  CGPoint filteredOutDirection = a4->filteredOutDirection;
  v106[4] = *(_OWORD *)&a4->flownOutDirection.y;
  v106[5] = filteredOutDirection;
  v106[6] = *(_OWORD *)&a4->scaleFactor;
  CGPoint dragAnchor = a4->dragAnchor;
  v106[0] = *(_OWORD *)&a4->cardIndex;
  v106[1] = dragAnchor;
  CGPoint dragOffset = a4->dragOffset;
  v106[3] = *(_OWORD *)&a4->shuffleAnimationState;
  v106[2] = dragOffset;
  unsigned __int8 v26 = [(THNoteCardLayer *)self p_isTopCardParameters:v106];
  CGPoint v27 = a4->filteredOutDirection;
  v105[4] = *(_OWORD *)&a4->flownOutDirection.y;
  v105[5] = v27;
  v105[6] = *(_OWORD *)&a4->scaleFactor;
  CGPoint v28 = a4->dragAnchor;
  v105[0] = *(_OWORD *)&a4->cardIndex;
  v105[1] = v28;
  CGPoint v29 = a4->dragOffset;
  v105[3] = *(_OWORD *)&a4->shuffleAnimationState;
  v105[2] = v29;
  unsigned int v30 = [(THNoteCardLayer *)self p_isBottomCardParameters:v105];
  CGFloat v31 = CGPointZero.x;
  CGFloat v32 = CGPointZero.y;
  long long v33 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&p_sublayerXform->m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&p_sublayerXform->m33 = v33;
  long long v34 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&p_sublayerXform->m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&p_sublayerXform->m43 = v34;
  long long v35 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&p_sublayerXform->m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&p_sublayerXform->m13 = v35;
  int8x16_t v36 = *(int8x16_t *)&CATransform3DIdentity.m21;
  int8x16_t v37 = *(int8x16_t *)&CATransform3DIdentity.m23;
  *(int8x16_t *)&p_sublayerXform->m21 = v36;
  *(int8x16_t *)&p_sublayerXform->m23 = v37;
  if (a4->flipped)
  {
    double v20 = -v20;
    CATransform3DMakeRotation(&v104, 3.14159265, 0.0, 1.0, 0.0);
    long long v38 = *(_OWORD *)&v104.m33;
    *(_OWORD *)&p_sublayerXform->m31 = *(_OWORD *)&v104.m31;
    *(_OWORD *)&p_sublayerXform->m33 = v38;
    long long v39 = *(_OWORD *)&v104.m43;
    *(_OWORD *)&p_sublayerXform->m41 = *(_OWORD *)&v104.m41;
    *(_OWORD *)&p_sublayerXform->m43 = v39;
    long long v40 = *(_OWORD *)&v104.m13;
    *(_OWORD *)&p_sublayerXform->m11 = *(_OWORD *)&v104.m11;
    *(_OWORD *)&p_sublayerXform->m13 = v40;
    int8x16_t v36 = *(int8x16_t *)&v104.m21;
    int8x16_t v37 = *(int8x16_t *)&v104.m23;
    *(_OWORD *)&p_sublayerXform->m21 = *(_OWORD *)&v104.m21;
    *(int8x16_t *)&p_sublayerXform->m23 = v37;
  }
  uint64_t v41 = v22 & (v22 >> 63);
  if ((v26 & 1) != 0 || a4->shuffleAnimationState == 2)
  {
    double v42 = 0.0;
    if (!a4->flipped)
    {
      double v43 = a4->dragOffset.x;
      TSDPointLength();
      if (*(double *)v36.i64 > 0.0)
      {
        float v44 = v43 / 300.0;
        *(double *)v36.i64 = (float)(atanf(v44) * 7.5);
        v37.i32[1] = -1080959162;
        double v42 = *(double *)v36.i64 * -0.0174532925;
      }
    }
  }
  else
  {
    double v42 = 0.0;
    if (!a4->forceHidden)
    {
      if (v30)
      {
        [(THNoteCardLayoutContext *)self->_layoutContext bottomCardAngle];
        double v42 = v45 * 0.0174532925;
        [(THNoteCardLayoutContext *)self->_layoutContext bottomCardOffset];
        CGFloat v31 = v46;
        CGFloat v32 = v47;
        [(THNoteCardLayerDelegate *)self->_delegate dragOffset];
        double v20 = 0.0;
        if (*(double *)v36.i64 > 0.0)
        {
          float v48 = *(double *)v36.i64 / 100.0;
          atanf(fabsf(v48));
          [(THNoteCardLayoutContext *)self->_layoutContext scale];
          if (v49 != 0.0) {
            [(THNoteCardLayoutContext *)self->_layoutContext scale];
          }
          TSDMultiplyPointScalar();
          TSDMultiplyPointScalar();
          CGFloat v31 = *(double *)v36.i64;
          CGFloat v32 = *(double *)v37.i64;
        }
      }
    }
  }
  if (a4->flownOut)
  {
    if (v41 == -1)
    {
      v36.i64[0] = 0xBFB1DF46A2529D39;
    }
    else
    {
      if (v41) {
        goto LABEL_26;
      }
      v36.i64[0] = 0x3FB1DF46A2529D39;
    }
    double v42 = v42 + *(double *)v36.i64;
  }
LABEL_26:
  if (a4->flattenFlipped)
  {
    *(float *)v37.i32 = v20;
    int8x16_t v91 = v37;
    v36.i32[0] = 1127481344;
    v50.i64[0] = 0x8000000080000000;
    v50.i64[1] = 0x8000000080000000;
    double v51 = *(float *)vbslq_s8(v50, v36, v37).i32;
    TSDPointLength();
    *(double *)v53.i64 = fabs(*(double *)v53.i64);
    BOOL v52 = *(double *)v53.i64 < 0.00999999978;
    v53.i32[0] = 1110704128;
    if (v52) {
      *(float *)v53.i32 = 0.0;
    }
    v54.i64[0] = 0x8000000080000000;
    v54.i64[1] = 0x8000000080000000;
    double v20 = v51 - *(float *)vbslq_s8(v54, v53, v91).i32;
    double v42 = -v42;
  }
  if (a4->filteredOut || a4->forceHidden) {
    double v42 = 0.0;
  }
  long long v55 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v104.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v104.m33 = v55;
  long long v56 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v104.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v104.m43 = v56;
  long long v57 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v104.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v104.m13 = v57;
  long long v58 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v104.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v104.m23 = v58;
  *(_OWORD *)&a.m11 = *(_OWORD *)&v104.m11;
  *(_OWORD *)&a.m13 = v57;
  *(_OWORD *)&a.m21 = *(_OWORD *)&v104.m21;
  *(_OWORD *)&a.m23 = v58;
  *(_OWORD *)&a.m43 = v56;
  *(_OWORD *)&a.m41 = *(_OWORD *)&v104.m41;
  *(_OWORD *)&a.m33 = v55;
  *(_OWORD *)&a.m31 = *(_OWORD *)&v104.m31;
  double v59 = 0.0;
  CATransform3DMakeRotation(&b, v42, 0.0, 0.0, 1.0);
  CATransform3DConcat(&v104, &a, &b);
  CATransform3D v100 = v104;
  CATransform3DMakeRotation(&v99, v20 * 0.0174532925, y, v21, 0.0);
  CATransform3DConcat(&v101, &v100, &v99);
  CATransform3D v104 = v101;
  memset(&v101, 0, sizeof(v101));
  CATransform3D v98 = v104;
  CATransform3DMakeTranslation(&v97, v31, v32, 0.0);
  CATransform3DConcat(&v101, &v98, &v97);
  memset(&v96, 0, sizeof(v96));
  CATransform3D v95 = v101;
  CATransform3DMakeScale(&v94, a4->scaleFactor, a4->scaleFactor, 1.0);
  CATransform3DConcat(&v96, &v95, &v94);
  long long v60 = *(_OWORD *)&v96.m33;
  *(_OWORD *)&retstr->xform.m31 = *(_OWORD *)&v96.m31;
  *(_OWORD *)&retstr->xform.m33 = v60;
  long long v61 = *(_OWORD *)&v96.m43;
  *(_OWORD *)&retstr->xform.m41 = *(_OWORD *)&v96.m41;
  *(_OWORD *)&retstr->xform.m43 = v61;
  long long v62 = *(_OWORD *)&v96.m13;
  *(_OWORD *)&retstr->xform.m11 = *(_OWORD *)&v96.m11;
  *(_OWORD *)&retstr->xform.m13 = v62;
  long long v63 = *(_OWORD *)&v96.m23;
  *(_OWORD *)&retstr->xform.m21 = *(_OWORD *)&v96.m21;
  *(_OWORD *)&retstr->xform.m23 = v63;
  TSDPointLength();
  if (v64 != 0.0)
  {
    [(THNoteCardLayer *)self bounds];
    CGRectGetWidth(v107);
    [(THNoteCardLayer *)self bounds];
    CGRectGetHeight(v108);
    [(THNoteCardLayer *)self bounds];
    TSDRectWithOriginAndSize();
    CATransform3D v92 = v104;
    THBoundingCubeForTransformedRect(v109, &v92, v93);
    double v65 = 0.5;
    if (!a4->flipped) {
      double v65 = 1.0;
    }
    float v66 = v93[2];
    double v59 = v65 * fmaxf(-v66, 0.0);
  }
  if (a4->poppedState == 3) {
    double v67 = v59 + 90.0;
  }
  else {
    double v67 = v59;
  }
  if ((v26 & 1) == 0
    && ([(THNoteCardLayerDelegate *)self->_delegate topNoteCardIsFlipped] & 1) == 0
    && [(THNoteCardLayerDelegate *)self->_delegate isDraggingTopCard])
  {
    [(THNoteCardLayerDelegate *)self->_delegate dragOffset];
    *(float *)&double v68 = v68 / 150.0;
    double v67 = v67 + atanf(fabsf(*(float *)&v68)) * 53.9999986;
  }
  retstr->zPosition = v67 + (double)(5 * v41);
  if (![(THNoteCardLayer *)self superlayer])
  {
    CGPoint result = (_THNoteTransform *)[(THNoteCardLayer *)self position];
    goto LABEL_49;
  }
  TSDMultiplyPointScalar();
  double v70 = v69;
  double v72 = v71;
  double v74 = CGPointZero.x;
  double v73 = CGPointZero.y;
  if (a4->filteredOut)
  {
    [(THNoteCardLayerDelegate *)self->_delegate offscreenNoteDistance];
    TSDMultiplyPointScalar();
    double v76 = v75;
    double v78 = v77;
  }
  else
  {
    if (!a4->flownOut)
    {
      double v76 = CGPointZero.x;
      double v78 = CGPointZero.y;
      goto LABEL_47;
    }
    [(THNoteCardLayerDelegate *)self->_delegate offscreenNoteDistance];
    TSDMultiplyPointScalar();
    double v76 = v88;
    double v78 = v89;
    if (a4->flownOut)
    {
      if (v41 == -2)
      {
        double v73 = 0.0;
        *(double *)&uint64_t v90 = 60.0;
      }
      else if (v41 == -1)
      {
        double v73 = 0.0;
        *(double *)&uint64_t v90 = 120.0;
      }
      else
      {
        if (v41) {
          goto LABEL_47;
        }
        double v73 = 0.0;
        *(double *)&uint64_t v90 = 200.0;
      }
      double v74 = *(double *)&v90;
    }
  }
LABEL_47:
  [self.superlayer bounds];
  TSDCenterOfRect();
  double v81 = v74 + v76 + v70 + v79 + a4->dragOffset.x;
  double v82 = v73 + v78 + v72 + v80 + a4->dragOffset.y;
  CGPoint result = (_THNoteTransform *)[(THNoteCardLayoutContext *)self->_layoutContext noteCardOffset];
  double v85 = v81 + v84;
  double v87 = v82 + v86;
LABEL_49:
  retstr->position.double x = v85;
  retstr->position.double y = v87;
  return result;
}

- (_THNoteCardDisplayAttributes)p_displayAttributesForParameters:(_THNoteTransformParameters *)a3
{
  CGPoint filteredOutDirection = a3->filteredOutDirection;
  v19[4] = *(_OWORD *)&a3->flownOutDirection.y;
  v19[5] = filteredOutDirection;
  v19[6] = *(_OWORD *)&a3->scaleFactor;
  CGPoint dragAnchor = a3->dragAnchor;
  v19[0] = *(_OWORD *)&a3->cardIndex;
  v19[1] = dragAnchor;
  long long v7 = *(_OWORD *)&a3->shuffleAnimationState;
  v19[2] = a3->dragOffset;
  v19[3] = v7;
  unsigned int v8 = [(THNoteCardLayer *)self p_isTopCardParameters:v19];
  CGPoint v9 = a3->filteredOutDirection;
  v18[4] = *(_OWORD *)&a3->flownOutDirection.y;
  v18[5] = v9;
  v18[6] = *(_OWORD *)&a3->scaleFactor;
  CGPoint v10 = a3->dragAnchor;
  v18[0] = *(_OWORD *)&a3->cardIndex;
  v18[1] = v10;
  long long v11 = *(_OWORD *)&a3->shuffleAnimationState;
  v18[2] = a3->dragOffset;
  v18[3] = v11;
  unsigned int v12 = [(THNoteCardLayer *)self p_isBottomCardParameters:v18];
  if (v8)
  {
    id v13 = [(THNoteCardInfo *)self->_noteCardInfo hasBackContent];
    uint64_t useDarkerBackground = a3->useDarkerBackground;
    unsigned int v15 = 1;
  }
  else
  {
    uint64_t useDarkerBackground = 0;
    id v13 = 0;
    unsigned int v15 = v12;
  }
  uint64_t v16 = 0x1000000;
  if ((v12 & (v8 ^ 1)) == 0) {
    uint64_t v16 = 0;
  }
  return (_THNoteCardDisplayAttributes)(v16 | (useDarkerBackground << 32) | ((void)v13 << 16) | ((unint64_t)v15 << 8) | v15);
}

- (void)reset
{
  [(THNoteCardContentLayer *)self->_frontLayer reset];
  backLayer = self->_backLayer;

  [(THNoteCardContentLayer *)backLayer reset];
}

- (CGPoint)extendedDragOffsetInDirection:(CGPoint)a3
{
  TSDPointLength();
  TSDNormalizePoint();
  double v5 = v4;
  double v7 = v6;
  [(THNoteCardLayer *)self bounds];
  CGFloat x = v8;
  CGFloat y = v10;
  CGFloat width = v12;
  double height = v14;
  if ([(THNoteCardLayer *)self isFlipped])
  {
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.double height = height;
    CGRect v24 = CGRectInset(v23, 0.0, height * -0.5);
    CGFloat x = v24.origin.x;
    CGFloat y = v24.origin.y;
    CGFloat width = v24.size.width;
    double height = v24.size.height;
  }
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.double height = height;
  v22.CGFloat x = v5;
  v22.CGFloat y = v7;
  double v16 = THDistanceFromRectCenterToEdge(v25, v22);
  if ([(THNoteCardLayer *)self isTopCard])
  {
    unsigned int v17 = [(THNoteCardLayer *)self isFlipped];
    double v18 = 1.0;
    if (!v17) {
      double v18 = 1.60000002;
    }
  }
  else
  {
    double v18 = 2.20000005;
  }
  double v19 = v16 / 0.699999988 * (v5 * v18);
  double v20 = v16 / 0.699999988 * (v7 * v18);
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (void)setCardIndex:(int64_t)a3 animated:(BOOL)a4 duration:(double)a5
{
}

- (void)setCardIndex:(int64_t)a3 forceHidden:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  BOOL v30 = a5;
  BOOL v8 = a4;
  [(THNoteCardLayer *)self p_willUnsettle];
  __int16 v11 = *(_WORD *)&self->_transformParams.flipped;
  __int16 v31 = v11;
  long long v12 = *(long long *)((char *)&self->_transformParams.flownOutDirection + 3);
  long long v13 = *(_OWORD *)((char *)&self->_transformParams.filteredOutDirection.y + 3);
  long long v68 = *(_OWORD *)(&self->_transformParams.filteredOut + 3);
  v69[0] = v13;
  *(void *)((char *)v69 + 13) = *(void *)&self->_transformParams.useDarkerBackground;
  long long v14 = *(_OWORD *)((char *)&self->_transformParams.dragAnchor.y + 3);
  long long v64 = *(_OWORD *)(&self->_transformParams.forceHidden + 1);
  long long v65 = v14;
  long long v66 = *(_OWORD *)((char *)&self->_transformParams.dragOffset.y + 3);
  long long v67 = v12;
  int64_t v44 = a3;
  __int16 v45 = v11;
  BOOL v46 = v8;
  long long v15 = *(_OWORD *)(&self->_transformParams.forceHidden + 1);
  long long v16 = *(_OWORD *)((char *)&self->_transformParams.dragAnchor.y + 3);
  long long v49 = *(_OWORD *)((char *)&self->_transformParams.dragOffset.y + 3);
  long long v48 = v16;
  long long v47 = v15;
  long long v17 = *(long long *)((char *)&self->_transformParams.flownOutDirection + 3);
  long long v18 = *(_OWORD *)(&self->_transformParams.filteredOut + 3);
  long long v19 = *(_OWORD *)((char *)&self->_transformParams.filteredOutDirection.y + 3);
  *(void *)&v52[13] = *(void *)&self->_transformParams.useDarkerBackground;
  *(_OWORD *)BOOL v52 = v19;
  long long v51 = v18;
  long long v50 = v17;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v44];
  if (!v7) {
    a6 = 0.0;
  }
  double v20 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
  double zPosition = self->_transform.zPosition;
  *(float *)&double zPosition = zPosition;
  [(CABasicAnimation *)v20 setFromValue:+[NSNumber numberWithFloat:zPosition]];
  HIDWORD(v22) = HIDWORD(v53);
  *(float *)&double v22 = v53;
  [(CABasicAnimation *)v20 setToValue:+[NSNumber numberWithFloat:v22]];
  [(CABasicAnimation *)v20 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  CGRect v23 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  long long v24 = *(_OWORD *)&self->_transform.xform.m33;
  v43[4] = *(_OWORD *)&self->_transform.xform.m31;
  v43[5] = v24;
  long long v25 = *(_OWORD *)&self->_transform.xform.m43;
  v43[6] = *(_OWORD *)&self->_transform.xform.m41;
  v43[7] = v25;
  long long v26 = *(_OWORD *)&self->_transform.xform.m13;
  v43[0] = *(_OWORD *)&self->_transform.xform.m11;
  v43[1] = v26;
  long long v27 = *(_OWORD *)&self->_transform.xform.m23;
  v43[2] = *(_OWORD *)&self->_transform.xform.m21;
  v43[3] = v27;
  [(CABasicAnimation *)v23 setFromValue:+[NSValue valueWithCATransform3D:v43]];
  v42[4] = v58;
  v42[5] = v59;
  v42[6] = v60;
  v42[7] = v61;
  v42[0] = v54;
  v42[1] = v55;
  v42[2] = v56;
  v42[3] = v57;
  [(CABasicAnimation *)v23 setToValue:+[NSValue valueWithCATransform3D:v42]];
  [(CABasicAnimation *)v23 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  CGPoint v28 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v28 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y)];
  [(CABasicAnimation *)v28 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v62, v63)];
  [(CABasicAnimation *)v28 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  id v29 = +[CAAnimationGroup animation];
  [v29 setAnimations:[NSArray arrayWithObjects:v20, v23, v28, 0]];
  [v29 setDuration:a6];
  [v29 setDelegate:self];
  [(THNoteCardLayer *)self addAnimation:v29 forKey:@"cardIndexAnimation"];
  long long v39 = v67;
  long long v40 = v68;
  *(_OWORD *)uint64_t v41 = v69[0];
  long long v36 = v64;
  long long v37 = v65;
  int64_t v33 = a3;
  __int16 v34 = v31;
  BOOL v35 = v8;
  *(void *)&v41[13] = *(void *)((char *)v69 + 13);
  long long v38 = v66;
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:&v33] & 0xFFFFFFFFFFLL animated:v30 duration:a6];
  [(THNoteCardLayer *)self setForceHidden:v8];
  [(THNoteCardLayer *)self setCardIndex:a3];
}

- (void)flipAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  if (v5)
  {
    BOOL v7 = +[NSNumber numberWithFloat:0.0];
    LODWORD(v8) = 1051372203;
    CGPoint v9 = +[NSNumber numberWithFloat:v8];
    LODWORD(v10) = 1059760811;
    __int16 v11 = +[NSNumber numberWithFloat:v10];
    LODWORD(v12) = 1.0;
    long long v13 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v9, v11, +[NSNumber numberWithFloat:v12], 0);
    long long v14 = +[CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
    [(THNoteCardLayer *)self zPosition];
    double v16 = v15;
    [(THNoteCardLayer *)self zPosition];
    double v18 = v17;
    [(THNoteCardLayer *)self bounds];
    double v20 = v18 + (v19 + 20.0) * 0.5;
    [(CAKeyframeAnimation *)v14 setKeyTimes:v13];
    *(float *)&double v16 = v16;
    LODWORD(v21) = LODWORD(v16);
    double v22 = +[NSNumber numberWithFloat:v21];
    *(float *)&double v23 = v20;
    long long v24 = +[NSNumber numberWithFloat:v23];
    LODWORD(v25) = LODWORD(v16);
    long long v26 = +[NSNumber numberWithFloat:v25];
    LODWORD(v27) = LODWORD(v16);
    [(CAKeyframeAnimation *)v14 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v22, v24, v26, +[NSNumber numberWithFloat:v27], 0)];
    [(CAKeyframeAnimation *)v14 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 0)];
    if (self->_transformParams.flipped) {
      double v28 = -1.0;
    }
    else {
      double v28 = 1.0;
    }
    id v29 = +[CAKeyframeAnimation animationWithKeyPath:@"sublayerTransform"];
    memset(&v55, 0, sizeof(v55));
    [(THNoteCardLayer *)self sublayerTransform];
    CATransform3D v54 = v55;
    CATransform3D a = v55;
    CATransform3DMakeRotation(&b, v28 * -90.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v54, &a, &b);
    CATransform3D v50 = v54;
    CATransform3DMakeRotation(&v49, v28 * -2.0 * 0.0174532925, 0.0, 0.0, 1.0);
    CATransform3DConcat(&v51, &v50, &v49);
    CATransform3D v54 = v51;
    CATransform3D v48 = v51;
    CATransform3DMakeTranslation(&v47, v28 * 160.0, 0.0, 0.0);
    CATransform3DConcat(&v51, &v48, &v47);
    CATransform3D v54 = v51;
    CATransform3D v51 = v55;
    CATransform3D v46 = v55;
    CATransform3DMakeRotation(&v45, v28 * -180.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v51, &v46, &v45);
    CATransform3D v43 = v51;
    CATransform3DMakeRotation(&v42, v28 * -1.25 * 0.0174532925, 0.0, 0.0, 1.0);
    CATransform3DConcat(&v44, &v43, &v42);
    CATransform3D v51 = v44;
    CATransform3D v41 = v44;
    CATransform3DMakeTranslation(&v40, v28 * 10.0, 0.0, 0.0);
    CATransform3DConcat(&v44, &v41, &v40);
    CATransform3D v51 = v44;
    CATransform3D v44 = v55;
    CATransform3D v39 = v55;
    CATransform3DMakeRotation(&v38, v28 * -180.0 * 0.0174532925, 0.0, 1.0, 0.0);
    CATransform3DConcat(&v44, &v39, &v38);
    [(CAKeyframeAnimation *)v29 setKeyTimes:v13];
    [(CAKeyframeAnimation *)v29 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], 0)];
    CATransform3D v37 = v55;
    BOOL v30 = +[NSValue valueWithCATransform3D:&v37];
    CATransform3D v36 = v54;
    __int16 v31 = +[NSValue valueWithCATransform3D:&v36];
    CATransform3D v35 = v51;
    CGFloat v32 = +[NSValue valueWithCATransform3D:&v35];
    CATransform3D v34 = v44;
    [(CAKeyframeAnimation *)v29 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v30, v31, v32, +[NSValue valueWithCATransform3D:&v34], 0)];
    id v33 = +[CAAnimationGroup animation];
    [v33 setAnimations:[NSArray arrayWithObjects:v14, v29, 0]];
    [v33 setDuration:a4];
    [v33 setDelegate:self];
    [(THNoteCardLayer *)self addAnimation:v33 forKey:@"cardFlipAnimation"];
  }
  [(THNoteCardLayer *)self setFlipped:[(THNoteCardLayer *)self isFlipped] ^ 1];
}

- (void)popAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  if ((self->_transformParams.poppedState | 2) == 2)
  {
    if (!v5) {
      a4 = 0.0;
    }
    BOOL v7 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
    [(CABasicAnimation *)v7 setAdditive:1];
    [(CABasicAnimation *)v7 setFromValue:+[NSNumber numberWithFloat:0.0]];
    LODWORD(v8) = 1119092736;
    [(CABasicAnimation *)v7 setToValue:+[NSNumber numberWithFloat:v8]];
    [(CABasicAnimation *)v7 setDelegate:self];
    [(CABasicAnimation *)v7 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v7 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)v7 setDuration:a4];
    [(THNoteCardLayer *)self addAnimation:v7 forKey:@"cardPopAnimation"];
  }

  [(THNoteCardLayer *)self setPoppedState:1];
}

- (void)unpopAnimated:(BOOL)a3 duration:(double)a4
{
  if ((self->_transformParams.poppedState | 2) == 3)
  {
    if (!a3) {
      a4 = 0.0;
    }
    double v6 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
    [(CABasicAnimation *)v6 setAdditive:1];
    [(CABasicAnimation *)v6 setFromValue:+[NSNumber numberWithFloat:0.0]];
    LODWORD(v7) = -1028390912;
    [(CABasicAnimation *)v6 setToValue:+[NSNumber numberWithFloat:v7]];
    [(CABasicAnimation *)v6 setDelegate:self];
    [(CABasicAnimation *)v6 setRemovedOnCompletion:0];
    [(CABasicAnimation *)v6 setFillMode:kCAFillModeBoth];
    [(CABasicAnimation *)v6 setDuration:a4];
    [(THNoteCardLayer *)self addAnimation:v6 forKey:@"cardUnpopAnimation"];
  }

  [(THNoteCardLayer *)self setPoppedState:2];
}

- (void)cancelDragAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  cardIndeCGFloat x = self->_transformParams.cardIndex;
  int v7 = *(_DWORD *)&self->_transformParams.flipped;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  long long v9 = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  long long v29 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  long long v30 = v9;
  long long v10 = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  long long v32 = v10;
  CGPoint v11 = CGPointZero;
  CGPoint v44 = dragAnchor;
  CGPoint v45 = v11;
  int v25 = v7;
  int v26 = 0;
  CGPoint v27 = dragAnchor;
  CGPoint v28 = v11;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&cardIndex];
  if (!v5) {
    a4 = 0.0;
  }
  double v12 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
  double zPosition = self->_transform.zPosition;
  *(float *)&double zPosition = zPosition;
  [(CABasicAnimation *)v12 setFromValue:+[NSNumber numberWithFloat:zPosition]];
  HIDWORD(v14) = HIDWORD(v33);
  *(float *)&double v14 = v33;
  [(CABasicAnimation *)v12 setToValue:+[NSNumber numberWithFloat:v14]];
  [(CABasicAnimation *)v12 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
  double v15 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  long long v16 = *(_OWORD *)&self->_transform.xform.m33;
  v23[4] = *(_OWORD *)&self->_transform.xform.m31;
  v23[5] = v16;
  long long v17 = *(_OWORD *)&self->_transform.xform.m43;
  v23[6] = *(_OWORD *)&self->_transform.xform.m41;
  v23[7] = v17;
  long long v18 = *(_OWORD *)&self->_transform.xform.m13;
  v23[0] = *(_OWORD *)&self->_transform.xform.m11;
  v23[1] = v18;
  long long v19 = *(_OWORD *)&self->_transform.xform.m23;
  v23[2] = *(_OWORD *)&self->_transform.xform.m21;
  v23[3] = v19;
  [(CABasicAnimation *)v15 setFromValue:+[NSValue valueWithCATransform3D:v23]];
  v22[4] = v38;
  v22[5] = v39;
  v22[6] = v40;
  v22[7] = v41;
  v22[0] = v34;
  v22[1] = v35;
  v22[2] = v36;
  v22[3] = v37;
  [(CABasicAnimation *)v15 setToValue:+[NSValue valueWithCATransform3D:v22]];
  [(CABasicAnimation *)v15 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  double v20 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v20 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y)];
  [(CABasicAnimation *)v20 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v42, v43)];
  [(CABasicAnimation *)v20 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
  id v21 = +[CAAnimationGroup animation];
  [v21 setAnimations:[NSArray arrayWithObjects:v12, v15, v20, 0]];
  [v21 setDuration:a4];
  [v21 setDelegate:self];
  [(THNoteCardLayer *)self addAnimation:v21 forKey:@"cancelDragAnimation"];
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  [(THNoteCardLayer *)self setPoppedState:0];
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
}

- (void)completeDragInDirection:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  double y = a3.y;
  double x = a3.x;
  [(THNoteCardLayer *)self p_willUnsettle];
  -[THNoteCardLayer extendedDragOffsetInDirection:](self, "extendedDragOffsetInDirection:", x, y);
  double v15 = v14;
  double v17 = v16;
  if ([(THNoteCardLayer *)self isFlipped])
  {
    -[THNoteCardLayer p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:](self, "p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:", a4, v9, a7, v15, v17, a6);
  }
  else
  {
    -[THNoteCardLayer p_completeDragViaDragOffset:newCardIndex:animated:duration:completion:](self, "p_completeDragViaDragOffset:newCardIndex:animated:duration:completion:", a4, v9, a7, v15, v17, a6);
  }
}

- (void)shuffleToIndex:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v10 = a4;
  BOOL v71 = a4;
  [(THNoteCardLayer *)self p_willUnsettle];
  +[CATransaction begin];
  +[CATransaction setCompletionBlock:a7];
  [(THNoteCardLayerDelegate *)self->_delegate shuffleOffset:[(THNoteCardLayer *)self cardIndex] & 1];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  cardIndeCGFloat x = self->_transformParams.cardIndex;
  int v17 = *(_DWORD *)&self->_transformParams.flipped;
  int poppedState = self->_transformParams.poppedState;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  CGFloat x = self->_transformParams.dragOffset.x;
  CGFloat y = self->_transformParams.dragOffset.y;
  long long v21 = *(_OWORD *)((char *)&self->_transformParams.flownOutDirection.y + 4);
  long long v171 = *(_OWORD *)&self->_transformParams.flownOut;
  long long v172 = v21;
  v173[0] = *(CGPoint *)((char *)&self->_transformParams.filteredOutDirection + 4);
  *(_OWORD *)((char *)v173 + 12) = *(_OWORD *)&self->_transformParams.scaleFactor;
  int64_t v150 = cardIndex;
  int v151 = v17;
  int v22 = v17;
  int v152 = poppedState;
  int v23 = poppedState;
  int v70 = poppedState;
  CGPoint v153 = self->_transformParams.dragAnchor;
  CGFloat v154 = x;
  CGFloat v155 = y;
  int v156 = 1;
  long long v24 = *(_OWORD *)&self->_transformParams.flownOut;
  long long v25 = *(_OWORD *)((char *)&self->_transformParams.flownOutDirection.y + 4);
  long long v26 = *(long long *)((char *)&self->_transformParams.filteredOutDirection + 4);
  *(_OWORD *)&v159[12] = *(_OWORD *)&self->_transformParams.scaleFactor;
  *(_OWORD *)v159 = v26;
  long long v158 = v25;
  long long v157 = v24;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v150];
  CGPoint v132 = dragAnchor;
  long long v136 = v171;
  int64_t v129 = cardIndex;
  int v130 = v22;
  int v131 = 3;
  CGFloat v133 = x;
  CGFloat v134 = y;
  int v135 = 1;
  long long v137 = v172;
  *(_OWORD *)v138 = v173[0];
  *(_OWORD *)&v138[12] = *(_OWORD *)((char *)v173 + 12);
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v129];
  unint64_t v108 = a3;
  int v109 = v22;
  int v69 = v22;
  int v110 = 3;
  CGPoint v111 = dragAnchor;
  uint64_t v112 = v13;
  uint64_t v113 = v15;
  int v114 = 2;
  long long v115 = v171;
  long long v116 = v172;
  *(_OWORD *)v117 = v173[0];
  *(_OWORD *)&v117[12] = *(_OWORD *)((char *)v173 + 12);
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v108];
  CGPoint v90 = dragAnchor;
  long long v94 = v171;
  unint64_t v87 = a3;
  int v88 = v22;
  int v89 = v23;
  CGFloat v91 = x;
  CGFloat v92 = y;
  int v93 = 3;
  long long v95 = v172;
  *(_OWORD *)CATransform3D v96 = v173[0];
  *(_OWORD *)&v96[12] = *(_OWORD *)((char *)v173 + 12);
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v87];
  if (v10) {
    double v27 = a5 + a6;
  }
  else {
    double v27 = 0.0;
  }
  CGPoint v28 = +[NSNumber numberWithFloat:0.0];
  *(float *)&double v29 = (a5 + a6 * 0.1) / v27;
  long long v30 = +[NSNumber numberWithFloat:v29];
  *(float *)&double v31 = (a5 + a6 * 0.5) / v27;
  long long v32 = +[NSNumber numberWithFloat:v31];
  LODWORD(v33) = 1.0;
  long long v68 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v28, v30, v32, +[NSNumber numberWithFloat:v33], 0);
  long long v34 = +[CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
  [(CAKeyframeAnimation *)v34 setKeyTimes:v68];
  [(CAKeyframeAnimation *)v34 setCalculationMode:kCAAnimationCubic];
  LODWORD(v35) = -0.5;
  long long v36 = +[NSNumber numberWithFloat:v35];
  LODWORD(v37) = -0.5;
  long long v38 = +[NSNumber numberWithFloat:v37];
  LODWORD(v39) = -0.5;
  long long v40 = +[NSNumber numberWithFloat:v39];
  LODWORD(v41) = -0.5;
  [(CAKeyframeAnimation *)v34 setTensionValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v36, v38, v40, +[NSNumber numberWithFloat:v41], 0)];
  HIDWORD(v42) = HIDWORD(v160);
  *(float *)&double v42 = v160;
  double v43 = +[NSNumber numberWithFloat:v42];
  HIDWORD(v44) = HIDWORD(v139);
  *(float *)&double v44 = v139;
  CGPoint v45 = +[NSNumber numberWithFloat:v44];
  HIDWORD(v46) = HIDWORD(v118);
  *(float *)&double v46 = v118;
  CATransform3D v47 = +[NSNumber numberWithFloat:v46];
  HIDWORD(v48) = HIDWORD(v97);
  *(float *)&double v48 = v97;
  [(CAKeyframeAnimation *)v34 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v43, v45, v47, +[NSNumber numberWithFloat:v48], 0)];
  CATransform3D v49 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  LODWORD(v50) = 1036831949;
  LODWORD(v51) = 1054280253;
  LODWORD(v52) = 0.5;
  LODWORD(v53) = 1.0;
  CATransform3D v54 = +[CAMediaTimingFunction functionWithControlPoints:v50 :v51 :v52 :v53];
  LODWORD(v55) = 1045220557;
  LODWORD(v56) = 1066192077;
  LODWORD(v57) = 2.0;
  LODWORD(v58) = 0.75;
  [(CAKeyframeAnimation *)v34 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v49, v54, +[CAMediaTimingFunction functionWithControlPoints:v55 :v57 :v58 :v56], 0)];
  long long v59 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  [(CAKeyframeAnimation *)v59 setKeyTimes:v68];
  [(CAKeyframeAnimation *)v59 setCalculationMode:kCAAnimationCubic];
  v86[4] = v165;
  v86[5] = v166;
  v86[6] = v167;
  v86[7] = v168;
  v86[0] = v161;
  v86[1] = v162;
  v86[2] = v163;
  v86[3] = v164;
  long long v60 = +[NSValue valueWithCATransform3D:v86];
  v85[4] = v144;
  v85[5] = v145;
  v85[6] = v146;
  v85[7] = v147;
  v85[0] = v140;
  v85[1] = v141;
  v85[2] = v142;
  v85[3] = v143;
  long long v61 = +[NSValue valueWithCATransform3D:v85];
  v84[4] = v123;
  v84[5] = v124;
  v84[6] = v125;
  v84[7] = v126;
  v84[0] = v119;
  v84[1] = v120;
  v84[2] = v121;
  v84[3] = v122;
  double v62 = +[NSValue valueWithCATransform3D:v84];
  v83[4] = v102;
  v83[5] = v103;
  v83[6] = v104;
  v83[7] = v105;
  v83[0] = v98;
  v83[1] = v99;
  v83[2] = v100;
  v83[3] = v101;
  [(CAKeyframeAnimation *)v59 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v60, v61, v62, +[NSValue valueWithCATransform3D:v83], 0)];
  [(CAKeyframeAnimation *)v59 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], 0)];
  double v63 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
  [(CAKeyframeAnimation *)v63 setKeyTimes:v68];
  long long v64 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v169, v170);
  long long v65 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v148, v149);
  long long v66 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v127, v128);
  [(CAKeyframeAnimation *)v63 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v64, v65, v66, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v106, v107), 0)];
  [(CAKeyframeAnimation *)v63 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], 0)];
  id v67 = +[CAAnimationGroup animation];
  [v67 setAnimations:[NSArray arrayWithObjects:v34, v59, v63, 0]];
  [v67 setDuration:v27];
  [v67 setDelegate:self];
  [v67 setRemovedOnCompletion:0];
  [(THNoteCardLayer *)self addAnimation:v67 forKey:@"shuffleAnimation"];
  unint64_t v73 = a3;
  int v74 = v69;
  int v75 = v70;
  CGPoint v76 = dragAnchor;
  CGFloat v77 = x;
  CGFloat v78 = y;
  int v79 = 3;
  long long v80 = v171;
  long long v81 = v172;
  *(_OWORD *)double v82 = v173[0];
  *(_OWORD *)&v82[12] = *(_OWORD *)((char *)v173 + 12);
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:&v73] & 0xFFFFFFFFFFLL animated:v71 duration:v27];
  +[CATransaction commit];
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  [(THNoteCardLayer *)self setCardIndex:a3];
  [(THNoteCardLayer *)self setFlipped:0];
}

- (void)setFilteredOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v9 = a5;
  double y = a4.y;
  double x = a4.x;
  BOOL v12 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  +[CATransaction begin];
  +[CATransaction setCompletionBlock:a7];
  long long v14 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v29[2] = self->_transformParams.dragOffset;
  v29[3] = v14;
  CGFloat v30 = self->_transformParams.flownOutDirection.y;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v29[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v29[1] = dragAnchor;
  v47[0] = *(_DWORD *)(&self->_transformParams.filteredOut + 1);
  *(_DWORD *)((char *)v47 + 3) = *((_DWORD *)&self->_transformParams.filteredOut + 1);
  int v16 = *(_DWORD *)((char *)v47 + 3);
  long long v35 = *(_OWORD *)&self->_transformParams.scaleFactor;
  self->_transformParams.filteredOut = v12;
  self->_transformParams.filteredOutDirection.double x = x;
  self->_transformParams.filteredOutDirection.double y = y;
  BOOL v31 = v12;
  *(_DWORD *)&v32[3] = v16;
  *(_DWORD *)long long v32 = v47[0];
  double v33 = x;
  double v34 = y;
  [(THNoteCardLayer *)self p_noteTransformForParameters:v29];
  if (!v9) {
    a6 = 0.0;
  }
  int v17 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
  double zPosition = self->_transform.zPosition;
  *(float *)&double zPosition = zPosition;
  [(CABasicAnimation *)v17 setFromValue:+[NSNumber numberWithFloat:zPosition]];
  HIDWORD(v19) = HIDWORD(v36);
  *(float *)&double v19 = v36;
  [(CABasicAnimation *)v17 setToValue:+[NSNumber numberWithFloat:v19]];
  [(CABasicAnimation *)v17 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  double v20 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  long long v21 = *(_OWORD *)&self->_transform.xform.m33;
  v28[4] = *(_OWORD *)&self->_transform.xform.m31;
  v28[5] = v21;
  long long v22 = *(_OWORD *)&self->_transform.xform.m43;
  v28[6] = *(_OWORD *)&self->_transform.xform.m41;
  v28[7] = v22;
  long long v23 = *(_OWORD *)&self->_transform.xform.m13;
  v28[0] = *(_OWORD *)&self->_transform.xform.m11;
  v28[1] = v23;
  long long v24 = *(_OWORD *)&self->_transform.xform.m23;
  v28[2] = *(_OWORD *)&self->_transform.xform.m21;
  v28[3] = v24;
  [(CABasicAnimation *)v20 setFromValue:+[NSValue valueWithCATransform3D:v28]];
  v27[4] = v41;
  v27[5] = v42;
  v27[6] = v43;
  v27[7] = v44;
  v27[0] = v37;
  v27[1] = v38;
  v27[2] = v39;
  v27[3] = v40;
  [(CABasicAnimation *)v20 setToValue:+[NSValue valueWithCATransform3D:v27]];
  [(CABasicAnimation *)v20 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  long long v25 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v25 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y)];
  [(CABasicAnimation *)v25 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v45, v46)];
  [(CABasicAnimation *)v25 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  id v26 = +[CAAnimationGroup animation];
  [v26 setAnimations:[NSArray arrayWithObjects:v17, v20, v25, 0]];
  [v26 setDuration:a6];
  [v26 setDelegate:self];
  [(THNoteCardLayer *)self addAnimation:v26 forKey:@"cardIndexAnimation"];
  +[CATransaction commit];
  -[THNoteCardLayer setFilteredOut:direction:](self, "setFilteredOut:direction:", v12, x, y);
}

- (void)setFlownOut:(BOOL)a3 animated:(BOOL)a4 duration:(double)a5
{
}

- (void)setFlownOut:(BOOL)a3 direction:(CGPoint)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v27 = a5;
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  BOOL v9 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  +[CATransaction begin];
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v32[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v32[1] = dragAnchor;
  v32[2] = self->_transformParams.dragOffset;
  int shuffleAnimationState = self->_transformParams.shuffleAnimationState;
  __int16 v53 = *(_WORD *)(&self->_transformParams.flownOut + 1);
  char v54 = *(&self->_transformParams.flownOut + 3);
  long long v39 = *(_OWORD *)&self->_transformParams.filteredOut;
  long long v40 = *(_OWORD *)&self->_transformParams.filteredOutDirection.y;
  uint64_t v41 = *(void *)&self->_transformParams.useDarkerBackground;
  self->_transformParams.flownOut = v9;
  self->_transformParams.flownOutDirection.CGFloat x = x;
  self->_transformParams.flownOutDirection.CGFloat y = y;
  BOOL v34 = v9;
  char v36 = v54;
  __int16 v35 = v53;
  CGFloat v37 = x;
  CGFloat v38 = y;
  [(THNoteCardLayer *)self p_noteTransformForParameters:v32];
  BOOL v12 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
  double zPosition = self->_transform.zPosition;
  *(float *)&double zPosition = zPosition;
  [(CABasicAnimation *)v12 setFromValue:+[NSNumber numberWithFloat:zPosition]];
  HIDWORD(v14) = HIDWORD(v42);
  *(float *)&double v14 = v42;
  [(CABasicAnimation *)v12 setToValue:+[NSNumber numberWithFloat:v14]];
  [(CABasicAnimation *)v12 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  uint64_t v15 = +[CABasicAnimation animationWithKeyPath:@"transform"];
  long long v16 = *(_OWORD *)&self->_transform.xform.m33;
  v31[4] = *(_OWORD *)&self->_transform.xform.m31;
  v31[5] = v16;
  long long v17 = *(_OWORD *)&self->_transform.xform.m43;
  v31[6] = *(_OWORD *)&self->_transform.xform.m41;
  v31[7] = v17;
  long long v18 = *(_OWORD *)&self->_transform.xform.m13;
  v31[0] = *(_OWORD *)&self->_transform.xform.m11;
  v31[1] = v18;
  long long v19 = *(_OWORD *)&self->_transform.xform.m23;
  v31[2] = *(_OWORD *)&self->_transform.xform.m21;
  v31[3] = v19;
  [(CABasicAnimation *)v15 setFromValue:+[NSValue valueWithCATransform3D:v31]];
  v30[4] = v47;
  v30[5] = v48;
  v30[6] = v49;
  v30[7] = v50;
  v30[0] = v43;
  v30[1] = v44;
  v30[2] = v45;
  v30[3] = v46;
  [(CABasicAnimation *)v15 setToValue:+[NSValue valueWithCATransform3D:v30]];
  if (v9)
  {
    long long v24 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  }
  else
  {
    LODWORD(v21) = -1110651699;
    LODWORD(v20) = 0.75;
    LODWORD(v22) = 0.5;
    LODWORD(v23) = 1.0;
    long long v24 = +[CAMediaTimingFunction functionWithControlPoints:v20 :v21 :v22 :v23];
  }
  [(CABasicAnimation *)v15 setTimingFunction:v24];
  if (!v27) {
    a6 = 0.0;
  }
  long long v25 = +[CABasicAnimation animationWithKeyPath:@"position"];
  [(CABasicAnimation *)v25 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y)];
  [(CABasicAnimation *)v25 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v51, v52)];
  [(CABasicAnimation *)v25 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  -[THNoteCardLayer setPosition:](self, "setPosition:", v51, v52);
  id v26 = +[CAAnimationGroup animation];
  [v26 setAnimations:[NSArray arrayWithObjects:v12, v15, v25, nil]];
  [v26 setFillMode:kCAFillModeBoth];
  [v26 setDuration:a6];
  [v26 setDelegate:self];
  [(THNoteCardLayer *)self addAnimation:v26 forKey:@"cardIndexAnimation"];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_DE63C;
  v28[3] = &unk_457278;
  v28[4] = self;
  BOOL v29 = v9;
  +[CATransaction setCompletionBlock:v28];
  +[CATransaction commit];
}

- (void)updateTransformAnimated:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  [(THNoteCardLayer *)self p_willUnsettle];
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  v23[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v23[5] = filteredOutDirection;
  v23[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v23[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v23[1] = dragAnchor;
  long long v9 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v23[2] = self->_transformParams.dragOffset;
  v23[3] = v9;
  [(THNoteCardLayer *)self p_noteTransformForParameters:v23];
  if (v5)
  {
    BOOL v10 = +[CABasicAnimation animationWithKeyPath:@"transform"];
    long long v11 = *(_OWORD *)&self->_transform.xform.m33;
    v22[4] = *(_OWORD *)&self->_transform.xform.m31;
    v22[5] = v11;
    long long v12 = *(_OWORD *)&self->_transform.xform.m43;
    v22[6] = *(_OWORD *)&self->_transform.xform.m41;
    v22[7] = v12;
    long long v13 = *(_OWORD *)&self->_transform.xform.m13;
    v22[0] = *(_OWORD *)&self->_transform.xform.m11;
    v22[1] = v13;
    long long v14 = *(_OWORD *)&self->_transform.xform.m23;
    v22[2] = *(_OWORD *)&self->_transform.xform.m21;
    v22[3] = v14;
    [(CABasicAnimation *)v10 setFromValue:+[NSValue valueWithCATransform3D:v22]];
    v21[4] = *(_OWORD *)&__src[9];
    v21[5] = *(_OWORD *)&__src[11];
    v21[6] = *(_OWORD *)&__src[13];
    v21[7] = *(_OWORD *)&__src[15];
    v21[0] = *(_OWORD *)&__src[1];
    v21[1] = *(_OWORD *)&__src[3];
    v21[2] = *(_OWORD *)&__src[5];
    v21[3] = *(_OWORD *)&__src[7];
    [(CABasicAnimation *)v10 setToValue:+[NSValue valueWithCATransform3D:v21]];
    uint64_t v15 = +[CABasicAnimation animationWithKeyPath:@"position"];
    [(CABasicAnimation *)v15 setFromValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", self->_transform.position.x, self->_transform.position.y)];
    [(CABasicAnimation *)v15 setToValue:+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", __src[33], __src[34])];
    long long v16 = +[CABasicAnimation animationWithKeyPath:@"zPosition"];
    double zPosition = self->_transform.zPosition;
    *(float *)&double zPosition = zPosition;
    [(CABasicAnimation *)v16 setFromValue:+[NSNumber numberWithFloat:zPosition]];
    HIDWORD(v18) = HIDWORD(__src[0]);
    *(float *)&double v18 = __src[0];
    [(CABasicAnimation *)v16 setToValue:+[NSNumber numberWithFloat:v18]];
    id v19 = +[CAAnimationGroup animation];
    [v19 setAnimations:[NSArray arrayWithObjects:v16, v10, v15, 0]];
    [v19 setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [v19 setDuration:a4];
    [v19 setDelegate:self];
    [(THNoteCardLayer *)self addAnimation:v19 forKey:@"transform"];
    memcpy(__dst, __src, sizeof(__dst));
    [(THNoteCardLayer *)self p_applyNoteTransform:__dst];
  }
  else
  {
    memcpy(__dst, __src, sizeof(__dst));
    [(THNoteCardLayer *)self p_applyNoteTransform:__dst];
    [(THNoteCardLayer *)self p_mayHaveSettled];
  }
}

- (void)setScaleFactor:(double)a3 darkerBackground:(BOOL)a4 animated:(BOOL)a5 duration:(double)a6
{
  BOOL v7 = a5;
  [(THNoteCardLayer *)self p_willUnsettle];
  self->_transformParams.uint64_t useDarkerBackground = a4;
  self->_transformParams.scaleFactor = a3;
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  v26[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v26[5] = filteredOutDirection;
  v26[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v26[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v26[1] = dragAnchor;
  long long v13 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v26[2] = self->_transformParams.dragOffset;
  v26[3] = v13;
  [(THNoteCardLayer *)self p_noteTransformForParameters:v26];
  if (v7)
  {
    long long v14 = +[CABasicAnimation animationWithKeyPath:@"transform"];
    long long v15 = *(_OWORD *)&self->_transform.xform.m33;
    v25[4] = *(_OWORD *)&self->_transform.xform.m31;
    v25[5] = v15;
    long long v16 = *(_OWORD *)&self->_transform.xform.m43;
    v25[6] = *(_OWORD *)&self->_transform.xform.m41;
    v25[7] = v16;
    long long v17 = *(_OWORD *)&self->_transform.xform.m13;
    v25[0] = *(_OWORD *)&self->_transform.xform.m11;
    v25[1] = v17;
    long long v18 = *(_OWORD *)&self->_transform.xform.m23;
    v25[2] = *(_OWORD *)&self->_transform.xform.m21;
    v25[3] = v18;
    [(CABasicAnimation *)v14 setFromValue:+[NSValue valueWithCATransform3D:v25]];
    v24[4] = *(_OWORD *)&__src[9];
    v24[5] = *(_OWORD *)&__src[11];
    v24[6] = *(_OWORD *)&__src[13];
    v24[7] = *(_OWORD *)&__src[15];
    v24[0] = *(_OWORD *)&__src[1];
    v24[1] = *(_OWORD *)&__src[3];
    v24[2] = *(_OWORD *)&__src[5];
    v24[3] = *(_OWORD *)&__src[7];
    [(CABasicAnimation *)v14 setToValue:+[NSValue valueWithCATransform3D:v24]];
    [(CABasicAnimation *)v14 setDelegate:self];
    [(THNoteCardLayer *)self addAnimation:v14 forKey:@"scaleAnimation"];
  }
  memcpy(__dst, __src, sizeof(__dst));
  [(THNoteCardLayer *)self p_applyNoteTransform:__dst];
  CGPoint v19 = self->_transformParams.filteredOutDirection;
  v22[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v22[5] = v19;
  v22[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint v20 = self->_transformParams.dragAnchor;
  v22[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v22[1] = v20;
  long long v21 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v22[2] = self->_transformParams.dragOffset;
  v22[3] = v21;
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:v22] & 0xFFFFFFFFFFLL animated:1 duration:a6];
}

- (void)layoutSublayers
{
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  [(THNoteCardLayer *)&v3 layoutSublayers];
  [(THNoteCardLayer *)self bounds];
  TSDRectWithSize();
  -[THNoteCardContentLayer setFrame:](self->_frontLayer, "setFrame:");
  [(THNoteCardLayer *)self bounds];
  TSDRectWithSize();
  -[THNoteCardContentLayer setFrame:](self->_backLayer, "setFrame:");
}

- (void)removeFromSuperlayer
{
  self->_delegate = 0;
  [(THNoteCardLayer *)self removeAllAnimations];
  v3.receiver = self;
  v3.super_class = (Class)THNoteCardLayer;
  [(THNoteCardLayer *)&v3 removeFromSuperlayer];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  +[CATransaction begin];
  if ([(THNoteCardLayer *)self animationForKey:@"cardPopAnimation"] == a3)
  {
    if (self->_transformParams.poppedState == 1) {
      self->_transformParams.int poppedState = 3;
    }
    CFStringRef v6 = @"cardPopAnimation";
    goto LABEL_10;
  }
  if ([(THNoteCardLayer *)self animationForKey:@"cardUnpopAnimation"] == a3)
  {
    if (self->_transformParams.poppedState == 2) {
      self->_transformParams.int poppedState = 0;
    }
    CFStringRef v6 = @"cardUnpopAnimation";
LABEL_10:
    [(THNoteCardLayer *)self removeAnimationForKey:v6];
    goto LABEL_11;
  }
  self->_transformParams.int poppedState = 0;
LABEL_11:
  if ([(THNoteCardLayer *)self animationForKey:@"completeDragAnimation"] == a3
    || [(THNoteCardLayer *)self animationForKey:@"completeFlippedDragAnimation"] == a3)
  {
    completionAnimationCompletionBlock = (void (**)(void))self->_completionAnimationCompletionBlock;
    if (completionAnimationCompletionBlock)
    {
      completionAnimationCompletionBlock[2]();

      self->_completionAnimationCompletionBlock = 0;
    }
    [(THNoteCardLayer *)self removeAnimationForKey:@"completeDragAnimation"];
    [(THNoteCardLayer *)self removeAnimationForKey:@"completeFlippedDragAnimation"];
  }
  [(THNoteCardLayer *)self p_rebuildNoteTransform];
  +[CATransaction commit];

  [(THNoteCardLayer *)self p_mayHaveSettled];
}

- (void)p_commonInitWithDarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [[THNoteCardContentLayer alloc] initFrontContentLayerWithDarkMode:a3];
  self->_frontLayer = v5;
  [(THNoteCardContentLayer *)v5 setDoubleSided:0];
  [(THNoteCardContentLayer *)self->_frontLayer setDelegate:self];
  [(THNoteCardContentLayer *)self->_frontLayer setShouldRasterize:1];
  TSUScreenScale();
  -[THNoteCardContentLayer setRasterizationScale:](self->_frontLayer, "setRasterizationScale:");
  [(THNoteCardLayer *)self addSublayer:self->_frontLayer];
  self->_backLayer = (THNoteCardContentLayer *)[[THNoteCardContentLayer alloc] initBackContentLayerWithDarkMode:v3];
  CATransform3DMakeRotation(&v8, 3.14159265, 0.0, 1.0, 0.0);
  backLayer = self->_backLayer;
  CATransform3D v7 = v8;
  [(THNoteCardContentLayer *)backLayer setTransform:&v7];
  [(THNoteCardContentLayer *)self->_backLayer setDoubleSided:0];
  [(THNoteCardContentLayer *)self->_backLayer setDelegate:self];
  [(THNoteCardContentLayer *)self->_backLayer setShouldRasterize:1];
  TSUScreenScale();
  -[THNoteCardContentLayer setRasterizationScale:](self->_backLayer, "setRasterizationScale:");
  [(THNoteCardLayer *)self addSublayer:self->_backLayer];
  TSUScreenScale();
  -[THNoteCardContentLayer setContentsScale:](self->_frontLayer, "setContentsScale:");
  TSUScreenScale();
  -[THNoteCardContentLayer setContentsScale:](self->_backLayer, "setContentsScale:");
}

- (void)p_willUnsettle
{
}

- (void)p_mayHaveSettled
{
  if (!objc_msgSend(-[THNoteCardLayer animationKeys](self, "animationKeys"), "count")
    && [(THNoteCardLayer *)self isTopCard]
    && ([(THNoteCardLayerDelegate *)self->_delegate isDraggingTopCard] & 1) == 0)
  {
    [(THNoteCardLayer *)self p_didSettle];
  }
}

- (void)p_didSettle
{
}

- (void)p_completeDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v71 = a5;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  p_transformParams = &self->_transformParams;
  CGPoint filteredOutDirection = self->_transformParams.filteredOutDirection;
  v146[4] = *(_OWORD *)&self->_transformParams.flownOutDirection.y;
  v146[5] = filteredOutDirection;
  v146[6] = *(_OWORD *)&self->_transformParams.scaleFactor;
  CGPoint dragAnchor = self->_transformParams.dragAnchor;
  v146[0] = *(_OWORD *)&self->_transformParams.cardIndex;
  v146[1] = dragAnchor;
  long long v15 = *(_OWORD *)&self->_transformParams.shuffleAnimationState;
  v146[2] = self->_transformParams.dragOffset;
  v146[3] = v15;
  p_int shuffleAnimationState = &self->_transformParams.shuffleAnimationState;
  unsigned int v17 = [(THNoteCardLayer *)self p_isBottomCardParameters:v146];
  TSDPointLength();
  double v19 = v18;
  TSDPointLength();
  double v21 = (vabdd_f64(v20, v19) / v20 + 1.0) * 0.300000012 * 0.5;
  double v22 = +[NSNumber numberWithFloat:0.0];
  *(float *)&double v23 = v21;
  long long v24 = +[NSNumber numberWithFloat:v23];
  LODWORD(v25) = 1.0;
  id v26 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v22, v24, +[NSNumber numberWithFloat:v25], 0);
  double zPosition = self->_transform.zPosition;
  long long v28 = *(_OWORD *)&self->_transform.xform.m33;
  long long v142 = *(_OWORD *)&self->_transform.xform.m31;
  long long v143 = v28;
  long long v29 = *(_OWORD *)&self->_transform.xform.m43;
  long long v144 = *(_OWORD *)&self->_transform.xform.m41;
  long long v145 = v29;
  long long v30 = *(_OWORD *)&self->_transform.xform.m13;
  long long v138 = *(_OWORD *)&self->_transform.xform.m11;
  long long v139 = v30;
  long long v31 = *(_OWORD *)&self->_transform.xform.m23;
  long long v140 = *(_OWORD *)&self->_transform.xform.m21;
  long long v141 = v31;
  double v32 = self->_transform.position.x;
  double v33 = self->_transform.position.y;
  cardIndeCGFloat x = p_transformParams->cardIndex;
  int v34 = *(_DWORD *)&p_transformParams->flipped;
  long long v35 = *(_OWORD *)&p_transformParams->scaleFactor;
  CGPoint v125 = p_transformParams->filteredOutDirection;
  long long v126 = v35;
  long long v36 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  long long v123 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  long long v124 = v36;
  int v118 = v34;
  int v119 = 0;
  CGPoint v120 = CGPointZero;
  CGFloat v121 = x;
  CGFloat v122 = y;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&cardIndex];
  unsigned int v69 = v17;
  if (v17) {
    double v127 = v127 + -1.0;
  }
  __int16 v115 = *(_WORD *)&p_transformParams->flattenFlipped;
  char v116 = *(&p_transformParams->forceHidden + 1);
  long long v37 = *((_OWORD *)p_shuffleAnimationState + 1);
  long long v109 = *(_OWORD *)p_shuffleAnimationState;
  long long v110 = v37;
  long long v38 = *((_OWORD *)p_shuffleAnimationState + 3);
  long long v40 = *(_OWORD *)p_shuffleAnimationState;
  long long v39 = *((_OWORD *)p_shuffleAnimationState + 1);
  long long v111 = *((_OWORD *)p_shuffleAnimationState + 2);
  long long v112 = v38;
  CGPoint v113 = CGPointZero;
  CGPoint v114 = CGPointZero;
  int64_t v72 = a4;
  int64_t v87 = a4;
  char v88 = 0;
  __int16 v41 = *(_WORD *)&p_transformParams->flattenFlipped;
  char v90 = *(&p_transformParams->forceHidden + 1);
  __int16 v89 = v41;
  int v91 = 0;
  CGPoint v92 = CGPointZero;
  CGPoint v93 = v92;
  long long v42 = *((_OWORD *)p_shuffleAnimationState + 3);
  long long v96 = *((_OWORD *)p_shuffleAnimationState + 2);
  long long v97 = v42;
  long long v94 = v40;
  long long v95 = v39;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v87];
  long long v43 = +[CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
  [(CAKeyframeAnimation *)v43 setKeyTimes:v26];
  *(float *)&double v44 = zPosition;
  long long v45 = +[NSNumber numberWithFloat:v44];
  HIDWORD(v46) = HIDWORD(v127);
  *(float *)&double v46 = v127;
  long long v47 = +[NSNumber numberWithFloat:v46];
  HIDWORD(v48) = HIDWORD(v98);
  *(float *)&double v48 = v98;
  [(CAKeyframeAnimation *)v43 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v45, v47, +[NSNumber numberWithFloat:v48], 0)];
  LODWORD(v49) = 0.5;
  LODWORD(v50) = 1.0;
  LODWORD(v51) = 1054280253;
  double v52 = +[CAMediaTimingFunction functionWithControlPoints:0.0 :v51 :v49 :v50];
  LODWORD(v53) = 1045220557;
  LODWORD(v54) = 1066192077;
  LODWORD(v55) = 2.0;
  LODWORD(v56) = 0.75;
  [(CAKeyframeAnimation *)v43 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v52, +[CAMediaTimingFunction functionWithControlPoints:v53 :v55 :v56 :v54], 0)];
  double v57 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  [(CAKeyframeAnimation *)v57 setKeyTimes:v26];
  v86[4] = v142;
  v86[5] = v143;
  v86[6] = v144;
  v86[7] = v145;
  v86[0] = v138;
  v86[1] = v139;
  v86[2] = v140;
  v86[3] = v141;
  double v58 = +[NSValue valueWithCATransform3D:v86];
  v85[4] = v132;
  v85[5] = v133;
  v85[6] = v134;
  v85[7] = v135;
  v85[0] = v128;
  v85[1] = v129;
  v85[2] = v130;
  v85[3] = v131;
  long long v59 = +[NSValue valueWithCATransform3D:v85];
  v84[4] = v103;
  v84[5] = v104;
  v84[6] = v105;
  v84[7] = v106;
  v84[0] = v99;
  v84[1] = v100;
  v84[2] = v101;
  v84[3] = v102;
  [(CAKeyframeAnimation *)v57 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v58, v59, +[NSValue valueWithCATransform3D:v84], 0)];
  [(CAKeyframeAnimation *)v57 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], 0)];
  long long v60 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
  [(CAKeyframeAnimation *)v60 setKeyTimes:v26];
  long long v61 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v32, v33);
  double v62 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v136, v137);
  [(CAKeyframeAnimation *)v60 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v62, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v107, v108), 0)];
  if (v69)
  {
    id v67 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  }
  else
  {
    LODWORD(v65) = 1058306785;
    LODWORD(v64) = -0.25;
    LODWORD(v66) = 1.0;
    LODWORD(v63) = 1054280253;
    id v67 = +[CAMediaTimingFunction functionWithControlPoints:v63 :v64 :v65 :v66];
  }
  if (!v71) {
    a6 = 0.0;
  }
  [(CAKeyframeAnimation *)v60 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], v67, 0)];

  self->_completionAnimationCompletionBlock = [a7 copy];
  id v68 = +[CAAnimationGroup animation];
  [v68 setAnimations:[NSArray arrayWithObjects:v43, v57, v60, 0]];
  [v68 setDuration:a6];
  [v68 setDelegate:self];
  [v68 setRemovedOnCompletion:0];
  [(THNoteCardLayer *)self addAnimation:v68 forKey:@"completeDragAnimation"];
  int64_t v73 = v72;
  char v74 = 0;
  __int16 v75 = v115;
  char v76 = v116;
  int v77 = 0;
  CGPoint v78 = v114;
  CGPoint v79 = v113;
  long long v82 = v111;
  long long v83 = v112;
  long long v80 = v109;
  long long v81 = v110;
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:&v73] & 0xFFFFFFFFFFLL animated:v71 duration:a6];
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  [(THNoteCardLayer *)self setCardIndex:v72];
  [(THNoteCardLayer *)self setFlipped:0];
}

- (void)p_completeFlippedDragViaDragOffset:(CGPoint)a3 newCardIndex:(int64_t)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  BOOL v92 = a5;
  double y = a3.y;
  double x = a3.x;
  p_transformParams = &self->_transformParams;
  TSDPointLength();
  double v13 = v12;
  TSDPointLength();
  double v15 = v14;
  double v16 = (vabdd_f64(v14, v13) / v14 + 1.0) * 0.200000003 * 0.5;
  unsigned int v17 = +[NSNumber numberWithFloat:0.0];
  *(float *)&double v18 = v16;
  double v19 = +[NSNumber numberWithFloat:v18];
  double v20 = (v16 + 0.600000024) * 0.5;
  *(float *)&double v20 = v20;
  double v21 = +[NSNumber numberWithFloat:v20];
  LODWORD(v22) = 1.0;
  double v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v17, v19, v21, +[NSNumber numberWithFloat:v22], 0);
  double v90 = a6;
  if (v13 > v15)
  {
    long long v24 = +[NSNumber numberWithFloat:0.0];
    double v25 = +[NSNumber numberWithFloat:0.0];
    double v26 = (v16 + 1.0) * 0.5;
    *(float *)&double v26 = v26;
    BOOL v27 = +[NSNumber numberWithFloat:v26];
    LODWORD(v28) = 1.0;
    long long v94 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, v25, v27, +[NSNumber numberWithFloat:v28], 0);
  }
  else
  {
    long long v94 = v23;
  }
  double zPosition = self->_transform.zPosition;
  long long v30 = *(_OWORD *)&self->_transform.xform.m33;
  long long v194 = *(_OWORD *)&self->_transform.xform.m31;
  long long v195 = v30;
  long long v31 = *(_OWORD *)&self->_transform.xform.m43;
  long long v196 = *(_OWORD *)&self->_transform.xform.m41;
  long long v197 = v31;
  long long v32 = *(_OWORD *)&self->_transform.xform.m13;
  long long v190 = *(_OWORD *)&self->_transform.xform.m11;
  long long v191 = v32;
  long long v33 = *(_OWORD *)&self->_transform.xform.m23;
  long long v192 = *(_OWORD *)&self->_transform.xform.m21;
  long long v193 = v33;
  long long v34 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  long long v152 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  long long v153 = v34;
  long long v35 = *(_OWORD *)&p_transformParams->scaleFactor;
  long long v37 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  long long v36 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  CGPoint filteredOutDirection = p_transformParams->filteredOutDirection;
  CGPoint v154 = filteredOutDirection;
  long long v155 = v35;
  CGPoint v189 = CGPointZero;
  double v40 = self->_transform.position.x;
  double v39 = self->_transform.position.y;
  cardIndedouble x = p_transformParams->cardIndex;
  BOOL flipped = p_transformParams->flipped;
  BOOL flattenFlipped = p_transformParams->flattenFlipped;
  __int16 v42 = *(_WORD *)&p_transformParams->forceHidden;
  int poppedState = p_transformParams->poppedState;
  BOOL v44 = v13 <= v15;
  if (v13 > v15)
  {
    double v45 = p_transformParams->dragOffset.x;
  }
  else
  {
    int poppedState = 0;
    double v45 = x;
  }
  if (v44) {
    double v46 = y;
  }
  else {
    double v46 = p_transformParams->dragOffset.y;
  }
  int64_t v47 = p_transformParams->cardIndex;
  BOOL v159 = p_transformParams->flipped;
  int64_t v158 = v47;
  BOOL v160 = flattenFlipped;
  __int16 v161 = v42;
  int v162 = poppedState;
  CGPoint v163 = CGPointZero;
  double v164 = v45;
  double v165 = v46;
  long long v48 = *(_OWORD *)&p_transformParams->scaleFactor;
  CGPoint v168 = filteredOutDirection;
  long long v169 = v48;
  long long v166 = v37;
  long long v167 = v36;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v158];
  long long v185 = v175;
  long long v186 = v176;
  long long v187 = v177;
  long long v188 = v178;
  long long v181 = v171;
  long long v182 = v172;
  long long v183 = v173;
  long long v184 = v174;
  double v49 = v170;
  double v50 = v179;
  double v51 = v180;
  CGPoint v145 = v189;
  BOOL v141 = flipped;
  int64_t v140 = cardIndex;
  char v142 = 1;
  __int16 v143 = v42;
  int v144 = 0;
  double v146 = v45;
  double v147 = v46;
  long long v148 = v152;
  long long v149 = v153;
  CGPoint v150 = v154;
  long long v151 = v155;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v140];
  double v170 = -550.0;
  BOOL v52 = p_transformParams->flipped;
  __int16 v53 = *(_WORD *)&p_transformParams->forceHidden;
  long long v54 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  long long v134 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  long long v135 = v54;
  long long v55 = *(_OWORD *)&p_transformParams->scaleFactor;
  long long v57 = *(_OWORD *)&p_transformParams->shuffleAnimationState;
  long long v56 = *(_OWORD *)&p_transformParams->flownOutDirection.y;
  CGPoint v136 = p_transformParams->filteredOutDirection;
  long long v137 = v55;
  CGPoint v138 = CGPointZero;
  CGPoint v139 = v138;
  int64_t v112 = a4;
  __int16 v88 = v53;
  BOOL v89 = v52;
  BOOL v113 = v52;
  char v114 = 1;
  __int16 v115 = v53;
  int v116 = 0;
  CGPoint v117 = CGPointZero;
  CGPoint v118 = v117;
  long long v58 = *(_OWORD *)&p_transformParams->scaleFactor;
  CGPoint v121 = p_transformParams->filteredOutDirection;
  long long v122 = v58;
  long long v119 = v57;
  long long v120 = v56;
  [(THNoteCardLayer *)self p_noteTransformForParameters:&v112];
  long long v59 = +[CAKeyframeAnimation animationWithKeyPath:@"zPosition"];
  [(CAKeyframeAnimation *)v59 setKeyTimes:v94];
  -[CAKeyframeAnimation setCalculationMode:](v59, "setCalculationMode:");
  LODWORD(v60) = -0.5;
  long long v61 = +[NSNumber numberWithFloat:v60];
  LODWORD(v62) = -0.5;
  double v63 = +[NSNumber numberWithFloat:v62];
  LODWORD(v64) = -0.5;
  double v65 = +[NSNumber numberWithFloat:v64];
  LODWORD(v66) = -0.5;
  [(CAKeyframeAnimation *)v59 setTensionValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v61, v63, v65, +[NSNumber numberWithFloat:v66], 0)];
  *(float *)&double v67 = zPosition;
  id v68 = +[NSNumber numberWithFloat:v67];
  *(float *)&double v69 = v49;
  int v70 = +[NSNumber numberWithFloat:v69];
  HIDWORD(v71) = HIDWORD(v170);
  *(float *)&double v71 = v170;
  int64_t v72 = +[NSNumber numberWithFloat:v71];
  HIDWORD(v73) = HIDWORD(v123);
  *(float *)&double v73 = v123;
  [(CAKeyframeAnimation *)v59 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v68, v70, v72, +[NSNumber numberWithFloat:v73], 0)];
  int64_t v87 = v59;
  [(CAKeyframeAnimation *)v59 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 0)];
  char v74 = +[CAKeyframeAnimation animationWithKeyPath:@"transform"];
  [(CAKeyframeAnimation *)v74 setKeyTimes:v94];
  [(CAKeyframeAnimation *)v74 setCalculationMode:kCAAnimationCubic];
  v111[4] = v194;
  v111[5] = v195;
  v111[6] = v196;
  v111[7] = v197;
  v111[0] = v190;
  v111[1] = v191;
  v111[2] = v192;
  v111[3] = v193;
  __int16 v75 = +[NSValue valueWithCATransform3D:v111];
  v110[4] = v185;
  v110[5] = v186;
  v110[6] = v187;
  v110[7] = v188;
  v110[0] = v181;
  v110[1] = v182;
  v110[2] = v183;
  v110[3] = v184;
  char v76 = +[NSValue valueWithCATransform3D:v110];
  v109[4] = v175;
  v109[5] = v176;
  v109[6] = v177;
  v109[7] = v178;
  v109[0] = v171;
  v109[1] = v172;
  v109[2] = v173;
  v109[3] = v174;
  int v77 = +[NSValue valueWithCATransform3D:v109];
  v108[4] = v128;
  v108[5] = v129;
  v108[6] = v130;
  v108[7] = v131;
  v108[0] = v124;
  v108[1] = v125;
  v108[2] = v126;
  v108[3] = v127;
  [(CAKeyframeAnimation *)v74 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v75, v76, v77, +[NSValue valueWithCATransform3D:v108], 0)];
  double v86 = v74;
  [(CAKeyframeAnimation *)v74 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseIn), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut], 0)];
  CGPoint v78 = +[CAKeyframeAnimation animationWithKeyPath:@"position"];
  [(CAKeyframeAnimation *)v78 setKeyTimes:v94];
  [(CAKeyframeAnimation *)v78 setCalculationMode:kCAAnimationCubic];
  CGPoint v79 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v40, v39);
  long long v80 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v50, v51);
  long long v81 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v179, v180);
  [(CAKeyframeAnimation *)v78 setValues:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v79, v80, v81, +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v132, v133), 0)];
  [(CAKeyframeAnimation *)v78 setTimingFunctions:+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionLinear), +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], 0)];
  long long v82 = +[CABasicAnimation animationWithKeyPath:@"sublayerTransform"];
  [(THNoteCardLayer *)self sublayerTransform];
  [(CABasicAnimation *)v82 setFromValue:+[NSValue valueWithCATransform3D:v107]];
  [(THNoteCardLayer *)self sublayerTransform];
  [(CABasicAnimation *)v82 setToValue:+[NSValue valueWithCATransform3D:v106]];
  id completionAnimationCompletionBlock = self->_completionAnimationCompletionBlock;
  if (completionAnimationCompletionBlock)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNoteCardLayer p_completeFlippedDragViaDragOffset:newCardIndex:animated:duration:completion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNoteCardLayer.mm") lineNumber:1545 description:@"already have a completion block"];
    id completionAnimationCompletionBlock = self->_completionAnimationCompletionBlock;
  }
  if (v92) {
    double v84 = v90;
  }
  else {
    double v84 = 0.0;
  }

  self->_id completionAnimationCompletionBlock = [a7 copy];
  id v85 = +[CAAnimationGroup animation];
  [v85 setAnimations:[NSArray arrayWithObjects:v87, v86, v78, v82, nil]];
  [v85 setDuration:v84];
  [v85 setDelegate:self];
  [v85 setRemovedOnCompletion:0];
  [(THNoteCardLayer *)self addAnimation:v85 forKey:@"completeFlippedDragAnimation"];
  int64_t v95 = a4;
  BOOL v96 = v89;
  char v97 = 1;
  __int16 v98 = v88;
  int v99 = 0;
  CGPoint v100 = v139;
  CGPoint v101 = v138;
  long long v102 = v134;
  long long v103 = v135;
  CGPoint v104 = v136;
  long long v105 = v137;
  [(THNoteCardContentLayer *)self->_frontLayer setDisplayAttributes:(unint64_t)[(THNoteCardLayer *)self p_displayAttributesForParameters:&v95] & 0xFFFFFFFFFFLL animated:v92 duration:v84];
  -[THNoteCardLayer setDragOffset:](self, "setDragOffset:", CGPointZero.x, CGPointZero.y);
  -[THNoteCardLayer setDragAnchor:](self, "setDragAnchor:", CGPointZero.x, CGPointZero.y);
  [(THNoteCardLayer *)self setCardIndex:a4];
  [(THNoteCardLayer *)self setFlipped:0];
}

- (THNoteCardInfo)noteCardInfo
{
  return self->_noteCardInfo;
}

- (void)setNoteCardInfo:(id)a3
{
  self->_noteCardInfo = (THNoteCardInfo *)a3;
}

- (THNoteCardLayoutContext)layoutContext
{
  return self->_layoutContext;
}

- (THNoteCardContentLayer)frontLayer
{
  return self->_frontLayer;
}

- (THNoteCardContentLayer)backLayer
{
  return self->_backLayer;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 13) = 0;
  *((void *)self + 5) = 0;
  *(_DWORD *)((char *)self + 47) = 0;
  *(CGPoint *)((char *)self + 56) = CGPointZero;
  *(CGPoint *)((char *)self + 72) = CGPointZero;
  *((unsigned char *)self + 92) = 0;
  *((CGPoint *)self + 6) = CGPointZero;
  *((unsigned char *)self + 112) = 0;
  *(CGPoint *)((char *)self + 120) = CGPointZero;
  *((void *)self + 17) = 0x3FF0000000000000;
  *((unsigned char *)self + 144) = 0;
  *((void *)self + 19) = 0;
  long long v2 = *(_OWORD *)&CATransform3DIdentity.m31;
  long long v3 = *(_OWORD *)&CATransform3DIdentity.m33;
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m41;
  *((_OWORD *)self + 17) = *(_OWORD *)&CATransform3DIdentity.m43;
  *((_OWORD *)self + 16) = v4;
  *((_OWORD *)self + 15) = v3;
  *((_OWORD *)self + 14) = v2;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v6 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v7 = *(_OWORD *)&CATransform3DIdentity.m21;
  *((_OWORD *)self + 13) = *(_OWORD *)&CATransform3DIdentity.m23;
  *((_OWORD *)self + 12) = v7;
  *((_OWORD *)self + 11) = v6;
  *((_OWORD *)self + 10) = v5;
  long long v8 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v9 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m13;
  *((_OWORD *)self + 18) = *(_OWORD *)&CATransform3DIdentity.m11;
  *((_OWORD *)self + 21) = v9;
  *((_OWORD *)self + 20) = v8;
  *((_OWORD *)self + 19) = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m33;
  *((_OWORD *)self + 22) = *(_OWORD *)&CATransform3DIdentity.m31;
  *((_OWORD *)self + 25) = v12;
  *((_OWORD *)self + 24) = v11;
  *((_OWORD *)self + 23) = v13;
  *((CGPoint *)self + 26) = CGPointZero;
  return self;
}

@end
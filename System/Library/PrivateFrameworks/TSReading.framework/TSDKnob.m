@interface TSDKnob
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5;
- (BOOL)obscuresKnob:(id)a3;
- (BOOL)offsetValid;
- (BOOL)overlapsWithKnob:(id)a3;
- (BOOL)shouldDisplayDirectlyOverRep;
- (BOOL)worksWhenInVersionBrowsingMode;
- (BOOL)worksWhenRepLocked;
- (CALayer)layer;
- (CGPoint)offset;
- (CGPoint)position;
- (CGRect)boundingBoxOfHitRegionForRep:(id)a3 scale:(double)a4;
- (TSDBezierPath)hitRegionPath;
- (TSDKnob)init;
- (TSDKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (TSDRep)rep;
- (double)i_rotationInDegreesForKnobOnRep:(id)a3;
- (double)radius;
- (id)description;
- (id)hitRegionLayerForRep:(id)a3;
- (id)knobImage;
- (int)dragType;
- (int)type;
- (unint64_t)tag;
- (void)dealloc;
- (void)setHitRegionPath:(id)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setOffsetValid:(BOOL)a3;
- (void)setPosition:(CGPoint)a3;
- (void)setRadius:(double)a3;
- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3;
- (void)setTag:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)setWorksWhenInVersionBrowsingMode:(BOOL)a3;
- (void)setWorksWhenRepLocked:(BOOL)a3;
- (void)updateHitRegionPathForRep:(id)a3;
@end

@implementation TSDKnob

- (TSDKnob)initWithType:(int)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v19.receiver = self;
  v19.super_class = (Class)TSDKnob;
  v13 = [(TSDKnob *)&v19 init];
  v14 = (TSDKnob *)v13;
  if (v13)
  {
    *((_DWORD *)v13 + 2) = a3;
    v15 = (_OWORD *)MEMORY[0x263F00148];
    *((CGFloat *)v13 + 2) = x;
    *((CGFloat *)v13 + 3) = y;
    *(_OWORD *)(v13 + 40) = *v15;
    v13[32] = 0;
    *((double *)v13 + 7) = a5;
    *((void *)v13 + 8) = a6;
    if (!a7)
    {
      v16 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[TSDKnob initWithType:position:radius:tag:onRep:]"];
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 294, @"invalid nil value for '%s'", "rep");
    }
    v14->mRep = (TSDRep *)a7;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDKnob;
  [(TSDKnob *)&v3 dealloc];
}

- (TSDKnob)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSDKnob init]"];
  [v2 handleFailureInFunction:v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 312, @"Please use designated initializers on knobs, not this" file lineNumber description];
  return 0;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4
{
  return -[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:](self, "isHitByUnscaledPoint:andRep:returningDistance:", a4, 0, a3.x, a3.y);
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 andRep:(id)a4 returningDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (self->mRep != a4)
  {
    v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v11 = [NSString stringWithUTF8String:"-[TSDKnob isHitByUnscaledPoint:andRep:returningDistance:]"];
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 335, @"wrong rep for hit testing knob");
  }
  v12 = (void *)[a4 interactiveCanvasController];
  if (!-[TSDKnob worksWhenRepLocked](self, "worksWhenRepLocked") && ([a4 isLocked] & 1) != 0
    || ![(TSDKnob *)self worksWhenInVersionBrowsingMode]
    && ([v12 inVersionBrowsingMode] & 1) != 0)
  {
    return 0;
  }
  [(TSDKnob *)self position];
  objc_msgSend(a4, "convertNaturalPointToUnscaledCanvas:");
  double v14 = v13;
  double v16 = v15;
  mHitRegionPath = self->mHitRegionPath;
  if (!mHitRegionPath)
  {
    [(TSDKnob *)self updateHitRegionPathForRep:a4];
    mHitRegionPath = self->mHitRegionPath;
  }
  double v18 = TSDSubtractPoints(x, y, v14);
  double v20 = v19;
  objc_msgSend((id)objc_msgSend(a4, "interactiveCanvasController"), "viewScale");
  BOOL v22 = [(TSDBezierPath *)mHitRegionPath containsPoint:TSDMultiplyPointScalar(v18, v20, v21)];
  if (a5) {
    *a5 = TSDDistanceSquared(v14, v16, x, y);
  }
  if (!v22) {
    return 0;
  }
  if (![(TSDKnob *)self shouldDisplayDirectlyOverRep]) {
    return 1;
  }
  id v23 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "interactiveCanvasController"), "hitRep:", x, y), "repForSelecting");
  id v24 = v23;
  BOOL v25 = v23 == 0;
  if (v23 && v23 != a4)
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v26 = objc_msgSend(a4, "interactiveCanvasController", 0);
    v27 = objc_msgSend(v26, "topLevelZOrderedSiblingsOfInfos:", objc_msgSend(MEMORY[0x263EFFA08], "setWithObject:", objc_msgSend(v24, "info")));
    uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v36;
LABEL_17:
      uint64_t v31 = 0;
      while (1)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        uint64_t v32 = *(void *)(*((void *)&v35 + 1) + 8 * v31);
        uint64_t v33 = [v24 info];
        BOOL v25 = v32 == v33;
        if (v32 == v33
          || v32 == [a4 info]
          || v32 == objc_msgSend((id)objc_msgSend(a4, "repForSelecting"), "info"))
        {
          break;
        }
        if (v29 == ++v31)
        {
          uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
          BOOL v25 = 0;
          if (v29) {
            goto LABEL_17;
          }
          return v24 == a4 || v25;
        }
      }
    }
    else
    {
      BOOL v25 = 0;
    }
  }
  return v24 == a4 || v25;
}

- (int)dragType
{
  return 2;
}

- (id)knobImage
{
  switch(self->mType)
  {
    case 1:
    case 5:
      v2 = (void *)MEMORY[0x263F7C858];
      uint64_t v3 = TSDBundle();
      v4 = @"sf-ios-canvas-knob-yellow";
      break;
    case 3:
      v2 = (void *)MEMORY[0x263F7C858];
      uint64_t v3 = TSDBundle();
      v4 = @"sf-ios-canvas-knob-text";
      break;
    case 4:
      v2 = (void *)MEMORY[0x263F7C858];
      uint64_t v3 = TSDBundle();
      v4 = @"sf-ios-canvas-knob-locked";
      break;
    default:
      unint64_t v5 = self->mTag - 12;
      v2 = (void *)MEMORY[0x263F7C858];
      uint64_t v3 = TSDBundle();
      if (v5 > 4) {
        v4 = @"sf-ios-canvas-knob-blue";
      }
      else {
        v4 = @"sf-ios-canvas-knob-green";
      }
      break;
  }

  return (id)[v2 imageNamed:v4 inBundle:v3];
}

- (CALayer)layer
{
  result = self->mLayer;
  if (!result)
  {
    id v4 = [(TSDKnob *)self knobImage];
    if (v4)
    {
      unint64_t v5 = v4;
      self->mLayer = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
      [v5 size];
      [(CALayer *)self->mLayer setBounds:TSDRectWithSize()];
      [(TSDCanvas *)[(TSDRep *)self->mRep canvas] contentsScale];
      -[CALayer setContents:](self->mLayer, "setContents:", objc_msgSend(v5, "CGImageForContentsScale:"));
    }
    else
    {
      v6 = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
      self->mLayer = v6;
      Mutable = CGPathCreateMutable();
      [(TSDKnob *)self radius];
      CGFloat v9 = v8 + v8;
      CGFloat v10 = *MEMORY[0x263F00148];
      double v11 = *(double *)(MEMORY[0x263F00148] + 8);
      -[CALayer setBounds:](v6, "setBounds:", *MEMORY[0x263F00148], v11, v9, v9);
      v13.origin.double x = v10;
      v13.origin.double y = v11;
      v13.size.width = v9;
      v13.size.height = v9;
      CGPathAddEllipseInRect(Mutable, 0, v13);
      [(CALayer *)v6 setPath:Mutable];
      CGPathRelease(Mutable);
      -[CALayer setFillColor:](v6, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "whiteColor"), "CGColor"));
      -[CALayer setStrokeColor:](v6, "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "blackColor"), "CGColor"));
    }
    result = self->mLayer;
    if (self->mTag - 12 <= 4)
    {
      [(CALayer *)result zPosition];
      [(CALayer *)self->mLayer setZPosition:v12 + 1.0];
      return self->mLayer;
    }
  }
  return result;
}

- (id)hitRegionLayerForRep:(id)a3
{
  if (self->mRep != a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDKnob hitRegionLayerForRep:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 488, @"wrong rep for hit region");
  }
  id result = self->mHitRegionLayer;
  if (!result)
  {
    self->mHitRegionLayer = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    -[CAShapeLayer setFillColor:](self->mHitRegionLayer, "setFillColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "colorWithRed:green:blue:alpha:", 0.7, 0.1, 0.1, 0.3), "CGColor"));
    mHitRegionPath = self->mHitRegionPath;
    if (!mHitRegionPath)
    {
      [(TSDKnob *)self updateHitRegionPathForRep:a3];
      mHitRegionPath = self->mHitRegionPath;
    }
    [(CAShapeLayer *)self->mHitRegionLayer setPath:[(TSDBezierPath *)mHitRegionPath CGPath]];
    return self->mHitRegionLayer;
  }
  return result;
}

- (CGRect)boundingBoxOfHitRegionForRep:(id)a3 scale:(double)a4
{
  if (self->mRep != a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDKnob boundingBoxOfHitRegionForRep:scale:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDKnob.m"), 503, @"wrong rep for bounding box");
  }
  if (!self->mHitRegionPath) {
    [(TSDKnob *)self updateHitRegionPathForRep:a3];
  }
  [(TSDKnob *)self position];
  objc_msgSend(a3, "convertNaturalPointToUnscaledCanvas:");
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  CGFloat v14 = 1.0 / v13 * a4;
  [(TSDBezierPath *)self->mHitRegionPath bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGAffineTransformMakeScale(&v23, v14, v14);
  v24.origin.double x = v16;
  v24.origin.double y = v18;
  v24.size.width = v20;
  v24.size.height = v22;
  CGRect v25 = CGRectApplyAffineTransform(v24, &v23);
  return CGRectOffset(v25, v10, v12);
}

- (double)i_rotationInDegreesForKnobOnRep:(id)a3
{
  unint64_t v4 = [(TSDKnob *)self tag];
  unint64_t v5 = (void *)[a3 layout];
  if (v5)
  {
    [v5 transformInRoot];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  if (TSDIsTransformFlipped((double *)&v9)) {
    unint64_t v4 = TSDKnobTagWithFlip(v4);
  }
  double v6 = 0.0;
  if (v4 - 1 <= 0xB) {
    double v6 = dbl_223839B38[v4 - 1];
  }
  objc_msgSend(a3, "additionalRotationForKnobOrientation", v9, v10, v11);
  TSDNormalizeAngleInDegrees(v6 + v7);
  return result;
}

- (void)updateHitRegionPathForRep:(id)a3
{
  self->mHitRegionPath = 0;
  [(TSDKnob *)self radius];
  double v6 = v5;
  if (([a3 canUseSpecializedHitRegionForKnob:self] & 1) == 0) {
    goto LABEL_26;
  }
  [a3 boundsForStandardKnobs];
  double v8 = v7;
  double v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  double v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "interactiveCanvasController"), "viewScale");
  double v14 = v6 / v13 * 10.0;
  if ([(TSDKnob *)self tag] >= 0xC && [(TSDKnob *)self tag] <= 0x10)
  {
    if (v8 < v14 || v10 < v14)
    {
      double v16 = -15.0;
      double v17 = -15.0;
      double v18 = 30.0;
      double v19 = 30.0;
LABEL_27:
      self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v16, v17, v18, v19);
      goto LABEL_28;
    }
LABEL_26:
    double v16 = -(v6 + v6);
    double v18 = v6 + v6 + v6 + v6;
    double v17 = v16;
    double v19 = v18;
    goto LABEL_27;
  }
  double v20 = v6 / v12 + v6 / v12;
  if (v8 < v20 || v10 < v20)
  {
    self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", -15.0, -15.0, 30.0, 45.0);
    float v22 = v8;
    float v23 = v10;
    memset(&v36.c, 0, 32);
    if (fminf(v22, v23) >= 30.0) {
      double v24 = 3.75;
    }
    else {
      double v24 = 7.5;
    }
    *(_OWORD *)&v36.a = 0uLL;
    [(TSDKnob *)self i_rotationInDegreesForKnobOnRep:a3];
    CGAffineTransformMakeRotation(&v36, v25 * 0.0174532925);
    memset(&v35, 0, sizeof(v35));
    CGAffineTransformMakeTranslation(&v35, v36.tx + v24 * v36.c + v36.a * 0.0, v36.ty + v24 * v36.d + v36.b * 0.0);
    mHitRegionPath = self->mHitRegionPath;
    CGAffineTransform t1 = v36;
    CGAffineTransform v32 = v35;
    CGAffineTransformConcat(&v34, &t1, &v32);
    v27 = &v34;
    uint64_t v28 = mHitRegionPath;
  }
  else
  {
    if (v8 >= v14 && v10 >= v14) {
      goto LABEL_26;
    }
    self->mHitRegionPath = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", -v6, -v6, v6 + v6, v6 * 3.0);
    memset(&v36, 0, sizeof(v36));
    [(TSDKnob *)self i_rotationInDegreesForKnobOnRep:a3];
    CGAffineTransformMakeRotation(&v36, v30 * 0.0174532925);
    uint64_t v28 = self->mHitRegionPath;
    CGAffineTransform v35 = v36;
    v27 = &v35;
  }
  [(TSDBezierPath *)v28 transformUsingAffineTransform:v27];
LABEL_28:
  uint64_t v31 = self->mHitRegionPath;
}

- (BOOL)overlapsWithKnob:(id)a3
{
  [(CALayer *)[(TSDKnob *)self layer] frame];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "frame");
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v20 = v5;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  uint64_t v23 = v11;

  return CGRectIntersectsRect(*(CGRect *)&v20, *(CGRect *)&v13);
}

- (BOOL)obscuresKnob:(id)a3
{
  [(CALayer *)[(TSDKnob *)self layer] zPosition];
  double v5 = v4;
  objc_msgSend((id)objc_msgSend(a3, "layer"), "zPosition");
  return v5 > v6;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(TSDKnob *)self tag];
  [(TSDKnob *)self position];
  return (id)[v3 stringWithFormat:@"<%@: %p tag=%lu position=%@>", v4, self, v5, NSStringFromCGPoint(v7)];
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (BOOL)offsetValid
{
  return self->mOffsetValid;
}

- (void)setOffsetValid:(BOOL)a3
{
  self->mOffsetValid = a3;
}

- (CGPoint)offset
{
  double x = self->mOffset.x;
  double y = self->mOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->mOffset = a3;
}

- (double)radius
{
  return self->mRadius;
}

- (void)setRadius:(double)a3
{
  self->mRadius = a3;
}

- (unint64_t)tag
{
  return self->mTag;
}

- (void)setTag:(unint64_t)a3
{
  self->mTag = a3;
}

- (BOOL)worksWhenRepLocked
{
  return self->mWorksWhenRepLocked;
}

- (void)setWorksWhenRepLocked:(BOOL)a3
{
  self->mWorksWhenRepLocked = a3;
}

- (BOOL)worksWhenInVersionBrowsingMode
{
  return self->mWorksWhenInVersionBrowsingMode;
}

- (void)setWorksWhenInVersionBrowsingMode:(BOOL)a3
{
  self->mWorksWhenInVersionBrowsingMode = a3;
}

- (BOOL)shouldDisplayDirectlyOverRep
{
  return self->mShouldDisplayDirectlyOverRep;
}

- (void)setShouldDisplayDirectlyOverRep:(BOOL)a3
{
  self->mShouldDisplayDirectlyOverRep = a3;
}

- (TSDBezierPath)hitRegionPath
{
  return self->mHitRegionPath;
}

- (void)setHitRegionPath:(id)a3
{
}

- (TSDRep)rep
{
  return self->mRep;
}

@end
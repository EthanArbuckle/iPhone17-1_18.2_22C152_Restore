@interface EQKitOverlayBox
- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4;
- (CGRect)erasableBounds;
- (EQKitBox)box;
- (EQKitBox)overlayBox;
- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4;
- (double)depth;
- (double)height;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4;
@end

@implementation EQKitOverlayBox

- (EQKitOverlayBox)initWithBox:(id)a3 overlayBox:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)EQKitOverlayBox;
  v6 = [(EQKitOverlayBox *)&v8 init];
  if (v6)
  {
    v6->mBox = (EQKitBox *)a3;
    v6->mOverlayBox = (EQKitBox *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitOverlayBox;
  [(EQKitOverlayBox *)&v3 dealloc];
}

- (double)width
{
  [(EQKitBox *)self->mBox width];
  return result;
}

- (double)height
{
  [(EQKitBox *)self->mBox height];
  return result;
}

- (double)depth
{
  [(EQKitBox *)self->mBox depth];
  return result;
}

- (CGRect)erasableBounds
{
  [(EQKitBox *)self->mBox erasableBounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  [(EQKitBox *)self->mOverlayBox erasableBounds];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v4;
  uint64_t v20 = v6;
  uint64_t v21 = v8;
  uint64_t v22 = v10;

  return CGRectUnion(*(CGRect *)&v19, *(CGRect *)&v12);
}

- (void)renderIntoContext:(CGContext *)a3 offset:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)EQKitOverlayBox;
  -[EQKitBox renderIntoContext:offset:](&v8, sel_renderIntoContext_offset_);
  -[EQKitBox renderIntoContext:offset:](self->mBox, "renderIntoContext:offset:", a3, x, y);
  -[EQKitBox renderIntoContext:offset:](self->mOverlayBox, "renderIntoContext:offset:", a3, x, y);
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return -[EQKitBox appendOpticalAlignToSpec:offset:](self->mBox, "appendOpticalAlignToSpec:offset:", a3, a4.x, a4.y);
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self || -[EQKitBox p_getTransform:fromDescendant:](self->mBox, "p_getTransform:fromDescendant:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(EQKitOverlayBox *)self box];
  uint64_t v6 = [(EQKitOverlayBox *)self overlayBox];

  return (id)[v4 initWithBox:v5 overlayBox:v6];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3 = self;
  BOOL v4 = self == a3;
  LOBYTE(self) = self == a3;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = [a3 isMemberOfClass:objc_opt_class()];
      if (self)
      {
        uint64_t v6 = [(EQKitOverlayBox *)v3 box];
        self = (EQKitOverlayBox *)[a3 box];
        if (v6 == self
          || (uint64_t v7 = self, LOBYTE(self) = 0, v6)
          && v7
          && (LODWORD(self) = -[EQKitOverlayBox isEqual:](v6, "isEqual:"), self))
        {
          objc_super v8 = [(EQKitOverlayBox *)v3 overlayBox];
          self = (EQKitOverlayBox *)[a3 overlayBox];
          if (v8 == self)
          {
            LOBYTE(self) = 1;
          }
          else
          {
            uint64_t v9 = self;
            LOBYTE(self) = 0;
            if (v8 && v9)
            {
              LOBYTE(self) = -[EQKitOverlayBox isEqual:](v8, "isEqual:");
            }
          }
        }
      }
    }
  }
  return (char)self;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(EQKitOverlayBox *)self height];
  uint64_t v6 = v5;
  [(EQKitOverlayBox *)self depth];
  uint64_t v8 = v7;
  [(EQKitOverlayBox *)self width];
  return (id)[v3 stringWithFormat:@"<%@ %p>: height=%f depth=%f width=%f box=%@ overlayBox=%@ ", v4, self, v6, v8, v9, -[EQKitOverlayBox box](self, "box"), -[EQKitOverlayBox overlayBox](self, "overlayBox")];
}

- (EQKitBox)box
{
  return self->mBox;
}

- (EQKitBox)overlayBox
{
  return self->mOverlayBox;
}

@end
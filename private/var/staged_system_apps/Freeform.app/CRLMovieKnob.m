@interface CRLMovieKnob
- (BOOL)isHidden;
- (CRLMovieKnob)initWithImage:(id)a3 radius:(double)a4 backgroundColor:(id)a5 onRep:(id)a6;
- (CRLMovieKnob)initWithImage:(id)a3 size:(CGSize)a4 backgroundColor:(id)a5 cornerRadius:(double)a6 onRep:(id)a7;
- (id)createKnobRenderable;
- (void)setBackgroundCircleColor:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)updateHitRegionPath;
@end

@implementation CRLMovieKnob

- (CRLMovieKnob)initWithImage:(id)a3 radius:(double)a4 backgroundColor:(id)a5 onRep:(id)a6
{
  id v11 = a5;
  objc_storeStrong((id *)&self->_backgroundColor, a5);
  id v12 = a6;
  id v13 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CRLMovieKnob;
  v14 = [(CRLCanvasButtonKnob *)&v28 initWithImage:0 radius:5 tag:v12 onRep:a4];

  [(CRLCanvasKnob *)v14 setWorksWhenEditingDisabled:1];
  [(CRLCanvasKnob *)v14 setWorksWhenRepLocked:1];
  [(CRLCanvasKnob *)v14 setShouldDisplayDirectlyOverRep:1];
  [(CRLCanvasKnob *)v14 setRadius:a4];
  [(CRLCanvasButtonKnob *)v14 setImage:v13];

  v15 = [(CRLCanvasKnob *)v14 renderable];
  [v15 bounds];
  double v17 = v16;

  if (v17 != 0.0)
  {
    v18 = [(CRLCanvasKnob *)v14 renderable];
    [v18 bounds];
    double v23 = sub_100065738(v19, v20, v21, v22);
    double v25 = v24;
    v26 = [(CRLCanvasButtonKnob *)v14 imageRenderable];
    [v26 setPosition:v23, v25];
  }
  [(CRLMovieKnob *)v14 setHidden:0];

  return v14;
}

- (CRLMovieKnob)initWithImage:(id)a3 size:(CGSize)a4 backgroundColor:(id)a5 cornerRadius:(double)a6 onRep:(id)a7
{
  self->_size = a4;
  self->_cornerRadius = a6;
  return [(CRLMovieKnob *)self initWithImage:a3 radius:a5 backgroundColor:a7 onRep:0.0];
}

- (void)updateHitRegionPath
{
  [(CRLCanvasKnob *)self radius];
  +[CRLBezierPath bezierPathWithOvalInRect:](CRLBezierPath, "bezierPathWithOvalInRect:", -v3, -v3, v3 + v3, v3 + v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(CRLCanvasKnob *)self setHitRegionPath:v4];
}

- (void)setBackgroundCircleColor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [(CRLCanvasKnob *)self renderable];
  sub_1002469D0(v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v7 = [v4 CGColor];
  [v9 setFillColor:v7];
  v8 = +[CRLColor clearColor];
  objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v8, "CGColor"));
}

- (id)createKnobRenderable
{
  id v3 = +[CRLCanvasShapeRenderable renderable];
  [(CRLCanvasKnob *)self radius];
  if (v4 == 0.0)
  {
    [v3 setBounds:sub_100064070()];
    [v3 setCornerRadius:self->_cornerRadius];
    [v3 setBackgroundColor:[self->_backgroundColor CGColor]];
  }
  else
  {
    Mutable = CGPathCreateMutable();
    [(CRLCanvasKnob *)self radius];
    CGFloat v7 = v6 + v6;
    double y = CGPointZero.y;
    [v3 setBounds:CGPointZero.x, y, v7, v7];
    v11.origin.x = CGPointZero.x;
    v11.origin.double y = y;
    v11.size.width = v7;
    v11.size.height = v7;
    CGPathAddEllipseInRect(Mutable, 0, v11);
    [v3 setPath:Mutable];
    CGPathRelease(Mutable);
    [v3 setFillColor:[self->_backgroundColor CGColor]];
  }

  return v3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    BOOL v3 = a3;
    self->_hidden = a3;
    id v4 = [(CRLCanvasKnob *)self renderable];
    [v4 setHidden:v3];
  }
}

- (void).cxx_destruct
{
}

@end
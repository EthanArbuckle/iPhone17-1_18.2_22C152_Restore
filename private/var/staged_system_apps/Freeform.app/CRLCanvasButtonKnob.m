@interface CRLCanvasButtonKnob
+ (double)p_radiusFromImage:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5;
- (CRLCanvasButtonKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (CRLCanvasButtonKnob)initWithImage:(id)a3 radius:(double)a4 tag:(unint64_t)a5 onRep:(id)a6;
- (CRLCanvasRenderable)imageRenderable;
- (CRLImage)highlightedImage;
- (CRLImage)image;
- (id)knobImage;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedImage:(id)a3;
- (void)setImage:(id)a3;
- (void)updateRenderableImage;
@end

@implementation CRLCanvasButtonKnob

- (CRLCanvasButtonKnob)initWithImage:(id)a3 highlightedImage:(id)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (a5 == 0.0)
  {
    [objc_opt_class() p_radiusFromImage:v13];
    a5 = v16;
  }
  v23.receiver = self;
  v23.super_class = (Class)CRLCanvasButtonKnob;
  v17 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v23, "initWithType:position:radius:tag:onRep:", 0, a6, v15, CGPointZero.x, CGPointZero.y, a5);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_image, a3);
    objc_storeStrong((id *)&v18->_highlightedImage, a4);
    v18->_enabled = 1;
    uint64_t v19 = +[CRLCanvasRenderable renderable];
    imageRenderable = v18->_imageRenderable;
    v18->_imageRenderable = (CRLCanvasRenderable *)v19;

    v21 = [(CRLCanvasKnob *)v18 renderable];
    [v21 addSubrenderable:v18->_imageRenderable];
  }
  return v18;
}

- (CRLCanvasButtonKnob)initWithImage:(id)a3 radius:(double)a4 tag:(unint64_t)a5 onRep:(id)a6
{
  return [(CRLCanvasButtonKnob *)self initWithImage:a3 highlightedImage:0 radius:a5 tag:a6 onRep:a4];
}

+ (double)p_radiusFromImage:(id)a3
{
  if (a3)
  {
    [a3 size];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  return fmax(width, height) * 0.5;
}

- (BOOL)isHitByUnscaledPoint:(CGPoint)a3 inputType:(int64_t)a4 returningDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  v10 = [(CRLCanvasKnob *)self renderable];
  if (([v10 isHidden] & 1) != 0 || (objc_msgSend(v10, "opacity"), v11 <= 0.0))
  {
    BOOL v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CRLCanvasButtonKnob;
    BOOL v12 = -[CRLCanvasKnob isHitByUnscaledPoint:inputType:returningDistance:](&v14, "isHitByUnscaledPoint:inputType:returningDistance:", a4, a5, x, y);
  }

  return v12;
}

- (id)knobImage
{
  if (![(CRLCanvasButtonKnob *)self isEnabled])
  {
    v4 = +[CRLColor lightGrayColor];
    v5 = [(CRLImage *)self->_image compositedImageWithColor:v4 alpha:23 blendMode:0.5];
    goto LABEL_6;
  }
  if ([(CRLCanvasButtonKnob *)self isHighlighted])
  {
    v3 = [(CRLCanvasButtonKnob *)self highlightedImage];
    v4 = v3;
    if (!v3)
    {
      v8 = +[CRLColor blackColor];
      v6 = [(CRLImage *)self->_image compositedImageWithColor:v8 alpha:20 blendMode:0.466666669];

      goto LABEL_7;
    }
    v5 = v3;
LABEL_6:
    v6 = v5;
LABEL_7:

    goto LABEL_9;
  }
  v6 = self->_image;
LABEL_9:

  return v6;
}

- (void)setImage:(id)a3
{
  v5 = (CRLImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_image, a3);
    [(CRLCanvasKnob *)self radius];
    if (v8 && v7 == 0.0)
    {
      [objc_opt_class() p_radiusFromImage:v8];
      -[CRLCanvasKnob setRadius:](self, "setRadius:");
      [(CRLCanvasKnob *)self updateHitRegionPath];
    }
    p_image = (CRLImage **)[(CRLCanvasButtonKnob *)self updateRenderableImage];
  }

  _objc_release_x2(p_image);
}

- (void)setHighlightedImage:(id)a3
{
  v5 = (CRLImage *)a3;
  if (self->_highlightedImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_highlightedImage, a3);
    [(CRLCanvasButtonKnob *)self updateRenderableImage];
    v5 = v6;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    [(CRLCanvasButtonKnob *)self updateRenderableImage];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(CRLCanvasButtonKnob *)self updateRenderableImage];
  }
}

- (void)updateRenderableImage
{
  v3 = [(CRLCanvasButtonKnob *)self knobImage];
  v4 = [(CRLCanvasKnob *)self rep];
  v5 = [v4 canvas];
  [v5 contentsScale];
  id v6 = [v3 CGImageForContentsScale:];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  id v8 = [(CRLCanvasButtonKnob *)self imageRenderable];
  double v7 = [(CRLCanvasButtonKnob *)self knobImage];
  [v7 size];
  [v8 setBounds:sub_100064070()];

  [v8 setContents:v6];
  +[CATransaction commit];
}

- (CRLImage)image
{
  return self->_image;
}

- (CRLImage)highlightedImage
{
  return self->_highlightedImage;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (CRLCanvasRenderable)imageRenderable
{
  return (CRLCanvasRenderable *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageRenderable, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end
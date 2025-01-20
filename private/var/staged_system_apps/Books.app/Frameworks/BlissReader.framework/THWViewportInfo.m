@interface THWViewportInfo
- (CGSize)canvasSize;
- (CGSize)frameViewSize;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)canvasInfos;
- (NSString)progressKitID;
- (NSString)progressKitSectionID;
- (THWViewportInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDShapeInfo)backgroundShape;
- (TSDStroke)stroke;
- (TSWPopoverTheme)popoverTheme;
- (UIEdgeInsets)frameCanvasContentInsets;
- (double)contentPadding;
- (id)frameCanvasInfos;
- (void)dealloc;
- (void)setBackgroundShape:(id)a3;
- (void)setCanvasInfos:(id)a3;
- (void)setCanvasSize:(CGSize)a3;
- (void)setContentPadding:(double)a3;
- (void)setPopoverTheme:(id)a3;
- (void)setProgressKitID:(id)a3;
- (void)setProgressKitSectionID:(id)a3;
- (void)setStroke:(id)a3;
- (void)updateBackgroundColor:(id)a3;
@end

@implementation THWViewportInfo

- (THWViewportInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWViewportInfo;
  v4 = [(THWViewportInfo *)&v7 initWithContext:a3 geometry:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TSWPopoverTheme);
    v4->_popoverTheme = v5;
    [(TSWPopoverTheme *)v5 setPopoverHasGradientBackground:1];
    -[TSWPopoverTheme setPopoverContentInsets:](v4->_popoverTheme, "setPopoverContentInsets:", 0.0, 0.0, 0.0, 0.0);
    -[TSWPopoverTheme setPopoverFadeInsets:](v4->_popoverTheme, "setPopoverFadeInsets:", 8.0, 0.0, 8.0, 0.0);
  }
  return v4;
}

- (void)dealloc
{
  self->_backgroundShape = 0;
  self->_canvasInfos = 0;

  self->_stroke = 0;
  self->_popoverTheme = 0;

  self->_progressKitID = 0;
  self->_progressKitSectionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWViewportInfo;
  [(THWViewportInfo *)&v3 dealloc];
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (void)setBackgroundShape:(id)a3
{
  id v5 = a3;

  self->_backgroundShape = (TSDShapeInfo *)a3;
  if (a3)
  {
    objc_opt_class();
    [self->_backgroundShape style].valueForProperty:516;
    v6 = (void *)TSUDynamicCast();
    if (!v6) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportInfo setBackgroundShape:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportInfo.m") lineNumber:87 description:@"viewport widget must have a background color"];
    }
    id v7 = [v6 color];
    popoverTheme = self->_popoverTheme;
    [(TSWPopoverTheme *)popoverTheme setPopoverBackgroundColor:v7];
  }
}

- (void)setStroke:(id)a3
{
  id v5 = a3;

  self->_stroke = (TSDStroke *)a3;
  popoverTheme = self->_popoverTheme;

  [(TSWPopoverTheme *)popoverTheme setPopoverStroke:a3];
}

- (void)updateBackgroundColor:(id)a3
{
  if (a3)
  {
LABEL_2:
    popoverTheme = self->_popoverTheme;
    -[TSWPopoverTheme setPopoverBackgroundColor:](popoverTheme, "setPopoverBackgroundColor:");
    return;
  }
  if (!self->_backgroundShape)
  {
    +[TSUColor lightGrayColor];
    goto LABEL_2;
  }

  -[THWViewportInfo setBackgroundShape:](self, "setBackgroundShape:");
}

- (id)frameCanvasInfos
{
  return [(THWViewportInfo *)self canvasInfos];
}

- (UIEdgeInsets)frameCanvasContentInsets
{
  [(THWViewportInfo *)self contentPadding];
  double v4 = v3;
  [(THWViewportInfo *)self contentPadding];
  double v6 = v5;
  [(THWViewportInfo *)self contentPadding];
  double v8 = v7;
  [(THWViewportInfo *)self contentPadding];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)frameViewSize
{
  id v2 = [(TSDShapeInfo *)[(THWViewportInfo *)self backgroundShape] geometry];

  [v2 size];
  result.height = v4;
  result.width = v3;
  return result;
}

- (TSDShapeInfo)backgroundShape
{
  return self->_backgroundShape;
}

- (NSArray)canvasInfos
{
  return self->_canvasInfos;
}

- (void)setCanvasInfos:(id)a3
{
}

- (CGSize)canvasSize
{
  double width = self->canvasSize.width;
  double height = self->canvasSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->canvasSize = a3;
}

- (double)contentPadding
{
  return self->contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->contentPadding = a3;
}

- (TSDStroke)stroke
{
  return self->_stroke;
}

- (TSWPopoverTheme)popoverTheme
{
  return self->_popoverTheme;
}

- (void)setPopoverTheme:(id)a3
{
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
}

@end
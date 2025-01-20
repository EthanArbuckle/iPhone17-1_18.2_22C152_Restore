@interface THWTransportControlRep
- (CALayer)backgroundLayer;
- (TSWTransportControlClone)clone;
- (double)fontSizeForLabelControl:(id)a3;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)fontNameForLabelControl:(id)a3;
- (id)shadowForLabelControl:(id)a3;
- (id)stringForLabelControl:(id)a3;
- (id)textColorForLabelControl:(id)a3;
- (int)buttonControlState:(id)a3;
- (int)horizontaAlignmentForLabelControl:(id)a3;
- (int)verticalAlignmentForLabelControl:(id)a3;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)buttonControlWasPressed:(id)a3;
- (void)dealloc;
- (void)p_updateBackgroundLayerContent;
- (void)p_updateControlStates;
- (void)screenScaleDidChange;
- (void)setBackgroundLayer:(id)a3;
- (void)transportControlCloneDidUpdateState:(id)a3;
- (void)updateFromLayout;
- (void)wasAddedToParent;
- (void)willBeRemovedFromParent;
@end

@implementation THWTransportControlRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  [(THWTransportControlRep *)&v3 dealloc];
}

- (void)wasAddedToParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  [(THWTransportControlRep *)&v3 wasAddedToParent];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"transportControlCloneDidUpdateState:" name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (void)willBeRemovedFromParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  [(THWTransportControlRep *)&v3 willBeRemovedFromParent];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  [(THWTransportControlRep *)&v3 updateFromLayout];
  if (!self->_backgroundLayer)
  {
    self->_backgroundLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    [(CALayer *)self->_backgroundLayer setDelegate:[(THWTransportControlRep *)self interactiveCanvasController]];
    [self canvas].contentsScale
    -[CALayer setContentsScale:](self->_backgroundLayer, "setContentsScale:");
    [(THWTransportControlRep *)self p_updateBackgroundLayerContent];
  }
}

- (void)p_updateBackgroundLayerContent
{
  id v3 = +[TSUImage imageNamed:@"THKN_control_bg-fill" inBundle:THBundle()];
  [self canvas].contentsScale;
  double v5 = v4;
  [self->_backgroundLayer setContents:[v3 CGImageForContentsScale:]];
  backgroundLayer = self->_backgroundLayer;

  [(CALayer *)backgroundLayer setContentsScale:v5];
}

- (void)screenScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)THWTransportControlRep;
  [(THWTransportControlRep *)&v3 screenScaleDidChange];
  [(THWTransportControlRep *)self p_updateBackgroundLayerContent];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWTransportControlRep;
  -[THWTransportControlRep addAdditionalChildLayersToArray:](&v6, "addAdditionalChildLayersToArray:");
  [self layout].frame
  TSDRectWithSize();
  -[THWTransportControlRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
  backgroundLayer = self->_backgroundLayer;
  if (backgroundLayer)
  {
    -[CALayer setFrame:](backgroundLayer, "setFrame:");
    [a3 insertObject:self->_backgroundLayer atIndex:0];
  }
}

- (void)buttonControlWasPressed:(id)a3
{
  double v4 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    objc_super v6 = [(THWTransportControlRep *)self clone];
    [(TSWTransportControlClone *)v6 transportControlCloneGotoNext];
  }
  else if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v7 = [(THWTransportControlRep *)self clone];
    [(TSWTransportControlClone *)v7 transportControlCloneGotoPrev];
  }
  else if (!v4)
  {
    double v5 = [(THWTransportControlRep *)self clone];
    [(TSWTransportControlClone *)v5 transportControlCloneGotoFirst];
  }
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if ((unint64_t)v7 > 2) {
    goto LABEL_7;
  }
  CFStringRef v8 = @"_N";
  if (v5) {
    CFStringRef v8 = @"_P";
  }
  if (a4 == 2) {
    CFStringRef v8 = @"_D";
  }
  id result = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", +[NSString stringWithFormat:@"%@%@", *(&off_45A528 + (void)v7), v8], THBundle());
  if (!result)
  {
LABEL_7:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWTransportControlRep buttonControl:imageForState:highlighted:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWTransportControlRep.m") lineNumber:170 description:@"invalid nil value for '%s'", "image"];
    return 0;
  }
  return result;
}

- (int)buttonControlState:(id)a3
{
  double v4 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v4 == (unsigned char *)&dword_0 + 2)
  {
    unsigned int v5 = [(TSWTransportControlClone *)[(THWTransportControlRep *)self clone] transportControlCloneCanGotoNext];
  }
  else if (v4 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v5 = [(TSWTransportControlClone *)[(THWTransportControlRep *)self clone] transportControlCloneCanGotoPrev];
  }
  else
  {
    if (v4) {
      return 0;
    }
    unsigned int v5 = [(TSWTransportControlClone *)[(THWTransportControlRep *)self clone] transportControlCloneCanGotoFirst];
  }
  if (v5) {
    return 0;
  }
  else {
    return 2;
  }
}

- (id)stringForLabelControl:(id)a3
{
  return +[NSString stringWithFormat:@"%lu/%lu", (char *)[(TSWTransportControlClone *)[(THWTransportControlRep *)self clone] transportControlCloneIndex]+ 1, [(TSWTransportControlClone *)[(THWTransportControlRep *)self clone] transportControlCloneCount]];
}

- (id)fontNameForLabelControl:(id)a3
{
  id v3 = +[TSUFont boldSystemFontOfSize:](TSUFont, "boldSystemFontOfSize:", a3, 12.0);

  return [v3 fontName];
}

- (double)fontSizeForLabelControl:(id)a3
{
  return 12.0;
}

- (id)textColorForLabelControl:(id)a3
{
  return +[TSUColor whiteColor];
}

- (int)horizontaAlignmentForLabelControl:(id)a3
{
  return 1;
}

- (int)verticalAlignmentForLabelControl:(id)a3
{
  return 1;
}

- (id)shadowForLabelControl:(id)a3
{
  id v3 = [TSUColor blackColor].CGColor;

  return +[TSDShadow shadowWithAngle:v3 offset:1 radius:-90.0 opacity:1.0 color:0.0 enabled:1.0];
}

- (void)transportControlCloneDidUpdateState:(id)a3
{
  double v4 = (TSWTransportControlClone *)[a3 object];
  if (v4 == [(THWTransportControlRep *)self clone])
  {
    [(THWTransportControlRep *)self p_updateControlStates];
  }
}

- (TSWTransportControlClone)clone
{
  [(THWTransportControlRep *)self parentRep];
  id v3 = (TSWTransportControlClone *)[(id)TSUProtocolCast() cloneForTransportControl:self];
  if (!v3) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWTransportControlRep clone]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWTransportControlRep.m") lineNumber:260 description:@"invalid nil value for '%s'", "clone"];
  }
  return v3;
}

- (void)p_updateControlStates
{
  id v2 = [(THWTransportControlRep *)self layout];

  [v2 invalidateControls];
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

@end
@interface THWButtonControlRep
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)highlighted;
- (BOOL)p_interactionEnabled;
- (CALayer)highlightLayer;
- (THWButtonControlDelegate)delegate;
- (TSUIntegerKeyDictionary)cachedImages;
- (id)additionalLayersOverLayer;
- (id)p_imageForState:(int)a3 highlighted:(BOOL)a4;
- (int)state;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)p_interactionDidEnd;
- (void)p_interactionWillStart;
- (void)screenScaleDidChange;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation THWButtonControlRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWButtonControlRep;
  [(THWButtonControlRep *)&v3 dealloc];
}

- (THWButtonControlDelegate)delegate
{
  if (*(THWButtonControlDelegate **)((char *)&self->_delegate + 1)) {
    return *(THWButtonControlDelegate **)((char *)&self->_delegate + 1);
  }
  [(THWButtonControlRep *)self parentRep];

  return (THWButtonControlDelegate *)TSUProtocolCast();
}

- (void)screenScaleDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)THWButtonControlRep;
  [(THWButtonControlRep *)&v4 screenScaleDidChange];
  objc_super v3 = [(THWButtonControlRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (-[THWButtonControlDelegate buttonControlUseContentsScaleForImageCache:](v3, "buttonControlUseContentsScaleForImageCache:", self))[*(id *)((char *)&self->_cachedImages + 1) removeAllObjects]; {
  }
    }
}

- (int)state
{
  objc_super v3 = [(THWButtonControlRep *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWButtonControlDelegate *)v3 buttonControlState:self];
}

- (id)p_imageForState:(int)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v7 = *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1);
  if (!v7)
  {
    v7 = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
    *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1) = v7;
  }
  id v8 = [(TSUIntegerKeyDictionary *)v7 objectForKey:v4 | (2 * v5)];
  if (!v8)
  {
    id v8 = [(THWButtonControlDelegate *)[(THWButtonControlRep *)self delegate] buttonControl:self imageForState:v5 highlighted:v4];
    if (!v8 && v4) {
      id v8 = [(THWButtonControlRep *)self p_imageForState:v5 highlighted:0];
    }
    if (v5 == 1 && !v8)
    {
      id v8 = [(THWButtonControlRep *)self p_imageForState:0 highlighted:v4];
      if (v8)
      {
LABEL_12:
        [*(id *)((char *)&self->_cachedImages + 1) setObject:v8 forKey:v4 | (2 * v5)];
        return v8;
      }
      id v8 = [(THWButtonControlRep *)self p_imageForState:0 highlighted:0];
    }
    if (v8) {
      goto LABEL_12;
    }
  }
  return v8;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(THWControlRep *)self invalidateLayers];
    BOOL v4 = [(THWButtonControlRep *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [(THWButtonControlDelegate *)v4 buttonControlHighlightedDidChange:self];
    }
  }
}

- (BOOL)p_interactionEnabled
{
  id v3 = [(THWControlRep *)self controlHostRep];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  id v4 = [(THWButtonControlRep *)self layout];

  return [v3 control:v4 isInteractionEnabledForRep:self];
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4 = [a3 gestureKind];
  if (v4 != (id)TSWPImmediatePress || [(THWButtonControlRep *)self state] == 2) {
    return 0;
  }

  return [(THWButtonControlRep *)self p_interactionEnabled];
}

- (BOOL)handleGesture:(id)a3
{
  switch([a3 gestureState])
  {
    case 1u:
      [(THWButtonControlRep *)self p_interactionWillStart];
      uint64_t v5 = self;
      id v6 = &dword_0 + 1;
      goto LABEL_10;
    case 2u:
      if (objc_msgSend(objc_msgSend(-[THWButtonControlRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "isAncestorScrollViewDragging"))
      {
        objc_opt_class();
        [(id)TSUDynamicCast() cancel];
        uint64_t v5 = self;
        id v6 = 0;
      }
      else
      {
        [a3 naturalLocationForRep:self];
        id v6 = -[THWButtonControlRep containsPoint:](self, "containsPoint:");
        uint64_t v5 = self;
      }
LABEL_10:
      [(THWButtonControlRep *)v5 setHighlighted:v6];
      return 1;
    case 3u:
      if ([(THWButtonControlRep *)self highlighted])
      {
        [(THWButtonControlRep *)self setHighlighted:0];
        [(THWButtonControlDelegate *)[(THWButtonControlRep *)self delegate] buttonControlWasPressed:self];
      }
      goto LABEL_6;
    case 4u:
    case 5u:
      [(THWButtonControlRep *)self setHighlighted:0];
LABEL_6:
      [(THWButtonControlRep *)self p_interactionDidEnd];
      break;
    default:
      return 1;
  }
  return 1;
}

- (void)p_interactionWillStart
{
  id v3 = [(THWButtonControlRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWButtonControlDelegate *)v3 buttonControlInteractionWillStart:self];
  }
}

- (void)p_interactionDidEnd
{
  id v3 = [(THWButtonControlRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWButtonControlDelegate *)v3 buttonControlInteractionDidEnd:self];
  }
}

- (CALayer)highlightLayer
{
  result = *(CALayer **)((char *)&self->_highlightLayer + 1);
  if (!result)
  {
    *(CALayer **)((char *)&self->_highlightLayer + 1) = (CALayer *)objc_alloc_init((Class)CALayer);
    [self->_highlightLayer setBackgroundColor:[TSUColor CGColor:[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.3), "CGColor"]];
    double y = CGPointZero.y;
    [*(id *)((char *)&self->_highlightLayer + 1) setAnchorPoint:CGPointZero.x, y];
    [*(id *)((char *)&self->_highlightLayer + 1) setPosition:CGPointZero.x, y];
    return *(CALayer **)((char *)&self->_highlightLayer + 1);
  }
  return result;
}

- (void)didUpdateLayer:(id)a3
{
  id v5 = [(THWButtonControlRep *)self p_imageForState:[(THWButtonControlRep *)self state] highlighted:self->_highlighted];
  id v6 = [(THWButtonControlRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (self->_highlighted)
    {
      unsigned int v7 = [(THWButtonControlDelegate *)v6 buttonControlAdjustImageWhenHighlighted:self];
      goto LABEL_7;
    }
  }
  else if (self->_highlighted)
  {
    unsigned int v7 = v5 == [(THWButtonControlRep *)self p_imageForState:[(THWButtonControlRep *)self state] highlighted:0];
    goto LABEL_7;
  }
  unsigned int v7 = 0;
LABEL_7:
  [self canvas].contentsScale
  double v9 = v8;
  id v10 = [v5 CGImageForContentsScale:];
  if ([a3 contents] != v10)
  {
    [a3 setContents:v10];
    [a3 setContentsScale:v9];
  }
  if (v7)
  {
    v11 = [(THWButtonControlRep *)self highlightLayer];
    double y = CGPointZero.y;
    [a3 bounds];
    -[CALayer setBounds:](v11, "setBounds:", CGPointZero.x, y);
    if (![(CALayer *)v11 superlayer]) {
      [a3 insertSublayer:v11 atIndex:0];
    }
  }
  else
  {
    [*(id *)((char *)&self->_highlightLayer + 1) removeFromSuperlayer];

    *(CALayer **)((char *)&self->_highlightLayer + 1) = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    [(THWButtonControlDelegate *)v6 buttonControl:self didUpdateLayer:a3];
  }
}

- (id)additionalLayersOverLayer
{
  id v3 = [(THWButtonControlRep *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(THWButtonControlDelegate *)v3 buttonControlAdditionalLayersOverLayer:self];
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  id v5 = [(THWButtonControlRep *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [(THWButtonControlDelegate *)v5 buttonControl:self addAdditionalChildLayersToArray:a3];
  }
}

- (TSUIntegerKeyDictionary)cachedImages
{
  return *(TSUIntegerKeyDictionary **)((char *)&self->_cachedImages + 1);
}

- (void)setDelegate:(id)a3
{
  *(THWButtonControlDelegate **)((char *)&self->_delegate + 1) = (THWButtonControlDelegate *)a3;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end
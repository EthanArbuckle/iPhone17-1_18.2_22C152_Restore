@interface THWLabelControlRep
- (THWLabelControlDelegate)delegate;
- (THWLabelLayer)labelLayer;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setLabelLayer:(id)a3;
- (void)updateFromLayout;
- (void)updateLayerGeometryFromLayout:(id)a3;
@end

@implementation THWLabelControlRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWLabelControlRep;
  [(THWLabelControlRep *)&v3 dealloc];
}

- (THWLabelControlDelegate)delegate
{
  if (self->_delegate) {
    return self->_delegate;
  }
  [(THWLabelControlRep *)self parentRep];

  return (THWLabelControlDelegate *)TSUProtocolCast();
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THWLabelControlRep;
  [(THWLabelControlRep *)&v3 updateLayerGeometryFromLayout:a3];
}

- (void)updateFromLayout
{
  v6.receiver = self;
  v6.super_class = (Class)THWLabelControlRep;
  [(THWLabelControlRep *)&v6 updateFromLayout];
  if (!self->_labelLayer)
  {
    self->_labelLayer = objc_alloc_init(THWLabelLayer);
    [(THWLabelLayer *)self->_labelLayer setDelegate:+[THNoAnimationLayerDelegate sharedInstance]];
    [self canvas].contentsScale;
    -[THWLabelLayer setContentsScale:](self->_labelLayer, "setContentsScale:");
  }
  [(THWLabelLayer *)self->_labelLayer setString:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] stringForLabelControl:self]];
  [(THWLabelLayer *)self->_labelLayer setTextColor:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] textColorForLabelControl:self]];
  [(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] fontSizeForLabelControl:self];
  double v4 = v3;
  [self canvas].viewScale;
  [(THWLabelLayer *)self->_labelLayer setFontSize:v4 * v5];
  [(THWLabelLayer *)self->_labelLayer setFontName:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] fontNameForLabelControl:self]];
  [(THWLabelLayer *)self->_labelLayer setHorizontalAlignment:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] horizontaAlignmentForLabelControl:self]];
  [(THWLabelLayer *)self->_labelLayer setVerticalAlignment:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] verticalAlignmentForLabelControl:self]];
  [(THWLabelLayer *)self->_labelLayer setShadow:[(THWLabelControlDelegate *)[(THWLabelControlRep *)self delegate] shadowForLabelControl:self]];
  [self canvas].viewScale;
  -[THWLabelLayer setShadowScale:](self->_labelLayer, "setShadowScale:");
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if (self->_labelLayer)
  {
    [self layout].frame
    TSDRectWithSize();
    -[THWLabelControlRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    -[THWLabelLayer setFrame:](self->_labelLayer, "setFrame:");
    labelLayer = self->_labelLayer;
    [a3 addObject:labelLayer];
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWLabelControlDelegate *)a3;
}

- (THWLabelLayer)labelLayer
{
  return self->_labelLayer;
}

- (void)setLabelLayer:(id)a3
{
}

@end
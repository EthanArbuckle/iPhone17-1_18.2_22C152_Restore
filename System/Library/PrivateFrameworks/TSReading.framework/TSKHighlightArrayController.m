@interface TSKHighlightArrayController
- (BOOL)autohide;
- (BOOL)pulsating;
- (BOOL)shouldPulsate;
- (CGAffineTransform)transform;
- (NSArray)layers;
- (TSKHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4;
- (double)viewScale;
- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4;
- (void)dealloc;
- (void)disconnect;
- (void)pulseAnimationDidStopForPulse:(id)a3;
- (void)reset;
- (void)setAutohide:(BOOL)a3;
- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4;
- (void)setPulsating:(BOOL)a3;
- (void)setShouldPulsate:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewScale:(double)a3;
- (void)startAnimating;
- (void)stop;
@end

@implementation TSKHighlightArrayController

- (TSKHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSKHighlightArrayController;
  result = [(TSKHighlightArrayController *)&v7 init];
  if (result)
  {
    result->_delegate = (TSKHighlightArrayControllerProtocol *)a4;
    result->_zOrder = a3;
  }
  return result;
}

- (void)dealloc
{
  [(TSKHighlightArrayController *)self disconnect];
  [(TSKHighlightArrayController *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)TSKHighlightArrayController;
  [(TSKHighlightArrayController *)&v3 dealloc];
}

- (void)startAnimating
{
  if ([(NSMutableArray *)self->_controllers count] && self->_shouldPulsate && !self->_pulsating)
  {
    [(NSMutableArray *)self->_controllers makeObjectsPerformSelector:sel_startAnimating];
    self->_pulsating = 1;
  }
}

- (void)stop
{
  if ([(NSMutableArray *)self->_controllers count] && self->_shouldPulsate)
  {
    self->_pulsating = 0;
    controllers = self->_controllers;
    [(NSMutableArray *)controllers makeObjectsPerformSelector:sel_stop];
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  self->_pulsating = 0;
  [(TSKHighlightArrayControllerProtocol *)self->_delegate pulseAnimationDidStop:self];
}

- (void)disconnect
{
  self->_delegate = 0;
  [(NSMutableArray *)self->_controllers makeObjectsPerformSelector:sel_disconnect];
}

- (void)reset
{
  self->_controllers = 0;
  self->_layers = 0;
}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  if (self->_creatingLayers)
  {
    objc_super v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKHighlightArrayController.m"), 82, @"buildHighlightsForSearchReferences: should not be called recursively.");
  }
  else
  {
    self->_creatingLayers = 1;
    if (!self->_layers) {
      self->_layers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a3, "count"));
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (self->_shouldPulsate) {
            v14 = [[TSKPulseAnimationController alloc] initWithDelegate:self];
          }
          else {
            v14 = objc_alloc_init(TSKHighlightController);
          }
          v15 = v14;
          [v6 addObject:v14];

          if (self->_shouldPulsate) {
            [(TSKPulseAnimationController *)v15 setAutohide:self->_autohide];
          }
          v16 = (const CGPath *)[(TSKHighlightArrayControllerProtocol *)self->_delegate newPathForSearchReference:v13];
          v17 = v16;
          if (v16 && !CGPathIsEmpty(v16))
          {
            [(TSKHighlightController *)v15 setViewScale:self->_viewScale];
            long long v18 = *(_OWORD *)&self->_canvasTransform.c;
            v25[0] = *(_OWORD *)&self->_canvasTransform.a;
            v25[1] = v18;
            v25[2] = *(_OWORD *)&self->_canvasTransform.tx;
            long long v19 = *(_OWORD *)&self->_layerTransform.c;
            v24[0] = *(_OWORD *)&self->_layerTransform.a;
            v24[1] = v19;
            v24[2] = *(_OWORD *)&self->_layerTransform.tx;
            [(TSKHighlightController *)v15 setCanvasTransform:v25 layerTransform:v24];
            uint64_t v20 = [(TSKHighlightArrayControllerProtocol *)self->_delegate imageForSearchReference:v13 forPath:v17 shouldPulsate:self->_shouldPulsate];
            [(TSKHighlightController *)v15 createLayerWithZOrder:self->_zOrder contentsScaleForLayers:a4];
            [(TSKHighlightController *)v15 buildLayersForPath:v17 withImage:v20];
            [(NSMutableArray *)self->_layers addObject:[(TSKHighlightController *)v15 layer]];
          }
          CGPathRelease(v17);
        }
        uint64_t v10 = [a3 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }
    self->_creatingLayers = 0;
  }
  controllers = self->_controllers;
  if (!controllers)
  {
    if ([a3 count])
    {
      self->_controllers = (NSMutableArray *)[v6 mutableCopy];
      return v6;
    }
    controllers = self->_controllers;
  }
  [(NSMutableArray *)controllers addObjectsFromArray:v6];
  return v6;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_layerTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_layerTransform.tx = v4;
  *(_OWORD *)&self->_layerTransform.a = v3;
  long long v5 = *(_OWORD *)&a3->a;
  long long v6 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = v6;
  *(_OWORD *)&self->_canvasTransform.a = v5;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setCanvasTransform:(CGAffineTransform *)a3 layerTransform:(CGAffineTransform *)a4
{
  long long v4 = *(_OWORD *)&a3->a;
  long long v5 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_canvasTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_canvasTransform.tx = v5;
  *(_OWORD *)&self->_canvasTransform.a = v4;
  long long v6 = *(_OWORD *)&a4->a;
  long long v7 = *(_OWORD *)&a4->tx;
  *(_OWORD *)&self->_layerTransform.c = *(_OWORD *)&a4->c;
  *(_OWORD *)&self->_layerTransform.tx = v7;
  *(_OWORD *)&self->_layerTransform.a = v6;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (NSArray)layers
{
  return &self->_layers->super;
}

- (BOOL)shouldPulsate
{
  return self->_shouldPulsate;
}

- (void)setShouldPulsate:(BOOL)a3
{
  self->_shouldPulsate = a3;
}

- (BOOL)pulsating
{
  return self->_pulsating;
}

- (void)setPulsating:(BOOL)a3
{
  self->_pulsating = a3;
}

- (BOOL)autohide
{
  return self->_autohide;
}

- (void)setAutohide:(BOOL)a3
{
  self->_autohide = a3;
}

@end
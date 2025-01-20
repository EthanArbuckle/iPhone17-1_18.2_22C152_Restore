@interface THHostingPageRep
- (BOOL)drawsPageBackground;
- (BOOL)isVisibleOnCanvas;
- (TSDLayerAndSubviewHosting)layerAndSubviewHost;
- (id)subviewsController;
- (int)positionForChildView:(id)a3;
- (void)addChildViewsToArray:(id)a3;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)p_updateHostGeometry;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)willBeRemoved;
@end

@implementation THHostingPageRep

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THHostingPageRep;
  [(THPageRep *)&v3 dealloc];
}

- (void)willBeRemoved
{
  if ([(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost rep] == (TSDRep *)self)
  {
    [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost setRep:0];
    [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost recycle];
  }

  self->_layerAndSubviewHost = 0;
}

- (TSDLayerAndSubviewHosting)layerAndSubviewHost
{
  result = (TSDLayerAndSubviewHosting *)self->_layerAndSubviewHost;
  if (!result)
  {
    v4 = (THPageLayerAndSubviewHost *)objc_msgSend(objc_msgSend(-[THHostingPageRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider), "layerAndSubviewHostForPageInfo:", -[THHostingPageRep info](self, "info"));
    self->_layerAndSubviewHost = v4;
    [(THPageLayerAndSubviewHost *)v4 setRep:self];
    return (TSDLayerAndSubviewHosting *)self->_layerAndSubviewHost;
  }
  return result;
}

- (id)subviewsController
{
  return [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost subviewsController];
}

- (void)p_updateHostGeometry
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  objc_super v3 = sub_162B80;
  v4 = &unk_456DE0;
  v5 = self;
  if (+[NSThread isMainThread]) {
    v3((uint64_t)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THHostingPageRep;
  [(THHostingPageRep *)&v4 updateLayerGeometryFromLayout:a3];
  [(THHostingPageRep *)self p_updateHostGeometry];
}

- (void)addChildViewsToArray:(id)a3
{
  v5 = [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost view];
  v6 = [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost borderView];
  [(THHostingPageRep *)self p_updateHostGeometry];
  if (v5) {
    [a3 addObject:v5];
  }
  if (v6)
  {
    [a3 addObject:v6];
  }
}

- (int)positionForChildView:(id)a3
{
  if ([(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost borderView] == a3) {
    return 3;
  }
  else {
    return 1;
  }
}

- (BOOL)drawsPageBackground
{
  return 0;
}

- (void)didUpdateLayer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THHostingPageRep;
  [(THPageRep *)&v4 didUpdateLayer:a3];
  [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost updateTopLevelLayers];
}

- (BOOL)isVisibleOnCanvas
{
  return [(THPageLayerAndSubviewHost *)self->_layerAndSubviewHost visible];
}

@end
@interface CRLWPHighlightArrayController
- (BOOL)autohide;
- (BOOL)pulsating;
- (BOOL)shouldPulsate;
- (CGAffineTransform)transform;
- (CRLWPHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4;
- (NSArray)layers;
- (double)viewScale;
- (id)anySuperlayer;
- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4;
- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4 shouldCreateBackground:(BOOL)a5 backgroundColor:(CGColor *)a6;
- (unint64_t)pulseAnimationStyle:(id)a3;
- (void)dealloc;
- (void)disconnect;
- (void)pulseAnimationDidStopForPulse:(id)a3;
- (void)removeLayersFromSuperlayer;
- (void)reset;
- (void)setAutohide:(BOOL)a3;
- (void)setPulsating:(BOOL)a3;
- (void)setShouldPulsate:(BOOL)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setViewScale:(double)a3;
- (void)startAnimating;
- (void)stop;
@end

@implementation CRLWPHighlightArrayController

- (CRLWPHighlightArrayController)initWithZOrder:(double)a3 delegate:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPHighlightArrayController;
  v7 = [(CRLWPHighlightArrayController *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_zOrder = a3;
    long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v8->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v8->_transform.c = v9;
    *(_OWORD *)&v8->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v8->_viewScale = 1.0;
    v8->_layerCreationLock._os_unfair_lock_opaque = 0;
    __dmb(0xBu);
  }

  return v8;
}

- (void)dealloc
{
  [(CRLWPHighlightArrayController *)self disconnect];
  [(CRLWPHighlightArrayController *)self reset];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPHighlightArrayController;
  [(CRLWPHighlightArrayController *)&v3 dealloc];
}

- (void)startAnimating
{
  if ([(NSMutableArray *)self->_controllers count] && self->_shouldPulsate && !self->_pulsating)
  {
    [(NSMutableArray *)self->_controllers makeObjectsPerformSelector:"startAnimating"];
    self->_pulsating = 1;
  }
}

- (void)stop
{
  if (!self->_stopping)
  {
    self->_stopping = 1;
    if ([(NSMutableArray *)self->_controllers count])
    {
      if (self->_shouldPulsate)
      {
        self->_pulsating = 0;
        id v3 = [(NSMutableArray *)self->_controllers copy];
        [v3 makeObjectsPerformSelector:"stop"];
      }
    }
    self->_stopping = 0;
  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  self->_pulsating = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pulseAnimationDidStop:self];
}

- (unint64_t)pulseAnimationStyle:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  id v7 = objc_loadWeakRetained((id *)p_delegate);
  id v8 = [v7 pulseAnimationStyle:self];

  return (unint64_t)v8;
}

- (void)disconnect
{
  objc_storeWeak((id *)&self->_delegate, 0);
  controllers = self->_controllers;

  [(NSMutableArray *)controllers makeObjectsPerformSelector:"disconnect"];
}

- (void)reset
{
  [(NSMutableArray *)self->_controllers makeObjectsPerformSelector:"reset"];
  controllers = self->_controllers;
  self->_controllers = 0;

  layers = self->_layers;
  self->_layers = 0;
}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4
{
  return [(CRLWPHighlightArrayController *)self buildHighlightsForSearchReferences:a3 contentsScaleForLayers:0 shouldCreateBackground:0 backgroundColor:a4];
}

- (id)buildHighlightsForSearchReferences:(id)a3 contentsScaleForLayers:(double)a4 shouldCreateBackground:(BOOL)a5 backgroundColor:(CGColor *)a6
{
  BOOL v28 = a5;
  id v9 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_layerCreationLock);
  if (!self->_layers)
  {
    v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v9 count]];
    layers = self->_layers;
    self->_layers = v10;
  }
  os_unfair_lock_t lock = &self->_layerCreationLock;
  os_unfair_lock_unlock(&self->_layerCreationLock);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v9;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  BOOL v13 = v28;
  if (v12)
  {
    id v14 = v12;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        if (self->_shouldPulsate) {
          v17 = [[CRLPulseAnimationController alloc] initWithDelegate:self];
        }
        else {
          v17 = objc_alloc_init(CRLHighlightController);
        }
        v18 = v17;
        [(CRLHighlightController *)v17 setShouldCreateBackground:v13];
        [(CRLHighlightController *)v18 setBackgroundColor:a6];
        [v32 addObject:v18];
        if (self->_shouldPulsate) {
          [(CRLPulseAnimationController *)v18 setAutohide:self->_autohide];
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v20 = (const CGPath *)[WeakRetained newPathForSearchReference:v16];

        if (v20)
        {
          if (!CGPathIsEmpty(v20))
          {
            CGRect BoundingBox = CGPathGetBoundingBox(v20);
            if (sub_100065AF4(BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height))
            {
              [(CRLHighlightController *)v18 setViewScale:self->_viewScale];
              [(CRLWPHighlightArrayController *)self transform];
              v33[0] = v33[3];
              v33[1] = v33[4];
              v33[2] = v33[5];
              [(CRLHighlightController *)v18 setTransform:v33];
              id v21 = objc_loadWeakRetained((id *)&self->_delegate);
              v22 = [v21 imageForSearchReference:v16 forPath:v20 shouldPulsate:self->_shouldPulsate];

              [(CRLHighlightController *)v18 createLayerWithZOrder:self->_zOrder contentsScaleForLayers:a4];
              [(CRLHighlightController *)v18 buildLayersForPath:v20 withImage:v22];
              v23 = [(CRLHighlightController *)v18 layer];
              os_unfair_lock_lock(lock);
              [(NSMutableArray *)self->_layers addObject:v23];
              BOOL v13 = v28;
              os_unfair_lock_unlock(lock);
            }
          }
          CGPathRelease(v20);
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }

  os_unfair_lock_lock(lock);
  controllers = self->_controllers;
  if (controllers) {
    goto LABEL_21;
  }
  if (![obj count])
  {
    controllers = self->_controllers;
LABEL_21:
    [(NSMutableArray *)controllers addObjectsFromArray:v32];
    goto LABEL_24;
  }
  v25 = (NSMutableArray *)[v32 mutableCopy];
  v26 = self->_controllers;
  self->_controllers = v25;

LABEL_24:
  os_unfair_lock_unlock(lock);

  return v32;
}

- (void)removeLayersFromSuperlayer
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_layers;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) removeFromSuperlayer];
        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)anySuperlayer
{
  if ([(NSMutableArray *)self->_layers count])
  {
    id v3 = [(NSMutableArray *)self->_layers objectAtIndexedSubscript:0];
    id v4 = [v3 superlayer];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSArray)layers
{
  return &self->_layers->super;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controllers, 0);

  objc_storeStrong((id *)&self->_layers, 0);
}

@end
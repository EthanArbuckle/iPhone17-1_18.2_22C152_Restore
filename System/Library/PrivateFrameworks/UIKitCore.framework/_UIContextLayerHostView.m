@interface _UIContextLayerHostView
+ (Class)layerClass;
- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions;
- (_UIContextLayerHostView)initWithSceneLayer:(id)a3;
- (id)layer;
- (unint64_t)renderingMode;
- (void)_prepareForWindowDealloc;
- (void)setAsynchronousRenderingOptions:(id)a3;
- (void)setInheritsSecurity:(BOOL)a3;
- (void)setRenderingMode:(unint64_t)a3;
- (void)setResizesHostedContext:(BOOL)a3;
- (void)setStopsHitTestTransformAccumulation:(BOOL)a3;
- (void)setStopsSecureSuperlayersValidation:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIContextLayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setStopsSecureSuperlayersValidation:](&v6, sel_setStopsSecureSuperlayersValidation_);
  v5 = [(_UIContextLayerHostView *)self layer];
  [v5 setStopsSecureSuperlayersValidation:v3];
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setStopsHitTestTransformAccumulation:](&v6, sel_setStopsHitTestTransformAccumulation_);
  v5 = [(_UIContextLayerHostView *)self layer];
  [v5 setStopsHitTestTransformAccumulation:v3];
}

- (void)setResizesHostedContext:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setResizesHostedContext:](&v6, sel_setResizesHostedContext_);
  v5 = [(_UIContextLayerHostView *)self layer];
  [v5 setResizesHostedContext:v3];
}

- (void)setInheritsSecurity:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIContextLayerHostView;
  -[_UISceneLayerHostView setInheritsSecurity:](&v6, sel_setInheritsSecurity_);
  v5 = [(_UIContextLayerHostView *)self layer];
  [v5 setInheritsSecurity:v3];
}

- (_UIContextLayerHostView)initWithSceneLayer:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIContextLayerHostView;
  v5 = [(_UISceneLayerHostView *)&v10 initWithSceneLayer:v4];
  objc_super v6 = v5;
  if (v5)
  {
    v7 = [(_UIContextLayerHostView *)v5 layer];
    objc_msgSend(v7, "setContextId:", objc_msgSend(v4, "contextID"));

    v8 = [(_UIContextLayerHostView *)v6 layer];
    [v8 setInheritsTiming:0];
  }
  return v6;
}

- (void)setRenderingMode:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(_UIContextLayerHostView *)self renderingMode] != a3)
  {
    v5 = UIScenePresentationLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = [(_UIContextLayerHostView *)self layer];
      int v8 = [v7 contextId];
      v9 = NSStringFromUISceneRenderingMode(a3);
      int v10 = 134218498;
      v11 = self;
      __int16 v12 = 1024;
      int v13 = v8;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "%p - rendering context %d %{public}@", (uint8_t *)&v10, 0x1Cu);
    }
    objc_super v6 = [(_UIContextLayerHostView *)self layer];
    [v6 setRendersAsynchronously:a3 == 1];
  }
}

- (unint64_t)renderingMode
{
  v2 = [(_UIContextLayerHostView *)self layer];
  unint64_t v3 = [v2 rendersAsynchronously];

  return v3;
}

- (void)setAsynchronousRenderingOptions:(id)a3
{
  id v4 = (UISceneAsynchronousRenderingOptions *)a3;
  if (!v4) {
    id v4 = objc_alloc_init(UISceneAsynchronousRenderingOptions);
  }
  int v10 = v4;
  v5 = [(_UIContextLayerHostView *)self layer];
  objc_super v6 = [(UISceneAsynchronousRenderingOptions *)v10 renderTimes];
  [v5 setAsynchronousRenderTimes:v6];

  v7 = [(_UIContextLayerHostView *)self layer];
  [(UISceneAsynchronousRenderingOptions *)v10 renderPeriod];
  objc_msgSend(v7, "setAsynchronousRenderPeriod:");

  int v8 = [(_UIContextLayerHostView *)self layer];
  [(UISceneAsynchronousRenderingOptions *)v10 renderMaxAPL];
  objc_msgSend(v8, "setAsynchronousRenderMaxAPL:");

  v9 = [(_UIContextLayerHostView *)self layer];
  objc_msgSend(v9, "setAsynchronousOpaque:", -[UISceneAsynchronousRenderingOptions opaque](v10, "opaque"));
}

- (id)layer
{
  v4.receiver = self;
  v4.super_class = (Class)_UIContextLayerHostView;
  v2 = [(UIView *)&v4 layer];
  return v2;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  id v6 = +[_UISceneHostingGraph sharedInstance];
  v5 = [(_UISceneLayerHostView *)self sceneLayer];
  objc_msgSend(v6, "_noteContextID:hostedByWindow:", objc_msgSend(v5, "contextID"), v4);
}

- (UISceneAsynchronousRenderingOptions)asynchronousRenderingOptions
{
  unint64_t v3 = objc_alloc_init(UIMutableSceneAsynchronousRenderingOptions);
  id v4 = [(_UIContextLayerHostView *)self layer];
  v5 = [v4 asynchronousRenderTimes];
  [(UIMutableSceneAsynchronousRenderingOptions *)v3 setRenderTimes:v5];

  id v6 = [(_UIContextLayerHostView *)self layer];
  [v6 asynchronousRenderPeriod];
  -[UIMutableSceneAsynchronousRenderingOptions setRenderPeriod:](v3, "setRenderPeriod:");

  v7 = [(_UIContextLayerHostView *)self layer];
  [v7 asynchronousRenderMaxAPL];
  -[UIMutableSceneAsynchronousRenderingOptions setRenderMaxAPL:](v3, "setRenderMaxAPL:");

  int v8 = [(_UIContextLayerHostView *)self layer];
  -[UIMutableSceneAsynchronousRenderingOptions setOpaque:](v3, "setOpaque:", [v8 asynchronousOpaque]);

  return (UISceneAsynchronousRenderingOptions *)v3;
}

- (void)_prepareForWindowDealloc
{
  v5.receiver = self;
  v5.super_class = (Class)_UIContextLayerHostView;
  [(UIView *)&v5 _prepareForWindowDealloc];
  unint64_t v3 = +[_UISceneHostingGraph sharedInstance];
  id v4 = [(_UISceneLayerHostView *)self sceneLayer];
  objc_msgSend(v3, "_noteContextID:hostedByWindow:", objc_msgSend(v4, "contextID"), 0);
}

@end
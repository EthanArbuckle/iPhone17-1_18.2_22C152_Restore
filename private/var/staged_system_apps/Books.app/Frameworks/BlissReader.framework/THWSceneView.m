@interface THWSceneView
- (THWSceneView)initWithFrame:(CGRect)a3 options:(id)a4;
- (id)p_cameraGroup;
- (id)p_duplicateCameraAndAddToGroupAtSceneCenter;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeCameraAnimation;
- (void)rotateCameraContinuously;
- (void)rotateCameraContinuouslyWithEaseIn;
- (void)scnWarmUpScene:(id)a3 abortHandler:(id)a4;
- (void)setEventHandlerStickyAxis:(unint64_t)a3;
- (void)setScene:(id)a3;
@end

@implementation THWSceneView

- (THWSceneView)initWithFrame:(CGRect)a3 options:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)THWSceneView;
  v4 = -[THWSceneView initWithFrame:options:](&v6, "initWithFrame:options:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    [v4 setBackgroundColor:[+[TSUColor clearColor](TSUColor, "clearColor") platformColor]];
    v4->mFnObserving = 0;
    ++dword_5731A8;
  }
  return v4;
}

- (void)setEventHandlerStickyAxis:(unint64_t)a3
{
  id v4 = [(THWSceneView *)self eventHandler];

  [v4 setStickyAxis:a3];
}

- (void)removeCameraAnimation
{
  id v3 = [(THWSceneView *)self p_cameraGroup];
  if (self->mFnObserving)
  {
    [self renderer].removeObserver:self forKeyPath:@"pointOfView";
    self->mFnObserving = 0;
  }
  if ([v3 hasContinuousRotationAnimation])
  {
    [v3 removeContinuousRotationAnimations];
  }
}

- (void)dealloc
{
  [(THWSceneView *)self removeCameraAnimation];
  if (dword_5731A8 < 1) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneView dealloc]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneView.m") lineNumber:104 description:@"gSceneViewCount went negative. Look out for zombies."];
  }
  else {
    --dword_5731A8;
  }
  v3.receiver = self;
  v3.super_class = (Class)THWSceneView;
  [(THWSceneView *)&v3 dealloc];
}

- (void)scnWarmUpScene:(id)a3 abortHandler:(id)a4
{
  id v6 = [(THWSceneView *)self renderer];

  [v6 prepareObject:a3 shouldAbortBlock:a4];
}

- (void)setScene:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THWSceneView;
  [(THWSceneView *)&v7 setScene:a3];
  id v4 = [[self pointOfView] camera];
  [v4 xFov];
  if (v5 != 0.0)
  {
    [v4 yFov];
    if (v6 != 0.0) {
      [v4 setXFov:0.0];
    }
  }
}

- (id)p_cameraGroup
{
  id v2 = [[self scene] rootNode];

  return [v2 childNodeWithName:@"THRotationGroupName" recursively:0];
}

- (id)p_duplicateCameraAndAddToGroupAtSceneCenter
{
  id v3 = [(THWSceneView *)self pointOfView];
  if (v3
    || (id v10 = objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "childNodesWithCamera")) != 0
    && (v11 = v10, [v10 count])
    && (id v3 = [v11 objectAtIndex:0]) != 0)
  {
    float v23 = 0.0;
    float32x2_t v22 = 0;
    float v21 = 0.0;
    float32x2_t v20 = 0;
    if (objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "getBoundingBoxMin:max:", &v22, &v20))
    {
      float32x2_t v6 = vmul_f32(vadd_f32(v22, v20), (float32x2_t)0x3F0000003F000000);
      float v7 = (float)(v23 + v21) * 0.5;
      float v8 = v6.f32[1];
      id v9 = [v3 copy:v6 v5];
    }
    else
    {
      float v8 = 0.0;
      float v7 = 0.0;
      id v9 = [v3 copy];
    }
    id v13 = v9;
    v12 = +[SCNNode node];
    [(SCNNode *)v12 addChildNode:v13];
    [(SCNNode *)v12 setName:@"THRotationGroupName"];
    *(float *)&double v14 = v8;
    *(float *)&double v15 = v7;
    -[SCNNode setPosition:](v12, "setPosition:", v17, v14, v15);
    [v3 worldTransform];
    *(float *)&long long v19 = *(float *)&v19 - *(float *)&v17;
    *((float *)&v19 + 1) = *((float *)&v19 + 1) - v8;
    *((float *)&v19 + 2) = *((float *)&v19 + 2) - v7;
    v18[0] = v18[4];
    v18[1] = v18[5];
    v18[2] = v18[6];
    v18[3] = v19;
    [v13 setTransform:v18];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWSceneView p_duplicateCameraAndAddToGroupAtSceneCenter]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Scene/THWSceneView.m") lineNumber:177 description:@"SceneView has nil point of view"];
    return 0;
  }
  return v12;
}

- (void)rotateCameraContinuously
{
  id v3 = [(THWSceneView *)self p_cameraGroup];
  if (!v3)
  {
    id v3 = [(THWSceneView *)self p_duplicateCameraAndAddToGroupAtSceneCenter];
    objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "addChildNode:", v3);
  }
  LODWORD(v4) = 1.0;
  [v3 addContinuousRotationWithInitialRotation:0.0 v4:0.0 0.0];
  -[THWSceneView setPointOfView:](self, "setPointOfView:", objc_msgSend(objc_msgSend(v3, "childNodes"), "objectAtIndex:", 0));
  if (!self->mFnObserving)
  {
    [self renderer].addObserver:self forKeyPath:@"pointOfView" options:0 context:0];
    self->mFnObserving = 1;
  }
}

- (void)rotateCameraContinuouslyWithEaseIn
{
  id v3 = [(THWSceneView *)self p_cameraGroup];
  if (!v3)
  {
    id v3 = [(THWSceneView *)self p_duplicateCameraAndAddToGroupAtSceneCenter];
    objc_msgSend(objc_msgSend(-[THWSceneView scene](self, "scene"), "rootNode"), "addChildNode:", v3);
  }
  [v3 addContinuousRotationWithEaseIn];
  -[THWSceneView setPointOfView:](self, "setPointOfView:", objc_msgSend(objc_msgSend(v3, "childNodes"), "objectAtIndex:", 0));
  if (!self->mFnObserving)
  {
    [self.renderer addObserver:self forKeyPath:@"pointOfView" options:0 context:0];
    self->mFnObserving = 1;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"pointOfView"]
    && [(THWSceneView *)self renderer] == a4)
  {
    [(THWSceneView *)self removeCameraAnimation];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THWSceneView;
    [(THWSceneView *)&v11 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

@end
@interface _UIHomeAffordanceHostSceneComponent
- (CGRect)homeAffordanceScreenFixedFrame;
- (NSString)debugDescription;
- (NSString)description;
- (void)_evaluateHomeAffordanceIntersectionWithSceneFrameAndSendIfNeeded:(double)a3;
- (void)_sendClientDoubleTapGestureDidSucceedAction:(void *)a1;
- (void)_sendClientHomeAffordanceSceneReferenceFrame:(double)a3;
- (void)appendDescriptionToStream:(id)a3;
- (void)doubleTapGestureDidSucceed:(BOOL)a3;
- (void)scene:(id)a3 didUpdateSettings:(id)a4;
- (void)sceneWillActivate:(id)a3;
- (void)setHomeAffordanceScreenFixedFrame:(CGRect)a3;
- (void)setScene:(id)a3;
@end

@implementation _UIHomeAffordanceHostSceneComponent

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if (*(unsigned char *)&self->_flags)
  {
    if (_UIDeviceSupportsGlobalEdgeSwipeTouches())
    {
      if (_UIApplicationSupportsHomeAffordanceObservation())
      {
        v7 = [v6 settingsDiff];
        int v8 = [v7 containsProperty:sel_frame];

        if (v8)
        {
          v9 = [v6 settings];
          [v9 frame];
          double v11 = v10;
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;

          -[_UIHomeAffordanceHostSceneComponent _evaluateHomeAffordanceIntersectionWithSceneFrameAndSendIfNeeded:]((CGRect *)self, v11, v13, v15, v17);
        }
      }
    }
  }
}

- (void)setScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIHomeAffordanceHostSceneComponent;
  [(FBSSceneComponent *)&v5 setScene:a3];
  int v4 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
  if (v4) {
    LOBYTE(v4) = _UIApplicationSupportsHomeAffordanceObservation();
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | v4;
}

- (void)_evaluateHomeAffordanceIntersectionWithSceneFrameAndSendIfNeeded:(double)a3
{
  if (a1)
  {
    CGRect v31 = CGRectIntersection(*(CGRect *)&a2, a1[1]);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    BOOL IsNull = CGRectIsNull(v31);
    double v11 = IsNull ? *(double *)(MEMORY[0x1E4F1DB28] + 24) : height;
    double v12 = IsNull ? *(double *)(MEMORY[0x1E4F1DB28] + 16) : width;
    double v13 = IsNull ? *(double *)(MEMORY[0x1E4F1DB28] + 8) : y;
    double v14 = IsNull ? *MEMORY[0x1E4F1DB28] : x;
    v32.origin.double x = v14;
    v32.origin.double y = v13;
    v32.size.double width = v12;
    v32.size.double height = v11;
    BOOL v15 = CGRectEqualToRect(v32, *MEMORY[0x1E4F1DB28]);
    if (v15)
    {
      double v16 = v12;
    }
    else
    {
      double v14 = x - a2;
      double v13 = y - a3;
      double v16 = width;
    }
    double v17 = v15 ? v11 : height;
    id v18 = [(CGRect *)a1 hostScene];
    v19 = [v18 settings];
    [v19 homeAffordanceSceneReferenceFrame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v33.origin.double x = v14;
    v33.origin.double y = v13;
    v33.size.double width = v16;
    v33.size.double height = v17;
    v34.origin.double x = v21;
    v34.origin.double y = v23;
    v34.size.double width = v25;
    v34.size.double height = v27;
    if (!CGRectEqualToRect(v33, v34))
    {
      -[_UIHomeAffordanceHostSceneComponent _sendClientHomeAffordanceSceneReferenceFrame:](a1, v14, v13, v16, v17);
    }
  }
}

- (void)_sendClientHomeAffordanceSceneReferenceFrame:(double)a3
{
  if (_UIDeviceSupportsGlobalEdgeSwipeTouches())
  {
    if (_UIApplicationSupportsHomeAffordanceObservation())
    {
      double v10 = [a1 hostScene];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __84___UIHomeAffordanceHostSceneComponent__sendClientHomeAffordanceSceneReferenceFrame___block_invoke;
      v11[3] = &__block_descriptor_64_e69_v16__0__FBSMutableSceneSettings__UIHomeAffordanceHostSceneSettings__8l;
      *(double *)&v11[4] = a2;
      *(double *)&v11[5] = a3;
      *(double *)&v11[6] = a4;
      *(double *)&v11[7] = a5;
      [v10 updateSettingsWithBlock:v11];
    }
  }
}

- (CGRect)homeAffordanceScreenFixedFrame
{
  double x = self->_homeAffordanceScreenFixedFrame.origin.x;
  double y = self->_homeAffordanceScreenFixedFrame.origin.y;
  double width = self->_homeAffordanceScreenFixedFrame.size.width;
  double height = self->_homeAffordanceScreenFixedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHomeAffordanceScreenFixedFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_homeAffordanceScreenFixedFrame = &self->_homeAffordanceScreenFixedFrame;
  if (!CGRectEqualToRect(a3, self->_homeAffordanceScreenFixedFrame))
  {
    p_homeAffordanceScreenFixedFrame->origin.CGFloat x = x;
    p_homeAffordanceScreenFixedFrame->origin.CGFloat y = y;
    p_homeAffordanceScreenFixedFrame->size.CGFloat width = width;
    p_homeAffordanceScreenFixedFrame->size.CGFloat height = height;
    if (!self->_proxyHomeAffordanceObserverInteraction)
    {
      v9 = [(FBSSceneComponent *)self hostScene];
      double v10 = [v9 settings];
      [v10 frame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;

      -[_UIHomeAffordanceHostSceneComponent _evaluateHomeAffordanceIntersectionWithSceneFrameAndSendIfNeeded:]((CGRect *)self, v12, v14, v16, v18);
    }
  }
}

- (void)_sendClientDoubleTapGestureDidSucceedAction:(void *)a1
{
  if (a1
    && _UIDeviceSupportsGlobalEdgeSwipeTouches()
    && _UIApplicationSupportsHomeAffordanceObservation())
  {
    id v6 = +[_UIHomeAffordanceDoubleTapGestureActionToClient actionForDoubleTapGestureDidSucceed:a2];
    int v4 = [a1 scene];
    objc_super v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    [v4 sendPrivateActions:v5];
  }
}

- (void)doubleTapGestureDidSucceed:(BOOL)a3
{
  if (!self->_proxyHomeAffordanceObserverInteraction) {
    -[_UIHomeAffordanceHostSceneComponent _sendClientDoubleTapGestureDidSucceedAction:](self, a3);
  }
}

- (void)sceneWillActivate:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (*(unsigned char *)&self->_flags)
  {
    id v16 = v4;
    int v6 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
    objc_super v5 = v16;
    if (v6)
    {
      int v7 = _UIApplicationSupportsHomeAffordanceObservation();
      objc_super v5 = v16;
      if (v7)
      {
        if (*(unsigned char *)&self->_flags)
        {
          int v8 = _UIDeviceSupportsGlobalEdgeSwipeTouches();
          objc_super v5 = v16;
          if (v8)
          {
            int v9 = _UIApplicationSupportsHomeAffordanceObservation();
            objc_super v5 = v16;
            if (v9)
            {
              double v10 = [(FBSSceneComponent *)self hostScene];
              double v11 = [v10 _uiHostingController];
              double v12 = [v11 sceneView];

              if (v12 && !self->_proxyHomeAffordanceObserverInteraction)
              {
                objc_initWeak(&location, self);
                double v13 = [_UIHomeAffordanceObserverProxyInteraction alloc];
                v19[0] = MEMORY[0x1E4F143A8];
                v19[1] = 3221225472;
                v19[2] = __86___UIHomeAffordanceHostSceneComponent__setUpHomeAffordanceObserverInteractionIfNeeded__block_invoke;
                v19[3] = &unk_1E5306388;
                objc_copyWeak(&v20, &location);
                v17[0] = MEMORY[0x1E4F143A8];
                v17[1] = 3221225472;
                v17[2] = __86___UIHomeAffordanceHostSceneComponent__setUpHomeAffordanceObserverInteractionIfNeeded__block_invoke_2;
                v17[3] = &unk_1E52DC888;
                objc_copyWeak(&v18, &location);
                double v14 = (_UIHomeAffordanceObserverProxyInteraction *)-[_UIHomeAffordanceObserverProxyInteraction initWithIntersectedFrameHandler:doubleTapGestureHandler:](v13, v19, v17);
                proxyHomeAffordanceObserverInteraction = self->_proxyHomeAffordanceObserverInteraction;
                self->_proxyHomeAffordanceObserverInteraction = v14;

                [v12 addInteraction:self->_proxyHomeAffordanceObserverInteraction];
                objc_destroyWeak(&v18);
                objc_destroyWeak(&v20);
                objc_destroyWeak(&location);
              }

              objc_super v5 = v16;
            }
          }
        }
        *(unsigned char *)&self->_flags &= ~1u;
      }
    }
  }
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65___UIHomeAffordanceHostSceneComponent_appendDescriptionToStream___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v5 = v4;
  id v10 = v5;
  double v11 = self;
  [v5 appendProem:self block:v9];
  if ([v5 hasDebugStyle])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65___UIHomeAffordanceHostSceneComponent_appendDescriptionToStream___block_invoke_2;
    v6[3] = &unk_1E52D9F98;
    id v7 = v5;
    int v8 = self;
    [v7 appendBodySectionWithName:0 block:v6];
  }
}

- (NSString)debugDescription
{
  v3 = (void *)MEMORY[0x1E4F4F720];
  id v4 = [MEMORY[0x1E4F4F728] debugStyle];
  id v5 = [v3 descriptionForRootObject:self withStyle:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void).cxx_destruct
{
}

@end
@interface UIScreenEdgePanGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (BOOL)_supportsStylusTouches;
+ (BOOL)supportsSecureCoding;
- (BOOL)_recognizesWithoutEdge;
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (UIRectEdge)edges;
- (UIScreenEdgePanGestureRecognizer)initWithCoder:(id)a3;
- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6;
- (double)_bottomEdgeAngleWindow;
- (double)_bottomEdgeRegionSize;
- (double)_edgeRegionSize;
- (id)_beginRequiringIgnoresHIDEdgeFlagsForReason:(id)a3;
- (id)debugDictionary;
- (int64_t)_touchInterfaceOrientation;
- (unint64_t)_rootFeatureState;
- (unint64_t)touchedEdges;
- (void)_resetHystersis;
- (void)_setBottomEdgeAngleWindow:(double)a3;
- (void)_setBottomEdgeRegionSize:(double)a3;
- (void)_setEdgeRegionSize:(double)a3;
- (void)_setHysteresis:(double)a3;
- (void)_setRecognizesWithoutEdge:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)featureDidChangeState:(id)a3;
- (void)reset;
- (void)setEdges:(UIRectEdge)edges;
- (void)setMinimumNumberOfTouches:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIScreenEdgePanGestureRecognizer

+ (BOOL)_supportsStylusTouches
{
  return 0;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  -[_UISEGestureFeatureSettings setMinimumNumberOfSubfeatures:](self->_settings, "setMinimumNumberOfSubfeatures:");
  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v5 setMinimumNumberOfTouches:a3];
}

- (void)dealloc
{
  [(_UIAssertion *)self->_mustIgnoreHIDEdgeFlagsAssertion _invalidate];
  mustIgnoreHIDEdgeFlagsAssertion = self->_mustIgnoreHIDEdgeFlagsAssertion;
  self->_mustIgnoreHIDEdgeFlagsAssertion = 0;

  ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  self->_ignoreHIDEdgeFlagsAssertionController = 0;

  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIGestureRecognizer *)&v5 dealloc];
}

- (UIRectEdge)edges
{
  return self->_edges;
}

- (void)setEdges:(UIRectEdge)edges
{
  self->_edges = edges;
}

- (void)reset
{
  -[_UISEGestureFeatureSettings setBounds:](self->_settings, "setBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [(_UISEGestureFeatureSettings *)self->_settings setTargetEdges:0];
  [(_UISEGestureFeatureSettings *)self->_settings setIgnoreHIDEdgeFlags:[(_UIAssertionController *)self->_ignoreHIDEdgeFlagsAssertionController hasAssertionsOfType:1]];
  [(_UISEGestureFeature *)self->_rootFeature setDelegate:0];
  rootFeature = self->_rootFeature;
  self->_rootFeature = 0;

  self->_touchedEdges = 0;
  v4.receiver = self;
  v4.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIGestureRecognizer *)&v4 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_rootFeature)
  {
    v7 = [(UIGestureRecognizer *)self view];
    v8 = [v7 _window];
    [v8 _sceneReferenceBounds];
    -[_UISEGestureFeatureSettings setBounds:](self->_settings, "setBounds:");

    int64_t v9 = [(UIScreenEdgePanGestureRecognizer *)self _touchInterfaceOrientation];
    unint64_t edges = self->_edges;
    if (v9 == 4)
    {
      [(_UISEGestureFeatureSettings *)self->_settings setTargetEdges:_rotatedEdgesGivenOrientationInDegrees(edges, 90)];
      uint64_t v11 = 8;
    }
    else if (v9 == 3)
    {
      [(_UISEGestureFeatureSettings *)self->_settings setTargetEdges:_rotatedEdgesGivenOrientationInDegrees(edges, -90)];
      uint64_t v11 = 2;
    }
    else
    {
      if (v9 == 1)
      {
        [(_UISEGestureFeatureSettings *)self->_settings setTargetEdges:_rotatedEdgesGivenOrientationInDegrees(edges, 0)];
LABEL_13:
        uint64_t v11 = 4;
        goto LABEL_14;
      }
      if (v9 == 2) {
        uint64_t v12 = -180;
      }
      else {
        uint64_t v12 = 0;
      }
      [(_UISEGestureFeatureSettings *)self->_settings setTargetEdges:_rotatedEdgesGivenOrientationInDegrees(edges, v12)];
      if (v9 != 2) {
        goto LABEL_13;
      }
      uint64_t v11 = 1;
    }
LABEL_14:
    [(_UISEGestureFeatureSettings *)self->_settings setInterfaceBottomEdge:v11];
    v13 = [[_UISEMuxGestureFeature alloc] initWithSettings:self->_settings createFeatureBlock:self->_createFeatureBlock];
    rootFeature = self->_rootFeature;
    self->_rootFeature = v13;

    [(_UISEGestureFeature *)self->_rootFeature setDelegate:self];
    self->_touchedEdges = 0;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = a3;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v31 + 1) + 8 * v19);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v21 = v20;
        uint64_t v22 = [v21 phase];
        if (v22)
        {
          if (v22 == 3)
          {
            uint64_t v22 = 2;
          }
          else if (v22 != 1)
          {
            abort();
          }
        }
        *(void *)&long long v28 = 0;
        *(void *)&long long v27 = v22;
        *((void *)&v27 + 1) = [v21 _edgeAim];
        LOBYTE(v28) = [v21 _edgeForceActive];
        *((void *)&v28 + 1) = [v21 _edgeType];
        *(void *)&long long v29 = [v21 _touchIdentifier];
        [v21 _locationInSceneReferenceSpace];
        *((void *)&v29 + 1) = v23;
        *(void *)&long long v30 = v24;
        [v21 timestamp];
        *((void *)&v30 + 1) = v25;

        [(_UISEGestureFeature *)self->_rootFeature incorporateSample:&v27];
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v17);
  }

  v26.receiver = self;
  v26.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v26 touchesBegan:v15 withEvent:a4];
}

- (void)featureDidChangeState:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(_UISEGestureFeature *)self->_rootFeature state];
  if (v4 == 2)
  {
    self->_touchedEdges = 0;
    if (![(UIScreenEdgePanGestureRecognizer *)self _recognizesWithoutEdge])
    {
      [(UIGestureRecognizer *)self setState:5];
    }
  }
  else if (v4 == 1)
  {
    [(UIPanGestureRecognizer *)self _removeHysteresisFromTranslation];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v5 = [(_UISEMuxGestureFeature *)self->_rootFeature subfeatures];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      unint64_t v9 = 15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = [(_UISEMuxGestureFeature *)self->_rootFeature subfeatures];
          v13 = [v12 objectForKeyedSubscript:v11];

          if ([v13 state] == 1)
          {
            v14 = objc_getAssociatedObject(v13, &__lastTouchedEdgesProviderKey);
            v9 &= [v14 touchedEdges];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v9 = 15;
    }

    int64_t v15 = [(UIScreenEdgePanGestureRecognizer *)self _touchInterfaceOrientation];
    uint64_t v16 = 90;
    uint64_t v17 = -90;
    uint64_t v18 = 180;
    if (v15 != 2) {
      uint64_t v18 = 0;
    }
    if (v15 != 4) {
      uint64_t v17 = v18;
    }
    if (v15 != 3) {
      uint64_t v16 = v17;
    }
    if (v15 == 1) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v16;
    }
    self->_touchedEdges = _rotatedEdgesGivenOrientationInDegrees(v9, v19);
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (BOOL)_recognizesWithoutEdge
{
  return self->_recognizesWithoutEdge;
}

- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  unint64_t v4 = [(UIPanGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  objc_super v5 = v4;
  if (v4)
  {
    _commonInit(v4, 1, 0);
    [(UIPanGestureRecognizer *)v5 setMaximumNumberOfTouches:1];
    [(UIGestureRecognizer *)v5 setDelaysTouchesBegan:1];
    uint64_t v6 = v5;
  }

  return v5;
}

- (void)_setHysteresis:(double)a3
{
  -[_UISEGestureFeatureSettings setHysteresis:](self->_settings, "setHysteresis:");
  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v5 _setHysteresis:a3];
}

- (void)_setRecognizesWithoutEdge:(BOOL)a3
{
  self->_recognizesWithoutEdge = a3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 phase];
        if (v13)
        {
          if (v13 == 3)
          {
            uint64_t v13 = 2;
          }
          else if (v13 != 1)
          {
            abort();
          }
        }
        *(void *)&long long v19 = 0;
        *(void *)&long long v18 = v13;
        *((void *)&v18 + 1) = [v12 _edgeAim];
        LOBYTE(v19) = [v12 _edgeForceActive];
        *((void *)&v19 + 1) = [v12 _edgeType];
        *(void *)&long long v20 = [v12 _touchIdentifier];
        [v12 _locationInSceneReferenceSpace];
        *((void *)&v20 + 1) = v14;
        *(void *)&long long v21 = v15;
        [v12 timestamp];
        *((void *)&v21 + 1) = v16;

        [(_UISEGestureFeature *)self->_rootFeature incorporateSample:&v18];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v17 touchesEnded:v6 withEvent:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreHIDEdgeFlagsAssertionController, 0);
  objc_storeStrong((id *)&self->_mustIgnoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->_rootFeature, 0);
  objc_storeStrong(&self->_createFeatureBlock, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (UIScreenEdgePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6
{
  char v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  uint64_t v8 = [(UIPanGestureRecognizer *)&v12 initWithTarget:a3 action:a4];
  uint64_t v9 = v8;
  if (v8)
  {
    _commonInit(v8, a5, v6);
    [(UIPanGestureRecognizer *)v9 setMaximumNumberOfTouches:1];
    [(UIGestureRecognizer *)v9 setDelaysTouchesBegan:1];
    uint64_t v10 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIScreenEdgePanGestureRecognizer)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  unint64_t v4 = -[UIPanGestureRecognizer initWithCoder:](&v8, sel_initWithCoder_);
  objc_super v5 = v4;
  if (v4)
  {
    _commonInit(v4, 1, 0);
    if ([a3 containsValueForKey:@"UIScreenEdgePanGestureRecognizer.edges"]) {
      -[UIScreenEdgePanGestureRecognizer setEdges:](v5, "setEdges:", [a3 decodeIntegerForKey:@"UIScreenEdgePanGestureRecognizer.edges"]);
    }
    char v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  -[UIPanGestureRecognizer encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", -[UIScreenEdgePanGestureRecognizer edges](self, "edges"), @"UIScreenEdgePanGestureRecognizer.edges");
}

- (int64_t)_touchInterfaceOrientation
{
  v2 = [(UIGestureRecognizer *)self view];
  v3 = [v2 window];
  int64_t v4 = [v3 interfaceOrientation];

  return v4;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  return [(_UISEGestureFeature *)self->_rootFeature state] == 1;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 phase];
        if (v13)
        {
          if (v13 == 3)
          {
            uint64_t v13 = 2;
          }
          else if (v13 != 1)
          {
            abort();
          }
        }
        *(void *)&long long v19 = 0;
        *(void *)&long long v18 = v13;
        *((void *)&v18 + 1) = [v12 _edgeAim];
        LOBYTE(v19) = [v12 _edgeForceActive];
        *((void *)&v19 + 1) = [v12 _edgeType];
        *(void *)&long long v20 = [v12 _touchIdentifier];
        [v12 _locationInSceneReferenceSpace];
        *((void *)&v20 + 1) = v14;
        *(void *)&long long v21 = v15;
        [v12 timestamp];
        *((void *)&v21 + 1) = v16;

        [(_UISEGestureFeature *)self->_rootFeature incorporateSample:&v18];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  v17.receiver = self;
  v17.super_class = (Class)UIScreenEdgePanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v17 touchesMoved:v6 withEvent:a4];
}

- (double)_bottomEdgeAngleWindow
{
  [(_UISEGestureFeatureSettings *)self->_settings bottomEdgeAngleWindow];
  return result;
}

- (void)_setBottomEdgeAngleWindow:(double)a3
{
}

- (double)_bottomEdgeRegionSize
{
  [(_UISEGestureFeatureSettings *)self->_settings bottomEdgeRegionSize];
  return result;
}

- (void)_setBottomEdgeRegionSize:(double)a3
{
}

- (double)_edgeRegionSize
{
  [(_UISEGestureFeatureSettings *)self->_settings edgeRegionSize];
  return result;
}

- (void)_setEdgeRegionSize:(double)a3
{
}

- (void)_resetHystersis
{
}

- (unint64_t)touchedEdges
{
  return self->_touchedEdges;
}

- (id)_beginRequiringIgnoresHIDEdgeFlagsForReason:(id)a3
{
  ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  if (!ignoreHIDEdgeFlagsAssertionController)
  {
    id v6 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
    uint64_t v7 = self->_ignoreHIDEdgeFlagsAssertionController;
    self->_ignoreHIDEdgeFlagsAssertionController = v6;

    ignoreHIDEdgeFlagsAssertionController = self->_ignoreHIDEdgeFlagsAssertionController;
  }
  return [(_UIAssertionController *)ignoreHIDEdgeFlagsAssertionController vendAssertionOfType:1 initialState:1 reason:a3 requiresExplicitInvalidation:0];
}

- (id)debugDictionary
{
  return [(_UISEMuxGestureFeature *)self->_rootFeature debugDictionary];
}

- (unint64_t)_rootFeatureState
{
  return [(_UISEGestureFeature *)self->_rootFeature state];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return [(_UISEGestureFeatureSettings *)self->_settings ignoreHIDEdgeFlags];
}

@end
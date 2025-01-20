@interface _UIFluidSliderInteraction
- ($0E0C902F25D72445DD01CB63E261F0E2)_lastDriverUpdate;
- (BOOL)_feedbackEnabled;
- (BOOL)_shouldScaleOnIndirectInput;
- (BOOL)isLocked;
- (BOOL)isUserInteractionEnabled;
- (CGSize)_normalizedTrackSize;
- (NSArray)_drivers;
- (NSString)description;
- (UIPanGestureRecognizer)_panGestureRecognizer;
- (UIView)view;
- (UIViewFloatAnimatableProperty)_animatedValue;
- (UIViewFloatAnimatableProperty)_trackLength;
- (UIViewFloatAnimatableProperty)_trackScale;
- (UIViewFloatAnimatableProperty)_trackWidth;
- (_UIFluidSliderDirectDriving)_panDriver;
- (_UIFluidSliderDirectDrivingDelegate)_directDrivingDelegate;
- (_UIFluidSliderDriving)_activeDriver;
- (_UIFluidSliderFeedbackConductor)_feedbackConductor;
- (_UIFluidSliderInteraction)initWithConfiguration:(id)a3 handler:(id)a4;
- (_UIFluidSliderInteractionConfiguration)configuration;
- (_UIFluidSliderVolumeButtonDriving)_volumeButtonDriver;
- (_UIPhysicalButtonInteraction)_volumeButtonInteraction;
- (double)_driftFactor;
- (double)_feedbackEpsilon;
- (double)_lockedValue;
- (double)_minSquishedWidthForWidth:(double)a3;
- (double)currentTrackLength;
- (double)presentationValue;
- (double)value;
- (id)_handler;
- (int64_t)_elasticity;
- (int64_t)_state;
- (unint64_t)_axis;
- (unint64_t)stepCount;
- (void)_animate:(id)a3 withSpring:(id)a4;
- (void)_cancelDriversExcludingDriver:(id)a3;
- (void)_issueUpdate;
- (void)_rebuildDrivers;
- (void)_removeAllDrivers;
- (void)_setDirectDrivingDelegate:(id)a3;
- (void)_setElasticity:(int64_t)a3;
- (void)_setFeedbackEnabled:(BOOL)a3;
- (void)_setShouldScaleOnIndirectInput:(BOOL)a3;
- (void)_targetNewScale:(double)a3;
- (void)_targetNewValue:(double)a3;
- (void)didMoveToView:(id)a3;
- (void)fluidSliderDriver:(id)a3 didGenerateUpdate:(id *)a4;
- (void)setConfiguration:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)set_activeDriver:(id)a3;
- (void)set_animatedValue:(id)a3;
- (void)set_axis:(unint64_t)a3;
- (void)set_drivers:(id)a3;
- (void)set_feedbackConductor:(id)a3;
- (void)set_handler:(id)a3;
- (void)set_lastDriverUpdate:(id *)a3;
- (void)set_lockedValue:(double)a3;
- (void)set_normalizedTrackSize:(CGSize)a3;
- (void)set_panDriver:(id)a3;
- (void)set_state:(int64_t)a3;
- (void)set_trackLength:(id)a3;
- (void)set_trackScale:(id)a3;
- (void)set_trackWidth:(id)a3;
- (void)set_volumeButtonDriver:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIFluidSliderInteraction

- (void)setUserInteractionEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_userInteractionEnabled != a3)
  {
    self->_userInteractionEnabled = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(_UIFluidSliderInteraction *)self _drivers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:self->_userInteractionEnabled];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (_UIFluidSliderInteraction)initWithConfiguration:(id)a3 handler:(id)a4
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIFluidSliderInteraction;
  uint64_t v8 = [(_UIFluidSliderInteraction *)&v24 init];
  long long v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->_feedbackEnabled = 257;
    v8->_elasticity = 2;
    long long v10 = objc_opt_new();
    [(_UIFluidSliderInteraction *)v9 set_animatedValue:v10];

    long long v11 = objc_opt_new();
    [(_UIFluidSliderInteraction *)v9 set_trackWidth:v11];

    long long v12 = objc_opt_new();
    [(_UIFluidSliderInteraction *)v9 set_trackLength:v12];

    v13 = objc_opt_new();
    [(_UIFluidSliderInteraction *)v9 set_trackScale:v13];

    uint64_t v14 = [(_UIFluidSliderInteraction *)v9 _trackScale];
    [v14 setValue:1.0];

    v15 = [(_UIFluidSliderInteraction *)v9 _animatedValue];
    v25[0] = v15;
    v16 = [(_UIFluidSliderInteraction *)v9 _trackWidth];
    v25[1] = v16;
    v17 = [(_UIFluidSliderInteraction *)v9 _trackLength];
    v25[2] = v17;
    v18 = [(_UIFluidSliderInteraction *)v9 _trackScale];
    v25[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];

    objc_initWeak(&location, v9);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59___UIFluidSliderInteraction_initWithConfiguration_handler___block_invoke;
    v21[3] = &unk_1E52DC308;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:v19 presentationValueChangedCallback:v21];
    [(_UIFluidSliderInteraction *)v9 set_handler:v7];
    [(_UIFluidSliderInteraction *)v9 setConfiguration:v6];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)setConfiguration:(id)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  configuration = self->_configuration;
  id v7 = (_UIFluidSliderInteractionConfiguration *)v5;
  uint64_t v8 = configuration;
  if (v8 != v7)
  {
    long long v9 = v8;
    if (v7 && v8)
    {
      char v10 = [(_UIFluidSliderInteractionConfiguration *)v7 isEqual:v8];

      if (v10) {
        goto LABEL_68;
      }
    }
    else
    {
    }
    long long v11 = self->_configuration;
    long long v12 = (_UIFluidSliderInteractionConfiguration *)[(_UIFluidSliderInteractionConfiguration *)v7 copy];
    v13 = self->_configuration;
    self->_configuration = v12;

    if (!v11)
    {
      [(_UIFluidSliderInteraction *)self _rebuildDrivers];
      goto LABEL_22;
    }
    unint64_t v14 = [(_UIFluidSliderInteractionConfiguration *)self->_configuration preferredInputMethods];
    if (v14 == [(_UIFluidSliderInteractionConfiguration *)v11 preferredInputMethods])
    {
      v15 = [(_UIFluidSliderInteractionConfiguration *)self->_configuration _customDrivers];
      v16 = [(_UIFluidSliderInteractionConfiguration *)v11 _customDrivers];
      id v17 = v15;
      id v18 = v16;
      if (v17 == v18)
      {

LABEL_19:
        [(_UIFluidSliderInteractionConfiguration *)self->_configuration trackSize];
        double v22 = v21;
        double v24 = v23;
        [(_UIFluidSliderInteractionConfiguration *)v11 trackSize];
        if (v22 == v26 && v24 == v25)
        {
          int v27 = 0;
          goto LABEL_39;
        }
LABEL_22:
        [(_UIFluidSliderInteractionConfiguration *)self->_configuration trackSize];
        BOOL v30 = v28 <= v29;
        if (v28 <= v29) {
          double v31 = v28;
        }
        else {
          double v31 = v29;
        }
        if (v28 > v29) {
          double v29 = v28;
        }
        if (v30) {
          uint64_t v32 = 2;
        }
        else {
          uint64_t v32 = 1;
        }
        -[_UIFluidSliderInteraction set_normalizedTrackSize:](self, "set_normalizedTrackSize:", v31, v29);
        [(_UIFluidSliderInteraction *)self set_axis:v32];
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v33 = [(_UIFluidSliderInteraction *)self _drivers];
        uint64_t v34 = [v33 countByEnumeratingWithState:&v76 objects:v82 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v35; ++i)
            {
              if (*(void *)v77 != v36) {
                objc_enumerationMutation(v33);
              }
              objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * i), "setTrackAxis:", -[_UIFluidSliderInteraction _axis](self, "_axis"));
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v76 objects:v82 count:16];
          }
          while (v35);
        }

        [(_UIFluidSliderInteraction *)self _feedbackEpsilon];
        double v39 = v38;
        v40 = [(_UIFluidSliderInteraction *)self _feedbackConductor];
        [v40 setEpsilon:v39];

        if (!v11)
        {
LABEL_40:
          [(_UIFluidSliderInteractionConfiguration *)self->_configuration stretchAmount];
          if (v44 < 0.0)
          {
            v65 = [MEMORY[0x1E4F28B00] currentHandler];
            [v65 handleFailureInMethod:a2 object:self file:@"_UIFluidSliderInteraction.m" lineNumber:267 description:@"_UIFluidSliderInteractionConfiguration.stretchAmount must be a non-negative value!"];
          }
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          v45 = [(_UIFluidSliderInteraction *)self _drivers];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v72 objects:v81 count:16];
          if (v46)
          {
            uint64_t v47 = v46;
            uint64_t v48 = *(void *)v73;
            do
            {
              for (uint64_t j = 0; j != v47; ++j)
              {
                if (*(void *)v73 != v48) {
                  objc_enumerationMutation(v45);
                }
                v50 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                [(_UIFluidSliderInteractionConfiguration *)self->_configuration stretchAmount];
                objc_msgSend(v50, "setStretchAmount:");
              }
              uint64_t v47 = [v45 countByEnumeratingWithState:&v72 objects:v81 count:16];
            }
            while (v47);
          }

          if (!v11)
          {
LABEL_52:
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            v54 = [(_UIFluidSliderInteraction *)self _drivers];
            uint64_t v55 = [v54 countByEnumeratingWithState:&v68 objects:v80 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              uint64_t v57 = *(void *)v69;
              do
              {
                for (uint64_t k = 0; k != v56; ++k)
                {
                  if (*(void *)v69 != v57) {
                    objc_enumerationMutation(v54);
                  }
                  v59 = *(void **)(*((void *)&v68 + 1) + 8 * k);
                  [(_UIFluidSliderInteractionConfiguration *)self->_configuration velocityMultiplier];
                  objc_msgSend(v59, "setVelocityMultiplier:");
                }
                uint64_t v56 = [v54 countByEnumeratingWithState:&v68 objects:v80 count:16];
              }
              while (v56);
            }

            int v27 = 1;
            if (!v11)
            {
LABEL_61:
              if (![(_UIFluidSliderInteractionConfiguration *)self->_configuration stepCount])
              {
                v66 = [MEMORY[0x1E4F28B00] currentHandler];
                [v66 handleFailureInMethod:a2 object:self file:@"_UIFluidSliderInteraction.m" lineNumber:285 description:@"_UIFluidSliderInteractionConfiguration.stepCount must be non-zero!"];

                if (v27) {
                  goto LABEL_63;
                }
                goto LABEL_67;
              }
LABEL_62:
              if (v27)
              {
LABEL_63:
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __46___UIFluidSliderInteraction_setConfiguration___block_invoke;
                aBlock[3] = &unk_1E52D9F70;
                aBlock[4] = self;
                v61 = _Block_copy(aBlock);
                if (v11)
                {
                  v62 = +[_UIFluidSliderSettingsDomain rootSettings];
                  v63 = [v62 programmaticUpdate];
                  v64 = [v63 springAnimationBehavior];
                  [(_UIFluidSliderInteraction *)self _animate:v61 withSpring:v64];
                }
                else
                {
                  +[UIView _performWithoutRetargetingAnimations:v61];
                }
              }
LABEL_67:

              goto LABEL_68;
            }
LABEL_60:
            unint64_t v60 = [(_UIFluidSliderInteractionConfiguration *)self->_configuration stepCount];
            if (v60 == [(_UIFluidSliderInteractionConfiguration *)v11 stepCount]) {
              goto LABEL_62;
            }
            goto LABEL_61;
          }
          int v27 = 1;
LABEL_51:
          [(_UIFluidSliderInteractionConfiguration *)self->_configuration velocityMultiplier];
          double v52 = v51;
          [(_UIFluidSliderInteractionConfiguration *)v11 velocityMultiplier];
          if (vabdd_f64(v52, v53) <= 2.22044605e-16) {
            goto LABEL_60;
          }
          goto LABEL_52;
        }
        int v27 = 1;
LABEL_39:
        [(_UIFluidSliderInteractionConfiguration *)self->_configuration stretchAmount];
        double v42 = v41;
        [(_UIFluidSliderInteractionConfiguration *)v11 stretchAmount];
        if (vabdd_f64(v42, v43) <= 2.22044605e-16) {
          goto LABEL_51;
        }
        goto LABEL_40;
      }
      v19 = v18;
      if (v17 && v18)
      {
        char v20 = [v17 isEqual:v18];

        if (v20) {
          goto LABEL_19;
        }
      }
      else
      {
      }
    }
    [(_UIFluidSliderInteraction *)self _rebuildDrivers];
    goto LABEL_19;
  }

LABEL_68:
}

- (void)setLocked:(BOOL)a3
{
  if (self->_locked != a3)
  {
    if (a3)
    {
      [(_UIFluidSliderInteraction *)self value];
      -[_UIFluidSliderInteraction set_lockedValue:](self, "set_lockedValue:");
    }
    self->_locked = a3;
  }
}

- (void)willMoveToView:(id)a3
{
  [(_UIFluidSliderInteraction *)self _removeAllDrivers];
  [(_UIFluidSliderInteraction *)self set_feedbackConductor:0];
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3) {
    [(_UIFluidSliderInteraction *)self _rebuildDrivers];
  }
}

- (void)_rebuildDrivers
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIFluidSliderInteraction *)self view];
  if (!v3) {
    return;
  }
  id v4 = (void *)v3;
  id v5 = [(_UIFluidSliderInteraction *)self configuration];

  if (!v5) {
    return;
  }
  [(_UIFluidSliderInteraction *)self _removeAllDrivers];
  id v6 = [(_UIFluidSliderInteraction *)self configuration];
  char v7 = [v6 preferredInputMethods];

  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    [(_UIFluidSliderInteraction *)self _elasticity];
    char v10 = objc_opt_new();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_directDrivingDelegate);
    [v10 setDelegate:WeakRetained];

    [(_UIFluidSliderInteraction *)self set_panDriver:v10];
    [v8 addObject:v10];

    if ((v7 & 2) != 0) {
      goto LABEL_5;
    }
LABEL_7:
    [(_UIFluidSliderInteraction *)self set_volumeButtonDriver:0];
    goto LABEL_8;
  }
  [(_UIFluidSliderInteraction *)self set_panDriver:0];
  if ((v7 & 2) == 0) {
    goto LABEL_7;
  }
LABEL_5:
  long long v9 = objc_opt_new();
  [(_UIFluidSliderInteraction *)self set_volumeButtonDriver:v9];
  [v8 addObject:v9];

LABEL_8:
  long long v12 = [(_UIFluidSliderInteraction *)self configuration];
  v13 = [v12 _customDrivers];
  [v8 addObjectsFromArray:v13];

  [(_UIFluidSliderInteraction *)self set_drivers:v8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v14 = [(_UIFluidSliderInteraction *)self _drivers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        char v20 = [(_UIFluidSliderInteraction *)self view];

        if (v20)
        {
          double v21 = [(_UIFluidSliderInteraction *)self view];
          [v19 setView:v21];

          [v19 setDrivable:self];
        }
        double v22 = [(_UIFluidSliderInteraction *)self configuration];

        if (v22)
        {
          objc_msgSend(v19, "setTrackAxis:", -[_UIFluidSliderInteraction _axis](self, "_axis"));
          double v23 = [(_UIFluidSliderInteraction *)self configuration];
          [v23 stretchAmount];
          objc_msgSend(v19, "setStretchAmount:");

          double v24 = [(_UIFluidSliderInteraction *)self configuration];
          [v24 velocityMultiplier];
          objc_msgSend(v19, "setVelocityMultiplier:");
        }
        objc_msgSend(v19, "setEnabled:", -[_UIFluidSliderInteraction isUserInteractionEnabled](self, "isUserInteractionEnabled"));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v16);
  }

  unint64_t v25 = [(_UIFluidSliderInteraction *)self stepCount] >> 1;
  double v26 = [_UIFluidSliderFeedbackConductor alloc];
  int v27 = [(_UIFluidSliderInteraction *)self view];
  double v28 = [(_UIFluidSliderFeedbackConductor *)v26 initWithDetentCount:v25 view:v27 indirectFeedbackPlayer:0];
  [(_UIFluidSliderInteraction *)self set_feedbackConductor:v28];

  [(_UIFluidSliderInteraction *)self _feedbackEpsilon];
  double v30 = v29;
  double v31 = [(_UIFluidSliderInteraction *)self _feedbackConductor];
  [v31 setEpsilon:v30];
}

- (void)_removeAllDrivers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_UIFluidSliderInteraction *)self _drivers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setView:0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_setDirectDrivingDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directDrivingDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_directDrivingDelegate, obj);
    uint64_t v5 = [(_UIFluidSliderInteraction *)self _panDriver];
    [v5 setDelegate:obj];
  }
}

- (void)setValue:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(_UIFluidSliderInteraction *)self _activeDriver];

  if (!v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(_UIFluidSliderInteraction *)self _drivers];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v10++) stop];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
  }
  double v11 = fmax(fmin(a3, 1.0), 0.0);
  [(_UIFluidSliderInteraction *)self set_lockedValue:v11];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38___UIFluidSliderInteraction_setValue___block_invoke;
  aBlock[3] = &unk_1E52D9CD0;
  aBlock[4] = self;
  *(double *)&void aBlock[5] = v11;
  uint64_t v12 = _Block_copy(aBlock);
  memset(v16, 0, sizeof(v16));
  uint64_t v17 = 0;
  [(_UIFluidSliderInteraction *)self set_lastDriverUpdate:v16];
  v13 = +[_UIFluidSliderSettingsDomain rootSettings];
  unint64_t v14 = [v13 programmaticUpdate];
  uint64_t v15 = [v14 springAnimationBehavior];
  [(_UIFluidSliderInteraction *)self _animate:v12 withSpring:v15];
}

- (double)value
{
  if ([(_UIFluidSliderInteraction *)self isLocked])
  {
    [(_UIFluidSliderInteraction *)self _lockedValue];
  }
  else
  {
    uint64_t v4 = [(_UIFluidSliderInteraction *)self _animatedValue];
    [v4 value];
    double v6 = fmax(fmin(v5, 1.0), 0.0);

    return v6;
  }
  return result;
}

- (double)presentationValue
{
  v2 = [(_UIFluidSliderInteraction *)self _animatedValue];
  [v2 presentationValue];
  double v4 = v3;

  return v4;
}

- (double)currentTrackLength
{
  v2 = [(_UIFluidSliderInteraction *)self _trackLength];
  [v2 presentationValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)stepCount
{
  v2 = [(_UIFluidSliderInteraction *)self configuration];
  unint64_t v3 = [v2 stepCount];

  return v3;
}

- (void)fluidSliderDriver:(id)a3 didGenerateUpdate:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v7 = *(_OWORD *)&a4->var2;
  v26[0] = *(_OWORD *)&a4->var0;
  v26[1] = v7;
  double var4 = a4->var4;
  [(_UIFluidSliderInteraction *)self set_lastDriverUpdate:v26];
  int64_t var2 = a4->var2;
  if (var2 == 1)
  {
    id v9 = [(_UIFluidSliderInteraction *)self _activeDriver];

    if (v9 == v6) {
      goto LABEL_7;
    }
    [(_UIFluidSliderInteraction *)self _cancelDriversExcludingDriver:v6];
    id v10 = v6;
    goto LABEL_4;
  }
  if (!var2)
  {
    id v11 = [(_UIFluidSliderInteraction *)self _activeDriver];

    if (v11 == v6)
    {
      id v10 = 0;
LABEL_4:
      [(_UIFluidSliderInteraction *)self set_activeDriver:v10];
    }
  }
LABEL_7:
  uint64_t v12 = [(_UIFluidSliderInteraction *)self _activeDriver];
  if ((id)v12 == v6)
  {
  }
  else
  {
    v13 = (void *)v12;
    unint64_t v14 = [(_UIFluidSliderInteraction *)self _activeDriver];

    if (v14)
    {
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &qword_1EB260BB0) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v15;
        uint64_t v17 = [v6 name];
        double var0 = a4->var0;
        long long v19 = @"NO";
        *(_DWORD *)buf = 138412802;
        double v29 = v17;
        if (var2 == 1) {
          long long v19 = @"YES";
        }
        __int16 v30 = 2048;
        double v31 = var0;
        __int16 v32 = 2112;
        long long v33 = v19;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "[FluidSlider Update] Rejected: %@ | value: %.4f | isActive: %@", buf, 0x20u);
      }
      goto LABEL_19;
    }
  }
  long long v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &_MergedGlobals_1072) + 8);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    long long v21 = v20;
    long long v22 = [v6 name];
    double v23 = a4->var0;
    uint64_t v24 = @"NO";
    *(_DWORD *)buf = 138412802;
    double v29 = v22;
    if (var2 == 1) {
      uint64_t v24 = @"YES";
    }
    __int16 v30 = 2048;
    double v31 = v23;
    __int16 v32 = 2112;
    long long v33 = v24;
    _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "[FluidSlider Update] Accepted: %@ | value: %.4f | isActive: %@", buf, 0x20u);
  }
  [(_UIFluidSliderInteraction *)self _targetNewValue:a4->var0];
LABEL_19:
  if ([(_UIFluidSliderInteraction *)self _shouldScaleOnIndirectInput])
  {
    double var1 = 1.0;
    if ((unint64_t)(a4->var2 - 1) <= 1) {
      double var1 = a4->var1;
    }
    [(_UIFluidSliderInteraction *)self _targetNewScale:var1];
  }
}

- (void)_targetNewValue:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___UIFluidSliderInteraction__targetNewValue___block_invoke;
  v4[3] = &unk_1E52D9CD0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  unint64_t v3 = (void (**)(void))_Block_copy(v4);
  if (+[UIView _isInAnimationBlock]
    || !+[UIView areAnimationsEnabled])
  {
    v3[2](v3);
  }
  else
  {
    +[UIView _performWithoutRetargetingAnimations:v3];
  }
}

- (void)_targetNewScale:(double)a3
{
  double v5 = [(_UIFluidSliderInteraction *)self _trackScale];
  [v5 value];
  double v7 = vabdd_f64(v6, a3);

  if (v7 > 2.22044605e-16)
  {
    uint64_t v8 = +[_UIFluidSliderSettingsDomain rootSettings];
    id v9 = [v8 pressScale];
    id v10 = [v9 springAnimationBehavior];
    [(_UIFluidSliderInteraction *)self _animate:&v11 withSpring:v10];
  }
}

- (void)_issueUpdate
{
  unint64_t v3 = [(_UIFluidSliderInteraction *)self _animatedValue];
  [v3 presentationValue];
  double v5 = v4;

  double v6 = [(_UIFluidSliderInteraction *)self _trackWidth];
  [v6 presentationValue];
  double v8 = v7;

  id v9 = [(_UIFluidSliderInteraction *)self _trackLength];
  [v9 presentationValue];
  double v11 = v10;

  int64_t v12 = [(_UIFluidSliderInteraction *)self _elasticity];
  if (v12 != 2)
  {
    if (v12 != 1 || ([(_UIFluidSliderInteraction *)self _lastDriverUpdate], v88 == 1)) {
      double v5 = fmax(fmin(v5, 1.0), 0.0);
    }
  }
  double v13 = fmax(v5 + -1.0, 0.0);
  if (v5 <= 0.0) {
    double v13 = v5;
  }
  double v14 = v11 * v13;
  double v15 = -(v11 * v13);
  if (v11 * v13 >= 0.0) {
    double v16 = v11 * v13;
  }
  else {
    double v16 = -(v11 * v13);
  }
  [(_UIFluidSliderInteraction *)self _driftFactor];
  double v18 = v11 + (1.0 - v17) * v16;
  if (v18 <= 0.0)
  {
    double v27 = *MEMORY[0x1E4F1DB30];
    double v18 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    long long v19 = [(_UIFluidSliderInteraction *)self configuration];
    [v19 stretchAmount];
    double v21 = v20;

    BOOL v22 = v21 <= 0.0;
    double v23 = 0.0;
    if (!v22)
    {
      uint64_t v24 = [(_UIFluidSliderInteraction *)self configuration];
      [v24 stretchAmount];
      double v23 = v14 / v25;

      if (v23 < 0.0) {
        double v23 = -v23;
      }
    }
    [(_UIFluidSliderInteraction *)self _minSquishedWidthForWidth:v8];
    double v27 = v8 * (1.0 - v23) + v23 * v26;
  }
  [(_UIFluidSliderInteraction *)self _driftFactor];
  double v29 = (v28 + 0.5) * v15;
  __int16 v30 = [(_UIFluidSliderInteraction *)self view];
  uint64_t v31 = [v30 effectiveUserInterfaceLayoutDirection];

  unint64_t v32 = [(_UIFluidSliderInteraction *)self _axis];
  double v33 = fmax(fmin(v5, 1.0), 0.0);
  double v34 = v33 * v18;
  double v35 = v18 - v33 * v18;
  double v36 = v18 - v35;
  double v37 = -v29;
  if (v31 == 1)
  {
    double v37 = v29;
    double v38 = v18 - v33 * v18;
  }
  else
  {
    double v38 = v33 * v18;
  }
  if (v31 == 1) {
    double v39 = v18 - v33 * v18;
  }
  else {
    double v39 = 0.0;
  }
  double v40 = v33;
  if (v32 == 1) {
    double v41 = v18;
  }
  else {
    double v41 = v27;
  }
  double v78 = v41;
  if (v32 == 1) {
    double v42 = v27;
  }
  else {
    double v42 = v18;
  }
  double v77 = v42;
  if (v32 == 1) {
    double v43 = v37;
  }
  else {
    double v43 = 0.0;
  }
  if (v32 == 1) {
    double v44 = 0.0;
  }
  else {
    double v44 = v29;
  }
  if (v32 == 1) {
    double v45 = v38;
  }
  else {
    double v45 = v27 * 0.5;
  }
  if (v32 == 1) {
    double v46 = v27 * 0.5;
  }
  else {
    double v46 = v36;
  }
  double v75 = v46;
  if (v32 == 1) {
    double v47 = v39;
  }
  else {
    double v47 = 0.0;
  }
  double v79 = v47;
  if (v32 == 1) {
    double v48 = 0.0;
  }
  else {
    double v48 = v35;
  }
  if (v32 == 1) {
    double v49 = v34;
  }
  else {
    double v49 = v27;
  }
  if (v32 == 1) {
    double v50 = v27;
  }
  else {
    double v50 = v36;
  }
  [(_UIFluidSliderInteraction *)self _state];
  double v87 = 0.0;
  long long v85 = 0u;
  long long v86 = 0u;
  [(_UIFluidSliderInteraction *)self _lastDriverUpdate];
  double v51 = [(_UIFluidSliderInteraction *)self _activeDriver];

  if (v51)
  {
    uint64_t v52 = 1;
    if ((void)v86 == 1) {
      uint64_t v53 = 1;
    }
    else {
      uint64_t v53 = 2;
    }
    uint64_t v54 = 4;
    if (*((void *)&v86 + 1) == 1) {
      uint64_t v54 = 2;
    }
    if (*((void *)&v86 + 1)) {
      uint64_t v55 = v54;
    }
    else {
      uint64_t v55 = 0;
    }
    if (*((void *)&v86 + 1) == 1)
    {
      double v56 = v49;
LABEL_74:
      BOOL v61 = 0;
      goto LABEL_76;
    }
    if ([(_UIFluidSliderInteraction *)self _state] && [(_UIFluidSliderInteraction *)self _state] != 2)
    {
      double v56 = v49;
      uint64_t v52 = 0;
      goto LABEL_74;
    }
    [(_UIFluidSliderInteraction *)self value];
    double v56 = v49;
    if (fabs(v62) <= 2.22044605e-16)
    {
      uint64_t v52 = 0;
      BOOL v61 = 1;
    }
    else
    {
      [(_UIFluidSliderInteraction *)self value];
      uint64_t v52 = 0;
      BOOL v61 = fabs(v63 + -1.0) <= 2.22044605e-16;
    }
  }
  else
  {
    double v56 = v49;
    uint64_t v57 = 5;
    if (*((void *)&v86 + 1) == 1) {
      uint64_t v57 = 3;
    }
    if (*((void *)&v86 + 1)) {
      uint64_t v55 = v57;
    }
    else {
      uint64_t v55 = 1;
    }
    v58 = [(_UIFluidSliderInteraction *)self _animatedValue];
    [v58 value];
    BOOL v60 = vabdd_f64(v59, v5) > 2.22044605e-16;

    uint64_t v52 = 0;
    BOOL v61 = 0;
    uint64_t v53 = 2 * v60;
  }
LABEL_76:
  [(_UIFluidSliderInteraction *)self set_state:v53];
  v64 = [(_UIFluidSliderInteraction *)self _trackScale];
  [v64 presentationValue];
  CGFloat v66 = v65;

  memset(&v84, 0, sizeof(v84));
  CGAffineTransformMakeScale(&v84, v66, v66);
  CGAffineTransform v82 = v84;
  CGAffineTransformTranslate(&v83, &v82, v43, v44);
  CGAffineTransform v84 = v83;
  v67 = objc_opt_new();
  BOOL v68 = [(_UIFluidSliderInteraction *)self isLocked];
  double v69 = v40;
  if (v68) {
    [(_UIFluidSliderInteraction *)self _lockedValue];
  }
  [v67 setValue:v69];
  objc_msgSend(v67, "setTrackBounds:", 0.0, 0.0, v78, v77);
  CGAffineTransform v81 = v84;
  [v67 setTrackTransform:&v81];
  objc_msgSend(v67, "setBarFrame:", v79, v48, v56, v50);
  [v67 setTracking:v52];
  objc_msgSend(v67, "setInteractionState:", -[_UIFluidSliderInteraction _state](self, "_state"));
  [v67 setType:v55];
  if (v53) {
    BOOL v70 = v53 == 2 && vabdd_f64(v5, v40) > 2.22044605e-16;
  }
  else {
    BOOL v70 = 1;
  }
  [v67 setAtTarget:v70];
  objc_msgSend(v67, "set_unclampedValue:", v5);
  long long v71 = [(_UIFluidSliderInteraction *)self _handler];
  ((void (**)(void, void *))v71)[2](v71, v67);

  if ([(_UIFluidSliderInteraction *)self _feedbackEnabled]
    && [(_UIFluidSliderInteraction *)self isUserInteractionEnabled]
    && ![(_UIFluidSliderInteraction *)self isLocked])
  {
    long long v72 = [(_UIFluidSliderInteraction *)self _feedbackConductor];
    double v73 = v87;
    [(_UIFluidSliderInteraction *)self _lastDriverUpdate];
    objc_msgSend(v72, "moveToValue:snappingTarget:withUpdateType:atLocation:forced:", v80, v61, v5, v73, v74, v76);
  }
}

- (void)_cancelDriversExcludingDriver:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59___UIFluidSliderInteraction__cancelDriversExcludingDriver___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView _performWithoutRetargetingAnimations:v6];
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  v2 = [(_UIFluidSliderInteraction *)self _panDriver];
  unint64_t v3 = [v2 panGestureRecognizer];

  return (UIPanGestureRecognizer *)v3;
}

- (_UIPhysicalButtonInteraction)_volumeButtonInteraction
{
  v2 = [(_UIFluidSliderInteraction *)self _volumeButtonDriver];
  unint64_t v3 = [v2 physicalButtonInteraction];

  return (_UIPhysicalButtonInteraction *)v3;
}

- (void)_setElasticity:(int64_t)a3
{
  if (self->_elasticity != a3)
  {
    self->_elasticity = a3;
    [(_UIFluidSliderInteraction *)self _rebuildDrivers];
  }
}

- (double)_driftFactor
{
  v2 = +[_UIFluidSliderSettingsDomain rootSettings];
  [v2 sliderDriftFactor];
  double v4 = v3;

  return v4;
}

- (double)_minSquishedWidthForWidth:(double)a3
{
  double v4 = +[_UIFluidSliderSettingsDomain rootSettings];
  [v4 squishFactor];
  double v6 = v5;

  id v7 = +[_UIFluidSliderSettingsDomain rootSettings];
  [v7 minSquishPoints];
  double v9 = v8;

  double result = v6 * a3;
  if (v6 * a3 >= a3 - v9) {
    return a3 - v9;
  }
  return result;
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  if (os_variant_has_internal_diagnostics())
  {
    double v5 = [(_UIFluidSliderInteraction *)self configuration];
    [v3 appendFormat:@"; configuration = %@", v5];

    if (![(_UIFluidSliderInteraction *)self isUserInteractionEnabled]) {
      [v3 appendString:@"; userInteractionEnabled = NO"];
    }
    if (![(_UIFluidSliderInteraction *)self _feedbackEnabled]) {
      [v3 appendString:@"; feedbackEnabled = NO"];
    }
    if ([(_UIFluidSliderInteraction *)self _elasticity] != 2)
    {
      int64_t v6 = [(_UIFluidSliderInteraction *)self _elasticity];
      id v7 = @"full";
      if (v6 == 1) {
        id v7 = @"indirectOnly";
      }
      if (!v6) {
        id v7 = @"none";
      }
      [v3 appendFormat:@"; elasticity = %@", v7];
    }
  }
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (void)_animate:(id)a3 withSpring:(id)a4
{
  int64_t v6 = (void (**)(void))a3;
  id v7 = a4;
  if (+[UIView _isInRetargetableAnimationBlock])
  {
    v6[2](v6);
  }
  else if (+[UIView _isInAnimationBlock] {
         || !+[UIView areAnimationsEnabled])
  }
  {
    v6[2](v6);
    [(_UIFluidSliderInteraction *)self _issueUpdate];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __49___UIFluidSliderInteraction__animate_withSpring___block_invoke;
    v8[3] = &unk_1E52DA040;
    double v9 = v6;
    +[UIView _animateUsingSpringBehavior:v7 tracking:0 animations:v8 completion:0];
  }
}

- (double)_feedbackEpsilon
{
  double v3 = [(_UIFluidSliderInteraction *)self view];
  double v4 = [v3 traitCollection];
  [v4 displayScale];
  double v6 = 1.0 / v5;
  [(_UIFluidSliderInteraction *)self _normalizedTrackSize];
  double v8 = fmax(fmin(v6 / v7, 1.0), 0.0001);

  return v8;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (int64_t)_elasticity
{
  return self->_elasticity;
}

- (BOOL)_feedbackEnabled
{
  return self->_feedbackEnabled;
}

- (void)_setFeedbackEnabled:(BOOL)a3
{
  self->_feedbackEnabled = a3;
}

- (_UIFluidSliderDirectDrivingDelegate)_directDrivingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_directDrivingDelegate);
  return (_UIFluidSliderDirectDrivingDelegate *)WeakRetained;
}

- (double)_lockedValue
{
  return self->_lockedValue;
}

- (void)set_lockedValue:(double)a3
{
  self->_lockedValue = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (_UIFluidSliderInteractionConfiguration)configuration
{
  return self->_configuration;
}

- (id)_handler
{
  return self->__handler;
}

- (void)set_handler:(id)a3
{
}

- (unint64_t)_axis
{
  return self->__axis;
}

- (void)set_axis:(unint64_t)a3
{
  self->__axis = a3;
}

- (CGSize)_normalizedTrackSize
{
  double width = self->__normalizedTrackSize.width;
  double height = self->__normalizedTrackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_normalizedTrackSize:(CGSize)a3
{
  self->__normalizedTrackSize = a3;
}

- (NSArray)_drivers
{
  return self->__drivers;
}

- (void)set_drivers:(id)a3
{
}

- (_UIFluidSliderDriving)_activeDriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__activeDriver);
  return (_UIFluidSliderDriving *)WeakRetained;
}

- (void)set_activeDriver:(id)a3
{
}

- (_UIFluidSliderDirectDriving)_panDriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__panDriver);
  return (_UIFluidSliderDirectDriving *)WeakRetained;
}

- (void)set_panDriver:(id)a3
{
}

- (_UIFluidSliderVolumeButtonDriving)_volumeButtonDriver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__volumeButtonDriver);
  return (_UIFluidSliderVolumeButtonDriving *)WeakRetained;
}

- (void)set_volumeButtonDriver:(id)a3
{
}

- (_UIFluidSliderFeedbackConductor)_feedbackConductor
{
  return self->__feedbackConductor;
}

- (void)set_feedbackConductor:(id)a3
{
}

- (UIViewFloatAnimatableProperty)_animatedValue
{
  return self->__animatedValue;
}

- (void)set_animatedValue:(id)a3
{
}

- (UIViewFloatAnimatableProperty)_trackWidth
{
  return self->__trackWidth;
}

- (void)set_trackWidth:(id)a3
{
}

- (UIViewFloatAnimatableProperty)_trackLength
{
  return self->__trackLength;
}

- (void)set_trackLength:(id)a3
{
}

- (UIViewFloatAnimatableProperty)_trackScale
{
  return self->__trackScale;
}

- (void)set_trackScale:(id)a3
{
}

- (int64_t)_state
{
  return self->__state;
}

- (void)set_state:(int64_t)a3
{
  self->__state = a3;
}

- ($0E0C902F25D72445DD01CB63E261F0E2)_lastDriverUpdate
{
  long long v3 = *(_OWORD *)&self[4].var4;
  *(_OWORD *)&retstr->double var0 = *(_OWORD *)&self[4].var2;
  *(_OWORD *)&retstr->int64_t var2 = v3;
  retstr->double var4 = self[5].var1;
  return self;
}

- (void)set_lastDriverUpdate:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->currentSnappingTarget = a3->var4;
  *(_OWORD *)&self->value = v3;
  *(_OWORD *)&self->state = v4;
}

- (BOOL)_shouldScaleOnIndirectInput
{
  return self->__shouldScaleOnIndirectInput;
}

- (void)_setShouldScaleOnIndirectInput:(BOOL)a3
{
  self->__shouldScaleOnIndirectInput = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trackScale, 0);
  objc_storeStrong((id *)&self->__trackLength, 0);
  objc_storeStrong((id *)&self->__trackWidth, 0);
  objc_storeStrong((id *)&self->__animatedValue, 0);
  objc_storeStrong((id *)&self->__feedbackConductor, 0);
  objc_destroyWeak((id *)&self->__volumeButtonDriver);
  objc_destroyWeak((id *)&self->__panDriver);
  objc_destroyWeak((id *)&self->__activeDriver);
  objc_storeStrong((id *)&self->__drivers, 0);
  objc_storeStrong(&self->__handler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_directDrivingDelegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
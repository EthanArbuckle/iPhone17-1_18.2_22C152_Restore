@interface _UIFluidSliderFeedbackConductor
- (_UIFluidSliderFeedbackConductor)initWithDetentCount:(unint64_t)a3 view:(id)a4 indirectFeedbackPlayer:(id)a5;
- (_UIFluidSliderFeedbackPlayer)_directFeedbackPlayer;
- (_UIFluidSliderFeedbackPlayer)_indirectFeedbackPlayer;
- (double)_lastSnappingTarget;
- (double)_lastValue;
- (double)epsilon;
- (int64_t)_currentRegion;
- (unint64_t)_detentCount;
- (void)_playFeedback:(int64_t)a3 forUpdateType:(int64_t)a4 value:(double)a5 atLocation:(CGPoint)a6;
- (void)moveToValue:(double)a3 snappingTarget:(double)a4 withUpdateType:(int64_t)a5 atLocation:(CGPoint)a6 forced:(BOOL)a7;
- (void)setEpsilon:(double)a3;
- (void)set_currentRegion:(int64_t)a3;
- (void)set_detentCount:(unint64_t)a3;
- (void)set_directFeedbackPlayer:(id)a3;
- (void)set_indirectFeedbackPlayer:(id)a3;
- (void)set_lastSnappingTarget:(double)a3;
- (void)set_lastValue:(double)a3;
@end

@implementation _UIFluidSliderFeedbackConductor

- (_UIFluidSliderFeedbackConductor)initWithDetentCount:(unint64_t)a3 view:(id)a4 indirectFeedbackPlayer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_UIFluidSliderFeedbackConductor;
  v10 = [(_UIFluidSliderFeedbackConductor *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(_UIFluidSliderFeedbackConductor *)v10 set_detentCount:a3];
    v12 = [[_UIFluidSliderFeedbackGenerator alloc] initWithView:v8];
    [(_UIFluidSliderFeedbackConductor *)v11 set_directFeedbackPlayer:v12];

    [(_UIFluidSliderFeedbackConductor *)v11 set_indirectFeedbackPlayer:v9];
    [(_UIFluidSliderFeedbackConductor *)v11 setEpsilon:0.0001];
  }

  return v11;
}

- (void)moveToValue:(double)a3 snappingTarget:(double)a4 withUpdateType:(int64_t)a5 atLocation:(CGPoint)a6 forced:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  if (a7
    || ([(_UIFluidSliderFeedbackConductor *)self _lastValue],
        double v15 = vabdd_f64(a3, v14),
        [(_UIFluidSliderFeedbackConductor *)self epsilon],
        v15 > v16))
  {
    [(_UIFluidSliderFeedbackConductor *)self _currentRegion];
    [(_UIFluidSliderFeedbackConductor *)self epsilon];
    if (v17 <= a3)
    {
      [(_UIFluidSliderFeedbackConductor *)self epsilon];
      double v21 = 1.0 - v20;
      BOOL v18 = v21 >= a3;
      if (v21 < a3) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 2;
      }
      if (!a5) {
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v18 = 0;
      uint64_t v19 = 1;
      if (!a5) {
        goto LABEL_17;
      }
    }
    if (!v7 && [(_UIFluidSliderFeedbackConductor *)self _currentRegion])
    {
      if (v18)
      {
        if (a5 == 1)
        {
          if (a4 <= 0.0) {
            goto LABEL_30;
          }
          if (a4 >= 1.0) {
            goto LABEL_30;
          }
          [(_UIFluidSliderFeedbackConductor *)self _lastSnappingTarget];
          double v28 = vabdd_f64(a4, v27);
          [(_UIFluidSliderFeedbackConductor *)self epsilon];
          if (v28 <= v29) {
            goto LABEL_30;
          }
          uint64_t v23 = 2;
LABEL_19:
          if (v19 == 3)
          {
            -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", 3, a5, a3, x, y);
            v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &qword_1EB264598) + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v30) = 0;
              v25 = "[FluidSlider Feedback] Max";
              v26 = (uint8_t *)&v30;
              goto LABEL_29;
            }
          }
          else if (v19 == 2)
          {
            -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", v23, a5, a3, x, y);
            v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &qword_1EB264590) + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v25 = "[FluidSlider Feedback] Detent";
              v26 = buf;
              goto LABEL_29;
            }
          }
          else
          {
            -[_UIFluidSliderFeedbackConductor _playFeedback:forUpdateType:value:atLocation:](self, "_playFeedback:forUpdateType:value:atLocation:", 0, a5, a3, x, y);
            v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("FluidSliderInteraction", &_MergedGlobals_1251) + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v32 = 0;
              v25 = "[FluidSlider Feedback] Min";
              v26 = (uint8_t *)&v32;
LABEL_29:
              _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, v25, v26, 2u);
            }
          }
LABEL_30:
          -[_UIFluidSliderFeedbackConductor set_currentRegion:](self, "set_currentRegion:", v19, v30);
          [(_UIFluidSliderFeedbackConductor *)self set_lastValue:a3];
          [(_UIFluidSliderFeedbackConductor *)self set_lastSnappingTarget:a4];
          return;
        }
        if (a5 != 3) {
          goto LABEL_17;
        }
        [(_UIFluidSliderFeedbackConductor *)self _lastValue];
        if (floor(v22 * (double)[(_UIFluidSliderFeedbackConductor *)self _detentCount]) == floor((double)[(_UIFluidSliderFeedbackConductor *)self _detentCount] * a3)) {
          goto LABEL_30;
        }
      }
      else if (v19 == [(_UIFluidSliderFeedbackConductor *)self _currentRegion])
      {
        goto LABEL_30;
      }
LABEL_18:
      uint64_t v23 = 1;
      goto LABEL_19;
    }
LABEL_17:
    if (!v7) {
      goto LABEL_30;
    }
    goto LABEL_18;
  }
}

- (void)_playFeedback:(int64_t)a3 forUpdateType:(int64_t)a4 value:(double)a5 atLocation:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  if (a4 == 1
    || ([(_UIFluidSliderFeedbackConductor *)self _indirectFeedbackPlayer],
        v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_msgSend(v11, "playFeedback:forValue:atLocation:", a3, a5, x, y),
        v11,
        (v12 & 1) == 0))
  {
    id v13 = [(_UIFluidSliderFeedbackConductor *)self _directFeedbackPlayer];
    objc_msgSend(v13, "playFeedback:forValue:atLocation:", a3, a5, x, y);
  }
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(double)a3
{
  self->_epsilon = a3;
}

- (_UIFluidSliderFeedbackPlayer)_directFeedbackPlayer
{
  return self->__directFeedbackPlayer;
}

- (void)set_directFeedbackPlayer:(id)a3
{
}

- (_UIFluidSliderFeedbackPlayer)_indirectFeedbackPlayer
{
  return self->__indirectFeedbackPlayer;
}

- (void)set_indirectFeedbackPlayer:(id)a3
{
}

- (double)_lastValue
{
  return self->__lastValue;
}

- (void)set_lastValue:(double)a3
{
  self->__lastValue = a3;
}

- (double)_lastSnappingTarget
{
  return self->__lastSnappingTarget;
}

- (void)set_lastSnappingTarget:(double)a3
{
  self->__lastSnappingTarget = a3;
}

- (unint64_t)_detentCount
{
  return self->__detentCount;
}

- (void)set_detentCount:(unint64_t)a3
{
  self->__detentCount = a3;
}

- (int64_t)_currentRegion
{
  return self->__currentRegion;
}

- (void)set_currentRegion:(int64_t)a3
{
  self->__currentRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indirectFeedbackPlayer, 0);
  objc_storeStrong((id *)&self->__directFeedbackPlayer, 0);
}

@end
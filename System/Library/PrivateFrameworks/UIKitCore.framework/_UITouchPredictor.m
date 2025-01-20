@interface _UITouchPredictor
- (_UITouchPredictor)init;
- (_UITouchPredictor)initWithTouchPredictor:(id)a3;
- (id)_angleValuePredictor;
- (id)_azimuthValuePredictor;
- (id)_forceValuePredictor;
- (id)_predictedTouchesAtIndex:(unint64_t)a3 forTouch:(id)a4;
- (id)_xValuePredictor;
- (id)_yValuePredictor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionFromIndex:(int)a3 toIndex:(int)a4 includeHeader:(BOOL)a5 includeDetailedConfidence:(BOOL)a6;
- (id)predictedTouchesForTouch:(id)a3;
- (unint64_t)_dampenedNumPredictionsAtIndex:(unint64_t)a3;
- (unint64_t)_numPredictionsAtIndex:(unint64_t)a3 hardLimit:(unint64_t *)a4;
- (void)_updatePredictionsForTouch:(id)a3 weight:(double)a4;
- (void)addTouch:(id)a3;
@end

@implementation _UITouchPredictor

- (_UITouchPredictor)init
{
  v16.receiver = self;
  v16.super_class = (Class)_UITouchPredictor;
  v2 = [(_UITouchPredictor *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    predictions = v2->_predictions;
    v2->_predictions = (NSMutableArray *)v3;

    v2->_predictionsValid = 0;
    v2->_numPredictionsBufferCount = 0;
    v2->_averageTouchInterval = 0.0;
    v2->_lastTouchTimestamp = 0.0;
    v5 = [[_UIValuePredictor alloc] initWithNumPredictions:4 numDerivatives:4];
    xValuePredictor = v2->_xValuePredictor;
    v2->_xValuePredictor = v5;

    [(_UIValuePredictor *)v2->_xValuePredictor setMinHistoricalAccuracyThreshold:0.5];
    [(_UIValuePredictor *)v2->_xValuePredictor setMaxHistoricalAccuracyThreshold:2.0];
    [(_UIValuePredictor *)v2->_xValuePredictor setDerivativeStabilityThreshold:1.5];
    [(_UIValuePredictor *)v2->_xValuePredictor setMinVelocityThreshold:0.5];
    [(_UIValuePredictor *)v2->_xValuePredictor setMaxVelocityThreshold:1.5];
    v7 = [[_UIValuePredictor alloc] initWithNumPredictions:4 numDerivatives:4];
    yValuePredictor = v2->_yValuePredictor;
    v2->_yValuePredictor = v7;

    [(_UIValuePredictor *)v2->_yValuePredictor setMinHistoricalAccuracyThreshold:0.5];
    [(_UIValuePredictor *)v2->_yValuePredictor setMaxHistoricalAccuracyThreshold:2.0];
    [(_UIValuePredictor *)v2->_yValuePredictor setDerivativeStabilityThreshold:1.5];
    [(_UIValuePredictor *)v2->_yValuePredictor setMinVelocityThreshold:0.5];
    [(_UIValuePredictor *)v2->_yValuePredictor setMaxVelocityThreshold:1.5];
    v9 = [[_UIValuePredictor alloc] initWithNumPredictions:4 numDerivatives:4];
    angleValuePredictor = v2->_angleValuePredictor;
    v2->_angleValuePredictor = v9;

    [(_UIValuePredictor *)v2->_angleValuePredictor setMinConstraint:0.0];
    [(_UIValuePredictor *)v2->_angleValuePredictor setMaxConstraint:1.57079633];
    v11 = [[_UIValuePredictor alloc] initWithNumPredictions:4 numDerivatives:4];
    azimuthValuePredictor = v2->_azimuthValuePredictor;
    v2->_azimuthValuePredictor = v11;

    [(_UIValuePredictor *)v2->_azimuthValuePredictor setMinConstraint:0.0];
    [(_UIValuePredictor *)v2->_azimuthValuePredictor setMaxConstraint:6.28318531];
    [(_UIValuePredictor *)v2->_azimuthValuePredictor setWrapConstraint:1];
    v13 = [[_UIValuePredictor alloc] initWithNumPredictions:4 numDerivatives:4];
    forceValuePredictor = v2->_forceValuePredictor;
    v2->_forceValuePredictor = v13;

    [(_UIValuePredictor *)v2->_forceValuePredictor setMinConstraint:0.0];
    [(_UIValuePredictor *)v2->_forceValuePredictor setMaxConstraint:500.0];
  }
  return v2;
}

- (_UITouchPredictor)initWithTouchPredictor:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UITouchPredictor;
  v5 = [(_UITouchPredictor *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    predictions = v5->_predictions;
    v5->_predictions = (NSMutableArray *)v6;

    v5->_predictionsValid = 0;
    v5->_numPredictionsBufferCount = 0;
    v5->_averageTouchInterval = 0.0;
    v5->_lastTouchTimestamp = 0.0;
    v8 = [v4 _xValuePredictor];
    uint64_t v9 = [v8 copy];
    xValuePredictor = v5->_xValuePredictor;
    v5->_xValuePredictor = (_UIValuePredictor *)v9;

    v11 = [v4 _yValuePredictor];
    uint64_t v12 = [v11 copy];
    yValuePredictor = v5->_yValuePredictor;
    v5->_yValuePredictor = (_UIValuePredictor *)v12;

    v14 = [v4 _angleValuePredictor];
    uint64_t v15 = [v14 copy];
    angleValuePredictor = v5->_angleValuePredictor;
    v5->_angleValuePredictor = (_UIValuePredictor *)v15;

    v17 = [v4 _azimuthValuePredictor];
    uint64_t v18 = [v17 copy];
    azimuthValuePredictor = v5->_azimuthValuePredictor;
    v5->_azimuthValuePredictor = (_UIValuePredictor *)v18;

    v20 = [v4 _forceValuePredictor];
    uint64_t v21 = [v20 copy];
    forceValuePredictor = v5->_forceValuePredictor;
    v5->_forceValuePredictor = (_UIValuePredictor *)v21;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithTouchPredictor:self];
}

- (void)addTouch:(id)a3
{
  id v10 = a3;
  [(NSMutableArray *)self->_predictions removeAllObjects];
  self->_predictionsValid = 0;
  if (self->_lastTouchTimestamp == 0.0)
  {
    double v8 = 1.0;
  }
  else
  {
    [v10 timestamp];
    double v5 = v4 - self->_lastTouchTimestamp;
    if (self->_averageTouchInterval == 0.0) {
      double averageTouchInterval = v5;
    }
    else {
      double averageTouchInterval = self->_averageTouchInterval;
    }
    double v7 = (v5 + averageTouchInterval) * 0.5;
    self->_double averageTouchInterval = v7;
    double v8 = v7 / v5;
  }
  [v10 timestamp];
  self->_lastTouchTimestamp = v9;
  [(_UITouchPredictor *)self _updatePredictionsForTouch:v10 weight:v8];
}

- (unint64_t)_numPredictionsAtIndex:(unint64_t)a3 hardLimit:(unint64_t *)a4
{
  -[_UIValuePredictor _predictionsAtIndex:](self->_xValuePredictor, "_predictionsAtIndex:");
  [(_UIValuePredictor *)self->_yValuePredictor _predictionsAtIndex:a3];
  double v7 = [(_UIValuePredictor *)self->_xValuePredictor _confidenceFactorsAtIndex:a3];
  double v8 = [(_UIValuePredictor *)self->_yValuePredictor _confidenceFactorsAtIndex:a3];
  double v9 = [(_UIValuePredictor *)self->_xValuePredictor _confidenceFactorsForVelocityAtIndex:a3];
  id v10 = [(_UIValuePredictor *)self->_yValuePredictor _confidenceFactorsForVelocityAtIndex:a3];
  unint64_t v11 = 0;
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v12 = v11;
      if ((v9[v11] + v10[v11]) * 0.5 >= 0.3)
      {
        double v13 = (double)(v11 + 1) * 0.75 * 0.25;
        if (v7[v11] >= v13 && v8[v11] >= v13) {
          unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
      }
    }
    ++v11;
  }
  while (v11 != 4);
  *a4 = 4;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    return 4;
  }
  else {
    return v12;
  }
}

- (unint64_t)_dampenedNumPredictionsAtIndex:(unint64_t)a3
{
  unint64_t v15 = 4;
  unint64_t v4 = [(_UITouchPredictor *)self _numPredictionsAtIndex:a3 hardLimit:&v15];
  int64_t numPredictionsBufferCount = self->_numPredictionsBufferCount;
  if (numPredictionsBufferCount <= 4)
  {
    uint64_t v6 = (double *)(&self->super.isa + numPredictionsBufferCount);
    uint64_t v7 = numPredictionsBufferCount + 1;
    self->_int64_t numPredictionsBufferCount = v7;
    v6[10] = (double)v4;
    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    double v9 = 0.0;
    goto LABEL_8;
  }
  long long v12 = *(_OWORD *)&self->_numPredictionsBuffer[3];
  *(_OWORD *)self->_numPredictionsBuffer = *(_OWORD *)&self->_numPredictionsBuffer[1];
  *(_OWORD *)&self->_numPredictionsBuffer[2] = v12;
  self->_numPredictionsBuffer[4] = (double)v4;
  uint64_t v7 = self->_numPredictionsBufferCount;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  numPredictionsBuffer = self->_numPredictionsBuffer;
  double v9 = 0.0;
  uint64_t v10 = v7;
  do
  {
    double v11 = *numPredictionsBuffer++;
    double v9 = v9 + v11;
    --v10;
  }
  while (v10);
LABEL_8:
  double v13 = round(v9 / (double)v7);
  if (v13 > (double)v15) {
    return (unint64_t)(double)v15;
  }
  return (unint64_t)v13;
}

- (id)_predictedTouchesAtIndex:(unint64_t)a3 forTouch:(id)a4
{
  id v6 = a4;
  if (!self->_predictionsValid)
  {
    v32 = [(_UIValuePredictor *)self->_xValuePredictor _predictionsAtIndex:a3];
    uint64_t v7 = [(_UIValuePredictor *)self->_yValuePredictor _predictionsAtIndex:a3];
    double v8 = [(_UIValuePredictor *)self->_angleValuePredictor _predictionsAtIndex:a3];
    double v9 = [(_UIValuePredictor *)self->_azimuthValuePredictor _predictionsAtIndex:a3];
    uint64_t v10 = [(_UIValuePredictor *)self->_forceValuePredictor _predictionsAtIndex:a3];
    id v31 = v6;
    id v11 = v6;
    long long v12 = [v11 window];
    [v12 contentScaleFactor];
    double v14 = v13;

    double averageTouchInterval = self->_averageTouchInterval;
    int v16 = [(_UITouchPredictor *)self _dampenedNumPredictionsAtIndex:a3];
    if (v16 >= 1)
    {
      uint64_t v17 = 0;
      uint64_t v18 = v16;
      uint64_t v19 = (uint64_t)v11;
      while (1)
      {
        v20 = (void *)v19;
        uint64_t v19 = objc_msgSend(v11, "_clone", v31);
        [(id)v19 _setPreviousTouch:v20];
        double v21 = v32[v17];
        double v22 = round(v14 * v21) / v14;
        double v23 = v7[v17];
        double v24 = round(v14 * v23) / v14;
        if (v19)
        {
          *(_OWORD *)(v19 + 128) = *(_OWORD *)(v19 + 112);
          *(_OWORD *)(v19 + 160) = *(_OWORD *)(v19 + 144);
          *(double *)(v19 + 112) = v22;
          *(double *)(v19 + 120) = v24;
          *(double *)(v19 + 144) = v21;
          *(double *)(v19 + 152) = v23;
        }
        if ((v17 & 0x8000000000000000) == 0)
        {
          -[UITouch _setAltitudeAngle:](v19, v8[v17]);
          if (v19)
          {
            *(double *)(v19 + 368) = v9[v17];
            -[UITouch _computeAzimuthAngleInWindow](v19);
          }
        }
        if (v17 < 0) {
          goto LABEL_14;
        }
        double v25 = v10[v17];
        if (v19) {
          break;
        }
        objc_msgSend(v20, "timestamp", v25);
        [0 setTimestamp:averageTouchInterval + v28];
LABEL_16:
        [(NSMutableArray *)self->_predictions addObject:v19];

        if (++v17 == v18) {
          goto LABEL_20;
        }
      }
      double v26 = *(double *)(v19 + 224);
      if (v26 < v25) {
        double v26 = v10[v17];
      }
      *(void *)(v19 + 176) = *(void *)(v19 + 216);
      *(double *)(v19 + 216) = v25;
      *(double *)(v19 + 224) = v26;
LABEL_14:
      [v20 timestamp];
      [(id)v19 setTimestamp:averageTouchInterval + v27];
      if (v19) {
        *(_WORD *)(v19 + 236) |= 0x80u;
      }
      goto LABEL_16;
    }
    uint64_t v19 = (uint64_t)v11;
LABEL_20:
    self->_predictionsValid = 1;

    id v6 = v31;
  }
  v29 = self->_predictions;

  return v29;
}

- (id)predictedTouchesForTouch:(id)a3
{
  xValuePredictor = self->_xValuePredictor;
  id v5 = a3;
  id v6 = [(_UITouchPredictor *)self _predictedTouchesAtIndex:[(_UIValuePredictor *)xValuePredictor numValues] - 1 forTouch:v5];

  return v6;
}

- (id)_xValuePredictor
{
  return self->_xValuePredictor;
}

- (id)_yValuePredictor
{
  return self->_yValuePredictor;
}

- (id)_angleValuePredictor
{
  return self->_angleValuePredictor;
}

- (id)_azimuthValuePredictor
{
  return self->_azimuthValuePredictor;
}

- (id)_forceValuePredictor
{
  return self->_forceValuePredictor;
}

- (id)descriptionFromIndex:(int)a3 toIndex:(int)a4 includeHeader:(BOOL)a5 includeDetailedConfidence:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v11 = [MEMORY[0x1E4F28E78] string];
  long long v12 = [(_UIValuePredictor *)self->_xValuePredictor descriptionFromIndex:a3 toIndex:a4 includeHeader:v7 includeDetailedConfidence:v6];
  [v11 appendFormat:@"X:\n%@", v12];

  double v13 = [(_UIValuePredictor *)self->_yValuePredictor descriptionFromIndex:a3 toIndex:a4 includeHeader:v7 includeDetailedConfidence:v6];
  [v11 appendFormat:@"Y:\n%@", v13];

  double v14 = [(_UIValuePredictor *)self->_angleValuePredictor descriptionFromIndex:a3 toIndex:a4 includeHeader:v7 includeDetailedConfidence:v6];
  [v11 appendFormat:@"Angle:\n%@", v14];

  unint64_t v15 = [(_UIValuePredictor *)self->_azimuthValuePredictor descriptionFromIndex:a3 toIndex:a4 includeHeader:v7 includeDetailedConfidence:v6];
  [v11 appendFormat:@"Azimuth:\n%@", v15];

  int v16 = [(_UIValuePredictor *)self->_forceValuePredictor descriptionFromIndex:a3 toIndex:a4 includeHeader:v7 includeDetailedConfidence:v6];
  [v11 appendFormat:@"Force:\n%@", v16];

  return v11;
}

- (id)description
{
  uint64_t v3 = [(_UIValuePredictor *)self->_xValuePredictor numValues] + 3;
  return [(_UITouchPredictor *)self descriptionFromIndex:0 toIndex:v3 includeHeader:1 includeDetailedConfidence:1];
}

- (void)_updatePredictionsForTouch:(id)a3 weight:(double)a4
{
  BOOL v6 = (double *)a3;
  [v6 preciseLocationInView:0];
  double v8 = v7;
  -[_UIValuePredictor addValue:weight:](self->_xValuePredictor, "addValue:weight:");
  [(_UIValuePredictor *)self->_yValuePredictor addValue:v8 weight:a4];
  angleValuePredictor = self->_angleValuePredictor;
  [v6 altitudeAngle];
  -[_UIValuePredictor addValue:weight:](angleValuePredictor, "addValue:weight:");
  if (v6) {
    double v10 = v6[46];
  }
  else {
    double v10 = 0.0;
  }
  [(_UIValuePredictor *)self->_azimuthValuePredictor addValue:v10 weight:a4];
  forceValuePredictor = self->_forceValuePredictor;
  [v6 _pressure];
  double v13 = v12;

  [(_UIValuePredictor *)forceValuePredictor addValue:v13 weight:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceValuePredictor, 0);
  objc_storeStrong((id *)&self->_azimuthValuePredictor, 0);
  objc_storeStrong((id *)&self->_angleValuePredictor, 0);
  objc_storeStrong((id *)&self->_yValuePredictor, 0);
  objc_storeStrong((id *)&self->_xValuePredictor, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
}

@end
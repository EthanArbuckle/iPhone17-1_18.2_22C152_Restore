@interface FMOOSClientPrediction
- (BOOL)isSent;
- (FMOOSClientPrediction)initWithPredictedCell:(id)a3 nextCells:(id)a4 oosAreaSeenCount:(int)a5 predictedOOSDuration:(double)a6 validPredictionDuration:(double)a7 isSent:(BOOL)a8;
- (FMServingCell)predictedRecoveryCell;
- (NSArray)nextCells;
- (double)predictedOOSDuration;
- (double)validPredictionDuration;
- (int)oosAreaSeenCount;
@end

@implementation FMOOSClientPrediction

- (FMOOSClientPrediction)initWithPredictedCell:(id)a3 nextCells:(id)a4 oosAreaSeenCount:(int)a5 predictedOOSDuration:(double)a6 validPredictionDuration:(double)a7 isSent:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FMOOSClientPrediction;
  v17 = [(FMOOSClientPrediction *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_predictedRecoveryCell, a3);
    objc_storeStrong((id *)&v18->_nextCells, a4);
    v18->_oosAreaSeenCount = a5;
    v18->_predictedOOSDuration = a6;
    v18->_validPredictionDuration = a7;
    v18->_isSent = a8;
    v19 = v18;
  }

  return v18;
}

- (FMServingCell)predictedRecoveryCell
{
  return (FMServingCell *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)nextCells
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (int)oosAreaSeenCount
{
  return self->_oosAreaSeenCount;
}

- (double)predictedOOSDuration
{
  return self->_predictedOOSDuration;
}

- (double)validPredictionDuration
{
  return self->_validPredictionDuration;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextCells, 0);

  objc_storeStrong((id *)&self->_predictedRecoveryCell, 0);
}

@end
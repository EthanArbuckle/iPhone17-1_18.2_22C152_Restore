@interface FMTSPredictionFactory
+ (id)predictionWithType:(signed __int16)a3 predictionTime:(id)a4 predictionSources:(id)a5 numPrevTimesUntilAnomaly:(unint64_t)a6 numPrevPredictions:(unint64_t)a7 numPrevPredictionsCorrect:(unint64_t)a8 predictedTimeUntilAnomaly:(int)a9 predictedDuration:(int)a10 confidenceAnomaly:(double)a11 confidenceDuration:(double)a12 confidenceTimeUntilAnomaly:(double)a13 predictionTimestamp:(unint64_t)a14;
@end

@implementation FMTSPredictionFactory

+ (id)predictionWithType:(signed __int16)a3 predictionTime:(id)a4 predictionSources:(id)a5 numPrevTimesUntilAnomaly:(unint64_t)a6 numPrevPredictions:(unint64_t)a7 numPrevPredictionsCorrect:(unint64_t)a8 predictedTimeUntilAnomaly:(int)a9 predictedDuration:(int)a10 confidenceAnomaly:(double)a11 confidenceDuration:(double)a12 confidenceTimeUntilAnomaly:(double)a13 predictionTimestamp:(unint64_t)a14
{
  int v21 = a3;
  id v22 = a4;
  id v23 = a5;
  if ((v21 - 1) < 3 && (v24 = (objc_class *)objc_opt_class()) != 0)
  {
    LODWORD(v27) = a10;
    id v25 = [[v24 alloc] init:v22 predictionSources:v23 numPrevTimesUntilAnomaly:a6 numPrevPredictions:a7 numPrevPredictionsCorrect:a8 predictedTimeUntilAnomaly:a9 predictedDuration:a11 confidenceAnomaly:a12 confidenceDuration:a13 confidenceTimeUntilAnomaly:v27 predictionTimestamp:a14];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

@end
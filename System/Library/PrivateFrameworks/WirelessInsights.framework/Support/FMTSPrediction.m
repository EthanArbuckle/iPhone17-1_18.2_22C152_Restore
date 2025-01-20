@interface FMTSPrediction
- (BOOL)didAnomalyHappen;
- (BOOL)isEqualToPrediction:(id)a3;
- (NSDate)predictionTime;
- (NSSet)predictionSources;
- (double)confidenceAnomaly;
- (double)confidenceDuration;
- (double)confidenceTimeUntilAnomaly;
- (id)description;
- (id)init:(id)a3 predictionSources:(id)a4 numPrevTimesUntilAnomaly:(unint64_t)a5 numPrevPredictions:(unint64_t)a6 numPrevPredictionsCorrect:(unint64_t)a7 predictedTimeUntilAnomaly:(int)a8 predictedDuration:(int)a9 confidenceAnomaly:(double)a10 confidenceDuration:(double)a11 confidenceTimeUntilAnomaly:(double)a12 predictionTimestamp:(unint64_t)a13;
- (int)actualDuration;
- (int)actualTimeUntilAnomaly;
- (int)predictedDuration;
- (int)predictedTimeUntilAnomaly;
- (unint64_t)actualEndTimestamp;
- (unint64_t)actualStartTimestamp;
- (unint64_t)numPrevPredictionCorrect;
- (unint64_t)numPrevPredictions;
- (unint64_t)numPrevTimesUntilAnomaly;
- (unint64_t)predictedStartTimestamp;
- (unint64_t)predictionTimestamp;
- (void)predictedAnomalyEndedAtTimestamp:(unint64_t)a3;
- (void)predictedAnomalyStartedAtTimestamp:(unint64_t)a3;
@end

@implementation FMTSPrediction

- (id)init:(id)a3 predictionSources:(id)a4 numPrevTimesUntilAnomaly:(unint64_t)a5 numPrevPredictions:(unint64_t)a6 numPrevPredictionsCorrect:(unint64_t)a7 predictedTimeUntilAnomaly:(int)a8 predictedDuration:(int)a9 confidenceAnomaly:(double)a10 confidenceDuration:(double)a11 confidenceTimeUntilAnomaly:(double)a12 predictionTimestamp:(unint64_t)a13
{
  id v23 = a3;
  id v24 = a4;
  v29.receiver = self;
  v29.super_class = (Class)FMTSPrediction;
  v25 = [(FMTSPrediction *)&v29 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_predictionTime, a3);
    objc_storeStrong((id *)&v26->_predictionSources, a4);
    v26->_numPrevTimesUntilAnomaly = a5;
    v26->_numPrevPredictions = a6;
    v26->_numPrevPredictionCorrect = a7;
    v26->_predictedTimeUntilAnomaly = a8;
    v26->_predictedDuration = a9;
    v26->_confidenceAnomaly = a10;
    v26->_confidenceDuration = a11;
    v26->_confidenceTimeUntilAnomaly = a12;
    v26->_didAnomalyHappen = 0;
    v26->_actualStartTimestamp = 0;
    v26->_actualEndTimestamp = 0;
    v26->_predictionTimestamp = a13;
    v27 = v26;
  }

  return v26;
}

- (unint64_t)predictedStartTimestamp
{
  unint64_t v3 = [(FMTSPrediction *)self predictionTimestamp];
  return v3 + 1000000000 * [(FMTSPrediction *)self predictedTimeUntilAnomaly];
}

- (void)predictedAnomalyStartedAtTimestamp:(unint64_t)a3
{
  self->_didAnomalyHappen = 1;
  self->_actualStartTimestamp = a3;
}

- (void)predictedAnomalyEndedAtTimestamp:(unint64_t)a3
{
  if ([(FMTSPrediction *)self didAnomalyHappen]) {
    self->_actualEndTimestamp = a3;
  }
}

- (int)actualTimeUntilAnomaly
{
  LODWORD(v3) = [(FMTSPrediction *)self didAnomalyHappen];
  if (v3)
  {
    unint64_t v4 = [(FMTSPrediction *)self actualStartTimestamp];
    return (v4 - [(FMTSPrediction *)self predictionTimestamp]) / 0x3B9ACA00;
  }
  return v3;
}

- (int)actualDuration
{
  LODWORD(v3) = [(FMTSPrediction *)self didAnomalyHappen];
  if (v3)
  {
    unint64_t v4 = [(FMTSPrediction *)self actualEndTimestamp];
    return (v4 - [(FMTSPrediction *)self actualStartTimestamp]) / 0x3B9ACA00;
  }
  return v3;
}

- (BOOL)isEqualToPrediction:(id)a3
{
  id v4 = a3;
  if ([(FMTSPrediction *)self conformsToProtocol:&OBJC_PROTOCOL___FMTSPredictionProtocol])
  {
    v5 = self;
    unsigned int v6 = [(FMTSPrediction *)v5 predictedAnomalyType];
    if (v6 == [v4 predictedAnomalyType])
    {
      v7 = [(FMTSPrediction *)v5 predictionSources];
      v8 = [v4 predictionSources];
      unsigned __int8 v9 = [v7 isEqualToSet:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = [(FMTSPrediction *)self predictionTime];
  id v4 = [(FMTSPrediction *)self predictionSources];
  id v23 = [v4 count];
  unint64_t v22 = [(FMTSPrediction *)self numPrevTimesUntilAnomaly];
  unint64_t v5 = [(FMTSPrediction *)self numPrevPredictions];
  unint64_t v6 = [(FMTSPrediction *)self numPrevPredictionCorrect];
  uint64_t v7 = [(FMTSPrediction *)self predictedTimeUntilAnomaly];
  uint64_t v8 = [(FMTSPrediction *)self predictedDuration];
  [(FMTSPrediction *)self confidenceAnomaly];
  uint64_t v10 = v9;
  [(FMTSPrediction *)self confidenceDuration];
  uint64_t v12 = v11;
  [(FMTSPrediction *)self confidenceTimeUntilAnomaly];
  uint64_t v14 = v13;
  unint64_t v15 = [(FMTSPrediction *)self predictionTimestamp];
  unint64_t v16 = [(FMTSPrediction *)self actualStartTimestamp];
  unint64_t v17 = [(FMTSPrediction *)self actualEndTimestamp];
  unsigned int v18 = [(FMTSPrediction *)self didAnomalyHappen];
  CFStringRef v19 = @"NO";
  if (v18) {
    CFStringRef v19 = @"YES";
  }
  v20 = +[NSString stringWithFormat:@"predictionTime %@, # of predictionSources %lu, numPrevTimesUntilAnomaly %lu, numPrevPredictions %lu, numPrevPredictionsCorrect %lu, predictedTimeUntilAnomaly %d, predictedDuration %d, confidenceAnomaly %f, confidenceDuration %f, confidenceTimeUntilAnomaly %f, predictionTimestamp %llu, actualStartTimestamp %llu, actualEndTimestamp %llu, didAnomalyHappen %@", v3, v23, v22, v5, v6, v7, v8, v10, v12, v14, v15, v16, v17, v19];

  return v20;
}

- (NSDate)predictionTime
{
  return self->_predictionTime;
}

- (NSSet)predictionSources
{
  return self->_predictionSources;
}

- (unint64_t)numPrevTimesUntilAnomaly
{
  return self->_numPrevTimesUntilAnomaly;
}

- (unint64_t)numPrevPredictions
{
  return self->_numPrevPredictions;
}

- (unint64_t)numPrevPredictionCorrect
{
  return self->_numPrevPredictionCorrect;
}

- (int)predictedTimeUntilAnomaly
{
  return self->_predictedTimeUntilAnomaly;
}

- (int)predictedDuration
{
  return self->_predictedDuration;
}

- (double)confidenceAnomaly
{
  return self->_confidenceAnomaly;
}

- (double)confidenceDuration
{
  return self->_confidenceDuration;
}

- (double)confidenceTimeUntilAnomaly
{
  return self->_confidenceTimeUntilAnomaly;
}

- (unint64_t)predictionTimestamp
{
  return self->_predictionTimestamp;
}

- (unint64_t)actualStartTimestamp
{
  return self->_actualStartTimestamp;
}

- (unint64_t)actualEndTimestamp
{
  return self->_actualEndTimestamp;
}

- (BOOL)didAnomalyHappen
{
  return self->_didAnomalyHappen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionSources, 0);

  objc_storeStrong((id *)&self->_predictionTime, 0);
}

@end
@interface FMCongestionPrediction
- (BOOL)isFedMobilityPredictionEventSubmitted;
- (FMCongestionPrediction)initWithSeenCount:(int)a3 predictedBadCells:(id)a4 predictedGoodCells:(id)a5 predictedTimeUntilCongestion:(unint64_t)a6 predictedTimeInCongestion:(unint64_t)a7;
- (NSArray)predictedBadCells;
- (NSArray)predictedGoodCells;
- (NSMutableArray)actualBadCells;
- (NSMutableArray)actualGoodCells;
- (id)description;
- (int)seenCount;
- (unint64_t)activatedTimestamp;
- (unint64_t)actualTimeInCongestion;
- (unint64_t)actualTimeUntilCongestion;
- (unint64_t)endTimestamp;
- (unint64_t)predictedTimeInCongestion;
- (unint64_t)predictedTimeUntilCongestion;
- (unint64_t)receivedTimestamp;
- (unsigned)state;
- (void)activate;
- (void)end;
- (void)setIsFedMobilityPredictionEventSubmitted:(BOOL)a3;
@end

@implementation FMCongestionPrediction

- (FMCongestionPrediction)initWithSeenCount:(int)a3 predictedBadCells:(id)a4 predictedGoodCells:(id)a5 predictedTimeUntilCongestion:(unint64_t)a6 predictedTimeInCongestion:(unint64_t)a7
{
  id v13 = a4;
  id v14 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FMCongestionPrediction;
  v15 = [(FMCongestionPrediction *)&v24 init];
  v16 = v15;
  if (v15)
  {
    v15->_seenCount = a3;
    v15->_state = 0;
    objc_storeStrong((id *)&v15->_predictedBadCells, a4);
    objc_storeStrong((id *)&v16->_predictedGoodCells, a5);
    v16->_predictedTimeUntilCongestion = a6;
    v16->_predictedTimeInCongestion = a7;
    __uint64_t v17 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    v16->_isFedMobilityPredictionEventSubmitted = 0;
    v16->_activatedTimestamp = 0;
    v16->_endTimestamp = 0;
    v16->_receivedTimestamp = v17;
    v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actualBadCells = v16->_actualBadCells;
    v16->_actualBadCells = v18;

    v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    actualGoodCells = v16->_actualGoodCells;
    v16->_actualGoodCells = v20;

    v22 = v16;
  }

  return v16;
}

- (void)activate
{
  if (![(FMCongestionPrediction *)self state])
  {
    self->_state = 1;
    self->_activatedTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  }
}

- (void)end
{
  if ([(FMCongestionPrediction *)self state] == 1)
  {
    self->_state = 2;
    self->_endTimestamp = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  }
}

- (unint64_t)actualTimeUntilCongestion
{
  unint64_t v3 = [(FMCongestionPrediction *)self activatedTimestamp];
  unint64_t v4 = [(FMCongestionPrediction *)self receivedTimestamp];
  unsigned int v5 = [(FMCongestionPrediction *)self state];
  unint64_t result = 0;
  if (v5)
  {
    if (v3 >= v4) {
      return (v3 - v4) / 0x3B9ACA00;
    }
  }
  return result;
}

- (unint64_t)actualTimeInCongestion
{
  unint64_t v3 = [(FMCongestionPrediction *)self endTimestamp];
  unint64_t v4 = [(FMCongestionPrediction *)self activatedTimestamp];
  unsigned int v5 = [(FMCongestionPrediction *)self state];
  unint64_t result = 0;
  if (v5 == 2 && v3 >= v4) {
    return (v3 - v4) / 0x3B9ACA00;
  }
  return result;
}

- (id)description
{
  uint64_t v16 = [(FMCongestionPrediction *)self state];
  uint64_t v15 = [(FMCongestionPrediction *)self seenCount];
  unint64_t v3 = [(FMCongestionPrediction *)self predictedBadCells];
  unint64_t v4 = [(FMCongestionPrediction *)self predictedGoodCells];
  unint64_t v5 = [(FMCongestionPrediction *)self predictedTimeUntilCongestion];
  unint64_t v6 = [(FMCongestionPrediction *)self predictedTimeInCongestion];
  unint64_t v7 = [(FMCongestionPrediction *)self receivedTimestamp];
  unint64_t v8 = [(FMCongestionPrediction *)self activatedTimestamp];
  unint64_t v9 = [(FMCongestionPrediction *)self endTimestamp];
  if ([(FMCongestionPrediction *)self isFedMobilityPredictionEventSubmitted]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = [(FMCongestionPrediction *)self actualBadCells];
  v12 = [(FMCongestionPrediction *)self actualGoodCells];
  id v13 = +[NSString stringWithFormat:@"state %u, seenCount %d, predictedBadCells %@, predictedGoodCells %@, predictedTimeUntilCongestion %llu, predictedTimeInCongestion %llu, receivedTimestamp %llu, activatedTimestamp %llu, endTimestamp %llu, isFedMobilityPredictionEventSubmitted %@, actualBadCells %@, actualGoodCells %@", v16, v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return v13;
}

- (int)seenCount
{
  return self->_seenCount;
}

- (NSArray)predictedBadCells
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)predictedGoodCells
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)predictedTimeUntilCongestion
{
  return self->_predictedTimeUntilCongestion;
}

- (unint64_t)predictedTimeInCongestion
{
  return self->_predictedTimeInCongestion;
}

- (unsigned)state
{
  return self->_state;
}

- (unint64_t)receivedTimestamp
{
  return self->_receivedTimestamp;
}

- (unint64_t)activatedTimestamp
{
  return self->_activatedTimestamp;
}

- (unint64_t)endTimestamp
{
  return self->_endTimestamp;
}

- (BOOL)isFedMobilityPredictionEventSubmitted
{
  return self->_isFedMobilityPredictionEventSubmitted;
}

- (void)setIsFedMobilityPredictionEventSubmitted:(BOOL)a3
{
  self->_isFedMobilityPredictionEventSubmitted = a3;
}

- (NSMutableArray)actualBadCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableArray)actualGoodCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualGoodCells, 0);
  objc_storeStrong((id *)&self->_actualBadCells, 0);
  objc_storeStrong((id *)&self->_predictedGoodCells, 0);

  objc_storeStrong((id *)&self->_predictedBadCells, 0);
}

@end
@interface FMTimeSeriesContextState
- (FMTimeSeriesContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4 homePLMN:(id)a5;
- (NSArray)mostRecentPredictions;
- (NSMutableArray)activePredictions;
- (NSMutableArray)cellChanges;
- (NSMutableArray)events;
- (NSMutableDictionary)activeAnomalies;
- (NSNumber)curSignalStrengthBars;
- (NSNumber)subscriptionID;
- (NSString)curRegistrationState;
- (NSString)homePLMN;
- (unint64_t)eventsLastChangedTimestamp;
- (unint64_t)lastPredictionsTimestamp;
- (void)setCellChanges:(id)a3;
- (void)setCurRegistrationState:(id)a3;
- (void)setCurSignalStrengthBars:(id)a3;
- (void)setEventsLastChangedTimestamp:(unint64_t)a3;
- (void)setLastPredictionsTimestamp:(unint64_t)a3;
- (void)setMostRecentPredictions:(id)a3;
@end

@implementation FMTimeSeriesContextState

- (FMTimeSeriesContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4 homePLMN:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)FMTimeSeriesContextState;
  v11 = [(FMContextState *)&v26 initWithStartTime:a3];
  if (v11)
  {
    __uint64_t v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    objc_storeStrong((id *)&v11->_subscriptionID, a4);
    objc_storeStrong((id *)&v11->_homePLMN, a5);
    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    events = v11->_events;
    v11->_events = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    cellChanges = v11->_cellChanges;
    v11->_cellChanges = v15;

    curSignalStrengthBars = v11->_curSignalStrengthBars;
    v11->_curSignalStrengthBars = 0;

    curRegistrationState = v11->_curRegistrationState;
    v11->_curRegistrationState = 0;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    activeAnomalies = v11->_activeAnomalies;
    v11->_activeAnomalies = v19;

    mostRecentPredictions = v11->_mostRecentPredictions;
    v11->_mostRecentPredictions = (NSArray *)&__NSArray0__struct;

    v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activePredictions = v11->_activePredictions;
    v11->_activePredictions = v22;

    [(FMTimeSeriesContextState *)v11 setEventsLastChangedTimestamp:v12];
    [(FMTimeSeriesContextState *)v11 setLastPredictionsTimestamp:v12];
    v24 = v11;
  }

  return v11;
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)homePLMN
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)events
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)cellChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCellChanges:(id)a3
{
}

- (NSNumber)curSignalStrengthBars
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurSignalStrengthBars:(id)a3
{
}

- (NSString)curRegistrationState
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurRegistrationState:(id)a3
{
}

- (NSMutableDictionary)activeAnomalies
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)mostRecentPredictions
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMostRecentPredictions:(id)a3
{
}

- (NSMutableArray)activePredictions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)eventsLastChangedTimestamp
{
  return self->_eventsLastChangedTimestamp;
}

- (void)setEventsLastChangedTimestamp:(unint64_t)a3
{
  self->_eventsLastChangedTimestamp = a3;
}

- (unint64_t)lastPredictionsTimestamp
{
  return self->_lastPredictionsTimestamp;
}

- (void)setLastPredictionsTimestamp:(unint64_t)a3
{
  self->_lastPredictionsTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePredictions, 0);
  objc_storeStrong((id *)&self->_mostRecentPredictions, 0);
  objc_storeStrong((id *)&self->_activeAnomalies, 0);
  objc_storeStrong((id *)&self->_curRegistrationState, 0);
  objc_storeStrong((id *)&self->_curSignalStrengthBars, 0);
  objc_storeStrong((id *)&self->_cellChanges, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_homePLMN, 0);

  objc_storeStrong((id *)&self->_subscriptionID, 0);
}

@end
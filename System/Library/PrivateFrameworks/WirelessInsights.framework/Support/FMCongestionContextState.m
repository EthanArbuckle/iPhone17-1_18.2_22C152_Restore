@interface FMCongestionContextState
- (FMCongestionContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4;
- (NSMutableArray)activeCongestionAreas;
- (NSMutableArray)congestionPredictions;
- (NSMutableArray)prevCells;
- (NSNumber)subscriptionID;
@end

@implementation FMCongestionContextState

- (NSMutableArray)prevCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)congestionPredictions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)activeCongestionAreas
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (FMCongestionContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FMCongestionContextState;
  v8 = [(FMContextState *)&v18 initWithStartTime:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_subscriptionID, a4);
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    prevCells = v9->_prevCells;
    v9->_prevCells = v10;

    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeCongestionAreas = v9->_activeCongestionAreas;
    v9->_activeCongestionAreas = v12;

    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    congestionPredictions = v9->_congestionPredictions;
    v9->_congestionPredictions = v14;

    v16 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_congestionPredictions, 0);
  objc_storeStrong((id *)&self->_activeCongestionAreas, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);

  objc_storeStrong((id *)&self->_prevCells, 0);
}

@end
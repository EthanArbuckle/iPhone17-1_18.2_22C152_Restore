@interface FMOOSContextState
- (FMOOSAreaEntry)oosAreaEntry;
- (FMOOSClientCrowdsourcedPrediction)previousCrowdsourcedOOSInsights;
- (FMOOSClientPrediction)clientPrediction;
- (FMOOSContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4 registrationState:(id)a5;
- (NSMutableArray)prevCells;
- (NSNumber)subscriptionID;
- (NSString)registrationState;
- (unsigned)predictionSuppressionReason;
- (void)setClientPrediction:(id)a3;
- (void)setOosAreaEntry:(id)a3;
- (void)setPredictionSuppressionReason:(unsigned int)a3;
- (void)setPrevCells:(id)a3;
- (void)setPreviousCrowdsourcedOOSInsights:(id)a3;
- (void)setRegistrationState:(id)a3;
- (void)setSubscriptionID:(id)a3;
@end

@implementation FMOOSContextState

- (NSMutableArray)prevCells
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)subscriptionID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (FMOOSAreaEntry)oosAreaEntry
{
  return (FMOOSAreaEntry *)objc_getProperty(self, a2, 48, 1);
}

- (FMOOSClientPrediction)clientPrediction
{
  return (FMOOSClientPrediction *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPredictionSuppressionReason:(unsigned int)a3
{
  self->_predictionSuppressionReason = a3;
}

- (void)setClientPrediction:(id)a3
{
}

- (unsigned)predictionSuppressionReason
{
  return self->_predictionSuppressionReason;
}

- (FMOOSContextState)initWithStartTime:(id)a3 subscriptionID:(id)a4 registrationState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  v12 = 0;
  if (v9 && v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)FMOOSContextState;
    self = [(FMContextState *)&v15 initWithStartTime:v8];
    if (self)
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
      [(FMOOSContextState *)self setPrevCells:v13];

      [(FMOOSContextState *)self setSubscriptionID:v9];
      [(FMOOSContextState *)self setRegistrationState:v11];
      [(FMOOSContextState *)self setOosAreaEntry:0];
      [(FMOOSContextState *)self setClientPrediction:0];
      [(FMOOSContextState *)self setPreviousCrowdsourcedOOSInsights:0];
      [(FMOOSContextState *)self setPredictionSuppressionReason:0];
      self = self;
      v12 = self;
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (void)setPrevCells:(id)a3
{
}

- (void)setSubscriptionID:(id)a3
{
}

- (NSString)registrationState
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRegistrationState:(id)a3
{
}

- (void)setOosAreaEntry:(id)a3
{
}

- (FMOOSClientCrowdsourcedPrediction)previousCrowdsourcedOOSInsights
{
  return (FMOOSClientCrowdsourcedPrediction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPreviousCrowdsourcedOOSInsights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousCrowdsourcedOOSInsights, 0);
  objc_storeStrong((id *)&self->_clientPrediction, 0);
  objc_storeStrong((id *)&self->_oosAreaEntry, 0);
  objc_storeStrong((id *)&self->_registrationState, 0);
  objc_storeStrong((id *)&self->_subscriptionID, 0);

  objc_storeStrong((id *)&self->_prevCells, 0);
}

@end
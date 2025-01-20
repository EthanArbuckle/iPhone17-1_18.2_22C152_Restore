@interface FMOOSAreaEntry
- (FMLocation)curVisit;
- (FMLocation)entryLocation;
- (FMLocation)prevVisit;
- (FMOOSClientPrediction)clientPrediction;
- (NSArray)prevCells;
- (NSDate)timestamp;
- (NSString)registrationState;
- (double)batteryLevel;
- (id)init:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 entryLocation:(id)a6 prevCells:(id)a7 registrationState:(id)a8 batteryLevel:(double)a9 clientPrediction:(id)a10;
@end

@implementation FMOOSAreaEntry

- (id)init:(id)a3 prevVisit:(id)a4 curVisit:(id)a5 entryLocation:(id)a6 prevCells:(id)a7 registrationState:(id)a8 batteryLevel:(double)a9 clientPrediction:(id)a10
{
  id v28 = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v18 = a8;
  id v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)FMOOSAreaEntry;
  v20 = [(FMOOSAreaEntry *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_timestamp, a3);
    objc_storeStrong((id *)&v21->_prevVisit, a4);
    objc_storeStrong((id *)&v21->_curVisit, a5);
    objc_storeStrong((id *)&v21->_entryLocation, a6);
    objc_storeStrong((id *)&v21->_prevCells, a7);
    objc_storeStrong((id *)&v21->_registrationState, a8);
    v21->_batteryLevel = a9;
    objc_storeStrong((id *)&v21->_clientPrediction, a10);
    v22 = v21;
  }

  return v21;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (FMLocation)prevVisit
{
  return (FMLocation *)objc_getProperty(self, a2, 16, 1);
}

- (FMLocation)curVisit
{
  return (FMLocation *)objc_getProperty(self, a2, 24, 1);
}

- (FMLocation)entryLocation
{
  return (FMLocation *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)prevCells
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)registrationState
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (FMOOSClientPrediction)clientPrediction
{
  return (FMOOSClientPrediction *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientPrediction, 0);
  objc_storeStrong((id *)&self->_registrationState, 0);
  objc_storeStrong((id *)&self->_prevCells, 0);
  objc_storeStrong((id *)&self->_entryLocation, 0);
  objc_storeStrong((id *)&self->_curVisit, 0);
  objc_storeStrong((id *)&self->_prevVisit, 0);

  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
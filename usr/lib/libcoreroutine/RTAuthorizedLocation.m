@interface RTAuthorizedLocation
- (RTAuthorizedLocation)initWithLoi:(id)a3 dwellTime:(double)a4 numberOfDaysVisited:(int64_t)a5 ageDaysFirstVisit:(int64_t)a6 ageDaysFirstRegisteredVisit:(int64_t)a7 locationTechnologyAvailability:(unint64_t)a8 visitsWithTechnologyAnnotation:(int64_t)a9 visitsWithGPS:(int64_t)a10 visitsWithWiFiHI:(int64_t)a11;
- (RTLearnedLocationOfInterest)loi;
- (double)dwellTime_s;
- (id)description;
- (int64_t)ageDaysFirstRegisteredVisit;
- (int64_t)ageDaysFirstVisit;
- (int64_t)numberOfDaysVisited;
- (int64_t)rank;
- (int64_t)visitsWithGPS;
- (int64_t)visitsWithTechnologyAnnotation;
- (int64_t)visitsWithWiFiHI;
- (unint64_t)locationTechnologyAvailability;
- (void)setRank:(int64_t)a3;
@end

@implementation RTAuthorizedLocation

- (RTAuthorizedLocation)initWithLoi:(id)a3 dwellTime:(double)a4 numberOfDaysVisited:(int64_t)a5 ageDaysFirstVisit:(int64_t)a6 ageDaysFirstRegisteredVisit:(int64_t)a7 locationTechnologyAvailability:(unint64_t)a8 visitsWithTechnologyAnnotation:(int64_t)a9 visitsWithGPS:(int64_t)a10 visitsWithWiFiHI:(int64_t)a11
{
  id v19 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTAuthorizedLocation;
  v20 = [(RTAuthorizedLocation *)&v23 init];
  v21 = v20;
  if (v20)
  {
    v20->_rank = -1;
    objc_storeStrong((id *)&v20->_loi, a3);
    v21->_dwellTime_s = a4;
    v21->_numberOfDaysVisited = a5;
    v21->_ageDaysFirstVisit = a6;
    v21->_ageDaysFirstRegisteredVisit = a7;
    v21->_locationTechnologyAvailability = a8;
    v21->_visitsWithTechnologyAnnotation = a9;
    v21->_visitsWithGPS = a10;
    v21->_visitsWithWiFiHI = a11;
  }

  return v21;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"RTAuthorizedLocation, rank, %ld, dwellTime_s, %f, numberOfDaysVisited, %ld, ageDaysFirstRegisteredVisit, %d, _ageDaysFirstVisit %d, locationTechnologyAvailability, %08x, visitsWithTechnologyAnnotation, %d, visitsWithGPS, %d, visitsWithWiFiHI, %d, loi, %@.", self->_rank, *(void *)&self->_dwellTime_s, self->_numberOfDaysVisited, self->_ageDaysFirstRegisteredVisit, self->_ageDaysFirstVisit, self->_locationTechnologyAvailability, self->_visitsWithTechnologyAnnotation, self->_visitsWithGPS, self->_visitsWithWiFiHI, self->_loi];
}

- (int64_t)rank
{
  return self->_rank;
}

- (void)setRank:(int64_t)a3
{
  self->_rank = a3;
}

- (RTLearnedLocationOfInterest)loi
{
  return (RTLearnedLocationOfInterest *)objc_getProperty(self, a2, 16, 1);
}

- (double)dwellTime_s
{
  return self->_dwellTime_s;
}

- (int64_t)numberOfDaysVisited
{
  return self->_numberOfDaysVisited;
}

- (int64_t)ageDaysFirstVisit
{
  return self->_ageDaysFirstVisit;
}

- (int64_t)ageDaysFirstRegisteredVisit
{
  return self->_ageDaysFirstRegisteredVisit;
}

- (unint64_t)locationTechnologyAvailability
{
  return self->_locationTechnologyAvailability;
}

- (int64_t)visitsWithTechnologyAnnotation
{
  return self->_visitsWithTechnologyAnnotation;
}

- (int64_t)visitsWithGPS
{
  return self->_visitsWithGPS;
}

- (int64_t)visitsWithWiFiHI
{
  return self->_visitsWithWiFiHI;
}

- (void).cxx_destruct
{
}

@end
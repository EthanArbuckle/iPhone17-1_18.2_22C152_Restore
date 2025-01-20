@interface RAADPDVisit
- (NSArray)peopleCounts;
- (NSArray)peopleDensities;
- (NSArray)proximityEvents;
- (RAADPDVisit)init;
- (RTRoutineManager)routineManager;
- (void)queryPeopleCount;
- (void)queryPeopleDensity:(id)a3;
- (void)queryProximityEvents:(id)a3;
- (void)setPeopleCounts:(id)a3;
- (void)setPeopleDensities:(id)a3;
- (void)setProximityEvents:(id)a3;
- (void)setRoutineManager:(id)a3;
@end

@implementation RAADPDVisit

- (RAADPDVisit)init
{
  if (self)
  {
    v3 = +[RTRoutineManager defaultManager];
    routineManager = self->_routineManager;
    self->_routineManager = v3;

    proximityEvents = self->_proximityEvents;
    self->_proximityEvents = (NSArray *)&__NSArray0__struct;

    peopleCounts = self->_peopleCounts;
    self->_peopleCounts = (NSArray *)&__NSArray0__struct;
  }
  return self;
}

- (void)queryProximityEvents:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000026F0;
  v9[4] = sub_100002700;
  id v10 = &__NSArray0__struct;
  v5 = [(RAADPDVisit *)self routineManager];
  v6 = [v4 entryDate];
  v7 = [v4 exitDate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002708;
  v8[3] = &unk_100004160;
  v8[4] = self;
  v8[5] = v9;
  [v5 fetchProximityHistoryFromStartDate:v6 endDate:v7 completionHandler:v8];

  _Block_object_dispose(v9, 8);
}

- (void)queryPeopleCount
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_1000026F0;
  v10[4] = sub_100002700;
  id v11 = &__NSArray0__struct;
  v3 = [(RAADPDVisit *)self proximityEvents];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = [(RAADPDVisit *)self routineManager];
    v6 = [(RAADPDVisit *)self proximityEvents];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000029A4;
    v9[3] = &unk_100004160;
    v9[4] = self;
    void v9[5] = v10;
    [v5 fetchPeopleCountEventsHistory:v6 completionHandler:v9];
  }
  else
  {
    v7 = sub_1000024A8(&qword_1000082C0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "There were no proximity events, so no query for people count events was executed", v8, 2u);
    }
  }
  _Block_object_dispose(v10, 8);
}

- (void)queryPeopleDensity:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000026F0;
  v9[4] = sub_100002700;
  id v10 = &__NSArray0__struct;
  v5 = [(RAADPDVisit *)self routineManager];
  v6 = [v4 entryDate];
  v7 = [v4 exitDate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002BF4;
  v8[3] = &unk_100004160;
  v8[4] = self;
  v8[5] = v9;
  [v5 fetchPeopleDensityHistoryFromStartDate:v6 endDate:v7 completionHandler:v8];

  _Block_object_dispose(v9, 8);
}

- (NSArray)proximityEvents
{
  return self->_proximityEvents;
}

- (void)setProximityEvents:(id)a3
{
}

- (NSArray)peopleCounts
{
  return self->_peopleCounts;
}

- (void)setPeopleCounts:(id)a3
{
}

- (NSArray)peopleDensities
{
  return self->_peopleDensities;
}

- (void)setPeopleDensities:(id)a3
{
}

- (RTRoutineManager)routineManager
{
  return self->_routineManager;
}

- (void)setRoutineManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_peopleDensities, 0);
  objc_storeStrong((id *)&self->_peopleCounts, 0);

  objc_storeStrong((id *)&self->_proximityEvents, 0);
}

@end
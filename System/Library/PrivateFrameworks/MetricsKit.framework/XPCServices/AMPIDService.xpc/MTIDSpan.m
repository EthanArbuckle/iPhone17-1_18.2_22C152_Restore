@interface MTIDSpan
+ (id)localCalendar;
+ (id)spanForScheme:(id)a3 date:(id)a4 referenceDate:(id)a5;
- (MTIDSpan)initWithScheme:(id)a3 date:(id)a4 referenceDate:(id)a5;
- (NSDate)endDate;
- (NSDate)referenceDate;
- (NSDate)startDate;
- (unint64_t)serialNumber;
- (void)setEndDate:(id)a3;
- (void)setReferenceDate:(id)a3;
- (void)setSerialNumber:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation MTIDSpan

+ (id)spanForScheme:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[MTIDSpan alloc] initWithScheme:v9 date:v8 referenceDate:v7];

  return v10;
}

- (MTIDSpan)initWithScheme:(id)a3 date:(id)a4 referenceDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MTIDSpan;
  v11 = [(MTIDSpan *)&v27 init];
  v12 = v11;
  if (v11)
  {
    [(MTIDSpan *)v11 setReferenceDate:v10];
    if ([v8 rotationSchedule] == (id)1)
    {
      v13 = +[MTIDSpan localCalendar];
      v14 = [v13 components:28 fromDate:v9];
      v15 = [v13 components:28 fromDate:v10];
      v16 = [v13 components:16 fromDateComponents:v15 toDateComponents:v14 options:0];
      v12->_serialNumber = (unint64_t)[v16 day];
      uint64_t v17 = [v13 dateFromComponents:v14];
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v17;

      objc_msgSend(v14, "setDay:", (char *)objc_msgSend(v14, "day") + 1);
      uint64_t v19 = [v13 dateFromComponents:v14];
      endDate = v12->_endDate;
      v12->_endDate = (NSDate *)v19;

LABEL_9:
      goto LABEL_10;
    }
    if ((uint64_t)[v8 lifespan] >= 1)
    {
      if (v10) {
        [v9 timeIntervalSinceDate:v10];
      }
      else {
        [v9 timeIntervalSince1970];
      }
      unint64_t v22 = (unint64_t)(v21 / (double)(uint64_t)[v8 lifespan]);
      v12->_serialNumber = v22;
      uint64_t v23 = objc_msgSend(v10, "dateByAddingTimeInterval:", (double)((unint64_t)objc_msgSend(v8, "lifespan") * v22));
      v24 = v12->_startDate;
      v12->_startDate = (NSDate *)v23;

      uint64_t v25 = -[NSDate dateByAddingTimeInterval:](v12->_startDate, "dateByAddingTimeInterval:", (double)(uint64_t)[v8 lifespan]);
      v13 = v12->_endDate;
      v12->_endDate = (NSDate *)v25;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v12;
}

+ (id)localCalendar
{
  if (qword_1000284E8 != -1) {
    dispatch_once(&qword_1000284E8, &stru_100020A28);
  }
  id v2 = (id)qword_1000284F8;
  objc_sync_enter(v2);
  v3 = +[NSTimeZone localTimeZone];
  if (!qword_1000284F0
    || ([(id)qword_1000284F0 timeZone],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v3 isEqualToTimeZone:v4],
        v4,
        (v5 & 1) == 0))
  {
    id v6 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    id v7 = (void *)qword_1000284F0;
    qword_1000284F0 = (uint64_t)v6;
  }
  objc_sync_exit(v2);

  id v8 = (void *)qword_1000284F0;

  return v8;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unint64_t)a3
{
  self->_serialNumber = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
@interface FMDEventLogger
+ (id)facilityName;
+ (id)sharedLogger;
- (BOOL)shouldLog;
- (FMDEventLogger)init;
- (NSDictionary)facilitiesDictionary;
- (id)loggedEvents;
- (void)logEvent:(id)a3;
- (void)logEvent:(id)a3 toFacilitiesNamed:(id)a4;
- (void)reset;
- (void)setFacilitiesDictionary:(id)a3;
@end

@implementation FMDEventLogger

+ (id)facilityName
{
  return @"DefaultFacility";
}

+ (id)sharedLogger
{
  if (qword_10031E850 != -1) {
    dispatch_once(&qword_10031E850, &stru_1002DAF40);
  }
  v2 = (void *)qword_10031E848;

  return v2;
}

- (FMDEventLogger)init
{
  v13.receiver = self;
  v13.super_class = (Class)FMDEventLogger;
  v2 = [(FMDEventLogger *)&v13 init];
  if (v2)
  {
    v3 = +[FMDEventLoggerFacilityOnDisk facilityName];
    v14[0] = v3;
    v4 = objc_alloc_init(FMDEventLoggerFacilityOnDisk);
    v15[0] = v4;
    v5 = +[FMDEventLoggerFacilityOnDiskStats facilityName];
    v14[1] = v5;
    v6 = objc_alloc_init(FMDEventLoggerFacilityOnDiskStats);
    v15[1] = v6;
    v7 = +[FMDEventLoggerFacilityFMIPServer facilityName];
    v14[2] = v7;
    v8 = objc_alloc_init(FMDEventLoggerFacilityFMIPServer);
    v15[2] = v8;
    v9 = +[FMDEventLoggerFacilityDataPeek facilityName];
    v14[3] = v9;
    v10 = objc_alloc_init(FMDEventLoggerFacilityDataPeek);
    v15[3] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
    [(FMDEventLogger *)v2 setFacilitiesDictionary:v11];
  }
  return v2;
}

- (void)reset
{
  id v3 = [(FMDEventLogger *)self facilitiesDictionary];
  v2 = [v3 allValues];
  [v2 enumerateObjectsUsingBlock:&stru_1002DAF80];
}

- (void)logEvent:(id)a3 toFacilitiesNamed:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FMDEventLogger *)self shouldLog])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100045110;
    v8[3] = &unk_1002DAFA8;
    v8[4] = self;
    id v9 = v6;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

- (void)logEvent:(id)a3
{
  id v4 = a3;
  id v6 = [(FMDEventLogger *)self facilitiesDictionary];
  v5 = [v6 allKeys];
  [(FMDEventLogger *)self logEvent:v4 toFacilitiesNamed:v5];
}

- (id)loggedEvents
{
  return &__NSArray0__struct;
}

- (BOOL)shouldLog
{
  v2 = +[FMSystemInfo sharedInstance];
  unsigned __int8 v3 = [v2 isInternalBuild];

  return v3;
}

- (NSDictionary)facilitiesDictionary
{
  return self->_facilitiesDictionary;
}

- (void)setFacilitiesDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface RAPRecordManagerTrafficIncidentReportSaver
+ (id)sharedInstance;
+ (int64_t)creationPreference;
- (RAPRecordManagerTrafficIncidentReportSaver)init;
- (void)incidentsStorageManagerDidAddReport:(id)a3;
@end

@implementation RAPRecordManagerTrafficIncidentReportSaver

- (RAPRecordManagerTrafficIncidentReportSaver)init
{
  v5.receiver = self;
  v5.super_class = (Class)RAPRecordManagerTrafficIncidentReportSaver;
  v2 = [(RAPRecordManagerTrafficIncidentReportSaver *)&v5 init];
  if (v2)
  {
    v3 = +[TrafficIncidentsStorageManager sharedInstance];
    [v3 addObserver:v2];
  }
  return v2;
}

+ (int64_t)creationPreference
{
  return 1;
}

+ (id)sharedInstance
{
  if (qword_10160FA80 != -1) {
    dispatch_once(&qword_10160FA80, &stru_1012F9A90);
  }
  v2 = (void *)qword_10160FA78;

  return v2;
}

- (void)incidentsStorageManagerDidAddReport:(id)a3
{
}

@end
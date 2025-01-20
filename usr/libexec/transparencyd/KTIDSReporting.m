@interface KTIDSReporting
- (IDSEventReportingManager)manager;
- (KTIDSReporting)init;
- (void)reportResultWithSuccess:(id)a3 startFrom:(double)a4 completionHandler:(id)a5;
- (void)setManager:(id)a3;
@end

@implementation KTIDSReporting

- (KTIDSReporting)init
{
  v6.receiver = self;
  v6.super_class = (Class)KTIDSReporting;
  v2 = [(KTIDSReporting *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)IDSEventReportingManager);
    [(KTIDSReporting *)v2 setManager:v3];

    v4 = v2;
  }

  return v2;
}

- (void)reportResultWithSuccess:(id)a3 startFrom:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v20[0] = a3;
  v19[0] = @"status";
  v19[1] = @"startFrom";
  id v9 = a3;
  v10 = +[NSNumber numberWithLong:(uint64_t)a4];
  v19[2] = @"interval";
  v20[1] = v10;
  v20[2] = &off_1002D9BA0;
  v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  id v12 = objc_alloc((Class)IDSReportClientEvent);
  v13 = +[NSNumber numberWithInt:30];
  id v14 = [v12 initWithReport:v11 reportType:@"kt-reliability" timeout:v13];

  v15 = [(KTIDSReporting *)self manager];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000DF5C;
  v17[3] = &unk_1002B73B0;
  id v18 = v8;
  id v16 = v8;
  [v15 reportClientEvent:v14 withCompletion:v17];
}

- (IDSEventReportingManager)manager
{
  return (IDSEventReportingManager *)objc_getProperty(self, a2, 8, 1);
}

- (void)setManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
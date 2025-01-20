@interface FedStatsCohortQueryDeviceType
+ (id)cohortInstance;
- (FedStatsCohortQueryDeviceType)initWithDeviceType:(id)a3;
- (NSString)deviceType;
- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4;
- (void)setDeviceType:(id)a3;
@end

@implementation FedStatsCohortQueryDeviceType

- (FedStatsCohortQueryDeviceType)initWithDeviceType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FedStatsCohortQueryDeviceType;
  v6 = [(FedStatsCohortQueryDeviceType *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceType, a3);
  }

  return v7;
}

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  return [(FedStatsCohortQueryDeviceType *)self deviceType];
}

+ (id)cohortInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ED74;
  block[3] = &unk_1000305F8;
  block[4] = a1;
  if (qword_10003DD48 != -1) {
    dispatch_once(&qword_10003DD48, block);
  }
  v2 = (void *)qword_10003DD40;
  return v2;
}

- (NSString)deviceType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
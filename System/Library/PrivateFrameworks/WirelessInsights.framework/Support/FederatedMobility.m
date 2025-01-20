@interface FederatedMobility
+ (id)getSharedInstance;
- (FMCongestionModel)fmCongestionModel;
- (FMCoreData)fmCoreData;
- (FMOOSModel)fmOosModel;
- (FMTimeSeriesModel)fmTimeSeriesModel;
- (FederatedMobility)init;
- (dispatch_queue_s)queue;
- (void)dealloc;
- (void)initializeWithConfig:(id)a3;
- (void)setFmCongestionModel:(id)a3;
- (void)setFmCoreData:(id)a3;
- (void)setFmOosModel:(id)a3;
- (void)setFmTimeSeriesModel:(id)a3;
- (void)setQueue:(dispatch_queue_s *)a3;
@end

@implementation FederatedMobility

+ (id)getSharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B05D4;
  block[3] = &unk_1001B5ED8;
  block[4] = a1;
  if (qword_1001D7E58 != -1) {
    dispatch_once(&qword_1001D7E58, block);
  }
  v2 = (void *)qword_1001D7E50;

  return v2;
}

- (FederatedMobility)init
{
  v5.receiver = self;
  v5.super_class = (Class)FederatedMobility;
  v2 = [(FederatedMobility *)&v5 init];
  if (!v2)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001484C8();
    }
    goto LABEL_8;
  }
  [(FederatedMobility *)v2 setQueue:dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility", 0)];
  if (![(FederatedMobility *)v2 queue])
  {
LABEL_8:
    v3 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001484FC();
  }
  v3 = v2;
LABEL_9:

  return v3;
}

- (void)initializeWithConfig:(id)a3
{
  id v4 = a3;
  if (capabilities::abs::supportsBasebandInsights((capabilities::abs *)v4))
  {
    objc_super v5 = [(FederatedMobility *)self queue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000B07CC;
    v6[3] = &unk_1001B7948;
    v6[4] = self;
    id v7 = v4;
    dispatch_async((dispatch_queue_t)v5, v6);
  }
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_100148668();
  }
  if ([(FederatedMobility *)self queue]) {
    dispatch_release((dispatch_object_t)[(FederatedMobility *)self queue]);
  }
  v3.receiver = self;
  v3.super_class = (Class)FederatedMobility;
  [(FederatedMobility *)&v3 dealloc];
}

- (FMCoreData)fmCoreData
{
  return (FMCoreData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFmCoreData:(id)a3
{
}

- (FMOOSModel)fmOosModel
{
  return (FMOOSModel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFmOosModel:(id)a3
{
}

- (FMCongestionModel)fmCongestionModel
{
  return (FMCongestionModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFmCongestionModel:(id)a3
{
}

- (FMTimeSeriesModel)fmTimeSeriesModel
{
  return (FMTimeSeriesModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFmTimeSeriesModel:(id)a3
{
}

- (dispatch_queue_s)queue
{
  return self->_queue;
}

- (void)setQueue:(dispatch_queue_s *)a3
{
  self->_queue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmTimeSeriesModel, 0);
  objc_storeStrong((id *)&self->_fmCongestionModel, 0);
  objc_storeStrong((id *)&self->_fmOosModel, 0);

  objc_storeStrong((id *)&self->_fmCoreData, 0);
}

@end
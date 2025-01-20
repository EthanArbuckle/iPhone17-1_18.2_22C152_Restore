@interface TSDgPTPFDEtEPort
- (TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4;
- (TSDgPTPPortStatistics)statistics;
- (id)_statistics;
- (void)setStatistics:(id)a3;
- (void)updateProperties;
@end

@implementation TSDgPTPFDEtEPort

- (TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TSDgPTPFDEtEPort;
  v4 = [(TSDgPTPNetworkPort *)&v9 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(TSDgPTPFDEtEPort *)v4 _statistics];
    statistics = v5->_statistics;
    v5->_statistics = (TSDgPTPPortStatistics *)v6;
  }
  return v5;
}

- (void)updateProperties
{
  v8.receiver = self;
  v8.super_class = (Class)TSDgPTPFDEtEPort;
  [(TSDgPTPNetworkPort *)&v8 updateProperties];
  v3 = [(TSDgPTPFDEtEPort *)self _statistics];
  v4 = [(TSDgPTPPort *)self propertyUpdateQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013500;
  v6[3] = &unk_10003C610;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (id)_statistics
{
  v2 = [[TSDgPTPPortStatistics alloc] initWithPort:self];

  return v2;
}

- (TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
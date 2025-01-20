@interface _TSF_TSDgPTPFDEtEPort
- (_TSF_TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4;
- (_TSF_TSDgPTPPortStatistics)statistics;
- (id)_statistics;
- (void)setStatistics:(id)a3;
- (void)updateProperties;
@end

@implementation _TSF_TSDgPTPFDEtEPort

- (_TSF_TSDgPTPFDEtEPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPFDEtEPort;
  v4 = [(_TSF_TSDgPTPNetworkPort *)&v9 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(_TSF_TSDgPTPFDEtEPort *)v4 _statistics];
    statistics = v5->_statistics;
    v5->_statistics = (_TSF_TSDgPTPPortStatistics *)v6;
  }
  return v5;
}

- (void)updateProperties
{
  v8.receiver = self;
  v8.super_class = (Class)_TSF_TSDgPTPFDEtEPort;
  [(_TSF_TSDgPTPNetworkPort *)&v8 updateProperties];
  v3 = [(_TSF_TSDgPTPFDEtEPort *)self _statistics];
  v4 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41___TSF_TSDgPTPFDEtEPort_updateProperties__block_invoke;
  v6[3] = &unk_1E622AAB0;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

- (id)_statistics
{
  v2 = [[_TSF_TSDgPTPPortStatistics alloc] initWithPort:self];
  return v2;
}

- (_TSF_TSDgPTPPortStatistics)statistics
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
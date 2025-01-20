@interface _TSF_TSDgPTPFDPtPPort
- (BOOL)_measuringPDelay;
- (BOOL)_multipleRemotes;
- (BOOL)measuringPDelay;
- (BOOL)multipleRemotes;
- (_TSF_TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4;
- (_TSF_TSDgPTPPortStatistics)statistics;
- (char)_localPDelayLogMeanInterval;
- (char)_remotePDelayLogMeanInterval;
- (char)localPDelayLogMeanInterval;
- (char)remotePDelayLogMeanInterval;
- (id)_statistics;
- (void)setLocalPDelayLogMeanInterval:(char)a3;
- (void)setMeasuringPDelay:(BOOL)a3;
- (void)setMultipleRemotes:(BOOL)a3;
- (void)setRemotePDelayLogMeanInterval:(char)a3;
- (void)setStatistics:(id)a3;
- (void)updateProperties;
@end

@implementation _TSF_TSDgPTPFDPtPPort

- (_TSF_TSDgPTPFDPtPPort)initWithService:(id)a3 pid:(int)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_TSF_TSDgPTPFDPtPPort;
  v4 = [(_TSF_TSDgPTPNetworkPort *)&v9 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(_TSF_TSDgPTPFDPtPPort *)v4 _statistics];
    statistics = v5->_statistics;
    v5->_statistics = (_TSF_TSDgPTPPortStatistics *)v6;

    v5->_localPDelayLogMeanInterval = [(_TSF_TSDgPTPFDPtPPort *)v5 _localPDelayLogMeanInterval];
    v5->_remotePDelayLogMeanInterval = [(_TSF_TSDgPTPFDPtPPort *)v5 _remotePDelayLogMeanInterval];
    v5->_multipleRemotes = [(_TSF_TSDgPTPFDPtPPort *)v5 _multipleRemotes];
    v5->_measuringPDelay = [(_TSF_TSDgPTPFDPtPPort *)v5 _measuringPDelay];
  }
  return v5;
}

- (void)updateProperties
{
  v16.receiver = self;
  v16.super_class = (Class)_TSF_TSDgPTPFDPtPPort;
  [(_TSF_TSDgPTPNetworkPort *)&v16 updateProperties];
  v3 = [(_TSF_TSDgPTPFDPtPPort *)self _statistics];
  char v4 = [(_TSF_TSDgPTPFDPtPPort *)self _localPDelayLogMeanInterval];
  char v5 = [(_TSF_TSDgPTPFDPtPPort *)self _remotePDelayLogMeanInterval];
  BOOL v6 = [(_TSF_TSDgPTPFDPtPPort *)self _multipleRemotes];
  BOOL v7 = [(_TSF_TSDgPTPFDPtPPort *)self _measuringPDelay];
  v8 = [(_TSF_TSDgPTPPort *)self propertyUpdateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___TSF_TSDgPTPFDPtPPort_updateProperties__block_invoke;
  block[3] = &unk_1E622AC60;
  char v12 = v4;
  char v13 = v5;
  BOOL v14 = v6;
  BOOL v15 = v7;
  block[4] = self;
  id v11 = v3;
  id v9 = v3;
  dispatch_async(v8, block);
}

- (id)_statistics
{
  v2 = [[_TSF_TSDgPTPPortStatistics alloc] initWithPort:self];
  return v2;
}

- (char)_localPDelayLogMeanInterval
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalPDelayLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (char)_remotePDelayLogMeanInterval
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"RemotePDelayLogMeanInterval"];

  if (v3) {
    char v4 = [v3 charValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_multipleRemotes
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"MultipleRemotes"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)_measuringPDelay
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"MeasuringPDelay"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (_TSF_TSDgPTPPortStatistics)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (char)localPDelayLogMeanInterval
{
  return self->_localPDelayLogMeanInterval;
}

- (void)setLocalPDelayLogMeanInterval:(char)a3
{
  self->_localPDelayLogMeanInterval = a3;
}

- (char)remotePDelayLogMeanInterval
{
  return self->_remotePDelayLogMeanInterval;
}

- (void)setRemotePDelayLogMeanInterval:(char)a3
{
  self->_remotePDelayLogMeanInterval = a3;
}

- (BOOL)multipleRemotes
{
  return self->_multipleRemotes;
}

- (void)setMultipleRemotes:(BOOL)a3
{
  self->_multipleRemotes = a3;
}

- (BOOL)measuringPDelay
{
  return self->_measuringPDelay;
}

- (void)setMeasuringPDelay:(BOOL)a3
{
  self->_measuringPDelay = a3;
}

- (void).cxx_destruct
{
}

@end
@interface TSDClockMetrics
- (TSDClockMetrics)initWithClock:(id)a3;
- (TSDClockMetrics)initWithInterfaceMetrics:(id *)a3;
- (id)getDelta:(id)a3;
- (unint64_t)clockIdentity;
- (unint64_t)coreAudioReanchors;
- (unint64_t)gmChangesCount;
- (unint64_t)timeToChangeGm;
- (unint64_t)timeToLock;
- (void)setClockIdentity:(unint64_t)a3;
- (void)setCoreAudioReanchors:(unint64_t)a3;
- (void)setGmChangesCount:(unint64_t)a3;
- (void)setTimeToChangeGm:(unint64_t)a3;
- (void)setTimeToLock:(unint64_t)a3;
@end

@implementation TSDClockMetrics

- (TSDClockMetrics)initWithClock:(id)a3
{
  id v4 = a3;
  v5 = +[TSDgPTPClock iokitMatchingDictionaryForClockIdentifier:](TSDgPTPClock, "iokitMatchingDictionaryForClockIdentifier:", [v4 clockIdentity]);
  v6 = +[IOKService matchingService:v5];

  v7 = [v6 iodProperties];
  id v8 = [v4 clockIdentity];

  self->_clockIdentity = (unint64_t)v8;
  v9 = [v7 objectForKeyedSubscript:@"GrandmasterChangesCounter"];
  if (v9)
  {
    v10 = [v7 objectForKeyedSubscript:@"GrandmasterChangesCounter"];
    self->_gmChangesCount = [v10 unsignedIntValue];
  }
  else
  {
    self->_gmChangesCount = 0;
  }

  v11 = [v7 objectForKeyedSubscript:@"TimeToChangeGrandmaster"];
  if (v11)
  {
    v12 = [v7 objectForKeyedSubscript:@"TimeToChangeGrandmaster"];
    self->_timeToChangeGm = (unint64_t)[v12 unsignedLongLongValue];
  }
  else
  {
    self->_timeToChangeGm = 0;
  }

  v13 = [v7 objectForKeyedSubscript:@"TimeToLock"];
  if (v13)
  {
    v14 = [v7 objectForKeyedSubscript:@"TimeToLock"];
    self->_timeToLock = (unint64_t)[v14 unsignedLongLongValue];
  }
  else
  {
    self->_timeToLock = 0;
  }

  v15 = [v7 objectForKeyedSubscript:@"CoreAudioReanchors"];
  if (v15)
  {
    v16 = [v7 objectForKeyedSubscript:@"CoreAudioReanchors"];
    self->_coreAudioReanchors = [v16 unsignedIntValue];
  }
  else
  {
    self->_coreAudioReanchors = 0;
  }

  return self;
}

- (TSDClockMetrics)initWithInterfaceMetrics:(id *)a3
{
  self->_clockIdentity = a3->var0;
  long long v3 = *(_OWORD *)&a3->var3;
  *(_OWORD *)&self->_gmChangesCount = *(_OWORD *)&a3->var1;
  *(_OWORD *)&self->_timeToLock = v3;
  return self;
}

- (id)getDelta:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(TSDClockMetrics);
  [(TSDClockMetrics *)v5 setClockIdentity:self->_clockIdentity];
  -[TSDClockMetrics setGmChangesCount:](v5, "setGmChangesCount:", self->_gmChangesCount - (void)[v4 gmChangesCount]);
  unint64_t coreAudioReanchors = self->_coreAudioReanchors;
  id v7 = [v4 coreAudioReanchors];

  [(TSDClockMetrics *)v5 setCoreAudioReanchors:coreAudioReanchors - (void)v7];

  return v5;
}

- (unint64_t)clockIdentity
{
  return self->_clockIdentity;
}

- (void)setClockIdentity:(unint64_t)a3
{
  self->_clockIdentity = a3;
}

- (unint64_t)gmChangesCount
{
  return self->_gmChangesCount;
}

- (void)setGmChangesCount:(unint64_t)a3
{
  self->_gmChangesCount = a3;
}

- (unint64_t)timeToChangeGm
{
  return self->_timeToChangeGm;
}

- (void)setTimeToChangeGm:(unint64_t)a3
{
  self->_timeToChangeGm = a3;
}

- (unint64_t)timeToLock
{
  return self->_timeToLock;
}

- (void)setTimeToLock:(unint64_t)a3
{
  self->_timeToLock = a3;
}

- (unint64_t)coreAudioReanchors
{
  return self->_coreAudioReanchors;
}

- (void)setCoreAudioReanchors:(unint64_t)a3
{
  self->_unint64_t coreAudioReanchors = a3;
}

@end
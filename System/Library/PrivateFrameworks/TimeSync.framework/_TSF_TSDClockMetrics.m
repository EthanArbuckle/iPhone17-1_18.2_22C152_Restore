@interface _TSF_TSDClockMetrics
- (_TSF_TSDClockMetrics)initWithClock:(id)a3;
- (_TSF_TSDClockMetrics)initWithInterfaceMetrics:(id *)a3;
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

@implementation _TSF_TSDClockMetrics

- (_TSF_TSDClockMetrics)initWithClock:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F6EC30];
  id v5 = a3;
  v6 = +[_TSF_TSDgPTPClock iokitMatchingDictionaryForClockIdentifier:](_TSF_TSDgPTPClock, "iokitMatchingDictionaryForClockIdentifier:", [v5 clockIdentity]);
  v7 = [v4 matchingService:v6];

  v8 = [v7 iodProperties];
  unint64_t v9 = [v5 clockIdentity];

  self->_clockIdentity = v9;
  v10 = [v8 objectForKeyedSubscript:@"GrandmasterChangesCounter"];
  if (v10)
  {
    v11 = [v8 objectForKeyedSubscript:@"GrandmasterChangesCounter"];
    self->_gmChangesCount = [v11 unsignedIntValue];
  }
  else
  {
    self->_gmChangesCount = 0;
  }

  v12 = [v8 objectForKeyedSubscript:@"TimeToChangeGrandmaster"];
  if (v12)
  {
    v13 = [v8 objectForKeyedSubscript:@"TimeToChangeGrandmaster"];
    self->_timeToChangeGm = [v13 unsignedLongLongValue];
  }
  else
  {
    self->_timeToChangeGm = 0;
  }

  v14 = [v8 objectForKeyedSubscript:@"TimeToLock"];
  if (v14)
  {
    v15 = [v8 objectForKeyedSubscript:@"TimeToLock"];
    self->_timeToLock = [v15 unsignedLongLongValue];
  }
  else
  {
    self->_timeToLock = 0;
  }

  v16 = [v8 objectForKeyedSubscript:@"CoreAudioReanchors"];
  if (v16)
  {
    v17 = [v8 objectForKeyedSubscript:@"CoreAudioReanchors"];
    self->_coreAudioReanchors = [v17 unsignedIntValue];
  }
  else
  {
    self->_coreAudioReanchors = 0;
  }

  return self;
}

- (_TSF_TSDClockMetrics)initWithInterfaceMetrics:(id *)a3
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
  id v5 = objc_alloc_init(_TSF_TSDClockMetrics);
  [(_TSF_TSDClockMetrics *)v5 setClockIdentity:self->_clockIdentity];
  -[_TSF_TSDClockMetrics setGmChangesCount:](v5, "setGmChangesCount:", self->_gmChangesCount - [v4 gmChangesCount]);
  unint64_t coreAudioReanchors = self->_coreAudioReanchors;
  uint64_t v7 = [v4 coreAudioReanchors];

  [(_TSF_TSDClockMetrics *)v5 setCoreAudioReanchors:coreAudioReanchors - v7];
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
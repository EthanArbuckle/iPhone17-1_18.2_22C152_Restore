@interface PeerTracking
- (BOOL)readingMultiConfigCharacteristics;
- (CBPeripheral)peripheral;
- (NSMutableSet)cachedConfigCharacteristics;
- (NSMutableSet)listeners;
- (NSMutableSet)resultConfigCharacteristics;
- (PeerTracking)init;
- (double)initTime;
- (double)timeOfLatestConnectionState;
- (int)numCharacteristicsLeftToRead;
- (unsigned)connectionState;
- (void)cacheCharacteristics;
- (void)changeConnectionState:(unsigned __int8)a3;
- (void)setCachedConfigCharacteristics:(id)a3;
- (void)setConnectionState:(unsigned __int8)a3;
- (void)setInitTime:(double)a3;
- (void)setListeners:(id)a3;
- (void)setNumCharacteristicsLeftToRead:(int)a3;
- (void)setPeripheral:(id)a3;
- (void)setReadingMultiConfigCharacteristics:(BOOL)a3;
- (void)setResultConfigCharacteristics:(id)a3;
- (void)setTimeOfLatestConnectionState:(double)a3;
@end

@implementation PeerTracking

- (PeerTracking)init
{
  v10.receiver = self;
  v10.super_class = (Class)PeerTracking;
  v2 = [(PeerTracking *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    listeners = v2->_listeners;
    v2->_listeners = (NSMutableSet *)v3;

    v2->_connectionState = 0;
    v2->_initTime = sub_100006C38();
    v2->_timeOfLatestConnectionState = sub_100006C38();
    uint64_t v5 = objc_opt_new();
    resultConfigCharacteristics = v2->_resultConfigCharacteristics;
    v2->_resultConfigCharacteristics = (NSMutableSet *)v5;

    uint64_t v7 = objc_opt_new();
    cachedConfigCharacteristics = v2->_cachedConfigCharacteristics;
    v2->_cachedConfigCharacteristics = (NSMutableSet *)v7;

    v2->_numCharacteristicsLeftToRead = 0;
    v2->_readingMultiConfigCharacteristics = 0;
  }
  return v2;
}

- (void)changeConnectionState:(unsigned __int8)a3
{
  if (self->_connectionState != a3)
  {
    self->_connectionState = a3;
    self->_timeOfLatestConnectionState = sub_100006C38();
  }
}

- (void)cacheCharacteristics
{
  [(NSMutableSet *)self->_cachedConfigCharacteristics unionSet:self->_resultConfigCharacteristics];
  resultConfigCharacteristics = self->_resultConfigCharacteristics;

  [(NSMutableSet *)resultConfigCharacteristics removeAllObjects];
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (void)setListeners:(id)a3
{
}

- (unsigned)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(unsigned __int8)a3
{
  self->_connectionState = a3;
}

- (double)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(double)a3
{
  self->_initTime = a3;
}

- (double)timeOfLatestConnectionState
{
  return self->_timeOfLatestConnectionState;
}

- (void)setTimeOfLatestConnectionState:(double)a3
{
  self->_timeOfLatestConnectionState = a3;
}

- (int)numCharacteristicsLeftToRead
{
  return self->_numCharacteristicsLeftToRead;
}

- (void)setNumCharacteristicsLeftToRead:(int)a3
{
  self->_numCharacteristicsLeftToRead = a3;
}

- (BOOL)readingMultiConfigCharacteristics
{
  return self->_readingMultiConfigCharacteristics;
}

- (void)setReadingMultiConfigCharacteristics:(BOOL)a3
{
  self->_readingMultiConfigCharacteristics = a3;
}

- (NSMutableSet)resultConfigCharacteristics
{
  return self->_resultConfigCharacteristics;
}

- (void)setResultConfigCharacteristics:(id)a3
{
}

- (NSMutableSet)cachedConfigCharacteristics
{
  return self->_cachedConfigCharacteristics;
}

- (void)setCachedConfigCharacteristics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfigCharacteristics, 0);
  objc_storeStrong((id *)&self->_resultConfigCharacteristics, 0);
  objc_storeStrong((id *)&self->_listeners, 0);

  objc_storeStrong((id *)&self->_peripheral, 0);
}

@end
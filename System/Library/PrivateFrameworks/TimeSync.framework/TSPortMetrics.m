@interface TSPortMetrics
- (TSPortMetrics)initWithDaemonMetrics:(id)a3;
- (TSPortMetrics)initWithInterfaceMetrics:(id *)a3;
- (id)toDaemonMetrics;
- (unint64_t)discardedDelayLimitExceededMeasurements;
- (unint64_t)discardedDelayLimitExceededPercentage;
- (unint64_t)discardedOutOfBoundsMeasurements;
- (unint64_t)discardedOutOfBoundsPercentage;
- (unint64_t)discardedPpmLimitMeasurements;
- (unint64_t)discardedPpmLimitPercentage;
- (unint64_t)discardedTimestampsOutOfOrderMeasurements;
- (unint64_t)discardedTimestampsOutOfOrderPercentage;
- (unint64_t)droppedMeasurements;
- (unint64_t)droppedPercentage;
- (unint64_t)filterResetsDroppedLimit;
- (unint64_t)filterResetsOutOfBounds;
- (unint64_t)meanDelayTime;
- (unint64_t)successfulMeasurements;
- (unint64_t)successfulPercentage;
- (unint64_t)syncTimeouts;
- (unint64_t)totalMeasurements;
- (unsigned)portNumber;
- (void)printMetrics;
@end

@implementation TSPortMetrics

- (TSPortMetrics)initWithDaemonMetrics:(id)a3
{
  id v4 = a3;
  self->_portNumber = [v4 portNumber];
  self->_syncTimeouts = [v4 syncTimeouts];
  self->_filterResetsDroppedLimit = [v4 filterResetsDroppedLimit];
  self->_filterResetsOutOfBounds = [v4 filterResetsOutOfBounds];
  self->_meanDelayTime = [v4 meanDelayTime];
  self->_droppedMeasurements = [v4 droppedMeasurements];
  self->_discardedPpmLimitMeasurements = [v4 discardedPpmLimitMeasurements];
  self->_discardedDelayLimitExceededMeasurements = [v4 discardedDelayLimitExceededMeasurements];
  self->_discardedOutOfBoundsMeasurements = [v4 discardedOutOfBoundsMeasurements];
  self->_discardedTimestampsOutOfOrderMeasurements = [v4 discardedTimestampsOutOfOrderMeasurements];
  self->_successfulMeasurements = [v4 successfulMeasurements];
  self->_totalMeasurements = [v4 totalMeasurements];
  self->_droppedPercentage = [v4 droppedPercentage];
  self->_discardedPpmLimitPercentage = [v4 discardedPpmLimitPercentage];
  self->_discardedDelayLimitExceededPercentage = [v4 discardedDelayLimitExceededPercentage];
  self->_discardedOutOfBoundsPercentage = [v4 discardedOutOfBoundsPercentage];
  self->_discardedTimestampsOutOfOrderPercentage = [v4 discardedTimestampsOutOfOrderPercentage];
  unint64_t v5 = [v4 successfulPercentage];

  self->_successfulPercentage = v5;
  return self;
}

- (id)toDaemonMetrics
{
  v3 = [_TSF_TSDPortMetrics alloc];
  [(_TSF_TSDPortMetrics *)v3 setPortNumber:self->_portNumber];
  [(_TSF_TSDPortMetrics *)v3 setSyncTimeouts:self->_syncTimeouts];
  [(_TSF_TSDPortMetrics *)v3 setFilterResetsDroppedLimit:self->_filterResetsDroppedLimit];
  [(_TSF_TSDPortMetrics *)v3 setFilterResetsOutOfBounds:self->_filterResetsOutOfBounds];
  [(_TSF_TSDPortMetrics *)v3 setMeanDelayTime:self->_meanDelayTime];
  [(_TSF_TSDPortMetrics *)v3 setDroppedMeasurements:self->_droppedMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedPpmLimitMeasurements:self->_discardedPpmLimitMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedDelayLimitExceededMeasurements:self->_discardedDelayLimitExceededMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedOutOfBoundsMeasurements:self->_discardedOutOfBoundsMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedTimestampsOutOfOrderMeasurements:self->_discardedTimestampsOutOfOrderMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setSuccessfulMeasurements:self->_successfulMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setTotalMeasurements:self->_totalMeasurements];
  [(_TSF_TSDPortMetrics *)v3 setDroppedPercentage:self->_droppedPercentage];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedPpmLimitPercentage:self->_discardedPpmLimitPercentage];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedDelayLimitExceededPercentage:self->_discardedDelayLimitExceededPercentage];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedOutOfBoundsPercentage:self->_discardedOutOfBoundsPercentage];
  [(_TSF_TSDPortMetrics *)v3 setDiscardedTimestampsOutOfOrderPercentage:self->_discardedTimestampsOutOfOrderPercentage];
  [(_TSF_TSDPortMetrics *)v3 setSuccessfulPercentage:self->_successfulPercentage];
  return v3;
}

- (TSPortMetrics)initWithInterfaceMetrics:(id *)a3
{
  self->_portNumber = a3->var0;
  long long v3 = *(_OWORD *)((char *)&a3->var2 + 2);
  *(_OWORD *)&self->_syncTimeouts = *(_OWORD *)(&a3->var0 + 1);
  *(_OWORD *)&self->_filterResetsOutOfBounds = v3;
  long long v4 = *(_OWORD *)((char *)&a3->var6 + 2);
  *(_OWORD *)&self->_droppedMeasurements = *(_OWORD *)((char *)&a3->var4 + 2);
  *(_OWORD *)&self->_discardedDelayLimitExceededMeasurements = v4;
  long long v5 = *(_OWORD *)((char *)&a3->var10 + 2);
  *(_OWORD *)&self->_discardedTimestampsOutOfOrderMeasurements = *(_OWORD *)((char *)&a3->var8 + 2);
  *(_OWORD *)&self->_totalMeasurements = v5;
  long long v6 = *(_OWORD *)((char *)&a3->var14 + 2);
  *(_OWORD *)&self->_discardedPpmLimitPercentage = *(_OWORD *)((char *)&a3->var12 + 2);
  *(_OWORD *)&self->_discardedOutOfBoundsPercentage = v6;
  self->_successfulPercentage = *(unint64_t *)((char *)&a3->var16 + 2);
  return self;
}

- (void)printMetrics
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int portNumber = self->_portNumber;
    int v21 = 67109120;
    LODWORD(v22) = portNumber;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Port = %u\n", (uint8_t *)&v21, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t syncTimeouts = self->_syncTimeouts;
    int v21 = 134217984;
    unint64_t v22 = syncTimeouts;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Sync Timeouts = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t filterResetsDroppedLimit = self->_filterResetsDroppedLimit;
    int v21 = 134217984;
    unint64_t v22 = filterResetsDroppedLimit;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Filter Resets (Dropped Limit) = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t filterResetsOutOfBounds = self->_filterResetsOutOfBounds;
    int v21 = 134217984;
    unint64_t v22 = filterResetsOutOfBounds;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Filter Resets (Out Of Bounds) = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t meanDelayTime = self->_meanDelayTime;
    int v21 = 134217984;
    unint64_t v22 = meanDelayTime;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Mean Delay Time = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t droppedMeasurements = self->_droppedMeasurements;
    int v21 = 134217984;
    unint64_t v22 = droppedMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Dropped Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedPpmLimitMeasurements = self->_discardedPpmLimitMeasurements;
    int v21 = 134217984;
    unint64_t v22 = discardedPpmLimitMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded PPM Limit Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedDelayLimitExceededMeasurements = self->_discardedDelayLimitExceededMeasurements;
    int v21 = 134217984;
    unint64_t v22 = discardedDelayLimitExceededMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Delay Limit Exceeded Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedOutOfBoundsMeasurements = self->_discardedOutOfBoundsMeasurements;
    int v21 = 134217984;
    unint64_t v22 = discardedOutOfBoundsMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Out Of Bounds Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedTimestampsOutOfOrderMeasurements = self->_discardedTimestampsOutOfOrderMeasurements;
    int v21 = 134217984;
    unint64_t v22 = discardedTimestampsOutOfOrderMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Timestamps Out Of Order Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t successfulMeasurements = self->_successfulMeasurements;
    int v21 = 134217984;
    unint64_t v22 = successfulMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Successful Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t totalMeasurements = self->_totalMeasurements;
    int v21 = 134217984;
    unint64_t v22 = totalMeasurements;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Total Measurements = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t droppedPercentage = self->_droppedPercentage;
    int v21 = 134217984;
    unint64_t v22 = droppedPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Dropped Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedPpmLimitPercentage = self->_discardedPpmLimitPercentage;
    int v21 = 134217984;
    unint64_t v22 = discardedPpmLimitPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded PPM Limit Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedDelayLimitExceededPercentage = self->_discardedDelayLimitExceededPercentage;
    int v21 = 134217984;
    unint64_t v22 = discardedDelayLimitExceededPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Delay Limit Exceeded Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedOutOfBoundsPercentage = self->_discardedOutOfBoundsPercentage;
    int v21 = 134217984;
    unint64_t v22 = discardedOutOfBoundsPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Out Of Bounds Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t discardedTimestampsOutOfOrderPercentage = self->_discardedTimestampsOutOfOrderPercentage;
    int v21 = 134217984;
    unint64_t v22 = discardedTimestampsOutOfOrderPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Discarded Timestamps Out Of Order Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    unint64_t successfulPercentage = self->_successfulPercentage;
    int v21 = 134217984;
    unint64_t v22 = successfulPercentage;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "  Successful Percentage = %zu\n", (uint8_t *)&v21, 0xCu);
  }
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (unint64_t)syncTimeouts
{
  return self->_syncTimeouts;
}

- (unint64_t)filterResetsDroppedLimit
{
  return self->_filterResetsDroppedLimit;
}

- (unint64_t)filterResetsOutOfBounds
{
  return self->_filterResetsOutOfBounds;
}

- (unint64_t)meanDelayTime
{
  return self->_meanDelayTime;
}

- (unint64_t)droppedMeasurements
{
  return self->_droppedMeasurements;
}

- (unint64_t)discardedPpmLimitMeasurements
{
  return self->_discardedPpmLimitMeasurements;
}

- (unint64_t)discardedDelayLimitExceededMeasurements
{
  return self->_discardedDelayLimitExceededMeasurements;
}

- (unint64_t)discardedOutOfBoundsMeasurements
{
  return self->_discardedOutOfBoundsMeasurements;
}

- (unint64_t)discardedTimestampsOutOfOrderMeasurements
{
  return self->_discardedTimestampsOutOfOrderMeasurements;
}

- (unint64_t)successfulMeasurements
{
  return self->_successfulMeasurements;
}

- (unint64_t)totalMeasurements
{
  return self->_totalMeasurements;
}

- (unint64_t)droppedPercentage
{
  return self->_droppedPercentage;
}

- (unint64_t)discardedPpmLimitPercentage
{
  return self->_discardedPpmLimitPercentage;
}

- (unint64_t)discardedDelayLimitExceededPercentage
{
  return self->_discardedDelayLimitExceededPercentage;
}

- (unint64_t)discardedOutOfBoundsPercentage
{
  return self->_discardedOutOfBoundsPercentage;
}

- (unint64_t)discardedTimestampsOutOfOrderPercentage
{
  return self->_discardedTimestampsOutOfOrderPercentage;
}

- (unint64_t)successfulPercentage
{
  return self->_successfulPercentage;
}

@end
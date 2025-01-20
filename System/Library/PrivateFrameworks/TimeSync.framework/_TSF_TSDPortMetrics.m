@interface _TSF_TSDPortMetrics
- (_TSF_TSDPortMetrics)initWithPort:(id)a3;
- (id)getDelta:(id)a3;
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
- (void)calculatePercentages;
- (void)setDiscardedDelayLimitExceededMeasurements:(unint64_t)a3;
- (void)setDiscardedDelayLimitExceededPercentage:(unint64_t)a3;
- (void)setDiscardedOutOfBoundsMeasurements:(unint64_t)a3;
- (void)setDiscardedOutOfBoundsPercentage:(unint64_t)a3;
- (void)setDiscardedPpmLimitMeasurements:(unint64_t)a3;
- (void)setDiscardedPpmLimitPercentage:(unint64_t)a3;
- (void)setDiscardedTimestampsOutOfOrderMeasurements:(unint64_t)a3;
- (void)setDiscardedTimestampsOutOfOrderPercentage:(unint64_t)a3;
- (void)setDroppedMeasurements:(unint64_t)a3;
- (void)setDroppedPercentage:(unint64_t)a3;
- (void)setFilterResetsDroppedLimit:(unint64_t)a3;
- (void)setFilterResetsOutOfBounds:(unint64_t)a3;
- (void)setMeanDelayTime:(unint64_t)a3;
- (void)setPortNumber:(unsigned __int16)a3;
- (void)setSuccessfulMeasurements:(unint64_t)a3;
- (void)setSuccessfulPercentage:(unint64_t)a3;
- (void)setSyncTimeouts:(unint64_t)a3;
- (void)setTotalMeasurements:(unint64_t)a3;
@end

@implementation _TSF_TSDPortMetrics

- (void)calculatePercentages
{
  unint64_t totalMeasurements = self->_totalMeasurements;
  if (totalMeasurements)
  {
    unint64_t v3 = 100 * self->_droppedMeasurements / totalMeasurements;
    unint64_t v4 = 100 * self->_discardedPpmLimitMeasurements / totalMeasurements;
    unint64_t v5 = 100 * self->_discardedDelayLimitExceededMeasurements / totalMeasurements;
    unint64_t v6 = 100 * self->_discardedOutOfBoundsMeasurements / totalMeasurements;
    unint64_t v7 = 100 * self->_discardedTimestampsOutOfOrderMeasurements / totalMeasurements;
    unint64_t totalMeasurements = 100 * self->_successfulMeasurements / totalMeasurements;
  }
  else
  {
    unint64_t v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = 0;
    unint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  self->_droppedPercentage = v3;
  self->_discardedPpmLimitPercentage = v4;
  self->_discardedDelayLimitExceededPercentage = v5;
  self->_discardedOutOfBoundsPercentage = v6;
  self->_discardedTimestampsOutOfOrderPercentage = v7;
  self->_successfulPercentage = totalMeasurements;
}

- (_TSF_TSDPortMetrics)initWithPort:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_port, a3);
  unint64_t v6 = [(_TSF_TSDgPTPPort *)self->_port service];
  unint64_t v7 = [v6 iodProperties];

  self->_portNumber = [v5 portNumber];
  v8 = [v7 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"];
  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:@"SyncReceiptTimeoutCounter"];
    self->_syncTimeouts = [v9 unsignedIntValue];
  }
  else
  {
    self->_syncTimeouts = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetDroppedLimitCounter"];
    if (v10)
    {
      v11 = [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetDroppedLimitCounter"];
      self->_filterResetsDroppedLimit = [v11 unsignedIntValue];
    }
    else
    {
      self->_filterResetsDroppedLimit = 0;
    }

    v12 = [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetOutOfBoundsCounter"];
    if (v12)
    {
      v13 = [v7 objectForKeyedSubscript:@"SyncMeasurementFilterResetOutOfBoundsCounter"];
      self->_filterResetsOutOfBounds = [v13 unsignedIntValue];
    }
    else
    {
      self->_filterResetsOutOfBounds = 0;
    }

    v14 = [v7 objectForKeyedSubscript:@"LinkPropagationMeanDelay"];
    if (v14)
    {
      v15 = [v7 objectForKeyedSubscript:@"LinkPropagationMeanDelay"];
      self->_meanDelayTime = [v15 unsignedIntValue];
    }
    else
    {
      self->_meanDelayTime = 0;
    }

    v16 = [v7 objectForKeyedSubscript:@"SyncMeasurementDroppedCounter"];
    if (v16)
    {
      v17 = [v7 objectForKeyedSubscript:@"SyncMeasurementDroppedCounter"];
      self->_droppedMeasurements = [v17 unsignedIntValue];
    }
    else
    {
      self->_droppedMeasurements = 0;
    }

    v18 = [v7 objectForKeyedSubscript:@"RawDelayMeasurementCounter"];
    if (v18)
    {
      v19 = [v7 objectForKeyedSubscript:@"RawDelayMeasurementCounter"];
      uint64_t v20 = [v19 unsignedIntValue];
    }
    else
    {
      uint64_t v20 = 0;
    }

    self->_unint64_t totalMeasurements = self->_droppedMeasurements + v20;
    v21 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardPPMLimitCounter"];
    if (v21)
    {
      v22 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardPPMLimitCounter"];
      self->_discardedPpmLimitMeasurements = [v22 unsignedIntValue];
    }
    else
    {
      self->_discardedPpmLimitMeasurements = 0;
    }

    v23 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardDelayLimitExceededCounter"];
    if (v23)
    {
      v24 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardDelayLimitExceededCounter"];
      self->_discardedDelayLimitExceededMeasurements = [v24 unsignedIntValue];
    }
    else
    {
      self->_discardedDelayLimitExceededMeasurements = 0;
    }

    v25 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardOutOfBoundsCounter"];
    if (v25)
    {
      v26 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardOutOfBoundsCounter"];
      self->_discardedOutOfBoundsMeasurements = [v26 unsignedIntValue];
    }
    else
    {
      self->_discardedOutOfBoundsMeasurements = 0;
    }

    v27 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardTimestampsOutOfOrderCounter"];
    if (v27)
    {
      v28 = [v7 objectForKeyedSubscript:@"SyncMeasurementDiscardTimestampsOutOfOrderCounter"];
      self->_discardedTimestampsOutOfOrderMeasurements = [v28 unsignedIntValue];
    }
    else
    {
      self->_discardedTimestampsOutOfOrderMeasurements = 0;
    }

    v29 = [v7 objectForKeyedSubscript:@"SyncMeasurementSuccessCounter"];
    if (v29)
    {
      v30 = [v7 objectForKeyedSubscript:@"SyncMeasurementSuccessCounter"];
      self->_successfulMeasurements = [v30 unsignedIntValue];
    }
    else
    {
      self->_successfulMeasurements = 0;
    }

    [(_TSF_TSDPortMetrics *)self calculatePercentages];
  }

  return self;
}

- (id)getDelta:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(_TSF_TSDPortMetrics);
  [(_TSF_TSDPortMetrics *)v5 setPortNumber:self->_portNumber];
  -[_TSF_TSDPortMetrics setSyncTimeouts:](v5, "setSyncTimeouts:", self->_syncTimeouts - [v4 syncTimeouts]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[_TSF_TSDPortMetrics setFilterResetsDroppedLimit:](v5, "setFilterResetsDroppedLimit:", self->_filterResetsDroppedLimit - [v4 filterResetsDroppedLimit]);
    -[_TSF_TSDPortMetrics setFilterResetsOutOfBounds:](v5, "setFilterResetsOutOfBounds:", self->_filterResetsOutOfBounds - [v4 filterResetsOutOfBounds]);
    -[_TSF_TSDPortMetrics setDroppedMeasurements:](v5, "setDroppedMeasurements:", self->_droppedMeasurements - [v4 droppedMeasurements]);
    -[_TSF_TSDPortMetrics setDiscardedPpmLimitMeasurements:](v5, "setDiscardedPpmLimitMeasurements:", self->_discardedPpmLimitMeasurements - [v4 discardedPpmLimitMeasurements]);
    -[_TSF_TSDPortMetrics setDiscardedDelayLimitExceededMeasurements:](v5, "setDiscardedDelayLimitExceededMeasurements:", self->_discardedDelayLimitExceededMeasurements - [v4 discardedDelayLimitExceededMeasurements]);
    -[_TSF_TSDPortMetrics setDiscardedOutOfBoundsMeasurements:](v5, "setDiscardedOutOfBoundsMeasurements:", self->_discardedOutOfBoundsMeasurements - [v4 discardedOutOfBoundsMeasurements]);
    -[_TSF_TSDPortMetrics setDiscardedTimestampsOutOfOrderMeasurements:](v5, "setDiscardedTimestampsOutOfOrderMeasurements:", self->_discardedTimestampsOutOfOrderMeasurements - [v4 discardedTimestampsOutOfOrderMeasurements]);
    -[_TSF_TSDPortMetrics setSuccessfulMeasurements:](v5, "setSuccessfulMeasurements:", self->_successfulMeasurements - [v4 successfulMeasurements]);
    -[_TSF_TSDPortMetrics setTotalMeasurements:](v5, "setTotalMeasurements:", self->_totalMeasurements - [v4 totalMeasurements]);
    [(_TSF_TSDPortMetrics *)v5 calculatePercentages];
  }

  return v5;
}

- (unsigned)portNumber
{
  return self->_portNumber;
}

- (void)setPortNumber:(unsigned __int16)a3
{
  self->_portNumber = a3;
}

- (unint64_t)syncTimeouts
{
  return self->_syncTimeouts;
}

- (void)setSyncTimeouts:(unint64_t)a3
{
  self->_syncTimeouts = a3;
}

- (unint64_t)filterResetsDroppedLimit
{
  return self->_filterResetsDroppedLimit;
}

- (void)setFilterResetsDroppedLimit:(unint64_t)a3
{
  self->_filterResetsDroppedLimit = a3;
}

- (unint64_t)filterResetsOutOfBounds
{
  return self->_filterResetsOutOfBounds;
}

- (void)setFilterResetsOutOfBounds:(unint64_t)a3
{
  self->_filterResetsOutOfBounds = a3;
}

- (unint64_t)meanDelayTime
{
  return self->_meanDelayTime;
}

- (void)setMeanDelayTime:(unint64_t)a3
{
  self->_meanDelayTime = a3;
}

- (unint64_t)droppedMeasurements
{
  return self->_droppedMeasurements;
}

- (void)setDroppedMeasurements:(unint64_t)a3
{
  self->_droppedMeasurements = a3;
}

- (unint64_t)discardedPpmLimitMeasurements
{
  return self->_discardedPpmLimitMeasurements;
}

- (void)setDiscardedPpmLimitMeasurements:(unint64_t)a3
{
  self->_discardedPpmLimitMeasurements = a3;
}

- (unint64_t)discardedDelayLimitExceededMeasurements
{
  return self->_discardedDelayLimitExceededMeasurements;
}

- (void)setDiscardedDelayLimitExceededMeasurements:(unint64_t)a3
{
  self->_discardedDelayLimitExceededMeasurements = a3;
}

- (unint64_t)discardedOutOfBoundsMeasurements
{
  return self->_discardedOutOfBoundsMeasurements;
}

- (void)setDiscardedOutOfBoundsMeasurements:(unint64_t)a3
{
  self->_discardedOutOfBoundsMeasurements = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderMeasurements
{
  return self->_discardedTimestampsOutOfOrderMeasurements;
}

- (void)setDiscardedTimestampsOutOfOrderMeasurements:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderMeasurements = a3;
}

- (unint64_t)successfulMeasurements
{
  return self->_successfulMeasurements;
}

- (void)setSuccessfulMeasurements:(unint64_t)a3
{
  self->_successfulMeasurements = a3;
}

- (unint64_t)totalMeasurements
{
  return self->_totalMeasurements;
}

- (void)setTotalMeasurements:(unint64_t)a3
{
  self->_unint64_t totalMeasurements = a3;
}

- (unint64_t)droppedPercentage
{
  return self->_droppedPercentage;
}

- (void)setDroppedPercentage:(unint64_t)a3
{
  self->_droppedPercentage = a3;
}

- (unint64_t)discardedPpmLimitPercentage
{
  return self->_discardedPpmLimitPercentage;
}

- (void)setDiscardedPpmLimitPercentage:(unint64_t)a3
{
  self->_discardedPpmLimitPercentage = a3;
}

- (unint64_t)discardedDelayLimitExceededPercentage
{
  return self->_discardedDelayLimitExceededPercentage;
}

- (void)setDiscardedDelayLimitExceededPercentage:(unint64_t)a3
{
  self->_discardedDelayLimitExceededPercentage = a3;
}

- (unint64_t)discardedOutOfBoundsPercentage
{
  return self->_discardedOutOfBoundsPercentage;
}

- (void)setDiscardedOutOfBoundsPercentage:(unint64_t)a3
{
  self->_discardedOutOfBoundsPercentage = a3;
}

- (unint64_t)discardedTimestampsOutOfOrderPercentage
{
  return self->_discardedTimestampsOutOfOrderPercentage;
}

- (void)setDiscardedTimestampsOutOfOrderPercentage:(unint64_t)a3
{
  self->_discardedTimestampsOutOfOrderPercentage = a3;
}

- (unint64_t)successfulPercentage
{
  return self->_successfulPercentage;
}

- (void)setSuccessfulPercentage:(unint64_t)a3
{
  self->_successfulPercentage = a3;
}

- (void).cxx_destruct
{
}

@end
@interface AntBlockPowerLimitGnssImdAggressorPolicy
- (AntBlockPowerLimitGnssImdAggressorPolicy)init;
- (NSMutableArray)mBandPolicy;
- (unsigned)mCellularBand;
- (unsigned)mCellularBandwidthKHz;
- (unsigned)mCellularCoexTech;
- (unsigned)mCellularFrequencyKHz;
- (void)addPolicy:(id)a3;
- (void)extractPolicy:(id)a3;
- (void)setMBandPolicy:(id)a3;
- (void)setMCellularBand:(unsigned int)a3;
- (void)setMCellularBandwidthKHz:(unsigned int)a3;
- (void)setMCellularCoexTech:(unsigned int)a3;
- (void)setMCellularFrequencyKHz:(unsigned int)a3;
- (void)setParameter:(unsigned int)a3 CellularBand:(unsigned int)a4 CellFreq:(unsigned int)a5 CellBW:(unsigned int)a6;
@end

@implementation AntBlockPowerLimitGnssImdAggressorPolicy

- (AntBlockPowerLimitGnssImdAggressorPolicy)init
{
  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitGnssImdAggressorPolicy;
  v2 = [(AntBlockPowerLimitGnssImdAggressorPolicy *)&v6 init];
  *(void *)&v2->_mCellularCoexTech = 0;
  *(void *)&v2->_mCellularFrequencyKHz = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mBandPolicy = v2->_mBandPolicy;
  v2->_mBandPolicy = v3;

  return v2;
}

- (void)setParameter:(unsigned int)a3 CellularBand:(unsigned int)a4 CellFreq:(unsigned int)a5 CellBW:(unsigned int)a6
{
  self->_mCellularCoexTech = a3;
  self->_mCellularBand = a4;
  self->_mCellularFrequencyKHz = a5;
  self->_mCellularBandwidthKHz = a6;
}

- (void)extractPolicy:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_super v6 = [v4 objectForKey:@"Coex_Tech"];
    id v7 = [v6 integerValue];
    v8 = [v5 objectForKey:@"Cellular_Band"];
    id v9 = [v8 integerValue];
    v10 = [v5 objectForKey:@"Cellular_Center_Frequency_KHz"];
    id v11 = [v10 integerValue];
    v12 = [v5 objectForKey:@"Cellular_Bandwidth_KHz"];
    -[AntBlockPowerLimitGnssImdAggressorPolicy setParameter:CellularBand:CellFreq:CellBW:](self, "setParameter:CellularBand:CellFreq:CellBW:", v7, v9, v11, [v12 integerValue]);

    v26 = v5;
    id obj = [v5 objectForKey:@"Band_Policy"];
    if (obj)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v29)
      {
        uint64_t v28 = *(void *)v31;
        do
        {
          v13 = 0;
          do
          {
            v14 = self;
            if (*(void *)v31 != v28) {
              objc_enumerationMutation(obj);
            }
            v15 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v13);
            v16 = objc_alloc_init(AntBlockPowerLimitGnssImdBandPolicy);
            v17 = [v15 objectForKey:@"Enable"];
            id v18 = [v17 BOOLValue];
            v19 = [v15 objectForKey:@"Cellular_Ant_Bitmap"];
            id v20 = [v19 integerValue];
            v21 = [v15 objectForKey:@"Mitigation_Type"];
            id v22 = [v21 integerValue];
            v23 = [v15 objectForKey:@"Cellular_TX_Power_Cap"];
            [v23 doubleValue];
            LODWORD(v25) = vcvtd_n_s64_f64(v24, 4uLL);
            [(AntBlockPowerLimitGnssImdBandPolicy *)v16 setParameterEnable:v18 CellularAntBitmap:v20 MitigationType:v22 CellularTxPowerCap:v25];

            self = v14;
            [(AntBlockPowerLimitGnssImdAggressorPolicy *)v14 addPolicy:v16];

            v13 = (char *)v13 + 1;
          }
          while (v29 != v13);
          id v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v29);
      }
    }

    v5 = v26;
  }
}

- (void)addPolicy:(id)a3
{
  if (a3)
  {
    mBandPolicy = self->_mBandPolicy;
    if (mBandPolicy) {
      -[NSMutableArray addObject:](mBandPolicy, "addObject:");
    }
  }
}

- (unsigned)mCellularCoexTech
{
  return self->_mCellularCoexTech;
}

- (void)setMCellularCoexTech:(unsigned int)a3
{
  self->_mCellularCoexTech = a3;
}

- (unsigned)mCellularBand
{
  return self->_mCellularBand;
}

- (void)setMCellularBand:(unsigned int)a3
{
  self->_mCellularBand = a3;
}

- (unsigned)mCellularFrequencyKHz
{
  return self->_mCellularFrequencyKHz;
}

- (void)setMCellularFrequencyKHz:(unsigned int)a3
{
  self->_mCellularFrequencyKHz = a3;
}

- (unsigned)mCellularBandwidthKHz
{
  return self->_mCellularBandwidthKHz;
}

- (void)setMCellularBandwidthKHz:(unsigned int)a3
{
  self->_mCellularBandwidthKHz = a3;
}

- (NSMutableArray)mBandPolicy
{
  return self->_mBandPolicy;
}

- (void)setMBandPolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
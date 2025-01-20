@interface BiasEstimatorFeatures
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3;
- (BiasEstimatorFeatures)initWithCoder:(id)a3;
- (NSArray)cirPacket1;
- (NSArray)cirPacket2;
- (double)firstPathIndexPacket1;
- (double)firstPathIndexPacket2;
- (double)leadingEdgePacket1;
- (double)leadingEdgePacket2;
- (double)rssiDbm;
- (double)rttInitiator;
- (double)rttResponder;
- (double)soiRssiDbm;
- (double)tatInitiator;
- (double)tatResponder;
- (double)timestamp;
- (double)toaNoiseRms;
- (double)toaPpwinPeak;
- (double)toaPpwinRms;
- (double)tofPicSecond;
- (double)uwbTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)populateOrderedInputFeature;
- (int)antennaMask;
- (int)rxAntennaPacket1;
- (int)rxAntennaPacket2;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAntennaMask:(int)a3;
- (void)setCirPacket1:(id)a3;
- (void)setCirPacket2:(id)a3;
- (void)setFirstPathIndexPacket1:(double)a3;
- (void)setFirstPathIndexPacket2:(double)a3;
- (void)setLeadingEdgePacket1:(double)a3;
- (void)setLeadingEdgePacket2:(double)a3;
- (void)setRssiDbm:(double)a3;
- (void)setRttInitiator:(double)a3;
- (void)setRttResponder:(double)a3;
- (void)setRxAntennaPacket1:(int)a3;
- (void)setRxAntennaPacket2:(int)a3;
- (void)setSoiRssiDbm:(double)a3;
- (void)setTatInitiator:(double)a3;
- (void)setTatResponder:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setToaNoiseRms:(double)a3;
- (void)setToaPpwinPeak:(double)a3;
- (void)setToaPpwinRms:(double)a3;
- (void)setTofPicSecond:(double)a3;
- (void)setUwbTime:(double)a3;
@end

@implementation BiasEstimatorFeatures

- (BiasEstimatorFeatures)initWithBiasEstimatorFeatures:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v30 = +[NSAssertionHandler currentHandler];
    [v30 handleFailureInMethod:a2, self, @"UWBSignalFeatures.mm", 43, @"Invalid parameter not satisfying: %@", @"features" object file lineNumber description];
  }
  v31.receiver = self;
  v31.super_class = (Class)BiasEstimatorFeatures;
  v6 = [(BiasEstimatorFeatures *)&v31 init];
  if (v6)
  {
    v6->_antennaMask = [v5 antennaMask];
    [v5 uwbTime];
    v6->_uwbTime = v7;
    [v5 timestamp];
    v6->_timestamp = v8;
    [v5 tofPicSecond];
    v6->_tofPicSecond = v9;
    [v5 rssiDbm];
    v6->_rssiDbm = v10;
    [v5 soiRssiDbm];
    v6->_soiRssiDbm = v11;
    [v5 toaNoiseRms];
    v6->_toaNoiseRms = v12;
    [v5 toaPpwinRms];
    v6->_toaPpwinRms = v13;
    [v5 toaPpwinPeak];
    v6->_toaPpwinPeak = v14;
    [v5 rttInitiator];
    v6->_rttInitiator = v15;
    [v5 tatInitiator];
    v6->_tatInitiator = v16;
    [v5 rttResponder];
    v6->_rttResponder = v17;
    [v5 tatResponder];
    v6->_tatResponder = v18;
    v19 = [v5 cirPacket1];
    v20 = (NSArray *)[v19 copy];
    cirPacket1 = v6->_cirPacket1;
    v6->_cirPacket1 = v20;

    [v5 leadingEdgePacket1];
    v6->_leadingEdgePacket1 = v22;
    [v5 firstPathIndexPacket1];
    v6->_firstPathIndexPacket1 = v23;
    v6->_rxAntennaPacket1 = [v5 rxAntennaPacket1];
    v24 = [v5 cirPacket2];
    v25 = (NSArray *)[v24 copy];
    cirPacket2 = v6->_cirPacket2;
    v6->_cirPacket2 = v25;

    [v5 leadingEdgePacket2];
    v6->_leadingEdgePacket2 = v27;
    [v5 firstPathIndexPacket2];
    v6->_firstPathIndexPacket2 = v28;
    v6->_rxAntennaPacket2 = [v5 rxAntennaPacket2];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_antennaMask forKey:@"antennaMask"];
  [v4 encodeDouble:@"uwbTime" forKey:self->_uwbTime];
  [v4 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v4 encodeDouble:@"tofPicSecond" forKey:self->_tofPicSecond];
  [v4 encodeDouble:@"rssiDbm" forKey:self->_rssiDbm];
  [v4 encodeDouble:@"soiRssiDbm" forKey:self->_soiRssiDbm];
  [v4 encodeDouble:@"toaNoiseRms" forKey:self->_toaNoiseRms];
  [v4 encodeDouble:@"toaPpwinRms" forKey:self->_toaPpwinRms];
  [v4 encodeDouble:@"toaPpwinPeak" forKey:self->_toaPpwinPeak];
  [v4 encodeDouble:@"rttInitiator" forKey:self->_rttInitiator];
  [v4 encodeDouble:@"tatInitiator" forKey:self->_tatInitiator];
  [v4 encodeDouble:@"rttResponder" forKey:self->_rttResponder];
  [v4 encodeDouble:@"tatResponder" forKey:self->_tatResponder];
  [v4 encodeObject:self->_cirPacket1 forKey:@"cirPacket1"];
  [v4 encodeDouble:@"leadingEdgePacket1" forKey:self->_leadingEdgePacket1];
  [v4 encodeDouble:@"firstPathIndexPacket1" forKey:self->_firstPathIndexPacket1];
  [v4 encodeInt:self->_rxAntennaPacket1 forKey:@"rxAntennaPacket1"];
  [v4 encodeObject:self->_cirPacket2 forKey:@"cirPacket2"];
  [v4 encodeDouble:@"leadingEdgePacket2" forKey:self->_leadingEdgePacket2];
  [v4 encodeDouble:@"firstPathIndexPacket2" forKey:self->_firstPathIndexPacket2];
  [v4 encodeInt:self->_rxAntennaPacket2 forKey:@"rxAntennaPacket2"];
}

- (BiasEstimatorFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeIntForKey:@"antennaMask"];
  [v4 decodeDoubleForKey:@"uwbTime"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"timestamp"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"tofPicSecond"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"soiRssiDbm"];
  double v44 = v12;
  [v4 decodeDoubleForKey:@"rssiDbm"];
  double v14 = v13;
  [v4 decodeDoubleForKey:@"toaNoiseRms"];
  double v43 = v15;
  [v4 decodeDoubleForKey:@"toaPpwinRms"];
  double v42 = v16;
  [v4 decodeDoubleForKey:@"toaPpwinPeak"];
  double v41 = v17;
  [v4 decodeDoubleForKey:@"rttInitiator"];
  double v40 = v18;
  [v4 decodeDoubleForKey:@"tatInitiator"];
  double v39 = v19;
  [v4 decodeDoubleForKey:@"rttResponder"];
  double v38 = v20;
  [v4 decodeDoubleForKey:@"tatResponder"];
  double v37 = v21;
  double v22 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"cirPacket1"];
  [v4 decodeDoubleForKey:@"leadingEdgePacket1"];
  double v24 = v23;
  [v4 decodeDoubleForKey:@"firstPathIndexPacket1"];
  double v26 = v25;
  id v27 = [v4 decodeIntForKey:@"rxAntennaPacket1"];
  double v28 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"cirPacket2"];
  [v4 decodeDoubleForKey:@"leadingEdgePacket2"];
  double v30 = v29;
  [v4 decodeDoubleForKey:@"firstPathIndexPacket2"];
  double v32 = v31;
  id v33 = [v4 decodeIntForKey:@"rxAntennaPacket2"];
  v45.receiver = self;
  v45.super_class = (Class)BiasEstimatorFeatures;
  v34 = [(BiasEstimatorFeatures *)&v45 init];
  v35 = v34;
  if (v34)
  {
    [(BiasEstimatorFeatures *)v34 setAntennaMask:v5];
    [(BiasEstimatorFeatures *)v35 setUwbTime:v7];
    [(BiasEstimatorFeatures *)v35 setTimestamp:v9];
    [(BiasEstimatorFeatures *)v35 setTofPicSecond:v11];
    [(BiasEstimatorFeatures *)v35 setRssiDbm:v14];
    [(BiasEstimatorFeatures *)v35 setSoiRssiDbm:v44];
    [(BiasEstimatorFeatures *)v35 setToaNoiseRms:v43];
    [(BiasEstimatorFeatures *)v35 setToaPpwinRms:v42];
    [(BiasEstimatorFeatures *)v35 setToaPpwinPeak:v41];
    [(BiasEstimatorFeatures *)v35 setRttInitiator:v40];
    [(BiasEstimatorFeatures *)v35 setTatInitiator:v39];
    [(BiasEstimatorFeatures *)v35 setRttResponder:v38];
    [(BiasEstimatorFeatures *)v35 setTatResponder:v37];
    [(BiasEstimatorFeatures *)v35 setCirPacket1:v22];
    [(BiasEstimatorFeatures *)v35 setLeadingEdgePacket1:v24];
    [(BiasEstimatorFeatures *)v35 setFirstPathIndexPacket1:v26];
    [(BiasEstimatorFeatures *)v35 setRxAntennaPacket1:v27];
    [(BiasEstimatorFeatures *)v35 setCirPacket2:v28];
    [(BiasEstimatorFeatures *)v35 setLeadingEdgePacket2:v30];
    [(BiasEstimatorFeatures *)v35 setFirstPathIndexPacket2:v32];
    [(BiasEstimatorFeatures *)v35 setRxAntennaPacket2:v33];
  }

  return v35;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];

  return [v4 initWithBiasEstimatorFeatures:self];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (BiasEstimatorFeatures *)v4;
    double v6 = v5;
    if (v5 == self)
    {
      BOOL v56 = 1;
LABEL_36:

      goto LABEL_37;
    }
    int antennaMask = self->_antennaMask;
    unsigned int v8 = [(BiasEstimatorFeatures *)v5 antennaMask];
    double uwbTime = self->_uwbTime;
    [(BiasEstimatorFeatures *)v6 uwbTime];
    double v11 = v10;
    double timestamp = self->_timestamp;
    [(BiasEstimatorFeatures *)v6 timestamp];
    double v14 = v13;
    double rssiDbm = self->_rssiDbm;
    [(BiasEstimatorFeatures *)v6 rssiDbm];
    double v17 = v16;
    double soiRssiDbm = self->_soiRssiDbm;
    [(BiasEstimatorFeatures *)v6 soiRssiDbm];
    double v20 = v19;
    double tofPicSecond = self->_tofPicSecond;
    [(BiasEstimatorFeatures *)v6 tofPicSecond];
    double v80 = v21;
    double toaNoiseRms = self->_toaNoiseRms;
    [(BiasEstimatorFeatures *)v6 toaNoiseRms];
    double v78 = v22;
    double toaPpwinRms = self->_toaPpwinRms;
    [(BiasEstimatorFeatures *)v6 toaPpwinRms];
    double v76 = v23;
    double toaPpwinPeak = self->_toaPpwinPeak;
    [(BiasEstimatorFeatures *)v6 toaPpwinPeak];
    double v74 = v24;
    double rttInitiator = self->_rttInitiator;
    [(BiasEstimatorFeatures *)v6 rttInitiator];
    double v72 = v25;
    double tatInitiator = self->_tatInitiator;
    [(BiasEstimatorFeatures *)v6 tatInitiator];
    double v70 = v26;
    double rttResponder = self->_rttResponder;
    [(BiasEstimatorFeatures *)v6 rttResponder];
    double v68 = v27;
    double tatResponder = self->_tatResponder;
    [(BiasEstimatorFeatures *)v6 tatResponder];
    double v66 = v28;
    cirPacket1 = self->_cirPacket1;
    if (!cirPacket1)
    {
      double v30 = [(BiasEstimatorFeatures *)v6 cirPacket1];

      if (!v30)
      {
        char v33 = 0;
LABEL_7:
        double leadingEdgePacket1 = self->_leadingEdgePacket1;
        [(BiasEstimatorFeatures *)v6 leadingEdgePacket1];
        double v64 = v34;
        double firstPathIndexPacket1 = self->_firstPathIndexPacket1;
        [(BiasEstimatorFeatures *)v6 firstPathIndexPacket1];
        double v62 = v35;
        int rxAntennaPacket1 = self->_rxAntennaPacket1;
        unsigned int v37 = [(BiasEstimatorFeatures *)v6 rxAntennaPacket1];
        cirPacket2 = self->_cirPacket2;
        double v60 = v17;
        double v61 = rssiDbm;
        double v58 = v20;
        double v59 = soiRssiDbm;
        if (!cirPacket2)
        {
          uint64_t v39 = [(BiasEstimatorFeatures *)v6 cirPacket2];

          if (!v39)
          {
            double v41 = v14;
            double v42 = timestamp;
            double v43 = v11;
            double v44 = uwbTime;
            goto LABEL_11;
          }
          cirPacket2 = self->_cirPacket2;
        }
        uint64_t v39 = [(BiasEstimatorFeatures *)v6 cirPacket2];
        unsigned __int8 v40 = [(NSArray *)cirPacket2 isEqualToArray:v39];
        double v41 = v14;
        double v42 = timestamp;
        double v43 = v11;
        double v44 = uwbTime;

        LOBYTE(v39) = v40 ^ 1;
LABEL_11:
        double leadingEdgePacket2 = self->_leadingEdgePacket2;
        [(BiasEstimatorFeatures *)v6 leadingEdgePacket2];
        double v47 = v46;
        double firstPathIndexPacket2 = self->_firstPathIndexPacket2;
        [(BiasEstimatorFeatures *)v6 firstPathIndexPacket2];
        double v50 = v49;
        int rxAntennaPacket2 = self->_rxAntennaPacket2;
        unsigned int v52 = [(BiasEstimatorFeatures *)v6 rxAntennaPacket2];
        BOOL v54 = v44 != v43 || antennaMask != v8;
        if (v42 != v41) {
          BOOL v54 = 1;
        }
        if (tofPicSecond != v80) {
          BOOL v54 = 1;
        }
        if (v61 != v60) {
          BOOL v54 = 1;
        }
        if (v59 != v58) {
          BOOL v54 = 1;
        }
        if (toaNoiseRms != v78) {
          BOOL v54 = 1;
        }
        if (toaPpwinRms != v76) {
          BOOL v54 = 1;
        }
        BOOL v55 = (leadingEdgePacket2 == v47) & ~(v54 | (toaPpwinPeak != v74
                                                  || rttInitiator != v72
                                                  || tatInitiator != v70
                                                  || rttResponder != v68
                                                  || tatResponder != v66) | v33 | (leadingEdgePacket1 != v64) | (firstPathIndexPacket1 != v62) | (rxAntennaPacket1 != v37) | v39);
        if (firstPathIndexPacket2 != v50) {
          BOOL v55 = 0;
        }
        BOOL v56 = rxAntennaPacket2 == v52 && v55;
        goto LABEL_36;
      }
      cirPacket1 = self->_cirPacket1;
    }
    double v31 = [(BiasEstimatorFeatures *)v6 cirPacket1];
    unsigned __int8 v32 = [(NSArray *)cirPacket1 isEqualToArray:v31];

    char v33 = v32 ^ 1;
    goto LABEL_7;
  }
  BOOL v56 = 0;
LABEL_37:

  return v56;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@"AntennaMask: %d", self->_antennaMask];
  [v6 appendFormat:@", current Timestamp: %f", *(void *)&self->_timestamp];
  [v6 appendFormat:@", uwbTime: %f", *(void *)&self->_uwbTime];
  [v6 appendFormat:@", tofPicSecond: %f", *(void *)&self->_tofPicSecond];
  [v6 appendFormat:@", rssiDbm: %.3f", *(void *)&self->_rssiDbm];
  [v6 appendFormat:@", soiRssiDbm: %.3f", *(void *)&self->_soiRssiDbm];
  [v6 appendFormat:@", toaNoiseRms: %d", (int)self->_toaNoiseRms];
  [v6 appendFormat:@", toaPpwinRms: %d", (int)self->_toaPpwinRms];
  [v6 appendFormat:@", toaPpwinPeak: %d", (int)self->_toaPpwinPeak];
  [v6 appendFormat:@", rttInitiator: %d", (int)self->_rttInitiator];
  [v6 appendFormat:@", tatInitiator: %d", (int)self->_tatInitiator];
  [v6 appendFormat:@", rttResponder: %d", (int)self->_rttResponder];
  [v6 appendFormat:@", tatResponder: %d", (int)self->_tatResponder];
  cirPacket1 = self->_cirPacket1;
  if (cirPacket1)
  {
    unsigned int v8 = [(NSArray *)cirPacket1 description];
    [v6 appendFormat:@", cirPacket1: %@", v8];
  }
  [v6 appendFormat:@", leadingEdgePacket1: %d", (int)self->_leadingEdgePacket1];
  [v6 appendFormat:@", firstPathIndexPacket1: %d", (int)self->_firstPathIndexPacket1];
  [v6 appendFormat:@", rxAntennaPacket1: %d", self->_rxAntennaPacket1];
  cirPacket2 = self->_cirPacket2;
  if (cirPacket2)
  {
    double v10 = [(NSArray *)cirPacket2 description];
    [v6 appendFormat:@", cirPacket1: %@", v10];
  }
  [v6 appendFormat:@", leadingEdgePacket2: %d", (int)self->_leadingEdgePacket2];
  [v6 appendFormat:@", firstPathIndexPacket2: %d", (int)self->_firstPathIndexPacket2];
  [v6 appendFormat:@", rxAntennaPacket2: %d>", self->_rxAntennaPacket2];

  return v6;
}

- (id)populateOrderedInputFeature
{
  id v3 = [objc_alloc((Class)NSMutableString) initWithFormat:@"%d, %f, %f, %d, %.3f, %.3f", self->_antennaMask, *(void *)&self->_timestamp, *(void *)&self->_uwbTime, (int)self->_tofPicSecond, *(void *)&self->_rssiDbm, *(void *)&self->_soiRssiDbm];
  [v3 appendFormat:@", %d, %d, %d", (int)self->_toaNoiseRms, (int)self->_toaPpwinRms, (int)self->_toaPpwinPeak];
  [v3 appendFormat:@", %llu, %llu, %llu, %llu", (unint64_t)self->_rttInitiator, (unint64_t)self->_tatInitiator, (unint64_t)self->_rttResponder, (unint64_t)self->_tatResponder];
  for (unint64_t i = 0; [(NSArray *)self->_cirPacket1 count] > i; ++i)
  {
    id v5 = [(NSArray *)self->_cirPacket1 objectAtIndex:i];
    id v6 = [v5 real];

    double v7 = [(NSArray *)self->_cirPacket1 objectAtIndex:i];
    unsigned int v8 = [v7 imag];

    [v3 appendFormat:@", %d, %d", [v6 intValue], [v8 intValue]];
  }
  [v3 appendFormat:@", %d, %d, %d", (int)self->_leadingEdgePacket1, (int)self->_firstPathIndexPacket1, self->_rxAntennaPacket1];
  for (unint64_t j = 0; [(NSArray *)self->_cirPacket2 count] > j; ++j)
  {
    double v10 = [(NSArray *)self->_cirPacket2 objectAtIndex:j];
    double v11 = [v10 real];

    double v12 = [(NSArray *)self->_cirPacket2 objectAtIndex:j];
    double v13 = [v12 imag];

    [v3 appendFormat:@", %d, %d", [v11 intValue], [v13 intValue]];
  }
  [v3 appendFormat:@", %d, %d, %d", (int)self->_leadingEdgePacket2, (int)self->_firstPathIndexPacket2, self->_rxAntennaPacket2];

  return v3;
}

- (unint64_t)hash
{
  double v43 = +[NSNumber numberWithInt:self->_antennaMask];
  unint64_t v33 = (unint64_t)[v43 hash];
  double v42 = +[NSNumber numberWithDouble:self->_uwbTime];
  unint64_t v31 = (unint64_t)[v42 hash];
  double v41 = +[NSNumber numberWithDouble:self->_timestamp];
  unint64_t v30 = (unint64_t)[v41 hash];
  unsigned __int8 v40 = +[NSNumber numberWithDouble:self->_tofPicSecond];
  unint64_t v28 = (unint64_t)[v40 hash];
  uint64_t v39 = +[NSNumber numberWithDouble:self->_rssiDbm];
  unint64_t v27 = (unint64_t)[v39 hash];
  double v38 = +[NSNumber numberWithDouble:self->_soiRssiDbm];
  unint64_t v25 = (unint64_t)[v38 hash];
  unsigned int v37 = +[NSNumber numberWithDouble:self->_toaNoiseRms];
  unint64_t v24 = (unint64_t)[v37 hash];
  v36 = +[NSNumber numberWithDouble:self->_toaPpwinRms];
  unint64_t v23 = (unint64_t)[v36 hash];
  double v35 = +[NSNumber numberWithDouble:self->_toaPpwinPeak];
  unint64_t v21 = (unint64_t)[v35 hash];
  double v34 = +[NSNumber numberWithDouble:self->_rttInitiator];
  unint64_t v20 = (unint64_t)[v34 hash];
  unsigned __int8 v32 = +[NSNumber numberWithDouble:self->_tatInitiator];
  unint64_t v18 = (unint64_t)[v32 hash];
  double v29 = +[NSNumber numberWithDouble:self->_rttResponder];
  unint64_t v17 = (unint64_t)[v29 hash];
  double v26 = +[NSNumber numberWithDouble:self->_tatResponder];
  unint64_t v16 = (unint64_t)[v26 hash];
  unint64_t v15 = (unint64_t)[(NSArray *)self->_cirPacket1 hash];
  double v22 = +[NSNumber numberWithDouble:self->_leadingEdgePacket1];
  unint64_t v14 = (unint64_t)[v22 hash];
  double v19 = +[NSNumber numberWithDouble:self->_firstPathIndexPacket1];
  unint64_t v3 = (unint64_t)[v19 hash];
  id v4 = +[NSNumber numberWithInt:self->_rxAntennaPacket1];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = (unint64_t)[(NSArray *)self->_cirPacket2 hash];
  double v7 = +[NSNumber numberWithDouble:self->_leadingEdgePacket2];
  unint64_t v8 = (unint64_t)[v7 hash];
  double v9 = +[NSNumber numberWithDouble:self->_firstPathIndexPacket2];
  unint64_t v10 = (unint64_t)[v9 hash];
  double v11 = +[NSNumber numberWithInt:self->_rxAntennaPacket2];
  unint64_t v12 = v31 ^ v33 ^ v30 ^ v28 ^ v27 ^ v25 ^ v24 ^ v23 ^ v21 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v5 ^ v6 ^ v8 ^ v10 ^ (unint64_t)[v11 hash];

  return v12;
}

- (int)antennaMask
{
  return self->_antennaMask;
}

- (void)setAntennaMask:(int)a3
{
  self->_int antennaMask = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (double)uwbTime
{
  return self->_uwbTime;
}

- (void)setUwbTime:(double)a3
{
  self->_double uwbTime = a3;
}

- (double)tofPicSecond
{
  return self->_tofPicSecond;
}

- (void)setTofPicSecond:(double)a3
{
  self->_double tofPicSecond = a3;
}

- (double)rssiDbm
{
  return self->_rssiDbm;
}

- (void)setRssiDbm:(double)a3
{
  self->_double rssiDbm = a3;
}

- (double)soiRssiDbm
{
  return self->_soiRssiDbm;
}

- (void)setSoiRssiDbm:(double)a3
{
  self->_double soiRssiDbm = a3;
}

- (double)toaNoiseRms
{
  return self->_toaNoiseRms;
}

- (void)setToaNoiseRms:(double)a3
{
  self->_double toaNoiseRms = a3;
}

- (double)toaPpwinRms
{
  return self->_toaPpwinRms;
}

- (void)setToaPpwinRms:(double)a3
{
  self->_double toaPpwinRms = a3;
}

- (double)toaPpwinPeak
{
  return self->_toaPpwinPeak;
}

- (void)setToaPpwinPeak:(double)a3
{
  self->_double toaPpwinPeak = a3;
}

- (double)rttInitiator
{
  return self->_rttInitiator;
}

- (void)setRttInitiator:(double)a3
{
  self->_double rttInitiator = a3;
}

- (double)tatInitiator
{
  return self->_tatInitiator;
}

- (void)setTatInitiator:(double)a3
{
  self->_double tatInitiator = a3;
}

- (double)rttResponder
{
  return self->_rttResponder;
}

- (void)setRttResponder:(double)a3
{
  self->_double rttResponder = a3;
}

- (double)tatResponder
{
  return self->_tatResponder;
}

- (void)setTatResponder:(double)a3
{
  self->_double tatResponder = a3;
}

- (NSArray)cirPacket1
{
  return self->_cirPacket1;
}

- (void)setCirPacket1:(id)a3
{
}

- (double)leadingEdgePacket1
{
  return self->_leadingEdgePacket1;
}

- (void)setLeadingEdgePacket1:(double)a3
{
  self->_double leadingEdgePacket1 = a3;
}

- (double)firstPathIndexPacket1
{
  return self->_firstPathIndexPacket1;
}

- (void)setFirstPathIndexPacket1:(double)a3
{
  self->_double firstPathIndexPacket1 = a3;
}

- (int)rxAntennaPacket1
{
  return self->_rxAntennaPacket1;
}

- (void)setRxAntennaPacket1:(int)a3
{
  self->_int rxAntennaPacket1 = a3;
}

- (NSArray)cirPacket2
{
  return self->_cirPacket2;
}

- (void)setCirPacket2:(id)a3
{
}

- (double)leadingEdgePacket2
{
  return self->_leadingEdgePacket2;
}

- (void)setLeadingEdgePacket2:(double)a3
{
  self->_double leadingEdgePacket2 = a3;
}

- (double)firstPathIndexPacket2
{
  return self->_firstPathIndexPacket2;
}

- (void)setFirstPathIndexPacket2:(double)a3
{
  self->_double firstPathIndexPacket2 = a3;
}

- (int)rxAntennaPacket2
{
  return self->_rxAntennaPacket2;
}

- (void)setRxAntennaPacket2:(int)a3
{
  self->_int rxAntennaPacket2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cirPacket2, 0);

  objc_storeStrong((id *)&self->_cirPacket1, 0);
}

@end
@interface FMOOSClientCrowdsourcedPrediction
- (BOOL)isSent;
- (NSNumber)lastOosRate;
- (NSNumber)maxOosRate;
- (NSNumber)minOosRate;
- (double)latitude;
- (double)longitude;
- (id).cxx_construct;
- (id)initLastOosRate:(id)a3 minOosRate:(id)a4 maxOosRate:(id)a5 mcc:(unsigned int)a6 mnc:(unsigned int)a7 rat:(int)a8 maxCount:(unsigned int)a9 isSent:(BOOL)a10 latitude:(double)a11 longitude:(double)a12 band:(optional<unsigned int>)a13 arfcn:(optional<unsigned int>)a14;
- (int)rat;
- (optional<unsigned)arfcn;
- (optional<unsigned)band;
- (unsigned)maxCount;
- (unsigned)mcc;
- (unsigned)mnc;
- (void)setIsSent:(BOOL)a3;
@end

@implementation FMOOSClientCrowdsourcedPrediction

- (id)initLastOosRate:(id)a3 minOosRate:(id)a4 maxOosRate:(id)a5 mcc:(unsigned int)a6 mnc:(unsigned int)a7 rat:(int)a8 maxCount:(unsigned int)a9 isSent:(BOOL)a10 latitude:(double)a11 longitude:(double)a12 band:(optional<unsigned int>)a13 arfcn:(optional<unsigned int>)a14
{
  id v23 = a3;
  id v24 = a4;
  id v25 = a5;
  v30.receiver = self;
  v30.super_class = (Class)FMOOSClientCrowdsourcedPrediction;
  v26 = [(FMOOSClientCrowdsourcedPrediction *)&v30 init];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_lastOosRate, a3);
    objc_storeStrong((id *)&v27->_minOosRate, a4);
    objc_storeStrong((id *)&v27->_maxOosRate, a5);
    v27->_mcc = a6;
    v27->_mnc = a7;
    v27->_rat = a8;
    v27->_maxCount = a9;
    v27->_isSent = a10;
    v27->_latitude = a11;
    v27->_longitude = a12;
    v27->_band = a13;
    v27->_arfcn = a14;
    v28 = v27;
  }

  return v27;
}

- (NSNumber)lastOosRate
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)minOosRate
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)maxOosRate
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)mcc
{
  return self->_mcc;
}

- (unsigned)mnc
{
  return self->_mnc;
}

- (int)rat
{
  return self->_rat;
}

- (unsigned)maxCount
{
  return self->_maxCount;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (optional<unsigned)band
{
  objc_copyStruct(&dest, &self->_band, 8, 1, 0);
  return dest;
}

- (optional<unsigned)arfcn
{
  objc_copyStruct(&dest, &self->_arfcn, 8, 1, 0);
  return dest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxOosRate, 0);
  objc_storeStrong((id *)&self->_minOosRate, 0);

  objc_storeStrong((id *)&self->_lastOosRate, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 72) = 0;
  *((unsigned char *)self + 76) = 0;
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 84) = 0;
  return self;
}

@end
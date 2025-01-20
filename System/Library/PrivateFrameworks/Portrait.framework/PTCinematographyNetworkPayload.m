@interface PTCinematographyNetworkPayload
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)isMissingDetection;
- (PTCinematographyDetection)detection;
- (PTCinematographyNetworkPayload)initWithTime:(id *)a3 detection:(id)a4 missing:(BOOL)a5;
@end

@implementation PTCinematographyNetworkPayload

- (PTCinematographyNetworkPayload)initWithTime:(id *)a3 detection:(id)a4 missing:(BOOL)a5
{
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PTCinematographyNetworkPayload;
  v10 = [(PTCinematographyNetworkPayload *)&v14 init];
  v11 = (PTCinematographyNetworkPayload *)v10;
  if (v10)
  {
    long long v12 = *(_OWORD *)&a3->var0;
    *((void *)v10 + 5) = a3->var3;
    *(_OWORD *)(v10 + 24) = v12;
    objc_storeStrong((id *)v10 + 2, a4);
    v11->_isMissingDetection = a5;
  }

  return v11;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (PTCinematographyDetection)detection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isMissingDetection
{
  return self->_isMissingDetection;
}

- (void).cxx_destruct
{
}

@end
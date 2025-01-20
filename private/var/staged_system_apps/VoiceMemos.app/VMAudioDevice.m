@interface VMAudioDevice
+ (id)defaultInputAndReturnError:(id *)a3;
+ (id)defaultOutputAndReturnError:(id *)a3;
+ (id)defaultSystemOutputAndReturnError:(id *)a3;
- (AVAudioChannelLayout)channelLayout;
- (BOOL)isMono;
- (BOOL)setSampleRate:(double)a3 error:(id *)a4;
- (NSArray)sampleRates;
- (NSArray)stereoChannels;
- (double)sampleRate;
@end

@implementation VMAudioDevice

+ (id)defaultInputAndReturnError:(id *)a3
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  *(void *)&inAddress.mSelector = 0x676C6F6264496E20;
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  uint64_t v4 = 0;
  if (!PropertyData)
  {
    int v5 = outData;
    if (outData)
    {
      uint64_t v4 = objc_opt_new();
      *(_DWORD *)(v4 + 8) = v5;
      *(unsigned char *)(v4 + 12) = 0;
    }
  }

  return (id)v4;
}

+ (id)defaultOutputAndReturnError:(id *)a3
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  *(void *)&inAddress.mSelector = 0x676C6F62644F7574;
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  uint64_t v4 = 0;
  if (!PropertyData)
  {
    int v5 = outData;
    if (outData)
    {
      uint64_t v4 = objc_opt_new();
      *(_DWORD *)(v4 + 8) = v5;
      *(unsigned char *)(v4 + 12) = 0;
    }
  }

  return (id)v4;
}

+ (id)defaultSystemOutputAndReturnError:(id *)a3
{
  int outData = 0;
  UInt32 ioDataSize = 4;
  *(void *)&inAddress.mSelector = 0x676C6F62734F7574;
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(1u, &inAddress, 0, 0, &ioDataSize, &outData);
  uint64_t v4 = 0;
  if (!PropertyData)
  {
    int v5 = outData;
    if (outData)
    {
      uint64_t v4 = objc_opt_new();
      *(_DWORD *)(v4 + 8) = v5;
      *(unsigned char *)(v4 + 12) = 0;
    }
  }

  return (id)v4;
}

- (double)sampleRate
{
  AudioObjectID deviceID = self->_deviceID;
  int direction = self->_direction;
  if (direction == 1) {
    int v4 = 1869968496;
  }
  else {
    int v4 = 0;
  }
  double outData = 0.0;
  if (direction) {
    AudioObjectPropertyScope v5 = v4;
  }
  else {
    AudioObjectPropertyScope v5 = 1768845428;
  }
  UInt32 ioDataSize = 8;
  inAddress.mSelector = 1853059700;
  inAddress.mScope = v5;
  inAddress.mElement = 0;
  OSStatus PropertyData = AudioObjectGetPropertyData(deviceID, &inAddress, 0, 0, &ioDataSize, &outData);
  double result = outData;
  if (PropertyData) {
    return 0.0;
  }
  return result;
}

- (BOOL)setSampleRate:(double)a3 error:(id *)a4
{
  AudioObjectID deviceID = self->_deviceID;
  double inData = a3;
  *(void *)&inAddress.mSelector = 0x676C6F626E737274;
  inAddress.mElement = 0;
  OSStatus v6 = AudioObjectSetPropertyData(deviceID, &inAddress, 0, 0, 8u, &inData);
  OSStatus v7 = v6;
  if (a4 && v6)
  {
    *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v6 userInfo:0];
  }
  return v7 == 0;
}

- (NSArray)sampleRates
{
  if (self->_direction == 1) {
    int v2 = 1869968496;
  }
  else {
    int v2 = 0;
  }
  if (self->_direction) {
    AudioObjectPropertyScope v3 = v2;
  }
  else {
    AudioObjectPropertyScope v3 = 1768845428;
  }
  int v4 = sub_100085B38(self->_deviceID, 0x6E737223u, v3);
  AudioObjectPropertyScope v5 = v4;
  if (v4)
  {
    unint64_t v6 = (unint64_t)[v4 length];
    OSStatus v7 = (double *)[v5 bytes];
    v6 >>= 4;
    +[NSMutableArray arrayWithCapacity:v6];
    v8 = &v7[2 * v6];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100085C98;
    v12[3] = &unk_100222560;
    v9 = (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue();
    id v13 = v9;
    id v10 = sub_100085C08(v7, v8, v12);
  }
  else
  {
    v9 = &off_10022D8F8;
  }

  return (NSArray *)v9;
}

- (AVAudioChannelLayout)channelLayout
{
  if (self->_direction == 1) {
    int v2 = 1869968496;
  }
  else {
    int v2 = 0;
  }
  if (self->_direction) {
    AudioObjectPropertyScope v3 = v2;
  }
  else {
    AudioObjectPropertyScope v3 = 1768845428;
  }
  int v4 = sub_100085B38(self->_deviceID, 0x73726E64u, v3);
  AudioObjectPropertyScope v5 = v4;
  if (v4)
  {
    unint64_t v6 = +[AVAudioChannelLayout layoutWithLayout:](AVAudioChannelLayout, "layoutWithLayout:", [v4 bytes]);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return (AVAudioChannelLayout *)v6;
}

- (NSArray)stereoChannels
{
  AudioObjectID deviceID = self->_deviceID;
  int direction = self->_direction;
  if (direction == 1) {
    int v4 = 1869968496;
  }
  else {
    int v4 = 0;
  }
  uint64_t outData = 0;
  if (direction) {
    AudioObjectPropertyScope v5 = v4;
  }
  else {
    AudioObjectPropertyScope v5 = 1768845428;
  }
  v11.mElement = 0;
  UInt32 ioDataSize = 8;
  v11.mSelector = 1684236338;
  v11.mScope = v5;
  AudioObjectGetPropertyData(deviceID, &v11, 0, 0, &ioDataSize, &outData);
  int v6 = HIDWORD(outData);
  OSStatus v7 = +[NSNumber numberWithUnsignedInt:(outData - 1)];
  v14[0] = v7;
  v8 = +[NSNumber numberWithUnsignedInt:(v6 - 1)];
  v14[1] = v8;
  v9 = +[NSArray arrayWithObjects:v14 count:2];

  return (NSArray *)v9;
}

- (BOOL)isMono
{
  AudioObjectID deviceID = self->_deviceID;
  int direction = self->_direction;
  if (direction == 1) {
    int v4 = 1869968496;
  }
  else {
    int v4 = 0;
  }
  uint64_t outData = 0;
  if (direction) {
    AudioObjectPropertyScope v5 = v4;
  }
  else {
    AudioObjectPropertyScope v5 = 1768845428;
  }
  UInt32 ioDataSize = 8;
  inAddress.mSelector = 1684236338;
  inAddress.mScope = v5;
  inAddress.mElement = 0;
  AudioObjectGetPropertyData(deviceID, &inAddress, 0, 0, &ioDataSize, &outData);
  return outData == 0x100000001;
}

@end
@interface PTGlobalCinematographyMetadataVersion1
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTGlobalCinematographyMetadataVersion1)initWithData:(id)a3;
- (PTGlobalCinematographyMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (float)focusPullerAlpha;
- (float)focusPullerMaxV;
- (float)focusPullerResistance;
- (float)maximumDisparityPerSecond;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)setFocusPullerAlpha:(float)a3;
- (void)setFocusPullerMaxV:(float)a3;
- (void)setFocusPullerResistance:(float)a3;
- (void)setMaximumDisparityPerSecond:(float)a3;
- (void)setMaximumRackFocusPullTime:(id *)a3;
- (void)setMinimumRackFocusPullTime:(id *)a3;
@end

@implementation PTGlobalCinematographyMetadataVersion1

- (PTGlobalCinematographyMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PTGlobalCinematographyMetadataVersion1;
  v3 = [(PTGlobalCinematographyMetadata *)&v8 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  if (v3)
  {
    CMTimeMake(&v7, 1, 3);
    long long v4 = *(_OWORD *)&v7.value;
    *(void *)(v3 + 44) = v7.epoch;
    *(_OWORD *)(v3 + 28) = v4;
    CMTimeMake(&v7, 1, 3);
    long long v5 = *(_OWORD *)&v7.value;
    *(void *)(v3 + 68) = v7.epoch;
    *(_OWORD *)(v3 + 52) = v5;
    *((_DWORD *)v3 + 19) = 1056964608;
  }
  return (PTGlobalCinematographyMetadataVersion1 *)v3;
}

- (PTGlobalCinematographyMetadataVersion1)initWithData:(id)a3
{
  id v4 = a3;
  long long v5 = (unsigned int *)[v4 bytes];
  uint64_t v6 = bswap32(v5[3]);
  v23.receiver = self;
  v23.super_class = (Class)PTGlobalCinematographyMetadataVersion1;
  CMTime v7 = [(PTGlobalCinematographyMetadata *)&v23 initWithMajorVersion:1 minorVersion:v6];
  if (v7
    && (uint64_t v8 = bswap32(*v5), [v4 length] == v8)
    && (v8 & 7) == 0
    && [v7 majorVersion] == 1
    && [v7 majorVersion] == bswap32(v5[2]))
  {
    v9 = v5 + 4;
    unint64_t v10 = (unint64_t)(v8 + 0x7FFFFFFF0) >> 3;
    +[PTParameterPairSerialization getFloatParameter:1 fromPairs:v9 numPairs:v10 didFindValue:0];
    *((_DWORD *)v7 + 4) = v11;
    +[PTParameterPairSerialization getFloatParameter:2 fromPairs:v9 numPairs:v10 didFindValue:0];
    *((_DWORD *)v7 + 5) = v12;
    +[PTParameterPairSerialization getFloatParameter:3 fromPairs:v9 numPairs:v10 didFindValue:0];
    *((_DWORD *)v7 + 6) = v13;
    CMTimeMake(&v20, 1, 3);
    +[PTParameterPairSerialization getCMTimeParameter:4 scale:90000 fromPairs:v9 numPairs:v10 withDefault:&v20];
    long long v14 = v21;
    *(void *)(v7 + 44) = v22;
    *(_OWORD *)(v7 + 28) = v14;
    CMTimeMake(&v19, 1, 3);
    +[PTParameterPairSerialization getCMTimeParameter:5 scale:90000 fromPairs:v9 numPairs:v10 withDefault:&v19];
    long long v15 = v21;
    *(void *)(v7 + 68) = v22;
    *(_OWORD *)(v7 + 52) = v15;
    LODWORD(v15) = 0.5;
    +[PTParameterPairSerialization getFloatParameter:6 fromPairs:v9 numPairs:v10 withDefault:*(double *)&v15];
    *((_DWORD *)v7 + 19) = v16;
    v17 = v7;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 64;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTGlobalCinematographyMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] >= (unint64_t)v8
    && [(PTGlobalCinematographyMetadata *)self majorVersion] == 1)
  {
    id v9 = v6;
    unint64_t v10 = (_DWORD *)[v9 mutableBytes];
    *unint64_t v10 = bswap32([(PTGlobalCinematographyMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
    v10[1] = 1735683683;
    v10[2] = bswap32([(PTGlobalCinematographyMetadata *)self majorVersion]);
    v10[3] = bswap32([(PTGlobalCinematographyMetadata *)self minorVersion]);
    long long v21 = v10 + 4;
    *(float *)&double v11 = self->_focusPullerAlpha;
    +[PTParameterPairSerialization appendFloatParameter:1 value:&v21 toOutput:v11];
    *(float *)&double v12 = self->_focusPullerMaxV;
    +[PTParameterPairSerialization appendFloatParameter:2 value:&v21 toOutput:v12];
    *(float *)&double v13 = self->_focusPullerResistance;
    +[PTParameterPairSerialization appendFloatParameter:3 value:&v21 toOutput:v13];
    long long v19 = *(_OWORD *)(&self->_focusPullerResistance + 1);
    uint64_t v20 = *(void *)&self->_minimumRackFocusPullTime.flags;
    +[PTParameterPairSerialization appendCMTimeParameter:4 value:&v19 scale:90000 toOutput:&v21];
    long long v19 = *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4);
    uint64_t v20 = *(void *)&self->_maximumRackFocusPullTime.flags;
    +[PTParameterPairSerialization appendCMTimeParameter:5 value:&v19 scale:90000 toOutput:&v21];
    LODWORD(v14) = HIDWORD(self->_maximumRackFocusPullTime.epoch);
    +[PTParameterPairSerialization appendFloatParameter:6 value:&v21 toOutput:v14];
    long long v15 = v21;
    uint64_t v16 = (uint64_t)v15 - [v9 bytes];
    BOOL v17 = v16 == [(PTGlobalCinematographyMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (float)focusPullerAlpha
{
  return self->_focusPullerAlpha;
}

- (void)setFocusPullerAlpha:(float)a3
{
  self->_focusPullerAlpha = a3;
}

- (float)focusPullerMaxV
{
  return self->_focusPullerMaxV;
}

- (void)setFocusPullerMaxV:(float)a3
{
  self->_focusPullerMaxV = a3;
}

- (float)focusPullerResistance
{
  return self->_focusPullerResistance;
}

- (void)setFocusPullerResistance:(float)a3
{
  self->_focusPullerResistance = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var0 + 4);
  retstr->var3 = *(int64_t *)((char *)&self[1].var3 + 4);
  return self;
}

- (void)setMinimumRackFocusPullTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_focusPullerResistance + 1) = *(_OWORD *)&a3->var0;
  *(void *)&self->_minimumRackFocusPullTime.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumRackFocusPullTime
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[2].var0 + 4);
  retstr->int64_t var3 = *(int64_t *)((char *)&self[2].var3 + 4);
  return self;
}

- (void)setMaximumRackFocusPullTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)((char *)&self->_minimumRackFocusPullTime.epoch + 4) = *(_OWORD *)&a3->var0;
  *(void *)&self->_maximumRackFocusPullTime.flags = var3;
}

- (float)maximumDisparityPerSecond
{
  return *((float *)&self->_maximumRackFocusPullTime.epoch + 1);
}

- (void)setMaximumDisparityPerSecond:(float)a3
{
  *((float *)&self->_maximumRackFocusPullTime.epoch + 1) = a3;
}

@end
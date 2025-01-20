@interface PTGlobalCinematographyMetadata
+ (id)objectFromData:(id)a3;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTGlobalCinematographyMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4;
- (unsigned)majorVersion;
- (unsigned)minorVersion;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
@end

@implementation PTGlobalCinematographyMetadata

- (PTGlobalCinematographyMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PTGlobalCinematographyMetadata;
  v6 = [(PTGlobalCinematographyMetadata *)&v10 init];
  v7 = v6;
  v8 = 0;
  if (a3 == 1 && v6)
  {
    v6->_majorVersion = 1;
    v6->_minorVersion = a4;
    v8 = v6;
  }

  return v8;
}

+ (id)objectFromData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] >= 0x10
    && (id v4 = v3, v5 = [v4 bytes], *(_DWORD *)(v5 + 4) == 1735683683)
    && *(_DWORD *)(v5 + 8) == 0x1000000)
  {
    v6 = [[PTGlobalCinematographyMetadataVersion1 alloc] initWithData:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 0;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  return 0;
}

- (unsigned)majorVersion
{
  return self->_majorVersion;
}

- (unsigned)minorVersion
{
  return self->_minorVersion;
}

@end
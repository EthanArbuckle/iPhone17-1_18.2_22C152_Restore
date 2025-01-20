@interface PTTimedStabilizationMetadata
+ (id)objectFromData:(id)a3;
+ (id)objectFromData:(id)a3 withMajorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTTimedStabilizationMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4;
- (unsigned)majorVersion;
- (unsigned)minorVersion;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
@end

@implementation PTTimedStabilizationMetadata

- (PTTimedStabilizationMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PTTimedStabilizationMetadata;
  v6 = [(PTTimedStabilizationMetadata *)&v10 init];
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

+ (id)objectFromData:(id)a3 withMajorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  if ((unint64_t)[v7 length] < 8)
  {
LABEL_13:
    objc_super v10 = 0;
    goto LABEL_10;
  }
  id v8 = v7;
  v9 = (unsigned int *)[v8 bytes];
  objc_super v10 = 0;
  if (a4 == 1 && v9[1] == 1650553971)
  {
    uint64_t v11 = bswap32(*v9);
    uint64_t v12 = [v8 length];
    if ((v11 & 7) == 0 && v12 == v11)
    {
      objc_super v10 = [[PTTimedStabilizationMetadataVersion1 alloc] initWithData:v8 minorVersion:v5];
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_10:

  return v10;
}

+ (id)objectFromData:(id)a3
{
  return 0;
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
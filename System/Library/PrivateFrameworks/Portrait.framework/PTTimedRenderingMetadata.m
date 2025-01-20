@interface PTTimedRenderingMetadata
+ (id)objectFromData:(id)a3;
+ (id)objectFromData:(id)a3 withMajorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5;
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTTimedRenderingMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4;
- (unsigned)majorVersion;
- (unsigned)minorVersion;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
@end

@implementation PTTimedRenderingMetadata

- (PTTimedRenderingMetadata)initWithMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PTTimedRenderingMetadata;
  v6 = [(PTTimedRenderingMetadata *)&v10 init];
  v7 = v6;
  v8 = 0;
  if (a3 - 3 >= 0xFFFFFFFE && v6)
  {
    v6->_majorVersion = a3;
    v6->_minorVersion = a4;
    v8 = v6;
  }

  return v8;
}

+ (id)objectFromData:(id)a3 withMajorVersion:(unsigned int)a4 minorVersion:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  if ((unint64_t)[v7 length] >= 8)
  {
    id v8 = v7;
    if (*(_DWORD *)([v8 bytes] + 4) == 1684956530)
    {
      if (a4 == 1)
      {
        v9 = off_1E6883F00;
        goto LABEL_7;
      }
      if (a4 == 2)
      {
        v9 = off_1E6883F08;
LABEL_7:
        objc_super v10 = (void *)[objc_alloc(*v9) initWithData:v8 minorVersion:v5];
        goto LABEL_9;
      }
    }
  }
  objc_super v10 = 0;
LABEL_9:

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
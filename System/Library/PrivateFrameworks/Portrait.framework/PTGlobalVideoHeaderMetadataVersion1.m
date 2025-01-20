@interface PTGlobalVideoHeaderMetadataVersion1
- (BOOL)writeToData:(id)a3 withOptions:(id)a4;
- (PTGlobalVideoHeaderMetadataVersion1)initWithData:(id)a3;
- (PTGlobalVideoHeaderMetadataVersion1)initWithMinorVersion:(unsigned int)a3;
- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3;
@end

@implementation PTGlobalVideoHeaderMetadataVersion1

- (PTGlobalVideoHeaderMetadataVersion1)initWithMinorVersion:(unsigned int)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PTGlobalVideoHeaderMetadataVersion1;
  v3 = [(PTGlobalVideoHeaderMetadata *)&v7 initWithMajorVersion:1 minorVersion:*(void *)&a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (PTGlobalVideoHeaderMetadataVersion1)initWithData:(id)a3
{
  id v4 = a3;
  v5 = (unsigned int *)[v4 bytes];
  uint64_t v6 = bswap32(v5[3]);
  v12.receiver = self;
  v12.super_class = (Class)PTGlobalVideoHeaderMetadataVersion1;
  objc_super v7 = [(PTGlobalVideoHeaderMetadata *)&v12 initWithMajorVersion:1 minorVersion:v6];
  if (v7
    && ((uint64_t v8 = bswap32(*v5), [v4 length] == v8) ? (v9 = (v8 & 7) == 0) : (v9 = 0),
        v9
     && [(PTGlobalVideoHeaderMetadata *)v7 majorVersion] == 1
     && [(PTGlobalVideoHeaderMetadata *)v7 majorVersion] == bswap32(v5[2])))
  {
    v10 = v7;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unsigned)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 16;
}

- (BOOL)writeToData:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(PTGlobalVideoHeaderMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7];
  if ([v6 length] >= (unint64_t)v8
    && [(PTGlobalVideoHeaderMetadata *)self majorVersion] == 1)
  {
    BOOL v9 = (_DWORD *)[v6 mutableBytes];
    *BOOL v9 = bswap32([(PTGlobalVideoHeaderMetadataVersion1 *)self sizeOfSerializedObjectWithOptions:v7]);
    v9[1] = 1919182966;
    v9[2] = bswap32([(PTGlobalVideoHeaderMetadata *)self majorVersion]);
    v9[3] = bswap32([(PTGlobalVideoHeaderMetadata *)self minorVersion]);
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

@end
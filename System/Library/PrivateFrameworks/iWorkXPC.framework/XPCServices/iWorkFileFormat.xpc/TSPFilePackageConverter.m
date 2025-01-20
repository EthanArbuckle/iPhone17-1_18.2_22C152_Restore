@interface TSPFilePackageConverter
- (BOOL)isValid;
- (id)newWriteChannelAtPath:(id)a3 lastModificationDate:(id)a4 size:(unint64_t)a5 CRC:(unsigned int)a6 packageWriter:(id)a7 error:(id *)a8;
@end

@implementation TSPFilePackageConverter

- (id)newWriteChannelAtPath:(id)a3 lastModificationDate:(id)a4 size:(unint64_t)a5 CRC:(unsigned int)a6 packageWriter:(id)a7 error:(id *)a8
{
  uint64_t v10 = *(void *)&a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  if ([(TSPPackageConverter *)self isObjectArchivePath:v14])
  {
    v20.receiver = self;
    v20.super_class = (Class)TSPFilePackageConverter;
    id v17 = [(TSPPackageConverter *)&v20 newWriteChannelAtPath:v14 lastModificationDate:v15 size:a5 CRC:v10 packageWriter:v16 error:a8];
  }
  else
  {
    id v17 = [v16 newRawDataWriteChannelForRelativePath:v14 originalLastModificationDate:v15 originalSize:a5 originalCRC:v10 forceCalculatingSizeAndCRCForPreservingLastModificationDate:0];
  }
  v18 = v17;

  return v18;
}

- (BOOL)isValid
{
  v2 = [(TSPPackageConverter *)self package];
  v3 = [v2 zipArchive];
  BOOL v4 = +[TSPFilePackage isValidPackageAtZipArchive:v3];

  return v4;
}

@end
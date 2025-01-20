@interface MFFileArchiveEntry
+ (MFFileArchiveEntry)archiveEntryWithCentralHeader:(CentralHeader *)a3 archiveData:(id)a4;
+ (id)archiveEntry;
- (BOOL)isDeflated;
- (BOOL)isDirectory;
- (MFFileArchiveEntry)initWithContents:(id)a3 path:(id)a4;
- (MFFileArchiveEntry)initWithDirectoryPath:(id)a3;
- (NSData)contents;
- (NSString)path;
- (_NSRange)compressedRange;
- (id)description;
- (id)fileName;
- (int64_t)compressedSize;
- (int64_t)uncompressedSize;
- (void)merge:(id)a3;
- (void)setCompressedRange:(_NSRange)a3;
- (void)setContents:(id)a3;
- (void)setIsDeflated:(BOOL)a3;
- (void)setIsDirectory:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setUncompressedSize:(int64_t)a3;
@end

@implementation MFFileArchiveEntry

+ (id)archiveEntry
{
  v2 = objc_alloc_init(MFFileArchiveEntry);
  return v2;
}

- (MFFileArchiveEntry)initWithContents:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(MFFileArchiveEntry *)self init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    path = v9->_path;
    v9->_path = (NSString *)v10;

    objc_storeStrong((id *)&v9->_contents, a3);
    v9->_uncompressedSize = [v7 length];
  }

  return v9;
}

- (MFFileArchiveEntry)initWithDirectoryPath:(id)a3
{
  id v4 = a3;
  v5 = [(MFFileArchiveEntry *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    contents = v5->_contents;
    v5->_contents = 0;

    v5->_uncompressedSize = 0;
    v5->_isDirectory = 1;
  }

  return v5;
}

+ (MFFileArchiveEntry)archiveEntryWithCentralHeader:(CentralHeader *)a3 archiveData:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[MFFileArchiveEntry archiveEntry];
  if (v6)
  {
    id v7 = (void *)[[NSString alloc] initWithBytes:(char *)&a3->var17 + 2 length:a3->var11 encoding:4];
    [v6 setPath:v7];

    [v6 setUncompressedSize:a3->var10];
    if (a3->var6 == 8) {
      [v6 setIsDeflated:1];
    }
    id v8 = [v6 path];
    uint64_t v9 = [v8 length];

    uint64_t var12 = a3->var12;
    if ([v6 uncompressedSize]) {
      objc_msgSend(v6, "setCompressedRange:", v9 + var12 + *(unsigned int *)((char *)&a3->var16 + 2) + 34, a3->var9);
    }
    uint64_t v11 = [v6 compressedRange];
    v13 = objc_msgSend(v5, "subdataWithRange:", v11, v12);
    [v6 setContents:v13];
  }
  return (MFFileArchiveEntry *)v6;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@ Path:%@ Data:%lu Uncompressed:%lu Range:[%lu:%lu]", objc_opt_class(), self->_path, -[NSData length](self->_contents, "length"), self->_uncompressedSize, self->_compressedRange.location, self->_compressedRange.length];
}

- (id)fileName
{
  return [(NSString *)self->_path lastPathComponent];
}

- (int64_t)compressedSize
{
  return self->_compressedRange.length;
}

- (void)merge:(id)a3
{
  id v4 = a3;
  path = self->_path;
  id v12 = v4;
  uint64_t v6 = [v4 path];
  LODWORD(path) = [(NSString *)path isEqualToString:v6];

  if (path)
  {
    if ([v12 uncompressedSize]) {
      int64_t uncompressedSize = [v12 uncompressedSize];
    }
    else {
      int64_t uncompressedSize = self->_uncompressedSize;
    }
    [(MFFileArchiveEntry *)self setUncompressedSize:uncompressedSize];
    if ([v12 compressedRange])
    {
      self->_compressedRange.location = [v12 compressedRange];
      self->_compressedRange.length = v8;
    }
    if ([v12 isDeflated]) {
      char isDeflated = [v12 isDeflated];
    }
    else {
      char isDeflated = self->_isDeflated;
    }
    self->_char isDeflated = isDeflated;
    uint64_t v10 = [v12 contents];
    if (v10)
    {
      contents = [v12 contents];
    }
    else
    {
      contents = self->_contents;
    }
    [(MFFileArchiveEntry *)self setContents:contents];
    if (v10) {
  }
    }
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPath:(id)a3
{
}

- (int64_t)uncompressedSize
{
  return self->_uncompressedSize;
}

- (void)setUncompressedSize:(int64_t)a3
{
  self->_int64_t uncompressedSize = a3;
}

- (_NSRange)compressedRange
{
  objc_copyStruct(v4, &self->_compressedRange, 16, 1, 0);
  NSUInteger v2 = v4[0];
  NSUInteger v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setCompressedRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  objc_copyStruct(&self->_compressedRange, &v3, 16, 1, 0);
}

- (BOOL)isDeflated
{
  return self->_isDeflated;
}

- (void)setIsDeflated:(BOOL)a3
{
  self->_char isDeflated = a3;
}

- (BOOL)isDirectory
{
  return self->_isDirectory;
}

- (void)setIsDirectory:(BOOL)a3
{
  self->_isDirectory = a3;
}

- (NSData)contents
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
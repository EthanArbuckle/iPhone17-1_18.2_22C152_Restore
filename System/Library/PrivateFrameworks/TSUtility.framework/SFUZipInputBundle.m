@interface SFUZipInputBundle
- (BOOL)hasEntryWithName:(id)a3;
- (SFUZipInputBundle)initWithZipArchive:(id)a3;
- (id)bufferedInputStreamForEntry:(id)a3;
- (id)inputStreamForEntry:(id)a3;
- (int64_t)lengthOfEntry:(id)a3;
- (unsigned)crc32ForEntry:(id)a3;
- (void)copyEntry:(id)a3 toFile:(id)a4;
- (void)dealloc;
@end

@implementation SFUZipInputBundle

- (SFUZipInputBundle)initWithZipArchive:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFUZipInputBundle;
  v4 = [(SFUZipInputBundle *)&v6 init];
  if (v4) {
    v4->_zipArchive = (SFUZipArchive *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipInputBundle;
  [(SFUZipInputBundle *)&v3 dealloc];
}

- (BOOL)hasEntryWithName:(id)a3
{
  return [(SFUZipArchive *)self->_zipArchive entryWithName:a3] != 0;
}

- (id)inputStreamForEntry:(id)a3
{
  id v3 = [(SFUZipArchive *)self->_zipArchive entryWithName:a3];
  return (id)[v3 inputStream];
}

- (id)bufferedInputStreamForEntry:(id)a3
{
  id v3 = [(SFUZipArchive *)self->_zipArchive entryWithName:a3];
  return (id)[v3 bufferedInputStream];
}

- (int64_t)lengthOfEntry:(id)a3
{
  id v3 = [(SFUZipArchive *)self->_zipArchive entryWithName:a3];
  return [v3 dataLength];
}

- (unsigned)crc32ForEntry:(id)a3
{
  id v3 = [(SFUZipArchive *)self->_zipArchive entryWithName:a3];
  return [v3 crc];
}

- (void)copyEntry:(id)a3 toFile:(id)a4
{
  id v6 = -[SFUZipArchive entryWithName:](self->_zipArchive, "entryWithName:");
  if (!v6)
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[SFUZipInputBundle copyEntry:toFile:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUInputBundle.m"), 70, @"Asked to copy missing entry %@", a3 file lineNumber description];
  }
  v9 = [[SFUFileDataRepresentation alloc] initWithCopyOfData:v6 path:a4];
}

@end
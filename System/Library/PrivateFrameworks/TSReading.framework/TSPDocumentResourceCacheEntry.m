@interface TSPDocumentResourceCacheEntry
- (BOOL)wasDownloaded;
- (NSDate)contentAccessDate;
- (NSString)digestString;
- (NSURL)URL;
- (TSPDocumentResourceCacheEntry)init;
- (TSPDocumentResourceCacheEntry)initWithDigestString:(id)a3;
- (int64_t)accessCount;
- (int64_t)fileSize;
- (void)setAccessCount:(int64_t)a3;
- (void)setContentAccessDate:(id)a3;
- (void)setFileSize:(int64_t)a3;
- (void)setURL:(id)a3;
- (void)setWasDownloaded:(BOOL)a3;
@end

@implementation TSPDocumentResourceCacheEntry

- (TSPDocumentResourceCacheEntry)init
{
  v2 = [MEMORY[0x263F7C7F0] currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSPDocumentResourceCacheEntry init]"];
  v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCacheEntry.m"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:12 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  v7 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPDocumentResourceCacheEntry init]"];
  id v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (TSPDocumentResourceCacheEntry)initWithDigestString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPDocumentResourceCacheEntry;
  v5 = [(TSPDocumentResourceCacheEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    digestString = v5->_digestString;
    v5->_digestString = (NSString *)v6;
  }
  return v5;
}

- (NSString)digestString
{
  return self->_digestString;
}

- (int64_t)accessCount
{
  return self->_accessCount;
}

- (void)setAccessCount:(int64_t)a3
{
  self->_accessCount = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (NSDate)contentAccessDate
{
  return self->_contentAccessDate;
}

- (void)setContentAccessDate:(id)a3
{
}

- (BOOL)wasDownloaded
{
  return self->_wasDownloaded;
}

- (void)setWasDownloaded:(BOOL)a3
{
  self->_wasDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentAccessDate, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_digestString, 0);
}

@end
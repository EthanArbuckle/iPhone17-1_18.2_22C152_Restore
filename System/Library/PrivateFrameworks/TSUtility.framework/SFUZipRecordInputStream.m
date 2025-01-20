@interface SFUZipRecordInputStream
- (SFUZipRecordInputStream)initWithDataRepresentation:(id)a3;
- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5;
- (void)dealloc;
@end

@implementation SFUZipRecordInputStream

- (SFUZipRecordInputStream)initWithDataRepresentation:(id)a3
{
  self->mInput = (SFUBufferedInputStream *)(id)[a3 bufferedInputStream];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SFUZipRecordInputStream;
  [(SFUZipRecordInputStream *)&v3 dealloc];
}

- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5
{
  if (a3 < 0 || (a4 ^ 0x7FFFFFFFFFFFFFFFLL) < a3) {
    [MEMORY[0x263EFF940] raise:@"SFUZipArchiveError" format:@"Size overflow."];
  }
  int64_t v9 = a4 + a3;
  if (a5)
  {
    if (v9 > a5)
    {
      id v10 = +[TSUAssertionHandler currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[SFUZipRecordInputStream dataAtOffset:size:end:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/sf/SFUZipArchive.m"), 770, @"End offset is too small.");
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  int64_t mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || v9 > self->mBufferEnd)
  {
    [(SFUBufferedInputStream *)self->mInput seekToOffset:a3];
    unint64_t v13 = [(SFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mBuffer size:a5 - a3];
    if (v13 < a4) {
      [MEMORY[0x263EFF940] raise:@"SFUZipArchiveError" format:@"Could not read Zip record."];
    }
    self->int64_t mBufferStart = a3;
    self->mBufferEnd = v13 + a3;
    int64_t mBufferStart = a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

@end
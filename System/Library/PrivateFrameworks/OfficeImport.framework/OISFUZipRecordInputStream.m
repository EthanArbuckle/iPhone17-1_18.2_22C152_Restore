@interface OISFUZipRecordInputStream
- (OISFUZipRecordInputStream)initWithDataRepresentation:(id)a3;
- (const)dataAtOffset:(int64_t)a3 size:(unint64_t)a4 end:(int64_t)a5;
- (void)dealloc;
@end

@implementation OISFUZipRecordInputStream

- (OISFUZipRecordInputStream)initWithDataRepresentation:(id)a3
{
  self->mInput = (OISFUBufferedInputStream *)(id)[a3 bufferedInputStream];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OISFUZipRecordInputStream;
  [(OISFUZipRecordInputStream *)&v3 dealloc];
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
      uint64_t v10 = [NSString stringWithUTF8String:"-[OISFUZipRecordInputStream dataAtOffset:size:end:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUZipArchive.m"], 699, 0, "End offset is too small.");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
  }
  else
  {
    a5 = a4 + a3;
  }
  int64_t mBufferStart = self->mBufferStart;
  if (mBufferStart > a3 || v9 > self->mBufferEnd)
  {
    [(OISFUBufferedInputStream *)self->mInput seekToOffset:a3];
    unint64_t v12 = [(OISFUBufferedInputStream *)self->mInput readToOwnBuffer:&self->mBuffer size:a5 - a3];
    if (v12 < a4) {
      [MEMORY[0x263EFF940] raise:@"SFUZipArchiveError" format:@"Could not read Zip record."];
    }
    self->int64_t mBufferStart = a3;
    self->mBufferEnd = v12 + a3;
    int64_t mBufferStart = a3;
  }
  return &self->mBuffer[a3 - mBufferStart];
}

@end
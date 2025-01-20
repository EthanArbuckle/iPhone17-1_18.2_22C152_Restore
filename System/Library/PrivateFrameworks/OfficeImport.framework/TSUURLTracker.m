@interface TSUURLTracker
- (NSData)bookmarkData;
- (NSString)description;
- (NSURL)URL;
- (TSUURLTracker)init;
- (TSUURLTracker)initWithBookmarkData:(id)a3;
- (TSUURLTracker)initWithBookmarkData:(id)a3 delegate:(id)a4;
- (TSUURLTracker)initWithURL:(id)a3;
- (TSUURLTracker)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5;
- (TSUURLTracker)initWithURL:(id)a3 delegate:(id)a4;
- (id)URLAndReturnError:(id *)a3;
- (void)dealloc;
- (void)pause;
- (void)resume;
- (void)stop;
@end

@implementation TSUURLTracker

- (TSUURLTracker)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUURLTracker init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUURLTracker.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:56 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUURLTracker init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSUURLTracker)initWithURL:(id)a3 bookmarkData:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TSUURLTracker;
  v11 = [(TSUURLTracker *)&v15 init];
  if (v11)
  {
    v12 = [[TSUURLTrackerFilePresenter alloc] initWithURL:v8 bookmarkData:v9 delegate:v10];
    filePresenter = v11->_filePresenter;
    v11->_filePresenter = v12;

    [(TSUURLTracker *)v11 resume];
  }

  return v11;
}

- (TSUURLTracker)initWithURL:(id)a3
{
  return [(TSUURLTracker *)self initWithURL:a3 bookmarkData:0 delegate:0];
}

- (TSUURLTracker)initWithURL:(id)a3 delegate:(id)a4
{
  return [(TSUURLTracker *)self initWithURL:a3 bookmarkData:0 delegate:a4];
}

- (TSUURLTracker)initWithBookmarkData:(id)a3
{
  return [(TSUURLTracker *)self initWithURL:0 bookmarkData:a3 delegate:0];
}

- (TSUURLTracker)initWithBookmarkData:(id)a3 delegate:(id)a4
{
  return [(TSUURLTracker *)self initWithURL:0 bookmarkData:a3 delegate:a4];
}

- (void)dealloc
{
  v3 = self->_filePresenter;
  v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__TSUURLTracker_dealloc__block_invoke;
  block[3] = &unk_264D61310;
  id v8 = v3;
  uint64_t v5 = v3;
  dispatch_async(v4, block);

  v6.receiver = self;
  v6.super_class = (Class)TSUURLTracker;
  [(TSUURLTracker *)&v6 dealloc];
}

uint64_t __24__TSUURLTracker_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stop];
}

- (NSURL)URL
{
  return (NSURL *)[(TSUURLTrackerFilePresenter *)self->_filePresenter URLAndReturnError:0];
}

- (id)URLAndReturnError:(id *)a3
{
  return [(TSUURLTrackerFilePresenter *)self->_filePresenter URLAndReturnError:a3];
}

- (NSData)bookmarkData
{
  return [(TSUURLTrackerFilePresenter *)self->_filePresenter bookmarkData];
}

- (void)pause
{
}

- (void)resume
{
}

- (void)stop
{
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_super v6 = [MEMORY[0x263F08830] filePresenters];
  int v7 = [v6 containsObject:self->_filePresenter];
  id v8 = @"NO";
  if (v7) {
    id v8 = @"YES";
  }
  id v9 = [v3 stringWithFormat:@"<%@: %p started=%@ filePresenter=%@>", v5, self, v8, self->_filePresenter];

  return (NSString *)v9;
}

- (void).cxx_destruct
{
}

@end
@interface OCDReader
- (BOOL)isBinaryReader;
- (BOOL)isThumbnail;
- (BOOL)start;
- (BOOL)verifyFileFormat;
- (NSData)data;
- (NSError)startError;
- (NSString)fileName;
- (OCDReader)initWithCancelDelegate:(id)a3;
- (OCDReaderDelegate)delegate;
- (TCCancelDelegate)cancelDelegate;
- (id)read;
- (void)setCancelDelegate:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFileName:(id)a3;
- (void)setIsThumbnail:(BOOL)a3;
- (void)setStartError:(id)a3;
- (void)setStartErrorMessageFromException:(id)a3;
@end

@implementation OCDReader

- (void)setCancelDelegate:(id)a3
{
}

- (void)setIsThumbnail:(BOOL)a3
{
  self->mIsThumbnail = a3;
}

- (void)setData:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (NSString)fileName
{
  return self->mFileName;
}

- (NSData)data
{
  return self->mData;
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancelDelegate;
}

- (BOOL)isThumbnail
{
  return self->mIsThumbnail;
}

- (OCDReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (OCDReaderDelegate *)WeakRetained;
}

- (OCDReader)initWithCancelDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OCDReader;
  v5 = [(OCDReader *)&v8 init];
  v6 = v5;
  if (v5) {
    [(OCDReader *)v5 setCancelDelegate:v4];
  }

  return v6;
}

- (void)setStartErrorMessageFromException:(id)a3
{
  id v4 = +[TCMessageException nsError:a3 domain:@"com.apple.iWork.compatibility.officeImport"];
  -[OCDReader setStartError:](self, "setStartError:");
}

- (void)setFileName:(id)a3
{
}

- (NSError)startError
{
  return self->mStartError;
}

- (void)setStartError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mStartError, 0);
  objc_storeStrong((id *)&self->mData, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
}

- (BOOL)isBinaryReader
{
  return 0;
}

- (BOOL)start
{
  return 0;
}

- (id)read
{
  return 0;
}

- (BOOL)verifyFileFormat
{
  return 1;
}

@end
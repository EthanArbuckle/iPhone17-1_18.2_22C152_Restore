@interface MFIMAPDownload
- (BOOL)isComplete;
- (BOOL)isSuccessful;
- (MFBaseFilterDataConsumer)mainConsumer;
- (MFIMAPDownload)initWithUid:(unsigned int)a3;
- (id)error;
- (unint64_t)bytesFetched;
- (unint64_t)expectedLength;
- (unint64_t)lengthOfDataBeforeLineConversion;
- (unsigned)uid;
@end

@implementation MFIMAPDownload

- (MFIMAPDownload)initWithUid:(unsigned int)a3
{
  if (a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MFIMAPDownload;
    v4 = [(MFIMAPDownload *)&v7 init];
    if (v4) {
      v4->_uid = a3;
    }
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)expectedLength
{
  return 0;
}

- (BOOL)isComplete
{
  return 0;
}

- (BOOL)isSuccessful
{
  return 0;
}

- (unint64_t)bytesFetched
{
  return 0;
}

- (id)error
{
  return 0;
}

- (unint64_t)lengthOfDataBeforeLineConversion
{
  return 0;
}

- (MFBaseFilterDataConsumer)mainConsumer
{
  return self->_mainConsumer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainConsumer, 0);
  objc_storeStrong((id *)&self->_countingConsumer, 0);
  objc_storeStrong((id *)&self->_pendingFetchResults, 0);
}

@end
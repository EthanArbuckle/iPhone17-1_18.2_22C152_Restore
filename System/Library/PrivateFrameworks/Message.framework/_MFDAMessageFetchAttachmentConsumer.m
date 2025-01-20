@interface _MFDAMessageFetchAttachmentConsumer
- (BOOL)dataWasBase64;
- (BOOL)fetchSucceeded;
- (MFProgressFilterDataConsumer)progressFilter;
- (_MFDAMessageFetchAttachmentConsumer)initWithActivityMonitor:(id)a3;
- (unint64_t)expectedLength;
- (void)attachmentFetchCompletedWithStatus:(int64_t)a3 forAttachmentNamed:(id)a4 ofMessageWithServerID:(id)a5 dataWasBase64:(BOOL)a6 sentBytesCount:(unint64_t)a7 receivedBytesCount:(unint64_t)a8;
- (void)consumeData:(id)a3 ofContentType:(id)a4 forAttachmentNamed:(id)a5 ofMessageWithServerID:(id)a6;
- (void)setExpectedLength:(unint64_t)a3;
- (void)setProgressFilter:(id)a3;
@end

@implementation _MFDAMessageFetchAttachmentConsumer

- (void)consumeData:(id)a3 ofContentType:(id)a4 forAttachmentNamed:(id)a5 ofMessageWithServerID:(id)a6
{
  id v8 = a3;
  v7 = [(_MFDAMessageFetchAttachmentConsumer *)self progressFilter];
  [v7 appendData:v8];

  self->_accumulatedLength += [v8 length];
  if ([(_MFDAMessageFetchAttachmentConsumer *)self expectedLength] != 0x7FFFFFFFFFFFFFFFLL
    && [(_MFDAMessageFetchAttachmentConsumer *)self expectedLength])
  {
    [(MFActivityMonitor *)self->_monitor setPercentDone:(double)self->_accumulatedLength/ (double)[(_MFDAMessageFetchAttachmentConsumer *)self expectedLength]];
  }
}

- (void)attachmentFetchCompletedWithStatus:(int64_t)a3 forAttachmentNamed:(id)a4 ofMessageWithServerID:(id)a5 dataWasBase64:(BOOL)a6 sentBytesCount:(unint64_t)a7 receivedBytesCount:(unint64_t)a8
{
  -[MFActivityMonitor recordBytesWritten:](self->_monitor, "recordBytesWritten:", a7, a4, a5);
  [(MFActivityMonitor *)self->_monitor recordBytesRead:a8];
  self->_fetchSucceeded = a3 == 2;
  self->_dataWasBase64 = a6;
  [(MFDAMailAccountConsumer *)self setDone:1];
}

- (_MFDAMessageFetchAttachmentConsumer)initWithActivityMonitor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MFDAMessageFetchAttachmentConsumer;
  v6 = [(MFDAMailAccountConsumer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_monitor, a3);
  }

  return v7;
}

- (MFProgressFilterDataConsumer)progressFilter
{
  return self->_progressFilter;
}

- (void)setProgressFilter:(id)a3
{
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (BOOL)dataWasBase64
{
  return self->_dataWasBase64;
}

- (BOOL)fetchSucceeded
{
  return self->_fetchSucceeded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_progressFilter, 0);
}

@end
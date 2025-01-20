@interface _MSVStreamWriterPendingData
- (NSData)data;
- (id)completionHandler;
- (int64_t)bytesWritten;
- (void)setBytesWritten:(int64_t)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setData:(id)a3;
@end

@implementation _MSVStreamWriterPendingData

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setBytesWritten:(int64_t)a3
{
  self->_bytesWritten = a3;
}

- (int64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

@end
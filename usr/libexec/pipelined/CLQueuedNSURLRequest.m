@interface CLQueuedNSURLRequest
- (CLQueuedNSURLRequest)initWithRequest:(id)a3;
- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4;
- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4 andResumeData:(id)a5 andCountOfBytesClientExpectsToReceive:(int64_t)a6;
- (NSData)resumeData;
- (NSURLRequest)request;
- (id)description;
- (id)downloadTaskWithSession:(id)a3;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)priority;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
@end

@implementation CLQueuedNSURLRequest

- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4 andResumeData:(id)a5 andCountOfBytesClientExpectsToReceive:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CLQueuedNSURLRequest;
  v13 = [(CLQueuedNSURLRequest *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    v14->_priority = a4;
    objc_storeStrong((id *)&v14->_resumeData, a5);
    v14->_countOfBytesClientExpectsToReceive = a6;
    v15 = v14;
  }

  return v14;
}

- (CLQueuedNSURLRequest)initWithRequest:(id)a3 withPriority:(int64_t)a4
{
  return [(CLQueuedNSURLRequest *)self initWithRequest:a3 withPriority:a4 andResumeData:0 andCountOfBytesClientExpectsToReceive:NSURLSessionTransferSizeUnknown];
}

- (CLQueuedNSURLRequest)initWithRequest:(id)a3
{
  return [(CLQueuedNSURLRequest *)self initWithRequest:a3 withPriority:0 andResumeData:0 andCountOfBytesClientExpectsToReceive:NSURLSessionTransferSizeUnknown];
}

- (id)downloadTaskWithSession:(id)a3
{
  id v4 = a3;
  v5 = [(CLQueuedNSURLRequest *)self resumeData];

  if (v5)
  {
    v6 = [(CLQueuedNSURLRequest *)self resumeData];
    [v4 downloadTaskWithResumeData:v6];
  }
  else
  {
    v6 = [(CLQueuedNSURLRequest *)self request];
    [v4 downloadTaskWithRequest:v6];
  v7 = };

  unint64_t v8 = [(CLQueuedNSURLRequest *)self priority];
  if (v8 <= 2)
  {
    LODWORD(v9) = *(_DWORD *)*(&off_10046B048 + v8);
    [v7 setPriority:v9];
  }
  [v7 setCountOfBytesClientExpectsToReceive:-[CLQueuedNSURLRequest countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive")];

  return v7;
}

- (id)description
{
  v2 = [(CLQueuedNSURLRequest *)self request];
  v3 = [v2 description];

  return v3;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resumeData, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

@end
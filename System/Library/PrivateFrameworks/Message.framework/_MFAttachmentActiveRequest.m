@interface _MFAttachmentActiveRequest
- (BOOL)wantsCompletionBlockOffMainThread;
- (MFAttachment)attachment;
- (NSProgress)downloadProgress;
- (_MFAttachmentActiveRequest)initWithAttachment:(id)a3;
- (double)lastProgressTime;
- (id)fetchCompletionBlock;
- (int64_t)lastProgressBytes;
- (void)completeWithData:(id)a3 error:(id)a4;
- (void)setLastProgressBytes:(int64_t)a3;
- (void)setLastProgressTime:(double)a3;
@end

@implementation _MFAttachmentActiveRequest

- (_MFAttachmentActiveRequest)initWithAttachment:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_MFAttachmentActiveRequest;
  v6 = [(_MFAttachmentActiveRequest *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachment, a3);
    v8 = [v5 fetchCompletionBlock];
    uint64_t v9 = [v8 copy];
    id fetchCompletionBlock = v7->_fetchCompletionBlock;
    v7->_id fetchCompletionBlock = (id)v9;

    uint64_t v11 = [v5 newDownloadProgress];
    downloadProgress = v7->_downloadProgress;
    v7->_downloadProgress = (NSProgress *)v11;

    v7->_wantsCompletionBlockOffMainThread = [v5 wantsCompletionBlockOffMainThread];
    [v5 setFetchCompletionBlock:0];
  }

  return v7;
}

- (void)completeWithData:(id)a3 error:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id fetchCompletionBlock = (void (**)(id, void *, id, id))self->_fetchCompletionBlock;
  if (fetchCompletionBlock)
  {
    v8 = [(_MFAttachmentActiveRequest *)self attachment];
    uint64_t v9 = [v8 fileURL];
    fetchCompletionBlock[2](fetchCompletionBlock, v9, v11, v6);

    id v10 = self->_fetchCompletionBlock;
    self->_id fetchCompletionBlock = 0;
  }
}

- (MFAttachment)attachment
{
  return self->_attachment;
}

- (NSProgress)downloadProgress
{
  return self->_downloadProgress;
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (BOOL)wantsCompletionBlockOffMainThread
{
  return self->_wantsCompletionBlockOffMainThread;
}

- (int64_t)lastProgressBytes
{
  return self->_lastProgressBytes;
}

- (void)setLastProgressBytes:(int64_t)a3
{
  self->_lastProgressBytes = a3;
}

- (double)lastProgressTime
{
  return self->_lastProgressTime;
}

- (void)setLastProgressTime:(double)a3
{
  self->_lastProgressTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_downloadProgress, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
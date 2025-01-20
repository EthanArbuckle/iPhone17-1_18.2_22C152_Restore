@interface PXGVideoSessionPixelBufferSource
- (CGAffineTransform)preferredTransform;
- (CGSize)maxOutputSize;
- (PXGVideoSessionPixelBufferSource)init;
- (PXGVideoSessionPixelBufferSource)initWithVideoSession:(id)a3 maxOutputSize:(CGSize)a4;
- (PXVideoSession)videoSession;
- (__CVBuffer)currentPixelBuffer;
- (id)pixelBufferDidChangeHandler;
- (id)providePlaceholderHandler;
- (void)dealloc;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setPixelBufferDidChangeHandler:(id)a3;
- (void)setProvidePlaceholderHandler:(id)a3;
@end

@implementation PXGVideoSessionPixelBufferSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong(&self->_providePlaceholderHandler, 0);
  objc_storeStrong(&self->_pixelBufferDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_bufferRequestIdentifier, 0);
}

- (CGSize)maxOutputSize
{
  double width = self->_maxOutputSize.width;
  double height = self->_maxOutputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (id)providePlaceholderHandler
{
  return self->_providePlaceholderHandler;
}

- (void)setPixelBufferDidChangeHandler:(id)a3
{
}

- (id)pixelBufferDidChangeHandler
{
  return self->_pixelBufferDidChangeHandler;
}

- (CGAffineTransform)preferredTransform
{
  v4 = [(PXGVideoSessionPixelBufferSource *)self videoSession];
  if (v4)
  {
    v6 = v4;
    [v4 preferredTransform];
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (__CVBuffer)currentPixelBuffer
{
  v2 = [(PXGVideoSessionPixelBufferSource *)self videoSession];
  v3 = (__CVBuffer *)[v2 currentPixelBuffer];

  return v3;
}

- (void)setProvidePlaceholderHandler:(id)a3
{
  v4 = (void *)[a3 copy];
  id providePlaceholderHandler = self->_providePlaceholderHandler;
  self->_id providePlaceholderHandler = v4;

  id v8 = [(PXGVideoSessionPixelBufferSource *)self videoSession];
  if ([v8 isPlayable])
  {
  }
  else
  {
    id v6 = self->_providePlaceholderHandler;

    if (v6)
    {
      v7 = (void (*)(void))*((void *)self->_providePlaceholderHandler + 2);
      v7();
    }
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6 = a4;
  id v14 = a3;
  if ((void *)VideoSessionObservableContext != a5)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PXGVideoSessionPixelBufferSource.m" lineNumber:60 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x400) != 0)
  {
    v9 = [(PXGVideoSessionPixelBufferSource *)self pixelBufferDidChangeHandler];

    if (v9)
    {
      v10 = [(PXGVideoSessionPixelBufferSource *)self pixelBufferDidChangeHandler];
      v10[2]();
    }
  }
  if ((v6 & 0x20) != 0)
  {
    v11 = [(PXGVideoSessionPixelBufferSource *)self videoSession];
    if (([v11 isPlayable] & 1) == 0)
    {
      v12 = [(PXGVideoSessionPixelBufferSource *)self providePlaceholderHandler];

      if (!v12) {
        goto LABEL_10;
      }
      v11 = [(PXGVideoSessionPixelBufferSource *)self providePlaceholderHandler];
      v11[2]();
    }
  }
LABEL_10:
}

- (void)dealloc
{
  [(PXVideoSession *)self->_videoSession cancelPixelBufferOutputWithRequestIdentifier:self->_bufferRequestIdentifier];
  v3.receiver = self;
  v3.super_class = (Class)PXGVideoSessionPixelBufferSource;
  [(PXGVideoSessionPixelBufferSource *)&v3 dealloc];
}

- (PXGVideoSessionPixelBufferSource)initWithVideoSession:(id)a3 maxOutputSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGVideoSessionPixelBufferSource;
  v9 = [(PXGVideoSessionPixelBufferSource *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoSession, a3);
    v10->_maxOutputSize.double width = width;
    v10->_maxOutputSize.double height = height;
    id v11 = [NSString alloc];
    v12 = [(id)objc_opt_class() description];
    v13 = [MEMORY[0x1E4F29128] UUID];
    id v14 = [v13 UUIDString];
    uint64_t v15 = [v11 initWithFormat:@"%@-%@", v12, v14];
    bufferRequestIdentifier = v10->_bufferRequestIdentifier;
    v10->_bufferRequestIdentifier = (NSString *)v15;

    [v8 registerChangeObserver:v10 context:VideoSessionObservableContext];
    objc_msgSend(v8, "requestPixelBufferOutputWithRequestIdentifier:maxOutputSize:", v10->_bufferRequestIdentifier, width, height);
  }

  return v10;
}

- (PXGVideoSessionPixelBufferSource)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGVideoSessionPixelBufferSource.m", 28, @"%s is not available as initializer", "-[PXGVideoSessionPixelBufferSource init]");

  abort();
}

@end
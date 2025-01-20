@interface PXVideoProcessingOperation
+ (id)new;
- (PXVideoProcessingOperation)init;
- (PXVideoProcessingOperation)initWithSpec:(id)a3;
- (PXVideoProcessingOperationResult)result;
- (PXVideoProcessingOperationSpec)spec;
- (id)performProcessing;
- (id)progressHandler;
- (void)main;
- (void)setProgressHandler:(id)a3;
@end

@implementation PXVideoProcessingOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (PXVideoProcessingOperationResult)result
{
  return self->_result;
}

- (PXVideoProcessingOperationSpec)spec
{
  return self->_spec;
}

- (id)performProcessing
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXVideoProcessingOperation.m", 37, @"Method %s is a responsibility of subclass %@", "-[PXVideoProcessingOperation performProcessing]", v6 object file lineNumber description];

  abort();
}

- (void)main
{
  v3 = [(PXVideoProcessingOperation *)self performProcessing];
  result = self->_result;
  self->_result = v3;
}

- (PXVideoProcessingOperation)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXVideoProcessingOperation.m", 24, @"%s is not available as initializer", "-[PXVideoProcessingOperation init]");

  abort();
}

- (PXVideoProcessingOperation)initWithSpec:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXVideoProcessingOperation;
  v5 = [(PXVideoProcessingOperation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    spec = v5->_spec;
    v5->_spec = (PXVideoProcessingOperationSpec *)v6;
  }
  return v5;
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXVideoProcessingOperation.m", 28, @"%s is not available as initializer", "+[PXVideoProcessingOperation new]");

  abort();
}

@end
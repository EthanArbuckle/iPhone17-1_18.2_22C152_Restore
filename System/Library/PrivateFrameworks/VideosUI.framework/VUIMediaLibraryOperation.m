@interface VUIMediaLibraryOperation
- (NSError)error;
- (VUIAsynchronousWorkToken)asyncWorkToken;
- (VUIMediaLibrary)mediaLibrary;
- (VUIMediaLibraryOperation)init;
- (VUIMediaLibraryOperation)initWithMediaLibrary:(id)a3;
- (void)cancel;
- (void)setAsyncWorkToken:(id)a3;
- (void)setError:(id)a3;
- (void)setMediaLibrary:(id)a3;
@end

@implementation VUIMediaLibraryOperation

- (VUIMediaLibraryOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaLibraryOperation)initWithMediaLibrary:(id)a3
{
  id v5 = a3;
  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"mediaLibrary" format];
  }
  v9.receiver = self;
  v9.super_class = (Class)VUIMediaLibraryOperation;
  v6 = [(VUIMediaLibraryOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mediaLibrary, a3);
  }

  return v7;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VUIMediaLibraryOperation;
  [(VUIMediaLibraryOperation *)&v4 cancel];
  v3 = [(VUIMediaLibraryOperation *)self asyncWorkToken];
  [v3 cancel];

  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (VUIMediaLibrary)mediaLibrary
{
  return self->_mediaLibrary;
}

- (void)setMediaLibrary:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (VUIAsynchronousWorkToken)asyncWorkToken
{
  return self->_asyncWorkToken;
}

- (void)setAsyncWorkToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncWorkToken, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_mediaLibrary, 0);
}

@end
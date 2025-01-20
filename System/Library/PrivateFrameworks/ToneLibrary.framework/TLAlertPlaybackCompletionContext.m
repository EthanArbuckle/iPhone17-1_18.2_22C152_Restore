@interface TLAlertPlaybackCompletionContext
- (NSError)error;
- (id)completionHandler;
- (id)description;
- (int64_t)playbackCompletionType;
- (void)setCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setPlaybackCompletionType:(int64_t)a3;
@end

@implementation TLAlertPlaybackCompletionContext

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  v7 = NSStringFromTLAlertPlaybackCompletionType(self->_playbackCompletionType);
  [v6 appendFormat:@"; playbackCompletionType = %@", v7];

  error = self->_error;
  if (error)
  {
    v9 = [(NSError *)error tl_nonRedundantDescription];
    [v6 appendFormat:@"; error = %@", v9];
  }
  if (self->_completionHandler) {
    [v6 appendString:@"; completionHandler != NULL"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (int64_t)playbackCompletionType
{
  return self->_playbackCompletionType;
}

- (void)setPlaybackCompletionType:(int64_t)a3
{
  self->_playbackCompletionType = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end
@interface OCCancel
- (BOOL)isCancelled;
- (BOOL)isQuit;
- (OCCancel)init;
- (void)cancel;
- (void)quit;
@end

@implementation OCCancel

- (OCCancel)init
{
  v3.receiver = self;
  v3.super_class = (Class)OCCancel;
  result = [(OCCancel *)&v3 init];
  if (result) {
    *(_WORD *)&result->mIsCancelled = 0;
  }
  return result;
}

- (void)cancel
{
  self->mIsCancelled = 1;
}

- (BOOL)isCancelled
{
  return self->mIsCancelled;
}

- (void)quit
{
  *(_WORD *)&self->mIsCancelled = 257;
}

- (BOOL)isQuit
{
  return self->mIsQuit;
}

@end
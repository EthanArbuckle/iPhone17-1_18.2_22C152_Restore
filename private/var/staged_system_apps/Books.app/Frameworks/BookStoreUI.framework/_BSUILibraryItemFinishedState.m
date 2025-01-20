@interface _BSUILibraryItemFinishedState
- (BOOL)hasSpecifiedFinishedDate;
- (BOOL)isFinished;
- (void)setHasSpecifiedFinishedDate:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
@end

@implementation _BSUILibraryItemFinishedState

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (BOOL)hasSpecifiedFinishedDate
{
  return self->_hasSpecifiedFinishedDate;
}

- (void)setHasSpecifiedFinishedDate:(BOOL)a3
{
  self->_hasSpecifiedFinishedDate = a3;
}

@end
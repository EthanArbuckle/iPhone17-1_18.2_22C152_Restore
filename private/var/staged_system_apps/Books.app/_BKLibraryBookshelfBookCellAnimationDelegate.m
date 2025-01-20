@interface _BKLibraryBookshelfBookCellAnimationDelegate
- (id)completionBlock;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setCompletionBlock:(id)a3;
@end

@implementation _BKLibraryBookshelfBookCellAnimationDelegate

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [(_BKLibraryBookshelfBookCellAnimationDelegate *)self completionBlock];
  if (v5)
  {
    id v6 = v5;
    v5[2](v5, v4);
    v5 = (void (**)(void, void))v6;
  }
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface _MFTapPreventingRecognizer
- (BOOL)_isMatchingTapGestureRecognizer:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
@end

@implementation _MFTapPreventingRecognizer

- (BOOL)_isMatchingTapGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 numberOfTapsRequired];
    BOOL v6 = v5 == [(_MFTapPreventingRecognizer *)self numberOfTapsRequired];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return ![(_MFTapPreventingRecognizer *)self _isMatchingTapGestureRecognizer:a3];
}

@end
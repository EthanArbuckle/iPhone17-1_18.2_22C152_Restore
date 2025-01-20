@interface SFBlockBasedPopoverSourceInfo
- (BOOL)shouldHideArrow;
- (BOOL)shouldPassthroughSuperview;
- (CGRect)popoverSourceRect;
- (SFBlockBasedPopoverSourceInfo)initWithSourceInfoProvider:(id)a3;
- (UIBarButtonItem)barButtonItem;
- (UIView)popoverSourceView;
- (int64_t)provenance;
- (unint64_t)permittedArrowDirections;
@end

@implementation SFBlockBasedPopoverSourceInfo

- (SFBlockBasedPopoverSourceInfo)initWithSourceInfoProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFBlockBasedPopoverSourceInfo;
  v5 = [(SFBlockBasedPopoverSourceInfo *)&v10 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id sourceInfoProvider = v5->_sourceInfoProvider;
    v5->_id sourceInfoProvider = v6;

    v8 = v5;
  }

  return v5;
}

- (UIBarButtonItem)barButtonItem
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 barButtonItem];
  }
  else
  {
    v3 = 0;
  }

  return (UIBarButtonItem *)v3;
}

- (UIView)popoverSourceView
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 popoverSourceView];
  }
  else
  {
    v3 = 0;
  }

  return (UIView *)v3;
}

- (CGRect)popoverSourceRect
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector())
  {
    [v2 popoverSourceRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB20];
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)shouldPassthroughSuperview
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldPassthroughSuperview];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)shouldHideArrow
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldHideArrow];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (unint64_t)permittedArrowDirections
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector()) {
    unint64_t v3 = [v2 permittedArrowDirections];
  }
  else {
    unint64_t v3 = 15;
  }

  return v3;
}

- (int64_t)provenance
{
  v2 = (*((void (**)(void))self->_sourceInfoProvider + 2))();
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 provenance];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end
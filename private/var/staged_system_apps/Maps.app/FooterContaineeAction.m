@interface FooterContaineeAction
- (BOOL)isEnabled;
- (id)actionBlock;
- (int64_t)actionStyle;
- (int64_t)cellStyle;
- (void)loadSubtitleWithCompletion:(id)a3;
- (void)setActionBlock:(id)a3;
- (void)setCellStyle:(int64_t)a3;
@end

@implementation FooterContaineeAction

- (void)loadSubtitleWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, &stru_101324E70);
  }
}

- (BOOL)isEnabled
{
  return 1;
}

- (int64_t)actionStyle
{
  return (id)[(SimpleContaineeAction *)self style] == (id)1;
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (void)setCellStyle:(int64_t)a3
{
  self->_cellStyle = a3;
}

- (void).cxx_destruct
{
}

@end
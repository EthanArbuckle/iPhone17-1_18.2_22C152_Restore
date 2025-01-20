@interface PMState
- (PMState)init;
- (id)currentRowStyle;
- (id)listState;
- (void)setCurrentRowStyle:(id)a3;
@end

@implementation PMState

- (PMState)init
{
  v6.receiver = self;
  v6.super_class = (Class)PMState;
  v2 = [(CMState *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CMOutlineState);
    mListState = v2->mListState;
    v2->mListState = v3;
  }
  return v2;
}

- (id)listState
{
  return self->mListState;
}

- (id)currentRowStyle
{
  return self->mCurrentRowStyle;
}

- (void)setCurrentRowStyle:(id)a3
{
  v5 = (OADTablePartStyle *)a3;
  if (self->mCurrentRowStyle != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->mCurrentRowStyle, a3);
    v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCurrentRowStyle, 0);
  objc_storeStrong((id *)&self->mListState, 0);
}

@end
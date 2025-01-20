@interface PREditorLookViews
- (NSArray)contentViews;
- (PREditorLookViews)init;
- (UIView)backgroundView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (void)enumerateViewsUsingBlock:(id)a3;
@end

@implementation PREditorLookViews

- (PREditorLookViews)init
{
  v10.receiver = self;
  v10.super_class = (Class)PREditorLookViews;
  v2 = [(PREditorLookViews *)&v10 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    foregroundView = v2->_foregroundView;
    v2->_foregroundView = v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    floatingView = v2->_floatingView;
    v2->_floatingView = v7;
  }
  return v2;
}

- (void)enumerateViewsUsingBlock:(id)a3
{
  v4 = (void (**)(id, UIView *, uint64_t))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_foregroundView, 1);
  (*v4)(v6, self->_floatingView, 2);
}

- (NSArray)contentViews
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_backgroundView;
  floatingView = self->_floatingView;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  return (NSArray *)v2;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
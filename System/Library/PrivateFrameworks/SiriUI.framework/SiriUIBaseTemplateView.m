@interface SiriUIBaseTemplateView
- (SiriUIBaseTemplateView)initWithDataSource:(id)a3;
- (SiriUITemplateModel)dataSource;
- (SiriUITemplatedView)templatedSuperview;
- (double)desiredHeight;
- (void)removeFromTemplatedSuperview;
- (void)setDataSource:(id)a3;
- (void)setTemplatedSuperview:(id)a3;
@end

@implementation SiriUIBaseTemplateView

- (SiriUIBaseTemplateView)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SiriUIBaseTemplateView;
  v5 = -[SiriUIBaseTemplateView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (double)desiredHeight
{
  return 0.0;
}

- (void)removeFromTemplatedSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templatedSuperview);
  [WeakRetained templateSubviewWantsToBeRemovedFromHierarchy:self];
}

- (SiriUITemplatedView)templatedSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_templatedSuperview);
  return (SiriUITemplatedView *)WeakRetained;
}

- (void)setTemplatedSuperview:(id)a3
{
}

- (SiriUITemplateModel)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SiriUITemplateModel *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_templatedSuperview);
}

@end
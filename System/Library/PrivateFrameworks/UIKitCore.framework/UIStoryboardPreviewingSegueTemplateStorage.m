@interface UIStoryboardPreviewingSegueTemplateStorage
- (UIStoryboardPreviewingSegueTemplate)previewTemplate;
- (UIStoryboardPreviewingSegueTemplateStorage)initWithCoder:(id)a3;
- (UIStoryboardSegueTemplate)commitTemplate;
- (UIView)sender;
- (void)setCommitTemplate:(id)a3;
- (void)setPreviewTemplate:(id)a3;
- (void)setSender:(id)a3;
@end

@implementation UIStoryboardPreviewingSegueTemplateStorage

- (UIStoryboardPreviewingSegueTemplateStorage)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIStoryboardPreviewingSegueTemplateStorage;
  return [(UIStoryboardPreviewingSegueTemplateStorage *)&v4 init];
}

- (UIView)sender
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sender);
  return (UIView *)WeakRetained;
}

- (void)setSender:(id)a3
{
}

- (UIStoryboardPreviewingSegueTemplate)previewTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewTemplate);
  return (UIStoryboardPreviewingSegueTemplate *)WeakRetained;
}

- (void)setPreviewTemplate:(id)a3
{
}

- (UIStoryboardSegueTemplate)commitTemplate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commitTemplate);
  return (UIStoryboardSegueTemplate *)WeakRetained;
}

- (void)setCommitTemplate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commitTemplate);
  objc_destroyWeak((id *)&self->_previewTemplate);
  objc_destroyWeak((id *)&self->_sender);
}

@end
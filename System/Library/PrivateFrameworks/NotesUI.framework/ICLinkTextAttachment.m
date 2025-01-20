@interface ICLinkTextAttachment
- (ICLinkEditorDelegate)linkDelegate;
- (ICLinkMenuDelegate)linkMenuDelegate;
- (void)setLinkDelegate:(id)a3;
- (void)setLinkMenuDelegate:(id)a3;
@end

@implementation ICLinkTextAttachment

- (ICLinkEditorDelegate)linkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);
  return (ICLinkEditorDelegate *)WeakRetained;
}

- (void)setLinkDelegate:(id)a3
{
}

- (ICLinkMenuDelegate)linkMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkMenuDelegate);
  return (ICLinkMenuDelegate *)WeakRetained;
}

- (void)setLinkMenuDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_linkMenuDelegate);
  objc_destroyWeak((id *)&self->_linkDelegate);
}

@end
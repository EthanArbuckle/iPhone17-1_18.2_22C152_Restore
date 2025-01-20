@interface ICAttachmentViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)forManualRendering;
- (ICAttachment)attachment;
- (ICAttachmentViewController)initWithCoder:(id)a3;
- (ICAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4;
- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5;
- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5;
- (ICTextAttachment)textAttachment;
- (NSLayoutManager)layoutManager;
- (NSTextLayoutManager)textLayoutManager;
- (void)loadView;
- (void)setForManualRendering:(BOOL)a3;
- (void)setTextAttachment:(id)a3;
@end

@implementation ICAttachmentViewController

- (ICAttachmentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (ICAttachmentViewController)initWithCoder:(id)a3
{
  return 0;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 layoutManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentViewController;
  v10 = [(ICAttachmentViewController *)&v14 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    v12 = [v8 attachment];
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_layoutManager, v9);
  }

  return v11;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4 textLayoutManager:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICAttachmentViewController;
  v10 = [(ICAttachmentViewController *)&v14 initWithNibName:0 bundle:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textAttachment, v8);
    v12 = [v8 attachment];
    objc_storeWeak((id *)&v11->_attachment, v12);

    v11->_forManualRendering = a4;
    objc_storeWeak((id *)&v11->_textLayoutManager, v9);
  }

  return v11;
}

- (ICAttachmentViewController)initWithTextAttachment:(id)a3 forManualRendering:(BOOL)a4
{
  return [(ICAttachmentViewController *)self initWithTextAttachment:a3 forManualRendering:a4 layoutManager:0];
}

- (void)loadView
{
  v3 = [(ICAttachmentViewController *)self textLayoutManager];
  v4 = [v3 textContainer];
  v5 = v4;
  if (v4)
  {
    id v12 = v4;
  }
  else
  {
    v6 = [(ICAttachmentViewController *)self layoutManager];
    v7 = [v6 textContainers];
    id v12 = [v7 lastObject];
  }
  BOOL v8 = [(ICAttachmentViewController *)self forManualRendering];
  id v9 = [(ICAttachmentViewController *)self textAttachment];
  v10 = v9;
  if (v8) {
    [v9 newlyCreatedViewForManualRenderingInTextContainer:v12];
  }
  else {
  v11 = [v9 newlyCreatedViewForTextContainer:v12];
  }
  [(ICAttachmentViewController *)self setView:v11];
}

- (ICTextAttachment)textAttachment
{
  p_textAttachment = &self->_textAttachment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  if (!WeakRetained)
  {
    if (![(ICAttachmentViewController *)self isViewLoaded]) {
      goto LABEL_5;
    }
    objc_opt_class();
    v5 = [(ICAttachmentViewController *)self view];
    WeakRetained = ICDynamicCast();

    v6 = [WeakRetained textAttachment];
    objc_storeWeak((id *)p_textAttachment, v6);
  }
LABEL_5:
  id v7 = objc_loadWeakRetained((id *)p_textAttachment);

  return (ICTextAttachment *)v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)forManualRendering
{
  return self->_forManualRendering;
}

- (void)setForManualRendering:(BOOL)a3
{
  self->_forManualRendering = a3;
}

- (ICAttachment)attachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachment);

  return (ICAttachment *)WeakRetained;
}

- (void)setTextAttachment:(id)a3
{
}

- (NSLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (NSLayoutManager *)WeakRetained;
}

- (NSTextLayoutManager)textLayoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textLayoutManager);

  return (NSTextLayoutManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textLayoutManager);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_destroyWeak((id *)&self->_textAttachment);

  objc_destroyWeak((id *)&self->_attachment);
}

@end
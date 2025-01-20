@interface ICImagePreviewController
- (BOOL)_canShowWhileLocked;
- (ICAttachment)attachment;
- (ICImagePreviewController)initWithAttachment:(id)a3;
- (void)setAttachment:(id)a3;
@end

@implementation ICImagePreviewController

- (ICImagePreviewController)initWithAttachment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICImagePreviewController;
  v5 = [(ICImagePreviewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(ICImagePreviewController *)v5 setAttachment:v4];
  }

  return v6;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
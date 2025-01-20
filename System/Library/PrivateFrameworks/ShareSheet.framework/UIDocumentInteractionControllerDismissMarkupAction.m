@interface UIDocumentInteractionControllerDismissMarkupAction
+ (id)actionWithTitle:(id)a3 handler:(id)a4;
+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
- (NSString)title;
- (UIDocumentInteractionControllerDismissMarkupAction)initWithTitle:(id)a3 image:(id)a4 handler:(id)a5;
- (UIImage)image;
- (id)completionHandler;
- (void)setCompletionHandler:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIDocumentInteractionControllerDismissMarkupAction

- (UIDocumentInteractionControllerDismissMarkupAction)initWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentInteractionControllerDismissMarkupAction;
  v11 = [(UIDocumentInteractionControllerDismissMarkupAction *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    objc_storeStrong((id *)&v11->_image, a4);
    uint64_t v14 = [v10 copy];
    id completionHandler = v11->_completionHandler;
    v11->_id completionHandler = (id)v14;
  }
  return v11;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[UIDocumentInteractionControllerDismissMarkupAction alloc] initWithTitle:v6 image:0 handler:v5];

  return v7;
}

+ (id)actionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[UIDocumentInteractionControllerDismissMarkupAction alloc] initWithTitle:v9 image:v8 handler:v7];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
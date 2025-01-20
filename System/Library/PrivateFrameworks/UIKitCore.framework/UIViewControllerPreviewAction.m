@interface UIViewControllerPreviewAction
+ (id)actionWithTitle:(id)a3 handler:(id)a4;
- (NSString)title;
- (id)_initWithTitle:(id)a3 handler:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIViewControllerPreviewAction

- (id)_initWithTitle:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)UIViewControllerPreviewAction;
  v8 = [(UIViewControllerPreviewAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(UIViewControllerPreviewAction *)v8 setTitle:v6];
    [(UIViewControllerPreviewAction *)v9 setHandler:v7];
  }

  return v9;
}

+ (id)actionWithTitle:(id)a3 handler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[UIViewControllerPreviewAction alloc] _initWithTitle:v6 handler:v5];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = [(UIViewControllerPreviewAction *)self title];
  [v4 setTitle:v5];

  id v6 = [(UIViewControllerPreviewAction *)self handler];
  [v4 setHandler:v6];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
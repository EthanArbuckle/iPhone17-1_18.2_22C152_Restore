@interface SUScriptNativeUIButton
+ (id)objectWithDefaultButtonForScriptButton:(id)a3;
- (UIEdgeInsets)imageInsets;
- (id)image;
- (id)title;
- (int64_t)tag;
- (void)connectButtonAction;
- (void)destroyNativeObject;
- (void)disconnectButtonAction;
- (void)setImage:(id)a3;
- (void)setImageInsets:(UIEdgeInsets)a3;
- (void)setTag:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setupNativeObject;
@end

@implementation SUScriptNativeUIButton

- (id)image
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 imageForState:0];
}

- (UIEdgeInsets)imageInsets
{
  id v2 = [(SUScriptNativeObject *)self object];

  [v2 imageEdgeInsets];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setImage:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setImage:a3 forState:0];
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = [(SUScriptNativeObject *)self object];

  objc_msgSend(v7, "setImageEdgeInsets:", top, left, bottom, right);
}

- (void)setTag:(int64_t)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setTag:a3];
}

- (void)setTitle:(id)a3
{
  id v4 = [(SUScriptNativeObject *)self object];

  [v4 setTitle:a3 forState:0];
}

- (int64_t)tag
{
  id v2 = [(SUScriptNativeObject *)self object];

  return [v2 tag];
}

- (id)title
{
  id v2 = [(SUScriptNativeObject *)self object];

  return (id)[v2 titleForState:0];
}

+ (id)objectWithDefaultButtonForScriptButton:(id)a3
{
  id v4 = (void *)[a3 copyObjectForScriptFromPoolWithClass:objc_opt_class()];
  double v5 = (void *)[a1 objectWithNativeObject:v4];

  return v5;
}

- (void)connectButtonAction
{
  id v3 = [(SUScriptNativeObject *)self object];

  [v3 addTarget:self action:sel_buttonAction_ forControlEvents:64];
}

- (void)destroyNativeObject
{
  [(SUScriptNativeUIButton *)self disconnectButtonAction];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIButton;
  [(SUScriptNativeObject *)&v3 destroyNativeObject];
}

- (void)disconnectButtonAction
{
  id v3 = [(SUScriptNativeObject *)self object];

  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
}

- (void)setupNativeObject
{
  [(SUScriptNativeUIButton *)self connectButtonAction];
  v3.receiver = self;
  v3.super_class = (Class)SUScriptNativeUIButton;
  [(SUScriptNativeObject *)&v3 setupNativeObject];
}

@end
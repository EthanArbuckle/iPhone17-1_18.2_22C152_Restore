@interface _UIFocusDebugWindowLabelModule
- (_UIFocusDebugWindowLabelModule)initWithFrame:(CGRect)a3;
- (id)title;
- (id)updatedAttributedLabelContent;
- (id)updatedLabelContent;
- (void)update;
@end

@implementation _UIFocusDebugWindowLabelModule

- (_UIFocusDebugWindowLabelModule)initWithFrame:(CGRect)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)_UIFocusDebugWindowLabelModule;
  v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_opt_new();
    [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [off_1E52D39B8 fontWithName:@"Menlo" size:11.0];
    [(UILabel *)v4 setFont:v5];

    v6 = +[UIColor whiteColor];
    [(UILabel *)v4 setTextColor:v6];

    [(UIView *)v4 setAutoresizingMask:18];
    [(UILabel *)v4 setNumberOfLines:0];
    content = v3->_content;
    v3->_content = v4;
    v8 = v4;

    [(UIView *)v3 addSubview:v8];
    v18 = (void *)MEMORY[0x1E4F5B268];
    v23 = [(UIView *)v8 leadingAnchor];
    v22 = [(UIView *)v3 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22 constant:4.0];
    v25[0] = v21;
    v20 = [(UIView *)v8 trailingAnchor];
    v19 = [(UIView *)v3 trailingAnchor];
    v9 = [v20 constraintEqualToAnchor:v19 constant:-4.0];
    v25[1] = v9;
    v10 = [(UIView *)v8 topAnchor];
    v11 = [(UIView *)v3 topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:4.0];
    v25[2] = v12;
    v13 = [(UIView *)v8 bottomAnchor];
    v14 = [(UIView *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:-4.0];
    v25[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [v18 activateConstraints:v16];
  }
  return v3;
}

- (id)title
{
  return @"No Title";
}

- (id)updatedLabelContent
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromSelector(a2);
  v7 = [v3 stringWithFormat:@"%@:\nSubclasses need to override %@ and return the text that should be shown here.", v5, v6];

  return v7;
}

- (id)updatedAttributedLabelContent
{
  id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
  v4 = [(_UIFocusDebugWindowLabelModule *)self updatedLabelContent];
  v5 = (void *)[v3 initWithString:v4];

  return v5;
}

- (void)update
{
  id v3 = [(_UIFocusDebugWindowLabelModule *)self updatedAttributedLabelContent];
  [(UILabel *)self->_content setAttributedText:v3];
}

- (void).cxx_destruct
{
}

@end
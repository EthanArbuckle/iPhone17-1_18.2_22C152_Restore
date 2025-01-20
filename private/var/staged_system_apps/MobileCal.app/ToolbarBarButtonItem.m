@interface ToolbarBarButtonItem
- (ToolbarBarButtonItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (void)setTitle:(id)a3;
@end

@implementation ToolbarBarButtonItem

- (ToolbarBarButtonItem)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[UIButton buttonWithType:1];
  button = self->_button;
  self->_button = v10;

  [(UIButton *)self->_button setTitle:v8 forState:0];
  [(UIButton *)self->_button addTarget:v9 action:a5 forControlEvents:64];

  v12 = +[UIFont systemFontOfSize:17.0];
  v13 = [(UIButton *)self->_button titleLabel];
  [v13 setFont:v12];

  [(UIButton *)self->_button setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v14) = 1148846080;
  [(UIButton *)self->_button setContentCompressionResistancePriority:0 forAxis:v14];
  v15 = self->_button;
  v19.receiver = self;
  v19.super_class = (Class)ToolbarBarButtonItem;
  v16 = [(ToolbarBarButtonItem *)&v19 initWithCustomView:v15];
  v17 = v16;
  if (v16) {
    [(ToolbarBarButtonItem *)v16 setTitle:v8];
  }

  return v17;
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ToolbarBarButtonItem;
  id v4 = a3;
  [(ToolbarBarButtonItem *)&v5 setTitle:v4];
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", v4, 0, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
}

@end
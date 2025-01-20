@interface MailStatusUndoView
- (MailStatusUndoView)initWithFrame:(CGRect)a3;
- (MailStatusUndoViewDelegate)delegate;
- (UIButton)undoButton;
- (id)_buttonConfiguration;
- (void)_undoButtonTapped:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUndoButton:(id)a3;
@end

@implementation MailStatusUndoView

- (MailStatusUndoView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)MailStatusUndoView;
  v3 = -[MailStatusUndoView initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v25 = [(MailStatusUndoView *)v3 _buttonConfiguration];
    v5 = +[UIImage systemImageNamed:MFImageGlyphUndoSend];
    [v25 setImage:v5];

    [v25 setImagePadding:3.0];
    v6 = +[UIImageSymbolConfiguration configurationWithScale:1];
    [v25 setPreferredSymbolConfigurationForImage:v6];

    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"UNDO_SEND_BUTTON_TITLE" value:&stru_100619928 table:@"Main"];
    [v25 setTitle:v8];

    [v25 setButtonSize:1];
    v9 = +[UIButton buttonWithConfiguration:v25 primaryAction:0];
    [(UIButton *)v9 setShowsLargeContentViewer:1];
    [(UIButton *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v9 addTarget:v4 action:"_undoButtonTapped:" forControlEvents:64];
    [(MailStatusUndoView *)v4 addSubview:v9];
    v24 = [(UIButton *)v9 centerXAnchor];
    v22 = [(MailStatusUndoView *)v4 centerXAnchor];
    v21 = [v24 constraintEqualToAnchor:];
    v27[0] = v21;
    v23 = [(UIButton *)v9 centerYAnchor];
    v20 = [(MailStatusUndoView *)v4 centerYAnchor];
    v19 = [v23 constraintEqualToAnchor:];
    v27[1] = v19;
    v10 = [(UIButton *)v9 leadingAnchor];
    v11 = [(MailStatusUndoView *)v4 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v27[2] = v12;
    v13 = [(UIButton *)v9 trailingAnchor];
    v14 = [(MailStatusUndoView *)v4 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v16];

    undoButton = v4->_undoButton;
    v4->_undoButton = v9;
  }
  return v4;
}

- (void)_undoButtonTapped:(id)a3
{
  id v4 = [(MailStatusUndoView *)self delegate];
  [v4 mailStatusUndoViewUndoButtonTapped:self];
}

- (id)_buttonConfiguration
{
  return +[UIButtonConfiguration plainButtonConfiguration];
}

- (MailStatusUndoViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MailStatusUndoViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
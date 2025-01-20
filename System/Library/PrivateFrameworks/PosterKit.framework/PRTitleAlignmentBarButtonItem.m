@interface PRTitleAlignmentBarButtonItem
+ (id)buttonConfigurationForTitleAlignment:(unint64_t)a3;
+ (id)defaultImage;
- (PRTitleAlignmentBarButtonItem)initWithTitleAlignment:(unint64_t)a3 target:(id)a4 action:(SEL)a5;
- (UIButton)button;
- (unint64_t)titleAlignment;
- (unint64_t)toggle;
- (void)setButton:(id)a3;
- (void)setTitleAlignment:(unint64_t)a3;
@end

@implementation PRTitleAlignmentBarButtonItem

+ (id)defaultImage
{
  v2 = (void *)MEMORY[0x1E4FB1818];
  v3 = [MEMORY[0x1E4FB1830] configurationWithScale:1];
  v4 = [v2 _systemImageNamed:@"kashida.arabic" withConfiguration:v3];

  return v4;
}

+ (id)buttonConfigurationForTitleAlignment:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [MEMORY[0x1E4FB14D8] filledButtonConfiguration];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
    v4 = [MEMORY[0x1E4FB1618] labelColor];
    [v3 setBaseForegroundColor:v4];
  }
  v5 = [v3 background];
  [v5 setCornerRadius:10.0];

  [v3 setButtonSize:1];
  v6 = +[PRTitleAlignmentBarButtonItem defaultImage];
  [v3 setImage:v6];

  return v3;
}

- (void)setTitleAlignment:(unint64_t)a3
{
  +[PRTitleAlignmentBarButtonItem buttonConfigurationForTitleAlignment:](PRTitleAlignmentBarButtonItem, "buttonConfigurationForTitleAlignment:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(UIButton *)self->_button setConfiguration:v5];
  self->_titleAlignment = a3;
}

- (PRTitleAlignmentBarButtonItem)initWithTitleAlignment:(unint64_t)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  v9 = +[PRTitleAlignmentBarButtonItem buttonConfigurationForTitleAlignment:a3];
  v10 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v9 primaryAction:0];
  [v10 addTarget:v8 action:a5 forControlEvents:64];

  v14.receiver = self;
  v14.super_class = (Class)PRTitleAlignmentBarButtonItem;
  v11 = [(PRTitleAlignmentBarButtonItem *)&v14 initWithCustomView:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_button, v10);
    v12->_titleAlignment = a3;
  }

  return v12;
}

- (unint64_t)toggle
{
  [(PRTitleAlignmentBarButtonItem *)self setTitleAlignment:[(PRTitleAlignmentBarButtonItem *)self titleAlignment] != 1];
  return self->_titleAlignment;
}

- (unint64_t)titleAlignment
{
  return self->_titleAlignment;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
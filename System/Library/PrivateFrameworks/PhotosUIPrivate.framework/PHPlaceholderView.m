@interface PHPlaceholderView
- (PHPlaceholderView)initWithCoder:(id)a3;
- (PHPlaceholderView)initWithFrame:(CGRect)a3;
- (PHPlaceholderView)initWithType:(int64_t)a3;
- (UIImageView)_imageView;
- (UILabel)_airPlayLabel;
- (UILabel)_appleTVMessageLabel;
- (UIView)_container;
- (id)_appleTVMessage;
- (int64_t)type;
- (void)_setAirPlayLabel:(id)a3;
- (void)_setAppleTVMessageLabel:(id)a3;
- (void)_setContainer:(id)a3;
- (void)_setImageView:(id)a3;
- (void)_setup;
@end

@implementation PHPlaceholderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__appleTVMessageLabel, 0);
  objc_storeStrong((id *)&self->__airPlayLabel, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_storeStrong((id *)&self->__container, 0);
}

- (void)_setAppleTVMessageLabel:(id)a3
{
}

- (UILabel)_appleTVMessageLabel
{
  return self->__appleTVMessageLabel;
}

- (void)_setAirPlayLabel:(id)a3
{
}

- (UILabel)_airPlayLabel
{
  return self->__airPlayLabel;
}

- (void)_setImageView:(id)a3
{
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)_setContainer:(id)a3
{
}

- (UIView)_container
{
  return self->__container;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_appleTVMessage
{
  int64_t v2 = [(PHPlaceholderView *)self type];
  if (!v2)
  {
    v3 = @"VIDEO_PLAYING_ON_EXTERNAL_DISPLAY_PLACEHOLDER_MESSAGE";
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    v3 = @"AIRPLAY_SLIDESHOW_ON_APPLE_TV_MESSAGE";
LABEL_5:
    v4 = PULocalizedString(v3);
    goto LABEL_7;
  }
  v4 = 0;
LABEL_7:
  return v4;
}

- (void)_setup
{
  id v30 = +[PUInterfaceManager currentTheme];
  v3 = [v30 airPlayVideoPlaceholderBackgroundColor];
  [(PHPlaceholderView *)self setBackgroundColor:v3];

  [(PHPlaceholderView *)self setUserInteractionEnabled:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHPlaceholderView *)self addSubview:v4];
  id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
  v6 = [v30 airPlayVideoPlaceholderIcon];
  v7 = (void *)[v5 initWithImage:v6];

  v8 = [v30 airPlayVideoPlaceholderIconTintColor];
  [v7 setTintColor:v8];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v10 = PULocalizedString(@"VIDEO_PLAYING_ON_EXTERNAL_DISPLAY_PLACEHOLDER_TITLE");
  [v9 setText:v10];

  v11 = [v30 airPlayVideoPlaceholderTitleTextColor];
  [v9 setTextColor:v11];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [v30 airPlayVideoPlaceholderTitleFont];
  [v9 setFont:v12];

  [v4 addSubview:v9];
  v13 = [(PHPlaceholderView *)self _appleTVMessage];
  id v14 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v14 setNumberOfLines:0];
  [v14 setTextAlignment:1];
  [v14 setText:v13];
  v15 = [v30 airPlayVideoPlaceholderMessageTextColor];
  [v14 setTextColor:v15];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  v16 = [v30 airPlayVideoPlaceholderMessageFont];
  [v14 setFont:v16];

  [v4 addSubview:v14];
  [(PHPlaceholderView *)self _setContainer:v4];
  [(PHPlaceholderView *)self _setImageView:v7];
  [(PHPlaceholderView *)self _setAirPlayLabel:v9];
  [(PHPlaceholderView *)self _setAppleTVMessageLabel:v14];
  v17 = _NSDictionaryOfVariableBindings(&cfstr_ContainerImage.isa, v4, v7, v9, v14, 0);
  v18 = [MEMORY[0x1E4F1CA48] array];
  v19 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[container]|" options:0 metrics:0 views:v17];
  [v18 addObjectsFromArray:v19];

  v20 = [MEMORY[0x1E4F28DC8] constraintWithItem:v4 attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
  [v18 addObject:v20];

  v21 = [MEMORY[0x1E4F28DC8] constraintWithItem:v7 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  [v18 addObject:v21];

  v22 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:11 relatedBy:0 toItem:v7 attribute:4 multiplier:1.0 constant:33.0];
  [v18 addObject:v22];

  v23 = [v18 lastObject];
  LODWORD(v24) = 1132068864;
  [v23 setPriority:v24];

  v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:11 relatedBy:0 toItem:v9 attribute:11 multiplier:1.0 constant:15.0];
  [v18 addObject:v25];

  v26 = [v18 lastObject];
  LODWORD(v27) = 1132068864;
  [v26 setPriority:v27];

  v28 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[appleTVMessageLabel]|" options:512 metrics:0 views:v17];
  [v18 addObjectsFromArray:v28];

  v29 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[imageView]-(>=0)-[airPlayLabel]-(>=0)-[appleTVMessageLabel]|" options:512 metrics:0 views:v17];
  [v18 addObjectsFromArray:v29];

  [MEMORY[0x1E4F28DC8] activateConstraints:v18];
}

- (PHPlaceholderView)initWithType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PHPlaceholderView;
  id v5 = -[PHPlaceholderView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5)
  {
    if ((unint64_t)a3 >= 2)
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, v5, @"PHPlaceholderView.m", 51, @"Invalid parameter not satisfying: %@", @"PHPlaceholderTypeIsValid(type)" object file lineNumber description];
    }
    v5->_type = a3;
    [(PHPlaceholderView *)v5 _setup];
  }
  return v5;
}

- (PHPlaceholderView)initWithCoder:(id)a3
{
  return [(PHPlaceholderView *)self initWithType:0];
}

- (PHPlaceholderView)initWithFrame:(CGRect)a3
{
  return -[PHPlaceholderView initWithType:](self, "initWithType:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
@interface TUICandidateSlottedSeparator
+ (id)reuseIdentifier;
- (UIImageView)imageView;
- (void)setImageView:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation TUICandidateSlottedSeparator

- (void).cxx_destruct
{
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setStyle:(id)a3
{
  id v4 = a3;
  v5 = [(TUICandidateLine *)self style];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)TUICandidateSlottedSeparator;
    [(TUICandidateLine *)&v14 setStyle:v4];
    [(TUICandidateSlottedSeparator *)self setBackgroundColor:0];
    v7 = [(TUICandidateSlottedSeparator *)self imageView];

    if (!v7)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
      [(TUICandidateSlottedSeparator *)self bounds];
      v9 = objc_msgSend(v8, "initWithFrame:");
      [(TUICandidateSlottedSeparator *)self setImageView:v9];

      v10 = [(TUICandidateSlottedSeparator *)self imageView];
      [v10 setAutoresizingMask:18];

      v11 = [(TUICandidateSlottedSeparator *)self imageView];
      [(TUICandidateSlottedSeparator *)self addSubview:v11];
    }
    v12 = [v4 slottedCellSeparatorImage];
    v13 = [(TUICandidateSlottedSeparator *)self imageView];
    [v13 setImage:v12];
  }
}

+ (id)reuseIdentifier
{
  return @"TUICandidateSlottedSeparator";
}

@end
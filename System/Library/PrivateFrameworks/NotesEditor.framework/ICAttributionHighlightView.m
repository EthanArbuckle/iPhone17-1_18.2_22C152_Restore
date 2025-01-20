@interface ICAttributionHighlightView
- (ICAttributionHighlightView)initWithConfiguration:(id)a3;
- (ICAttributionViewHighlightConfiguration)configuration;
@end

@implementation ICAttributionHighlightView

- (ICAttributionHighlightView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  [v5 adjustedFrame];
  v11.receiver = self;
  v11.super_class = (Class)ICAttributionHighlightView;
  v6 = -[ICAttributionHighlightView initWithFrame:](&v11, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [v5 color];
    [(ICAttributionHighlightView *)v7 setBackgroundColor:v8];

    v9 = [(ICAttributionHighlightView *)v7 layer];
    [v9 setCornerRadius:2.75];

    [v5 alpha];
    -[ICAttributionHighlightView setAlpha:](v7, "setAlpha:");
  }

  return v7;
}

- (ICAttributionViewHighlightConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
}

@end
@interface SFAirDropIconView
- (SFAirDropIconView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)loadImageIfNeeded;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SFAirDropIconView

- (SFAirDropIconView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SFAirDropIconView;
  v3 = -[SFAirDropIconView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(UIImageView *)v3->_imageView setUserInteractionEnabled:0];
    [(UIImageView *)v3->_imageView setContentMode:1];
    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFAirDropIconView *)v3 addSubview:v3->_imageView];
    v7 = (void *)MEMORY[0x263F08938];
    v8 = _NSDictionaryOfVariableBindings(&cfstr_Imageview.isa, v3->_imageView, 0);
    v9 = [v7 constraintsWithVisualFormat:@"H:|[_imageView]|" options:0 metrics:0 views:v8];
    [(SFAirDropIconView *)v3 addConstraints:v9];

    v10 = (void *)MEMORY[0x263F08938];
    v11 = _NSDictionaryOfVariableBindings(&cfstr_Imageview.isa, v3->_imageView, 0);
    v12 = [v10 constraintsWithVisualFormat:@"V:|[_imageView]|" options:0 metrics:0 views:v11];
    [(SFAirDropIconView *)v3 addConstraints:v12];
  }
  return v3;
}

- (void)loadImageIfNeeded
{
  v3 = [(UIImageView *)self->_imageView image];

  if (!v3)
  {
    id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v4 bundleURL];

    uint64_t v5 = [NSURL fileURLWithFileSystemRepresentation:"AirDrop-inactive.png" isDirectory:0 relativeToURL:v10];
    v6 = (void *)MEMORY[0x263F827E8];
    v7 = [v5 path];
    v8 = [v6 imageWithContentsOfFile:v7];

    v9 = [MEMORY[0x263F6BC80] _activityImageForActionRepresentationImage:v8];
    [(UIImageView *)self->_imageView setImage:v9];
  }
}

- (void)layoutSubviews
{
  [(SFAirDropIconView *)self bounds];
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropIconView;
  [(SFAirDropIconView *)&v3 layoutSubviews];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SFAirDropIconView;
  -[SFAirDropIconView setHighlighted:](&v6, sel_setHighlighted_);
  if (v3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  [(UIImageView *)self->_imageView setDrawMode:v5];
}

- (void).cxx_destruct
{
}

@end
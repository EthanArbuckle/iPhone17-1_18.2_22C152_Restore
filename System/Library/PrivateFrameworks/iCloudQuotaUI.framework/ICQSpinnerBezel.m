@interface ICQSpinnerBezel
- (ICQSpinnerBezel)initWithFrame:(CGRect)a3;
- (NSString)bezelText;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBezelText:(id)a3;
@end

@implementation ICQSpinnerBezel

- (ICQSpinnerBezel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ICQSpinnerBezel;
  v3 = -[ICQSpinnerBezel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:101];
    spinner = v3->_spinner;
    v3->_spinner = (UIActivityIndicatorView *)v4;

    v6 = v3->_spinner;
    v7 = [MEMORY[0x263F825C8] whiteColor];
    [(UIActivityIndicatorView *)v6 setColor:v7];

    [(UIActivityIndicatorView *)v3->_spinner startAnimating];
    [(ICQSpinnerBezel *)v3 addSubview:v3->_spinner];
    v8 = [MEMORY[0x263F825C8] clearColor];
    [(ICQSpinnerBezel *)v3 setBackgroundColor:v8];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(ICQSpinnerBezel *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_spinner frame];
  float v8 = (v4 - v7) * 0.5;
  double v9 = floorf(v8);
  float v11 = v6 * 0.5 - v10;
  spinner = self->_spinner;
  double v13 = floorf(v11);
  -[UIActivityIndicatorView setFrame:](spinner, "setFrame:", v9, v13);
}

- (void)drawRect:(CGRect)a3
{
  [(ICQSpinnerBezel *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  double v10 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.699999988];
  [v10 set];

  [v16 fill];
  float v11 = [MEMORY[0x263F825C8] whiteColor];
  [v11 set];

  float v12 = v9 * 0.5;
  double v13 = floorf(v12);
  bezelText = self->_bezelText;
  v15 = [MEMORY[0x263F81708] boldSystemFontOfSize:22.0];
  -[NSString _legacy_drawInRect:withFont:lineBreakMode:alignment:](bezelText, "_legacy_drawInRect:withFont:lineBreakMode:alignment:", v15, 0, 1, v5, v13 + 10.0, v7, v13);
}

- (NSString)bezelText
{
  return self->_bezelText;
}

- (void)setBezelText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bezelText, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
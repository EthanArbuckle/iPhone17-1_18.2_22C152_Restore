@interface SFSquareRichLinkCell
+ (NSString)reuseIdentifier;
- (LPLinkMetadata)metadata;
- (LPLinkView)linkView;
- (SFSquareRichLinkCell)initWithCoder:(id)a3;
- (SFSquareRichLinkCell)initWithFrame:(CGRect)a3;
- (UIImage)icon;
- (void)setIcon:(id)a3;
- (void)setLinkView:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation SFSquareRichLinkCell

+ (NSString)reuseIdentifier
{
  return (NSString *)@"SquareRichLinkCell";
}

- (SFSquareRichLinkCell)initWithFrame:(CGRect)a3
{
  v39[7] = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)SFSquareRichLinkCell;
  v3 = -[SFStartPageFilledBackgroundCell initWithFrame:](&v38, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v4 setTitle:@"Aa Bb Cc Dd Ee Ff Gg Hh Ii Jj Kk Ll Mm Nn Oo Pp Qq Rr Ss Tt Uu Vv Ww Xx Yy Zz"];
    v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"apple.com"];
    [v4 setOriginalURL:v5];

    v6 = (LPLinkView *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithMetadata:v4];
    configureLinkView(v6);

    dummyLinkView = v3->_dummyLinkView;
    v3->_dummyLinkView = v6;

    [(LPLinkView *)v3->_dummyLinkView setHidden:1];
    [(SFSquareRichLinkCell *)v3 addSubview:v3->_dummyLinkView];
    id v37 = objc_alloc_init(MEMORY[0x1E4F30A98]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    [v37 setMetadata:v8];

    configureLinkView(v37);
    [(SFSquareRichLinkCell *)v3 addSubview:v37];
    [(SFSquareRichLinkCell *)v3 setLinkView:v37];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v36 = [(LPLinkView *)v3->_dummyLinkView topAnchor];
    v35 = [(SFSquareRichLinkCell *)v3 topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:15.0];
    v39[0] = v34;
    v33 = [(LPLinkView *)v3->_dummyLinkView leadingAnchor];
    v32 = [(SFSquareRichLinkCell *)v3 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:15.0];
    v39[1] = v31;
    v30 = [(LPLinkView *)v3->_dummyLinkView trailingAnchor];
    v29 = [(SFSquareRichLinkCell *)v3 trailingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:-15.0];
    v39[2] = v28;
    v26 = [(LPLinkView *)v3->_dummyLinkView bottomAnchor];
    v25 = [(SFSquareRichLinkCell *)v3 bottomAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:0.0];
    v39[3] = v24;
    v23 = [(SFSquareRichLinkCell *)v3 linkView];
    v22 = [v23 topAnchor];
    v21 = [(LPLinkView *)v3->_dummyLinkView topAnchor];
    v20 = [v22 constraintEqualToAnchor:v21];
    v39[4] = v20;
    v9 = [(SFSquareRichLinkCell *)v3 linkView];
    v10 = [v9 leadingAnchor];
    v11 = [(LPLinkView *)v3->_dummyLinkView leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v39[5] = v12;
    v13 = [(SFSquareRichLinkCell *)v3 linkView];
    v14 = [v13 trailingAnchor];
    v15 = [(LPLinkView *)v3->_dummyLinkView trailingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v39[6] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:7];
    [v27 activateConstraints:v17];

    v18 = v3;
  }

  return v3;
}

- (SFSquareRichLinkCell)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSquareRichLinkCell;
  return [(SFSquareRichLinkCell *)&v4 initWithCoder:a3];
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  id v5 = a3;
  id v6 = [(SFSquareRichLinkCell *)self linkView];
  [v6 setMetadata:v5];
}

- (void)setIcon:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_icon, a3);
  id v5 = [(SFSquareRichLinkCell *)self linkView];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v9];
    id v8 = [(SFSquareRichLinkCell *)self linkView];
    [v8 _setMediaOverlayIcon:v7];
  }
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (UIImage)icon
{
  return self->_icon;
}

- (LPLinkView)linkView
{
  return self->_linkView;
}

- (void)setLinkView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_dummyLinkView, 0);
}

@end
@interface PKAvatarView
- (BOOL)showsName;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)contact;
- (NSString)placeholderName;
- (PKAvatarView)init;
- (UIImage)placeholderImage;
- (double)diameter;
- (id)descriptorForRequiredKeys;
- (void)layoutSubviews;
- (void)setContact:(id)a3;
- (void)setDiameter:(double)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderName:(id)a3;
- (void)setShowsName:(BOOL)a3;
@end

@implementation PKAvatarView

- (PKAvatarView)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKAvatarView;
  v2 = [(PKAvatarView *)&v11 init];
  if (v2)
  {
    v3 = (CNAvatarViewController *)objc_alloc_init(MEMORY[0x1E4F1BB40]);
    avatarViewController = v2->_avatarViewController;
    v2->_avatarViewController = v3;

    v5 = [(CNAvatarViewController *)v2->_avatarViewController view];
    [(PKAvatarView *)v2 addSubview:v5];

    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    contactNameLabel = v2->_contactNameLabel;
    v2->_contactNameLabel = v6;

    v8 = v2->_contactNameLabel;
    v9 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27B8], *MEMORY[0x1E4FB09E0]);
    [(UILabel *)v8 setFont:v9];

    [(UILabel *)v2->_contactNameLabel setHidden:1];
    [(PKAvatarView *)v2 addSubview:v2->_contactNameLabel];
    v2->_diameter = 35.0;
  }
  return v2;
}

- (void)setContact:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  avatarViewController = self->_avatarViewController;
  v11[0] = v5;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(CNAvatarViewController *)avatarViewController setContacts:v7];

  v8 = [(CNAvatarViewController *)self->_avatarViewController view];
  [v8 setHidden:0];

  v9 = [(CNAvatarViewController *)self->_avatarViewController view];
  [(PKAvatarView *)self bringSubviewToFront:v9];

  v10 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
  if (v10) {
    [(UILabel *)self->_contactNameLabel setText:v10];
  }
}

- (void)setPlaceholderName:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1BA40];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setGivenName:v5];

  avatarViewController = self->_avatarViewController;
  v11[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(CNAvatarViewController *)avatarViewController setContacts:v8];

  v9 = [(CNAvatarViewController *)self->_avatarViewController view];
  [v9 setHidden:0];

  v10 = [(CNAvatarViewController *)self->_avatarViewController view];
  [(PKAvatarView *)self bringSubviewToFront:v10];
}

- (void)setPlaceholderImage:(id)a3
{
  id v4 = a3;
  placeholderImageView = self->_placeholderImageView;
  id v9 = v4;
  if (!placeholderImageView)
  {
    id v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    v7 = self->_placeholderImageView;
    self->_placeholderImageView = v6;

    [(UIImageView *)self->_placeholderImageView setContentMode:1];
    [(PKAvatarView *)self addSubview:self->_placeholderImageView];
    id v4 = v9;
    placeholderImageView = self->_placeholderImageView;
  }
  [(UIImageView *)placeholderImageView setImage:v4];
  [(PKAvatarView *)self bringSubviewToFront:self->_placeholderImageView];
  v8 = [(CNAvatarViewController *)self->_avatarViewController view];
  [v8 setHidden:1];
}

- (void)setShowsName:(BOOL)a3
{
  if (self->_showsName != a3)
  {
    self->_showsName = a3;
    [(UILabel *)self->_contactNameLabel setHidden:!a3];
    [(PKAvatarView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKAvatarView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAvatarView;
  [(PKAvatarView *)&v3 layoutSubviews];
  [(PKAvatarView *)self bounds];
  -[PKAvatarView _layoutWithBounds:isTemplate:](self, "_layoutWithBounds:isTemplate:", 0);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplate:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(PKAvatarView *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v10 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v10 = CGRectMinXEdge;
  }
  remainder.origin.CGFloat x = x;
  remainder.origin.CGFloat y = y;
  remainder.size.CGFloat width = width;
  remainder.size.CGFloat height = height;
  CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v29.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v29.size = v11;
  v12 = [(CNAvatarViewController *)self->_avatarViewController view];
  [v12 frame];

  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRectDivide(v32, &v29, &remainder, self->_diameter, v10);
  PKRectCenteredIntegralRect();
  double v16 = v15;
  double v18 = v17;
  if (!a4)
  {
    double v19 = v13;
    double v20 = v14;
    v21 = [(CNAvatarViewController *)self->_avatarViewController view];
    objc_msgSend(v21, "setFrame:", v19, v20, v16, v18);

    -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:", v19, v20, v16, v18);
  }
  double v22 = v16 + 0.0;
  if (self->_showsName)
  {
    CGRectDivide(remainder, &v29, &remainder, 8.0, v10);
    double v22 = v22 + v29.size.width;
    if (self->_showsName)
    {
      -[UILabel sizeThatFits:](self->_contactNameLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
      double v24 = v23;
      CGRectDivide(remainder, &v29, &remainder, v25, v10);
      if (!a4)
      {
        contactNameLabel = self->_contactNameLabel;
        PKRectCenteredIntegralRect();
        -[UILabel setFrame:](contactNameLabel, "setFrame:");
      }
      double v22 = v22 + v29.size.width;
      double v18 = fmax(v18, v24);
    }
  }
  double v27 = v22;
  double v28 = v18;
  result.CGFloat height = v28;
  result.CGFloat width = v27;
  return result;
}

- (id)descriptorForRequiredKeys
{
  return (id)[(CNAvatarViewController *)self->_avatarViewController descriptorForRequiredKeys];
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)placeholderName
{
  return self->_placeholderName;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_diameter = a3;
}

- (BOOL)showsName
{
  return self->_showsName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_placeholderName, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);

  objc_storeStrong((id *)&self->_avatarViewController, 0);
}

@end
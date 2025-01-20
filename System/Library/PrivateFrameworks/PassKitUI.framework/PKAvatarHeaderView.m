@interface PKAvatarHeaderView
- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)contact;
- (NSString)counterpartHandle;
- (PKAvatarHeaderView)initWithContact:(id)a3 counterpartHandle:(id)a4;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (void)configureForContact;
- (void)layoutSubviews;
- (void)setContact:(id)a3;
- (void)setCounterpartHandle:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setSecondaryLabel:(id)a3;
@end

@implementation PKAvatarHeaderView

- (PKAvatarHeaderView)initWithContact:(id)a3 counterpartHandle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKAvatarHeaderView;
  v9 = [(PKAvatarHeaderView *)&v29 init];
  v10 = v9;
  if (v9)
  {
    p_counterpartHandle = &v9->_counterpartHandle;
    objc_storeStrong((id *)&v9->_counterpartHandle, a4);
    objc_storeStrong((id *)&v10->_contact, a3);
    v11 = (CNAvatarView *)objc_alloc_init(getCNAvatarViewClass_1());
    avatarView = v10->_avatarView;
    v10->_avatarView = v11;

    [(PKAvatarHeaderView *)v10 addSubview:v10->_avatarView];
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryLabel = v10->_primaryLabel;
    v10->_primaryLabel = v13;

    v15 = v10->_primaryLabel;
    v16 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v15 setTextColor:v16];

    [(UILabel *)v10->_primaryLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v10->_primaryLabel setNumberOfLines:1];
    v17 = v10->_primaryLabel;
    v18 = (NSString *)*MEMORY[0x1E4FB27B8];
    v19 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2988], (void *)*MEMORY[0x1E4FB27B8], 2, 0);
    [(UILabel *)v17 setFont:v19];

    [(UILabel *)v10->_primaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
    [(PKAvatarHeaderView *)v10 addSubview:v10->_primaryLabel];
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    secondaryLabel = v10->_secondaryLabel;
    v10->_secondaryLabel = v20;

    [(UILabel *)v10->_secondaryLabel setNumberOfLines:1];
    v22 = v10->_secondaryLabel;
    v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v22 setTextColor:v23];

    v24 = v10->_secondaryLabel;
    v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], v18);
    [(UILabel *)v24 setFont:v25];

    [(UILabel *)v10->_secondaryLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
    [(PKAvatarHeaderView *)v10 addSubview:v10->_secondaryLabel];
    v26 = [MEMORY[0x1E4FB1618] clearColor];
    [(PKAvatarHeaderView *)v10 setBackgroundColor:v26];

    if (v10->_contact || *p_counterpartHandle) {
      [(PKAvatarHeaderView *)v10 configureForContact];
    }
  }

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PKAvatarHeaderView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAvatarHeaderView;
  [(PKAvatarHeaderView *)&v3 layoutSubviews];
  [(PKAvatarHeaderView *)self bounds];
  -[PKAvatarHeaderView _layoutWithBounds:applyLayout:](self, "_layoutWithBounds:applyLayout:", 1);
}

- (CGSize)_layoutWithBounds:(CGRect)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v22.origin.CGFloat x = a3.origin.x + 14.0;
  v22.origin.CGFloat y = a3.origin.y + 14.0;
  v22.size.CGFloat width = a3.size.width + -28.0;
  v22.size.CGFloat height = a3.size.height + -14.0;
  CGRect remainder = v22;
  memset(&v19, 0, sizeof(v19));
  CGRectDivide(v22, &v19, &remainder, 100.0, CGRectMinYEdge);
  if (v4)
  {
    avatarView = self->_avatarView;
    PKSizeAlignedInRect();
    -[CNAvatarView setFrame:](avatarView, "setFrame:");
  }
  CGRectDivide(remainder, &v19, &remainder, 14.0, CGRectMinYEdge);
  -[UILabel pkui_sizeThatFits:](self->_primaryLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  CGRectDivide(remainder, &v19, &remainder, v11, CGRectMinYEdge);
  if (v4)
  {
    primaryLabel = self->_primaryLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](primaryLabel, "setFrame:");
  }
  -[UILabel sizeThatFits:](self->_secondaryLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  CGFloat v14 = v13;
  if (v13 > 0.0) {
    CGRectDivide(remainder, &v19, &remainder, 3.0, CGRectMinYEdge);
  }
  CGRectDivide(remainder, &v19, &remainder, v14, CGRectMinYEdge);
  if (v4)
  {
    secondaryLabel = self->_secondaryLabel;
    PKSizeAlignedInRect();
    -[UILabel setFrame:](secondaryLabel, "setFrame:");
  }
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGFloat v16 = CGRectGetWidth(v23);
  double MaxY = CGRectGetMaxY(v19);
  double v18 = v16;
  result.CGFloat height = MaxY;
  result.CGFloat width = v18;
  return result;
}

- (void)configureForContact
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_contact)
  {
    v10[0] = self->_contact;
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
    [v4 setContactType:0];
    id v9 = v4;
    objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  }
  [(CNAvatarView *)self->_avatarView setContacts:v3];
  secondaryLabel = self->_secondaryLabel;
  v6 = [(CNContact *)self->_contact organizationName];
  [(UILabel *)secondaryLabel setText:v6];

  primaryLabel = self->_primaryLabel;
  id v8 = [MEMORY[0x1E4F84D88] displayNameForCounterpartHandle:self->_counterpartHandle contact:self->_contact];
  [(UILabel *)primaryLabel setText:v8];

  [(PKAvatarHeaderView *)self setNeedsLayout];
}

- (void)setContact:(id)a3
{
  v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_contact, a3);
    [(PKAvatarHeaderView *)self configureForContact];
    v5 = v6;
  }
}

- (void)setCounterpartHandle:(id)a3
{
  v5 = (NSString *)a3;
  if (self->_counterpartHandle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_counterpartHandle, a3);
    [(PKAvatarHeaderView *)self configureForContact];
    v5 = v6;
  }
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)counterpartHandle
{
  return self->_counterpartHandle;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_counterpartHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
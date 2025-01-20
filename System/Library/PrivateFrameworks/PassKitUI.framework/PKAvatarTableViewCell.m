@interface PKAvatarTableViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNAvatarView)avatarView;
- (CNContact)contact;
- (PKAvatarTableViewCell)initWithContact:(id)a3 delegate:(id)a4 style:(int64_t)a5 reuseIdentifier:(id)a6;
- (void)layoutSubviews;
- (void)setContact:(id)a3;
@end

@implementation PKAvatarTableViewCell

- (PKAvatarTableViewCell)initWithContact:(id)a3 delegate:(id)a4 style:(int64_t)a5 reuseIdentifier:(id)a6
{
  id v9 = a3;
  v10 = [(PKAvatarTableViewCell *)self initWithStyle:a5 reuseIdentifier:a6];
  if (v10)
  {
    v11 = (CNAvatarView *)objc_alloc_init(getCNAvatarViewClass_3());
    avatarView = v10->_avatarView;
    v10->_avatarView = v11;

    v13 = [(PKAvatarTableViewCell *)v10 contentView];
    [v13 addSubview:v10->_avatarView];

    [(PKAvatarTableViewCell *)v10 setContact:v9];
  }

  return v10;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PKAvatarTableViewCell;
  [(PKAvatarTableViewCell *)&v18 layoutSubviews];
  if ([(PKAvatarTableViewCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v3 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v3 = CGRectMinXEdge;
  }
  v4 = [(PKAvatarTableViewCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [(UITableViewCell *)self pkui_effectiveLayoutMargins];
  v19.origin.x = v6 + v13;
  v19.size.width = v10 - (v13 + v14);
  v19.size.height = v12 + -16.0;
  remainder.origin.x = v6 + v13;
  remainder.origin.y = v8 + 8.0;
  remainder.size.width = v19.size.width;
  remainder.size.height = v12 + -16.0;
  memset(&v16, 0, sizeof(v16));
  v19.origin.y = v8 + 8.0;
  CGRectDivide(v19, &v16, &remainder, 45.0, v3);
  avatarView = self->_avatarView;
  PKSizeAlignedInRect();
  -[CNAvatarView setFrame:](avatarView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAvatarTableViewCell;
  -[PKAvatarTableViewCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 61.0) {
    double v4 = 61.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContact:(id)a3
{
  objc_super v5 = (CNContact *)a3;
  if (self->_contact != v5)
  {
    double v6 = v5;
    [(CNAvatarView *)self->_avatarView setContact:v5];
    objc_storeStrong((id *)&self->_contact, a3);
    objc_super v5 = v6;
  }
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end
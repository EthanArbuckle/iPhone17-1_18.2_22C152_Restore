@interface _SUUIItemBrowseCellContentView
- (SUUICellImageView)userRatingImageView;
- (UILabel)indexNumberLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILabel)userRatingLabel;
- (_SUUIItemBrowseCellContentView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setIndexNumberLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUserRatingImageView:(id)a3;
- (void)setUserRatingLabel:(id)a3;
@end

@implementation _SUUIItemBrowseCellContentView

- (_SUUIItemBrowseCellContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SUUIItemBrowseCellContentView;
  v3 = -[_SUUIItemBrowseCellContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(_SUUIItemBrowseCellContentView *)v3 setBackgroundColor:v4];

    [(_SUUIItemBrowseCellContentView *)v3 setContentMode:7];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  subtitleLabel = self->_subtitleLabel;
  [(UILabel *)subtitleLabel frame];
  -[UILabel drawTextInRect:](subtitleLabel, "drawTextInRect:");
  indexNumberLabel = self->_indexNumberLabel;
  [(UILabel *)indexNumberLabel frame];
  -[UILabel drawTextInRect:](indexNumberLabel, "drawTextInRect:");
  titleLabel = self->_titleLabel;
  [(UILabel *)titleLabel frame];
  -[UILabel drawTextInRect:](titleLabel, "drawTextInRect:");
  userRatingLabel = self->_userRatingLabel;
  [(UILabel *)userRatingLabel frame];
  -[UILabel drawTextInRect:](userRatingLabel, "drawTextInRect:");
  if (([(SUUICellImageView *)self->_userRatingImageView isHidden] & 1) == 0)
  {
    id v8 = [(SUUICellImageView *)self->_userRatingImageView image];
    [(SUUICellImageView *)self->_userRatingImageView frame];
    objc_msgSend(v8, "drawInRect:");
  }
}

- (void)setBackgroundColor:(id)a3
{
  subtitleLabel = self->_subtitleLabel;
  id v5 = a3;
  [(UILabel *)subtitleLabel setBackgroundColor:v5];
  [(UILabel *)self->_indexNumberLabel setBackgroundColor:v5];
  [(UILabel *)self->_titleLabel setBackgroundColor:v5];
  [(SUUICellImageView *)self->_userRatingImageView setBackgroundColor:v5];
  [(UILabel *)self->_userRatingLabel setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)_SUUIItemBrowseCellContentView;
  [(_SUUIItemBrowseCellContentView *)&v6 setBackgroundColor:v5];
}

- (UILabel)indexNumberLabel
{
  return self->_indexNumberLabel;
}

- (void)setIndexNumberLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)userRatingLabel
{
  return self->_userRatingLabel;
}

- (void)setUserRatingLabel:(id)a3
{
}

- (SUUICellImageView)userRatingImageView
{
  return self->_userRatingImageView;
}

- (void)setUserRatingImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userRatingImageView, 0);
  objc_storeStrong((id *)&self->_userRatingLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_indexNumberLabel, 0);
}

@end
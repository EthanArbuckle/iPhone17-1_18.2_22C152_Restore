@interface SiriUIPlatterSectionHeaderCollectionViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
- (NSString)text;
- (SiriUIPlatterSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)textAlignment;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
@end

@implementation SiriUIPlatterSectionHeaderCollectionViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  +[SiriUIPlatterSectionHeaderView sizeThatFits:text:](SiriUIPlatterSectionHeaderView, "sizeThatFits:text:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (SiriUIPlatterSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  v3 = -[SiriUIContentCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [(SiriUITextContainerView *)[SiriUIPlatterSectionHeaderView alloc] initWithText:0];
    headerView = v3->_headerView;
    v3->_headerView = v4;

    v6 = [(SiriUIPlatterSectionHeaderCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_headerView];

    [(SiriUIContentCollectionViewCell *)v3 setKeylineType:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  [(SiriUIContentCollectionViewCell *)&v4 layoutSubviews];
  headerView = self->_headerView;
  [(SiriUIPlatterSectionHeaderCollectionViewCell *)self bounds];
  -[SiriUIPlatterSectionHeaderView setFrame:](headerView, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  [(SiriUIContentCollectionViewCell *)&v3 prepareForReuse];
  [(SiriUITextContainerView *)self->_headerView setText:0];
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return [(SiriUITextContainerView *)self->_headerView text];
}

- (void)setTextAlignment:(int64_t)a3
{
}

- (int64_t)textAlignment
{
  return [(SiriUITextContainerView *)self->_headerView textAlignment];
}

- (void).cxx_destruct
{
}

@end
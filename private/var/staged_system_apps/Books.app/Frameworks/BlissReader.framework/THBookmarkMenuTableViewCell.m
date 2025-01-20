@interface THBookmarkMenuTableViewCell
- (BETableViewCellPageNumberLabel)pageNumberLabel;
- (THBookmarkMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImageView)thumbnail;
- (UILabel)bookmarkTitleLabel;
- (void)dealloc;
- (void)setBookmarkTitleLabel:(id)a3;
- (void)setPageNumberLabel:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation THBookmarkMenuTableViewCell

- (THBookmarkMenuTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)THBookmarkMenuTableViewCell;
  v4 = [(THBookmarkMenuTableViewCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    id v6 = [(THBookmarkMenuTableViewCell *)v4 contentView];
    v7 = objc_alloc_init(THAspectFitImageView);
    [(THAspectFitImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(THAspectFitImageView *)v7 setPreferredMaxLayoutHeight:45.0];
    [+[UIScreen mainScreen] scale];
    [v7 layer].borderWidth = 1.0 / v8;
    [v6 addSubview:v7];
    v5->_thumbnail = &v7->super;
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v9 setFont:+[UIFont systemFontOfSize:17.0]];
    [v6 addSubview:v9];
    v5->_bookmarkTitleLabel = v9;
    id v10 = objc_alloc_init((Class)BETableViewCellPageNumberLabel);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v10];
    v5->_pageNumberLabel = (BETableViewCellPageNumberLabel *)v10;
    LODWORD(v11) = 1144750080;
    [v10 setContentCompressionResistancePriority:0 forAxis:v11];
    LODWORD(v12) = 1132068864;
    [(UILabel *)v9 setContentCompressionResistancePriority:0 forAxis:v12];
    v13 = _NSDictionaryOfVariableBindings(@"thumbnail, bookmarkTitleLabel, pageNumberLabel", v7, v9, v10, 0);
    v14 = _NSDictionaryOfVariableBindings(@"kHorizontalInset, kGapBetweenLabels, kImageViewMaxWidth", &off_498F88, &off_498F88, &off_498F98, 0);
    id v15 = +[NSMutableArray array];
    [v15 addObjectsFromArray:+[NSLayoutConstraint constraintsWithVisualFormat:@"|-(==kHorizontalInset)-[thumbnail(==kImageViewMaxWidth)]-(==kGapBetweenLabels)-[bookmarkTitleLabel]-(==kGapBetweenLabels)-[pageNumberLabel]-(==kHorizontalInset)-|" options:66560 metrics:v14 views:v13]];
    [v15 addObject:[NSLayoutConstraint constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0]];
    [v5.contentView addConstraints:v15];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THBookmarkMenuTableViewCell;
  [(THBookmarkMenuTableViewCell *)&v3 dealloc];
}

- (UIImageView)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (UILabel)bookmarkTitleLabel
{
  return self->_bookmarkTitleLabel;
}

- (void)setBookmarkTitleLabel:(id)a3
{
}

- (BETableViewCellPageNumberLabel)pageNumberLabel
{
  return self->_pageNumberLabel;
}

- (void)setPageNumberLabel:(id)a3
{
}

@end
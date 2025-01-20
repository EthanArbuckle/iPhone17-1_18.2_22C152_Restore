@interface PUPhotoOwnerCommentCell
+ (double)heightOfOwnerCellWithAsset:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5;
+ (id)_ownerStringForAsset:(id)a3;
- (BOOL)usesCompactSeparators;
- (NSAttributedString)ownerString;
- (PUPhotoOwnerCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)ownerContentLabel;
- (UIView)styledSeparatorView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setOwnerString:(id)a3;
- (void)setUsesCompactSeparators:(BOOL)a3;
- (void)updateContentFromAsset:(id)a3;
@end

@implementation PUPhotoOwnerCommentCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_ownerContentLabel, 0);
  objc_storeStrong((id *)&self->_ownerString, 0);
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (UILabel)ownerContentLabel
{
  return self->_ownerContentLabel;
}

- (NSAttributedString)ownerString
{
  return self->_ownerString;
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PUPhotoOwnerCommentCell;
  [(PUPhotoOwnerCommentCell *)&v24 layoutSubviews];
  v3 = [(PUPhotoOwnerCommentCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoOwnerCommentCell semanticContentAttribute](self, "semanticContentAttribute"));
  double v9 = v5 + -15.0;
  if ([(PUPhotoOwnerCommentCell *)self usesCompactSeparators]) {
    double v10 = (v5 + -15.0) * 0.5;
  }
  else {
    double v10 = v5 + -15.0;
  }
  if (v8)
  {
    [(PUPhotoOwnerCommentCell *)self bounds];
    double v11 = CGRectGetMaxX(v25) - v10 + -15.0;
  }
  else
  {
    double v11 = 15.0;
  }
  v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  double v14 = v7 - 1.0 / v13;
  v15 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v15 scale];
  double v17 = 1.0 / v16;

  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v11, v14, v10, v17);
  if (v8)
  {
    v18 = [(PUPhotoOwnerCommentCell *)self contentView];
    [v18 bounds];
    CGFloat v19 = CGRectGetMaxX(v26) - (v9 + -15.0) + -15.0;

    double v20 = v7 + -10.0 + -8.0;
    [(UILabel *)self->_ownerContentLabel sizeToFit];
    v27.origin.y = 10.0;
    v27.origin.x = v19;
    v27.size.width = v9 + -15.0;
    v27.size.height = v20;
    double Width = CGRectGetWidth(v27);
    [(UILabel *)self->_ownerContentLabel frame];
    double v22 = CGRectGetWidth(v28);
    double v23 = v19 + Width - v22;
  }
  else
  {
    double v22 = v9 + -15.0;
    double v20 = v7 + -10.0 + -8.0;
    double v23 = 15.0;
  }
  -[UILabel setFrame:](self->_ownerContentLabel, "setFrame:", v23, 10.0, v22, v20);
  [(UILabel *)self->_ownerContentLabel sizeToFit];
}

- (void)setOwnerString:(id)a3
{
  if (self->_ownerString != a3)
  {
    double v4 = (NSAttributedString *)[a3 copy];
    ownerString = self->_ownerString;
    self->_ownerString = v4;

    ownerContentLabel = self->_ownerContentLabel;
    double v7 = self->_ownerString;
    [(UILabel *)ownerContentLabel setAttributedText:v7];
  }
}

- (void)updateContentFromAsset:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _ownerStringForAsset:v4];

  [(PUPhotoOwnerCommentCell *)self setOwnerString:v5];
}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    [(PUPhotoOwnerCommentCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoOwnerCommentCell;
  [(PUPhotoOwnerCommentCell *)&v3 prepareForReuse];
  [(PUPhotoOwnerCommentCell *)self setOwnerString:0];
}

- (PUPhotoOwnerCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)PUPhotoOwnerCommentCell;
  id v4 = [(PUPhotoOwnerCommentCell *)&v17 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(PUPhotoOwnerCommentCell *)v4 setSelectionStyle:0];
    [(PUPhotoOwnerCommentCell *)v5 setAccessoryType:0];
    [(PUPhotoOwnerCommentCell *)v5 setEditingAccessoryType:0];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    ownerContentLabel = v5->_ownerContentLabel;
    v5->_ownerContentLabel = (UILabel *)v7;

    [(UILabel *)v5->_ownerContentLabel setNumberOfLines:0];
    [(UILabel *)v5->_ownerContentLabel setLineBreakMode:0];
    double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    styledSeparatorView = v5->_styledSeparatorView;
    v5->_styledSeparatorView = v9;

    double v11 = v5->_styledSeparatorView;
    v12 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v11 setBackgroundColor:v12];

    double v13 = v5->_ownerContentLabel;
    double v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v13 setBackgroundColor:v14];

    v15 = [(PUPhotoOwnerCommentCell *)v5 contentView];
    [v15 addSubview:v5->_ownerContentLabel];

    [(PUPhotoOwnerCommentCell *)v5 addSubview:v5->_styledSeparatorView];
  }
  return v5;
}

+ (double)heightOfOwnerCellWithAsset:(id)a3 forWidth:(double)a4 forInterfaceOrientation:(int64_t)a5
{
  id v6 = objc_msgSend(a1, "_ownerStringForAsset:", a3, a5);
  uint64_t v7 = +[PUPhotoCommentCell _synthesizedAttributedString:v6 withWordWrapping:1];

  objc_msgSend(v7, "boundingRectWithSize:options:context:", 1, 0, a4 + -30.0, 1.79769313e308);
  CGRect v11 = CGRectIntegral(v10);
  if (v11.size.height + 10.0 + 8.0 >= 23.0) {
    double v8 = v11.size.height + 10.0 + 8.0;
  }
  else {
    double v8 = 23.0;
  }

  return v8;
}

+ (id)_ownerStringForAsset:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v17 = objc_msgSend(v3, "px_displayType");
  if ([v3 cloudIsMyAsset])
  {
    v18 = 0;
  }
  else
  {
    v18 = [v3 cloudOwnerDisplayName];
  }
  id v4 = [v3 cloudBatchPublishDate];
  uint64_t v21 = *MEMORY[0x1E4FB0700];
  uint64_t v5 = v21;
  id v6 = [MEMORY[0x1E4FB1618] labelColor];
  v23[0] = v6;
  uint64_t v22 = *MEMORY[0x1E4FB06F8];
  uint64_t v7 = v22;
  double v8 = [MEMORY[0x1E4F8A5D8] sharedCache];
  double v9 = [v8 commentAttributionNameFont];
  v23[1] = v9;
  CGRect v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v21 count:2];

  v19[0] = v5;
  CGRect v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v19[1] = v7;
  v20[0] = v11;
  v12 = [MEMORY[0x1E4F8A5D8] sharedCache];
  double v13 = [v12 commentAttributionDateFont];
  v20[1] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  v15 = objc_msgSend(MEMORY[0x1E4F28B18], "px_localizedAttributedStringForPostAttributionOfAssetWithDisplayType:postedByUserOrSubjectWithFullName:atDate:nameAttributes:dateAttributes:", v17, v18, v4, v10, v14);

  return v15;
}

@end
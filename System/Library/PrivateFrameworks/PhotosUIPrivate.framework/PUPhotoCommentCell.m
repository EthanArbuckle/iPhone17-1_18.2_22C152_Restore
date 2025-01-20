@interface PUPhotoCommentCell
+ (Class)layerClass;
+ (double)heightForComment:(id)a3 ofAsset:(id)a4 forWidth:(double)a5 forInterfaceOrientation:(int64_t)a6;
+ (id)_attributionStringForComment:(id)a3 ofAsset:(id)a4;
+ (id)_commentStringForComment:(id)a3;
+ (id)_synthesizedAttributedString:(id)a3 withWordWrapping:(BOOL)a4;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)usesCompactSeparators;
- (PHAsset)asset;
- (PHAssetComment)comment;
- (PUPhotoCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)commentBylineLabel;
- (UITextView)commentContentTextView;
- (UIView)styledSeparatorView;
- (void)_updateContent;
- (void)delete:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAsset:(id)a3;
- (void)setComment:(id)a3;
- (void)setUsesCompactSeparators:(BOOL)a3;
@end

@implementation PUPhotoCommentCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_commentBylineLabel, 0);
  objc_storeStrong((id *)&self->_commentContentTextView, 0);
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PHAssetComment)comment
{
  return self->_comment;
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (UILabel)commentBylineLabel
{
  return self->_commentBylineLabel;
}

- (UITextView)commentContentTextView
{
  return self->_commentContentTextView;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)PUPhotoCommentCell;
  [(PUPhotoCommentCell *)&v33 layoutSubviews];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUPhotoCommentCell semanticContentAttribute](self, "semanticContentAttribute"));
  v4 = [(PUPhotoCommentCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6 + -15.0;
  if ([(PUPhotoCommentCell *)self usesCompactSeparators]) {
    double v10 = (v6 + -15.0) * 0.5;
  }
  else {
    double v10 = v6 + -15.0;
  }
  double v11 = 15.0;
  double v12 = 15.0;
  if (v3)
  {
    [(PUPhotoCommentCell *)self bounds];
    double v12 = CGRectGetMaxX(v34) - v10 + -15.0;
  }
  v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  double v15 = v8 - 1.0 / v14;
  v16 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v16 scale];
  double v18 = 1.0 / v17;

  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v12, v15, v10, v18);
  -[UITextView sizeThatFits:](self->_commentContentTextView, "sizeThatFits:", v9 + -15.0, 1.79769313e308);
  double v20 = v19;
  double v22 = v21;
  if (v3)
  {
    v23 = [(PUPhotoCommentCell *)self contentView];
    [v23 bounds];
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.x = 15.0;
    v36.origin.y = 6.0;
    v36.size.width = v20;
    v36.size.height = v22;
    double v11 = MaxX - CGRectGetWidth(v36) + -15.0;
  }
  -[UITextView setFrame:](self->_commentContentTextView, "setFrame:", v11, 6.0, v20, v22);
  v37.origin.y = 6.0;
  v37.origin.x = v11;
  v37.size.width = v20;
  v37.size.height = v22;
  double v25 = CGRectGetMaxY(v37) + 1.0;
  -[UILabel sizeThatFits:](self->_commentBylineLabel, "sizeThatFits:", v9 + -15.0, 1.79769313e308);
  double v27 = v26;
  double v29 = v28;
  if (v3)
  {
    v30 = [(PUPhotoCommentCell *)self contentView];
    [v30 bounds];
    double v31 = CGRectGetMaxX(v38);
    v39.origin.x = 15.0;
    v39.origin.y = v25;
    v39.size.width = v27;
    v39.size.height = v29;
    double v32 = v31 - CGRectGetWidth(v39) + -15.0;
  }
  else
  {
    double v32 = 15.0;
  }
  -[UILabel setFrame:](self->_commentBylineLabel, "setFrame:", v32, v25, v27, v29);
}

- (void)setComment:(id)a3
{
  p_comment = (id *)&self->_comment;
  unint64_t v5 = (unint64_t)a3 | (unint64_t)*p_comment;
  objc_storeStrong(p_comment, a3);
  if (v5)
  {
    [(PUPhotoCommentCell *)self _updateContent];
  }
}

- (void)_updateContent
{
  commentContentTextView = self->_commentContentTextView;
  v4 = [(id)objc_opt_class() _commentStringForComment:self->_comment];
  [(UITextView *)commentContentTextView setAttributedText:v4];

  commentBylineLabel = self->_commentBylineLabel;
  double v6 = objc_opt_class();
  comment = self->_comment;
  double v8 = [(PUPhotoCommentCell *)self asset];
  double v9 = [v6 _attributionStringForComment:comment ofAsset:v8];
  [(UILabel *)commentBylineLabel setAttributedText:v9];

  styledSeparatorView = self->_styledSeparatorView;
  id v11 = [MEMORY[0x1E4FB1618] separatorColor];
  [(UIView *)styledSeparatorView setBackgroundColor:v11];
}

- (void)delete:(id)a3
{
  v4 = [(PUPhotoCommentCell *)self asset];
  unint64_t v5 = [v4 photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__PUPhotoCommentCell_delete___block_invoke;
  v9[3] = &unk_1E5F2ECC8;
  id v10 = v4;
  id v11 = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PUPhotoCommentCell_delete___block_invoke_2;
  v7[3] = &unk_1E5F2E3B8;
  id v8 = v10;
  id v6 = v10;
  [v5 performChanges:v9 completionHandler:v7];
}

void __29__PUPhotoCommentCell_delete___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  v4[0] = *(void *)(*(void *)(a1 + 40) + 1048);
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 removeComments:v3];
}

void __29__PUPhotoCommentCell_delete___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = PLSharedAlbumsGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [*(id *)(a1 + 32) uuid];
      int v13 = 138543362;
      double v14 = v7;
      id v8 = "Succesfully deleted comment from shared asset %{public}@";
      double v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_9:
      uint32_t v12 = 12;
      goto LABEL_10;
    }
  }
  else
  {
    id v6 = PLSharedAlbumsGetLog();
    BOOL v11 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v11)
      {
        double v7 = [*(id *)(a1 + 32) uuid];
        int v13 = 138543618;
        double v14 = v7;
        __int16 v15 = 2112;
        id v16 = v5;
        id v8 = "Failed to delete comment from shared asset %{public}@, with error: %@";
        double v9 = v6;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
LABEL_10:
        _os_log_impl(&dword_1AE9F8000, v9, v10, v8, (uint8_t *)&v13, v12);
      }
    }
    else if (v11)
    {
      double v7 = [*(id *)(a1 + 32) uuid];
      int v13 = 138543362;
      double v14 = v7;
      id v8 = "Failed to delete comment from shared asset %{public}@";
      double v9 = v6;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      goto LABEL_9;
    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_delete_ == a3)
  {
    comment = self->_comment;
    return [(PHAssetComment *)comment canBeDeletedByUser];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUPhotoCommentCell;
    return -[PUPhotoCommentCell canPerformAction:withSender:](&v6, sel_canPerformAction_withSender_);
  }
}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    [(PUPhotoCommentCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoCommentCell;
  [(PUPhotoCommentCell *)&v4 prepareForReuse];
  comment = self->_comment;
  self->_comment = 0;
}

- (PUPhotoCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)PUPhotoCommentCell;
  objc_super v4 = [(PUPhotoCommentCell *)&v26 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(PUPhotoCommentCell *)v4 setSelectionStyle:0];
    id v6 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    commentBylineLabel = v5->_commentBylineLabel;
    v5->_commentBylineLabel = (UILabel *)v11;

    int v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    styledSeparatorView = v5->_styledSeparatorView;
    v5->_styledSeparatorView = v13;

    __int16 v15 = v5->_styledSeparatorView;
    id v16 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v15 setBackgroundColor:v16];

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initWithFrame:", v7, v8, v9, v10);
    commentContentTextView = v5->_commentContentTextView;
    v5->_commentContentTextView = (UITextView *)v17;

    double v19 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v5->_commentContentTextView setBackgroundColor:v19];

    [(UITextView *)v5->_commentContentTextView setDataDetectorTypes:2];
    [(UITextView *)v5->_commentContentTextView setEditable:0];
    [(UITextView *)v5->_commentContentTextView setSelectable:1];
    [(UITextView *)v5->_commentContentTextView _setInteractiveTextSelectionDisabled:1];
    -[UITextView setTextContainerInset:](v5->_commentContentTextView, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    double v20 = [(UITextView *)v5->_commentContentTextView textContainer];
    [v20 setLineFragmentPadding:0.0];

    double v21 = v5->_commentBylineLabel;
    double v22 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v21 setBackgroundColor:v22];

    [(UILabel *)v5->_commentBylineLabel setNumberOfLines:0];
    v23 = [(PUPhotoCommentCell *)v5 contentView];
    [v23 addSubview:v5->_commentContentTextView];

    v24 = [(PUPhotoCommentCell *)v5 contentView];
    [v24 addSubview:v5->_commentBylineLabel];

    [(PUPhotoCommentCell *)v5 addSubview:v5->_styledSeparatorView];
  }
  return v5;
}

+ (id)_attributionStringForComment:(id)a3 ofAsset:(id)a4
{
  v30[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v5 isCaption];
  if ([v5 isMyComment]) {
    PLLocalizedFrameworkString();
  }
  else {
  double v8 = [v5 commenterDisplayName];
  }
  uint64_t v9 = objc_msgSend(v8, "length", v6);
  double v10 = (void *)MEMORY[0x1E4FB06F8];
  if (v9)
  {
    v29[0] = *MEMORY[0x1E4FB0700];
    uint64_t v11 = [MEMORY[0x1E4FB1618] labelColor];
    uint32_t v12 = v10;
    v29[1] = *v10;
    v30[0] = v11;
    int v13 = [MEMORY[0x1E4F8A5D8] sharedCache];
    double v14 = [v13 commentAttributionNameFont];
    v30[1] = v14;
    __int16 v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8 attributes:v15];
    [v7 addObject:v16];
  }
  else
  {
    uint32_t v12 = (void *)MEMORY[0x1E4FB06F8];
    [v7 addObject:&stru_1F06BE7B8];
  }
  uint64_t v17 = [v5 commentDate];
  double v18 = PLRelativePrettyDateForDate();

  [v7 addObject:v18];
  if (([v26 isVideo] & 1) == 0) {
    [v26 isStreamedVideo];
  }
  double v19 = PLLocalizedFrameworkString();
  v27[0] = *MEMORY[0x1E4FB0700];
  double v20 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v27[1] = *v12;
  v28[0] = v20;
  double v21 = [MEMORY[0x1E4F8A5D8] sharedCache];
  double v22 = [v21 commentAttributionDateFont];
  v28[1] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  v24 = objc_msgSend(MEMORY[0x1E4F28B18], "px_stringWithFormat:defaultAttributes:arguments:", v19, v23, v7);

  return v24;
}

+ (id)_commentStringForComment:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 commentText];
  v10[0] = *MEMORY[0x1E4FB0700];
  objc_super v4 = [MEMORY[0x1E4FB1618] labelColor];
  v11[0] = v4;
  v10[1] = *MEMORY[0x1E4FB06F8];
  id v5 = [MEMORY[0x1E4F8A5D8] sharedCache];
  id v6 = [v5 commentTextFont];
  v11[1] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v3 attributes:v7];
  return v8;
}

+ (double)heightForComment:(id)a3 ofAsset:(id)a4 forWidth:(double)a5 forInterfaceOrientation:(int64_t)a6
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 _commentStringForComment:v10];
  uint32_t v12 = +[PUPhotoCommentCell _synthesizedAttributedString:v11 withWordWrapping:1];

  double v13 = a5 + -30.0;
  objc_msgSend(v12, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  CGRect v20 = CGRectIntegral(v19);
  double v14 = v20.size.height + 0.0;
  __int16 v15 = objc_msgSend(a1, "_attributionStringForComment:ofAsset:", v10, v9, v20.origin.x, v20.origin.y, v20.size.width);

  id v16 = +[PUPhotoCommentCell _synthesizedAttributedString:v15 withWordWrapping:1];

  objc_msgSend(v16, "boundingRectWithSize:options:context:", 1, 0, v13, 1.79769313e308);
  CGRect v22 = CGRectIntegral(v21);
  if (v14 + v22.size.height + 0.0 + 13.0 >= 41.0) {
    double v17 = v14 + v22.size.height + 0.0 + 13.0;
  }
  else {
    double v17 = 41.0;
  }

  return v17;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)_synthesizedAttributedString:(id)a3 withWordWrapping:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = [MEMORY[0x1E4FB1930] _defaultAttributes];
    id v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = *MEMORY[0x1E4FB0738];
    id v9 = [v7 objectForKey:*MEMORY[0x1E4FB0738]];
    id v10 = (void *)[v9 mutableCopy];

    if (v4) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = 4;
    }
    [v10 setLineBreakMode:v11];
    [v7 setObject:v10 forKey:v8];
    uint64_t v12 = [v5 length];
    id v13 = objc_alloc(MEMORY[0x1E4F28E48]);
    double v14 = [v5 string];
    __int16 v15 = (void *)[v13 initWithString:v14 attributes:v7];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__PUPhotoCommentCell__synthesizedAttributedString_withWordWrapping___block_invoke;
    v18[3] = &unk_1E5F28968;
    id v16 = v15;
    id v19 = v16;
    objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0, v18);
  }
  else
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F06BE7B8];
  }

  return v16;
}

uint64_t __68__PUPhotoCommentCell__synthesizedAttributedString_withWordWrapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

@end
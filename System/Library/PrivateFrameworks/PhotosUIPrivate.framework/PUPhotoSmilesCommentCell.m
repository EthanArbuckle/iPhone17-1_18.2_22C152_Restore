@interface PUPhotoSmilesCommentCell
+ (double)heightOfSmileCellWithComments:(id)a3 forWidth:(double)a4 isVideo:(BOOL)a5 forInterfaceOrientation:(int64_t)a6;
+ (id)_attributedStringForComments:(id)a3 color:(id)a4 isVideo:(BOOL)a5;
+ (id)_smileStringForComments:(id)a3;
- (BOOL)isVideo;
- (BOOL)usesCompactSeparators;
- (PUPhotoSmilesCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 isVideo:(BOOL)a5;
- (PXFastEnumeration)userLikes;
- (UILabel)smileContentLabel;
- (UIView)styledSeparatorView;
- (void)_updateContent;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIsVideo:(BOOL)a3;
- (void)setUserLikes:(id)a3;
- (void)setUsesCompactSeparators:(BOOL)a3;
@end

@implementation PUPhotoSmilesCommentCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styledSeparatorView, 0);
  objc_storeStrong((id *)&self->_userLikes, 0);
  objc_storeStrong((id *)&self->_smileContentLabel, 0);
}

- (UIView)styledSeparatorView
{
  return self->_styledSeparatorView;
}

- (BOOL)usesCompactSeparators
{
  return self->_usesCompactSeparators;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (PXFastEnumeration)userLikes
{
  return self->_userLikes;
}

- (UILabel)smileContentLabel
{
  return self->_smileContentLabel;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = PUPhotoSmilesCommentCell;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  uint64_t v3 = [(PUPhotoSmilesCommentCell *)self effectiveUserInterfaceLayoutDirection];
  v4 = [(PUPhotoSmilesCommentCell *)self contentView];
  [v4 bounds];
  rect.origin.x = v5;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v9 + -15.0;
  -[UILabel sizeThatFits:](self->_smileContentLabel, "sizeThatFits:", v9 + -15.0 + -10.0, v11 + -12.0 + -12.0);
  double v14 = v13;
  double v15 = 15.0;
  double v16 = 15.0;
  if (v3 == 1)
  {
    v24.origin.x = rect.origin.x;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    double v16 = CGRectGetMaxX(v24) - v14 + -15.0;
  }
  -[UILabel setFrame:](self->_smileContentLabel, "setFrame:", v16, 12.0, v14, v11 + -12.0 + -12.0);
  v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v17 scale];
  double v19 = v18;

  v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v20 scale];
  double v22 = v21;

  if ([(PUPhotoSmilesCommentCell *)self usesCompactSeparators]) {
    double v12 = v12 * 0.5;
  }
  if (v3 == 1)
  {
    v25.origin.x = rect.origin.x;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    double v15 = CGRectGetMaxX(v25) - v12 + -15.0;
  }
  -[UIView setFrame:](self->_styledSeparatorView, "setFrame:", v15, v11 - 1.0 / v19, v12, 1.0 / v22);
}

- (void)setUserLikes:(id)a3
{
  CGFloat v5 = (PXFastEnumeration *)a3;
  if (self->_userLikes != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_userLikes, a3);
    [(PUPhotoSmilesCommentCell *)self _updateContent];
    CGFloat v5 = v6;
  }
}

- (void)_updateContent
{
  uint64_t v3 = objc_opt_class();
  userLikes = self->_userLikes;
  CGFloat v5 = [MEMORY[0x1E4FB1618] labelColor];
  id v9 = [v3 _attributedStringForComments:userLikes color:v5 isVideo:self->_isVideo];

  BOOL v6 = [(PXFastEnumeration *)self->_userLikes count] == 0;
  BOOL v7 = v6;
  if (v6) {
    id v8 = 0;
  }
  else {
    id v8 = v9;
  }
  [(UILabel *)self->_smileContentLabel setAttributedText:v8];
  [(UIView *)self->_styledSeparatorView setHidden:v7];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoSmilesCommentCell;
  [(PUPhotoSmilesCommentCell *)&v3 prepareForReuse];
  [(PUPhotoSmilesCommentCell *)self setUserLikes:0];
}

- (void)setUsesCompactSeparators:(BOOL)a3
{
  if (self->_usesCompactSeparators != a3)
  {
    self->_usesCompactSeparators = a3;
    [(PUPhotoSmilesCommentCell *)self setNeedsLayout];
  }
}

- (PUPhotoSmilesCommentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 isVideo:(BOOL)a5
{
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoSmilesCommentCell;
  BOOL v6 = [(PUPhotoSmilesCommentCell *)&v19 initWithStyle:a3 reuseIdentifier:a4];
  BOOL v7 = v6;
  if (v6)
  {
    [(PUPhotoSmilesCommentCell *)v6 setSelectionStyle:0];
    [(PUPhotoSmilesCommentCell *)v7 setAccessoryType:0];
    [(PUPhotoSmilesCommentCell *)v7 setEditingAccessoryType:0];
    id v8 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    smileContentLabel = v7->_smileContentLabel;
    v7->_smileContentLabel = (UILabel *)v9;

    [(UILabel *)v7->_smileContentLabel setNumberOfLines:0];
    [(UILabel *)v7->_smileContentLabel setLineBreakMode:0];
    double v11 = v7->_smileContentLabel;
    double v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v11 setBackgroundColor:v12];

    double v13 = [(PUPhotoSmilesCommentCell *)v7 contentView];
    [v13 addSubview:v7->_smileContentLabel];

    double v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    styledSeparatorView = v7->_styledSeparatorView;
    v7->_styledSeparatorView = v14;

    double v16 = v7->_styledSeparatorView;
    v17 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v16 setBackgroundColor:v17];

    [(PUPhotoSmilesCommentCell *)v7 addSubview:v7->_styledSeparatorView];
    v7->_isVideo = a5;
  }
  return v7;
}

+ (double)heightOfSmileCellWithComments:(id)a3 forWidth:(double)a4 isVideo:(BOOL)a5 forInterfaceOrientation:(int64_t)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  if ([v9 count])
  {
    double v10 = [a1 _attributedStringForComments:v9 color:0 isVideo:v6];
    double v11 = +[PUPhotoCommentCell _synthesizedAttributedString:v10 withWordWrapping:1];

    objc_msgSend(v11, "boundingRectWithSize:options:context:", 1, 0, a4 + -25.0, 1.79769313e308);
    CGRect v15 = CGRectIntegral(v14);
    if (v15.size.height + 12.0 + 12.0 >= 25.0) {
      double v12 = v15.size.height + 12.0 + 12.0;
    }
    else {
      double v12 = 25.0;
    }
  }
  else
  {
    double v12 = 0.0;
  }

  return v12;
}

+ (id)_attributedStringForComments:(id)a3 color:(id)a4 isVideo:(BOOL)a5
{
  BOOL v33 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    id v7 = [MEMORY[0x1E4FB1618] redColor];
  }
  uint64_t v9 = *MEMORY[0x1E4FB06F8];
  v40[0] = *MEMORY[0x1E4FB0700];
  uint64_t v8 = v40[0];
  v40[1] = v9;
  v41[0] = v7;
  double v10 = [MEMORY[0x1E4F8A5D8] sharedCache];
  double v11 = [v10 likeFont];
  v41[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

  v38[1] = v9;
  v39[0] = v7;
  v38[0] = v8;
  double v13 = [MEMORY[0x1E4F8A5D8] sharedCache];
  CGRect v14 = [v13 youLikeFont];
  v39[1] = v14;
  CGRect v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  if (![v6 count])
  {
    PLLocalizedFrameworkString();
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)MEMORY[0x1E4F28B18];
LABEL_20:
    uint64_t v28 = [[v27 alloc] initWithString:v26 attributes:v12];
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    id v26 = [(id)objc_opt_class() _smileStringForComments:v6];
    v27 = (objc_class *)MEMORY[0x1E4F28B18];
    goto LABEL_20;
  }
  v32 = v15;
  id v16 = v6;
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v16;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    char v21 = 0;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v18);
        }
        CGRect v24 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (objc_msgSend(v24, "isMyComment", v32))
        {
          char v21 = 1;
        }
        else
        {
          CGRect v25 = [v24 commenterDisplayName];
          if ([v25 length]) {
            [v17 addObject:v25];
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v20);
  }
  else
  {
    char v21 = 0;
  }

  id v29 = v17;
  id v26 = v29;
  CGRect v15 = v32;
  uint64_t v28 = objc_msgSend(MEMORY[0x1E4F28B18], "px_localizedAttributedStringForLikesFromUser:otherPeopleFullNames:isVideo:defaultTextAttributes:emphasizedTextAttributes:", v21 & 1, v26, v33, v12, v32);
LABEL_23:
  v30 = (void *)v28;

  return v30;
}

+ (id)_smileStringForComments:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v10 isMyComment] & 1) == 0)
        {
          double v11 = [v10 commenterDisplayName];
          if ([v11 length]) {
            [v4 addObject:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [v4 count];
  uint64_t v13 = v12 - 1;
  if (v12 == 1)
  {
    CGRect v14 = PLLocalizedFrameworkString();
    CGRect v15 = [v4 objectAtIndex:0];
    id v17 = PUStringWithValidatedFormat();
  }
  else
  {
    if (!v12)
    {
      id v17 = PLLocalizedFrameworkString();
      goto LABEL_18;
    }
    CGRect v14 = PLLocalizedFrameworkString();
    id v16 = objc_msgSend(v4, "subarrayWithRange:", 0, v13);
    CGRect v15 = [v16 componentsJoinedByString:@", "];

    uint64_t v19 = [v4 lastObject];
    id v17 = PUStringWithValidatedFormat();
  }
LABEL_18:

  return v17;
}

@end
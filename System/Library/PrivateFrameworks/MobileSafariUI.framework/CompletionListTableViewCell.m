@interface CompletionListTableViewCell
+ (double)imageWidthSpace;
- (void)layoutSubviews;
@end

@implementation CompletionListTableViewCell

+ (double)imageWidthSpace
{
  return 48.0;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)CompletionListTableViewCell;
  [(CompletionListTableViewCell *)&v54 layoutSubviews];
  int v3 = [(CompletionListTableViewCell *)self _sf_usesLeftToRightLayout];
  v4 = [(CompletionListTableViewCell *)self imageView];
  v5 = [v4 image];
  if (v5)
  {
    [v4 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [v5 size];
    double v13 = v12;
    double v15 = v14;
    +[CompletionListTableViewCell imageWidthSpace];
    double v17 = v16;
    if (v3)
    {
      _SFRoundFloatToPixels();
      double v19 = v18;
    }
    else
    {
      v20 = [(CompletionListTableViewCell *)self contentView];
      [v20 bounds];
      CGRectGetMaxX(v55);
      _SFRoundFloatToPixels();
      double v19 = v21;
    }
    v22 = [v4 image];
    char v23 = [v22 isSymbolImage];

    if ((v23 & 1) == 0)
    {
      _SFRoundFloatToPixels();
      double v7 = v24;
      double v11 = v15;
      double v9 = v13;
    }
    objc_msgSend(v4, "setFrame:", v19, v7, v9, v11);
    v25 = [(CompletionListTableViewCell *)self textLabel];
    [v25 frame];
    CGFloat v27 = v26;
    double v29 = v28;
    CGFloat v31 = v30;
    v32 = [(CompletionListTableViewCell *)self detailTextLabel];
    [v32 frame];
    CGFloat v35 = v34;
    CGFloat v36 = v33;
    CGFloat v38 = v37;
    if (v3)
    {
      [(CompletionListTableViewCell *)self separatorInset];
      [(CompletionListTableViewCell *)self bounds];
      v56.origin.x = v17;
      v56.origin.y = v27;
      v56.size.width = v29;
      v56.size.height = v31;
      CGRectGetMaxX(v56);
      v57.origin.x = v17;
      v57.origin.y = v35;
      v57.size.width = v36;
      v57.size.height = v38;
      CGRectGetMaxX(v57);
    }
    else
    {
      CGFloat v53 = v33;
      double v39 = fmax(v17, v9);
      [(CompletionListTableViewCell *)self frame];
      CGFloat v41 = v27;
      CGFloat v42 = v40 - v39 - v29;
      [(CompletionListTableViewCell *)self frame];
      double v44 = v43 - v39;
      [v32 frame];
      double v45 = v44 - CGRectGetWidth(v58);
      [(CompletionListTableViewCell *)self separatorInset];
      [(CompletionListTableViewCell *)self bounds];
      double v47 = v46 + 16.0;
      v59.origin.x = v42;
      v59.origin.y = v41;
      v59.size.width = v29;
      v59.size.height = v31;
      CGFloat MinX = CGRectGetMinX(v59);
      CGFloat v49 = v31;
      if (MinX < v47)
      {
        double v50 = v47;
        CGFloat v51 = v41;
        double v52 = v29;
        CGRectGetMaxX(*(CGRect *)(&v49 - 3));
      }
      v60.origin.x = v45;
      v60.origin.y = v35;
      v60.size.width = v53;
      v60.size.height = v38;
      if (CGRectGetMinX(v60) < v47)
      {
        v61.origin.x = v47;
        v61.origin.y = v35;
        v61.size.width = v53;
        v61.size.height = v38;
        CGRectGetMaxX(v61);
      }
    }
    _SFRoundRectToPixels();
    objc_msgSend(v25, "setFrame:");
    _SFRoundRectToPixels();
    objc_msgSend(v32, "setFrame:");
  }
}

@end
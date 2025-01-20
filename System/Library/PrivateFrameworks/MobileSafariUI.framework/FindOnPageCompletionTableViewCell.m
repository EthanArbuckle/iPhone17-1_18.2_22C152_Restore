@interface FindOnPageCompletionTableViewCell
- (void)layoutSubviews;
@end

@implementation FindOnPageCompletionTableViewCell

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)FindOnPageCompletionTableViewCell;
  [(CompletionListTableViewCell *)&v29 layoutSubviews];
  if (_SFDeviceIsPad())
  {
    v3 = [(FindOnPageCompletionTableViewCell *)self detailTextLabel];
    objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v5 = v4;
    [v3 frame];
    double v7 = v6;
    double v9 = v8;
    v10 = [(FindOnPageCompletionTableViewCell *)self textLabel];
    [v10 frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    if ([(FindOnPageCompletionTableViewCell *)self _sf_usesLeftToRightLayout])
    {
      [(FindOnPageCompletionTableViewCell *)self bounds];
      double v20 = v19;
      [(FindOnPageCompletionTableViewCell *)self separatorInset];
      double v22 = v20 - v21 - v5 + -15.0;
      v30.origin.x = v22;
      v30.origin.y = v7;
      v30.size.width = v5;
      v30.size.height = v9;
      double v23 = CGRectGetMinX(v30) + -6.0 - v12;
    }
    else
    {
      [(FindOnPageCompletionTableViewCell *)self separatorInset];
      double v22 = v24 + 15.0;
      v31.origin.x = v12;
      v31.origin.y = v14;
      v31.size.width = v16;
      v31.size.height = v18;
      double v28 = v18;
      double v25 = v14;
      double MaxX = CGRectGetMaxX(v31);
      v32.origin.x = v22;
      v32.origin.y = v7;
      v32.size.width = v5;
      v32.size.height = v9;
      double v27 = MaxX - CGRectGetMaxX(v32);
      double v14 = v25;
      double v18 = v28;
      double v23 = v27 + -6.0;
      double v12 = v12 + v16 - (v27 + -6.0);
    }
    objc_msgSend(v10, "setFrame:", v12, v14, v23, v18);
    objc_msgSend(v3, "setFrame:", v22, v7, v5, v9);
  }
}

@end
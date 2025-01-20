@interface PKPayLaterStackedLeadingTrailingRow
- (BOOL)isEqual:(id)a3;
- (BOOL)showProgressBar;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSString)detailText;
- (NSString)leadingPrimaryText;
- (NSString)leadingSecondaryText;
- (NSString)trailingPrimaryText;
- (NSString)trailingSecondaryText;
- (PKPayLaterStackedLeadingTrailingRow)initWithLeadingPrimaryText:(id)a3 leadingSecondaryText:(id)a4 trailingPrimaryText:(id)a5 trailingSecondaryText:(id)a6 detailText:(id)a7;
- (UIColor)progressBarEndColor;
- (UIColor)progressBarStartColor;
- (double)progress;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setLeadingPrimaryText:(id)a3;
- (void)setLeadingSecondaryText:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressBarEndColor:(id)a3;
- (void)setProgressBarStartColor:(id)a3;
- (void)setShowProgressBar:(BOOL)a3;
- (void)setTrailingPrimaryText:(id)a3;
- (void)setTrailingSecondaryText:(id)a3;
@end

@implementation PKPayLaterStackedLeadingTrailingRow

- (PKPayLaterStackedLeadingTrailingRow)initWithLeadingPrimaryText:(id)a3 leadingSecondaryText:(id)a4 trailingPrimaryText:(id)a5 trailingSecondaryText:(id)a6 detailText:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterStackedLeadingTrailingRow;
  v17 = [(PKPayLaterStackedLeadingTrailingRow *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_leadingPrimaryText, a3);
    objc_storeStrong((id *)&v18->_leadingSecondaryText, a4);
    objc_storeStrong((id *)&v18->_trailingPrimaryText, a5);
    objc_storeStrong((id *)&v18->_trailingSecondaryText, a6);
    objc_storeStrong((id *)&v18->_detailText, a7);
  }

  return v18;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_leadingPrimaryText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_leadingSecondaryText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_trailingPrimaryText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_trailingSecondaryText) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_detailText) {
    objc_msgSend(v3, "appendString:");
  }
  v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKPayLaterStackedLeadingTrailingRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    leadingPrimaryText = self->_leadingPrimaryText;
    id v5 = v6;
    [v5 setLeadingPrimaryText:leadingPrimaryText];
    [v5 setLeadingSecondaryText:self->_leadingSecondaryText];
    [v5 setTrailingPrimaryText:self->_trailingPrimaryText];
    [v5 setTrailingSecondaryText:self->_trailingSecondaryText];
    [v5 setDetailText:self->_detailText];
    [v5 setShowProgressBar:self->_showProgressBar];
    [v5 setProgress:self->_progress];
    [v5 setProgressBarStartColor:self->_progressBarStartColor];
    [v5 setProgressBarEndColor:self->_progressBarEndColor];
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_leadingPrimaryText];
  [v3 safelyAddObject:self->_leadingSecondaryText];
  [v3 safelyAddObject:self->_trailingPrimaryText];
  [v3 safelyAddObject:self->_trailingSecondaryText];
  [v3 safelyAddObject:self->_detailText];
  [v3 safelyAddObject:self->_progressBarStartColor];
  [v3 safelyAddObject:self->_progressBarEndColor];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterStackedLeadingTrailingRow *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        leadingPrimaryText = v6->_leadingPrimaryText;
        v8 = self->_leadingPrimaryText;
        v9 = leadingPrimaryText;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          if (!v8 || !v9) {
            goto LABEL_35;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_36;
          }
        }
        leadingSecondaryText = v6->_leadingSecondaryText;
        v8 = self->_leadingSecondaryText;
        id v14 = leadingSecondaryText;
        if (v8 == v14)
        {
        }
        else
        {
          v10 = v14;
          if (!v8 || !v14) {
            goto LABEL_35;
          }
          BOOL v15 = [(NSString *)v8 isEqualToString:v14];

          if (!v15) {
            goto LABEL_36;
          }
        }
        trailingPrimaryText = v6->_trailingPrimaryText;
        v8 = self->_trailingPrimaryText;
        v17 = trailingPrimaryText;
        if (v8 == v17)
        {
        }
        else
        {
          v10 = v17;
          if (!v8 || !v17) {
            goto LABEL_35;
          }
          BOOL v18 = [(NSString *)v8 isEqualToString:v17];

          if (!v18) {
            goto LABEL_36;
          }
        }
        trailingSecondaryText = v6->_trailingSecondaryText;
        v8 = self->_trailingSecondaryText;
        id v20 = trailingSecondaryText;
        if (v8 == v20)
        {
        }
        else
        {
          v10 = v20;
          if (!v8 || !v20) {
            goto LABEL_35;
          }
          BOOL v21 = [(NSString *)v8 isEqualToString:v20];

          if (!v21) {
            goto LABEL_36;
          }
        }
        detailText = v6->_detailText;
        v8 = self->_detailText;
        v23 = detailText;
        if (v8 == v23)
        {

LABEL_40:
          if (PKEqualObjects()
            && PKEqualObjects()
            && self->_showProgressBar == v6->_showProgressBar)
          {
            BOOL v12 = self->_progress == v6->_progress;
            goto LABEL_37;
          }
LABEL_36:
          BOOL v12 = 0;
LABEL_37:

          goto LABEL_38;
        }
        v10 = v23;
        if (v8 && v23)
        {
          BOOL v24 = [(NSString *)v8 isEqualToString:v23];

          if (!v24) {
            goto LABEL_36;
          }
          goto LABEL_40;
        }
LABEL_35:

        goto LABEL_36;
      }
    }
    BOOL v12 = 0;
  }
LABEL_38:

  return v12;
}

- (NSString)leadingPrimaryText
{
  return self->_leadingPrimaryText;
}

- (void)setLeadingPrimaryText:(id)a3
{
}

- (NSString)leadingSecondaryText
{
  return self->_leadingSecondaryText;
}

- (void)setLeadingSecondaryText:(id)a3
{
}

- (NSString)trailingPrimaryText
{
  return self->_trailingPrimaryText;
}

- (void)setTrailingPrimaryText:(id)a3
{
}

- (NSString)trailingSecondaryText
{
  return self->_trailingSecondaryText;
}

- (void)setTrailingSecondaryText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (BOOL)showProgressBar
{
  return self->_showProgressBar;
}

- (void)setShowProgressBar:(BOOL)a3
{
  self->_showProgressBar = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (UIColor)progressBarStartColor
{
  return self->_progressBarStartColor;
}

- (void)setProgressBarStartColor:(id)a3
{
}

- (UIColor)progressBarEndColor
{
  return self->_progressBarEndColor;
}

- (void)setProgressBarEndColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarEndColor, 0);
  objc_storeStrong((id *)&self->_progressBarStartColor, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_trailingSecondaryText, 0);
  objc_storeStrong((id *)&self->_trailingPrimaryText, 0);
  objc_storeStrong((id *)&self->_leadingSecondaryText, 0);

  objc_storeStrong((id *)&self->_leadingPrimaryText, 0);
}

@end
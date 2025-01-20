@interface MFBannerView
- (EMCollectionItemID)itemID;
- (MFBannerView)initWithType:(int64_t)a3 itemID:(id)a4 delegate:(id)a5;
- (MFBannerViewDelegate)delegate;
- (UIButton)editButton;
- (UIImageView)imageView;
- (UILabel)bannerLabel;
- (UILabel)dateLabel;
- (id)_editButtonConfiguration;
- (id)_readLaterStringForDate:(id)a3;
- (int64_t)type;
- (void)_configureWithType:(id *)a1;
- (void)_updateBannerLabelTextWithReadLaterDate:(id)a3;
- (void)displayMessageUsingViewModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemID:(id)a3;
@end

@implementation MFBannerView

- (MFBannerView)initWithType:(int64_t)a3 itemID:(id)a4 delegate:(id)a5
{
  v68[2] = *MEMORY[0x1E4F143B8];
  id v58 = a4;
  id obj = a5;
  v65.receiver = self;
  v65.super_class = (Class)MFBannerView;
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13 = -[MFMessageHeaderViewBlock initWithFrame:](&v65, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_itemID, a4);
    objc_storeWeak((id *)&v14->_delegate, obj);
    v59 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v15 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [(MFBannerView *)v14 setBackgroundColor:v15];

    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    bannerLabel = v14->_bannerLabel;
    v14->_bannerLabel = (UILabel *)v16;

    v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v14->_bannerLabel setTextColor:v18];

    [(UILabel *)v14->_bannerLabel setFont:v59];
    [(UILabel *)v14->_bannerLabel setNumberOfLines:0];
    [(UILabel *)v14->_bannerLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v14->_bannerLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(UILabel *)v14->_bannerLabel setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(UILabel *)v14->_bannerLabel setContentHuggingPriority:0 forAxis:v20];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v9, v10, v11, v12);
    dateLabel = v14->_dateLabel;
    v14->_dateLabel = (UILabel *)v21;

    [(UILabel *)v14->_dateLabel setFont:v59];
    [(UILabel *)v14->_dateLabel setNumberOfLines:0];
    [(UILabel *)v14->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v14->_dateLabel setAdjustsFontForContentSizeCategory:1];
    LODWORD(v23) = 1148846080;
    [(UILabel *)v14->_dateLabel setContentCompressionResistancePriority:1 forAxis:v23];
    id v24 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v68[0] = v14->_bannerLabel;
    v68[1] = v14->_dateLabel;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
    v61 = (void *)[v24 initWithArrangedSubviews:v25];

    [v61 setAxis:1];
    [v61 setAlignment:1];
    LODWORD(v26) = 1148846080;
    [v61 setContentCompressionResistancePriority:1 forAxis:v26];
    v27 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v14->_dateLabel setTextColor:v27];

    v28 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v14->_bannerLabel setTextColor:v28];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v14);
    v29 = (void *)MEMORY[0x1E4FB14D0];
    v30 = [(MFBannerView *)v14 _editButtonConfiguration];
    v31 = (void *)MEMORY[0x1E4FB13F0];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __45__MFBannerView_initWithType_itemID_delegate___block_invoke;
    v62[3] = &unk_1E6D1AE80;
    objc_copyWeak(&v63, &location);
    v32 = [v31 actionWithHandler:v62];
    uint64_t v33 = [v29 buttonWithConfiguration:v30 primaryAction:v32];
    editButton = v14->_editButton;
    v14->_editButton = (UIButton *)v33;

    [(UIButton *)v14->_editButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v35) = 1148846080;
    [(UIButton *)v14->_editButton setContentHuggingPriority:0 forAxis:v35];
    LODWORD(v36) = 1148846080;
    [(UIButton *)v14->_editButton setContentHuggingPriority:1 forAxis:v36];
    id v37 = objc_alloc_init(MEMORY[0x1E4FB1C60]);
    v38 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    LODWORD(v29) = UIContentSizeCategoryIsAccessibilityCategory(v38);

    if (v29)
    {
      [v61 addArrangedSubview:v14->_editButton];
      [v61 setCustomSpacing:v14->_dateLabel afterView:12.0];
      double v39 = 16.0;
      [v37 addArrangedSubview:v61];
    }
    else
    {
      v67[0] = v61;
      v67[1] = v14->_editButton;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
      objc_msgSend(v37, "mf_addArrangedSubviews:", v40);

      double v39 = 8.0;
      [v37 setCustomSpacing:v61 afterView:8.0];
    }
    [v37 setAxis:0];
    [v37 setAlignment:3];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFBannerView *)v14 addSubview:v37];
    v41 = (void *)MEMORY[0x1E4F28DC8];
    v57 = [v37 leadingAnchor];
    v54 = [(MFBannerView *)v14 layoutMarginsGuide];
    v53 = [v54 leadingAnchor];
    v52 = objc_msgSend(v57, "constraintEqualToAnchor:constant:", -7.0);
    v66[0] = v52;
    v56 = [v37 topAnchor];
    v51 = [(MFBannerView *)v14 topAnchor];
    v50 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 8.0);
    v66[1] = v50;
    v55 = [v37 bottomAnchor];
    v42 = [(MFBannerView *)v14 bottomAnchor];
    v43 = [v55 constraintEqualToAnchor:v42 constant:-v39];
    v66[2] = v43;
    v44 = [v37 trailingAnchor];
    v45 = [(MFBannerView *)v14 layoutMarginsGuide];
    v46 = [v45 trailingAnchor];
    v47 = [v44 constraintEqualToAnchor:v46 constant:7.0];
    v66[3] = v47;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:4];
    [v41 activateConstraints:v48];

    [(MFMessageHeaderViewBlock *)v14 setSeparatorIsHidden:1];
    -[MFBannerView _configureWithType:]((id *)&v14->super.super.super.super.isa);

    objc_destroyWeak(&v63);
    objc_destroyWeak(&location);
  }
  return v14;
}

void __45__MFBannerView_initWithType_itemID_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained delegate];
    v3 = [v4 itemID];
    [v2 bannerViewDidSelectEditButton:v4 itemID:v3];

    id WeakRetained = v4;
  }
}

- (void)_configureWithType:(id *)a1
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [a1 type];
    if (v2 != 2)
    {
      if (v2 == 1)
      {
        id v4 = [a1 viewModel];
        v5 = [v4 readLaterDate];
        [a1 _updateBannerLabelTextWithReadLaterDate:v5];
        goto LABEL_8;
      }
      if (v2)
      {
        v6 = 0;
        goto LABEL_10;
      }
    }
    v3 = NSString;
    id v4 = _EFLocalizedString();
    v5 = [v3 stringWithFormat:v4];
    [a1[65] setText:v5];
LABEL_8:

    v6 = _EFLocalizedString();
LABEL_10:
    uint64_t v12 = *MEMORY[0x1E4FB06F8];
    v7 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09E0]];
    v13[0] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v6 attributes:v8];
    double v10 = [a1 editButton];
    double v11 = [v10 configuration];
    [v11 setAttributedTitle:v9];
    [v10 setConfiguration:v11];
  }
}

- (void)_updateBannerLabelTextWithReadLaterDate:(id)a3
{
  id v4 = [(MFBannerView *)self _readLaterStringForDate:a3];
  -[UILabel setText:](self->_bannerLabel, "setText:");
}

- (id)_readLaterStringForDate:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "ef_isEarlierThanNow");
  id v4 = _EFLocalizedString();

  return v4;
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFBannerView;
  [(MFMessageHeaderViewBlock *)&v11 displayMessageUsingViewModel:v4];
  v5 = [v4 itemID];
  [(MFBannerView *)self setItemID:v5];

  int64_t v6 = [(MFBannerView *)self type];
  if (v6)
  {
    if (v6 == 1)
    {
      v8 = [v4 readLaterDate];
      [(MFBannerView *)self _updateBannerLabelTextWithReadLaterDate:v8];
      goto LABEL_9;
    }
    if (v6 != 2)
    {
      v8 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = [v4 dateSent];
  }
  else
  {
    uint64_t v7 = [v4 sendLaterDate];
  }
  v8 = (void *)v7;
LABEL_9:
  double v9 = objc_msgSend(MEMORY[0x1E4F28C10], "ef_formatDate:style:", v8, 2);
  double v10 = [(MFBannerView *)self dateLabel];
  [v10 setText:v9];
}

- (id)_editButtonConfiguration
{
  uint64_t v2 = [MEMORY[0x1E4FB14D8] grayButtonConfiguration];
  [v2 setCornerStyle:4];
  [v2 setButtonSize:1];
  return v2;
}

- (MFBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (EMCollectionItemID)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (UILabel)bannerLabel
{
  return self->_bannerLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_bannerLabel, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
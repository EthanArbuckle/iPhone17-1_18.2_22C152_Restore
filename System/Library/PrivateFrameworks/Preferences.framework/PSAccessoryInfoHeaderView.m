@interface PSAccessoryInfoHeaderView
- (PSAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4;
- (UIImageView)imageView;
- (UILabel)displayNameLabel;
- (UILabel)otaNameLabel;
- (void)setDisplayNameLabel:(id)a3;
- (void)setImageView:(id)a3;
- (void)setOtaNameLabel:(id)a3;
@end

@implementation PSAccessoryInfoHeaderView

- (PSAccessoryInfoHeaderView)initWithDevice:(id)a3 insets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v71.receiver = self;
  v71.super_class = (Class)PSAccessoryInfoHeaderView;
  v10 = -[PSAccessoryInfoHeaderView initWithFrame:](&v71, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  -[PSAccessoryInfoHeaderView setLayoutMargins:](v10, "setLayoutMargins:", top, left, bottom, right);
  id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"dot.radiowaves.left.and.right"];
  uint64_t v13 = [v11 initWithImage:v12];
  imageView = v10->_imageView;
  v10->_imageView = (UIImageView *)v13;

  v15 = [MEMORY[0x1E4F42A98] configurationWithPointSize:100.0];
  [(UIImageView *)v10->_imageView setPreferredSymbolConfiguration:v15];

  v16 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [(UIImageView *)v10->_imageView setTintColor:v16];

  v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  displayNameLabel = v10->_displayNameLabel;
  v10->_displayNameLabel = v17;

  v19 = [MEMORY[0x1E4F42A30] boldSystemFontOfSize:24.0];
  [(UILabel *)v10->_displayNameLabel setFont:v19];

  v20 = [v9 discoveryConfiguration];
  v21 = [v20 displayName];
  [(UILabel *)v10->_displayNameLabel setText:v21];

  [(UILabel *)v10->_displayNameLabel setTextAlignment:1];
  [(UILabel *)v10->_displayNameLabel setNumberOfLines:0];
  v22 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  otaNameLabel = v10->_otaNameLabel;
  v10->_otaNameLabel = v22;

  v24 = [MEMORY[0x1E4F42A30] systemFontOfSize:16.0];
  [(UILabel *)v10->_otaNameLabel setFont:v24];

  v25 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
  [(UILabel *)v10->_otaNameLabel setTextColor:v25];

  v66 = v9;
  v26 = [v9 name];
  [(UILabel *)v10->_otaNameLabel setText:v26];

  [(UILabel *)v10->_otaNameLabel setTextAlignment:1];
  [(UILabel *)v10->_otaNameLabel setNumberOfLines:0];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v73[0] = v10->_imageView;
  v73[1] = v10->_displayNameLabel;
  v73[2] = v10->_otaNameLabel;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v68 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        [v32 setTranslatesAutoresizingMaskIntoConstraints:0];
        [(PSAccessoryInfoHeaderView *)v10 addSubview:v32];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v29);
  }

  v55 = (void *)MEMORY[0x1E4F28DC8];
  v65 = [(UIImageView *)v10->_imageView topAnchor];
  v64 = [(PSAccessoryInfoHeaderView *)v10 topAnchor];
  [(PSAccessoryInfoHeaderView *)v10 layoutMargins];
  v63 = objc_msgSend(v65, "constraintEqualToAnchor:constant:", v64);
  v72[0] = v63;
  v62 = [(UIImageView *)v10->_imageView centerXAnchor];
  v61 = [(PSAccessoryInfoHeaderView *)v10 centerXAnchor];
  v60 = [v62 constraintEqualToAnchor:v61];
  v72[1] = v60;
  v59 = [(UILabel *)v10->_displayNameLabel topAnchor];
  v58 = [(UIImageView *)v10->_imageView bottomAnchor];
  v57 = [v59 constraintEqualToAnchor:v58 constant:10.0];
  v72[2] = v57;
  v56 = [(UILabel *)v10->_displayNameLabel centerXAnchor];
  v54 = [(PSAccessoryInfoHeaderView *)v10 centerXAnchor];
  v53 = [v56 constraintEqualToAnchor:v54];
  v72[3] = v53;
  v52 = [(UILabel *)v10->_displayNameLabel leadingAnchor];
  v51 = [(PSAccessoryInfoHeaderView *)v10 leadingAnchor];
  [(PSAccessoryInfoHeaderView *)v10 layoutMargins];
  v50 = [v52 constraintGreaterThanOrEqualToAnchor:v51 constant:v33];
  v72[4] = v50;
  v49 = [(UILabel *)v10->_otaNameLabel topAnchor];
  v48 = [(UILabel *)v10->_displayNameLabel bottomAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:10.0];
  v72[5] = v47;
  v46 = [(UILabel *)v10->_otaNameLabel centerXAnchor];
  v34 = [(PSAccessoryInfoHeaderView *)v10 centerXAnchor];
  v35 = [v46 constraintEqualToAnchor:v34];
  v72[6] = v35;
  v36 = [(UILabel *)v10->_otaNameLabel leadingAnchor];
  v37 = [(PSAccessoryInfoHeaderView *)v10 leadingAnchor];
  [(PSAccessoryInfoHeaderView *)v10 layoutMargins];
  v39 = [v36 constraintGreaterThanOrEqualToAnchor:v37 constant:v38];
  v72[7] = v39;
  v40 = [(UILabel *)v10->_otaNameLabel bottomAnchor];
  v41 = [(PSAccessoryInfoHeaderView *)v10 bottomAnchor];
  [(PSAccessoryInfoHeaderView *)v10 layoutMargins];
  v43 = [v40 constraintLessThanOrEqualToAnchor:v41 constant:-v42];
  v72[8] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:9];
  [v55 activateConstraints:v44];

  return v10;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)displayNameLabel
{
  return self->_displayNameLabel;
}

- (void)setDisplayNameLabel:(id)a3
{
}

- (UILabel)otaNameLabel
{
  return self->_otaNameLabel;
}

- (void)setOtaNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otaNameLabel, 0);
  objc_storeStrong((id *)&self->_displayNameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
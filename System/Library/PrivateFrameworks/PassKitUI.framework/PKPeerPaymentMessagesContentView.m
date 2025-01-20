@interface PKPeerPaymentMessagesContentView
- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment;
- (BOOL)ignoreTopSafeArea;
- (PKPeerPaymentMessagesContentView)initWithFrame:(CGRect)a3;
- (PKPeerPaymentMessagesRoundedButton)button;
- (UIActivityIndicatorView)activityIndicator;
- (UIEdgeInsets)contentInset;
- (UIImageView)imageView;
- (UILabel)label;
- (double)verticalPadding;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setButton:(id)a3;
- (void)setContentAlignment:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setIgnoreTopSafeArea:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setVerticalPadding:(double)a3;
@end

@implementation PKPeerPaymentMessagesContentView

- (PKPeerPaymentMessagesContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPeerPaymentMessagesContentView;
  v3 = -[PKPeerPaymentMessagesContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[PKPeerPaymentTheme backgroundColor];
    [(PKPeerPaymentMessagesContentView *)v3 setBackgroundColor:v4];

    v3->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)*MEMORY[0x1E4F87150];
    v3->_verticalPadding = 10.0;
    BOOL v5 = [(UIView *)v3 pkui_userInterfaceIdiomSupportsLargeLayouts];
    double v6 = 44.0;
    v3->_contentInset.top = 8.0;
    if (!v5) {
      double v6 = 24.0;
    }
    v3->_contentInset.left = v6;
    v3->_contentInset.bottom = 8.0;
    v3->_contentInset.right = v6;
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPeerPaymentMessagesContentView *)self subviews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    [(PKPeerPaymentMessagesContentView *)self bounds];
    double v51 = v5;
    double v50 = v6;
    double v8 = v7;
    [(PKPeerPaymentMessagesContentView *)self safeAreaInsets];
    double v12 = v11;
    double v14 = v13;
    if (self->_ignoreTopSafeArea) {
      double v15 = 0.0;
    }
    else {
      double v15 = v9;
    }
    double top = self->_contentInset.top;
    double left = self->_contentInset.left;
    double right = self->_contentInset.right;
    double v19 = v8 - (v10 + v15) - (top + self->_contentInset.bottom);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v20 = [(PKPeerPaymentMessagesContentView *)self subviews];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      double v23 = v50 - (v12 + v14) - (left + right);
      double v24 = top + v51 + v15;
      uint64_t v25 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v61 != v25) {
            objc_enumerationMutation(v20);
          }
          v27 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          objc_msgSend(v27, "sizeThatFits:", v23, v19);
          double v29 = v28;
          if ([v27 isHidden]) {
            double v29 = 0.0 - self->_verticalPadding;
          }
          if ((self->_contentAlignment.verticalAlignment & 0xFFFFFFFD) == 1) {
            unsigned int verticalAlignment = 0;
          }
          else {
            unsigned int verticalAlignment = self->_contentAlignment.verticalAlignment;
          }
          PKSizeAlignedInRect();
          objc_msgSend(v27, "setFrame:");
          double v31 = -0.0;
          if (!verticalAlignment) {
            double v31 = v29 + self->_verticalPadding;
          }
          double v24 = v24 + v31;
          double v19 = v19 - (v29 + self->_verticalPadding);
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v22);
    }

    unsigned int v32 = self->_contentAlignment.verticalAlignment;
    if (v32 == 3)
    {
      [(PKPeerPaymentMessagesContentView *)self bounds];
      double v40 = v39;
      v41 = [(PKPeerPaymentMessagesContentView *)self subviews];
      unint64_t v42 = [v41 count];

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v33 = [(PKPeerPaymentMessagesContentView *)self subviews];
      uint64_t v43 = [v33 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        double v45 = v40 / (double)v42;
        uint64_t v46 = *(void *)v53;
        double v47 = 0.0;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v53 != v46) {
              objc_enumerationMutation(v33);
            }
            v49 = *(void **)(*((void *)&v52 + 1) + 8 * j);
            if (([v49 isHidden] & 1) == 0)
            {
              [v49 frame];
              objc_msgSend(v49, "setFrame:");
              double v47 = v45 + v47;
            }
          }
          uint64_t v44 = [v33 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v44);
      }
    }
    else
    {
      if (v32 != 1) {
        return;
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v33 = [(PKPeerPaymentMessagesContentView *)self subviews];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v57 != v36) {
              objc_enumerationMutation(v33);
            }
            v38 = *(void **)(*((void *)&v56 + 1) + 8 * k);
            if (([v38 isHidden] & 1) == 0)
            {
              [v38 frame];
              objc_msgSend(v38, "setFrame:");
            }
          }
          uint64_t v35 = [v33 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v35);
      }
    }
  }
}

- (UILabel)label
{
  label = self->_label;
  if (!label)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(PKPeerPaymentMessagesContentView *)self bounds];
    double v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    double v6 = self->_label;
    self->_label = v5;

    [(UILabel *)self->_label setNumberOfLines:0];
    double v7 = self->_label;
    double v8 = +[PKPeerPaymentTheme primaryTextColor];
    [(UILabel *)v7 setTextColor:v8];

    [(UILabel *)self->_label setTextAlignment:1];
    double v9 = self->_label;
    double v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v9 setFont:v10];

    [(PKPeerPaymentMessagesContentView *)self addSubview:self->_label];
    label = self->_label;
  }

  return label;
}

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    id v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    double v5 = self->_activityIndicator;
    self->_activityIndicator = v4;

    double v6 = self->_activityIndicator;
    double v7 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)v6 setColor:v7];

    [(PKPeerPaymentMessagesContentView *)self addSubview:self->_activityIndicator];
    activityIndicator = self->_activityIndicator;
  }

  return activityIndicator;
}

- (PKPeerPaymentMessagesRoundedButton)button
{
  button = self->_button;
  if (!button)
  {
    id v4 = objc_alloc_init(PKPeerPaymentMessagesRoundedButton);
    double v5 = self->_button;
    self->_button = v4;

    [(PKPeerPaymentMessagesContentView *)self addSubview:self->_button];
    button = self->_button;
  }

  return button;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(PKPeerPaymentMessagesContentView *)self bounds];
    double v5 = (UIImageView *)objc_msgSend(v4, "initWithFrame:");
    double v6 = self->_imageView;
    self->_imageView = v5;

    [(PKPeerPaymentMessagesContentView *)self addSubview:self->_imageView];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void)setLabel:(id)a3
{
}

- (void)setActivityIndicator:(id)a3
{
}

- (void)setButton:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- ($85CD2974BE96D4886BB301820D1C36C2)contentAlignment
{
  return ($85CD2974BE96D4886BB301820D1C36C2)self->_contentAlignment;
}

- (void)setContentAlignment:(id)a3
{
  self->_contentAlignment = ($D338B265850D33B29D0E4C40C8D279D7)a3;
}

- (double)verticalPadding
{
  return self->_verticalPadding;
}

- (void)setVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (BOOL)ignoreTopSafeArea
{
  return self->_ignoreTopSafeArea;
}

- (void)setIgnoreTopSafeArea:(BOOL)a3
{
  self->_ignoreTopSafeArea = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
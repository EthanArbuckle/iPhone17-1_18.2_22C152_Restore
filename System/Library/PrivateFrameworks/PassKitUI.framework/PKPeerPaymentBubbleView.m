@interface PKPeerPaymentBubbleView
+ (CGSize)referenceSize;
+ (CGSize)referenceSizeForPeerPaymentStatusResponse:(id)a3;
+ (CGSize)referenceSizeForState:(unint64_t)a3;
+ (CGSize)referenceSizeForState:(unint64_t)a3 andAction:(unint64_t)a4;
+ (id)applePayLogo;
+ (id)generatedSnapshotForDataURL:(id)a3 contentInset:(UIEdgeInsets)a4 isFromMe:(BOOL)a5;
+ (id)referenceBackgroundColor;
+ (id)referenceBackgroundColorForState:(unint64_t)a3;
+ (id)referenceWatchBackgroundColorForState:(unint64_t)a3;
- (BOOL)displaysApplePayLogo;
- (BOOL)hasRoundedCorners;
- (BOOL)isLiveRenderingEnabled;
- (BOOL)showsActionSpinner;
- (BOOL)testTransition;
- (BOOL)usesWatchColors;
- (CGRect)referenceBounds;
- (CGSize)referenceSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)recurringPaymentStartDate;
- (NSDecimalNumber)amount;
- (NSString)currency;
- (PKContinuousButton)actionButton;
- (PKPeerPaymentBubbleView)init;
- (PKPeerPaymentBubbleView)initWithAmount:(id)a3 currency:(id)a4 state:(unint64_t)a5;
- (PKPeerPaymentBubbleView)initWithCoder:(id)a3;
- (PKPeerPaymentBubbleView)initWithCurrencyAmount:(id)a3 state:(unint64_t)a4;
- (PKPeerPaymentBubbleView)initWithFrame:(CGRect)a3;
- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo;
- (UIEdgeInsets)contentInset;
- (double)_messageAlpha;
- (double)_statusAlpha;
- (id)_actionTitle;
- (id)_backgroundColor;
- (id)_imageLabelBackgroundColor;
- (id)_imageText;
- (id)_imageTextAttributes;
- (id)_messageText;
- (id)_messageTextAttributes;
- (id)_secondaryMessageText;
- (id)_secondaryMessageTextAttributes;
- (id)_statusText;
- (id)actionHandler;
- (id)generatedSnapshot;
- (id)initForSnapshotting;
- (id)interactiveViews;
- (unint64_t)action;
- (unint64_t)recurringPaymentFrequency;
- (unint64_t)state;
- (void)_actionButtonTapped:(id)a3;
- (void)_commonInit;
- (void)_updateContent;
- (void)awakeFromNib;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)performPostRender:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setAction:(unint64_t)a3 animated:(BOOL)a4;
- (void)setActionHandler:(id)a3;
- (void)setAmount:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setCurrency:(id)a3;
- (void)setDisplaysApplePayLogo:(BOOL)a3;
- (void)setHasRoundedCorners:(BOOL)a3;
- (void)setLiveRenderingEnabled:(BOOL)a3;
- (void)setRecurringPaymentFrequency:(unint64_t)a3;
- (void)setRecurringPaymentMemo:(id)a3;
- (void)setRecurringPaymentStartDate:(id)a3;
- (void)setShowsActionSpinner:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setTestTransition:(BOOL)a3;
- (void)setUsesWatchColors:(BOOL)a3;
- (void)updateWithPaymentTransaction:(id)a3 animated:(BOOL)a4;
- (void)updateWithPeerPaymentMessage:(id)a3 animated:(BOOL)a4;
- (void)updateWithPeerPaymentStatus:(int64_t)a3 animated:(BOOL)a4;
- (void)updateWithPeerPaymentStatusResponse:(id)a3 animated:(BOOL)a4;
@end

@implementation PKPeerPaymentBubbleView

+ (id)applePayLogo
{
  if (_MergedGlobals_3_8 != -1) {
    dispatch_once(&_MergedGlobals_3_8, &__block_literal_global_153);
  }
  v2 = (void *)qword_1E94F5950;

  return v2;
}

void __39__PKPeerPaymentBubbleView_applePayLogo__block_invoke()
{
  double v0 = PKUIScreenScale();
  id v3 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v1 = PKUIApplePayLogo(v3, 36.0, 10.0, v0);
  v2 = (void *)qword_1E94F5950;
  qword_1E94F5950 = v1;
}

+ (CGSize)referenceSize
{
  [a1 referenceSizeForState:4];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)referenceSizeForState:(unint64_t)a3
{
  [a1 referenceSizeForState:a3 andAction:a3 == 1];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)referenceSizeForState:(unint64_t)a3 andAction:(unint64_t)a4
{
  BOOL v4 = a4 == 1 && a3 == 1;
  double v5 = 174.0;
  if (v4) {
    double v5 = 157.0;
  }
  double v6 = 130.0;
  if (a4) {
    double v6 = v5;
  }
  double v7 = 186.0;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (CGSize)referenceSizeForPeerPaymentStatusResponse:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 status] + 1;
  if (v5 > 8) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1A0444980[v5];
  }
  double v7 = [v4 actions];

  if ([v7 containsObject:*MEMORY[0x1E4F87C38]]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }

  [a1 referenceSizeForState:v6 andAction:v8];
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)referenceBackgroundColor
{
  return (id)[a1 referenceBackgroundColorForState:4];
}

+ (id)referenceBackgroundColorForState:(unint64_t)a3
{
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:dbl_1A0444970[a3 - 6 < 4] alpha:1.0];

  return v3;
}

+ (id)referenceWatchBackgroundColorForState:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "colorWithRed:green:blue:alpha:", a3, 0.188235294, 0.188235294, 0.196078431, 1.0);
}

- (PKPeerPaymentBubbleView)init
{
  [(id)objc_opt_class() referenceSize];

  return -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, v4);
}

- (id)initForSnapshotting
{
  [(id)objc_opt_class() referenceSize];
  id result = -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v3, v4);
  *((unsigned char *)result + 418) = 1;
  return result;
}

- (PKPeerPaymentBubbleView)initWithCurrencyAmount:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [v6 amount];
  uint64_t v8 = [v6 currency];

  double v9 = [(PKPeerPaymentBubbleView *)self initWithAmount:v7 currency:v8 state:a4];
  return v9;
}

- (PKPeerPaymentBubbleView)initWithAmount:(id)a3 currency:(id)a4 state:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  [(id)objc_opt_class() referenceSizeForState:a5];
  v12 = -[PKPeerPaymentBubbleView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, v10, v11);
  v13 = v12;
  if (v12)
  {
    v12->_state = a5;
    uint64_t v14 = [v8 copy];
    amount = v13->_amount;
    v13->_amount = (NSDecimalNumber *)v14;

    uint64_t v16 = [v9 copy];
    currency = v13->_currency;
    v13->_currency = (NSString *)v16;

    [(PKPeerPaymentBubbleView *)v13 _updateContent];
  }

  return v13;
}

- (PKPeerPaymentBubbleView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentBubbleView;
  double v3 = -[PKPeerPaymentBubbleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(PKPeerPaymentBubbleView *)v3 _commonInit];
  }
  return v4;
}

- (PKPeerPaymentBubbleView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPeerPaymentBubbleView;
  double v3 = [(PKPeerPaymentBubbleView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(PKPeerPaymentBubbleView *)v3 _commonInit];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)PKPeerPaymentBubbleView;
  [(PKPeerPaymentBubbleView *)&v3 awakeFromNib];
  self->_liveRenderingEnabled = 1;
  [(PKPeerPaymentBubbleView *)self _updateContent];
}

- (void)_commonInit
{
  objc_super v3 = [(PKPeerPaymentBubbleView *)self _backgroundColor];
  [(PKPeerPaymentBubbleView *)self setBackgroundColor:v3];

  double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  messageLabel = self->_messageLabel;
  self->_messageLabel = v4;

  objc_super v6 = self->_messageLabel;
  double v7 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
  [(UILabel *)v6 setFont:v7];

  id v8 = self->_messageLabel;
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v8 setTextColor:v9];

  [(UILabel *)self->_messageLabel setTextAlignment:1];
  [(UILabel *)self->_messageLabel setNumberOfLines:1];
  [(UILabel *)self->_messageLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_messageLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_messageLabel setBaselineAdjustment:1];
  [(PKPeerPaymentBubbleView *)self addSubview:self->_messageLabel];
  double v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  secondaryMessageLabel = self->_secondaryMessageLabel;
  self->_secondaryMessageLabel = v10;

  v12 = self->_secondaryMessageLabel;
  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [(UILabel *)v12 setFont:v13];

  uint64_t v14 = self->_secondaryMessageLabel;
  v15 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v14 setTextColor:v15];

  [(UILabel *)self->_secondaryMessageLabel setTextAlignment:1];
  [(UILabel *)self->_secondaryMessageLabel setNumberOfLines:1];
  [(UILabel *)self->_secondaryMessageLabel setAdjustsFontSizeToFitWidth:1];
  [(UILabel *)self->_secondaryMessageLabel setMinimumScaleFactor:0.5];
  [(UILabel *)self->_secondaryMessageLabel setBaselineAdjustment:1];
  [(PKPeerPaymentBubbleView *)self addSubview:self->_secondaryMessageLabel];
  uint64_t v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  imageLabel = self->_imageLabel;
  self->_imageLabel = v16;

  [(UILabel *)self->_imageLabel setTextAlignment:1];
  [(UILabel *)self->_imageLabel setNumberOfLines:1];
  v18 = [(UILabel *)self->_imageLabel layer];
  [v18 setCornerRadius:10.0];

  v19 = [(UILabel *)self->_imageLabel layer];
  [v19 setMasksToBounds:1];

  [(PKPeerPaymentBubbleView *)self addSubview:self->_imageLabel];
  v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v20;

  v22 = self->_statusLabel;
  v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28E0]];
  [(UILabel *)v22 setFont:v23];

  v24 = self->_statusLabel;
  v25 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)v24 setTextColor:v25];

  [(UILabel *)self->_statusLabel setTextAlignment:4];
  [(UILabel *)self->_statusLabel setNumberOfLines:1];
  [(PKPeerPaymentBubbleView *)self addSubview:self->_statusLabel];
  v26 = [[PKContinuousButton alloc] initWithCornerRadius:2 effect:20.0];
  actionButton = self->_actionButton;
  self->_actionButton = v26;

  [(PKContinuousButton *)self->_actionButton addTarget:self action:sel__actionButtonTapped_ forControlEvents:64];
  v28 = self->_actionButton;
  v29 = [MEMORY[0x1E4FB1618] blackColor];
  [(PKContinuousButton *)v28 updateTitleColorWithColor:v29];

  v30 = self->_actionButton;
  v31 = [MEMORY[0x1E4FB1618] whiteColor];
  [(PKContinuousButton *)v30 setTintColor:v31];

  -[PKContinuousButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 26.5, 0.0, 26.5);
  v32 = [(PKContinuousButton *)self->_actionButton titleLabel];
  [v32 setAdjustsFontSizeToFitWidth:1];

  v33 = [(PKContinuousButton *)self->_actionButton titleLabel];
  [v33 setMinimumScaleFactor:0.5];

  [(PKContinuousButton *)self->_actionButton setAccessibilityIdentifier:*MEMORY[0x1E4F851B0]];
  [(PKPeerPaymentBubbleView *)self addSubview:self->_actionButton];
  v34 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  actionSpinner = self->_actionSpinner;
  self->_actionSpinner = v34;

  v36 = self->_actionSpinner;
  v37 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UIActivityIndicatorView *)v36 setColor:v37];

  [(UIActivityIndicatorView *)self->_actionSpinner setHidesWhenStopped:1];
  [(UIActivityIndicatorView *)self->_actionSpinner stopAnimating];
  [(PKPeerPaymentBubbleView *)self addSubview:self->_actionSpinner];
  uint64_t v38 = *MEMORY[0x1E4F85238];

  [(PKPeerPaymentBubbleView *)self setAccessibilityIdentifier:v38];
}

- (void)layoutSubviews
{
  v175.receiver = self;
  v175.super_class = (Class)PKPeerPaymentBubbleView;
  [(PKPeerPaymentBubbleView *)&v175 layoutSubviews];
  [(PKPeerPaymentBubbleView *)self bounds];
  p_contentInset = &self->_contentInset;
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v10 = v6 + left + 14.0;
  double v11 = v7 + top + 12.0;
  double v12 = v8 - (left + self->_contentInset.right) + -28.0;
  double v13 = v9 - (top + self->_contentInset.bottom) + -24.0;
  int v14 = [(PKPeerPaymentBubbleView *)self _shouldReverseLayoutDirection];
  [(PKPeerPaymentBubbleView *)self referenceBounds];
  double v15 = self->_contentInset.left;
  double v171 = v16 + v15;
  double v18 = self->_contentInset.top + v17;
  double v20 = v19 - (v15 + self->_contentInset.right);
  double v22 = v21 - (self->_contentInset.top + self->_contentInset.bottom);
  -[UILabel sizeThatFits:](self->_statusLabel, "sizeThatFits:", v12, v13);
  double v24 = v23;
  v176.origin.CGFloat x = v10;
  v176.origin.CGFloat y = v11;
  v176.size.width = v12;
  v176.size.height = v13;
  if (v24 >= CGRectGetHeight(v176))
  {
    v177.origin.CGFloat x = v10;
    v177.origin.CGFloat y = v11;
    v177.size.width = v12;
    v177.size.height = v13;
    double Height = CGRectGetHeight(v177);
  }
  else
  {
    -[UILabel sizeThatFits:](self->_statusLabel, "sizeThatFits:", v12, v13);
    double Height = v25;
  }
  double v170 = v20 + -28.0;
  double v172 = v171 + 14.0;
  double v168 = v18 + 12.0;
  double v169 = v22 + -24.0;
  v178.origin.CGFloat x = v10;
  v178.origin.CGFloat y = v11;
  v178.size.width = v12;
  v178.size.height = v13;
  double Width = CGRectGetWidth(v178);
  v179.origin.CGFloat x = v10;
  v179.origin.CGFloat y = v11;
  v179.size.width = v12;
  v179.size.height = v13;
  double MinX = CGRectGetMinX(v179);
  v180.origin.CGFloat x = v10;
  v180.origin.CGFloat y = v11;
  v180.size.width = v12;
  v180.size.height = v13;
  -[UILabel setFrame:](self->_statusLabel, "setFrame:", MinX, CGRectGetMaxY(v180) - Height + -1.0, Width, Height);
  -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v12, v13);
  double v30 = v29;
  v181.origin.CGFloat x = v10;
  v181.origin.CGFloat y = v11;
  v181.size.width = v12;
  v181.size.height = v13;
  CGFloat v31 = v10;
  if (v30 >= CGRectGetWidth(v181))
  {
    v182.origin.CGFloat x = v10;
    v182.origin.CGFloat y = v11;
    v182.size.width = v12;
    v182.size.height = v13;
    double v32 = CGRectGetWidth(v182);
  }
  else
  {
    -[PKContinuousButton sizeThatFits:](self->_actionButton, "sizeThatFits:", v12, v13);
  }
  double v33 = v32;
  v183.origin.CGFloat x = v10;
  v183.origin.CGFloat y = v11;
  v183.size.width = v12;
  v183.size.height = v13;
  double v34 = CGRectGetMinX(v183);
  v184.origin.CGFloat x = v10;
  v184.origin.CGFloat y = v11;
  v184.size.width = v12;
  v184.size.height = v13;
  double v35 = v34 + (CGRectGetWidth(v184) - v33) * 0.5;
  v185.size.width = v170;
  v185.origin.CGFloat x = v172;
  v185.origin.CGFloat y = v18 + 12.0;
  v185.size.height = v169;
  v36.n128_f64[0] = CGRectGetMaxY(v185) + -40.0;
  actionButton = self->_actionButton;
  v38.n128_u64[0] = 0x4044000000000000;
  v39.n128_f64[0] = v35;
  v40.n128_f64[0] = v33;
  PKRectRoundToPixel(v39, v36, v40, v38, v41);
  -[PKContinuousButton setFrame:](actionButton, "setFrame:");
  actionSpinner = self->_actionSpinner;
  [(PKContinuousButton *)self->_actionButton center];
  -[UIActivityIndicatorView setCenter:](actionSpinner, "setCenter:");
  applePayLogoImageView = self->_applePayLogoImageView;
  if (applePayLogoImageView)
  {
    -[UIImageView sizeThatFits:](applePayLogoImageView, "sizeThatFits:", v12, v13);
    double v45 = v44;
    double v47 = v46;
    double v48 = v10;
    double v49 = v11;
    double v50 = v12;
    double v51 = v13;
    if (v14) {
      double v52 = CGRectGetMaxX(*(CGRect *)&v48) - v45;
    }
    else {
      double v52 = CGRectGetMinX(*(CGRect *)&v48);
    }
    -[UIImageView setFrame:](self->_applePayLogoImageView, "setFrame:", v52, v11, v45, v47);
  }
  v53 = [(PKPeerPaymentBubbleView *)self _imageText];

  if (v53)
  {
    CGFloat v163 = v10;
    double v54 = v10;
    double v55 = v11;
    double v56 = v12;
    double v57 = v13;
    if (v14) {
      double v58 = CGRectGetMaxX(*(CGRect *)&v54) + -40.0;
    }
    else {
      double v58 = CGRectGetMinX(*(CGRect *)&v54);
    }
    uint64_t v61 = [(PKPeerPaymentBubbleView *)self _actionTitle];
    if (!v61) {
      goto LABEL_20;
    }
    v62 = (void *)v61;
    [(PKPeerPaymentBubbleView *)self bounds];
    CGFloat v64 = v63;
    CGFloat v66 = v65;
    CGFloat v68 = v67;
    CGFloat v70 = v69;
    [(PKPeerPaymentBubbleView *)self referenceBounds];
    v198.origin.CGFloat x = v71;
    v198.origin.CGFloat y = v72;
    v198.size.width = v73;
    v198.size.height = v74;
    v186.origin.CGFloat x = v64;
    v186.origin.CGFloat y = v66;
    v186.size.width = v68;
    v186.size.height = v70;
    BOOL v75 = CGRectEqualToRect(v186, v198);

    if (v75)
    {
      CGFloat v31 = v163;
      v187.origin.CGFloat x = v163;
      v187.origin.CGFloat y = v11;
      v187.size.width = v12;
      v187.size.height = v13;
      double MinY = CGRectGetMinY(v187);
      v188.origin.CGFloat x = v163;
      v188.origin.CGFloat y = v11;
      v188.size.width = v12;
      v188.size.height = v13;
      v77.n128_f64[0] = CGRectGetHeight(v188) + -40.0;
    }
    else
    {
LABEL_20:
      v189.origin.CGFloat x = v172;
      v189.origin.CGFloat y = v168;
      v189.size.width = v170;
      v189.size.height = v169;
      CGFloat v82 = CGRectGetMinY(v189);
      v190.origin.CGFloat x = v172;
      double MinY = v82;
      v190.origin.CGFloat y = v168;
      v190.size.width = v170;
      v190.size.height = v169;
      v77.n128_f64[0] = CGRectGetHeight(v190);
      CGFloat v31 = v163;
    }
    v78.n128_f64[0] = MinY + (v77.n128_f64[0] + -40.0) * 0.5;
    imageLabel = self->_imageLabel;
    v79.n128_u64[0] = 0x4044000000000000;
    v77.n128_f64[0] = v58;
    v80.n128_u64[0] = 0x4044000000000000;
    PKRectRoundToPixel(v77, v78, v79, v80, v81);
    -[UILabel setFrame:](imageLabel, "setFrame:");
    remainder.origin.CGFloat x = v31;
    remainder.origin.CGFloat y = v11;
    remainder.size.width = v12;
    remainder.size.height = v13;
    memset(&slice, 0, sizeof(slice));
    if (v14) {
      CGRectEdge v84 = CGRectMaxXEdge;
    }
    else {
      CGRectEdge v84 = CGRectMinXEdge;
    }
    v191.origin.CGFloat x = v31;
    v191.origin.CGFloat y = v11;
    v191.size.width = v12;
    v191.size.height = v13;
    CGRectDivide(v191, &slice, &remainder, 52.0, v84);
    double v59 = remainder.size.width;
    double v60 = remainder.size.height;
  }
  else
  {
    remainder.origin.CGFloat x = v10;
    remainder.origin.CGFloat y = v11;
    remainder.size.width = v12;
    remainder.size.height = v13;
    memset(&slice, 0, sizeof(slice));
    double v59 = v12;
    double v60 = v13;
  }
  -[UILabel pkui_sizeThatFits:](self->_messageLabel, "pkui_sizeThatFits:", v59, v60);
  double v86 = v85;
  double v88 = v87;
  -[UILabel pkui_sizeThatFits:](self->_secondaryMessageLabel, "pkui_sizeThatFits:", remainder.size.width, remainder.size.height);
  double v90 = v89;
  double v92 = v91;
  CGFloat x = remainder.origin.x;
  CGFloat y = remainder.origin.y;
  CGFloat v95 = remainder.size.width;
  CGFloat v96 = remainder.size.height;
  double v164 = v90;
  double v166 = v86;
  double v167 = v88;
  if (v53)
  {
    if (v14) {
      double v97 = CGRectGetMaxX(*(CGRect *)&x) - v86;
    }
    else {
      double v97 = CGRectGetMinX(*(CGRect *)&x);
    }
  }
  else
  {
    double v98 = CGRectGetMinX(*(CGRect *)&x);
    double v97 = v98 + (CGRectGetWidth(remainder) - v86) * 0.5 + -1.0;
  }
  double v165 = v97;
  uint64_t v99 = [(PKPeerPaymentBubbleView *)self _actionTitle];
  if (!v99) {
    goto LABEL_33;
  }
  v100 = (void *)v99;
  [(PKPeerPaymentBubbleView *)self bounds];
  CGFloat v102 = v101;
  CGFloat v162 = v13;
  CGFloat v103 = v12;
  CGFloat v104 = v11;
  CGFloat v105 = v31;
  CGFloat v107 = v106;
  double v108 = v92;
  CGFloat v110 = v109;
  CGFloat v112 = v111;
  [(PKPeerPaymentBubbleView *)self referenceBounds];
  v199.origin.CGFloat x = v113;
  v199.origin.CGFloat y = v114;
  v199.size.width = v115;
  v199.size.height = v116;
  v192.origin.CGFloat x = v102;
  v192.origin.CGFloat y = v107;
  v192.size.width = v110;
  double v92 = v108;
  v192.size.height = v112;
  BOOL v117 = CGRectEqualToRect(v192, v199);

  if (v117)
  {
    v193.origin.CGFloat x = v105;
    v193.origin.CGFloat y = v104;
    v193.size.width = v103;
    v193.size.height = v162;
    double v118 = CGRectGetMinY(v193);
    v194.origin.CGFloat x = v105;
    v194.origin.CGFloat y = v104;
    v194.size.width = v103;
    v194.size.height = v162;
    v119.n128_f64[0] = CGRectGetHeight(v194) + -40.0;
  }
  else
  {
LABEL_33:
    v195.origin.CGFloat x = v172;
    v195.origin.CGFloat y = v168;
    v195.size.width = v170;
    v195.size.height = v169;
    double v118 = CGRectGetMinY(v195);
    v196.origin.CGFloat x = v172;
    v196.origin.CGFloat y = v168;
    v196.size.width = v170;
    v196.size.height = v169;
    v119.n128_f64[0] = CGRectGetHeight(v196);
  }
  v121.n128_f64[0] = v166;
  double v124 = v118 + (v119.n128_f64[0] - v167 - v92) * 0.5;
  messageLabel = self->_messageLabel;
  v119.n128_f64[0] = v165;
  v120.n128_f64[0] = v124;
  v122.n128_f64[0] = v167;
  PKRectRoundToPixel(v119, v120, v121, v122, v123);
  -[UILabel setFrame:](messageLabel, "setFrame:");
  if (v53) {
    uint64_t v126 = 4;
  }
  else {
    uint64_t v126 = 1;
  }
  [(UILabel *)self->_messageLabel setTextAlignment:v126];
  double v127 = v167 + v124;
  CGFloat v128 = remainder.origin.x;
  CGFloat v129 = remainder.origin.y;
  CGFloat v130 = remainder.size.width;
  CGFloat v131 = remainder.size.height;
  if (v53)
  {
    if (v14)
    {
      v136.n128_f64[0] = CGRectGetMaxX(*(CGRect *)&v128);
      v135.n128_f64[0] = v164;
      v136.n128_f64[0] = v136.n128_f64[0] - v164;
    }
    else
    {
      v136.n128_f64[0] = CGRectGetMinX(*(CGRect *)&v128);
      v135.n128_f64[0] = v164;
    }
  }
  else
  {
    double v137 = CGRectGetMinX(*(CGRect *)&v128);
    v136.n128_f64[0] = CGRectGetWidth(remainder);
    v135.n128_f64[0] = v164;
    v136.n128_f64[0] = v137 + (v136.n128_f64[0] - v164) * 0.5 + -1.0;
  }
  secondaryMessageLabel = self->_secondaryMessageLabel;
  v132.n128_f64[0] = v127;
  v133.n128_f64[0] = v92;
  PKRectRoundToPixel(v136, v132, v135, v133, v134);
  -[UILabel setFrame:](secondaryMessageLabel, "setFrame:");
  [(UILabel *)self->_secondaryMessageLabel setTextAlignment:v126];
  [(PKPeerPaymentBubbleView *)self bounds];
  double v139 = self->_contentInset.left;
  double v142 = p_contentInset->top + v141;
  double v144 = v143 - (v139 + self->_contentInset.right);
  double v146 = v145 - (p_contentInset->top + self->_contentInset.bottom);
  double v147 = v140 + v139 + -1.0;
  [(id)objc_opt_class() referenceSize];
  if (v146 >= v148)
  {
    [(id)objc_opt_class() referenceSize];
    double v146 = v149;
  }
  -[PKPeerPayment3DTextView setFrame:](self->_renderView, "setFrame:", v147, v142, v144, v146);
  [(PKPeerPaymentBubbleView *)self bounds];
  double v150 = self->_contentInset.left;
  double v152 = v151 + v150;
  double v154 = p_contentInset->top + v153;
  double v156 = v155 - (v150 + self->_contentInset.right);
  double v158 = v157 - (self->_contentInset.top + self->_contentInset.bottom);
  v197.origin.CGFloat x = v151 + v150;
  v197.origin.CGFloat y = v154;
  v197.size.width = v156;
  v197.size.height = v158;
  if (!CGRectEqualToRect(v197, self->_lastBoundsForRoundedCornerLayout) && self->_hasRoundedCorners)
  {
    self->_lastBoundsForRoundedCornerLayout.origin.CGFloat x = v152;
    self->_lastBoundsForRoundedCornerLayout.origin.CGFloat y = v154;
    self->_lastBoundsForRoundedCornerLayout.size.width = v156;
    self->_lastBoundsForRoundedCornerLayout.size.height = v158;
    v159 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", v152, v154, v156, v158, 20.0);
    maskLayer = self->_maskLayer;
    id v161 = v159;
    -[CAShapeLayer setPath:](maskLayer, "setPath:", [v161 CGPath]);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = objc_opt_class();
  unint64_t state = self->_state;
  unint64_t action = self->_action;

  [v4 referenceSizeForState:state andAction:action];
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setState:(unint64_t)a3
{
}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3)
  {
    BOOL v4 = a4;
    self->_unint64_t state = a3;
    [(PKPeerPaymentBubbleView *)self _updateContent];
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __45__PKPeerPaymentBubbleView_setState_animated___block_invoke;
      v6[3] = &unk_1E59CA7D0;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v6 animations:0 completion:0.300000012];
    }
  }
}

void __45__PKPeerPaymentBubbleView_setState_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 displayIfNeeded];
}

- (void)setAction:(unint64_t)a3
{
}

- (void)setAction:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_action != a3)
  {
    BOOL v4 = a4;
    self->_unint64_t action = a3;
    [(PKPeerPaymentBubbleView *)self _updateContent];
    if (v4)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __46__PKPeerPaymentBubbleView_setAction_animated___block_invoke;
      v6[3] = &unk_1E59CA7D0;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] transitionWithView:self duration:5242880 options:v6 animations:0 completion:0.300000012];
    }
  }
}

void __46__PKPeerPaymentBubbleView_setAction_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 displayIfNeeded];
}

- (void)setAmount:(id)a3
{
  if (self->_amount != a3)
  {
    BOOL v4 = (NSDecimalNumber *)[a3 copy];
    amount = self->_amount;
    self->_amount = v4;

    [(PKPeerPaymentBubbleView *)self _updateContent];
  }
}

- (void)setCurrency:(id)a3
{
  if (self->_currency != a3)
  {
    BOOL v4 = (NSString *)[a3 copy];
    currencCGFloat y = self->_currency;
    self->_currencCGFloat y = v4;

    [(PKPeerPaymentBubbleView *)self _updateContent];
  }
}

- (void)setRecurringPaymentMemo:(id)a3
{
  unint64_t v5 = (PKPeerPaymentRecurringPaymentMemo *)a3;
  if (self->_recurringPaymentMemo != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_recurringPaymentMemo, a3);
    [(PKPeerPaymentBubbleView *)self _updateContent];
    unint64_t v5 = v6;
  }
}

- (void)setRecurringPaymentStartDate:(id)a3
{
  unint64_t v5 = (NSDate *)a3;
  if (self->_recurringPaymentStartDate != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_recurringPaymentStartDate, a3);
    [(PKPeerPaymentBubbleView *)self _updateContent];
    unint64_t v5 = v6;
  }
}

- (void)setRecurringPaymentFrequency:(unint64_t)a3
{
  if (self->_recurringPaymentFrequency != a3)
  {
    self->_recurringPaymentFrequencCGFloat y = a3;
    [(PKPeerPaymentBubbleView *)self _updateContent];
  }
}

- (void)setHasRoundedCorners:(BOOL)a3
{
  if (self->_hasRoundedCorners != a3)
  {
    self->_hasRoundedCorners = a3;
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_lastBoundsForRoundedCornerLayout.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_lastBoundsForRoundedCornerLayout.size = v4;
    if (a3)
    {
      unint64_t v5 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      maskLayer = self->_maskLayer;
      self->_maskLayer = v5;

      double v7 = [(PKPeerPaymentBubbleView *)self layer];
      double v8 = v7;
      double v9 = self->_maskLayer;
    }
    else
    {
      double v10 = self->_maskLayer;
      self->_maskLayer = 0;

      double v7 = [(PKPeerPaymentBubbleView *)self layer];
      double v8 = v7;
      double v9 = 0;
    }
    [v7 setMask:v9];

    [(PKPeerPaymentBubbleView *)self setNeedsLayout];
  }
}

- (void)setDisplaysApplePayLogo:(BOOL)a3
{
  if (self->_displaysApplePayLogo != a3)
  {
    self->_displaysApplePayLogo = a3;
    if (a3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
      unint64_t v5 = [(id)objc_opt_class() applePayLogo];
      double v6 = (UIImageView *)[v4 initWithImage:v5];
      applePayLogoImageView = self->_applePayLogoImageView;
      self->_applePayLogoImageView = v6;

      [(UIImageView *)self->_applePayLogoImageView setContentMode:4];
      [(PKPeerPaymentBubbleView *)self addSubview:self->_applePayLogoImageView];
    }
    else
    {
      [(UIImageView *)self->_applePayLogoImageView removeFromSuperview];
      double v8 = self->_applePayLogoImageView;
      self->_applePayLogoImageView = 0;
    }
    [(PKPeerPaymentBubbleView *)self setNeedsLayout];
  }
}

- (void)setLiveRenderingEnabled:(BOOL)a3
{
  if (self->_liveRenderingEnabled != a3)
  {
    self->_liveRenderingEnabled = a3;
    [(PKPeerPaymentBubbleView *)self _updateContent];
  }
}

- (void)setShowsActionSpinner:(BOOL)a3
{
  if (self->_showsActionSpinner != a3)
  {
    self->_showsActionSpinner = a3;
    [(PKPeerPaymentBubbleView *)self _updateContent];
  }
}

- (CGRect)referenceBounds
{
  [(PKPeerPaymentBubbleView *)self referenceSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.CGFloat y = v7;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGSize)referenceSize
{
  double v3 = objc_opt_class();
  unint64_t state = self->_state;
  unint64_t action = self->_action;

  [v3 referenceSizeForState:state andAction:action];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setTestTransition:(BOOL)a3
{
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__PKPeerPaymentBubbleView_setTestTransition___block_invoke;
    v7[3] = &unk_1E59D3980;
    v7[4] = self;
    double v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v7 block:2.0];
    testTimer = self->_testTimer;
    self->_testTimer = v4;
  }
  else
  {
    [(NSTimer *)self->_testTimer invalidate];
    double v6 = self->_testTimer;
    self->_testTimer = 0;
  }
}

uint64_t __45__PKPeerPaymentBubbleView_setTestTransition___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] == 5) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 5;
  }
  double v3 = *(void **)(a1 + 32);

  return [v3 setState:v2 animated:1];
}

- (void)_updateContent
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  double v3 = [(PKPeerPaymentBubbleView *)self _backgroundColor];
  [(PKPeerPaymentBubbleView *)self setBackgroundColor:v3];

  uint64_t v4 = [(PKPeerPaymentBubbleView *)self _messageText];
  double v5 = (void *)v4;
  double v6 = &stru_1EF1B5B50;
  if (v4) {
    double v6 = (__CFString *)v4;
  }
  double v7 = v6;

  double v8 = [(PKPeerPaymentBubbleView *)self _secondaryMessageText];
  double v9 = [(PKPeerPaymentBubbleView *)self _imageText];
  if (!self->_liveRenderingEnabled) {
    goto LABEL_19;
  }
  double v10 = [(PKPeerPaymentBubbleView *)self window];
  double v11 = v10;
  if (!v10 && !self->_snapshotInProgress && !self->_usedForSnapshotting || self->_state != 5)
  {

    goto LABEL_19;
  }
  uint64_t v12 = [(__CFString *)v7 length];

  if (!v12)
  {
LABEL_19:
    renderView = self->_renderView;
    if (!renderView)
    {
LABEL_22:
      int v20 = 0;
      goto LABEL_23;
    }
    [(PKPeerPayment3DTextView *)renderView removeFromSuperview];
    double v22 = self->_renderView;
    self->_renderView = 0;
LABEL_21:

    goto LABEL_22;
  }
  double v13 = self->_renderView;
  if (!v13)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F88148]);
    [(PKPeerPaymentBubbleView *)self bounds];
    double v15 = (PKPeerPayment3DTextView *)objc_msgSend(v14, "initWithFrame:renderStyle:usedForSnapshotting:", 0, self->_usedForSnapshotting);
    double v16 = self->_renderView;
    self->_renderView = v15;

    [(PKPeerPaymentBubbleView *)self insertSubview:self->_renderView atIndex:0];
    double v13 = self->_renderView;
  }
  if (([(PKPeerPayment3DTextView *)v13 setText:v7] & 1) == 0)
  {
    double v45 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 138412290;
      double v47 = (PKPeerPaymentBubbleView *)v7;
      _os_log_impl(&dword_19F450000, v45, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView: Render View unable to display text: '%@'. Falling back to regular label.", (uint8_t *)&v46, 0xCu);
    }

    [(PKPeerPayment3DTextView *)self->_renderView removeFromSuperview];
    double v22 = self->_renderView;
    self->_renderView = 0;
    goto LABEL_21;
  }
  if (self->_renderViewRemovedByLossOfWindow || self->_usedForSnapshotting)
  {
    double v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 134217984;
      double v47 = self;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView %p: Bubble views render view had been removed due to loss of window. Recreated render view.", (uint8_t *)&v46, 0xCu);
    }

    double v18 = self->_renderView;
    uint64_t v19 = 0;
  }
  else
  {
    double v18 = self->_renderView;
    uint64_t v19 = 1;
  }
  [(PKPeerPayment3DTextView *)v18 setMotionEffectEnabled:1 animated:v19];
  self->_renderViewRemovedByLossOfWindow = 0;
  int v20 = 1;
LABEL_23:
  if (self->_state == 11)
  {
    [(UILabel *)self->_messageLabel setNumberOfLines:2];
    [(UILabel *)self->_messageLabel setAdjustsFontSizeToFitWidth:0];
    [(UILabel *)self->_secondaryMessageLabel setNumberOfLines:2];
    [(UILabel *)self->_secondaryMessageLabel setAdjustsFontSizeToFitWidth:0];
  }
  messageLabel = self->_messageLabel;
  if (v20)
  {
    [(UILabel *)messageLabel setHidden:1];
    [(UILabel *)self->_secondaryMessageLabel setHidden:1];
    [(UILabel *)self->_imageLabel setHidden:1];
  }
  else
  {
    [(UILabel *)messageLabel setHidden:0];
    id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v25 = [(PKPeerPaymentBubbleView *)self _messageTextAttributes];
    v26 = (void *)[v24 initWithString:v7 attributes:v25];

    [(UILabel *)self->_messageLabel setAttributedText:v26];
    v27 = self->_messageLabel;
    [(PKPeerPaymentBubbleView *)self _messageAlpha];
    -[UILabel setAlpha:](v27, "setAlpha:");

    if (v8)
    {
      [(UILabel *)self->_secondaryMessageLabel setHidden:0];
      id v28 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v29 = [(PKPeerPaymentBubbleView *)self _secondaryMessageTextAttributes];
      double v30 = (void *)[v28 initWithString:v8 attributes:v29];

      [(UILabel *)self->_secondaryMessageLabel setAttributedText:v30];
    }
    if (v9)
    {
      [(UILabel *)self->_imageLabel setHidden:0];
      id v31 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v32 = [(PKPeerPaymentBubbleView *)self _imageTextAttributes];
      double v33 = (void *)[v31 initWithString:v9 attributes:v32];

      [(UILabel *)self->_imageLabel setAttributedText:v33];
      imageLabel = self->_imageLabel;
      double v35 = [(PKPeerPaymentBubbleView *)self _imageLabelBackgroundColor];
      [(UILabel *)imageLabel setBackgroundColor:v35];
    }
  }
  __n128 v36 = [(PKPeerPaymentBubbleView *)self _statusText];
  uint64_t v37 = [v36 length];
  statusLabel = self->_statusLabel;
  if (v37)
  {
    [(UILabel *)statusLabel setHidden:0];
    [(UILabel *)self->_statusLabel setText:v36];
    __n128 v39 = self->_statusLabel;
    [(PKPeerPaymentBubbleView *)self _statusAlpha];
    -[UILabel setAlpha:](v39, "setAlpha:");
  }
  else
  {
    [(UILabel *)statusLabel setHidden:1];
    [(UILabel *)self->_statusLabel setText:&stru_1EF1B5B50];
  }
  __n128 v40 = [(PKPeerPaymentBubbleView *)self _actionTitle];
  actionButton = self->_actionButton;
  if (v40)
  {
    [(PKContinuousButton *)actionButton setTitle:v40 forState:0];
    actionSpinner = self->_actionSpinner;
    if (self->_showsActionSpinner)
    {
      [(UIActivityIndicatorView *)actionSpinner startAnimating];
      v43 = self->_actionButton;
      double v44 = 0.0;
    }
    else
    {
      [(UIActivityIndicatorView *)actionSpinner stopAnimating];
      v43 = self->_actionButton;
      double v44 = 1.0;
    }
    [(PKContinuousButton *)v43 setAlpha:v44];
  }
  else
  {
    [(PKContinuousButton *)actionButton setAlpha:0.0];
    [(PKContinuousButton *)self->_actionButton setTitle:&stru_1EF1B5B50 forState:0];
    [(UIActivityIndicatorView *)self->_actionSpinner stopAnimating];
  }
  [(PKPeerPaymentBubbleView *)self setNeedsLayout];
}

- (id)_backgroundColor
{
  double v3 = objc_opt_class();
  unint64_t state = self->_state;

  return (id)[v3 referenceWatchBackgroundColorForState:state];
}

- (id)_imageLabelBackgroundColor
{
  uint64_t v2 = [(PKPeerPaymentRecurringPaymentMemo *)self->_recurringPaymentMemo color];

  return PKPeerPaymentMessageColorFromSemanticColor(v2);
}

- (double)_messageAlpha
{
  double result = 0.2;
  if (self->_state - 6 >= 5) {
    return 1.0;
  }
  return result;
}

- (double)_statusAlpha
{
  double result = 1.0;
  if (self->_state == 11) {
    return 0.5;
  }
  return result;
}

- (id)_messageText
{
  if (self->_amount && self->_currency)
  {
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4F84610]) initWithAmount:self->_amount currency:self->_currency exponent:0];
    uint64_t v4 = v3;
    unint64_t state = self->_state;
    if (state == 11)
    {
      uint64_t v8 = [v3 minimalFormattedStringValue];
      double v6 = (void *)v8;
      switch(self->_recurringPaymentFrequency)
      {
        case 1uLL:
          PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_3.isa, &stru_1EF1B4C70.isa, v8);
          goto LABEL_14;
        case 2uLL:
          PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_4.isa, &stru_1EF1B4C70.isa, v8);
          goto LABEL_14;
        case 3uLL:
          PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_5.isa, &stru_1EF1B4C70.isa, v8);
          goto LABEL_14;
        case 4uLL:
          PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_6.isa, &stru_1EF1B4C70.isa, v8);
          goto LABEL_14;
        default:
          double v7 = 0;
          break;
      }
    }
    else
    {
      if (state == 1)
      {
        double v6 = [v3 minimalFormattedStringValue];
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentBub.isa, &stru_1EF1B4C70.isa, v6);
      }
      else
      {
        double v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US"];
        [v4 minimalFormattedStringValueInLocale:v6];
      }
      double v7 = LABEL_14:;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_secondaryMessageText
{
  if (self->_state == 11)
  {
    uint64_t v2 = [(PKPeerPaymentRecurringPaymentMemo *)self->_recurringPaymentMemo text];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_imageText
{
  if (self->_state == 11)
  {
    uint64_t v2 = [(PKPeerPaymentRecurringPaymentMemo *)self->_recurringPaymentMemo emoji];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_messageTextAttributes
{
  double v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  unint64_t state = self->_state;
  if (state == 11)
  {
    uint64_t v6 = *MEMORY[0x1E4FB28D8];
    double v7 = (double *)MEMORY[0x1E4FB09E0];
    goto LABEL_5;
  }
  if (state == 1)
  {
    uint64_t v6 = *MEMORY[0x1E4FB28C8];
    double v7 = (double *)MEMORY[0x1E4FB09D8];
LABEL_5:
    uint64_t v8 = PKDefaultSystemFontWithPreferredSizeForTextStyleAndWeight(v6, *v7);
    goto LABEL_7;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "pk_peerPaymentChiseledCashFontOfSize:", 69.0);
LABEL_7:
  double v9 = (void *)v8;
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  double v10 = (void *)[v3 copy];

  return v10;
}

- (id)_secondaryMessageTextAttributes
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  double v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  uint64_t v4 = PKDefaultSystemFontWithPreferredSizeForTextStyleAndWeight(*MEMORY[0x1E4FB28D8], *MEMORY[0x1E4FB09D8]);
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  double v5 = (void *)[v2 copy];

  return v5;
}

- (id)_imageTextAttributes
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  double v3 = PKDefaultSystemFontOfSizeAndWeight(24.0, *MEMORY[0x1E4FB09D8]);
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  uint64_t v4 = (void *)[v2 copy];

  return v4;
}

- (id)_statusText
{
  if (self->_action)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    switch(self->_state)
    {
      case 4uLL:
        uint64_t v4 = @"PEER_PAYMENT_BUBBLE_STATUS_PENDING";
        goto LABEL_9;
      case 6uLL:
        uint64_t v4 = @"PEER_PAYMENT_BUBBLE_STATUS_EXPIRED";
        goto LABEL_9;
      case 7uLL:
        uint64_t v4 = @"PEER_PAYMENT_BUBBLE_STATUS_REJECTED";
        goto LABEL_9;
      case 8uLL:
        uint64_t v4 = @"PEER_PAYMENT_BUBBLE_STATUS_CANCELED";
        goto LABEL_9;
      case 9uLL:
        uint64_t v4 = @"PEER_PAYMENT_BUBBLE_STATUS_INVALID";
LABEL_9:
        uint64_t v5 = PKLocalizedPeerPaymentString(&v4->isa);
        goto LABEL_10;
      case 0xBuLL:
        double v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
        int v8 = [v7 isDateInToday:self->_recurringPaymentStartDate];

        if (v8)
        {
          uint64_t v5 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_7.isa);
LABEL_10:
          uint64_t v2 = (void *)v5;
        }
        else
        {
          double v9 = PKMediumDateString();
          uint64_t v2 = PKLocalizedPeerPaymentRecurringString(&cfstr_RecurringPayme_8.isa, &stru_1EF1B4C70.isa, v9);
        }
        break;
      default:
        break;
    }
  }

  return v2;
}

- (id)_actionTitle
{
  unint64_t action = self->_action;
  if (action == 2)
  {
    if (self->_state == 4)
    {
      double v3 = @"PEER_PAYMENT_BUBBLE_ACTION_ACCEPT";
      goto LABEL_7;
    }
  }
  else if (action == 1 && self->_state == 1)
  {
    double v3 = @"PEER_PAYMENT_BUBBLE_ACTION_PAY";
LABEL_7:
    uint64_t v4 = PKLocalizedPeerPaymentString(&v3->isa);
    goto LABEL_9;
  }
  uint64_t v4 = 0;
LABEL_9:

  return v4;
}

- (void)_actionButtonTapped:(id)a3
{
  id v4 = a3;
  actionHandler = (void (**)(id, PKPeerPaymentBubbleView *, unint64_t))self->_actionHandler;
  if (actionHandler)
  {
    actionHandler[2](actionHandler, self, self->_action);
  }
  else
  {
    uint64_t v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView: Unable to perform action. No action handler specified.", v7, 2u);
    }
  }
}

- (void)updateWithPeerPaymentStatus:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = 0;
  uint64_t v7 = 4;
  switch(a3)
  {
    case -1:
      char v6 = 0;
      uint64_t v7 = 10;
      break;
    case 0:
      break;
    case 1:
      char v6 = 0;
      uint64_t v7 = 5;
      break;
    case 4:
      char v6 = 0;
      uint64_t v7 = 9;
      break;
    case 5:
      char v6 = 0;
      uint64_t v7 = 8;
      break;
    case 6:
      char v6 = 0;
      uint64_t v7 = 7;
      break;
    case 7:
      char v6 = 0;
      uint64_t v7 = 6;
      break;
    default:
      uint64_t v7 = 0;
      char v6 = 1;
      break;
  }
  if (v7 != self->_state)
  {
    [(PKPeerPaymentBubbleView *)self setAction:0];
    if ((v6 & 1) == 0)
    {
      [(PKPeerPaymentBubbleView *)self setState:v7 animated:v4];
    }
  }
}

- (void)updateWithPeerPaymentStatusResponse:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v12 = v6;
    -[PKPeerPaymentBubbleView updateWithPeerPaymentStatus:animated:](self, "updateWithPeerPaymentStatus:animated:", [v6 status], v4);
    int v8 = [v12 actions];
    int v9 = [v8 containsObject:*MEMORY[0x1E4F87C38]];

    uint64_t v10 = v9 ? 2 : 0;
    [(PKPeerPaymentBubbleView *)self setAction:v10 animated:v4];
    char v11 = [v12 amountHashIsValidForAmount:self->_amount andCurrency:self->_currency];
    uint64_t v7 = v12;
    if ((v11 & 1) == 0)
    {
      [(PKPeerPaymentBubbleView *)self setState:9 animated:v4];
      uint64_t v7 = v12;
    }
  }
}

- (void)updateWithPaymentTransaction:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v12 = v6;
    uint64_t v7 = [v6 currencyCode];
    int v8 = [v12 amount];
    if ([v12 transactionType] == 3)
    {
      int v9 = [v12 subtotalAmount];

      if (v9)
      {
        uint64_t v10 = [v12 subtotalAmount];

        int v8 = (void *)v10;
      }
    }
    if (v7 && v8)
    {
      [(PKPeerPaymentBubbleView *)self setAmount:v8];
      [(PKPeerPaymentBubbleView *)self setCurrency:v7];
    }
    uint64_t v11 = [v12 peerPaymentStatus];
    if (v11 != -1) {
      [(PKPeerPaymentBubbleView *)self updateWithPeerPaymentStatus:v11 animated:v4];
    }

    id v6 = v12;
  }
}

- (void)updateWithPeerPaymentMessage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v20 = v6;
    int v7 = [v6 isFromMe];
    int v8 = (void *)MEMORY[0x1E4F859B8];
    if (!v7) {
      int v8 = (void *)MEMORY[0x1E4F858B8];
    }
    int v9 = [NSString stringWithFormat:@"%@-%@", *MEMORY[0x1E4F85238], *v8];
    [(PKPeerPaymentBubbleView *)self setAccessibilityIdentifier:v9];
    uint64_t v10 = [v20 amount];
    [(PKPeerPaymentBubbleView *)self setAmount:v10];

    uint64_t v11 = [v20 currency];
    [(PKPeerPaymentBubbleView *)self setCurrency:v11];

    uint64_t v12 = [v20 type];
    if (v12 != 1)
    {
      if (v12 == 3)
      {
        [(PKPeerPaymentBubbleView *)self setState:11 animated:v4];
        double v18 = [v20 recurringPaymentMemo];
        [(PKPeerPaymentBubbleView *)self setRecurringPaymentMemo:v18];

        uint64_t v19 = [v20 recurringPaymentStartDate];
        [(PKPeerPaymentBubbleView *)self setRecurringPaymentStartDate:v19];

        -[PKPeerPaymentBubbleView setRecurringPaymentFrequency:](self, "setRecurringPaymentFrequency:", [v20 recurringPaymentFrequency]);
      }
      else if (v12 == 2)
      {
        double v13 = self;
        uint64_t v14 = 1;
LABEL_15:
        [(PKPeerPaymentBubbleView *)v13 setState:v14 animated:v4];
      }

      id v6 = v20;
      goto LABEL_17;
    }
    if ([v20 hasBeenSent])
    {
      uint64_t v15 = [v20 transactionIdentifier];
      if (v15
        && (double v16 = (void *)v15,
            [v20 paymentIdentifier],
            double v17 = objc_claimAutoreleasedReturnValue(),
            v17,
            v16,
            v17))
      {
        double v13 = self;
        uint64_t v14 = 3;
      }
      else
      {
        double v13 = self;
        uint64_t v14 = 9;
      }
    }
    else
    {
      double v13 = self;
      uint64_t v14 = 2;
    }
    goto LABEL_15;
  }
LABEL_17:
}

- (id)generatedSnapshot
{
  self->_snapshotInProgress = 1;
  [(PKPeerPaymentBubbleView *)self _updateContent];
  uint64_t v3 = [(PKContinuousButton *)self->_actionButton isEnabled];
  [(PKContinuousButton *)self->_actionButton setEnabled:0];
  uint64_t v4 = [(UILabel *)self->_statusLabel isHidden];
  if (self->_state - 3 < 2) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  [(UILabel *)self->_statusLabel setHidden:v5];
  [(PKPeerPaymentBubbleView *)self setNeedsLayout];
  [(PKPeerPaymentBubbleView *)self layoutIfNeeded];
  [(PKPeerPaymentBubbleView *)self bounds];
  v13.width = v6;
  v13.height = v7;
  UIGraphicsBeginImageContextWithOptions(v13, 1, 0.0);
  int v8 = [(PKPeerPaymentBubbleView *)self layer];
  [v8 renderInContext:UIGraphicsGetCurrentContext()];

  int v9 = [(PKPeerPayment3DTextView *)self->_renderView generatedSnapshot];
  [(PKPeerPayment3DTextView *)self->_renderView frame];
  objc_msgSend(v9, "drawInRect:");

  uint64_t v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [(PKContinuousButton *)self->_actionButton setEnabled:v3];
  [(UILabel *)self->_statusLabel setHidden:v4];
  self->_snapshotInProgress = 0;
  [(PKPeerPaymentBubbleView *)self _updateContent];

  return v10;
}

+ (id)generatedSnapshotForDataURL:(id)a3 contentInset:(UIEdgeInsets)a4 isFromMe:(BOOL)a5
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v10 = a3;
  if (!v10)
  {
    double v25 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = PKProtobufForDataURL();
  uint64_t v12 = PKPeerPaymentMessageCurrencyAmountFromProtobuf();
  CGSize v13 = v12;
  if (v12)
  {
    uint64_t v14 = [v12 currency];
    if (v14)
    {
      id v15 = (id)v14;
      double v16 = [v13 currency];
      if ([v16 length] != 3
        || ([v13 amount], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        double v25 = 0;
LABEL_15:

        goto LABEL_16;
      }
      double v18 = (void *)v17;
      uint64_t v19 = [v13 amount];
      id v20 = [MEMORY[0x1E4F28C28] zero];
      uint64_t v21 = [v19 compare:v20];

      if (v21 == 1)
      {
        id v15 = [[PKPeerPaymentBubbleView alloc] initForSnapshotting];
        [v15 setDisplaysApplePayLogo:1];
        objc_msgSend(v15, "setContentInset:", top, left, bottom, right);
        double v22 = [v13 currency];
        [v15 setCurrency:v22];

        double v23 = [v13 amount];
        [v15 setAmount:v23];

        [v15 setLiveRenderingEnabled:1];
        uint64_t v24 = PKPeerPaymentMessageTypeFromProtobuf();
        switch(v24)
        {
          case 1:
            [v15 setState:5 animated:0];
            break;
          case 3:
            [v15 setState:11 animated:0];
            [v15 setRecurringPaymentFrequency:PKPeerPaymentMessageRecurringPaymentFrequencyFromProtobuf()];
            v27 = PKPeerPaymentMessageRecurringPaymentStartDateFromProtobuf();
            [v15 setRecurringPaymentStartDate:v27];

            id v28 = PKPeerPaymentMessageMemoFromDataURL();
            double v29 = PKPeerPaymentMessageRecurringPaymentEmojiFromProtobuf();
            uint64_t v30 = PKPeerPaymentMessageRecurringPaymentColorFromProtobuf();
            uint64_t v31 = v30;
            if (v28 || v29 && v30)
            {
              id v32 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
              [v32 setText:v28];
              [v32 setEmoji:v29];
              [v32 setColor:v31];
              [v15 setRecurringPaymentMemo:v32];
            }
            break;
          case 2:
            [v15 setState:1 animated:0];
            if (!a5) {
              [v15 setAction:1 animated:0];
            }
            break;
        }
        [v15 sizeToFit];
        double v25 = [v15 generatedSnapshot];
        goto LABEL_15;
      }
    }
  }
  double v25 = 0;
LABEL_16:

LABEL_17:

  return v25;
}

- (void)performPostRender:(id)a3
{
  id v4 = a3;
  renderView = self->_renderView;
  if (renderView)
  {
    [(PKPeerPayment3DTextView *)renderView performPostRender:v4];
  }
  else
  {
    [(PKPeerPaymentBubbleView *)self setNeedsDisplay];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PKPeerPaymentBubbleView_performPostRender___block_invoke;
    block[3] = &unk_1E59CAA98;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __45__PKPeerPaymentBubbleView_performPostRender___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)PKPeerPaymentBubbleView;
  [(PKPeerPaymentBubbleView *)&v7 didMoveToWindow];
  uint64_t v3 = [(PKPeerPaymentBubbleView *)self window];

  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 3000000000);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke_2;
    v5[3] = &unk_1E59CA7D0;
    v5[4] = self;
    dispatch_after(v4, MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContent];
}

uint64_t __42__PKPeerPaymentBubbleView_didMoveToWindow__block_invoke_2(uint64_t result)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 408))
  {
    uint64_t v2 = result;
    uint64_t v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 134217984;
      uint64_t v5 = v1;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPeerPaymentBubbleView %p: Bubble view no longer has a window and we have a render view. Discarding render view.", (uint8_t *)&v4, 0xCu);
    }

    *(unsigned char *)(*(void *)(v2 + 32) + 416) = 1;
    return [*(id *)(v2 + 32) _updateContent];
  }
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)currency
{
  return self->_currency;
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

- (BOOL)testTransition
{
  return self->_testTransition;
}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  return self->_recurringPaymentMemo;
}

- (NSDate)recurringPaymentStartDate
{
  return self->_recurringPaymentStartDate;
}

- (unint64_t)recurringPaymentFrequency
{
  return self->_recurringPaymentFrequency;
}

- (unint64_t)action
{
  return self->_action;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)showsActionSpinner
{
  return self->_showsActionSpinner;
}

- (PKContinuousButton)actionButton
{
  return self->_actionButton;
}

- (BOOL)hasRoundedCorners
{
  return self->_hasRoundedCorners;
}

- (BOOL)usesWatchColors
{
  return self->_usesWatchColors;
}

- (void)setUsesWatchColors:(BOOL)a3
{
  self->_usesWatchColors = a3;
}

- (BOOL)displaysApplePayLogo
{
  return self->_displaysApplePayLogo;
}

- (BOOL)isLiveRenderingEnabled
{
  return self->_liveRenderingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_recurringPaymentStartDate, 0);
  objc_storeStrong((id *)&self->_recurringPaymentMemo, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_testTimer, 0);
  objc_storeStrong((id *)&self->_applePayLogoImageView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_actionSpinner, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_imageLabel, 0);
  objc_storeStrong((id *)&self->_secondaryMessageLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);

  objc_storeStrong((id *)&self->_renderView, 0);
}

- (id)interactiveViews
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(PKPeerPaymentBubbleView *)self actionButton];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

@end
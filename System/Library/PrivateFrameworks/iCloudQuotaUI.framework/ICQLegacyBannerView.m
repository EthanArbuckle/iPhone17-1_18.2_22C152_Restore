@interface ICQLegacyBannerView
+ (id)replaceWordsIn:(id)a3 with:(id)a4;
- (BOOL)_performActionWithICQLink:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (ICQLegacyBannerView)initWithFrame:(CGRect)a3;
- (ICQLegacyBannerView)initWithOffer:(id)a3;
- (ICQLegacyBannerViewDelegate)delegate;
- (ICQOffer)offer;
- (ICQUpgradeFlowOptions)flowOptions;
- (NSArray)activeConstraints;
- (NSDirectionalEdgeInsets)textMargins;
- (UIColor)detailMessageColor;
- (UIColor)linkMessageColor;
- (UIColor)linkTextColor;
- (UIColor)textColor;
- (UIColor)titleColor;
- (UIFont)detailMessageFont;
- (UIFont)font;
- (UIFont)linkMessageFont;
- (UIFont)linkTextFont;
- (UIFont)titleFont;
- (_ICQTextView)textView;
- (double)textLineSpacing;
- (id)_getOffer;
- (id)_initWithFrame:(CGRect)a3 offer:(id)a4;
- (id)attributedText;
- (id)detailAttributedText;
- (id)detailMessageAttributes;
- (id)linkAttributes;
- (id)messageAttributes;
- (id)textParagraphStyle;
- (id)textParagraphStyleAttributes;
- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (id)titleAttributes;
- (int64_t)semanticContentAttribute;
- (int64_t)textAlignment;
- (int64_t)userInterfaceLayoutDirection;
- (void)_applyTextParagraphAttributes;
- (void)_applyTextStorageAttributes;
- (void)_configureManageStorageButtonWithICQLink:(id)a3;
- (void)_updateBannerViewConstraints;
- (void)setActiveConstraints:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailMessageColor:(id)a3;
- (void)setDetailMessageFont:(id)a3;
- (void)setFlowOptions:(id)a3;
- (void)setFont:(id)a3;
- (void)setLinkMessageColor:(id)a3;
- (void)setLinkMessageFont:(id)a3;
- (void)setLinkTextColor:(id)a3;
- (void)setLinkTextFont:(id)a3;
- (void)setOffer:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLineSpacing:(double)a3;
- (void)setTextMargins:(NSDirectionalEdgeInsets)a3;
- (void)setTitleColor:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)updateBannerView;
- (void)updateConstraints;
@end

@implementation ICQLegacyBannerView

- (ICQLegacyBannerView)initWithFrame:(CGRect)a3
{
  v3 = -[ICQLegacyBannerView _initWithFrame:offer:](self, "_initWithFrame:offer:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(ICQLegacyBannerView *)v3 _getOffer];
    [(ICQLegacyBannerView *)v4 setOffer:v5];
  }
  return v4;
}

- (ICQLegacyBannerView)initWithOffer:(id)a3
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = -[ICQLegacyBannerView _initWithFrame:offer:](self, "_initWithFrame:offer:", v4, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "initializing Freshmint Banner View", buf, 2u);
    }

    [v5 setOffer:v4];
    v7 = [v5 offer];
    v8 = [v7 bannerSpecification];

    if ([v8 isDetailBannerInfoAvailable])
    {
      v9 = [v5 offer];
      v10 = [v9 bundleIdentifier];
      int v11 = [v10 isEqualToString:@"com.apple.mobileslideshow"];

      if (v11)
      {
        v12 = [v5 layer];
        [v12 setCornerRadius:14.0];

        uint64_t v13 = [MEMORY[0x263F825C8] labelColor];
        v14 = (void *)*((void *)v5 + 58);
        *((void *)v5 + 58) = v13;

        uint64_t v15 = [MEMORY[0x263F825C8] secondaryLabelColor];
        v16 = (void *)*((void *)v5 + 59);
        *((void *)v5 + 59) = v15;

        uint64_t v17 = [MEMORY[0x263F825C8] systemBlueColor];
        v18 = (void *)*((void *)v5 + 65);
        *((void *)v5 + 65) = v17;

        v19 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0]];
        uint64_t v47 = *MEMORY[0x263F817A0];
        uint64_t v45 = *MEMORY[0x263F81850];
        v20 = [NSNumber numberWithDouble:*MEMORY[0x263F81840]];
        v46 = v20;
        v21 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        v48[0] = v21;
        v22 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];
        v23 = [v19 fontDescriptorByAddingAttributes:v22];

        v24 = [MEMORY[0x263F81708] fontWithDescriptor:v19 size:0.0];
        v25 = [MEMORY[0x263F81708] fontWithDescriptor:v23 size:0.0];
        v26 = [MEMORY[0x263F82770] defaultMetrics];
        uint64_t v27 = [v26 scaledFontForFont:v25];
        v28 = (void *)*((void *)v5 + 55);
        *((void *)v5 + 55) = v27;

        v29 = [MEMORY[0x263F82770] defaultMetrics];
        uint64_t v30 = [v29 scaledFontForFont:v24];
        v31 = (void *)*((void *)v5 + 56);
        *((void *)v5 + 56) = v30;

        v32 = [MEMORY[0x263F82770] defaultMetrics];
        uint64_t v33 = [v32 scaledFontForFont:v24];
        v34 = (void *)*((void *)v5 + 57);
        *((void *)v5 + 57) = v33;

        *((void *)v5 + 63) = 0x4000000000000000;
        __asm { FMOV            V0.2D, #12.0 }
        *(_OWORD *)(v5 + 552) = _Q0;
        *(_OWORD *)(v5 + 568) = _Q0;
        if ([MEMORY[0x263F08B88] isMainThread])
        {
          [v5 updateBannerView];
        }
        else
        {
          v40 = _ICQGetLogSystem();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            -[ICQLegacyBannerView initWithOffer:](v40);
          }

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __37__ICQLegacyBannerView_initWithOffer___block_invoke;
          block[3] = &unk_264921C80;
          v43 = v5;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
    }
  }
  return (ICQLegacyBannerView *)v5;
}

uint64_t __37__ICQLegacyBannerView_initWithOffer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBannerView];
}

- (id)_initWithFrame:(CGRect)a3 offer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v44.receiver = self;
  v44.super_class = (Class)ICQLegacyBannerView;
  v10 = -[ICQLegacyBannerView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    int v11 = [MEMORY[0x263F825C8] clearColor];
    [(ICQLegacyBannerView *)v10 setBackgroundColor:v11];

    double v12 = *MEMORY[0x263F81838];
    uint64_t v13 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
    font = v10->_font;
    v10->_font = (UIFont *)v13;

    uint64_t v15 = [MEMORY[0x263F82770] defaultMetrics];
    v16 = [MEMORY[0x263F81708] systemFontOfSize:15.0 weight:*MEMORY[0x263F81828]];
    uint64_t v17 = [v15 scaledFontForFont:v16];
    titleFont = v10->_titleFont;
    v10->_titleFont = (UIFont *)v17;

    v19 = [MEMORY[0x263F82770] defaultMetrics];
    v20 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:v12];
    uint64_t v21 = [v19 scaledFontForFont:v20];
    detailMessageFont = v10->_detailMessageFont;
    v10->_detailMessageFont = (UIFont *)v21;

    v23 = [MEMORY[0x263F82770] defaultMetrics];
    v24 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:v12];
    uint64_t v25 = [v23 scaledFontForFont:v24];
    linkMessageFont = v10->_linkMessageFont;
    v10->_linkMessageFont = (UIFont *)v25;

    uint64_t v27 = [MEMORY[0x263F825C8] systemRedColor];
    titleColor = v10->_titleColor;
    v10->_titleColor = (UIColor *)v27;

    uint64_t v29 = [MEMORY[0x263F825C8] labelColor];
    detailMessageColor = v10->_detailMessageColor;
    v10->_detailMessageColor = (UIColor *)v29;

    uint64_t v31 = [MEMORY[0x263F825C8] labelColor];
    linkMessageColor = v10->_linkMessageColor;
    v10->_linkMessageColor = (UIColor *)v31;

    uint64_t v33 = [MEMORY[0x263F825C8] labelColor];
    textColor = v10->_textColor;
    v10->_textColor = (UIColor *)v33;

    v10->_textAlignment = 1;
    v10->_textLineSpacing = 1.5;
    v35 = [v9 bundleIdentifier];
    int v36 = [v35 isEqualToString:@"com.apple.mobileslideshow"];

    double v37 = 10.0;
    if (v36) {
      double v37 = 12.0;
    }
    double v38 = 5.0;
    if (v36) {
      double v38 = 12.0;
    }
    v10->_textMargins.top = v38;
    v10->_textMargins.leading = 25.0;
    v10->_textMargins.bottom = v37;
    v10->_textMargins.trailing = 25.0;
    v39 = [_ICQTextView alloc];
    uint64_t v40 = -[_ICQTextView initWithFrame:](v39, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    textView = v10->_textView;
    v10->_textView = (_ICQTextView *)v40;

    [(_ICQTextView *)v10->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = [MEMORY[0x263F825C8] clearColor];
    [(_ICQTextView *)v10->_textView setBackgroundColor:v42];

    -[_ICQTextView setTextContainerInset:](v10->_textView, "setTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
    [(_ICQTextView *)v10->_textView setDelegate:v10];
    [(ICQLegacyBannerView *)v10 addSubview:v10->_textView];
    [(ICQLegacyBannerView *)v10 _updateBannerViewConstraints];
  }

  return v10;
}

- (id)_getOffer
{
  v2 = [MEMORY[0x263F88928] sharedOfferManager];
  v3 = [v2 currentOffer];

  return v3;
}

- (int64_t)semanticContentAttribute
{
  v2 = [(ICQLegacyBannerView *)self textView];
  int64_t v3 = [v2 semanticContentAttribute];

  return v3;
}

- (int64_t)userInterfaceLayoutDirection
{
  int64_t v3 = objc_opt_class();
  id v4 = [(ICQLegacyBannerView *)self textView];
  int64_t v5 = objc_msgSend(v3, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v4, "semanticContentAttribute"));

  return v5;
}

- (void)updateConstraints
{
  [(ICQLegacyBannerView *)self _updateBannerViewConstraints];
  v3.receiver = self;
  v3.super_class = (Class)ICQLegacyBannerView;
  [(ICQLegacyBannerView *)&v3 updateConstraints];
}

- (void)_updateBannerViewConstraints
{
  [MEMORY[0x263F08938] deactivateConstraints:self->_activeConstraints];
  id v17 = [MEMORY[0x263EFF980] array];
  objc_super v3 = [(_ICQTextView *)self->_textView topAnchor];
  id v4 = [(ICQLegacyBannerView *)self topAnchor];
  int64_t v5 = [v3 constraintEqualToAnchor:v4 constant:self->_textMargins.top];
  [v17 addObject:v5];

  v6 = [(_ICQTextView *)self->_textView leadingAnchor];
  v7 = [(ICQLegacyBannerView *)self leadingAnchor];
  v8 = [v6 constraintEqualToAnchor:v7 constant:self->_textMargins.leading];
  [v17 addObject:v8];

  id v9 = [(_ICQTextView *)self->_textView trailingAnchor];
  v10 = [(ICQLegacyBannerView *)self trailingAnchor];
  int v11 = [v9 constraintEqualToAnchor:v10 constant:-self->_textMargins.trailing];
  [v17 addObject:v11];

  double v12 = [(ICQLegacyBannerView *)self bottomAnchor];
  uint64_t v13 = [(_ICQTextView *)self->_textView bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:self->_textMargins.bottom];
  [v17 addObject:v14];

  uint64_t v15 = (NSArray *)[v17 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v15;

  [MEMORY[0x263F08938] activateConstraints:self->_activeConstraints];
}

- (id)textParagraphStyle
{
  objc_super v3 = [MEMORY[0x263F81658] defaultParagraphStyle];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "setAlignment:", -[ICQLegacyBannerView textAlignment](self, "textAlignment"));
  int64_t v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v5 languageCode];
  v7 = [v6 lowercaseString];
  int v8 = [v7 isEqualToString:@"th"];

  if (v8)
  {
    [v4 setLineHeightMultiple:1.2];
  }
  else
  {
    [(ICQLegacyBannerView *)self textLineSpacing];
    objc_msgSend(v4, "setLineSpacing:");
  }
  id v9 = (void *)[v4 copy];

  return v9;
}

- (id)textParagraphStyleAttributes
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F81540];
  v2 = [(ICQLegacyBannerView *)self textParagraphStyle];
  v6[0] = v2;
  objc_super v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)messageAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F814F0];
  objc_super v3 = [(ICQLegacyBannerView *)self font];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F81500];
  id v4 = [(ICQLegacyBannerView *)self textColor];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)titleAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F814F0];
  objc_super v3 = [(ICQLegacyBannerView *)self titleFont];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F81500];
  id v4 = [(ICQLegacyBannerView *)self titleColor];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)detailMessageAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F814F0];
  objc_super v3 = [(ICQLegacyBannerView *)self detailMessageFont];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F81500];
  id v4 = [(ICQLegacyBannerView *)self detailMessageColor];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)linkAttributes
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = *MEMORY[0x263F814F0];
  objc_super v3 = [(ICQLegacyBannerView *)self linkMessageFont];
  v8[0] = v3;
  v7[1] = *MEMORY[0x263F81500];
  id v4 = [(ICQLegacyBannerView *)self linkMessageFont];
  v8[1] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (void)_applyTextParagraphAttributes
{
  objc_super v3 = [(_ICQTextView *)self->_textView textStorage];
  [v3 beginEditing];

  id v4 = [(_ICQTextView *)self->_textView textStorage];
  uint64_t v5 = [(ICQLegacyBannerView *)self textParagraphStyleAttributes];
  v6 = [(_ICQTextView *)self->_textView textStorage];
  objc_msgSend(v4, "addAttributes:range:", v5, 0, objc_msgSend(v6, "length"));

  id v7 = [(_ICQTextView *)self->_textView textStorage];
  [v7 endEditing];
}

- (void)_applyTextStorageAttributes
{
  v21[1] = *MEMORY[0x263EF8340];
  objc_super v3 = [(ICQLegacyBannerView *)self offer];
  id v4 = [v3 bannerSpecification];
  char v5 = [v4 isDetailBannerInfoAvailable];

  if ((v5 & 1) == 0)
  {
    v6 = [(_ICQTextView *)self->_textView textStorage];
    [v6 beginEditing];

    id v7 = [(_ICQTextView *)self->_textView textStorage];
    uint64_t v8 = [v7 length];

    id v9 = [(_ICQTextView *)self->_textView textStorage];
    v10 = [(ICQLegacyBannerView *)self messageAttributes];
    objc_msgSend(v9, "addAttributes:range:", v10, 0, v8);

    int v11 = [(ICQLegacyBannerView *)self linkTextFont];

    if (v11)
    {
      uint64_t v20 = *MEMORY[0x263F814F0];
      double v12 = [(ICQLegacyBannerView *)self linkTextFont];
      v21[0] = v12;
      uint64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];

      v14 = [(_ICQTextView *)self->_textView textStorage];
      uint64_t v15 = *MEMORY[0x263F81520];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __50__ICQLegacyBannerView__applyTextStorageAttributes__block_invoke;
      v18[3] = &unk_264923050;
      v18[4] = self;
      id v19 = v13;
      id v16 = v13;
      objc_msgSend(v14, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v8, 0, v18);
    }
    id v17 = [(_ICQTextView *)self->_textView textStorage];
    [v17 endEditing];
  }
}

void __50__ICQLegacyBannerView__applyTextStorageAttributes__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v7 = [*(id *)(*(void *)(a1 + 32) + 536) textStorage];
    objc_msgSend(v7, "addAttributes:range:", *(void *)(a1 + 40), a3, a4);
  }
}

- (id)attributedText
{
  objc_super v3 = objc_opt_new();
  id v4 = [(ICQLegacyBannerView *)self offer];
  char v5 = [v4 bannerSpecification];

  v6 = [v5 linksFormat];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x263F086A0];
    id v9 = [v5 linksFormat];
    v10 = [(ICQLegacyBannerView *)self messageAttributes];
    int v11 = [v5 links];
    double v12 = [v8 attributedStringWithFormat:v9 attributes:v10 links:v11];

    [v3 appendAttributedString:v12];
    goto LABEL_10;
  }
  uint64_t v13 = [(ICQLegacyBannerView *)self offer];
  uint64_t v14 = [v13 level];

  uint64_t v15 = _ICQGetLogSystem();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      LOWORD(v21) = 0;
      id v17 = "Banner view is missing banner specification";
      v18 = (uint8_t *)&v21;
LABEL_8:
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, v17, v18, 2u);
    }
  }
  else if (v16)
  {
    *(_WORD *)buf = 0;
    id v17 = "Banner view should not be shown if level is sufficient";
    v18 = buf;
    goto LABEL_8;
  }

LABEL_10:
  id v19 = objc_msgSend(v3, "copy", v21);

  return v19;
}

+ (id)replaceWordsIn:(id)a3 with:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      int v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v13 = [v6 objectForKey:v12];
        id v5 = [v11 stringByReplacingOccurrencesOfString:v12 withString:v13];

        ++v10;
        int v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)detailAttributedText
{
  objc_super v3 = objc_opt_new();
  id v4 = [(ICQLegacyBannerView *)self offer];
  id v5 = [v4 bannerSpecification];

  if (([v5 isDetailBannerInfoAvailable] & 1) == 0)
  {
    double v38 = [(ICQLegacyBannerView *)self attributedText];
    goto LABEL_19;
  }
  id v6 = [(ICQLegacyBannerView *)self offer];
  uint64_t v7 = [v6 deviceInfo];

  uint64_t v8 = [v7 key];
  uint64_t v9 = [v5 titleWithKey:v8];

  uint64_t v10 = [v7 key];
  int v11 = [v5 messageWithKey:v10];

  if ([v9 length])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v7 wordsToReplace];
    uint64_t v14 = [v12 replaceWordsIn:v9 with:v13];

    uint64_t v9 = [NSString stringWithFormat:@"%@\n", v14];

    long long v15 = (void *)MEMORY[0x263F086A0];
    long long v16 = [(ICQLegacyBannerView *)self titleAttributes];
    long long v17 = [v15 attributedStringWithFormat:v9 attributes:v16 links:0];

    long long v18 = [(ICQLegacyBannerView *)self offer];
    id v19 = [v18 bundleIdentifier];
    int v20 = [v19 isEqualToString:@"com.apple.mobileslideshow"];

    if (v20)
    {
      v48 = [MEMORY[0x263F82818] configurationWithTextStyle:*MEMORY[0x263F835F0]];
      uint64_t v47 = [MEMORY[0x263F827E8] systemImageNamed:@"exclamationmark.triangle" withConfiguration:v48];
      uint64_t v21 = [MEMORY[0x263F825C8] systemOrangeColor];
      v46 = [v47 imageWithTintColor:v21];

      v22 = (void *)[objc_alloc(MEMORY[0x263F81678]) initWithData:0 ofType:0];
      [v22 setImage:v46];
      v23 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v22];
      [v3 appendAttributedString:v23];
      v24 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
      [v3 appendAttributedString:v24];
    }
    [v3 appendAttributedString:v17];
  }
  if ([v11 length])
  {
    uint64_t v25 = objc_opt_class();
    v26 = [v7 wordsToReplace];
    uint64_t v27 = [v25 replaceWordsIn:v11 with:v26];

    int v11 = [NSString stringWithFormat:@"%@\n", v27];

    v28 = (void *)MEMORY[0x263F086A0];
    uint64_t v29 = [(ICQLegacyBannerView *)self detailMessageAttributes];
    uint64_t v30 = [v28 attributedStringWithFormat:v11 attributes:v29 links:0];

    [v3 appendAttributedString:v30];
  }
  uint64_t v31 = [v5 linksFormat];
  uint64_t v32 = [v31 length];

  if (!v32)
  {
    v39 = [(ICQLegacyBannerView *)self offer];
    uint64_t v40 = [v39 level];

    v41 = _ICQGetLogSystem();
    BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (v40)
    {
      if (v42)
      {
        __int16 v49 = 0;
        v43 = "Banner view is missing banner specification";
        objc_super v44 = (uint8_t *)&v49;
LABEL_16:
        _os_log_impl(&dword_22C821000, v41, OS_LOG_TYPE_DEFAULT, v43, v44, 2u);
      }
    }
    else if (v42)
    {
      *(_WORD *)buf = 0;
      v43 = "Banner view should not be shown if level is sufficient";
      objc_super v44 = buf;
      goto LABEL_16;
    }

    goto LABEL_18;
  }
  uint64_t v33 = (void *)MEMORY[0x263F086A0];
  v34 = [v5 linksFormat];
  v35 = [(ICQLegacyBannerView *)self linkAttributes];
  int v36 = [v5 links];
  double v37 = [v33 attributedStringWithFormat:v34 attributes:v35 links:v36];

  [v3 appendAttributedString:v37];
LABEL_18:
  double v38 = (void *)[v3 copy];

LABEL_19:
  return v38;
}

- (ICQOffer)offer
{
  return self->_offer;
}

- (void)setOffer:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_offer, a3);
  id v5 = [(ICQLegacyBannerView *)self detailAttributedText];
  [(_ICQTextView *)self->_textView setAttributedText:v5];
  [(ICQLegacyBannerView *)self _applyTextStorageAttributes];
  [(ICQLegacyBannerView *)self _applyTextParagraphAttributes];
  if (v5)
  {
    id v6 = [v5 string];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      [(_ICQTextView *)self->_textView setIsAccessibilityElement:1];
      id v8 = objc_alloc_init(MEMORY[0x263F086A0]);
      [(_ICQTextView *)self->_textView setAccessibilityAttributedLabel:v8];
    }
  }
}

- (void)setFont:(id)a3
{
  id v4 = (UIFont *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81838]];
  }
  if (self->_font != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&self->_font, v4);
    [(ICQLegacyBannerView *)self _applyTextStorageAttributes];
    id v4 = v5;
  }
}

- (void)setTextColor:(id)a3
{
  id v4 = (UIColor *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F825C8] labelColor];
  }
  if (self->_textColor != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&self->_textColor, v4);
    [(ICQLegacyBannerView *)self _applyTextStorageAttributes];
    id v4 = v5;
  }
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(ICQLegacyBannerView *)self _applyTextParagraphAttributes];
  }
}

- (void)setTextLineSpacing:(double)a3
{
  if (self->_textLineSpacing != a3)
  {
    self->_textLineSpacing = a3;
    [(ICQLegacyBannerView *)self _applyTextParagraphAttributes];
  }
}

- (void)setTextMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_textMargins.leading != a3.leading
    || self->_textMargins.top != a3.top
    || self->_textMargins.trailing != a3.trailing
    || self->_textMargins.bottom != a3.bottom)
  {
    self->_textMargins = a3;
    [(ICQLegacyBannerView *)self setNeedsUpdateConstraints];
  }
}

- (void)setLinkTextFont:(id)a3
{
  id v4 = (UIFont *)a3;
  linkTextFont = self->_linkTextFont;
  if (linkTextFont != v4)
  {
    id v9 = v4;
    char v6 = [(UIFont *)linkTextFont isEqual:v4];
    id v4 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (UIFont *)[(UIFont *)v9 copy];
      id v8 = self->_linkTextFont;
      self->_linkTextFont = v7;

      [(ICQLegacyBannerView *)self _applyTextStorageAttributes];
      id v4 = v9;
    }
  }
}

- (void)setLinkTextColor:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (UIColor *)a3;
  id v5 = [(ICQLegacyBannerView *)self offer];
  char v6 = [v5 bannerSpecification];
  char v7 = [v6 isDetailBannerInfoAvailable];

  if ((v7 & 1) == 0)
  {
    linkTextColor = self->_linkTextColor;
    if (linkTextColor != v4 && ([(UIColor *)linkTextColor isEqual:v4] & 1) == 0)
    {
      id v9 = (UIColor *)[(UIColor *)v4 copy];
      uint64_t v10 = self->_linkTextColor;
      self->_linkTextColor = v9;

      int v11 = self->_linkTextColor;
      if (v11)
      {
        uint64_t v13 = *MEMORY[0x263F81500];
        v14[0] = v11;
        uint64_t v12 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
        [(_ICQTextView *)self->_textView setLinkTextAttributes:v12];
      }
      else
      {
        [(_ICQTextView *)self->_textView setLinkTextAttributes:MEMORY[0x263EFFA78]];
      }
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  p_textMargins = &self->_textMargins;
  -[_ICQTextView sizeThatFits:](self->_textView, "sizeThatFits:", a3.width - self->_textMargins.leading - self->_textMargins.trailing, 1.79769313e308);
  double v6 = v5 + p_textMargins->top + p_textMargins->bottom;
  double v7 = width;
  result.double height = v6;
  result.CGFloat width = v7;
  return result;
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  double v6 = objc_msgSend(a4, "link", a3);
  unint64_t v7 = [v6 icqIndex];
  if (v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    unint64_t v8 = v7;
    id v9 = [(ICQLegacyBannerView *)self offer];
    uint64_t v10 = [v9 bannerSpecification];
    int v11 = [v10 links];
    unint64_t v12 = [v11 count];

    if (v8 < v12)
    {
      uint64_t v13 = [(ICQLegacyBannerView *)self offer];
      uint64_t v14 = [v13 bannerSpecification];
      long long v15 = [v14 links];
      long long v16 = [v15 objectAtIndexedSubscript:v8];

      if (![(ICQLegacyBannerView *)self _performActionWithICQLink:v16])
      {
        long long v17 = _ICQGetLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          [v16 action];
          long long v18 = _ICQStringForAction();
          int v21 = 138543618;
          v22 = v18;
          __int16 v23 = 2114;
          id v24 = (id)objc_opt_class();
          id v19 = v24;
          _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "ICQBanner: action %{public}@ not handled by delegate nor %{public}@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
  }

  return 0;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v5 = a3;
  uint64_t v3 = [v5 selectedRange];
  if (v3 | v4) {
    objc_msgSend(v5, "setSelectedRange:", 0, 0);
  }
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (void)_configureManageStorageButtonWithICQLink:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  p_manageStorageButton = &self->_manageStorageButton;
  if (v4 && (unint64_t v7 = *p_manageStorageButton) != 0)
  {
    unint64_t v8 = [v4 text];
    [(UIButton *)v7 setTitle:v8 forState:0];

    id v9 = (void *)MEMORY[0x263F823D0];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __64__ICQLegacyBannerView__configureManageStorageButtonWithICQLink___block_invoke;
    long long v15 = &unk_264923078;
    long long v16 = self;
    id v17 = v5;
    uint64_t v10 = [v9 actionWithTitle:&stru_26DFF2C90 image:0 identifier:@"MANAGE_STORAGE" handler:&v12];
    -[UIButton addAction:forControlEvents:](*p_manageStorageButton, "addAction:forControlEvents:", v10, 64, v12, v13, v14, v15, v16);
  }
  else
  {
    int v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(ICQLegacyBannerView *)(uint64_t *)p_manageStorageButton _configureManageStorageButtonWithICQLink:v11];
    }
  }
}

void __64__ICQLegacyBannerView__configureManageStorageButtonWithICQLink___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(a1 + 32) _performActionWithICQLink:*(void *)(a1 + 40)];
  v2 = _ICQGetLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = v1;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "ICQLink action completed with result: %d", (uint8_t *)v3, 8u);
  }
}

- (BOOL)_performActionWithICQLink:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Performing banner view action with icqLink: %@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = [WeakRetained performActionWith:v4];

  return v7;
}

- (void)updateBannerView
{
  uint64_t v3 = [MEMORY[0x263F825C8] quaternarySystemFillColor];
  [(ICQLegacyBannerView *)self setBackgroundColor:v3];

  textView = self->_textView;
  id v5 = [(ICQLegacyBannerView *)self detailAttributedText];
  [(_ICQTextView *)textView setAttributedText:v5];

  [(ICQLegacyBannerView *)self _applyTextStorageAttributes];
  [(ICQLegacyBannerView *)self _applyTextParagraphAttributes];
  [(ICQLegacyBannerView *)self sizeToFit];
  double v6 = [(ICQLegacyBannerView *)self superview];
  [v6 sizeToFit];

  id v8 = [(ICQLegacyBannerView *)self superview];
  char v7 = [v8 superview];
  [v7 sizeToFit];
}

- (ICQLegacyBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQLegacyBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)detailMessageFont
{
  return self->_detailMessageFont;
}

- (void)setDetailMessageFont:(id)a3
{
}

- (UIFont)linkMessageFont
{
  return self->_linkMessageFont;
}

- (void)setLinkMessageFont:(id)a3
{
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (void)setTitleColor:(id)a3
{
}

- (UIColor)detailMessageColor
{
  return self->_detailMessageColor;
}

- (void)setDetailMessageColor:(id)a3
{
}

- (UIColor)linkMessageColor
{
  return self->_linkMessageColor;
}

- (void)setLinkMessageColor:(id)a3
{
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (NSDirectionalEdgeInsets)textMargins
{
  double top = self->_textMargins.top;
  double leading = self->_textMargins.leading;
  double bottom = self->_textMargins.bottom;
  double trailing = self->_textMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (double)textLineSpacing
{
  return self->_textLineSpacing;
}

- (UIFont)linkTextFont
{
  return self->_linkTextFont;
}

- (UIColor)linkTextColor
{
  return self->_linkTextColor;
}

- (ICQUpgradeFlowOptions)flowOptions
{
  return self->_flowOptions;
}

- (void)setFlowOptions:(id)a3
{
}

- (_ICQTextView)textView
{
  return self->_textView;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_flowOptions, 0);
  objc_storeStrong((id *)&self->_linkTextColor, 0);
  objc_storeStrong((id *)&self->_linkTextFont, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_linkMessageColor, 0);
  objc_storeStrong((id *)&self->_detailMessageColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_linkMessageFont, 0);
  objc_storeStrong((id *)&self->_detailMessageFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manageStorageButton, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)initWithOffer:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "ERROR:ICQBannerView:initWithOffer should be call from main thread", v1, 2u);
}

- (void)_configureManageStorageButtonWithICQLink:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "Manage storage button (%@) and icqLink (%@) must not be nil.", (uint8_t *)&v4, 0x16u);
}

@end
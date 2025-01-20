@interface SUUIProductPageFeaturesView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (SUUIClientContext)clientContext;
- (SUUIColorScheme)colorScheme;
- (SUUIProductPageFeaturesView)initWithFrame:(CGRect)a3;
- (id)_gameCenterStringWithFeatures:(unint64_t)a3;
- (int64_t)features;
- (unint64_t)gameCenterFeatures;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColorScheme:(id)a3;
- (void)setFeatures:(int64_t)a3;
- (void)setFeatures:(int64_t)a3 gameCenterFeatures:(unint64_t)a4;
- (void)setGameCenterFeatures:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIProductPageFeaturesView

- (SUUIProductPageFeaturesView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageFeaturesView;
  v3 = -[SUUIProductPageFeaturesView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomBorderView = v3->_bottomBorderView;
    v3->_bottomBorderView = v4;

    v6 = v3->_bottomBorderView;
    v7 = [(SUUIColorScheme *)v3->_colorScheme primaryTextColor];
    if (v7)
    {
      [(UIView *)v6 setBackgroundColor:v7];
    }
    else
    {
      v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
      [(UIView *)v6 setBackgroundColor:v8];
    }
    [(SUUIProductPageFeaturesView *)v3 addSubview:v3->_bottomBorderView];
  }
  return v3;
}

- (void)setFeatures:(int64_t)a3
{
}

- (void)setFeatures:(int64_t)a3 gameCenterFeatures:(unint64_t)a4
{
  unint64_t gameCenterFeatures = a4;
  v36[16] = *MEMORY[0x263EF8340];
  if (self->_features != a3 || self->_gameCenterFeatures != a4)
  {
    [(NSMutableArray *)self->_featureViews makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->_featureViews removeAllObjects];
    self->_features = a3;
    self->_unint64_t gameCenterFeatures = gameCenterFeatures;
    if (!self->_featureViews)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      featureViews = self->_featureViews;
      self->_featureViews = v7;

      unint64_t gameCenterFeatures = self->_gameCenterFeatures;
    }
    v36[0] = 1;
    v36[1] = @"ProductViewGameCenterBadge";
    v36[2] = -[SUUIProductPageFeaturesView _gameCenterStringWithFeatures:](self, "_gameCenterStringWithFeatures:", gameCenterFeatures, 440);
    clientContext = self->_clientContext;
    if (clientContext)
    {
      [(SUUIClientContext *)clientContext localizedStringForKey:@"SUPPORTS_GAMECENTER_TITLE" inTable:@"ProductPage"];
    }
    else
    {
      id v10 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_GAMECENTER_TITLE" inBundles:0 inTable:@"ProductPage"];
    v11 = };

    v36[3] = v11;
    v36[4] = 4;
    v36[5] = @"ProductViewPassbookBadge";
    v12 = self->_clientContext;
    if (v12)
    {
      [(SUUIClientContext *)v12 localizedStringForKey:@"SUPPORTS_PASSBOOK_BODY" inTable:@"ProductPage"];
    }
    else
    {
      id v13 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_PASSBOOK_BODY" inBundles:0 inTable:@"ProductPage"];
    v14 = };

    v36[6] = v14;
    v15 = self->_clientContext;
    if (v15)
    {
      [(SUUIClientContext *)v15 localizedStringForKey:@"SUPPORTS_PASSBOOK_TITLE" inTable:@"ProductPage"];
    }
    else
    {
      id v16 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_PASSBOOK_TITLE" inBundles:0 inTable:@"ProductPage"];
    v17 = };

    v36[7] = v17;
    v36[8] = 8;
    v36[9] = @"ProductViewNewsstandBadge";
    v18 = self->_clientContext;
    if (v18)
    {
      [(SUUIClientContext *)v18 localizedStringForKey:@"SUPPORTS_NEWSSTAND_BODY" inTable:@"ProductPage"];
    }
    else
    {
      id v19 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_NEWSSTAND_BODY" inBundles:0 inTable:@"ProductPage"];
    v20 = };

    v36[10] = v20;
    v21 = self->_clientContext;
    if (v21)
    {
      [(SUUIClientContext *)v21 localizedStringForKey:@"SUPPORTS_NEWSSTAND_TITLE" inTable:@"ProductPage"];
    }
    else
    {
      id v22 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_NEWSSTAND_TITLE" inBundles:0 inTable:@"ProductPage"];
    v23 = };

    v36[11] = v23;
    v36[12] = 2;
    v36[13] = @"ProductViewCloudBadge";
    v24 = self->_clientContext;
    if (v24)
    {
      [(SUUIClientContext *)v24 localizedStringForKey:@"SUPPORTS_ICLOUD_BODY" inTable:@"ProductPage"];
    }
    else
    {
      id v25 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_ICLOUD_BODY" inBundles:0 inTable:@"ProductPage"];
    v26 = };

    v36[14] = v26;
    v27 = self->_clientContext;
    if (v27)
    {
      [(SUUIClientContext *)v27 localizedStringForKey:@"SUPPORTS_ICLOUD_TITLE" inTable:@"ProductPage"];
    }
    else
    {
      id v28 = 0;
      +[SUUIClientContext localizedStringForKey:@"SUPPORTS_ICLOUD_TITLE" inBundles:0 inTable:@"ProductPage"];
    v29 = };

    v36[15] = v29;
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    for (uint64_t i = 0; i != 16; i += 4)
    {
      if ((v36[i] & self->_features) != 0)
      {
        v32 = objc_alloc_init(SUUIProductPageFeatureView);
        [(SUUIProductPageFeatureView *)v32 setColorScheme:self->_colorScheme];
        v33 = [(SUUIProductPageFeaturesView *)self backgroundColor];
        [(SUUIProductPageFeatureView *)v32 setBackgroundColor:v33];

        v34 = [MEMORY[0x263F827E8] imageNamed:v36[i + 1] inBundle:v30];
        [(SUUIProductPageFeatureView *)v32 setIcon:v34];

        [(SUUIProductPageFeatureView *)v32 setSubtitle:v36[i + 2]];
        [(SUUIProductPageFeatureView *)v32 setTitle:v36[i + 3]];
        [*(id *)((char *)&self->super.super.super.isa + v35) addObject:v32];
        [(SUUIProductPageFeaturesView *)self addSubview:v32];
      }
    }
    [(SUUIProductPageFeaturesView *)self setNeedsLayout];
  }
}

- (void)setGameCenterFeatures:(unint64_t)a3
{
}

- (void)setTitle:(id)a3
{
  id v17 = a3;
  id v4 = [(SUUIProductPageFeaturesView *)self title];
  if (v4 != v17 && ([v4 isEqualToString:v17] & 1) == 0)
  {
    uint64_t v5 = [v17 length];
    titleLabel = self->_titleLabel;
    if (v5)
    {
      if (!titleLabel)
      {
        v7 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
        v8 = self->_titleLabel;
        self->_titleLabel = v7;

        v9 = self->_titleLabel;
        id v10 = [(SUUIProductPageFeaturesView *)self backgroundColor];
        [(UILabel *)v9 setBackgroundColor:v10];

        v11 = self->_titleLabel;
        v12 = [MEMORY[0x263F81708] systemFontOfSize:17.0];
        [(UILabel *)v11 setFont:v12];

        id v13 = self->_titleLabel;
        v14 = [(SUUIColorScheme *)self->_colorScheme secondaryTextColor];
        if (v14)
        {
          [(UILabel *)v13 setTextColor:v14];
        }
        else
        {
          id v16 = [MEMORY[0x263F825C8] blackColor];
          [(UILabel *)v13 setTextColor:v16];
        }
        [(SUUIProductPageFeaturesView *)self addSubview:self->_titleLabel];
        titleLabel = self->_titleLabel;
      }
      [(UILabel *)titleLabel setText:v17];
      [(UILabel *)self->_titleLabel sizeToFit];
    }
    else
    {
      [(UILabel *)titleLabel removeFromSuperview];
      v15 = self->_titleLabel;
      self->_titleLabel = 0;
    }
    [(SUUIProductPageFeaturesView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(SUUIProductPageFeaturesView *)self bounds];
  double v4 = v3;
  double v27 = v5;
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    CGFloat v8 = v7;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, 11.0, v4 + -15.0 + -15.0);
    v34.origin.x = 15.0;
    v34.origin.y = 11.0;
    v34.size.width = v4 + -15.0 + -15.0;
    v34.size.height = v8;
    double v9 = CGRectGetMaxY(v34) + -4.0 + 15.0;
  }
  else
  {
    double v9 = 15.0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = self->_featureViews;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v15 frame];
        CGFloat v16 = v9 + -2.0;
        objc_msgSend(v15, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        objc_msgSend(v15, "setFrame:", 15.0, v16, v17, v19);
        v35.origin.x = 15.0;
        v35.origin.y = v16;
        v35.size.width = v18;
        v35.size.height = v20;
        double v9 = CGRectGetMaxY(v35) + -2.0 + 16.0;
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  bottomBorderView = self->_bottomBorderView;
  id v22 = [MEMORY[0x263F82B60] mainScreen];
  [v22 scale];
  double v24 = v27 - 1.0 / v23;
  id v25 = [MEMORY[0x263F82B60] mainScreen];
  [v25 scale];
  -[UIView setFrame:](bottomBorderView, "setFrame:", 15.0, v24, v4 + -15.0, 1.0 / v26);
}

- (void)setBackgroundColor:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v5 = self->_featureViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) setBackgroundColor:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(UILabel *)self->_titleLabel setBackgroundColor:v4];
  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageFeaturesView;
  [(SUUIProductPageFeaturesView *)&v10 setBackgroundColor:v4];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(NSMutableArray *)self->_featureViews count];
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    double v8 = v7 + -4.0 + -4.0 + 30.0 + 15.0;
  }
  else
  {
    double v8 = 45.0;
  }
  if (v5 >= 2) {
    double v8 = v8 + (float)((float)(v5 - 1) * 16.0);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_featureViews;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "sizeThatFits:", width + -30.0, 1.79769313e308, (void)v17);
        double v8 = v8 + v14 + -2.0 + -2.0;
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  double v15 = width;
  double v16 = v8;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (id)_gameCenterStringWithFeatures:(unint64_t)a3
{
  if (a3)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = 0; i != 10; i += 2)
    {
      if ((qword_265406FE8[i] & a3) != 0)
      {
        clientContext = self->_clientContext;
        uint64_t v8 = qword_265406FE8[i + 1];
        if (clientContext) {
          [(SUUIClientContext *)clientContext localizedStringForKey:v8 inTable:@"ProductPage"];
        }
        else {
        uint64_t v9 = +[SUUIClientContext localizedStringForKey:v8 inBundles:0 inTable:@"ProductPage"];
        }
        [v5 addObject:v9];
      }
    }
    switch([v5 count])
    {
      case 1:
        uint64_t v10 = self->_clientContext;
        if (v10) {
          [(SUUIClientContext *)v10 localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@" inTable:@"ProductPage"];
        }
        else {
        long long v17 = +[SUUIClientContext localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@" inBundles:0 inTable:@"ProductPage"];
        }
        long long v18 = NSString;
        long long v19 = [v5 objectAtIndexedSubscript:0];
        uint64_t v12 = [v18 stringWithValidatedFormat:v17, @"%@", 0, v19 validFormatSpecifiers error];
        goto LABEL_38;
      case 2:
        long long v13 = self->_clientContext;
        if (v13) {
          [(SUUIClientContext *)v13 localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@" inTable:@"ProductPage"];
        }
        else {
        long long v17 = +[SUUIClientContext localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@" inBundles:0 inTable:@"ProductPage"];
        }
        long long v20 = NSString;
        long long v19 = [v5 objectAtIndexedSubscript:0];
        v21 = [v5 objectAtIndexedSubscript:1];
        uint64_t v12 = [v20 stringWithValidatedFormat:v17, @"%@%@", 0, v19, v21 validFormatSpecifiers error];
        goto LABEL_37;
      case 3:
        double v14 = self->_clientContext;
        if (v14) {
          [(SUUIClientContext *)v14 localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@" inTable:@"ProductPage"];
        }
        else {
        long long v17 = +[SUUIClientContext localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@" inBundles:0 inTable:@"ProductPage"];
        }
        uint64_t v22 = NSString;
        long long v19 = [v5 objectAtIndexedSubscript:0];
        v21 = [v5 objectAtIndexedSubscript:1];
        double v23 = [v5 objectAtIndexedSubscript:2];
        uint64_t v12 = [v22 stringWithValidatedFormat:v17, @"%@%@%@", 0, v19, v21, v23 validFormatSpecifiers error];
        goto LABEL_36;
      case 4:
        double v15 = self->_clientContext;
        if (v15) {
          [(SUUIClientContext *)v15 localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@" inTable:@"ProductPage"];
        }
        else {
        long long v17 = +[SUUIClientContext localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@" inBundles:0 inTable:@"ProductPage"];
        }
        double v24 = NSString;
        long long v19 = [v5 objectAtIndexedSubscript:0];
        v21 = [v5 objectAtIndexedSubscript:1];
        double v23 = [v5 objectAtIndexedSubscript:2];
        id v25 = [v5 objectAtIndexedSubscript:3];
        uint64_t v12 = [v24 stringWithValidatedFormat:v17, @"%@%@%@%@", 0, v19, v21, v23, v25 validFormatSpecifiers error];
        goto LABEL_35;
      case 5:
        double v16 = self->_clientContext;
        if (v16) {
          [(SUUIClientContext *)v16 localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@_%@" inTable:@"ProductPage"];
        }
        else {
        long long v17 = +[SUUIClientContext localizedStringForKey:@"GAME_CENTER_SUPPORTS_FORMAT_%@_%@_%@_%@_%@" inBundles:0 inTable:@"ProductPage"];
        }
        double v26 = NSString;
        long long v19 = [v5 objectAtIndexedSubscript:0];
        v21 = [v5 objectAtIndexedSubscript:1];
        double v23 = [v5 objectAtIndexedSubscript:2];
        id v25 = [v5 objectAtIndexedSubscript:3];
        double v27 = [v5 objectAtIndexedSubscript:4];
        uint64_t v12 = [v26 stringWithValidatedFormat:v17, @"%@%@%@%@%@", 0, v19, v21, v23, v25, v27 validFormatSpecifiers error];

LABEL_35:
LABEL_36:

LABEL_37:
LABEL_38:

        break;
      default:
        uint64_t v12 = 0;
        break;
    }
  }
  else
  {
    uint64_t v11 = self->_clientContext;
    if (v11) {
      [(SUUIClientContext *)v11 localizedStringForKey:@"SUPPORTS_GAMECENTER_BODY" inTable:@"ProductPage"];
    }
    else {
    uint64_t v12 = +[SUUIClientContext localizedStringForKey:@"SUPPORTS_GAMECENTER_BODY" inBundles:0 inTable:@"ProductPage"];
    }
  }
  return v12;
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (void)setColorScheme:(id)a3
{
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (int64_t)features
{
  return self->_features;
}

- (unint64_t)gameCenterFeatures
{
  return self->_gameCenterFeatures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topBorderView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_storeStrong((id *)&self->_bottomBorderView, 0);
}

@end
@interface MTUIAlarmView
- (BOOL)isSwitchVisible;
- (BOOL)shouldAddLayoutConstraints;
- (MTUIAlarmView)initWithFrame:(CGRect)a3;
- (MTUIDigitalClockLabel)timeLabel;
- (NSArray)currentConstraints;
- (NSDictionary)viewsByIdentifier;
- (NSString)name;
- (NSString)repeatText;
- (UIFont)nameFont;
- (UIFont)repeatFont;
- (UILabel)detailLabel;
- (UISwitch)enabledSwitch;
- (int64_t)style;
- (void)_loadFontsWithTextStyles;
- (void)setCurrentConstraints:(id)a3;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
- (void)setName:(id)a3;
- (void)setName:(id)a3 andRepeatText:(id)a4 textColor:(id)a5;
- (void)setNameFont:(id)a3;
- (void)setRepeatFont:(id)a3;
- (void)setRepeatText:(id)a3;
- (void)setShouldAddLayoutConstraints:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSwitchVisible:(BOOL)a3;
- (void)tearDownContentSizeChangeObserver;
@end

@implementation MTUIAlarmView

- (MTUIAlarmView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)MTUIAlarmView;
  v3 = -[NUIContainerGridView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTUIAlarmView *)v3 setEdgesPreservingSuperviewLayoutMargins:10];
    v5 = objc_alloc_init(MTUIDigitalClockLabel);
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = v5;

    v7 = [(MTUIDateLabel *)v4->_timeLabel dateLabel];
    [v7 setAdjustsFontSizeToFitWidth:1];

    v8 = objc_msgSend(MEMORY[0x263F1C658], "mtui_thinTimeFont");
    [(MTUIDateLabel *)v4->_timeLabel setFont:v8];

    v9 = [MEMORY[0x263F1C550] clearColor];
    [(MTUIDigitalClockLabel *)v4->_timeLabel setBackgroundColor:v9];

    v10 = [MEMORY[0x263F1C658] _lightSystemFontOfSize:30.0];
    [(MTUIDateLabel *)v4->_timeLabel setTimeDesignatorFont:v10];

    LODWORD(v10) = [(UIView *)v4 mtui_isRTL];
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    detailLabel = v4->_detailLabel;
    v4->_detailLabel = v11;

    if (v10) {
      uint64_t v13 = 8;
    }
    else {
      uint64_t v13 = 7;
    }
    [(UILabel *)v4->_detailLabel setContentMode:v13];
    v14 = (UISwitch *)objc_alloc_init(MEMORY[0x263F1CA10]);
    enabledSwitch = v4->_enabledSwitch;
    v4->_enabledSwitch = v14;

    v16 = objc_msgSend(MEMORY[0x263F1C550], "mtui_switchTintColor");
    [(UISwitch *)v4->_enabledSwitch setTintColor:v16];

    LODWORD(v17) = 1148846080;
    -[UISwitch setLayoutSize:withContentPriority:](v4->_enabledSwitch, "setLayoutSize:withContentPriority:", *MEMORY[0x263F255F8], *(double *)(MEMORY[0x263F255F8] + 8), v17);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __31__MTUIAlarmView_initWithFrame___block_invoke;
    v22[3] = &unk_264C73E30;
    v18 = v4;
    v23 = v18;
    [(MTUIAlarmView *)v18 performBatchUpdates:v22];
    uint64_t v19 = [(MTUIAlarmView *)v18 na_addNotificationBlockObserverForName:*MEMORY[0x263F1D158] object:0 queue:0 usingBlock:&__block_literal_global_2];
    id contentSizeFontAdjustObserver = v18->_contentSizeFontAdjustObserver;
    v18->_id contentSizeFontAdjustObserver = (id)v19;
  }
  return v4;
}

uint64_t __31__MTUIAlarmView_initWithFrame___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setLayoutMarginsRelativeArrangement:1];
  [*(id *)(a1 + 32) setBaselineRelativeArrangement:1];
  objc_msgSend(*(id *)(a1 + 32), "setLayoutMargins:", 60.0, 0.0, 17.0, 0.0);
  [*(id *)(a1 + 32) setBaselineRelativeLayoutMarginsForArrangement:1];
  [*(id *)(a1 + 32) setRowSpacing:19.0];
  [*(id *)(a1 + 32) setColumnSpacing:8.0];
  v2 = *(void **)(a1 + 32);
  v10[0] = v2[97];
  v10[1] = v2[103];
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  id v4 = (id)[v2 addRowWithArrangedSubviews:v3];

  v5 = *(void **)(a1 + 32);
  v9[0] = v5[100];
  v9[1] = v5[103];
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  id v7 = (id)[v5 addRowWithArrangedSubviews:v6];

  [*(id *)(a1 + 32) setAlignment:3 forView:*(void *)(*(void *)(a1 + 32) + 824) inAxis:1];
  return [*(id *)(a1 + 32) _loadFontsWithTextStyles];
}

uint64_t __31__MTUIAlarmView_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _loadFontsWithTextStyles];
}

- (void)setShouldAddLayoutConstraints:(BOOL)a3
{
  v6 = MTLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[MTUIAlarmView setShouldAddLayoutConstraints:](a2, v6);
  }

  self->_shouldAddLayoutConstraints = a3;
}

- (void)setSwitchVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(NUIContainerGridView *)self columnAtIndex:1];
  [v4 setHidden:v3];
}

- (BOOL)isSwitchVisible
{
  v2 = [(NUIContainerGridView *)self columnAtIndex:1];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (void)setNameFont:(id)a3
{
  objc_storeStrong((id *)&self->_nameFont, a3);

  [(MTUIAlarmView *)self tearDownContentSizeChangeObserver];
}

- (void)setRepeatFont:(id)a3
{
  objc_storeStrong((id *)&self->_repeatFont, a3);

  [(MTUIAlarmView *)self tearDownContentSizeChangeObserver];
}

- (void)tearDownContentSizeChangeObserver
{
  if (self->_contentSizeFontAdjustObserver)
  {
    -[MTUIAlarmView na_removeNotificationBlockObserver:](self, "na_removeNotificationBlockObserver:");
    id contentSizeFontAdjustObserver = self->_contentSizeFontAdjustObserver;
    self->_id contentSizeFontAdjustObserver = 0;
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(MTUIAlarmView *)self setNeedsUpdateConstraints];
  }
}

- (void)setName:(id)a3 andRepeatText:(id)a4 textColor:(id)a5
{
  v32[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a3;
  [(MTUIAlarmView *)self setName:v10];
  [(MTUIAlarmView *)self setRepeatText:v9];
  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_26E926B18;
  }
  v12 = v11;

  if (v9) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = &stru_26E926B18;
  }
  v14 = v13;

  nameFont = self->_nameFont;
  uint64_t v17 = *MEMORY[0x263F1C240];
  v31[0] = *MEMORY[0x263F1C238];
  uint64_t v15 = v31[0];
  v31[1] = v17;
  v32[0] = nameFont;
  v32[1] = v8;
  v18 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
  repeatFont = self->_repeatFont;
  v29[0] = v15;
  v29[1] = v17;
  v30[0] = repeatFont;
  v30[1] = v8;
  v20 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v21 = v12;
  if ([(__CFString *)v21 length])
  {
    v22 = v21;
    if (![(__CFString *)v14 length]) {
      goto LABEL_12;
    }
    v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v24 = [v23 localizedStringForKey:@"ALARM_DETAIL_FORMAT" value:&stru_26E926B18 table:@"MobileTimerUI"];

    v22 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", v24, v21, v14);
  }
  else
  {
    v22 = v14;
    objc_super v24 = v21;
  }

LABEL_12:
  v25 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v22 attributes:v18];
  if ([(__CFString *)v14 length])
  {
    if ([(UIView *)self mtui_isRTL]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 6;
    }
    uint64_t v27 = [(__CFString *)v22 rangeOfString:v14 options:v26];
    if (v28) {
      objc_msgSend(v25, "setAttributes:range:", v20, v27, v28);
    }
  }
  [(UILabel *)self->_detailLabel setAttributedText:v25];
  [(MTUIAlarmView *)self setNeedsLayout];
}

- (void)_loadFontsWithTextStyles
{
  char v3 = [MEMORY[0x263F1C658] systemFontOfSize:15.0 weight:*MEMORY[0x263F1D338]];
  objc_storeStrong((id *)&self->_repeatFont, v3);
  nameFont = self->_nameFont;
  self->_nameFont = v3;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTUIAlarmView;
  -[MTUIAlarmView setLayoutMargins:](&v4, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  [(MTUIAlarmView *)self setBaselineRelativeLayoutMarginsForArrangement:0];
}

- (int64_t)style
{
  return self->_style;
}

- (MTUIDigitalClockLabel)timeLabel
{
  return self->_timeLabel;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)repeatText
{
  return self->_repeatText;
}

- (void)setRepeatText:(id)a3
{
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (UIFont)repeatFont
{
  return self->_repeatFont;
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (NSDictionary)viewsByIdentifier
{
  return self->_viewsByIdentifier;
}

- (BOOL)shouldAddLayoutConstraints
{
  return self->_shouldAddLayoutConstraints;
}

- (NSArray)currentConstraints
{
  return self->_currentConstraints;
}

- (void)setCurrentConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentConstraints, 0);
  objc_storeStrong((id *)&self->_viewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_enabledSwitch, 0);
  objc_storeStrong((id *)&self->_repeatFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_repeatText, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong(&self->_contentSizeFontAdjustObserver, 0);
}

- (void)setShouldAddLayoutConstraints:(const char *)a1 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  char v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_235CF1000, a2, OS_LOG_TYPE_DEBUG, "%@ is a no-op and should not be used.", (uint8_t *)&v4, 0xCu);
}

@end
@interface WFWidgetConfigurationAttributionView
+ (id)attributionViewForAppBundleIdentifier:(id)a3;
- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (WFWidgetConfigurationAttributionView)initWithLegacyWidgetAttributionAttributedString:(id)a3;
- (WFWidgetConfigurationAttributionView)initWithWidgetAttributionAttributedString:(id)a3;
- (id)_attributionBackgroundColor;
- (id)_attributionFont;
- (id)_attributionTitleColor;
- (id)_paragraphStyle;
- (void)_configureAttributedString;
- (void)layoutSubviews;
@end

@implementation WFWidgetConfigurationAttributionView

- (void).cxx_destruct
{
}

- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000179E4;
    block[3] = &unk_10002D7A8;
    id v11 = v7;
    dispatch_async(v8, block);
  }
  return 0;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFWidgetConfigurationAttributionView;
  [(WFWidgetConfigurationAttributionView *)&v3 layoutSubviews];
  [(WFWidgetConfigurationAttributionView *)self _configureAttributedString];
}

- (void)_configureAttributedString
{
  id v3 = [(NSMutableAttributedString *)self->_widgetAttributedString length];
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", NSForegroundColorAttributeName, 0, v3);
  -[NSMutableAttributedString removeAttribute:range:](self->_widgetAttributedString, "removeAttribute:range:", NSFontAttributeName, 0, v3);
  widgetAttributedString = self->_widgetAttributedString;
  v5 = [(WFWidgetConfigurationAttributionView *)self _attributionFont];
  -[NSMutableAttributedString addAttribute:value:range:](widgetAttributedString, "addAttribute:value:range:", NSFontAttributeName, v5, 0, v3);

  v6 = self->_widgetAttributedString;
  id v7 = [(WFWidgetConfigurationAttributionView *)self _paragraphStyle];
  -[NSMutableAttributedString addAttribute:value:range:](v6, "addAttribute:value:range:", NSParagraphStyleAttributeName, v7, 0, v3);

  v8 = [(WFWidgetConfigurationAttributionView *)self _attributionTitleColor];
  -[NSMutableAttributedString addAttribute:value:range:](self->_widgetAttributedString, "addAttribute:value:range:", NSForegroundColorAttributeName, v8, 0, v3);
  v11[0] = NSForegroundColorAttributeName;
  v11[1] = NSUnderlineStyleAttributeName;
  v12[0] = v8;
  v12[1] = &off_10002DF70;
  v11[2] = NSUnderlineColorAttributeName;
  v9 = [v8 colorWithAlphaComponent:0.4];
  v12[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [(WFWidgetConfigurationAttributionView *)self setLinkTextAttributes:v10];

  [(WFWidgetConfigurationAttributionView *)self setAttributedText:self->_widgetAttributedString];
  [(WFWidgetConfigurationAttributionView *)self invalidateIntrinsicContentSize];
}

- (id)_paragraphStyle
{
  id v2 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v2 setAlignment:1];
  return v2;
}

- (id)_attributionTitleColor
{
  return +[UIColor colorWithWhite:0.258823529 alpha:1.0];
}

- (id)_attributionBackgroundColor
{
  return +[UIColor clearColor];
}

- (id)_attributionFont
{
  id v2 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleFootnote];
  id v3 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryLarge];
  v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote compatibleWithTraitCollection:v3];
  v5 = [v2 scaledFontForFont:v4 maximumPointSize:28.0];

  return v5;
}

- (WFWidgetConfigurationAttributionView)initWithWidgetAttributionAttributedString:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWidgetConfigurationAttributionView;
  v5 = -[WFWidgetConfigurationAttributionView initWithFrame:textContainer:](&v12, "initWithFrame:textContainer:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (NSMutableAttributedString *)[objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v4];
    widgetAttributedString = v5->_widgetAttributedString;
    v5->_widgetAttributedString = v6;

    [(WFWidgetConfigurationAttributionView *)v5 _configureAttributedString];
    v8 = [(WFWidgetConfigurationAttributionView *)v5 _attributionBackgroundColor];
    [(WFWidgetConfigurationAttributionView *)v5 setBackgroundColor:v8];

    [(WFWidgetConfigurationAttributionView *)v5 setOpaque:0];
    [(WFWidgetConfigurationAttributionView *)v5 setEditable:0];
    [(WFWidgetConfigurationAttributionView *)v5 setScrollEnabled:0];
    [(WFWidgetConfigurationAttributionView *)v5 _setInteractiveTextSelectionDisabled:0];
    [(WFWidgetConfigurationAttributionView *)v5 setAdjustsFontForContentSizeCategory:1];
    -[WFWidgetConfigurationAttributionView setTextContainerInset:](v5, "setTextContainerInset:", 8.0, 16.0, 12.0, 16.0);
    [(WFWidgetConfigurationAttributionView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v11.receiver = v5;
    v11.super_class = (Class)WFWidgetConfigurationAttributionView;
    [(WFWidgetConfigurationAttributionView *)&v11 setDelegate:v5];
    v9 = v5;
  }

  return v5;
}

- (WFWidgetConfigurationAttributionView)initWithLegacyWidgetAttributionAttributedString:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000182F0;
  v30 = sub_100018300;
  id v31 = 0;
  if (objc_msgSend(v4, "containsAttachmentsInRange:", 0, v5))
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100018308;
    v23[3] = &unk_10002D668;
    v25 = &v26;
    id v24 = v4;
    objc_msgSend(v24, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v5, 0, v23);
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000182F0;
  v21 = sub_100018300;
  id v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001838C;
  v13[3] = &unk_10002D690;
  v15 = &v26;
  v16 = &v17;
  id v6 = v4;
  id v14 = v6;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", NSLinkAttributeName, 0, v5, 0, v13);
  if (v18[5] || v27[5])
  {
    id v7 = objc_alloc((Class)NSMutableAttributedString);
    v8 = sub_100019F54(@"Data provided by ");
    id v9 = [v7 initWithString:v8];

    uint64_t v10 = v18[5];
    if (!v10) {
      uint64_t v10 = v27[5];
    }
    [v9 appendAttributedString:v10];
  }
  else
  {
    id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v6];
  }
  objc_super v11 = [(WFWidgetConfigurationAttributionView *)self initWithWidgetAttributionAttributedString:v9];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v26, 8);

  return v11;
}

+ (id)attributionViewForAppBundleIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.stocks"])
  {
    id v4 = objc_alloc((Class)NSMutableAttributedString);
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    id v5 = (void (*)(void))off_100035810;
    v25 = off_100035810;
    if (!off_100035810)
    {
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_1000187F4;
      v20 = &unk_10002D6E0;
      v21 = &v22;
      sub_1000187F4(&v17);
      id v5 = (void (*)(void))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (v5)
    {
      id v6 = v5();
      id v7 = [v4 initWithAttributedString:v6];

      id v8 = [v7 length];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100018978;
      v15[3] = &unk_10002D640;
      id v16 = v7;
      id v9 = v7;
      objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v8, 0, v15);
      uint64_t v10 = [[WFWidgetConfigurationAttributionView alloc] initWithLegacyWidgetAttributionAttributedString:v9];

LABEL_14:
      goto LABEL_15;
    }
    v13 = +[NSAssertionHandler currentHandler];
    id v14 = +[NSString stringWithUTF8String:"NSAttributedString *WFStocksAttributionString(void)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"WFWidgetConfigurationAttributionView.m", 22, @"%s", dlerror());
    goto LABEL_20;
  }
  if ([v3 isEqualToString:@"com.apple.weather"])
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2020000000;
    objc_super v11 = (void (*)(void))off_100035820;
    v25 = off_100035820;
    if (!off_100035820)
    {
      uint64_t v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_100018A54;
      v20 = &unk_10002D6E0;
      v21 = &v22;
      sub_100018A54(&v17);
      objc_super v11 = (void (*)(void))v23[3];
    }
    _Block_object_dispose(&v22, 8);
    if (v11)
    {
      v11();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if ([v9 length]) {
        uint64_t v10 = [[WFWidgetConfigurationAttributionView alloc] initWithWidgetAttributionAttributedString:v9];
      }
      else {
        uint64_t v10 = 0;
      }
      goto LABEL_14;
    }
    v13 = +[NSAssertionHandler currentHandler];
    id v14 = +[NSString stringWithUTF8String:"NSAttributedString *WFWAAttributionString(void)"];
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"WFWidgetConfigurationAttributionView.m", 25, @"%s", dlerror());
LABEL_20:

    __break(1u);
    return result;
  }
  uint64_t v10 = 0;
LABEL_15:

  return v10;
}

@end
@interface NCSchedulerViewHeader
+ (double)preferredHeightForWidth:(double)a3;
+ (id)_font;
+ (id)_text;
+ (id)reuseIdentifier;
- (NCSchedulerViewHeader)initWithFrame:(CGRect)a3;
@end

@implementation NCSchedulerViewHeader

- (NCSchedulerViewHeader)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)NCSchedulerViewHeader;
  v3 = -[NCSchedulerViewHeader initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_label setNumberOfLines:0];
    v7 = v3->_label;
    v8 = [(id)objc_opt_class() _text];
    [(UILabel *)v7 setText:v8];

    v9 = v3->_label;
    v10 = [(id)objc_opt_class() _font];
    [(UILabel *)v9 setFont:v10];

    v11 = v3->_label;
    v12 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v11 setTextColor:v12];

    [(NCSchedulerViewHeader *)v3 addSubview:v3->_label];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = [(UILabel *)v3->_label centerYAnchor];
    v15 = [(NCSchedulerViewHeader *)v3 centerYAnchor];
    v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
    [v13 addObject:v16];

    v17 = [(UILabel *)v3->_label leadingAnchor];
    v18 = [(NCSchedulerViewHeader *)v3 leadingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:12.0];
    [v13 addObject:v19];

    v20 = [(NCSchedulerViewHeader *)v3 trailingAnchor];
    v21 = [(UILabel *)v3->_label trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:12.0];
    [v13 addObject:v22];

    [MEMORY[0x1E4F28DC8] activateConstraints:v13];
  }
  return v3;
}

+ (id)reuseIdentifier
{
  return @"NCSchedulerViewHeader";
}

+ (double)preferredHeightForWidth:(double)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!preferredHeightForWidth____drawingContext)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4FB0860]);
    v6 = (void *)preferredHeightForWidth____drawingContext;
    preferredHeightForWidth____drawingContext = (uint64_t)v5;

    [(id)preferredHeightForWidth____drawingContext setWantsNumberOfLineFragments:1];
  }
  v7 = [(id)objc_opt_class() _text];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  v8 = [a1 _font];
  v12[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 1, v9, preferredHeightForWidth____drawingContext, fmax(a3 + -24.0, 0.0), 0.0);
  CGRectGetHeight(v13);

  _NCMainScreenScale();
  UICeilToScale();
  if (result < 30.0) {
    return 30.0;
  }
  return result;
}

+ (id)_font
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (id)_text
{
  v2 = NCUserNotificationsUIKitFrameworkBundle();
  v3 = [v2 localizedStringForKey:@"NOTIFICATION_DIGEST_ONBOARDING_SCHEDULER_ITEM_HEADER" value:&stru_1F2F516F8 table:0];
  id v4 = [v3 localizedUppercaseString];

  return v4;
}

- (void).cxx_destruct
{
}

@end
@interface PRComplicationEmptyStateView
- (PRComplicationEmptyStateView)initWithFrame:(CGRect)a3;
@end

@implementation PRComplicationEmptyStateView

- (PRComplicationEmptyStateView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PRComplicationEmptyStateView;
  v3 = -[PRComplicationEmptyStateView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v30 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2950] weight:*MEMORY[0x1E4FB09E0]];
    v35 = [MEMORY[0x1E4FB1830] configurationWithFont:v30];
    id v4 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.circle.fill" withConfiguration:v35];
    v6 = [MEMORY[0x1E4FB1618] whiteColor];
    v34 = [v5 imageWithTintColor:v6];

    v33 = v4;
    [v4 setImage:v34];
    v31 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v4];
    v7 = PRBundle();
    v8 = [v7 localizedStringForKey:@"EDIT_COMPLICATIONS_PROMPT" value:&stru_1ED9A3120 table:@"PosterKit"];
    v32 = [v8 localizedUppercaseString];

    v29 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v32];
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"%@ %@"];
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithFormat:options:locale:", v28, 0, 0, v31, v29);
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v9 setFont:v30];
    [v9 setTextAlignment:1];
    [v9 setAdjustsFontSizeToFitWidth:1];
    [v9 setAttributedText:v27];
    v10 = [MEMORY[0x1E4FB1618] whiteColor];
    [v9 setTextColor:v10];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setAdjustsFontForContentSizeCategory:1];
    [v9 setNumberOfLines:0];
    [(PRComplicationEmptyStateView *)v3 addSubview:v9];
    v21 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [v9 leadingAnchor];
    v25 = [(PRComplicationEmptyStateView *)v3 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v37[0] = v24;
    v23 = [v9 trailingAnchor];
    v22 = [(PRComplicationEmptyStateView *)v3 trailingAnchor];
    v11 = [v23 constraintEqualToAnchor:v22];
    v37[1] = v11;
    v12 = [v9 topAnchor];
    v13 = [(PRComplicationEmptyStateView *)v3 topAnchor];
    [v12 constraintEqualToAnchor:v13];
    v15 = v14 = v3;
    v37[2] = v15;
    v16 = [v9 bottomAnchor];
    v17 = [(PRComplicationEmptyStateView *)v14 bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];
    v37[3] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
    [v21 activateConstraints:v19];

    v3 = v14;
    [(PRComplicationEmptyStateView *)v14 setUserInteractionEnabled:0];
  }
  return v3;
}

@end
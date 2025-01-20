@interface VUIDebugMetricsEventCell
- (NSString)eventTypeLabelStr;
- (NSString)subhead1LabelStr;
- (NSString)subhead2LabelStr;
- (NSString)subhead3LabelStr;
- (NSString)tabName;
- (UIImage)tabImage;
- (UIImageView)tabImageView;
- (VUIDebugMetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (VUILabel)eventTypeLabel;
- (VUILabel)subhead1Label;
- (VUILabel)subhead2Label;
- (VUILabel)subhead3Label;
- (VUILabel)tabNameLabel;
- (VUISeparatorView)separatorView;
- (VUITextLayout)eventTypeLabelLayout;
- (VUITextLayout)subhead1LabelLayout;
- (VUITextLayout)subhead2LabelLayout;
- (VUITextLayout)subhead3LabelLayout;
- (VUITextLayout)tabNameLabelLayout;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setEventTypeLabel:(id)a3;
- (void)setEventTypeLabelLayout:(id)a3;
- (void)setEventTypeLabelStr:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSubhead1Label:(id)a3;
- (void)setSubhead1LabelColor:(id)a3;
- (void)setSubhead1LabelLayout:(id)a3;
- (void)setSubhead1LabelStr:(id)a3;
- (void)setSubhead2Label:(id)a3;
- (void)setSubhead2LabelColor:(id)a3;
- (void)setSubhead2LabelLayout:(id)a3;
- (void)setSubhead2LabelStr:(id)a3;
- (void)setSubhead3Label:(id)a3;
- (void)setSubhead3LabelColor:(id)a3;
- (void)setSubhead3LabelLayout:(id)a3;
- (void)setSubhead3LabelStr:(id)a3;
- (void)setTabImage:(id)a3;
- (void)setTabImageView:(id)a3;
- (void)setTabName:(id)a3;
- (void)setTabNameLabel:(id)a3;
- (void)setTabNameLabelLayout:(id)a3;
@end

@implementation VUIDebugMetricsEventCell

- (VUIDebugMetricsEventCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v52.receiver = self;
  v52.super_class = (Class)VUIDebugMetricsEventCell;
  v4 = [(VUIDebugMetricsEventCell *)&v52 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v5 setNumberOfLines:1];
    [(VUITextLayout *)v5 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v5 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v5 setTextStyle:3];
    [(VUITextLayout *)v5 setMaximumContentSizeCategory:3];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v5 setColor:v6];

    [(VUITextLayout *)v5 setFontWeight:7];
    eventTypeLabelLayout = v4->_eventTypeLabelLayout;
    v4->_eventTypeLabelLayout = v5;
    v51 = v5;

    uint64_t v8 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v51 existingLabel:0];
    eventTypeLabel = v4->_eventTypeLabel;
    v4->_eventTypeLabel = (VUILabel *)v8;

    v10 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v10 addSubview:v4->_eventTypeLabel];

    v11 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v11 setNumberOfLines:1];
    [(VUITextLayout *)v11 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v11 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v11 setTextStyle:17];
    [(VUITextLayout *)v11 setMaximumContentSizeCategory:3];
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v11 setColor:v12];

    subhead1LabelLayout = v4->_subhead1LabelLayout;
    v4->_subhead1LabelLayout = v11;
    v14 = v11;

    uint64_t v15 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v14 existingLabel:0];
    subhead1Label = v4->_subhead1Label;
    v4->_subhead1Label = (VUILabel *)v15;

    v17 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v17 addSubview:v4->_subhead1Label];

    v18 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v18 setNumberOfLines:1];
    [(VUITextLayout *)v18 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v18 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v18 setTextStyle:17];
    [(VUITextLayout *)v18 setMaximumContentSizeCategory:3];
    v19 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v18 setColor:v19];

    subhead2LabelLayout = v4->_subhead2LabelLayout;
    v4->_subhead2LabelLayout = v18;
    v21 = v18;

    uint64_t v22 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v21 existingLabel:0];
    subhead2Label = v4->_subhead2Label;
    v4->_subhead2Label = (VUILabel *)v22;

    v24 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v24 addSubview:v4->_subhead2Label];

    v25 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v25 setNumberOfLines:1];
    [(VUITextLayout *)v25 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v25 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v25 setTextStyle:17];
    [(VUITextLayout *)v25 setMaximumContentSizeCategory:3];
    v26 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v25 setColor:v26];

    subhead3LabelLayout = v4->_subhead3LabelLayout;
    v4->_subhead3LabelLayout = v25;
    v28 = v25;

    uint64_t v29 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v21 existingLabel:0];
    subhead3Label = v4->_subhead3Label;
    v4->_subhead3Label = (VUILabel *)v29;

    v31 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v31 addSubview:v4->_subhead3Label];

    v32 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v32 setNumberOfLines:1];
    [(VUITextLayout *)v32 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v32 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v32 setTextStyle:3];
    [(VUITextLayout *)v32 setMaximumContentSizeCategory:3];
    v33 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v32 setColor:v33];

    tabNameLabelLayout = v4->_tabNameLabelLayout;
    v4->_tabNameLabelLayout = v32;
    v35 = v32;

    uint64_t v36 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v35 existingLabel:0];
    tabNameLabel = v4->_tabNameLabel;
    v4->_tabNameLabel = (VUILabel *)v36;

    v38 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v38 addSubview:v4->_tabNameLabel];

    id v39 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v40 = *MEMORY[0x1E4F1DB28];
    double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v44 = objc_msgSend(v39, "initWithFrame:", *MEMORY[0x1E4F1DB28], v41, v42, v43);
    tabImageView = v4->_tabImageView;
    v4->_tabImageView = (UIImageView *)v44;

    v46 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v46 addSubview:v4->_tabImageView];

    v47 = -[VUISeparatorView initWithFrame:]([VUISeparatorView alloc], "initWithFrame:", v40, v41, v42, v43);
    separatorView = v4->_separatorView;
    v4->_separatorView = v47;

    v49 = [(VUIDebugMetricsEventCell *)v4 contentView];
    [v49 addSubview:v4->_separatorView];
  }
  return v4;
}

- (void)setEventTypeLabelStr:(id)a3
{
  v4 = (NSString *)[a3 copy];
  eventTypeLabelStr = self->_eventTypeLabelStr;
  self->_eventTypeLabelStr = v4;

  [(VUILabel *)self->_eventTypeLabel setText:self->_eventTypeLabelStr];
  [(VUIDebugMetricsEventCell *)self setNeedsLayout];
}

- (void)setSubhead1LabelStr:(id)a3
{
  v4 = (NSString *)[a3 copy];
  subhead1LabelStr = self->_subhead1LabelStr;
  self->_subhead1LabelStr = v4;

  [(VUILabel *)self->_subhead1Label setText:self->_subhead1LabelStr];
  [(VUIDebugMetricsEventCell *)self setNeedsLayout];
}

- (void)setSubhead2LabelStr:(id)a3
{
  v4 = (NSString *)[a3 copy];
  subhead2LabelStr = self->_subhead2LabelStr;
  self->_subhead2LabelStr = v4;

  [(VUILabel *)self->_subhead2Label setText:self->_subhead2LabelStr];
  [(VUIDebugMetricsEventCell *)self setNeedsLayout];
}

- (void)setSubhead3LabelStr:(id)a3
{
  v4 = (NSString *)[a3 copy];
  subhead3LabelStr = self->_subhead3LabelStr;
  self->_subhead3LabelStr = v4;

  [(VUILabel *)self->_subhead3Label setText:self->_subhead3LabelStr];
  [(VUIDebugMetricsEventCell *)self setNeedsLayout];
}

- (void)setSubhead1LabelColor:(id)a3
{
}

- (void)setSubhead2LabelColor:(id)a3
{
}

- (void)setSubhead3LabelColor:(id)a3
{
}

- (void)setTabName:(id)a3
{
  v4 = (NSString *)[a3 copy];
  tabName = self->_tabName;
  self->_tabName = v4;

  [(VUILabel *)self->_tabNameLabel setText:self->_tabName];
  [(VUIDebugMetricsEventCell *)self setNeedsLayout];
}

- (UIImage)tabImage
{
  return [(UIImageView *)self->_tabImageView image];
}

- (void)setTabImage:(id)a3
{
}

- (void)layoutSubviews
{
  [(VUIDebugMetricsEventCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v12 = v11;
  double v14 = v13;
  v70.origin.x = v4;
  v70.origin.y = v6;
  v70.size.width = v8;
  v70.size.height = v10;
  CGFloat Width = CGRectGetWidth(v70);
  v16 = (CGFloat *)MEMORY[0x1E4F1DB28];
  double v64 = v14;
  double v17 = Width - v12 - v14;
  CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v71.origin.x = v4;
  v71.origin.y = v6;
  v71.size.width = v8;
  v71.size.height = v10;
  -[VUILabel sizeThatFits:](self->_eventTypeLabel, "sizeThatFits:", v17, CGRectGetHeight(v71));
  double v55 = v20;
  double v56 = v19;
  v72.origin.x = v4;
  v72.origin.y = v6;
  v72.size.width = v8;
  v72.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead1Label, "sizeThatFits:", v17, CGRectGetHeight(v72));
  double v22 = v21;
  double v54 = v23;
  v73.origin.x = v4;
  v73.origin.y = v6;
  v73.size.width = v8;
  v73.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead2Label, "sizeThatFits:", v17, CGRectGetHeight(v73));
  double v60 = v25;
  double recta = v24;
  v74.origin.x = v4;
  v74.origin.y = v6;
  v74.size.width = v8;
  v74.size.height = v10;
  -[VUILabel sizeThatFits:](self->_subhead3Label, "sizeThatFits:", v17, CGRectGetHeight(v74));
  double v57 = v27;
  double v58 = v26;
  CGFloat v65 = v6;
  CGFloat v66 = v4;
  v75.origin.x = v4;
  v75.origin.y = v6;
  CGFloat v67 = v10;
  CGFloat v68 = v8;
  v75.size.width = v8;
  v75.size.height = v10;
  double Height = CGRectGetHeight(v75);
  v76.origin.x = v12;
  v76.origin.y = v18;
  v76.size.width = v56;
  v76.size.height = v55;
  double v29 = CGRectGetHeight(v76);
  v77.origin.x = v12;
  v77.origin.y = v18;
  v77.size.width = v22;
  v77.size.height = v54;
  double v30 = v29 + CGRectGetHeight(v77);
  v78.origin.x = v12;
  v78.origin.y = v18;
  v78.size.width = v22;
  v78.size.height = v54;
  CGFloat v31 = (Height - (v30 + CGRectGetHeight(v78))) * 0.5;
  -[VUILabel setFrame:](self->_eventTypeLabel, "setFrame:", v12, v31, v56, v55);
  v79.origin.x = v12;
  v79.origin.y = v31;
  v79.size.width = v56;
  v79.size.height = v55;
  CGFloat v32 = v31 + CGRectGetHeight(v79) + 5.0;
  -[VUILabel setFrame:](self->_subhead1Label, "setFrame:", v12, v32, v22, v54);
  v80.origin.x = v12;
  v80.origin.y = v18;
  v80.size.width = recta;
  v80.size.height = v60;
  CGFloat v33 = v32 + CGRectGetHeight(v80);
  -[VUILabel setFrame:](self->_subhead2Label, "setFrame:", v12, v33, recta, v60);
  v81.origin.x = v12;
  CGFloat rect = v18;
  v81.origin.y = v18;
  v81.size.width = v58;
  v81.size.height = v57;
  double v61 = v12;
  -[VUILabel setFrame:](self->_subhead3Label, "setFrame:", v12, v33 + CGRectGetHeight(v81), v58, v57);
  NSUInteger v34 = [(NSString *)self->_tabName length];
  CGFloat v35 = *v16;
  if (v34)
  {
    CGFloat v37 = v65;
    CGFloat v36 = v66;
    v82.origin.x = v66;
    v82.origin.y = v65;
    v82.size.width = v8;
    v82.size.height = v67;
    -[VUILabel sizeThatFits:](self->_tabNameLabel, "sizeThatFits:", v17, CGRectGetHeight(v82));
    CGFloat v39 = v38;
    double v59 = v38;
    double v41 = v40;
    v83.origin.x = v66;
    v83.origin.y = v65;
    v83.size.width = v8;
    v83.size.height = v67;
    CGFloat v42 = CGRectGetWidth(v83) - v64;
    v84.origin.x = v35;
    v84.origin.y = rect;
    v84.size.width = v39;
    v84.size.height = v41;
    CGFloat v43 = v42 - CGRectGetWidth(v84);
    v85.origin.x = v66;
    v85.origin.y = v65;
    v85.size.width = v8;
    v85.size.height = v67;
    double v44 = CGRectGetHeight(v85);
    v86.origin.x = v43;
    v86.origin.y = rect;
    v86.size.width = v59;
    v86.size.height = v41;
    -[VUILabel setFrame:](self->_tabNameLabel, "setFrame:", v43, (v44 - CGRectGetHeight(v86)) * 0.5, v59, v41);
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_tabImageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v46 = v45;
    double v48 = v47;
    CGFloat v37 = v65;
    CGFloat v36 = v66;
    v87.origin.x = v66;
    v87.origin.y = v65;
    v87.size.width = v8;
    v87.size.height = v67;
    double v49 = CGRectGetHeight(v87);
    v88.origin.x = v35;
    v88.origin.y = rect;
    v88.size.width = v46;
    v88.size.height = v48;
    CGFloat v50 = (v49 - CGRectGetHeight(v88)) * 0.5;
    v89.origin.x = v66;
    v89.origin.y = v65;
    v89.size.width = v8;
    v89.size.height = v67;
    CGFloat v51 = CGRectGetWidth(v89) - v64;
    v90.origin.x = v35;
    v90.origin.y = v50;
    v90.size.width = v46;
    v90.size.height = v48;
    -[UIImageView setFrame:](self->_tabImageView, "setFrame:", v51 - CGRectGetWidth(v90), v50, v46, v48);
  }
  [(UIImageView *)self->_tabImageView setHidden:[(NSString *)self->_tabName length] != 0];
  [(VUILabel *)self->_tabNameLabel setHidden:[(NSString *)self->_tabName length] == 0];
  separatorView = self->_separatorView;
  v91.origin.x = v36;
  v91.origin.y = v37;
  v91.size.height = v67;
  v91.size.width = v68;
  double v53 = CGRectGetHeight(v91) + -1.0;
  -[VUISeparatorView setFrame:](separatorView, "setFrame:", v61, v53, v17, 1.0);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)VUIDebugMetricsEventCell;
  [(VUIDebugMetricsEventCell *)&v3 prepareForReuse];
  [(VUILabel *)self->_eventTypeLabel setText:0];
  [(VUILabel *)self->_subhead1Label setText:0];
  [(VUILabel *)self->_subhead2Label setText:0];
  [(VUILabel *)self->_subhead3Label setText:0];
  [(UIImageView *)self->_tabImageView setImage:0];
}

- (NSString)eventTypeLabelStr
{
  return self->_eventTypeLabelStr;
}

- (NSString)subhead1LabelStr
{
  return self->_subhead1LabelStr;
}

- (NSString)subhead2LabelStr
{
  return self->_subhead2LabelStr;
}

- (NSString)subhead3LabelStr
{
  return self->_subhead3LabelStr;
}

- (NSString)tabName
{
  return self->_tabName;
}

- (VUILabel)eventTypeLabel
{
  return self->_eventTypeLabel;
}

- (void)setEventTypeLabel:(id)a3
{
}

- (VUITextLayout)eventTypeLabelLayout
{
  return self->_eventTypeLabelLayout;
}

- (void)setEventTypeLabelLayout:(id)a3
{
}

- (VUILabel)subhead1Label
{
  return self->_subhead1Label;
}

- (void)setSubhead1Label:(id)a3
{
}

- (VUITextLayout)subhead1LabelLayout
{
  return self->_subhead1LabelLayout;
}

- (void)setSubhead1LabelLayout:(id)a3
{
}

- (VUILabel)subhead2Label
{
  return self->_subhead2Label;
}

- (void)setSubhead2Label:(id)a3
{
}

- (VUITextLayout)subhead2LabelLayout
{
  return self->_subhead2LabelLayout;
}

- (void)setSubhead2LabelLayout:(id)a3
{
}

- (VUILabel)subhead3Label
{
  return self->_subhead3Label;
}

- (void)setSubhead3Label:(id)a3
{
}

- (VUITextLayout)subhead3LabelLayout
{
  return self->_subhead3LabelLayout;
}

- (void)setSubhead3LabelLayout:(id)a3
{
}

- (VUILabel)tabNameLabel
{
  return self->_tabNameLabel;
}

- (void)setTabNameLabel:(id)a3
{
}

- (VUITextLayout)tabNameLabelLayout
{
  return self->_tabNameLabelLayout;
}

- (void)setTabNameLabelLayout:(id)a3
{
}

- (UIImageView)tabImageView
{
  return self->_tabImageView;
}

- (void)setTabImageView:(id)a3
{
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_tabImageView, 0);
  objc_storeStrong((id *)&self->_tabNameLabelLayout, 0);
  objc_storeStrong((id *)&self->_tabNameLabel, 0);
  objc_storeStrong((id *)&self->_subhead3LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead3Label, 0);
  objc_storeStrong((id *)&self->_subhead2LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead2Label, 0);
  objc_storeStrong((id *)&self->_subhead1LabelLayout, 0);
  objc_storeStrong((id *)&self->_subhead1Label, 0);
  objc_storeStrong((id *)&self->_eventTypeLabelLayout, 0);
  objc_storeStrong((id *)&self->_eventTypeLabel, 0);
  objc_storeStrong((id *)&self->_tabName, 0);
  objc_storeStrong((id *)&self->_subhead3LabelStr, 0);
  objc_storeStrong((id *)&self->_subhead2LabelStr, 0);
  objc_storeStrong((id *)&self->_subhead1LabelStr, 0);
  objc_storeStrong((id *)&self->_eventTypeLabelStr, 0);
}

@end
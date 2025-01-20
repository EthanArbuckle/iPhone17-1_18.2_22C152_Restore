@interface VUIDebugMetricsImpressionTableViewCell
- (NSString)idStr;
- (NSString)idType;
- (NSString)impressionId;
- (NSString)impressionIndex;
- (NSString)impressionParentId;
- (NSString)impressionParentName;
- (NSString)name;
- (NSString)type;
- (VUIDebugMetricsImpressionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (VUILabel)idLabel;
- (VUILabel)idTypeLabel;
- (VUILabel)impressionIdLabel;
- (VUILabel)impressionIndexLabel;
- (VUILabel)impressionParentIdLabel;
- (VUILabel)impressionParentNameLabel;
- (VUILabel)nameLabel;
- (VUILabel)staticIDLabel;
- (VUILabel)staticImpressionIdLabel;
- (VUILabel)staticImpressionIndexLabel;
- (VUILabel)staticImpressionParentLabel;
- (VUILabel)typeLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setIdLabel:(id)a3;
- (void)setIdStr:(id)a3;
- (void)setIdType:(id)a3;
- (void)setIdTypeLabel:(id)a3;
- (void)setImpressionId:(id)a3;
- (void)setImpressionIdLabel:(id)a3;
- (void)setImpressionIndex:(id)a3;
- (void)setImpressionIndexLabel:(id)a3;
- (void)setImpressionParentId:(id)a3;
- (void)setImpressionParentIdLabel:(id)a3;
- (void)setImpressionParentName:(id)a3;
- (void)setImpressionParentNameLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setStaticIDLabel:(id)a3;
- (void)setStaticImpressionIdLabel:(id)a3;
- (void)setStaticImpressionIndexLabel:(id)a3;
- (void)setStaticImpressionParentLabel:(id)a3;
- (void)setType:(id)a3;
- (void)setTypeLabel:(id)a3;
@end

@implementation VUIDebugMetricsImpressionTableViewCell

- (VUIDebugMetricsImpressionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v48.receiver = self;
  v48.super_class = (Class)VUIDebugMetricsImpressionTableViewCell;
  v4 = [(VUIDebugMetricsImpressionTableViewCell *)&v48 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v5 setNumberOfLines:1];
    [(VUITextLayout *)v5 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v5 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v5 setFontSize:20.0];
    [(VUITextLayout *)v5 setFontWeight:6];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v5 setColor:v6];

    uint64_t v7 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v5 existingLabel:0];
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = (VUILabel *)v7;

    v9 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_nameLabel];

    v10 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v10 setNumberOfLines:1];
    [(VUITextLayout *)v10 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v10 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v10 setFontSize:18.0];
    v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v10 setColor:v11];

    uint64_t v12 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v10 existingLabel:0];
    typeLabel = v4->_typeLabel;
    v4->_typeLabel = (VUILabel *)v12;

    v14 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_typeLabel];

    v15 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v15 setNumberOfLines:1];
    [(VUITextLayout *)v15 setNumberOfLinesAXSmall:1];
    [(VUITextLayout *)v15 setNumberOfLinesAXLarge:1];
    [(VUITextLayout *)v10 setFontSize:15.0];
    v16 = [MEMORY[0x1E4FB1618] blackColor];
    [(VUITextLayout *)v15 setColor:v16];

    uint64_t v17 = +[VUILabel labelWithString:@"id: " textLayout:v15 existingLabel:0];
    staticIDLabel = v4->_staticIDLabel;
    v4->_staticIDLabel = (VUILabel *)v17;

    v19 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v19 addSubview:v4->_staticIDLabel];

    uint64_t v20 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    idLabel = v4->_idLabel;
    v4->_idLabel = (VUILabel *)v20;

    v22 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v22 addSubview:v4->_idLabel];

    uint64_t v23 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    idTypeLabel = v4->_idTypeLabel;
    v4->_idTypeLabel = (VUILabel *)v23;

    v25 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v25 addSubview:v4->_idTypeLabel];

    uint64_t v26 = +[VUILabel labelWithString:@"Impression Id: " textLayout:v15 existingLabel:0];
    staticImpressionIdLabel = v4->_staticImpressionIdLabel;
    v4->_staticImpressionIdLabel = (VUILabel *)v26;

    v28 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v28 addSubview:v4->_staticImpressionIdLabel];

    uint64_t v29 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    impressionIdLabel = v4->_impressionIdLabel;
    v4->_impressionIdLabel = (VUILabel *)v29;

    v31 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v31 addSubview:v4->_impressionIdLabel];

    uint64_t v32 = +[VUILabel labelWithString:@"Index: " textLayout:v15 existingLabel:0];
    staticImpressionIndexLabel = v4->_staticImpressionIndexLabel;
    v4->_staticImpressionIndexLabel = (VUILabel *)v32;

    v34 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v34 addSubview:v4->_staticImpressionIndexLabel];

    uint64_t v35 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    impressionIndexLabel = v4->_impressionIndexLabel;
    v4->_impressionIndexLabel = (VUILabel *)v35;

    v37 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v37 addSubview:v4->_impressionIndexLabel];

    uint64_t v38 = +[VUILabel labelWithString:@"Parent: " textLayout:v15 existingLabel:0];
    staticImpressionParentLabel = v4->_staticImpressionParentLabel;
    v4->_staticImpressionParentLabel = (VUILabel *)v38;

    v40 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v40 addSubview:v4->_staticImpressionParentLabel];

    uint64_t v41 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    impressionParentIdLabel = v4->_impressionParentIdLabel;
    v4->_impressionParentIdLabel = (VUILabel *)v41;

    v43 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v43 addSubview:v4->_impressionParentIdLabel];

    uint64_t v44 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v15 existingLabel:0];
    impressionParentNameLabel = v4->_impressionParentNameLabel;
    v4->_impressionParentNameLabel = (VUILabel *)v44;

    v46 = [(VUIDebugMetricsImpressionTableViewCell *)v4 contentView];
    [v46 addSubview:v4->_impressionParentNameLabel];
  }
  return v4;
}

- (NSString)name
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self nameLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self nameLabel];
  [v5 setText:v4];
}

- (NSString)type
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self typeLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setType:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self typeLabel];
  [v5 setText:v4];
}

- (NSString)idStr
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self idLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setIdStr:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self idLabel];
  [v5 setText:v4];
}

- (NSString)idType
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self idTypeLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setIdType:(id)a3
{
  id v4 = a3;
  id v6 = [(VUIDebugMetricsImpressionTableViewCell *)self idTypeLabel];
  id v5 = [NSString stringWithFormat:@"(%@)", v4];

  [v6 setText:v5];
}

- (NSString)impressionId
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIdLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImpressionId:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIdLabel];
  [v5 setText:v4];
}

- (NSString)impressionIndex
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIndexLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImpressionIndex:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIndexLabel];
  [v5 setText:v4];
}

- (NSString)impressionParentId
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentIdLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImpressionParentId:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentIdLabel];
  [v5 setText:v4];
}

- (NSString)impressionParentName
{
  v2 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentNameLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImpressionParentName:(id)a3
{
  id v4 = a3;
  id v6 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentNameLabel];
  id v5 = [NSString stringWithFormat:@"(%@)", v4];

  [v6 setText:v5];
}

- (void)layoutSubviews
{
  [(VUIDebugMetricsImpressionTableViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v12 = v11;
  double v14 = v13;
  v77.origin.x = v4;
  CGFloat rect = v4;
  v77.origin.y = v6;
  v77.size.width = v8;
  v77.size.height = v10;
  CGFloat rect_8 = CGRectGetWidth(v77) - v12 - v14;
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v78.origin.x = v4;
  v78.origin.y = v6;
  v78.size.width = v8;
  v78.size.height = v10;
  -[VUILabel sizeThatFits:](self->_nameLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v78));
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  -[VUILabel setFrame:](self->_nameLabel, "setFrame:", v12, v15, v16, v18);
  v79.origin.x = v12;
  v79.origin.y = v15;
  v79.size.width = v17;
  v79.size.height = v19;
  CGFloat v20 = v15 + CGRectGetHeight(v79);
  v80.origin.x = rect;
  v80.origin.y = v6;
  v80.size.width = v8;
  v80.size.height = v10;
  -[VUILabel sizeThatFits:](self->_typeLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v80));
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  -[VUILabel setFrame:](self->_typeLabel, "setFrame:", v12, v20, v21, v23);
  v81.origin.x = v12;
  v81.origin.y = v20;
  v81.size.width = v22;
  v81.size.height = v24;
  CGFloat v25 = v20 + CGRectGetHeight(v81);
  v82.origin.x = rect;
  v82.origin.y = v6;
  v82.size.width = v8;
  v82.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticIDLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v82));
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  -[VUILabel setFrame:](self->_staticIDLabel, "setFrame:", v12, v25, v26, v28);
  v83.origin.x = v12;
  v83.origin.y = v25;
  v83.size.width = v27;
  v83.size.height = v29;
  CGFloat v30 = v12 + CGRectGetWidth(v83) + 5.0;
  v84.size.width = v8;
  v84.origin.x = rect;
  v84.origin.y = v6;
  v84.size.height = v10;
  -[VUILabel sizeThatFits:](self->_idLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v84));
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  -[VUILabel setFrame:](self->_idLabel, "setFrame:", v30, v25, v31, v33);
  v85.origin.x = v30;
  v85.origin.y = v25;
  v85.size.width = v32;
  v85.size.height = v34;
  CGFloat v72 = v30 + CGRectGetWidth(v85) + 5.0;
  v86.origin.x = rect;
  v86.origin.y = v6;
  v86.size.width = v8;
  v86.size.height = v10;
  -[VUILabel sizeThatFits:](self->_idTypeLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v86));
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  -[VUILabel setFrame:](self->_idTypeLabel, "setFrame:", v72, v25, v35, v37);
  v87.origin.x = v12;
  v87.origin.y = v25;
  v87.size.width = v36;
  v87.size.height = v38;
  CGFloat v39 = v25 + CGRectGetHeight(v87);
  v88.origin.x = rect;
  v88.origin.y = v6;
  v88.size.width = v8;
  v88.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v88));
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  -[VUILabel setFrame:](self->_staticImpressionIdLabel, "setFrame:", v12, v39, v40, v42);
  v89.origin.x = v12;
  v89.origin.y = v39;
  v89.size.width = v41;
  v89.size.height = v43;
  double v44 = v12 + CGRectGetWidth(v89) + 5.0;
  v90.origin.x = rect;
  v90.origin.y = v6;
  v90.size.width = v8;
  v90.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v90));
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  -[VUILabel setFrame:](self->_impressionIdLabel, "setFrame:", v44, v39, v45, v47);
  v91.origin.x = v12;
  v91.origin.y = v39;
  v91.size.width = v46;
  v91.size.height = v48;
  CGFloat v49 = v39 + CGRectGetHeight(v91);
  v92.origin.x = rect;
  v92.origin.y = v6;
  v92.size.width = v8;
  v92.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionIndexLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v92));
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  -[VUILabel setFrame:](self->_staticImpressionIndexLabel, "setFrame:", v12, v49, v50, v52);
  v93.origin.x = v12;
  v93.origin.y = v49;
  v93.size.width = v51;
  v93.size.height = v53;
  double v73 = v12 + CGRectGetWidth(v93) + 5.0;
  v94.origin.x = rect;
  v94.origin.y = v6;
  v94.size.width = v8;
  v94.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionIndexLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v94));
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  -[VUILabel setFrame:](self->_impressionIndexLabel, "setFrame:", v73, v49, v54, v56);
  v95.origin.x = v12;
  v95.origin.y = v49;
  v95.size.width = v55;
  v95.size.height = v57;
  double v58 = v49 + CGRectGetHeight(v95);
  v96.origin.x = rect;
  v96.origin.y = v6;
  v96.size.width = v8;
  v96.size.height = v10;
  -[VUILabel sizeThatFits:](self->_staticImpressionParentLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v96));
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  -[VUILabel setFrame:](self->_staticImpressionParentLabel, "setFrame:", v12, v58, v59, v61);
  v97.origin.x = v12;
  v97.origin.y = v58;
  v97.size.width = v60;
  v97.size.height = v62;
  CGFloat v63 = v12 + CGRectGetWidth(v97) + 5.0;
  v98.origin.x = rect;
  v98.origin.y = v6;
  v98.size.width = v8;
  v98.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionParentIdLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v98));
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  -[VUILabel setFrame:](self->_impressionParentIdLabel, "setFrame:", v63, v58, v64, v66);
  v99.origin.x = v63;
  v99.origin.y = v58;
  v99.size.width = v65;
  v99.size.height = v67;
  double v68 = v63 + CGRectGetWidth(v99) + 5.0;
  v100.origin.x = rect;
  v100.origin.y = v6;
  v100.size.width = v8;
  v100.size.height = v10;
  -[VUILabel sizeThatFits:](self->_impressionParentNameLabel, "sizeThatFits:", rect_8, CGRectGetHeight(v100));
  impressionParentNameLabel = self->_impressionParentNameLabel;
  -[VUILabel setFrame:](impressionParentNameLabel, "setFrame:", v68, v58, v69, v70);
}

- (void)prepareForReuse
{
  v11.receiver = self;
  v11.super_class = (Class)VUIDebugMetricsImpressionTableViewCell;
  [(VUIDebugMetricsImpressionTableViewCell *)&v11 prepareForReuse];
  double v3 = [(VUIDebugMetricsImpressionTableViewCell *)self nameLabel];
  [v3 setText:&stru_1F3E921E0];

  CGFloat v4 = [(VUIDebugMetricsImpressionTableViewCell *)self typeLabel];
  [v4 setText:&stru_1F3E921E0];

  double v5 = [(VUIDebugMetricsImpressionTableViewCell *)self idLabel];
  [v5 setText:&stru_1F3E921E0];

  CGFloat v6 = [(VUIDebugMetricsImpressionTableViewCell *)self idTypeLabel];
  [v6 setText:&stru_1F3E921E0];

  double v7 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIdLabel];
  [v7 setText:&stru_1F3E921E0];

  CGFloat v8 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionIndexLabel];
  [v8 setText:&stru_1F3E921E0];

  double v9 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentIdLabel];
  [v9 setText:&stru_1F3E921E0];

  CGFloat v10 = [(VUIDebugMetricsImpressionTableViewCell *)self impressionParentNameLabel];
  [v10 setText:&stru_1F3E921E0];
}

- (VUILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (VUILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (VUILabel)staticIDLabel
{
  return self->_staticIDLabel;
}

- (void)setStaticIDLabel:(id)a3
{
}

- (VUILabel)idLabel
{
  return self->_idLabel;
}

- (void)setIdLabel:(id)a3
{
}

- (VUILabel)idTypeLabel
{
  return self->_idTypeLabel;
}

- (void)setIdTypeLabel:(id)a3
{
}

- (VUILabel)staticImpressionIdLabel
{
  return self->_staticImpressionIdLabel;
}

- (void)setStaticImpressionIdLabel:(id)a3
{
}

- (VUILabel)impressionIdLabel
{
  return self->_impressionIdLabel;
}

- (void)setImpressionIdLabel:(id)a3
{
}

- (VUILabel)staticImpressionIndexLabel
{
  return self->_staticImpressionIndexLabel;
}

- (void)setStaticImpressionIndexLabel:(id)a3
{
}

- (VUILabel)impressionIndexLabel
{
  return self->_impressionIndexLabel;
}

- (void)setImpressionIndexLabel:(id)a3
{
}

- (VUILabel)staticImpressionParentLabel
{
  return self->_staticImpressionParentLabel;
}

- (void)setStaticImpressionParentLabel:(id)a3
{
}

- (VUILabel)impressionParentIdLabel
{
  return self->_impressionParentIdLabel;
}

- (void)setImpressionParentIdLabel:(id)a3
{
}

- (VUILabel)impressionParentNameLabel
{
  return self->_impressionParentNameLabel;
}

- (void)setImpressionParentNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionParentNameLabel, 0);
  objc_storeStrong((id *)&self->_impressionParentIdLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionParentLabel, 0);
  objc_storeStrong((id *)&self->_impressionIndexLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionIndexLabel, 0);
  objc_storeStrong((id *)&self->_impressionIdLabel, 0);
  objc_storeStrong((id *)&self->_staticImpressionIdLabel, 0);
  objc_storeStrong((id *)&self->_idTypeLabel, 0);
  objc_storeStrong((id *)&self->_idLabel, 0);
  objc_storeStrong((id *)&self->_staticIDLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
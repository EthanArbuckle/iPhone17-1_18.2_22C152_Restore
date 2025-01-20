@interface UIPrintingMessageView
- (id)initInView:(id)a3 title:(id)a4;
- (void)setMessage:(id)a3;
@end

@implementation UIPrintingMessageView

- (id)initInView:(id)a3 title:(id)a4
{
  v41[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 bounds];
  v33.receiver = self;
  v33.super_class = (Class)UIPrintingMessageView;
  v8 = -[UIPrintingMessageView initWithFrame:](&v33, sel_initWithFrame_);
  p_isa = (id *)&v8->super.super.super.isa;
  if (v8)
  {
    [(UIPrintingMessageView *)v8 setAutoresizingMask:18];
    [p_isa setHidden:1];
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v11 = p_isa[51];
    p_isa[51] = v10;

    [p_isa[51] setBackgroundColor:0];
    [p_isa[51] setOpaque:0];
    [p_isa[51] setNumberOfLines:0];
    [p_isa[51] setTranslatesAutoresizingMaskIntoConstraints:0];
    id v12 = objc_alloc_init(MEMORY[0x1E4FB1378]);
    [v12 setLineBreakMode:0];
    [v12 setAlignment:1];
    [v12 setMinimumLineHeight:28.0];
    id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
    v40[0] = *MEMORY[0x1E4FB12B0];
    v14 = [MEMORY[0x1E4FB1798] systemFontOfSize:20.0];
    v41[0] = v14;
    v40[1] = *MEMORY[0x1E4FB12B8];
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v40[2] = *MEMORY[0x1E4FB12D0];
    v41[1] = v15;
    v41[2] = v12;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
    v17 = (void *)[v13 initWithString:v7 attributes:v16];
    [p_isa[51] setAttributedText:v17];

    [p_isa addSubview:p_isa[51]];
    id v18 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    id v19 = p_isa[52];
    p_isa[52] = v18;

    v20 = [MEMORY[0x1E4FB1798] systemFontOfSize:17.5];
    [p_isa[52] setFont:v20];

    v21 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [p_isa[52] setTextColor:v21];

    [p_isa[52] setBackgroundColor:0];
    [p_isa[52] setOpaque:0];
    [p_isa[52] setTextAlignment:1];
    [p_isa[52] setTranslatesAutoresizingMaskIntoConstraints:0];
    [p_isa addSubview:p_isa[52]];
    [v6 addSubview:p_isa];
    v22 = (void *)MEMORY[0x1E4F28DC8];
    v38 = @"title";
    id v39 = p_isa[51];
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    v24 = [v22 constraintsWithVisualFormat:@"H:|-[title]-|" options:0 metrics:0 views:v23];
    [p_isa addConstraints:v24];

    v25 = (void *)MEMORY[0x1E4F28DC8];
    v36 = @"message";
    id v37 = p_isa[52];
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    v27 = [v25 constraintsWithVisualFormat:@"H:|-[message]-|" options:0 metrics:0 views:v26];
    [p_isa addConstraints:v27];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v34[0] = @"title";
    id v29 = p_isa[51];
    v34[1] = @"message";
    v35[0] = v29;
    v35[1] = p_isa[52];
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    v31 = [v28 constraintsWithVisualFormat:@"V:|-114-[title]-22-[message]" options:0 metrics:0 views:v30];
    [p_isa addConstraints:v31];
  }
  return p_isa;
}

- (void)setMessage:(id)a3
{
  [(UILabel *)self->_message setText:a3];
  [(UIPrintingMessageView *)self setNeedsUpdateConstraints];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
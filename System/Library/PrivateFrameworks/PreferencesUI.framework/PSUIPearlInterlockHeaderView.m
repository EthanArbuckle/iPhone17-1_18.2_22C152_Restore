@interface PSUIPearlInterlockHeaderView
- (NSURL)interlockURL;
- (PSUIPearlInterlockHeaderView)initWithFrame:(CGRect)a3;
- (double)heightForWidth:(double)a3;
- (void)setInterlockURL:(id)a3;
@end

@implementation PSUIPearlInterlockHeaderView

- (PSUIPearlInterlockHeaderView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)PSUIPearlInterlockHeaderView;
  v3 = -[PSUIPearlInterlockHeaderView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = NSURL;
    v5 = PSUI_LocalizedStringForPasscodeLock(@"FACE_ID_HELP_LINK");
    v6 = [v4 URLWithString:v5];
    [(PSUIPearlInterlockHeaderView *)v3 setInterlockURL:v6];

    v38 = PSLocalizablePearlStringForKey();
    v7 = PSLocalizablePearlStringForKey();
    v8 = [MEMORY[0x263F827E8] imageNamed:@"FaceID_warning"];
    id v9 = objc_alloc(MEMORY[0x263F82828]);
    [v8 size];
    double v11 = v10;
    v39 = v8;
    [v8 size];
    id firstValue = (id)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0, v11, v12);
    [firstValue setImage:v8];
    [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PSUIPearlInterlockHeaderView *)v3 addSubview:firstValue];
    v13 = objc_opt_new();
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setText:v38];
    uint64_t v14 = *MEMORY[0x263F83570];
    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v13 setFont:v15];

    [v13 setTextAlignment:1];
    [v13 setNumberOfLines:0];
    [(PSUIPearlInterlockHeaderView *)v3 addSubview:v13];
    v16 = objc_opt_new();
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [MEMORY[0x263F825C8] clearColor];
    [v16 setBackgroundColor:v17];

    [v16 setShowsVerticalScrollIndicator:0];
    [v16 setEditable:0];
    [v16 setSelectable:1];
    [v16 setScrollEnabled:0];
    [v16 _setInteractiveTextSelectionDisabled:1];
    id v37 = v7;
    uint64_t v18 = [v37 length];
    v19 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v37];

    id v36 = objc_alloc_init(MEMORY[0x263F81650]);
    [v36 setAlignment:1];
    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x263F81540], v36, 0, v18);
    uint64_t v20 = *MEMORY[0x263F814F0];
    v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:v14];
    objc_msgSend(v19, "addAttribute:value:range:", v20, v21, 0, v18);

    uint64_t v22 = *MEMORY[0x263F81500];
    v23 = [MEMORY[0x263F825C8] systemBlueColor];
    objc_msgSend(v19, "addAttribute:value:range:", v22, v23, 0, v18);

    uint64_t v24 = *MEMORY[0x263F81520];
    v25 = [(PSUIPearlInterlockHeaderView *)v3 interlockURL];
    objc_msgSend(v19, "addAttribute:value:range:", v24, v25, 0, v18);

    objc_msgSend(v19, "addAttribute:value:range:", *MEMORY[0x263F815F8], MEMORY[0x263EFFA80], 0, v18);
    [v16 setAttributedText:v19];
    [(PSUIPearlInterlockHeaderView *)v3 addSubview:v16];
    v26 = _NSDictionaryOfVariableBindings(&cfstr_Warningimagevi.isa, firstValue, v13, v16, 0);
    v27 = NSNumber;
    [firstValue bounds];
    v29 = [v27 numberWithDouble:v28];
    v30 = _NSDictionaryOfVariableBindings(&cfstr_Warningimagehe.isa, v29, 0);
    v31 = (void *)MEMORY[0x263F08938];
    v32 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|-[interlockMessage]-|" options:0 metrics:0 views:v26];
    [v31 activateConstraints:v32];

    v33 = (void *)MEMORY[0x263F08938];
    v34 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-40-[warningImageView(==warningImageHeight)]-25-[interlockMessage][interlockLink]|" options:512 metrics:v30 views:v26];
    [v33 activateConstraints:v34];
  }
  return v3;
}

- (double)heightForWidth:(double)a3
{
  LODWORD(v3) = 1148846080;
  LODWORD(v4) = 1112014848;
  -[PSUIPearlInterlockHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 0.0, v3, v4);
  return v5;
}

- (NSURL)interlockURL
{
  return self->_interlockURL;
}

- (void)setInterlockURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
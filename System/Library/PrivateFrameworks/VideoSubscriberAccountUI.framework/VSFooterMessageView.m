@interface VSFooterMessageView
- (NSString)primaryMessage;
- (NSString)secondaryMessage;
- (NSString)tertiaryMessage;
- (VSFontCenter)fontCenter;
- (VSFooterMessageView)initWithSpecifier:(id)a3;
- (double)preferredHeightForWidth:(double)a3;
- (void)dealloc;
- (void)setFontCenter:(id)a3;
- (void)setPrimaryMessage:(id)a3;
- (void)setSecondaryMessage:(id)a3;
- (void)setTertiaryMessage:(id)a3;
@end

@implementation VSFooterMessageView

- (VSFooterMessageView)initWithSpecifier:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  VSRequireMainThread();
  v5 = -[VSFooterMessageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    v6 = [[VSFontCenter alloc] initWithTraitEnvironment:v5];
    fontCenter = v5->_fontCenter;
    v5->_fontCenter = v6;

    v8 = [v4 propertyForKey:@"VSFooterPrimaryMessage"];
    uint64_t v9 = [v8 copy];
    primaryMessage = v5->_primaryMessage;
    v5->_primaryMessage = (NSString *)v9;

    v11 = [v4 propertyForKey:@"VSFooterSecondaryMessage"];
    uint64_t v12 = [v11 copy];
    secondaryMessage = v5->_secondaryMessage;
    v5->_secondaryMessage = (NSString *)v12;

    v14 = [v4 propertyForKey:@"VSFooterTertiaryMessage"];
    uint64_t v15 = [v14 copy];
    tertiaryMessage = v5->_tertiaryMessage;
    v5->_tertiaryMessage = (NSString *)v15;

    id v17 = objc_alloc_init(MEMORY[0x263F1C768]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v65 = objc_alloc_init(MEMORY[0x263F1C768]);
    v66 = v17;
    v72[0] = v17;
    v72[1] = v65;
    id v64 = objc_alloc_init(MEMORY[0x263F1C768]);
    v72[2] = v64;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:3];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v67 objects:v73 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          [v23 setNumberOfLines:0];
          [v23 setTextAlignment:1];
          [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(VSFooterMessageView *)v5 addSubview:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v67 objects:v73 count:16];
      }
      while (v20);
    }

    [v66 setText:v5->_primaryMessage];
    [v65 setText:v5->_secondaryMessage];
    [v64 setText:v5->_tertiaryMessage];
    v24 = v5->_fontCenter;
    v25 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v66, "vs_bind:toObject:withKeyPath:options:", @"font", v24, @"bodyFont", v25);

    v26 = v5->_fontCenter;
    v27 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v65, "vs_bind:toObject:withKeyPath:options:", @"font", v26, @"footnoteFont", v27);

    v28 = v5->_fontCenter;
    v29 = VSMainConcurrencyBindingOptions();
    objc_msgSend(v64, "vs_bind:toObject:withKeyPath:options:", @"font", v28, @"footnoteFont", v29);

    id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
    v31 = [v66 topAnchor];
    v32 = [(VSFooterMessageView *)v5 topAnchor];
    v33 = [v31 constraintEqualToAnchor:v32];
    [v30 addObject:v33];

    v34 = [v64 bottomAnchor];
    v35 = [(VSFooterMessageView *)v5 bottomAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    [v30 addObject:v36];

    v37 = [v66 lastBaselineAnchor];
    v38 = [v65 firstBaselineAnchor];
    v39 = [v37 constraintEqualToAnchor:v38 constant:-48.0];
    [v30 addObject:v39];

    v40 = [v65 lastBaselineAnchor];
    v41 = [v64 firstBaselineAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:-43.0];
    [v30 addObject:v42];

    v43 = [v66 centerXAnchor];
    v44 = [(VSFooterMessageView *)v5 centerXAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v30 addObject:v45];

    v46 = [v65 centerXAnchor];
    v47 = [(VSFooterMessageView *)v5 centerXAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];
    [v30 addObject:v48];

    v49 = [v64 centerXAnchor];
    v50 = [(VSFooterMessageView *)v5 centerXAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v30 addObject:v51];

    v52 = [v66 widthAnchor];
    v53 = [(VSFooterMessageView *)v5 widthAnchor];
    v54 = [v52 constraintLessThanOrEqualToAnchor:v53 constant:-40.0];
    [v30 addObject:v54];

    v55 = [v65 widthAnchor];
    v56 = [(VSFooterMessageView *)v5 widthAnchor];
    v57 = [v55 constraintLessThanOrEqualToAnchor:v56 constant:-40.0];
    [v30 addObject:v57];

    v58 = [v64 widthAnchor];
    v59 = [(VSFooterMessageView *)v5 widthAnchor];
    v60 = [v58 constraintLessThanOrEqualToAnchor:v59 constant:-40.0];
    [v30 addObject:v60];

    [MEMORY[0x263F08938] activateConstraints:v30];
    uint64_t v71 = objc_opt_class();
    v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v71 count:1];
    id v62 = (id)[(VSFooterMessageView *)v5 registerForTraitChanges:v61 withHandler:&__block_literal_global_17];
  }
  return v5;
}

void __41__VSFooterMessageView_initWithSpecifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 fontCenter];
  v3 = [v2 traitCollection];

  [v4 setTraitCollection:v3];
}

- (void)dealloc
{
  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSFooterMessageView;
  [(VSFooterMessageView *)&v3 dealloc];
}

- (double)preferredHeightForWidth:(double)a3
{
  LODWORD(v3) = 1144766464;
  LODWORD(v4) = 1.0;
  -[VSFooterMessageView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, 1.79769313e308, v3, v4);
  return v5;
}

- (NSString)primaryMessage
{
  return self->_primaryMessage;
}

- (void)setPrimaryMessage:(id)a3
{
}

- (NSString)secondaryMessage
{
  return self->_secondaryMessage;
}

- (void)setSecondaryMessage:(id)a3
{
}

- (NSString)tertiaryMessage
{
  return self->_tertiaryMessage;
}

- (void)setTertiaryMessage:(id)a3
{
}

- (VSFontCenter)fontCenter
{
  return self->_fontCenter;
}

- (void)setFontCenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontCenter, 0);
  objc_storeStrong((id *)&self->_tertiaryMessage, 0);
  objc_storeStrong((id *)&self->_secondaryMessage, 0);
  objc_storeStrong((id *)&self->_primaryMessage, 0);
}

@end
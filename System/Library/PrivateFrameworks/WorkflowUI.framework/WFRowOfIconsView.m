@interface WFRowOfIconsView
- (CGSize)intrinsicContentSize;
- (NSMutableArray)iconViews;
- (UIStackView)stackView;
- (WFRowOfIconsView)initWithMaxNumberOfIcons:(unint64_t)a3 height:(double)a4;
- (double)height;
- (unint64_t)maxNumberOfIcons;
- (void)rebuildSubviewsForItems:(id)a3;
@end

@implementation WFRowOfIconsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

- (double)height
{
  return self->_height;
}

- (NSMutableArray)iconViews
{
  return self->_iconViews;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (unint64_t)maxNumberOfIcons
{
  return self->_maxNumberOfIcons;
}

- (void)rebuildSubviewsForItems:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v5 = [(WFRowOfIconsView *)self iconViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v11 = [(WFRowOfIconsView *)self stackView];
        [v11 removeArrangedSubview:v10];

        [v10 removeFromSuperview];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v7);
  }

  v12 = [(WFRowOfIconsView *)self iconViews];
  [v12 removeAllObjects];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  unint64_t v13 = [v4 count];
  unint64_t v14 = [(WFRowOfIconsView *)self maxNumberOfIcons];
  if (v13 >= v14) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = v13;
  }
  v31 = v4;
  v16 = objc_msgSend(v4, "subarrayWithRange:", 0, v15);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v22 = (objc_class *)MEMORY[0x263F879A8];
          id v23 = v21;
          uint64_t v24 = objc_msgSend([v22 alloc], "initWithIcon:size:", v23, 29.0, 29.0);
LABEL_20:
          v26 = v24;

          [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
          v27 = [(WFRowOfIconsView *)self stackView];
          [v27 addArrangedSubview:v26];

          id v28 = [(WFRowOfIconsView *)self iconViews];
          [v28 addObject:v26];
LABEL_21:

          goto LABEL_22;
        }
        if ([v21 conformsToProtocol:&unk_26E252EF0])
        {
          v25 = (Class (__cdecl *)())getHUTriggerIconViewClass_15768;
          id v23 = v21;
          uint64_t v24 = [objc_alloc(v25()) initWithIconDescriptor:v23];
          goto LABEL_20;
        }
        v26 = getWFTriggersLogObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v29 = objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v41 = "-[WFRowOfIconsView rebuildSubviewsForItems:]";
          __int16 v42 = 2112;
          v43 = v29;
          __int16 v44 = 2112;
          v45 = v21;
          id v28 = v29;
          _os_log_impl(&dword_22D994000, v26, OS_LOG_TYPE_ERROR, "%s Unexpected item class (%@): %@", buf, 0x20u);
          goto LABEL_21;
        }
LABEL_22:

        ++v20;
      }
      while (v18 != v20);
      uint64_t v30 = [v16 countByEnumeratingWithState:&v32 objects:v46 count:16];
      uint64_t v18 = v30;
    }
    while (v30);
  }

  [(WFRowOfIconsView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  [(WFRowOfIconsView *)self height];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (WFRowOfIconsView)initWithMaxNumberOfIcons:(unint64_t)a3 height:(double)a4
{
  v29[4] = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)WFRowOfIconsView;
  uint64_t v6 = -[WFRowOfIconsView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_height = a4;
    v6->_maxNumberOfIcons = a3;
    uint64_t v8 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    stackView = v7->_stackView;
    v7->_stackView = v8;

    [(UIStackView *)v7->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v7->_stackView setAxis:0];
    [(UIStackView *)v7->_stackView setAlignment:3];
    [(UIStackView *)v7->_stackView setDistribution:3];
    [(UIStackView *)v7->_stackView setSpacing:0.0];
    [(WFRowOfIconsView *)v7 addSubview:v7->_stackView];
    id v23 = (void *)MEMORY[0x263F08938];
    v27 = [(UIStackView *)v7->_stackView topAnchor];
    v26 = [(WFRowOfIconsView *)v7 topAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v29[0] = v25;
    uint64_t v24 = [(UIStackView *)v7->_stackView bottomAnchor];
    v10 = [(WFRowOfIconsView *)v7 bottomAnchor];
    v11 = [v24 constraintEqualToAnchor:v10];
    v29[1] = v11;
    v12 = [(UIStackView *)v7->_stackView leadingAnchor];
    unint64_t v13 = [(WFRowOfIconsView *)v7 leadingAnchor];
    unint64_t v14 = [v12 constraintEqualToAnchor:v13];
    v29[2] = v14;
    unint64_t v15 = [(UIStackView *)v7->_stackView trailingAnchor];
    v16 = [(WFRowOfIconsView *)v7 trailingAnchor];
    uint64_t v17 = [v15 constraintLessThanOrEqualToAnchor:v16];
    v29[3] = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:4];
    [v23 activateConstraints:v18];

    uint64_t v19 = objc_opt_new();
    iconViews = v7->_iconViews;
    v7->_iconViews = (NSMutableArray *)v19;

    v21 = v7;
  }

  return v7;
}

@end
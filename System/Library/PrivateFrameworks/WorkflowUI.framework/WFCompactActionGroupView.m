@interface WFCompactActionGroupView
- (NSArray)actions;
- (WFCompactActionGroupView)initWithActions:(id)a3 appearanceProvider:(id)a4;
- (WFCompactAppearanceProvider)appearanceProvider;
- (void)layoutSubviews;
- (void)setActions:(id)a3;
- (void)setAppearanceProvider:(id)a3;
- (void)tintColorDidChange;
@end

@implementation WFCompactActionGroupView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appearanceProvider, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (WFCompactAppearanceProvider)appearanceProvider
{
  return self->_appearanceProvider;
}

- (void)setActions:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setAppearanceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_appearanceProvider, a3);
  id v5 = a3;
  [v5 configureActionGroupView:self];
}

- (void)tintColorDidChange
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(WFCompactActionGroupView *)self actions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 dialogButton];
        uint64_t v10 = [v9 style];

        if (!v10)
        {
          v11 = [(WFCompactActionGroupView *)self tintColor];
          v12 = [v8 uiButton];
          [v12 setBackgroundColor:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)WFCompactActionGroupView;
  [(WFCompactActionGroupView *)&v22 layoutSubviews];
  v3 = [(WFCompactActionGroupView *)self actions];
  uint64_t v4 = [v3 count];

  if (v4 == 2)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v5 = [(WFCompactActionGroupView *)self actions];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) uiButton];
          v12 = [v11 titleLabel];
          [v12 intrinsicContentSize];
          double v14 = v13 + 4.0;
          [(WFCompactActionGroupView *)self frame];
          double v16 = v15 * 0.5 + -22.5;

          if (v14 >= v16) {
            char v9 = 0;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v7);

      if ((v9 & 1) == 0) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v17 = 0;
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v17 = 1;
LABEL_15:
  [(WFCompactActionGroupView *)self setAxis:v17];
}

- (WFCompactActionGroupView)initWithActions:(id)a3 appearanceProvider:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v51.receiver = self;
  v51.super_class = (Class)WFCompactActionGroupView;
  uint64_t v8 = [(WFCompactActionGroupView *)&v51 init];
  char v9 = v8;
  if (v8)
  {
    id v40 = v7;
    [(WFCompactActionGroupView *)v8 setAppearanceProvider:v7];
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v41 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v11);
          }
          double v16 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          uint64_t v17 = [v16 dialogButton];
          uint64_t v18 = [v17 style];

          if (v18 == 1) {
            [v10 insertObject:v16 atIndex:0];
          }
          else {
            [v10 addObject:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v13);
    }

    v39 = v10;
    uint64_t v19 = [v10 copy];
    actions = v9->_actions;
    v9->_actions = (NSArray *)v19;

    [(WFCompactActionGroupView *)v9 setAutoresizingMask:18];
    [(WFCompactActionGroupView *)v9 setSpacing:11.0];
    -[WFCompactActionGroupView setLayoutMargins:](v9, "setLayoutMargins:", 11.0, 15.0, 15.0, 15.0);
    [(WFCompactActionGroupView *)v9 setDistribution:1];
    [(WFCompactActionGroupView *)v9 setLayoutMarginsRelativeArrangement:1];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    obuint64_t j = [(WFCompactActionGroupView *)v9 actions];
    uint64_t v21 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v44;
      unint64_t v24 = *MEMORY[0x263F83430];
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v44 != v23) {
            objc_enumerationMutation(obj);
          }
          v26 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          v27 = [(WFCompactActionGroupView *)v9 appearanceProvider];
          [v26 setAppearanceProvider:v27];

          v28 = [v26 uiButton];
          [(WFCompactActionGroupView *)v9 addArrangedSubview:v28];
          v29 = [(WFCompactActionGroupView *)v9 traitCollection];
          v30 = [v29 preferredContentSizeCategory];

          v31 = [v28 heightAnchor];
          if ((unint64_t)v30 >= v24)
          {
            v34 = [v28 titleLabel];
            v35 = [v34 heightAnchor];
            v36 = [v31 constraintEqualToAnchor:v35 constant:25.0];
            [v36 setActive:1];
          }
          else
          {
            int v32 = [MEMORY[0x263EFFA40] universalPreviewsEnabled];
            double v33 = 50.0;
            if (v32) {
              double v33 = 52.0;
            }
            v34 = [v31 constraintEqualToConstant:v33];
            [v34 setActive:1];
          }
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v22);
    }

    v37 = v9;
    id v7 = v40;
    id v6 = v41;
  }

  return v9;
}

@end
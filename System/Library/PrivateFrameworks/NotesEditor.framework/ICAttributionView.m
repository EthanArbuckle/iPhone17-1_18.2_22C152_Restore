@interface ICAttributionView
- (ICAttributionView)initWithConfiguration:(id)a3;
- (ICAttributionViewConfiguration)configuration;
- (NSMapTable)childAttributionViews;
- (NSMapTable)highlightViews;
- (UIImageView)disclosureImageView;
- (UIImageView)statusImageView;
- (UILabel)attributionLabel;
- (UILabel)timestampLabel;
- (UIView)attributionClippingView;
- (void)setAttributionClippingView:(id)a3;
- (void)setAttributionLabel:(id)a3;
- (void)setChildAttributionViews:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisclosureImageView:(id)a3;
- (void)setHighlightViews:(id)a3;
- (void)setStatusImageView:(id)a3;
- (void)setTimestampLabel:(id)a3;
- (void)updateContentAnimated:(BOOL)a3;
- (void)updatePositionAndVisibility;
- (void)updateVisibility;
@end

@implementation ICAttributionView

- (ICAttributionView)initWithConfiguration:(id)a3
{
  id v5 = a3;
  [v5 adjustedFrame];
  v30.receiver = self;
  v30.super_class = (Class)ICAttributionView;
  v6 = -[ICAttributionView initWithFrame:](&v30, sel_initWithFrame_);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [v5 attributionFrame];
    [v5 attributionFrame];
    id v8 = objc_alloc(MEMORY[0x263F82E00]);
    [(ICAttributionView *)v7 frame];
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", 0.0, 0.0);
    attributionClippingView = v7->_attributionClippingView;
    v7->_attributionClippingView = (UIView *)v9;

    v11 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorBackgroundColor");
    [(UIView *)v7->_attributionClippingView setBackgroundColor:v11];

    [(ICAttributionView *)v7 insertSubview:v7->_attributionClippingView atIndex:0];
    id v12 = objc_alloc(MEMORY[0x263F828E0]);
    [v5 attributionFrame];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    attributionLabel = v7->_attributionLabel;
    v7->_attributionLabel = (UILabel *)v13;

    [(UILabel *)v7->_attributionLabel setTextAlignment:2];
    [(UILabel *)v7->_attributionLabel setLineBreakMode:5];
    [(ICAttributionView *)v7 addSubview:v7->_attributionLabel];
    id v15 = objc_alloc(MEMORY[0x263F828E0]);
    [v5 adjustedFormattedTimestampFrame];
    uint64_t v16 = objc_msgSend(v15, "initWithFrame:");
    timestampLabel = v7->_timestampLabel;
    v7->_timestampLabel = (UILabel *)v16;

    [(UILabel *)v7->_timestampLabel setTextAlignment:2];
    [(ICAttributionView *)v7 insertSubview:v7->_timestampLabel atIndex:0];
    id v18 = objc_alloc(MEMORY[0x263F82828]);
    [v5 disclosureImageFrame];
    uint64_t v19 = objc_msgSend(v18, "initWithFrame:");
    disclosureImageView = v7->_disclosureImageView;
    v7->_disclosureImageView = (UIImageView *)v19;

    [(UIImageView *)v7->_disclosureImageView setContentMode:4];
    v21 = [MEMORY[0x263F825C8] placeholderTextColor];
    [(UIImageView *)v7->_disclosureImageView setTintColor:v21];

    [(ICAttributionView *)v7 addSubview:v7->_disclosureImageView];
    id v22 = objc_alloc(MEMORY[0x263F82828]);
    [v5 statusImageFrame];
    uint64_t v23 = objc_msgSend(v22, "initWithFrame:");
    statusImageView = v7->_statusImageView;
    v7->_statusImageView = (UIImageView *)v23;

    [(UIImageView *)v7->_statusImageView setContentMode:4];
    [(ICAttributionView *)v7 addSubview:v7->_statusImageView];
    uint64_t v25 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
    childAttributionViews = v7->_childAttributionViews;
    v7->_childAttributionViews = (NSMapTable *)v25;

    uint64_t v27 = [MEMORY[0x263F08968] mapTableWithKeyOptions:0 valueOptions:5];
    highlightViews = v7->_highlightViews;
    v7->_highlightViews = (NSMapTable *)v27;

    [(ICAttributionView *)v7 updateContentAnimated:0];
  }

  return v7;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
  [(ICAttributionView *)self updateContentAnimated:0];

  [(ICAttributionView *)self updatePositionAndVisibility];
}

- (void)updateContentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v122 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v5 = [(ICAttributionView *)self configuration];
    v6 = [v5 attribution];
    v7 = [(ICAttributionView *)self attributionLabel];
    id v8 = [v7 attributedText];
    int v9 = [v6 isEqualToAttributedString:v8];

    v10 = (double *)MEMORY[0x263F5B038];
    if (v9)
    {
      double v11 = *MEMORY[0x263F5B038];
    }
    else
    {
      id v12 = [MEMORY[0x263F15910] animation];
      uint64_t v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
      [v12 setTimingFunction:v13];

      [v12 setType:*MEMORY[0x263F15FD8]];
      double v11 = *v10;
      [v12 setDuration:*v10];
      v14 = [(ICAttributionView *)self attributionLabel];
      id v15 = [v14 layer];
      [v15 addAnimation:v12 forKey:@"kCATransitionFade"];
    }
    v116[0] = MEMORY[0x263EF8330];
    v116[1] = 3221225472;
    v116[2] = __43__ICAttributionView_updateContentAnimated___block_invoke;
    v116[3] = &unk_2640B8140;
    v116[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v116 animations:v11];
  }
  else
  {
    [(ICAttributionView *)self updateVisibility];
  }
  uint64_t v16 = [(ICAttributionView *)self configuration];
  -[ICAttributionView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", [v16 isBlurred] ^ 1);

  v17 = [(ICAttributionView *)self configuration];
  id v18 = [v17 attribution];
  uint64_t v19 = [(ICAttributionView *)self attributionLabel];
  [v19 setAttributedText:v18];

  v20 = [(ICAttributionView *)self configuration];
  uint64_t v21 = [v20 formattedTimestamp];

  id v22 = [(ICAttributionView *)self timestampLabel];
  v95 = (void *)v21;
  [v22 setAttributedText:v21];

  uint64_t v23 = [(ICAttributionView *)self configuration];
  v24 = [v23 disclosureImage];
  uint64_t v25 = [(ICAttributionView *)self disclosureImageView];
  [v25 setImage:v24];

  v26 = [(ICAttributionView *)self configuration];
  uint64_t v27 = [v26 statusImage];
  v28 = [(ICAttributionView *)self statusImageView];
  [v28 setImage:v27];

  v29 = [(ICAttributionView *)self childAttributionViews];
  objc_super v30 = [v29 objectEnumerator];
  v31 = [v30 allObjects];
  uint64_t v32 = objc_msgSend(v31, "ic_map:", &__block_literal_global_12);

  v94 = (void *)v32;
  v33 = [MEMORY[0x263EFFA08] setWithArray:v32];
  v34 = (void *)MEMORY[0x263EFFA08];
  v35 = [(ICAttributionView *)self configuration];
  v36 = [v35 childConfigurations];
  v37 = [v34 setWithArray:v36];
  char v38 = [v33 isEqualToSet:v37];

  if ((v38 & 1) == 0)
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    v39 = [(ICAttributionView *)self childAttributionViews];
    v40 = [v39 objectEnumerator];
    v41 = [v40 allObjects];

    uint64_t v42 = [v41 countByEnumeratingWithState:&v112 objects:v121 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v113 != v44) {
            objc_enumerationMutation(v41);
          }
          [*(id *)(*((void *)&v112 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v112 objects:v121 count:16];
      }
      while (v43);
    }

    v46 = [(ICAttributionView *)self childAttributionViews];
    [v46 removeAllObjects];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v47 = [(ICAttributionView *)self configuration];
    v48 = [v47 childConfigurations];

    uint64_t v49 = [v48 countByEnumeratingWithState:&v108 objects:v120 count:16];
    if (v49)
    {
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)v109;
      do
      {
        for (uint64_t j = 0; j != v50; ++j)
        {
          if (*(void *)v109 != v51) {
            objc_enumerationMutation(v48);
          }
          uint64_t v53 = *(void *)(*((void *)&v108 + 1) + 8 * j);
          v54 = [[ICAttributionView alloc] initWithConfiguration:v53];
          [(ICAttributionView *)self insertSubview:v54 atIndex:0];
          v55 = [(ICAttributionView *)self childAttributionViews];
          [v55 setObject:v54 forKey:v53];
        }
        uint64_t v50 = [v48 countByEnumeratingWithState:&v108 objects:v120 count:16];
      }
      while (v50);
    }
  }
  v56 = [(ICAttributionView *)self highlightViews];
  v57 = [v56 objectEnumerator];
  v58 = [v57 allObjects];
  v59 = objc_msgSend(v58, "ic_map:", &__block_literal_global_25);

  v60 = [MEMORY[0x263EFFA08] setWithArray:v59];
  v61 = (void *)MEMORY[0x263EFFA08];
  v62 = [(ICAttributionView *)self configuration];
  v63 = [v62 highlightConfigurations];
  v64 = [v61 setWithArray:v63];
  char v65 = [v60 isEqualToSet:v64];

  if ((v65 & 1) == 0)
  {
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    v66 = [(ICAttributionView *)self highlightViews];
    v67 = [v66 objectEnumerator];
    v68 = [v67 allObjects];

    uint64_t v69 = [v68 countByEnumeratingWithState:&v104 objects:v119 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v105;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v105 != v71) {
            objc_enumerationMutation(v68);
          }
          [*(id *)(*((void *)&v104 + 1) + 8 * k) removeFromSuperview];
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v104 objects:v119 count:16];
      }
      while (v70);
    }
    v93 = v59;

    v73 = [(ICAttributionView *)self highlightViews];
    [v73 removeAllObjects];

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v74 = [(ICAttributionView *)self configuration];
    v75 = [v74 highlightConfigurations];

    uint64_t v76 = [v75 countByEnumeratingWithState:&v100 objects:v118 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v101;
      do
      {
        for (uint64_t m = 0; m != v77; ++m)
        {
          if (*(void *)v101 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = *(void **)(*((void *)&v100 + 1) + 8 * m);
          v81 = [[ICAttributionHighlightView alloc] initWithConfiguration:v80];
          [v80 alpha];
          -[ICAttributionHighlightView setAlpha:](v81, "setAlpha:");
          [(ICAttributionView *)self addSubview:v81];
          v82 = [(ICAttributionView *)self highlightViews];
          [v82 setObject:v81 forKey:v80];
        }
        uint64_t v77 = [v75 countByEnumeratingWithState:&v100 objects:v118 count:16];
      }
      while (v77);
    }

    v59 = v93;
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  v83 = [(ICAttributionView *)self childAttributionViews];
  v84 = [v83 objectEnumerator];
  v85 = [v84 allObjects];

  uint64_t v86 = [v85 countByEnumeratingWithState:&v96 objects:v117 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v97;
    do
    {
      for (uint64_t n = 0; n != v87; ++n)
      {
        if (*(void *)v97 != v88) {
          objc_enumerationMutation(v85);
        }
        [*(id *)(*((void *)&v96 + 1) + 8 * n) updateContentAnimated:v3];
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v96 objects:v117 count:16];
    }
    while (v87);
  }

  if ([(ICAttributionView *)self ic_isRTL]) {
    uint64_t v90 = 0;
  }
  else {
    uint64_t v90 = 2;
  }
  v91 = [(ICAttributionView *)self attributionLabel];
  [v91 setTextAlignment:v90];

  v92 = [(ICAttributionView *)self timestampLabel];
  [v92 setTextAlignment:v90];
}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateVisibility];
}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 configuration];
}

uint64_t __43__ICAttributionView_updateContentAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 configuration];
}

- (void)updatePositionAndVisibility
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICAttributionView *)self configuration];
  [v3 adjustedFrame];
  -[ICAttributionView setFrame:](self, "setFrame:");

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v4 = [(ICAttributionView *)self configuration];
  id v5 = [v4 childConfigurations];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        double v11 = [(ICAttributionView *)self childAttributionViews];
        id v12 = [v11 objectForKey:v10];

        [v10 adjustedFrame];
        objc_msgSend(v12, "setFrame:");
        [v10 adjustedFormattedTimestampFrame];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        uint64_t v21 = [v12 timestampLabel];
        objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v22 = [(ICAttributionView *)self configuration];
  uint64_t v23 = [v22 highlightConfigurations];

  uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v31 + 1) + 8 * v27);
        v29 = [(ICAttributionView *)self highlightViews];
        objc_super v30 = [v29 objectForKey:v28];

        [v28 adjustedFrame];
        objc_msgSend(v30, "setFrame:");

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }

  [(ICAttributionView *)self updateVisibility];
}

- (void)updateVisibility
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICAttributionView *)self configuration];
  double v4 = (double)([v3 isAttributionHidden] ^ 1);
  id v5 = [(ICAttributionView *)self attributionLabel];
  [v5 setAlpha:v4];

  uint64_t v6 = [(ICAttributionView *)self configuration];
  double v7 = (double)([v6 isAttributionHidden] ^ 1);
  uint64_t v8 = [(ICAttributionView *)self attributionClippingView];
  [v8 setAlpha:v7];

  uint64_t v9 = [(ICAttributionView *)self configuration];
  double v10 = (double)([v9 isTimestampHidden] ^ 1);
  double v11 = [(ICAttributionView *)self timestampLabel];
  [v11 setAlpha:v10];

  id v12 = [(ICAttributionView *)self configuration];
  double v13 = (double)([v12 isStatusImageHidden] ^ 1);
  double v14 = [(ICAttributionView *)self statusImageView];
  [v14 setAlpha:v13];

  double v15 = [(ICAttributionView *)self configuration];
  double v16 = (double)([v15 isDisclosureImageHidden] ^ 1);
  double v17 = [(ICAttributionView *)self disclosureImageView];
  [v17 setAlpha:v16];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v18 = [(ICAttributionView *)self configuration];
  double v19 = [v18 highlightConfigurations];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        [v24 alpha];
        double v26 = v25;
        uint64_t v27 = [(ICAttributionView *)self highlightViews];
        v28 = [v27 objectForKey:v24];
        [v28 setAlpha:v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v21);
  }
}

- (ICAttributionViewConfiguration)configuration
{
  return self->_configuration;
}

- (UILabel)attributionLabel
{
  return self->_attributionLabel;
}

- (void)setAttributionLabel:(id)a3
{
}

- (UIView)attributionClippingView
{
  return self->_attributionClippingView;
}

- (void)setAttributionClippingView:(id)a3
{
}

- (UILabel)timestampLabel
{
  return self->_timestampLabel;
}

- (void)setTimestampLabel:(id)a3
{
}

- (UIImageView)disclosureImageView
{
  return self->_disclosureImageView;
}

- (void)setDisclosureImageView:(id)a3
{
}

- (UIImageView)statusImageView
{
  return self->_statusImageView;
}

- (void)setStatusImageView:(id)a3
{
}

- (NSMapTable)childAttributionViews
{
  return self->_childAttributionViews;
}

- (void)setChildAttributionViews:(id)a3
{
}

- (NSMapTable)highlightViews
{
  return self->_highlightViews;
}

- (void)setHighlightViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightViews, 0);
  objc_storeStrong((id *)&self->_childAttributionViews, 0);
  objc_storeStrong((id *)&self->_statusImageView, 0);
  objc_storeStrong((id *)&self->_disclosureImageView, 0);
  objc_storeStrong((id *)&self->_timestampLabel, 0);
  objc_storeStrong((id *)&self->_attributionClippingView, 0);
  objc_storeStrong((id *)&self->_attributionLabel, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
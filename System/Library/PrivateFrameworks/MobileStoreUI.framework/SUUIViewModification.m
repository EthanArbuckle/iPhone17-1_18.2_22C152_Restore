@interface SUUIViewModification
- (NSArray)views;
- (NSMapTable)allViewTextProperties;
- (SUUIViewModification)initWithViewReusePool:(id)a3;
- (id)_addImageViewWithReuseIdentifier:(id)a3 viewElement:(id)a4 context:(id)a5;
- (id)_attributedStringViewForLayout:(id)a3;
- (id)_itemStateForButton:(id)a3;
- (id)addBadgeViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addBarRatingWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addButtonWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addDividerWithElement:(id)a3 context:(id)a4;
- (id)addHeaderViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addHorizontalListWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addHorizontalLockupWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addImageDeckViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addImageGridViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addImageViewWithElement:(id)a3 context:(id)a4;
- (id)addImageViewWithVideoElement:(id)a3 context:(id)a4;
- (id)addLabelViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addLabelViewWithOrdinalElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addMenuButtonWithTitleItem:(id)a3 width:(double)a4 context:(id)a5;
- (id)addOfferViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addResponseViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addReusableViewWithReuseIdentifier:(id)a3;
- (id)addReviewListTitleViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addStackItemViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addStackListViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addStarRatingControlViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addStarRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addTabularLockupWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addTextViewWithElement:(id)a3 width:(double)a4 context:(id)a5;
- (id)addTomatoRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5;
- (void)_styleItemOfferButton:(id)a3 forElement:(id)a4 context:(id)a5;
- (void)addView:(id)a3;
- (void)setTextProperties:(id)a3 forView:(id)a4;
@end

@implementation SUUIViewModification

- (SUUIViewModification)initWithViewReusePool:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUIViewModification;
  v6 = [(SUUIViewModification *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewPool, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    views = v7->_views;
    v7->_views = v8;
  }
  return v7;
}

- (id)addReusableViewWithReuseIdentifier:(id)a3
{
  v4 = [(SUUIViewReusePool *)self->_viewPool dequeueReusableViewWithReuseIdentifier:a3];
  if (v4) {
    [(NSMutableArray *)self->_views addObject:v4];
  }
  return v4;
}

- (void)addView:(id)a3
{
}

- (void)setTextProperties:(id)a3 forView:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_allViewTextProperties)
  {
    v7 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:1];
    allViewTextProperties = self->_allViewTextProperties;
    self->_allViewTextProperties = v7;
  }
  v9 = self->_allViewTextProperties;
  if (v10) {
    [(NSMapTable *)v9 setObject:v10 forKey:v6];
  }
  else {
    [(NSMapTable *)v9 removeObjectForKey:v6];
  }
}

- (NSMapTable)allViewTextProperties
{
  return self->_allViewTextProperties;
}

- (NSArray)views
{
  return &self->_views->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allViewTextProperties, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_viewPool, 0);
}

- (id)addBadgeViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v8 badgeType] == 1)
  {
    id v10 = [v9 labelLayoutCache];
    objc_super v11 = [v10 layoutForWidth:(uint64_t)a4 viewElement:v8];

    v12 = [(SUUIViewModification *)self _attributedStringViewForLayout:v11];
    [v12 setLayout:v11];
    [v12 setStringTreatment:1];
    v13 = [v8 style];
    v14 = [v13 ikBackgroundColor];
    v15 = [v14 color];
    [v12 setTreatmentColor:v15];

    goto LABEL_16;
  }
  v16 = [v8 resourceName];
  v13 = v16;
  if (v16)
  {
    uint64_t v17 = SUUIImageWithResourceName(v16);
  }
  else
  {
    v18 = [v8 URL];

    if (v18)
    {
      v19 = [v9 requestIdentifierForViewElement:v8];
      if (v19)
      {
        v20 = [v9 resourceLoader];
        objc_super v11 = objc_msgSend(v20, "cachedResourceForRequestIdentifier:", objc_msgSend(v19, "unsignedIntegerValue"));
        if (!v11
          && (objc_msgSend(v20, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v19, "unsignedIntegerValue")) & 1) == 0)
        {
          [v9 loadTemplatedImageForBadgeElement:v8 reason:1];
        }
      }
      else
      {
        [v9 loadTemplatedImageForBadgeElement:v8 reason:1];
        objc_super v11 = 0;
      }

      goto LABEL_15;
    }
    uint64_t v17 = [v8 fallbackImage];
  }
  objc_super v11 = (void *)v17;
LABEL_15:
  v12 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504C90];
  v21 = [v8 accessibilityText];
  [v12 setAccessibilityLabel:v21];

  [v12 setImage:v11];
  [v8 size];
  objc_msgSend(v12, "setImageSize:");
  v22 = [v8 style];
  v23 = SUUIViewElementPlainColorWithStyle(v22, 0);
  [v12 setTintColor:v23];

  [v12 setUserInteractionEnabled:0];
LABEL_16:

  return v12;
}

- (id)addBarRatingWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504BF0];
  [v8 ratingValue];
  objc_msgSend(v9, "setRatingValue:");
  id v10 = [v8 style];

  objc_super v11 = [v7 tintColor];
  v12 = SUUIViewElementPlainColorWithStyle(v10, v11);

  if (!v12)
  {
    v12 = [MEMORY[0x263F825C8] blackColor];
  }
  [v9 setTintColor:v12];
  v13 = [v7 clientContext];
  BOOL v14 = SUUIUserInterfaceIdiom(v13) != 1;

  [v9 setBarRatingStyle:v14];
  return v9;
}

- (id)addButtonWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 buttonViewType];
  switch(v10)
  {
    case 0:
    case 8:
    case 10:
    case 11:
    case 13:
      uint64_t v11 = [v8 buttonViewSubType];
      if (v11 == 1)
      {
        v12 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504DF0];
        v13 = [v8 nonToggledText];
        [v12 setNonToggledTitle:v13];

        BOOL v14 = [v8 toggledText];
        [v12 setToggledTitle:v14];

        id v15 = v12;
        v16 = v15;
      }
      else
      {
        v16 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503970];
        id v15 = 0;
      }
      if (v10 == 13) {
        uint64_t v17 = 7;
      }
      else {
        uint64_t v17 = 0;
      }
      [v16 setButtonType:v17];
      v18 = [SUUIButtonBorderStyle alloc];
      v19 = [v8 style];
      v20 = [(SUUIButtonBorderStyle *)v18 initWithElementStyle:v19];

      [v16 setBorderStyle:v20];
      v21 = [v9 labelLayoutCache];
      v22 = [v21 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v16 setTitleLayout:v22];

      uint64_t v23 = [v8 isEnabled];
      [v16 setEnabled:v23];
      double v24 = 0.4;
      if (v23) {
        double v24 = 1.0;
      }
      [v16 setAlpha:v24];
      if (v11 == 1)
      {
        v25 = [v8 toggleItemIdentifier];
        if ([v25 length])
        {
          v26 = +[SUUIToggleStateCenter defaultCenter];
          [v15 setToggleItemIdentifier:v25];
          v27 = [v26 itemForIdentifier:v25];
          v28 = v27;
          if (!v27 || ([v27 toggled] & 0x80000000) != 0) {
            uint64_t v29 = [v8 isToggled];
          }
          else {
            uint64_t v29 = [v28 toggled] == 1;
          }
          [v15 setToggled:v29 animated:0];
        }
        else
        {
          objc_msgSend(v15, "setToggled:animated:", objc_msgSend(v8, "isToggled"), 0);
        }
      }
      id v30 = v16;
      goto LABEL_48;
    case 1:
    case 7:
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503970];
      [v30 setBorderStyle:0];
      if (v10 == 1) {
        uint64_t v31 = 3;
      }
      else {
        uint64_t v31 = 4;
      }
      [v30 setButtonType:v31];
      v32 = [v9 labelLayoutCache];
      v33 = [v32 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v30 setTitleLayout:v33];

      uint64_t v34 = [v8 isEnabled];
      [v30 setEnabled:v34];
      double v35 = 0.4;
      if (v34) {
        double v35 = 1.0;
      }
      [v30 setAlpha:v35];
      break;
    case 2:
    case 3:
      v36 = [(SUUIViewModification *)self _itemStateForButton:v8];
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504CD0];
      [v30 setElement:v8];
      goto LABEL_24;
    case 4:
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504CD0];
      v36 = [(SUUIViewModification *)self _itemStateForButton:v8];
LABEL_24:
      v37 = [v8 buyButtonDescriptor];
      v38 = [v9 clientContext];
      [v30 setValuesUsingBuyButtonDescriptor:v37 itemState:v36 clientContext:v38 animated:0];

      [(SUUIViewModification *)self _styleItemOfferButton:v30 forElement:v8 context:v9];
      break;
    case 5:
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504C70];
      v39 = [v30 imageView];
      v40 = [v30 additionalImageView];
      v41 = [v8 buttonImage];
      v112 = __RequestImage(v41, v9);
      objc_msgSend(v39, "setContents:");
      [v9 sizeForImageElement:v41];
      v114 = v39;
      objc_msgSend(v39, "setImageSize:");
      v42 = [v8 additionalButtonImage];
      v43 = __RequestImage(v42, v9);
      [v40 setContents:v43];
      [v9 sizeForImageElement:v42];
      objc_msgSend(v40, "setImageSize:");
      v44 = [v41 accessibilityText];
      if (!v44)
      {
        v44 = [v8 accessibilityText];
      }
      [v30 setAccessibilityLabel:v44];
      uint64_t v45 = [v8 isEnabled];
      double v46 = 0.4;
      if (v45) {
        double v46 = 1.0;
      }
      [v30 setAlpha:v46];
      [v30 setEnabled:v45];
      v47 = [v8 style];
      v48 = SUUIViewElementPlainColorWithStyle(v47, 0);
      [v30 setTintColor:v48];

      if ([v8 isBigHitButton])
      {
        [v30 setUseBigHitTarget:1];
        [v8 bigHitSize];
        double v50 = -v49;
        BOOL v51 = v49 == 0.0;
        double v52 = -15.0;
        if (!v51) {
          double v52 = v50;
        }
        objc_msgSend(v30, "setBigHitInsets:", v52, v52, v52, v52);
      }
      else
      {
        [v30 setUseBigHitTarget:0];
      }

      break;
    case 6:
      if ([v8 buttonViewSubType] == 1)
      {
        v53 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504DF0];
        v54 = [v8 nonToggledText];
        [v53 setNonToggledTitle:v54];

        v55 = [v8 toggledText];
        [v53 setToggledTitle:v55];

        objc_msgSend(v53, "setAutoIncrement:", objc_msgSend(v8, "autoIncrementCount"));
        id v15 = v53;
        v56 = v15;
      }
      else
      {
        v56 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503970];
        id v15 = 0;
      }
      [v56 setBorderStyle:0];
      int64_t v74 = +[SUUIStyledButton buttonTypeForElement:v8];
      if ([v8 isBigHitButton])
      {
        [v8 bigHitSize];
        double v76 = -v75;
        BOOL v51 = v75 == 0.0;
        double v77 = -15.0;
        if (!v51) {
          double v77 = v76;
        }
        objc_msgSend(v56, "setBigHitInsets:", v77, v77, v77, v77);
        [v56 setUseBigHitTarget:1];
      }
      [v56 setButtonType:v74];
      v78 = [v9 labelLayoutCache];
      v79 = [v78 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v56 setTitleLayout:v79];

      v80 = [v8 style];
      [v80 elementPadding];
      objc_msgSend(v56, "setButtonPadding:");

      uint64_t v81 = [v8 isEnabled];
      [v56 setEnabled:v81];
      double v82 = 0.4;
      if (v81) {
        double v82 = 1.0;
      }
      [v56 setAlpha:v82];
      v20 = [v56 imageView];
      v83 = [v8 buttonImage];
      v84 = __RequestImage(v83, v9);
      if (v15)
      {
        [v15 setElement:v8];
        v85 = [v8 toggleItemIdentifier];
        v113 = +[SUUIToggleStateCenter defaultCenter];
        if ([v85 length])
        {
          [v15 setToggleItemIdentifier:v85];
          v86 = [v113 itemForIdentifier:v85];
        }
        else
        {
          v86 = 0;
        }
        if (([v86 toggled] & 0x80000000) != 0) {
          uint64_t v111 = [v8 isToggled];
        }
        else {
          uint64_t v111 = [v86 count];
        }
        v115 = v86;
        v96 = [v8 additionalButtonImage];
        if (v96)
        {
          [v15 setToggleButtonType:1];
          v97 = __RequestImage(v96, v9);
        }
        else
        {
          [v15 setToggleButtonType:0];
          v97 = 0;
        }
        if ([v8 autoIncrementCount] && objc_msgSend(v115, "toggled") == -1)
        {
          v105 = v20;
          id v106 = v85;
          v109 = [v15 titleLayout];
          v101 = [v109 attributedString];
          v102 = [v101 string];

          v110 = v102;
          if ([v102 length])
          {
            if (addButtonWithElement_width_context__sOnceToken != -1) {
              dispatch_once(&addButtonWithElement_width_context__sOnceToken, &__block_literal_global_27);
            }
            v85 = v106;
            v20 = v105;
            v103 = [(id)addButtonWithElement_width_context__sNumberFormatter numberFromString:v110];
            if (v103)
            {
              id v107 = v103;
              uint64_t v111 = [v103 integerValue];
              v103 = v107;
            }
          }
          else
          {
            v20 = v105;
            v85 = v106;
          }
          if (v111 < 1)
          {
            [v15 setButtonTitleText:@" "];
            [v15 setAutoIncrementCount:v111];
          }
          else
          {
            [v15 setAutoIncrementCount:v111];
            [v15 setButtonTitleText:v110];
          }
          [v15 setAutoIncrementCount:v111];
          objc_msgSend(v15, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        else if ([v8 autoIncrementCount])
        {
          v108 = v96;
          objc_msgSend(v15, "setToggled:", objc_msgSend(v115, "toggled") == 1);
          if (v111 < 1)
          {
            [v15 setButtonTitleText:@" "];
          }
          else
          {
            [v115 toggledString];
            v98 = v84;
            v100 = v99 = v85;
            [v15 setButtonTitleText:v100];

            v85 = v99;
            v84 = v98;
          }
          v96 = v108;
        }
        else
        {
          objc_msgSend(v15, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        [v15 setNonToggledContents:v84];
        [v15 setToggledContents:v97];
        if ([v15 isToggled]) {
          v104 = v97;
        }
        else {
          v104 = v84;
        }
        [(SUUIButtonBorderStyle *)v20 setContents:v104];
      }
      else
      {
        [(SUUIButtonBorderStyle *)v20 setContents:v84];
      }
      [v9 sizeForImageElement:v83];
      -[SUUIButtonBorderStyle setImageSize:](v20, "setImageSize:");
      id v30 = v56;

LABEL_48:
      break;
    case 9:
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503970];
      [v30 setAlpha:1.0];
      [v30 setBorderStyle:0];
      uint64_t v57 = 1;
      [v30 setButtonType:1];
      v58 = [v9 labelLayoutCache];
      v59 = [v58 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v30 setTitleLayout:v59];

      v60 = [(SUUIViewModification *)self _itemStateForButton:v8];
      v61 = [v8 buyButtonDescriptor];
      v62 = [v9 clientContext];
      [v30 setValuesUsingBuyButtonDescriptor:v61 itemState:v60 clientContext:v62 animated:0];

      if (([v30 isUsingItemOfferAppearance] & 1) == 0) {
        uint64_t v57 = [v8 isEnabled];
      }
      [v30 setEnabled:v57];
      v63 = [v8 style];
      v64 = SUUIViewElementPlainColorWithStyle(v63, 0);

      [v30 setTintColor:v64];
      goto LABEL_70;
    case 12:
      id v30 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504CF0];
      v65 = [v8 sizeVariant];
      unsigned int v66 = [v65 isEqualToString:@"large"];

      [v30 setStyle:v66];
      v60 = [v8 playItemIdentifier];
      if ([v30 isIndeterminate]) {
        [v30 endIndeterminateAnimation];
      }
      objc_msgSend(v30, "setShowOnDemand:", objc_msgSend(v8, "showOnDemand"));
      [v30 showPlayIndicator:1];
      [v30 setPlayItemIdentifier:v60];
      objc_msgSend(v30, "setItemIdentifier:", objc_msgSend(v60, "longLongValue"));
      objc_msgSend(v30, "setBigHitInsets:", -15.0, -15.0, -15.0, -15.0);
      v67 = [v8 style];
      v68 = [v67 ikBackgroundColor];

      uint64_t v69 = [v68 colorType];
      if (v69 == 2)
      {
        v72 = 0;
        v73 = 0;
      }
      else
      {
        if (v69 == 3)
        {
          BOOL v70 = [v68 gradientDirectionType] == 2;
          v71 = [v68 gradientColors];
          [v30 setBackgroundGradientColors:v71 withGradientType:v70];
          v72 = 0;
          v73 = 0;
          uint64_t v69 = 4;
        }
        else
        {
          v73 = [v68 color];
          v71 = [v8 style];
          v87 = [v71 ikColor];
          v72 = [v87 color];

          uint64_t v69 = 1;
        }
      }
      objc_msgSend(v30, "setItemIdentifier:", objc_msgSend(v60, "longLongValue"));
      [v30 setBackgroundType:v69];
      if (v72) {
        [v30 setControlForegroundColor:v72];
      }
      if (v73) {
        [v30 setControlColor:v73];
      }
      [v30 setElement:v8];
      objc_msgSend(v30, "setEnabled:", objc_msgSend(v8, "isEnabled"));
      objc_msgSend(v30, "setDisabledButSelectable:", objc_msgSend(v8, "isDisabledButSelectable"));
      objc_msgSend(v30, "setHidden:", objc_msgSend(v30, "showOnDemand"));

LABEL_70:
      break;
    default:
      id v30 = 0;
      break;
  }
  v88 = [v8 attributes];
  v89 = [v88 objectForKeyedSubscript:@"privacy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v90 = v89;
  }
  else {
    v90 = 0;
  }
  [v30 setAdPrivacyData:v90];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v91 = v30;
    v92 = [v8 buttonTitleStyle];
    v93 = v92;
    if (!v92)
    {
      v93 = [v8 style];
    }
    v94 = [v93 ikColor];
    objc_msgSend(v91, "setUsesTintColor:", objc_msgSend(v94, "colorType") == 1);

    if (!v92) {
  }
    }

  return v30;
}

uint64_t __80__SUUIViewModification_SUUIViewElementView__addButtonWithElement_width_context___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)addButtonWithElement_width_context__sNumberFormatter;
  addButtonWithElement_width_context__sNumberFormatter = (uint64_t)v0;

  v2 = (void *)addButtonWithElement_width_context__sNumberFormatter;
  return [v2 setNumberStyle:1];
}

- (id)addDividerWithElement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x2704FA770];
  id v9 = [v6 style];
  uint64_t v10 = [v7 tintColor];

  uint64_t v11 = SUUIViewElementPlainColorWithStyle(v9, v10);

  if (v11 || [v6 dividerType] == 3)
  {
    if ([v6 dividerType] == 3)
    {

      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.2];
  }
  [v8 setDividerColor:v11];

  return v8;
}

- (id)addHeaderViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503B70];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addHorizontalListWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504C10];
  uint64_t v11 = [v9 style];
  [v11 elementPadding];
  objc_msgSend(v10, "setContentInset:");

  [v10 reloadWithViewElement:v9 width:v8 context:a4];
  return v10;
}

- (id)addHorizontalLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504C50];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addImageDeckViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503BB0];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addImageGridViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503BD0];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addImageViewWithElement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 style];
  id v9 = [v8 imageTreatment];
  uint64_t v10 = SUUIImageTreatmentForString(v9);

  if (v10 == 13)
  {
    id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x270504D10 viewElement:v6 context:v7];
    if (v8)
    {
      [v8 transform];
      [v11 setTransform:v28];
    }
    v13 = SUUIViewElementPlainColorWithStyle(v8, 0);
    [v11 setTintColor:v13];

    [v8 elementPadding];
    objc_msgSend(v11, "setImagePadding:");
    v12 = [v8 ikBackgroundColor];
    BOOL v14 = [v12 color];
    [v11 setBackgroundColor:v14];
  }
  else if (v10 == 7)
  {
    id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x270504D70 viewElement:v6 context:v7];
    v12 = [v7 borderDrawingCache];
    [v11 setBorderDrawingCache:v12];
  }
  else
  {
    id v15 = [v6 children];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x270504B90 viewElement:v6 context:v7];
      [v6 size];
      objc_msgSend(v11, "reloadWithViewElement:width:context:", v6, v7);
    }
    else
    {
      [v6 shadowOffset];
      if (v18 == *MEMORY[0x263F001B0] && v17 == *(double *)(MEMORY[0x263F001B0] + 8))
      {
        id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x270504C90 viewElement:v6 context:v7];
        [v6 layerShadowOpacity];
        if (v20 != 0.0)
        {
          v21 = [v11 layer];
          [v21 setMasksToBounds:0];

          v22 = [v11 layer];
          [v6 layerShadowOpacity];
          objc_msgSend(v22, "setShadowOpacity:");

          uint64_t v23 = [v11 layer];
          [v6 layerShadowOffset];
          objc_msgSend(v23, "setShadowOffset:");
        }
        [v6 layerShadowRadius];
        if (v24 != 0.0)
        {
          v25 = [v11 layer];
          [v6 layerShadowRadius];
          objc_msgSend(v25, "setShadowRadius:");
        }
      }
      else
      {
        id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x270504CB0 viewElement:v6 context:v7];
        [v11 setContentMode:4];
      }
    }
    if (v8)
    {
      [v8 transform];
      [v11 setTransform:&v27];
    }
    v12 = SUUIViewElementPlainColorWithStyle(v8, 0);
    [v11 setTintColor:v12];
  }

  return v11;
}

- (id)addImageViewWithVideoElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 thumbnailImage];
  char v9 = [v7 isEnabled];

  if (v9)
  {
    uint64_t v10 = [v8 style];
    id v11 = [(SUUIViewModification *)self _addImageViewWithReuseIdentifier:0x2704FA030 viewElement:v8 context:v6];
    if (v10)
    {
      [v10 transform];
      [v11 setTransform:&v13];
    }
  }
  else
  {
    id v11 = [(SUUIViewModification *)self addImageViewWithElement:v8 context:v6];
  }

  return v11;
}

- (id)addLabelViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 labelLayoutCache];
  id v11 = [v10 layoutForWidth:(uint64_t)a4 viewElement:v8];

  v12 = [(SUUIViewModification *)self _attributedStringViewForLayout:v11];
  [v12 setLayout:v11];
  objc_msgSend(v12, "setContainsLinks:", objc_msgSend(v8, "containsLinks"));
  if ([v8 containsLinks])
  {
    uint64_t v13 = [v8 linkDelegate];
    [v12 setLinkDelegate:v13];
  }
  [v12 setStringTreatment:0];
  [v12 setTreatmentColor:0];
  BOOL v14 = [v8 style];
  id v15 = [v14 ikColor];
  objc_msgSend(v12, "setTextColorFollowsTintColor:", objc_msgSend(v15, "colorType") == 1);

  if (v11)
  {
    uint64_t v16 = [v8 trailingBadges];
    double v17 = [v9 badgeImageLoader];
    double v18 = [v8 badges];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v27 = v16;
      id v28 = v9;
      LOBYTE(v21) = 0;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          if (v21)
          {
            BOOL v21 = 1;
          }
          else
          {
            v25 = [*(id *)(*((void *)&v29 + 1) + 8 * i) image];
            BOOL v21 = v25 == 0;
          }
          objc_msgSend(v17, "loadImageForBadge:layout:reason:", v24, v11, 1, v27, v28);
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v20);
      uint64_t v16 = v27;
      id v9 = v28;
      if (v21) {
        [v17 connectStringView:v12];
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  [v12 setRequiredBadges:v16];
  objc_msgSend(v12, "setBadgePlacement:", objc_msgSend(v8, "badgePlacement") == 1);

  return v12;
}

- (id)addLabelViewWithOrdinalElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = [a5 labelLayoutCache];
  uint64_t v10 = [v9 layoutForWidth:(uint64_t)a4 viewElement:v8];

  id v11 = [(SUUIViewModification *)self _attributedStringViewForLayout:v10];
  [v11 setLayout:v10];
  [v11 setStringTreatment:0];
  [v11 setTreatmentColor:0];
  v12 = [v8 style];

  uint64_t v13 = [v12 ikColor];
  objc_msgSend(v11, "setTextColorFollowsTintColor:", objc_msgSend(v13, "colorType") == 1);

  return v11;
}

- (id)addMenuButtonWithTitleItem:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503970];
  [v10 setBorderStyle:0];
  [v10 setButtonType:2];
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  id v11 = [v8 labelLayoutCache];

  v12 = [v11 layoutForWidth:(uint64_t)a4 viewElement:v9];

  [v10 setTitleLayout:v12];
  [v10 setUsesTintColor:1];
  return v10;
}

- (id)addOfferViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x2704FB650];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addStackListViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x2705040F0];
  id v11 = [v9 style];
  [v11 elementPadding];
  objc_msgSend(v10, "setContentInset:");

  [v10 reloadWithViewElement:v9 width:v8 context:a4];
  return v10;
}

- (id)addStackItemViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x2705013B0];
  id v11 = [v9 style];
  [v11 elementPadding];
  objc_msgSend(v10, "setContentInset:");

  [v10 reloadWithViewElement:v9 width:v8 context:a4];
  return v10;
}

- (id)addReviewListTitleViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504D30];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addResponseViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270503F30];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addStarRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504130];
  [v10 setElementSpacing:3];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addStarRatingControlViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504D90];
  objc_msgSend(v10, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addTabularLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504DB0];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)addTextViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504DD0];
  id v11 = [v9 editorialLayoutForLabelElement:v8 width:a4];
  v12 = [v11 bodyTextLayoutForOrientation:0];
  objc_msgSend(v10, "setContentInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  [v10 setEnabled:0];
  objc_msgSend(v10, "setFixedWidthTextFrame:", objc_msgSend(v12, "textFrame"));
  uint64_t v13 = [v8 moreButtonTitle];
  [v10 setMoreButtonTitle:v13];

  int v14 = [v12 requiresTruncation];
  uint64_t v15 = 0;
  if (v14)
  {
    if ([v9 isEditorialLayoutExpanded:v11]) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [v8 isEnabled];
    }
  }
  [v10 setUserInteractionEnabled:v15];
  if ([v9 isEditorialLayoutExpanded:v11]) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = [v8 numberOfLines];
  }
  [v10 setNumberOfVisibleLines:v16];

  return v10;
}

- (id)addTomatoRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:0x270504150];
  [v10 reloadWithViewElement:v9 width:v8 context:a4];

  return v10;
}

- (id)_addImageViewWithReuseIdentifier:(id)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:a3];
  id v11 = [v9 accessibilityText];
  [v10 setAccessibilityLabel:v11];

  objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(v9, "isEnabled"));
  v12 = __RequestImage(v9, v8);
  [v10 setContents:v12];
  [v8 sizeForImageElement:v9];
  double v14 = v13;
  double v16 = v15;

  objc_msgSend(v10, "setImageSize:", v14, v16);
  return v10;
}

- (id)_itemStateForButton:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 itemIdentifier];
  id v5 = [v3 storeIdentifier];
  if (!v5 && v4) {
    id v5 = [[SUUIStoreIdentifier alloc] initWithLongLong:v4];
  }
  if (v5)
  {
    id v6 = +[SUUIItemStateCenter defaultCenter];
    id v7 = [v6 stateForItemWithStoreIdentifier:v5];

    if (v7
      && ([v3 buyButtonDescriptor],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = [v8 canPersonalizeUsingItemState:v7],
          v8,
          v9))
    {
      id v10 = v7;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)_styleItemOfferButton:(id)a3 forElement:(id)a4 context:(id)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = [a5 tintColor];
  int v9 = [v7 style];
  id v10 = SUUIViewElementPlainColorWithStyle(v9, v8);

  [v20 setTintColor:v10];
  id v11 = v7;
  v12 = v11;
  if (v11)
  {
    double v13 = v11;
    do
    {
      double v14 = v13;
      double v15 = [v13 style];
      double v16 = [v15 ikBackgroundColor];
      double v17 = SUUIViewElementPlainColorWithIKColor(v16, v8);

      double v13 = [v14 parent];
    }
    while (v13 && !v17);
  }
  else
  {
    double v17 = 0;
    double v13 = 0;
  }
  double v18 = [(id)objc_opt_class() cloudTintColorForBackgroundColor:v17];
  [v20 setCloudTintColor:v18];

  [v20 setElement:v12];
  objc_msgSend(v20, "setEnabled:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v20, "setDisabledButSelectable:", objc_msgSend(v12, "isDisabledButSelectable"));
  uint64_t v19 = [v12 badgeResourceName];
  objc_msgSend(v20, "setUniversal:", objc_msgSend(v19, "isEqualToString:", @"plus"));
}

- (id)_attributedStringViewForLayout:(id)a3
{
  [a3 edgeInsetsForShadow];
  BOOL v10 = v7 == *(double *)(MEMORY[0x263F834E8] + 16)
     && v6 == *(double *)(MEMORY[0x263F834E8] + 24)
     && v4 == *MEMORY[0x263F834E8]
     && v5 == *(double *)(MEMORY[0x263F834E8] + 8);
  id v11 = SUUIViewReuseAttributedStringIdentifier;
  if (!v10) {
    id v11 = SUUIViewReuseAttributedStringWrapperIdentifier;
  }
  v12 = [(SUUIViewModification *)self addReusableViewWithReuseIdentifier:*v11];
  return v12;
}

@end
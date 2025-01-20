@interface SKUIViewModification
- (NSArray)views;
- (NSMapTable)allViewTextProperties;
- (SKUIViewModification)initWithViewReusePool:(id)a3;
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

@implementation SKUIViewModification

- (SKUIViewModification)initWithViewReusePool:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIViewModification initWithViewReusePool:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIViewModification;
  v6 = [(SKUIViewModification *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewPool, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    views = v7->_views;
    v7->_views = v8;
  }
  return v7;
}

- (id)addReusableViewWithReuseIdentifier:(id)a3
{
  v4 = [(SKUIViewReusePool *)self->_viewPool dequeueReusableViewWithReuseIdentifier:a3];
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
    v7 = (NSMapTable *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:517 valueOptions:0 capacity:1];
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
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addBadgeViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  if ([v8 badgeType] == 1)
  {
    v18 = [v9 labelLayoutCache];
    v19 = [v18 layoutForWidth:(uint64_t)a4 viewElement:v8];

    v20 = [(SKUIViewModification *)self _attributedStringViewForLayout:v19];
    [v20 setLayout:v19];
    [v20 setStringTreatment:1];
    v21 = [v8 style];
    v22 = [v21 ikBackgroundColor];
    v23 = [v22 color];
    [v20 setTreatmentColor:v23];

    goto LABEL_20;
  }
  v24 = [v8 resourceName];
  v21 = v24;
  if (v24)
  {
    uint64_t v25 = SKUIImageWithResourceName(v24);
  }
  else
  {
    v26 = [v8 URL];

    if (v26)
    {
      v27 = [v9 requestIdentifierForViewElement:v8];
      if (v27)
      {
        v28 = [v9 resourceLoader];
        v19 = objc_msgSend(v28, "cachedResourceForRequestIdentifier:", objc_msgSend(v27, "unsignedIntegerValue"));
        if (!v19
          && (objc_msgSend(v28, "trySetReason:forRequestWithIdentifier:", 1, objc_msgSend(v27, "unsignedIntegerValue")) & 1) == 0)
        {
          [v9 loadTemplatedImageForBadgeElement:v8 reason:1];
        }
      }
      else
      {
        [v9 loadTemplatedImageForBadgeElement:v8 reason:1];
        v19 = 0;
      }

      goto LABEL_19;
    }
    uint64_t v25 = [v8 fallbackImage];
  }
  v19 = (void *)v25;
LABEL_19:
  v20 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94728];
  v29 = [v8 accessibilityText];
  [v20 setAccessibilityLabel:v29];

  [v20 setImage:v19];
  [v8 size];
  objc_msgSend(v20, "setImageSize:");
  v30 = [v8 style];
  v31 = SKUIViewElementPlainColorWithStyle(v30, 0);
  [v20 setTintColor:v31];

  [v20 setUserInteractionEnabled:0];
LABEL_20:

  return v20;
}

- (id)addBarRatingWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v9) {
        -[SKUIViewModification(SKUIViewElementView) addBarRatingWithElement:width:context:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  uint64_t v17 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C945E8];
  [v8 ratingValue];
  objc_msgSend(v17, "setRatingValue:");
  v18 = [v8 style];

  v19 = [v7 tintColor];
  v20 = SKUIViewElementPlainColorWithStyle(v18, v19);

  if (!v20)
  {
    v20 = [MEMORY[0x1E4FB1618] blackColor];
  }
  [v17 setTintColor:v20];
  v21 = [v7 clientContext];
  BOOL v22 = SKUIUserInterfaceIdiom(v21) != 1;

  [v17 setBarRatingStyle:v22];

  return v17;
}

- (id)addButtonWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addButtonWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 buttonViewType];
  switch(v18)
  {
    case 0:
    case 8:
    case 10:
    case 11:
    case 13:
      uint64_t v19 = [v8 buttonViewSubType];
      if (v19 == 1)
      {
        v20 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94908];
        v21 = [v8 nonToggledText];
        [v20 setNonToggledTitle:v21];

        BOOL v22 = [v8 toggledText];
        [v20 setToggledTitle:v22];

        id v23 = v20;
        v24 = v23;
      }
      else
      {
        v24 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94608];
        id v23 = 0;
      }
      if (v18 == 13) {
        uint64_t v25 = 7;
      }
      else {
        uint64_t v25 = 0;
      }
      [v24 setButtonType:v25];
      v26 = [SKUIButtonBorderStyle alloc];
      v27 = [v8 style];
      v28 = [(SKUIButtonBorderStyle *)v26 initWithElementStyle:v27];

      [v24 setBorderStyle:v28];
      v29 = [v9 labelLayoutCache];
      v30 = [v29 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v24 setTitleLayout:v30];

      uint64_t v31 = [v8 isEnabled];
      [v24 setEnabled:v31];
      double v32 = 0.4;
      if (v31) {
        double v32 = 1.0;
      }
      [v24 setAlpha:v32];
      if (v19 == 1)
      {
        v33 = [v8 toggleItemIdentifier];
        if ([v33 length])
        {
          v34 = +[SKUIToggleStateCenter defaultCenter];
          [v23 setToggleItemIdentifier:v33];
          v35 = [v34 itemForIdentifier:v33];
          v36 = v35;
          if (!v35 || ([v35 toggled] & 0x80000000) != 0) {
            uint64_t v37 = [v8 isToggled];
          }
          else {
            uint64_t v37 = [v36 toggled] == 1;
          }
          [v23 setToggled:v37 animated:0];
        }
        else
        {
          objc_msgSend(v23, "setToggled:animated:", objc_msgSend(v8, "isToggled"), 0);
        }
      }
      id v38 = v24;
      goto LABEL_52;
    case 1:
    case 7:
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94608];
      [v38 setBorderStyle:0];
      if (v18 == 1) {
        uint64_t v39 = 3;
      }
      else {
        uint64_t v39 = 4;
      }
      [v38 setButtonType:v39];
      v40 = [v9 labelLayoutCache];
      v41 = [v40 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v38 setTitleLayout:v41];

      uint64_t v42 = [v8 isEnabled];
      [v38 setEnabled:v42];
      double v43 = 0.4;
      if (v42) {
        double v43 = 1.0;
      }
      [v38 setAlpha:v43];
      break;
    case 2:
    case 3:
      v44 = [(SKUIViewModification *)self _itemStateForButton:v8];
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94768];
      [v38 setElement:v8];
      goto LABEL_28;
    case 4:
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94768];
      v44 = [(SKUIViewModification *)self _itemStateForButton:v8];
LABEL_28:
      v45 = [v8 buyButtonDescriptor];
      v46 = [v9 clientContext];
      [v38 setValuesUsingBuyButtonDescriptor:v45 itemState:v44 clientContext:v46 animated:0];

      [(SKUIViewModification *)self _styleItemOfferButton:v38 forElement:v8 context:v9];
      break;
    case 5:
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C946C8];
      v47 = [v38 imageView];
      v48 = [v38 additionalImageView];
      v49 = [v8 buttonImage];
      v120 = __RequestImage(v49, v9);
      objc_msgSend(v47, "setContents:");
      [v9 sizeForImageElement:v49];
      v122 = v47;
      objc_msgSend(v47, "setImageSize:");
      v50 = [v8 additionalButtonImage];
      v51 = __RequestImage(v50, v9);
      [v48 setContents:v51];
      [v9 sizeForImageElement:v50];
      objc_msgSend(v48, "setImageSize:");
      v52 = [v49 accessibilityText];
      if (!v52)
      {
        v52 = [v8 accessibilityText];
      }
      [v38 setAccessibilityLabel:v52];
      uint64_t v53 = [v8 isEnabled];
      double v54 = 0.4;
      if (v53) {
        double v54 = 1.0;
      }
      [v38 setAlpha:v54];
      [v38 setEnabled:v53];
      v55 = [v8 style];
      v56 = SKUIViewElementPlainColorWithStyle(v55, 0);
      [v38 setTintColor:v56];

      if ([v8 isBigHitButton])
      {
        [v38 setUseBigHitTarget:1];
        [v8 bigHitSize];
        double v58 = -v57;
        BOOL v59 = v57 == 0.0;
        double v60 = -15.0;
        if (!v59) {
          double v60 = v58;
        }
        objc_msgSend(v38, "setBigHitInsets:", v60, v60, v60, v60);
      }
      else
      {
        [v38 setUseBigHitTarget:0];
      }

      break;
    case 6:
      if ([v8 buttonViewSubType] == 1)
      {
        v61 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94908];
        v62 = [v8 nonToggledText];
        [v61 setNonToggledTitle:v62];

        v63 = [v8 toggledText];
        [v61 setToggledTitle:v63];

        objc_msgSend(v61, "setAutoIncrement:", objc_msgSend(v8, "autoIncrementCount"));
        id v23 = v61;
        v64 = v23;
      }
      else
      {
        v64 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94608];
        id v23 = 0;
      }
      [v64 setBorderStyle:0];
      int64_t v82 = +[SKUIStyledButton buttonTypeForElement:v8];
      if ([v8 isBigHitButton])
      {
        [v8 bigHitSize];
        double v84 = -v83;
        BOOL v59 = v83 == 0.0;
        double v85 = -15.0;
        if (!v59) {
          double v85 = v84;
        }
        objc_msgSend(v64, "setBigHitInsets:", v85, v85, v85, v85);
        [v64 setUseBigHitTarget:1];
      }
      [v64 setButtonType:v82];
      v86 = [v9 labelLayoutCache];
      v87 = [v86 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v64 setTitleLayout:v87];

      v88 = [v8 style];
      [v88 elementPadding];
      objc_msgSend(v64, "setButtonPadding:");

      uint64_t v89 = [v8 isEnabled];
      [v64 setEnabled:v89];
      double v90 = 0.4;
      if (v89) {
        double v90 = 1.0;
      }
      [v64 setAlpha:v90];
      v28 = [v64 imageView];
      v91 = [v8 buttonImage];
      v92 = __RequestImage(v91, v9);
      if (v23)
      {
        [v23 setElement:v8];
        v93 = [v8 toggleItemIdentifier];
        v121 = +[SKUIToggleStateCenter defaultCenter];
        if ([v93 length])
        {
          [v23 setToggleItemIdentifier:v93];
          v94 = [v121 itemForIdentifier:v93];
        }
        else
        {
          v94 = 0;
        }
        if (([v94 toggled] & 0x80000000) != 0) {
          uint64_t v119 = [v8 isToggled];
        }
        else {
          uint64_t v119 = [v94 count];
        }
        v123 = v94;
        v104 = [v8 additionalButtonImage];
        if (v104)
        {
          [v23 setToggleButtonType:1];
          v105 = __RequestImage(v104, v9);
        }
        else
        {
          [v23 setToggleButtonType:0];
          v105 = 0;
        }
        if ([v8 autoIncrementCount] && objc_msgSend(v123, "toggled") == -1)
        {
          v113 = v28;
          id v114 = v93;
          v117 = [v23 titleLayout];
          v109 = [v117 attributedString];
          v110 = [v109 string];

          v118 = v110;
          if ([v110 length])
          {
            if (addButtonWithElement_width_context__sOnceToken != -1) {
              dispatch_once(&addButtonWithElement_width_context__sOnceToken, &__block_literal_global_31);
            }
            v93 = v114;
            v28 = v113;
            v111 = [(id)addButtonWithElement_width_context__sNumberFormatter numberFromString:v118];
            if (v111)
            {
              id v115 = v111;
              uint64_t v119 = [v111 integerValue];
              v111 = v115;
            }
          }
          else
          {
            v28 = v113;
            v93 = v114;
          }
          if (v119 < 1)
          {
            [v23 setButtonTitleText:@" "];
            [v23 setAutoIncrementCount:v119];
          }
          else
          {
            [v23 setAutoIncrementCount:v119];
            [v23 setButtonTitleText:v118];
          }
          [v23 setAutoIncrementCount:v119];
          objc_msgSend(v23, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        else if ([v8 autoIncrementCount])
        {
          v116 = v104;
          objc_msgSend(v23, "setToggled:", objc_msgSend(v123, "toggled") == 1);
          if (v119 < 1)
          {
            [v23 setButtonTitleText:@" "];
          }
          else
          {
            [v123 toggledString];
            v106 = v92;
            v108 = v107 = v93;
            [v23 setButtonTitleText:v108];

            v93 = v107;
            v92 = v106;
          }
          v104 = v116;
        }
        else
        {
          objc_msgSend(v23, "setToggled:", objc_msgSend(v8, "isToggled"));
        }
        [v23 setNonToggledContents:v92];
        [v23 setToggledContents:v105];
        if ([v23 isToggled]) {
          v112 = v105;
        }
        else {
          v112 = v92;
        }
        [(SKUIButtonBorderStyle *)v28 setContents:v112];
      }
      else
      {
        [(SKUIButtonBorderStyle *)v28 setContents:v92];
      }
      [v9 sizeForImageElement:v91];
      -[SKUIButtonBorderStyle setImageSize:](v28, "setImageSize:");
      id v38 = v64;

LABEL_52:
      break;
    case 9:
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94608];
      [v38 setAlpha:1.0];
      [v38 setBorderStyle:0];
      uint64_t v65 = 1;
      [v38 setButtonType:1];
      v66 = [v9 labelLayoutCache];
      v67 = [v66 layoutForWidth:(uint64_t)a4 viewElement:v8];
      [v38 setTitleLayout:v67];

      v68 = [(SKUIViewModification *)self _itemStateForButton:v8];
      v69 = [v8 buyButtonDescriptor];
      v70 = [v9 clientContext];
      [v38 setValuesUsingBuyButtonDescriptor:v69 itemState:v68 clientContext:v70 animated:0];

      if (([v38 isUsingItemOfferAppearance] & 1) == 0) {
        uint64_t v65 = [v8 isEnabled];
      }
      [v38 setEnabled:v65];
      v71 = [v8 style];
      v72 = SKUIViewElementPlainColorWithStyle(v71, 0);

      [v38 setTintColor:v72];
      goto LABEL_74;
    case 12:
      id v38 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94788];
      v73 = [v8 sizeVariant];
      unsigned int v74 = [v73 isEqualToString:@"large"];

      [v38 setStyle:v74];
      v68 = [v8 playItemIdentifier];
      if ([v38 isIndeterminate]) {
        [v38 endIndeterminateAnimation];
      }
      objc_msgSend(v38, "setShowOnDemand:", objc_msgSend(v8, "showOnDemand"));
      [v38 showPlayIndicator:1];
      [v38 setPlayItemIdentifier:v68];
      objc_msgSend(v38, "setItemIdentifier:", objc_msgSend(v68, "longLongValue"));
      objc_msgSend(v38, "setBigHitInsets:", -15.0, -15.0, -15.0, -15.0);
      v75 = [v8 style];
      v76 = [v75 ikBackgroundColor];

      uint64_t v77 = [v76 colorType];
      if (v77 == 2)
      {
        v80 = 0;
        v81 = 0;
      }
      else
      {
        if (v77 == 3)
        {
          BOOL v78 = [v76 gradientDirectionType] == 2;
          v79 = [v76 gradientColors];
          [v38 setBackgroundGradientColors:v79 withGradientType:v78];
          v80 = 0;
          v81 = 0;
          uint64_t v77 = 4;
        }
        else
        {
          v81 = [v76 color];
          v79 = [v8 style];
          v95 = [v79 ikColor];
          v80 = [v95 color];

          uint64_t v77 = 1;
        }
      }
      objc_msgSend(v38, "setItemIdentifier:", objc_msgSend(v68, "longLongValue"));
      [v38 setBackgroundType:v77];
      if (v80) {
        [v38 setControlForegroundColor:v80];
      }
      if (v81) {
        [v38 setControlColor:v81];
      }
      [v38 setElement:v8];
      objc_msgSend(v38, "setEnabled:", objc_msgSend(v8, "isEnabled"));
      objc_msgSend(v38, "setDisabledButSelectable:", objc_msgSend(v8, "isDisabledButSelectable"));
      objc_msgSend(v38, "setHidden:", objc_msgSend(v38, "showOnDemand"));

LABEL_74:
      break;
    default:
      id v38 = 0;
      break;
  }
  v96 = [v8 attributes];
  v97 = [v96 objectForKeyedSubscript:@"privacy"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v98 = v97;
  }
  else {
    v98 = 0;
  }
  [v38 setAdPrivacyData:v98];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v99 = v38;
    v100 = [v8 buttonTitleStyle];
    v101 = v100;
    if (!v100)
    {
      v101 = [v8 style];
    }
    v102 = [v101 ikColor];
    objc_msgSend(v99, "setUsesTintColor:", objc_msgSend(v102, "colorType") == 1);

    if (!v100) {
  }
    }

  return v38;
}

uint64_t __80__SKUIViewModification_SKUIViewElementView__addButtonWithElement_width_context___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)addButtonWithElement_width_context__sNumberFormatter;
  addButtonWithElement_width_context__sNumberFormatter = (uint64_t)v0;

  v2 = (void *)addButtonWithElement_width_context__sNumberFormatter;

  return [v2 setNumberStyle:1];
}

- (id)addDividerWithElement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIViewModification(SKUIViewElementView) addDividerWithElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v16 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C8CA08];
  uint64_t v17 = [v6 style];
  uint64_t v18 = [v7 tintColor];

  uint64_t v19 = SKUIViewElementPlainColorWithStyle(v17, v18);

  if (v19 || [v6 dividerType] == 3)
  {
    if ([v6 dividerType] == 3)
    {

      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.2];
  }
  [v16 setDividerColor:v19];

  return v16;
}

- (id)addHeaderViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addHeaderViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94648];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addHorizontalListWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addHorizontalListWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94668];
  uint64_t v19 = [v9 style];
  [v19 elementPadding];
  objc_msgSend(v18, "setContentInset:");

  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addHorizontalLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addHorizontalLockupWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C946A8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addImageDeckViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addImageDeckViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C946E8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addImageGridViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addImageGridViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94708];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addImageViewWithElement:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v8) {
        -[SKUIViewModification(SKUIViewElementView) addImageViewWithElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v16 = [v6 style];
  uint64_t v17 = [v16 imageTreatment];
  uint64_t v18 = SKUIImageTreatmentForString(v17);

  if (v18 == 13)
  {
    id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C947A8 viewElement:v6 context:v7];
    if (v16)
    {
      [v16 transform];
      [v19 setTransform:v36];
    }
    v21 = SKUIViewElementPlainColorWithStyle(v16, 0);
    [v19 setTintColor:v21];

    [v16 elementPadding];
    objc_msgSend(v19, "setImagePadding:");
    v20 = [v16 ikBackgroundColor];
    BOOL v22 = [v20 color];
    [v19 setBackgroundColor:v22];
  }
  else if (v18 == 7)
  {
    id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C94808 viewElement:v6 context:v7];
    v20 = [v7 borderDrawingCache];
    [v19 setBorderDrawingCache:v20];
  }
  else
  {
    id v23 = [v6 children];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C94588 viewElement:v6 context:v7];
      [v6 size];
      objc_msgSend(v19, "reloadWithViewElement:width:context:", v6, v7);
    }
    else
    {
      [v6 shadowOffset];
      if (v26 == *MEMORY[0x1E4F1DB30] && v25 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C94728 viewElement:v6 context:v7];
        [v6 layerShadowOpacity];
        if (v28 != 0.0)
        {
          v29 = [v19 layer];
          [v29 setMasksToBounds:0];

          v30 = [v19 layer];
          [v6 layerShadowOpacity];
          objc_msgSend(v30, "setShadowOpacity:");

          uint64_t v31 = [v19 layer];
          [v6 layerShadowOffset];
          objc_msgSend(v31, "setShadowOffset:");
        }
        [v6 layerShadowRadius];
        if (v32 != 0.0)
        {
          v33 = [v19 layer];
          [v6 layerShadowRadius];
          objc_msgSend(v33, "setShadowRadius:");
        }
      }
      else
      {
        id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C94748 viewElement:v6 context:v7];
        [v19 setContentMode:4];
      }
    }
    if (v16)
    {
      [v16 transform];
      [v19 setTransform:&v35];
    }
    v20 = SKUIViewElementPlainColorWithStyle(v16, 0);
    [v19 setTintColor:v20];
  }

  return v19;
}

- (id)addImageViewWithVideoElement:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v8) {
        -[SKUIViewModification(SKUIViewElementView) addImageViewWithVideoElement:context:](v8, v9, v10, v11, v12, v13, v14, v15);
      }
    }
  }
  uint64_t v16 = [v7 thumbnailImage];
  char v17 = [v7 isEnabled];

  if (v17)
  {
    uint64_t v18 = [v16 style];
    id v19 = [(SKUIViewModification *)self _addImageViewWithReuseIdentifier:0x1F1C94948 viewElement:v16 context:v6];
    if (v18)
    {
      [v18 transform];
      [v19 setTransform:&v21];
    }
  }
  else
  {
    id v19 = [(SKUIViewModification *)self addImageViewWithElement:v16 context:v6];
  }

  return v19;
}

- (id)addLabelViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addLabelViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v9 labelLayoutCache];
  id v19 = [v18 layoutForWidth:(uint64_t)a4 viewElement:v8];

  v20 = [(SKUIViewModification *)self _attributedStringViewForLayout:v19];
  [v20 setLayout:v19];
  objc_msgSend(v20, "setContainsLinks:", objc_msgSend(v8, "containsLinks"));
  if ([v8 containsLinks])
  {
    uint64_t v21 = [v8 linkDelegate];
    [v20 setLinkDelegate:v21];
  }
  [v20 setStringTreatment:0];
  [v20 setTreatmentColor:0];
  BOOL v22 = [v8 style];
  id v23 = [v22 ikColor];
  objc_msgSend(v20, "setTextColorFollowsTintColor:", objc_msgSend(v23, "colorType") == 1);

  if (v19)
  {
    uint64_t v24 = [v8 trailingBadges];
    double v25 = [v9 badgeImageLoader];
    double v26 = [v8 badges];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v35 = v24;
      id v36 = v9;
      LOBYTE(v29) = 0;
      uint64_t v30 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          if (v29)
          {
            BOOL v29 = 1;
          }
          else
          {
            v33 = [*(id *)(*((void *)&v37 + 1) + 8 * i) image];
            BOOL v29 = v33 == 0;
          }
          objc_msgSend(v25, "loadImageForBadge:layout:reason:", v32, v19, 1, v35, v36);
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v28);
      uint64_t v24 = v35;
      id v9 = v36;
      if (v29) {
        [v25 connectStringView:v20];
      }
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  [v20 setRequiredBadges:v24];
  objc_msgSend(v20, "setBadgePlacement:", objc_msgSend(v8, "badgePlacement") == 1);

  return v20;
}

- (id)addLabelViewWithOrdinalElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addLabelViewWithOrdinalElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [v8 labelLayoutCache];
  id v19 = [v18 layoutForWidth:(uint64_t)a4 viewElement:v9];

  v20 = [(SKUIViewModification *)self _attributedStringViewForLayout:v19];
  [v20 setLayout:v19];
  [v20 setStringTreatment:0];
  [v20 setTreatmentColor:0];
  uint64_t v21 = [v9 style];

  BOOL v22 = [v21 ikColor];
  objc_msgSend(v20, "setTextColorFollowsTintColor:", objc_msgSend(v22, "colorType") == 1);

  return v20;
}

- (id)addMenuButtonWithTitleItem:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addMenuButtonWithTitleItem:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94608];
  [v18 setBorderStyle:0];
  [v18 setButtonType:2];
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  id v19 = [v8 labelLayoutCache];

  v20 = [v19 layoutForWidth:(uint64_t)a4 viewElement:v9];

  [v18 setTitleLayout:v20];
  [v18 setUsesTintColor:1];

  return v18;
}

- (id)addOfferViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addOfferViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C8B5A8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addStackListViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addStackListViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94828];
  id v19 = [v9 style];
  [v19 elementPadding];
  objc_msgSend(v18, "setContentInset:");

  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addStackItemViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addStackItemViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C926A8];
  id v19 = [v9 style];
  [v19 elementPadding];
  objc_msgSend(v18, "setContentInset:");

  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addReviewListTitleViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addReviewListTitleViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C947E8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addResponseViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addResponseViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C947C8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addStarRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addStarRatingViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94848];
  [v18 setElementSpacing:3];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addStarRatingControlViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addStarRatingControlViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94868];
  objc_msgSend(v18, "setEnabled:", objc_msgSend(v9, "isEnabled"));
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addTabularLockupWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addTabularLockupWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C948C8];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)addTextViewWithElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addTextViewWithElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C948E8];
  id v19 = [v9 editorialLayoutForLabelElement:v8 width:a4];
  v20 = [v19 bodyTextLayoutForOrientation:0];
  objc_msgSend(v18, "setContentInsets:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v18 setEnabled:0];
  objc_msgSend(v18, "setFixedWidthTextFrame:", objc_msgSend(v20, "textFrame"));
  uint64_t v21 = [v8 moreButtonTitle];
  [v18 setMoreButtonTitle:v21];

  int v22 = [v20 requiresTruncation];
  uint64_t v23 = 0;
  if (v22)
  {
    if ([v9 isEditorialLayoutExpanded:v19]) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = [v8 isEnabled];
    }
  }
  [v18 setUserInteractionEnabled:v23];
  if ([v9 isEditorialLayoutExpanded:v19]) {
    uint64_t v24 = 0;
  }
  else {
    uint64_t v24 = [v8 numberOfLines];
  }
  [v18 setNumberOfVisibleLines:v24];

  return v18;
}

- (id)addTomatoRatingViewWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v10 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v10) {
        -[SKUIViewModification(SKUIViewElementView) addTomatoRatingViewWithViewElement:width:context:](v10, v11, v12, v13, v14, v15, v16, v17);
      }
    }
  }
  uint64_t v18 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:0x1F1C94928];
  [v18 reloadWithViewElement:v9 width:v8 context:a4];

  return v18;
}

- (id)_addImageViewWithReuseIdentifier:(id)a3 viewElement:(id)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:a3];
  uint64_t v11 = [v9 accessibilityText];
  [v10 setAccessibilityLabel:v11];

  objc_msgSend(v10, "setUserInteractionEnabled:", objc_msgSend(v9, "isEnabled"));
  uint64_t v12 = __RequestImage(v9, v8);
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
    id v5 = [[SKUIStoreIdentifier alloc] initWithLongLong:v4];
  }
  if (v5)
  {
    id v6 = +[SKUIItemStateCenter defaultCenter];
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
  id v10 = SKUIViewElementPlainColorWithStyle(v9, v8);

  [v20 setTintColor:v10];
  id v11 = v7;
  uint64_t v12 = v11;
  if (v11)
  {
    double v13 = v11;
    do
    {
      double v14 = v13;
      double v15 = [v13 style];
      double v16 = [v15 ikBackgroundColor];
      uint64_t v17 = SKUIViewElementPlainColorWithIKColor(v16, v8);

      double v13 = [v14 parent];
    }
    while (v13 && !v17);
  }
  else
  {
    uint64_t v17 = 0;
    double v13 = 0;
  }
  uint64_t v18 = [(id)objc_opt_class() cloudTintColorForBackgroundColor:v17];
  [v20 setCloudTintColor:v18];

  [v20 setElement:v12];
  objc_msgSend(v20, "setEnabled:", objc_msgSend(v12, "isEnabled"));
  objc_msgSend(v20, "setDisabledButSelectable:", objc_msgSend(v12, "isDisabledButSelectable"));
  id v19 = [v12 badgeResourceName];
  objc_msgSend(v20, "setUniversal:", objc_msgSend(v19, "isEqualToString:", @"plus"));
}

- (id)_attributedStringViewForLayout:(id)a3
{
  [a3 edgeInsetsForShadow];
  BOOL v10 = v7 == *(double *)(MEMORY[0x1E4FB2848] + 16)
     && v6 == *(double *)(MEMORY[0x1E4FB2848] + 24)
     && v4 == *MEMORY[0x1E4FB2848]
     && v5 == *(double *)(MEMORY[0x1E4FB2848] + 8);
  id v11 = SKUIViewReuseAttributedStringIdentifier;
  if (!v10) {
    id v11 = SKUIViewReuseAttributedStringWrapperIdentifier;
  }
  uint64_t v12 = [(SKUIViewModification *)self addReusableViewWithReuseIdentifier:*v11];

  return v12;
}

- (void)initWithViewReusePool:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIViewModification initWithViewReusePool:]";
}

@end
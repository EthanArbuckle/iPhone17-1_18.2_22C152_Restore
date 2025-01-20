@interface TransitArtworkListView
+ ($8502DCEA08BBBE1AB2005217B3838BBD)_metricsForIdiom:(SEL)a3;
+ (double)transitArtworkListHeight;
- ($8502DCEA08BBBE1AB2005217B3838BBD)_metrics;
- (CGSize)intrinsicContentSize;
- (NSArray)artworkData;
- (TransitArtworkListView)initWithCoder:(id)a3;
- (TransitArtworkListView)initWithFrame:(CGRect)a3;
- (UIColor)overrideTintColor;
- (UIImage)arrowImage;
- (UIImage)incidentBadgeImage;
- (double)maxWidth;
- (double)singleLineWidth;
- (float)verticalContentCompressionResistancePriority;
- (float)verticalContentHuggingPriority;
- (id)_addViewForArtwork:(id)a3 inContainer:(id)a4 constraints:(id)a5 previousViewInSegment:(id)a6 leadingSpacing:(double)a7;
- (id)_arrowImageView;
- (id)_createSizeConstraintsForArtworkViews:(id)a3;
- (id)_segmentContainer;
- (int64_t)shieldSize;
- (unint64_t)numberOfLines;
- (unint64_t)separatorStyle;
- (void)_commonInit;
- (void)_configureContainerWithBackgroundIfNeeded:(id)a3 constraints:(id)a4;
- (void)_createNewMultilineShieldView;
- (void)_updateArtworkImageViewWithArtworks;
- (void)_updateTintColor:(id)a3;
- (void)_updateTintColorForArrowImageView:(id)a3;
- (void)_updateTintColorForView:(id)a3;
- (void)layoutSubviews;
- (void)setArtworkData:(id)a3;
- (void)setMaxWidth:(double)a3;
- (void)setOverrideTintColor:(id)a3;
- (void)setSeparatorStyle:(unint64_t)a3;
- (void)setShieldSize:(int64_t)a3;
- (void)setVerticalContentCompressionResistancePriority:(float)a3;
- (void)setVerticalContentHuggingPriority:(float)a3;
@end

@implementation TransitArtworkListView

- (TransitArtworkListView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransitArtworkListView;
  v3 = -[TransitArtworkListView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TransitArtworkListView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (TransitArtworkListView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TransitArtworkListView;
  v3 = [(TransitArtworkListView *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(TransitArtworkListView *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (void)_commonInit
{
  [(TransitArtworkListView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_separatorStyle = 0;
  [(TransitArtworkListView *)self setShieldSize:6];

  [(TransitArtworkListView *)self setAccessibilityIdentifier:@"TransitArtworkList"];
}

- ($8502DCEA08BBBE1AB2005217B3838BBD)_metrics
{
  v5 = objc_opt_class();
  id v8 = [(TransitArtworkListView *)self traitCollection];
  id v6 = [v8 userInterfaceIdiom];
  if (v5)
  {
    [v5 _metricsForIdiom:v6];
  }
  else
  {
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var6 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }

  return result;
}

+ ($8502DCEA08BBBE1AB2005217B3838BBD)_metricsForIdiom:(SEL)a3
{
  if (a4 == 4)
  {
    v4 = &xmmword_100F72E50;
  }
  else if (a4 == 5)
  {
    v4 = &xmmword_100F72E10;
  }
  else
  {
    v4 = &xmmword_100F72E90;
  }
  long long v5 = v4[1];
  *(_OWORD *)&retstr->var0 = *v4;
  *(_OWORD *)&retstr->var2 = v5;
  long long v6 = v4[3];
  *(_OWORD *)&retstr->var4 = v4[2];
  *(_OWORD *)&retstr->var6 = v6;
  return result;
}

- (void)setArtworkData:(id)a3
{
  long long v5 = (NSArray *)a3;
  if (self->_artworkData != v5)
  {
    long long v6 = v5;
    objc_storeStrong((id *)&self->_artworkData, a3);
    [(TransitArtworkListView *)self _updateArtworkImageViewWithArtworks];
    long long v5 = v6;
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)TransitArtworkListView;
  [(TransitArtworkListView *)&v6 layoutSubviews];
  [(TransitArtworkListView *)self bounds];
  if (self->_lastSize.width != v3 || self->_lastSize.height != v4)
  {
    self->_lastSize.width = v3;
    self->_lastSize.height = v4;
    [(MultilineWrappingListView *)self->_multilineWrappingStackView invalidateIntrinsicContentSize];
    [(TransitArtworkListView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  [(MultilineWrappingListView *)self->_multilineWrappingStackView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    [(NSLayoutConstraint *)self->_maxWidthConstraint setConstant:a3];
    [(NSLayoutConstraint *)self->_maxWidthConstraint setActive:a3 > 0.0];
    [(MultilineWrappingListView *)self->_multilineWrappingStackView invalidateIntrinsicContentSize];
    [(TransitArtworkListView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setOverrideTintColor:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_overrideTintColor;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_overrideTintColor, a3);
      [(TransitArtworkListView *)self _updateTintColor:v9];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)_updateTintColor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    id v5 = self->_artworkImageViews;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          v11 = [(TransitArtworkListView *)self traitCollection];
          if ([v11 userInterfaceIdiom] == (id)5)
          {
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              [v10 setTextColor:v4];
              continue;
            }
          }
          else
          {
          }
          [v10 setTintColor:v4];
        }
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v7);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v13 = self->_arrowImageViews;
    id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) setTintColor:v4];
        }
        id v15 = [(NSArray *)v13 countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v15);
    }
  }
  else
  {
    long long v33 = 0uLL;
    long long v34 = 0uLL;
    long long v31 = 0uLL;
    long long v32 = 0uLL;
    v18 = self->_artworkImageViews;
    id v19 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v44 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (k = 0; k != v20; k = (char *)k + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          [(TransitArtworkListView *)self _updateTintColorForView:*(void *)(*((void *)&v31 + 1) + 8 * (void)k)];
        }
        id v20 = [(NSArray *)v18 countByEnumeratingWithState:&v31 objects:v44 count:16];
      }
      while (v20);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v13 = self->_arrowImageViews;
    id v23 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v43 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v28;
      do
      {
        for (m = 0; m != v24; m = (char *)m + 1)
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v13);
          }
          -[TransitArtworkListView _updateTintColorForArrowImageView:](self, "_updateTintColorForArrowImageView:", *(void *)(*((void *)&v27 + 1) + 8 * (void)m), (void)v27);
        }
        id v24 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v43 count:16];
      }
      while (v24);
    }
  }
}

- (void)_updateTintColorForView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v3 = v5;
    id v4 = +[UIColor secondaryLabelColor];
    [v3 setTintColor:v4];
  }
}

- (void)_updateTintColorForArrowImageView:(id)a3
{
  id v4 = a3;
  id v6 = [(TransitArtworkListView *)self traitCollection];
  if ([v6 userInterfaceIdiom] == (id)5) {
    +[UIColor secondaryLabelColor];
  }
  else {
  id v5 = +[UIColor labelColor];
  }
  [v4 setTintColor:v5];
}

- (void)_updateArtworkImageViewWithArtworks
{
  v57 = +[NSMutableArray array];
  v55 = +[NSMutableArray array];
  v58 = +[NSMutableArray array];
  long long v77 = 0u;
  long long v75 = 0u;
  memset(v76, 0, sizeof(v76));
  [(TransitArtworkListView *)self _metrics];
  [(TransitArtworkListView *)self _createNewMultilineShieldView];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  obj = self->_artworkData;
  id v48 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (!v48)
  {
    unsigned __int8 v45 = 0;
    goto LABEL_59;
  }
  unsigned __int8 v45 = 0;
  uint64_t v3 = 0;
  uint64_t v47 = *(void *)v72;
  do
  {
    for (id i = 0; i != v48; id i = v38 + 1)
    {
      if (*(void *)v72 != v47) {
        objc_enumerationMutation(obj);
      }
      v50 = (char *)i;
      id v5 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v6 = v5;
      id v7 = [v6 countByEnumeratingWithState:&v67 objects:v80 count:16];
      if (v7)
      {
        id v8 = v7;
        unint64_t v9 = 0;
        uint64_t v10 = *(void *)v68;
        do
        {
          for (j = 0; j != v8; j = (char *)j + 1)
          {
            if (*(void *)v68 != v10) {
              objc_enumerationMutation(v6);
            }
            v9 += (unint64_t)[*(id *)(*((void *)&v67 + 1) + 8 * (void)j) count];
          }
          id v8 = [v6 countByEnumeratingWithState:&v67 objects:v80 count:16];
        }
        while (v8);

        if (v9 > 2)
        {
LABEL_17:
          id v14 = 0;
          int v49 = 0;
          goto LABEL_19;
        }
      }
      else
      {
      }
      v12 = [(TransitArtworkListView *)self traitCollection];
      id v13 = [v12 userInterfaceIdiom];

      if (v13 == (id)5) {
        goto LABEL_17;
      }
      id v14 = [(TransitArtworkListView *)self _segmentContainer];
      int v49 = 1;
LABEL_19:
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v51 = v6;
      id v53 = [v51 countByEnumeratingWithState:&v63 objects:v79 count:16];
      id v15 = 0;
      if (v53)
      {
        uint64_t v52 = *(void *)v64;
        char v16 = 1;
        do
        {
          for (k = 0; k != v53; k = (char *)k + 1)
          {
            if (*(void *)v64 != v52) {
              objc_enumerationMutation(v51);
            }
            v18 = *(void **)(*((void *)&v63 + 1) + 8 * (void)k);
            long long v59 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            id v56 = v18;
            id v19 = [v56 countByEnumeratingWithState:&v59 objects:v78 count:16];
            if (v19)
            {
              id v20 = v19;
              v54 = k;
              uint64_t v21 = 0;
              uint64_t v22 = *(void *)v60;
              do
              {
                for (m = 0; m != v20; m = (char *)m + 1)
                {
                  id v24 = v15;
                  if (*(void *)v60 != v22) {
                    objc_enumerationMutation(v56);
                  }
                  uint64_t v25 = *(void **)(*((void *)&v59 + 1) + 8 * (void)m);
                  if ((([(TransitArtworkListView *)self separatorStyle] == 0) & v16) == 1
                    && v3 != 0)
                  {
                    long long v27 = [(TransitArtworkListView *)self arrowImage];

                    if (v27)
                    {
                      long long v28 = [(TransitArtworkListView *)self _arrowImageView];
                      [(MultilineWrappingListView *)self->_multilineWrappingStackView addArrangedSubview:v28];
                      [v55 addObject:v28];
                      ++v3;
                    }
                  }
                  if (v24)
                  {
                    if ([v25 artworkSourceType] == 3)
                    {
                      double v29 = *((double *)v76 + 1);
                    }
                    else
                    {
                      long long v30 = (double *)&v75 + 1;
                      if (v21) {
                        long long v30 = (double *)v76;
                      }
                      double v29 = *v30;
                    }
                  }
                  else
                  {
                    double v29 = *(double *)&v75;
                  }
                  long long v31 = [(TransitArtworkListView *)self _addViewForArtwork:v25 inContainer:v14 constraints:v58 previousViewInSegment:v24 leadingSpacing:v29];
                  [v57 addObject:v31];
                  id v15 = v31;

                  char v16 = 0;
                  ++v3;
                  uint64_t v21 = v15;
                }
                id v20 = [v56 countByEnumeratingWithState:&v59 objects:v78 count:16];
                char v16 = 0;
                uint64_t v21 = v15;
              }
              while (v20);

              char v16 = 0;
              k = v54;
            }
          }
          id v53 = [v51 countByEnumeratingWithState:&v63 objects:v79 count:16];
        }
        while (v53);
      }

      if (v49)
      {
        long long v32 = v14;
        long long v33 = [v14 subviews];
        id v34 = [v33 count];

        if (v34 && v15)
        {
          [(TransitArtworkListView *)self _configureContainerWithBackgroundIfNeeded:v32 constraints:v58];
          long long v35 = [v32 trailingAnchor];
          long long v36 = [v15 trailingAnchor];
          long long v37 = [v35 constraintEqualToAnchor:v36];
          [v58 addObject:v37];

          [(MultilineWrappingListView *)self->_multilineWrappingStackView addArrangedSubview:v32];
          if (v45) {
            unsigned __int8 v45 = 1;
          }
          else {
            unsigned __int8 v45 = [v32 showBackground];
          }
        }
        long long v38 = v50;
      }
      else
      {
        long long v38 = v50;
        long long v32 = v14;
      }
    }
    id v48 = [(NSArray *)obj countByEnumeratingWithState:&v71 objects:v81 count:16];
  }
  while (v48);
LABEL_59:

  if ([v57 count])
  {
    long long v39 = [(TransitArtworkListView *)self _createSizeConstraintsForArtworkViews:v57];
    [v58 addObjectsFromArray:v39];
  }
  if (v45) {
    [(MultilineWrappingListView *)self->_multilineWrappingStackView setMaxLineHeight:*(double *)&v77];
  }
  long long v40 = (NSArray *)[v57 copy];
  artworkImageViews = self->_artworkImageViews;
  self->_artworkImageViews = v40;

  long long v42 = (NSArray *)[v55 copy];
  arrowImageViews = self->_arrowImageViews;
  self->_arrowImageViews = v42;

  v44 = [(TransitArtworkListView *)self overrideTintColor];
  [(TransitArtworkListView *)self _updateTintColor:v44];

  +[NSLayoutConstraint activateConstraints:v58];
}

- (void)_createNewMultilineShieldView
{
  [(MultilineWrappingListView *)self->_multilineWrappingStackView removeFromSuperview];
  [(TransitArtworkListView *)self _metrics];
  uint64_t v3 = -[MultilineWrappingListView initWithFrame:]([MultilineWrappingListView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  multilineWrappingStackView = self->_multilineWrappingStackView;
  self->_multilineWrappingStackView = v3;

  [(MultilineWrappingListView *)self->_multilineWrappingStackView setInterlineSpacing:0.0];
  [(MultilineWrappingListView *)self->_multilineWrappingStackView setMaxLineHeight:0.0];
  [(MultilineWrappingListView *)self->_multilineWrappingStackView setHorizontalSpacing:0.0];
  [(TransitArtworkListView *)self verticalContentHuggingPriority];
  if (v5 > 0.0)
  {
    id v6 = self->_multilineWrappingStackView;
    [(TransitArtworkListView *)self verticalContentHuggingPriority];
    -[MultilineWrappingListView setContentHuggingPriority:forAxis:](v6, "setContentHuggingPriority:forAxis:", 1);
  }
  [(MultilineWrappingListView *)self->_multilineWrappingStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MultilineWrappingListView *)self->_multilineWrappingStackView setAccessibilityIdentifier:@"MultilineWrappingStackView"];
  [(TransitArtworkListView *)self addSubview:self->_multilineWrappingStackView];
  id v7 = [(MultilineWrappingListView *)self->_multilineWrappingStackView widthAnchor];
  id v8 = [v7 constraintLessThanOrEqualToConstant:self->_maxWidth];
  maxWidthConstraint = self->_maxWidthConstraint;
  self->_maxWidthConstraint = v8;

  [(NSLayoutConstraint *)self->_maxWidthConstraint setActive:self->_maxWidth > 0.0];
  uint64_t v22 = [(MultilineWrappingListView *)self->_multilineWrappingStackView leadingAnchor];
  uint64_t v21 = [(TransitArtworkListView *)self leadingAnchor];
  id v20 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v20;
  uint64_t v10 = [(MultilineWrappingListView *)self->_multilineWrappingStackView trailingAnchor];
  v11 = [(TransitArtworkListView *)self trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v23[1] = v12;
  id v13 = [(MultilineWrappingListView *)self->_multilineWrappingStackView topAnchor];
  id v14 = [(TransitArtworkListView *)self topAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  v23[2] = v15;
  char v16 = [(MultilineWrappingListView *)self->_multilineWrappingStackView bottomAnchor];
  v17 = [(TransitArtworkListView *)self bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v23[3] = v18;
  id v19 = +[NSArray arrayWithObjects:v23 count:4];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (id)_addViewForArtwork:(id)a3 inContainer:(id)a4 constraints:(id)a5 previousViewInSegment:(id)a6 leadingSpacing:(double)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v12 artworkSourceType] == 3)
  {
    id v16 = [objc_alloc((Class)MKArtworkLabelView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v17 = objc_alloc((Class)GEOComposedString);
    v18 = [v12 textDataSource];
    id v19 = [v18 text];
    id v20 = [v17 initWithGeoFormattedString:v19];

    uint64_t v21 = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v20];
    [v16 setFormattedString:v21];
LABEL_3:

    goto LABEL_5;
  }
  id v16 = [objc_alloc((Class)MKArtworkImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v20 = [objc_alloc((Class)MKSizedTransitArtwork) initWithArtwork:v12 shieldSize:[self shieldSize]];
  [v16 setImageSource:v20];
  uint64_t v22 = [v16 image];

  if (!v22)
  {
    uint64_t v21 = sub_10000AF10();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v33 = 138412290;
      id v34 = v12;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to construct an image for artwork: %@", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_3;
  }
LABEL_5:

  [(TransitArtworkListView *)self _updateTintColorForView:v16];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (v13)
  {
    [v13 addSubview:v16];
    id v23 = [v16 leadingAnchor];
    if (v15)
    {
      id v24 = [v15 trailingAnchor];
      [v23 constraintEqualToAnchor:v24 constant:a7];
    }
    else
    {
      id v24 = [v13 leadingAnchor];
      [v23 constraintEqualToAnchor:v24];
    uint64_t v25 = };

    [v14 addObject:v25];
    v26 = [v16 centerYAnchor];
    long long v27 = [v13 centerYAnchor];
    long long v28 = [v26 constraintEqualToAnchor:v27];
    [v14 addObject:v28];

    double v29 = [v16 topAnchor];
    long long v30 = [v13 topAnchor];
    long long v31 = [v29 constraintGreaterThanOrEqualToAnchor:v30];
    [v14 addObject:v31];
  }
  else
  {
    [(MultilineWrappingListView *)self->_multilineWrappingStackView addArrangedSubview:v16 withCustomHorizontalSpacing:a7];
  }
  [v16 setAccessibilityIdentifier:@"ArtworkView"];

  return v16;
}

- (id)_segmentContainer
{
  double v2 = -[TransitArtworkSegmentContainer initWithFrame:]([TransitArtworkSegmentContainer alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(TransitArtworkSegmentContainer *)v2 setClipsToBounds:0];
  [(TransitArtworkSegmentContainer *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  [(TransitArtworkSegmentContainer *)v2 setAccessibilityIdentifier:v4];

  return v2;
}

- (id)_arrowImageView
{
  id v3 = [objc_alloc((Class)UIImageView) initWithImage:0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v4) = 1148846080;
  [v3 _mapkit_setContentCompressionResistancePriority:0 forAxis:v4];
  LODWORD(v5) = 1148846080;
  [v3 _mapkit_setContentHuggingPriority:1 forAxis:v5];
  LODWORD(v6) = 1148846080;
  [v3 _mapkit_setContentCompressionResistancePriority:0 forAxis:v6];
  LODWORD(v7) = 1148846080;
  [v3 _mapkit_setContentCompressionResistancePriority:1 forAxis:v7];
  id v8 = [(TransitArtworkListView *)self arrowImage];
  [v3 setImage:v8];

  [(TransitArtworkListView *)self _updateTintColorForArrowImageView:v3];
  [v3 setAccessibilityIdentifier:@"ArrowImageView"];

  return v3;
}

- (UIImage)arrowImage
{
  arrowImage = self->_arrowImage;
  if (!arrowImage)
  {
    double v4 = [(TransitArtworkListView *)self traitCollection];
    if ([v4 userInterfaceIdiom] == (id)5) {
      double v5 = 5.0;
    }
    else {
      double v5 = 8.0;
    }

    double v6 = +[UIImage systemImageNamed:@"arrowtriangle.forward.fill"];
    double v7 = +[UIImageSymbolConfiguration configurationWithPointSize:2 weight:v5];
    id v8 = [v6 imageWithConfiguration:v7];
    unint64_t v9 = self->_arrowImage;
    self->_arrowImage = v8;

    arrowImage = self->_arrowImage;
  }

  return arrowImage;
}

- (void)_configureContainerWithBackgroundIfNeeded:(id)a3 constraints:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 subviews];
  if (![v8 count]) {
    goto LABEL_4;
  }
  unint64_t v9 = [v6 subviews];
  uint64_t v10 = [v9 lastObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [v6 setShowBackground:1];
    id v8 = [v6 heightAnchor];
    [(TransitArtworkListView *)self _metrics];
    id v12 = [v8 constraintEqualToConstant:v13];
    [v7 addObject:v12];

LABEL_4:
  }
}

- (id)_createSizeConstraintsForArtworkViews:(id)a3
{
  id v4 = a3;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  [(TransitArtworkListView *)self _metrics];
  double v5 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v4;
  id v42 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v42)
  {
    uint64_t v7 = *(void *)v44;
    long long v38 = (double *)&v50 + 1;
    id v39 = v6;
    long long v40 = v5;
    uint64_t v41 = *(void *)v44;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(v6);
        }
        unint64_t v9 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 image];
          if (v10)
          {
            v11 = (void *)v10;
            id v12 = [v9 image];
            [v12 size];
            double v14 = v13;

            if (v14 > 0.0)
            {
              id v15 = v9;
              id v16 = [v15 image];
              [v16 size];
              double v18 = v17;
              double v20 = v19;

              if (v20 <= 0.0) {
                goto LABEL_18;
              }
              uint64_t v21 = [v15 superview];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v22 = [v15 superview];

                if (v22)
                {
                  unsigned __int8 v23 = [v22 showBackground];
                  id v24 = v38;
                  if (v23) {
                    goto LABEL_22;
                  }
                }
              }
              else
              {

                uint64_t v22 = 0;
              }
              id v24 = (double *)&v49 + 1;
LABEL_22:
              double v32 = v18 / v20;
              if (*v24 < v20) {
                double v20 = *v24;
              }
              long long v27 = [v15 heightAnchor];
              long long v28 = [v27 constraintEqualToConstant:v20];
              v53[0] = v28;
              double v29 = [v15 widthAnchor];
              int v33 = [v15 heightAnchor];
              id v34 = [v29 constraintEqualToAnchor:v33 multiplier:v32];
              v53[1] = v34;
              long long v35 = +[NSArray arrayWithObjects:v53 count:2];
              double v5 = v40;
              [v40 addObjectsFromArray:v35];

              id v6 = v39;
              uint64_t v7 = v41;
              goto LABEL_17;
            }
          }
        }
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        v26 = [v9 heightAnchor];
        id v15 = v26;
        if (isKindOfClass)
        {
          uint64_t v22 = [v26 constraintEqualToConstant:*((double *)&v49 + 1)];
          v52[0] = v22;
          long long v27 = [v9 widthAnchor];
          long long v28 = [v27 constraintEqualToConstant:0.0];
          v52[1] = v28;
          double v29 = +[NSArray arrayWithObjects:v52 count:2];
          [v5 addObjectsFromArray:v29];
        }
        else
        {
          uint64_t v22 = [v26 constraintLessThanOrEqualToConstant:*((double *)&v49 + 1)];
          v51[0] = v22;
          long long v27 = [v9 centerYAnchor];
          long long v28 = [v9 superview];
          double v29 = [v28 centerYAnchor];
          long long v30 = [v27 constraintEqualToAnchor:v29];
          v51[1] = v30;
          long long v31 = +[NSArray arrayWithObjects:v51 count:2];
          [v5 addObjectsFromArray:v31];

          uint64_t v7 = v41;
        }
LABEL_17:

LABEL_18:
        id v8 = (char *)v8 + 1;
      }
      while (v42 != v8);
      id v36 = [v6 countByEnumeratingWithState:&v43 objects:v54 count:16];
      id v42 = v36;
    }
    while (v36);
  }

  return v5;
}

- (unint64_t)numberOfLines
{
  return [(MultilineWrappingListView *)self->_multilineWrappingStackView numberOfLines];
}

- (double)singleLineWidth
{
  [(MultilineWrappingListView *)self->_multilineWrappingStackView singleLineWidth];
  return result;
}

- (void)setVerticalContentHuggingPriority:(float)a3
{
  if (self->_verticalContentHuggingPriority != a3)
  {
    self->_verticalContentHuggingPriority = a3;
    -[MultilineWrappingListView setContentHuggingPriority:forAxis:](self->_multilineWrappingStackView, "setContentHuggingPriority:forAxis:", 1);
  }
}

- (void)setVerticalContentCompressionResistancePriority:(float)a3
{
  if (self->_verticalContentCompressionResistancePriority != a3)
  {
    self->_verticalContentCompressionResistancePriority = a3;
    -[MultilineWrappingListView setContentCompressionResistancePriority:forAxis:](self->_multilineWrappingStackView, "setContentCompressionResistancePriority:forAxis:", 1);
  }
}

+ (double)transitArtworkListHeight
{
  id v3 = +[UIDevice currentDevice];
  [a1 _metricsForIdiom:[v3 userInterfaceIdiom]];

  return v5;
}

- (UIImage)incidentBadgeImage
{
  return self->_incidentBadgeImage;
}

- (int64_t)shieldSize
{
  return self->_shieldSize;
}

- (void)setShieldSize:(int64_t)a3
{
  self->_shieldSize = a3;
}

- (unint64_t)separatorStyle
{
  return self->_separatorStyle;
}

- (void)setSeparatorStyle:(unint64_t)a3
{
  self->_separatorStyle = a3;
}

- (NSArray)artworkData
{
  return self->_artworkData;
}

- (UIColor)overrideTintColor
{
  return self->_overrideTintColor;
}

- (float)verticalContentHuggingPriority
{
  return self->_verticalContentHuggingPriority;
}

- (float)verticalContentCompressionResistancePriority
{
  return self->_verticalContentCompressionResistancePriority;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTintColor, 0);
  objc_storeStrong((id *)&self->_artworkData, 0);
  objc_storeStrong((id *)&self->_incidentBadgeImage, 0);
  objc_storeStrong((id *)&self->_arrowImage, 0);
  objc_storeStrong((id *)&self->_maxWidthConstraint, 0);
  objc_storeStrong((id *)&self->_multilineWrappingStackView, 0);
  objc_storeStrong((id *)&self->_arrowImageViews, 0);

  objc_storeStrong((id *)&self->_artworkImageViews, 0);
}

@end
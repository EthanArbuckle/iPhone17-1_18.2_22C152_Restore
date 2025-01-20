@interface TransitDirectionsListView
- (BOOL)isActiveTransitDirectionsListItem:(id)a3;
- (TransitDirectionsListView)initWithFrame:(CGRect)a3;
- (TransitDirectionsListViewDataSource)dataSource;
- (TransitDirectionsListViewDelegate)listDelegate;
- (UIView)footerView;
- (double)stepBackgroundAlpha;
- (id)_allStepViewsForSection:(int64_t)a3;
- (id)_allStepViewsInSectionForStepView:(id)a3;
- (id)_constraintsForBackgroundView:(id)a3 foregroundViews:(id)a4;
- (id)_indexPathForStepView:(id)a3;
- (id)_requestStepViewForIndexPath:(id)a3;
- (id)_requestStepViewsForSectionAtIndex:(int64_t)a3;
- (id)allStepViews;
- (id)dequeueStepViewForItem:(id)a3;
- (id)indexPathForStepView:(id)a3;
- (id)stepViewForIndexPath:(id)a3;
- (id)stepViewForItem:(id)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_addHighlightForStepView:(id)a3;
- (void)_clearHighlight;
- (void)_clearHighlightForStepView:(id)a3;
- (void)_refreshSeparatorsAroundActiveStepView:(id)a3;
- (void)_requestSeparatorForStepView:(id)a3 atIndexPath:(id)a4;
- (void)_setActiveStepView:(id)a3 withIdentifier:(id)a4;
- (void)_updateVisibleAdvisories;
- (void)clearActiveTransitListItem;
- (void)didMoveToWindow;
- (void)reloadData;
- (void)reloadSectionAtIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadSeparators;
- (void)setActiveTransitDirectionsListItem:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setListDelegate:(id)a3;
- (void)setStepBackgroundAlpha:(double)a3;
- (void)stepViewHighlighted:(id)a3;
- (void)stepViewSelected:(id)a3;
@end

@implementation TransitDirectionsListView

- (TransitDirectionsListView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)TransitDirectionsListView;
  v3 = -[TransitDirectionsListView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(TransitDirectionsListView *)v3 setAccessibilityIdentifier:@"TransitDirectionsListView"];
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    visibleAdvisories = v4->_visibleAdvisories;
    v4->_visibleAdvisories = v5;

    v4->_stepBackgroundAlpha = 1.0;
    id v7 = objc_alloc((Class)UIView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v11 = [v7 initWithFrame:CGRectZero.origin.x, y, width, height];
    activeItemBackgroundView = v4->_activeItemBackgroundView;
    v4->_activeItemBackgroundView = v11;

    [(UIView *)v4->_activeItemBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIColor quaternarySystemFillColor];
    [(UIView *)v4->_activeItemBackgroundView setBackgroundColor:v13];

    [(UIView *)v4->_activeItemBackgroundView setHidden:1];
    [(TransitDirectionsListView *)v4 addSubview:v4->_activeItemBackgroundView];
    v14 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    highlightBackgroundView = v4->_highlightBackgroundView;
    v4->_highlightBackgroundView = v14;

    [(UIView *)v4->_highlightBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[UIColor quaternarySystemFillColor];
    [(UIView *)v4->_highlightBackgroundView setBackgroundColor:v16];

    [(UIView *)v4->_highlightBackgroundView setHidden:1];
    [(TransitDirectionsListView *)v4 addSubview:v4->_highlightBackgroundView];
    id v17 = objc_alloc((Class)UIStackView);
    [(TransitDirectionsListView *)v4 bounds];
    v18 = [v17 initWithFrame:];
    stackView = v4->_stackView;
    v4->_stackView = v18;

    [(UIStackView *)v4->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v4->_stackView setDistribution:0];
    [(UIStackView *)v4->_stackView setAlignment:0];
    [(UIStackView *)v4->_stackView setAxis:1];
    [(UIStackView *)v4->_stackView setSpacing:0.0];
    LODWORD(v20) = 1148846080;
    [(UIStackView *)v4->_stackView setContentHuggingPriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(UIStackView *)v4->_stackView setContentCompressionResistancePriority:1 forAxis:v21];
    [(TransitDirectionsListView *)v4 addSubview:v4->_stackView];
    id v22 = objc_alloc_init((Class)NSMutableArray);
    v23 = [(UIStackView *)v4->_stackView widthAnchor];
    v24 = [(TransitDirectionsListView *)v4 frameLayoutGuide];
    v25 = [v24 widthAnchor];
    v26 = [v23 constraintEqualToAnchor:v25];
    [v22 addObject:v26];

    v27 = [(UIView *)v4->_highlightBackgroundView leadingAnchor];
    v28 = [(TransitDirectionsListView *)v4 leadingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    [v22 addObject:v29];

    v30 = [(UIView *)v4->_highlightBackgroundView trailingAnchor];
    v31 = [(TransitDirectionsListView *)v4 trailingAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [v22 addObject:v32];

    v33 = [(UIView *)v4->_activeItemBackgroundView leadingAnchor];
    v34 = [(TransitDirectionsListView *)v4 leadingAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    [v22 addObject:v35];

    v36 = [(UIView *)v4->_activeItemBackgroundView trailingAnchor];
    v37 = [(TransitDirectionsListView *)v4 trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    [v22 addObject:v38];

    LODWORD(v39) = 1148846080;
    v40 = [(UIStackView *)v4->_stackView _maps_constraintsEqualToEdgesOfView:v4 priority:v39];
    uint64_t v41 = [v40 bottomConstraint];
    stackViewToBottomConstraint = v4->_stackViewToBottomConstraint;
    v4->_stackViewToBottomConstraint = (NSLayoutConstraint *)v41;

    v43 = [v40 allConstraints];
    [v22 addObjectsFromArray:v43];

    +[NSLayoutConstraint activateConstraints:v22];
    [(TransitDirectionsListView *)v4 _addScrollViewScrollObserver:v4];
  }
  return v4;
}

- (id)viewForFirstBaselineLayout
{
  return [(UIStackView *)self->_stackView viewForFirstBaselineLayout];
}

- (id)viewForLastBaselineLayout
{
  return [(UIStackView *)self->_stackView viewForLastBaselineLayout];
}

- (id)dequeueStepViewForItem:(id)a3
{
  id v4 = a3;
  v5 = +[TransitDirectionsStepView reuseIdentifierForItem:v4];
  uint64_t v6 = [(NSMapTable *)self->_viewsByIdentifier objectForKey:v5];
  if (v6)
  {
    id v7 = (id)v6;
    v8 = sub_100656E54();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      goto LABEL_27;
    }
    v9 = self;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      v12 = [(TransitDirectionsListView *)v9 performSelector:"accessibilityIdentifier"];
      v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_8;
      }
    }
    v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_8:

    id v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v18 = (unint64_t)[v4 type];
    if (v18 >= 0x12)
    {
      v19 = +[NSString stringWithFormat:@"Unknown (%ld)", v18];
    }
    else
    {
      v19 = off_1012F33C8[v18];
    }
    *(_DWORD *)buf = 138544130;
    id v36 = v15;
    __int16 v37 = 2114;
    id v38 = v17;
    __int16 v39 = 2114;
    v40 = v5;
    __int16 v41 = 2114;
    v42 = v19;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Dequeued existing %{public}@ for %{public}@ of type %{public}@", buf, 0x2Au);

    goto LABEL_23;
  }
  double v20 = +[TransitDirectionsCell collectionCellClassForListItem:v4];
  if (objc_opt_respondsToSelector()) {
    double v21 = (objc_class *)[(objc_class *)v20 stepViewClass];
  }
  else {
    double v21 = (objc_class *)TransitDirectionsStepView;
  }
  id v7 = [[v21 alloc] initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v22 = sub_100656E54();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = self;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    if (objc_opt_respondsToSelector())
    {
      v26 = [(TransitDirectionsListView *)v23 performSelector:"accessibilityIdentifier"];
      v27 = v26;
      if (v26 && ![v26 isEqualToString:v25])
      {
        v28 = +[NSString stringWithFormat:@"%@<%p, %@>", v25, v23, v27];

        goto LABEL_19;
      }
    }
    v28 = +[NSString stringWithFormat:@"%@<%p>", v25, v23];
LABEL_19:

    id v29 = v28;
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v32 = (unint64_t)[v4 type];
    if (v32 >= 0x12)
    {
      v33 = +[NSString stringWithFormat:@"Unknown (%ld)", v32];
    }
    else
    {
      v33 = off_1012F33C8[v32];
    }
    *(_DWORD *)buf = 138544130;
    id v36 = v29;
    __int16 v37 = 2114;
    id v38 = v31;
    __int16 v39 = 2114;
    v40 = v5;
    __int16 v41 = 2114;
    v42 = v33;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "[%{public}@] Created new %{public}@ for %{public}@ of type %{public}@", buf, 0x2Au);
  }
  [v7 setSelectionDelegate:self];
LABEL_27:

  return v7;
}

- (id)stepViewForIndexPath:(id)a3
{
  v3 = [(NSMapTable *)self->_viewsByIndexPath objectForKey:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)stepViewForItem:(id)a3
{
  id v4 = +[TransitDirectionsStepView reuseIdentifierForItem:a3];
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_viewsByIdentifier objectForKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)allStepViews
{
  return [(UIStackView *)self->_stackView arrangedSubviews];
}

- (id)indexPathForStepView:(id)a3
{
  return [(NSMapTable *)self->_indexPathsByView objectForKey:a3];
}

- (void)reloadData
{
  v2 = self;
  v3 = [(TransitDirectionsListView *)self dataSource];

  id v4 = sub_100656E54();
  id v5 = v4;
  if (!v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
LABEL_117:

      viewsByIndexPath = v2->_viewsByIndexPath;
      v2->_viewsByIndexPath = 0;

      viewsByIdentifier = v2->_viewsByIdentifier;
      v2->_viewsByIdentifier = 0;

      indexPathsByView = v2->_indexPathsByView;
      v2->_indexPathsByView = 0;

      [(TransitDirectionsListView *)v2 clearActiveTransitListItem];
      [(UIStackView *)v2->_stackView _mapkit_setArrangedSubviews:&__NSArray0__struct];
      [(TransitDirectionsListView *)v2 invalidateIntrinsicContentSize];
      return;
    }
    v16 = v2;
    if (!v16)
    {
      double v21 = @"<nil>";
      goto LABEL_116;
    }
    id v17 = (objc_class *)objc_opt_class();
    unint64_t v18 = NSStringFromClass(v17);
    if (objc_opt_respondsToSelector())
    {
      v19 = [(TransitDirectionsListView *)v16 performSelector:"accessibilityIdentifier"];
      double v20 = v19;
      if (v19 && ![v19 isEqualToString:v18])
      {
        double v21 = +[NSString stringWithFormat:@"%@<%p, %@>", v18, v16, v20];

        goto LABEL_20;
      }
    }
    double v21 = +[NSString stringWithFormat:@"%@<%p>", v18, v16];
LABEL_20:

LABEL_116:
    *(_DWORD *)buf = 138543362;
    v129 = v21;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] Clearing everything, no data source", buf, 0xCu);

    goto LABEL_117;
  }
  os_signpost_id_t v6 = os_signpost_id_generate(v4);
  id v7 = v5;
  v8 = v7;
  unint64_t v116 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "reloadData", "", buf, 2u);
  }
  v115 = v8;

  v9 = sub_100656E54();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = v2;
    if (!v10)
    {
      id v15 = @"<nil>";
      goto LABEL_22;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      v13 = [(TransitDirectionsListView *)v10 performSelector:"accessibilityIdentifier"];
      v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        id v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_12;
      }
    }
    id v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_12:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v129 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadData start", buf, 0xCu);
  }
  os_signpost_id_t spid = v6;

  id v22 = objc_alloc_init((Class)NSMutableArray);
  v23 = [(TransitDirectionsListView *)v2 dataSource];
  uint64_t v24 = (uint64_t)[v23 numberOfSectionsInTransitDirectionsListView:v2];

  if (v24 >= 1)
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      v26 = [(TransitDirectionsListView *)v2 _requestStepViewsForSectionAtIndex:i];
      [v22 addObjectsFromArray:v26];
    }
  }
  id v118 = +[NSMapTable strongToWeakObjectsMapTable];
  v27 = +[NSMapTable strongToWeakObjectsMapTable];
  id v117 = +[NSMapTable weakToStrongObjectsMapTable];
  id v119 = objc_alloc_init((Class)NSMutableArray);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id obj = v22;
  id v28 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
  v121 = v27;
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v125;
    v120 = v2;
    do
    {
      id v31 = 0;
      do
      {
        if (*(void *)v125 != v30) {
          objc_enumerationMutation(obj);
        }
        unint64_t v32 = *(void **)(*((void *)&v124 + 1) + 8 * (void)v31);
        v33 = [v32 stepView];
        v34 = [v33 reuseIdentifier];

        if (!v34)
        {
          id v36 = sub_100656E54();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
            goto LABEL_64;
          }
          v43 = v2;
          if (v2)
          {
            v44 = (objc_class *)objc_opt_class();
            objc_super v45 = NSStringFromClass(v44);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_47;
            }
            v46 = [(TransitDirectionsListView *)v43 performSelector:"accessibilityIdentifier"];
            v47 = v46;
            if (v46 && ![v46 isEqualToString:v45])
            {
              v48 = +[NSString stringWithFormat:@"%@<%p, %@>", v45, v43, v47];
            }
            else
            {

LABEL_47:
              v48 = +[NSString stringWithFormat:@"%@<%p>", v45, v43];
            }

            v27 = v121;
          }
          else
          {
            v48 = @"<nil>";
          }

          v61 = [v32 stepView];
          v62 = [v61 transitListItem];
          *(_DWORD *)buf = 138543618;
          v129 = v48;
          __int16 v130 = 2112;
          v131 = v62;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "[%{public}@] - skipping info, no identifier for item: %@", buf, 0x16u);

          v2 = v120;
          goto LABEL_64;
        }
        v35 = [v27 objectForKey:v34];

        if (!v35)
        {
          v49 = [v32 stepView];
          [v119 addObject:v49];

          v50 = [v32 stepView];
          [v27 setObject:v50 forKey:v34];

          v51 = [v32 stepView];
          v52 = [v32 indexPath];
          [v118 setObject:v51 forKey:v52];

          v53 = [v32 indexPath];
          v54 = [v32 stepView];
          [v117 setObject:v53 forKey:v54];

          id v36 = sub_100656E54();
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_64;
          }
          v55 = v2;
          if (v2)
          {
            v56 = (objc_class *)objc_opt_class();
            v57 = NSStringFromClass(v56);
            if ((objc_opt_respondsToSelector() & 1) == 0) {
              goto LABEL_55;
            }
            v58 = [(TransitDirectionsListView *)v55 performSelector:"accessibilityIdentifier"];
            v59 = v58;
            if (v58 && ![v58 isEqualToString:v57])
            {
              v60 = +[NSString stringWithFormat:@"%@<%p, %@>", v57, v55, v59];
            }
            else
            {

LABEL_55:
              v60 = +[NSString stringWithFormat:@"%@<%p>", v57, v55];
            }
          }
          else
          {
            v60 = @"<nil>";
          }

          v63 = v60;
          v64 = [v32 indexPath];
          v65 = [v32 stepView];

          v66 = (objc_class *)objc_opt_class();
          v67 = NSStringFromClass(v66);
          *(_DWORD *)buf = 138544130;
          v129 = v60;
          __int16 v130 = 2114;
          v131 = v64;
          __int16 v132 = 2112;
          v133 = v67;
          __int16 v134 = 2114;
          v135 = v34;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "[%{public}@] - added %{public}@: %@ : %{public}@", buf, 0x2Au);

          v2 = v120;
          goto LABEL_63;
        }
        id v36 = sub_100656E54();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
          goto LABEL_64;
        }
        __int16 v37 = v2;
        if (!v2)
        {
          v42 = @"<nil>";
          goto LABEL_58;
        }
        id v38 = (objc_class *)objc_opt_class();
        __int16 v39 = NSStringFromClass(v38);
        if (objc_opt_respondsToSelector())
        {
          v40 = [(TransitDirectionsListView *)v37 performSelector:"accessibilityIdentifier"];
          __int16 v41 = v40;
          if (v40 && ![v40 isEqualToString:v39])
          {
            v42 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41, spid, v115];

            goto LABEL_40;
          }
        }
        v42 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
LABEL_40:

LABEL_58:
        *(_DWORD *)buf = 138543618;
        v129 = v42;
        __int16 v130 = 2112;
        v131 = (NSString *)v34;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "[%{public}@] - skipping info, duplicate item identifier encountered: %@", buf, 0x16u);

LABEL_63:
        v27 = v121;
LABEL_64:

        id v31 = (char *)v31 + 1;
      }
      while (v29 != v31);
      id v68 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
      id v29 = v68;
    }
    while (v68);
  }

  objc_storeStrong((id *)&v2->_viewsByIndexPath, v118);
  objc_storeStrong((id *)&v2->_viewsByIdentifier, v27);
  objc_storeStrong((id *)&v2->_indexPathsByView, v117);
  v69 = sub_100656E54();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    v70 = v2;
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    if (objc_opt_respondsToSelector())
    {
      v73 = [(TransitDirectionsListView *)v70 performSelector:"accessibilityIdentifier"];
      v74 = v73;
      if (v73 && ![v73 isEqualToString:v72])
      {
        v75 = +[NSString stringWithFormat:@"%@<%p, %@>", v72, v70, v74, spid, v115];

        v27 = v121;
        goto LABEL_76;
      }

      v27 = v121;
    }
    v75 = +[NSString stringWithFormat:@"%@<%p>", v72, v70];
LABEL_76:

    v76 = (NSString *)[v119 count];
    *(_DWORD *)buf = 138543618;
    v129 = v75;
    __int16 v130 = 2048;
    v131 = v76;
    _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEBUG, "[%{public}@] - setting %lu views", buf, 0x16u);
  }
  [(UIStackView *)v2->_stackView _maps_setArrangedSubviews:v119];
  if (!v2->_activeItemIdentifier)
  {
    v87 = sub_100656E54();
    if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
LABEL_94:

      [(TransitDirectionsListView *)v2 clearActiveTransitListItem];
      goto LABEL_104;
    }
    v88 = v2;
    v89 = (objc_class *)objc_opt_class();
    v90 = NSStringFromClass(v89);
    if (objc_opt_respondsToSelector())
    {
      v91 = [(TransitDirectionsListView *)v88 performSelector:"accessibilityIdentifier"];
      v92 = v91;
      if (v91 && ![v91 isEqualToString:v90])
      {
        v93 = +[NSString stringWithFormat:@"%@<%p, %@>", v90, v88, v92];

        v27 = v121;
        goto LABEL_93;
      }

      v27 = v121;
    }
    v93 = +[NSString stringWithFormat:@"%@<%p>", v90, v88];
LABEL_93:

    *(_DWORD *)buf = 138543362;
    v129 = v93;
    _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "[%{public}@] - clearing active item", buf, 0xCu);

    goto LABEL_94;
  }
  v77 = [v27 objectForKey:];
  v78 = sub_100656E54();
  BOOL v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG);
  if (!v77)
  {
    if (!v79)
    {
LABEL_102:

      v100 = [(TransitDirectionsListView *)v2 dataSource];
      v101 = [v100 activeItemForTransitDirectionsListView:v2];

      [(TransitDirectionsListView *)v2 setActiveTransitDirectionsListItem:v101];
      goto LABEL_103;
    }
    v94 = v2;
    v95 = (objc_class *)objc_opt_class();
    v96 = NSStringFromClass(v95);
    if (objc_opt_respondsToSelector())
    {
      v97 = [(TransitDirectionsListView *)v94 performSelector:"accessibilityIdentifier"];
      v98 = v97;
      if (v97 && ![v97 isEqualToString:v96])
      {
        v99 = +[NSString stringWithFormat:@"%@<%p, %@>", v96, v94, v98];

        goto LABEL_101;
      }
    }
    v99 = +[NSString stringWithFormat:@"%@<%p>", v96, v94];
LABEL_101:

    *(_DWORD *)buf = 138543362;
    v129 = v99;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "[%{public}@] - re-fetching identifier for active item", buf, 0xCu);

    v27 = v121;
    goto LABEL_102;
  }
  if (v79)
  {
    v80 = v2;
    v81 = (objc_class *)objc_opt_class();
    v82 = NSStringFromClass(v81);
    if (objc_opt_respondsToSelector())
    {
      v83 = [(TransitDirectionsListView *)v80 performSelector:"accessibilityIdentifier"];
      v84 = v83;
      if (v83 && ![v83 isEqualToString:v82])
      {
        v85 = +[NSString stringWithFormat:@"%@<%p, %@>", v82, v80, v84];

        goto LABEL_85;
      }
    }
    v85 = +[NSString stringWithFormat:@"%@<%p>", v82, v80];
LABEL_85:

    activeItemIdentifier = v2->_activeItemIdentifier;
    *(_DWORD *)buf = 138543618;
    v129 = v85;
    __int16 v130 = 2114;
    v131 = activeItemIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "[%{public}@] - marking existing step view as active: %{public}@", buf, 0x16u);

    v27 = v121;
  }

  [(TransitDirectionsListView *)v2 _setActiveStepView:v77 withIdentifier:v2->_activeItemIdentifier];
LABEL_103:

LABEL_104:
  v123[0] = _NSConcreteStackBlock;
  v123[1] = 3221225472;
  v123[2] = sub_100658078;
  v123[3] = &unk_1012E5D08;
  v123[4] = v2;
  +[UIView performWithoutAnimation:v123];
  [(TransitDirectionsListView *)v2 invalidateIntrinsicContentSize];
  v102 = sub_100656E54();
  if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
  {
    v103 = v2;
    v104 = (objc_class *)objc_opt_class();
    v105 = NSStringFromClass(v104);
    if (objc_opt_respondsToSelector())
    {
      v106 = [(TransitDirectionsListView *)v103 performSelector:"accessibilityIdentifier"];
      v107 = v106;
      if (v106 && ![v106 isEqualToString:v105])
      {
        v108 = +[NSString stringWithFormat:@"%@<%p, %@>", v105, v103, v107];

        goto LABEL_110;
      }
    }
    v108 = +[NSString stringWithFormat:@"%@<%p>", v105, v103];
LABEL_110:

    *(_DWORD *)buf = 138543362;
    v129 = v108;
    _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadData end", buf, 0xCu);
  }
  v109 = v115;
  v110 = v109;
  if (v116 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v109))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v110, OS_SIGNPOST_INTERVAL_END, spid, "reloadData", "", buf, 2u);
  }
}

- (void)reloadSeparators
{
  v3 = [(TransitDirectionsListView *)self allStepViews];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10065813C;
  v5[3] = &unk_1012F3290;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  id v4 = [(NSMapTable *)self->_viewsByIdentifier objectForKey:self->_activeItemIdentifier];
  [(TransitDirectionsListView *)self _refreshSeparatorsAroundActiveStepView:v4];
}

- (id)_requestStepViewsForSectionAtIndex:(int64_t)a3
{
  id v5 = [(TransitDirectionsListView *)self dataSource];
  uint64_t v6 = (uint64_t)[v5 transitDirectionsListView:self numberOfItemsInSection:a3];

  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v6];
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v9 = +[NSIndexPath indexPathForItem:i inSection:a3];
      v10 = [(TransitDirectionsListView *)self _requestStepViewForIndexPath:v9];
      [v7 addObject:v10];
    }
  }

  return v7;
}

- (id)_requestStepViewForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(TransitDirectionsListView *)self dataSource];
  uint64_t v6 = [v5 transitDirectionsListView:self stepViewForItemAtIndexPath:v4];

  [(TransitDirectionsListView *)self _requestSeparatorForStepView:v6 atIndexPath:v4];
  id v7 = +[_TransitDirectionsListViewInfo infoWithStepView:v6 atIndexPath:v4];

  return v7;
}

- (void)_requestSeparatorForStepView:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  long long v22 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  long long v23 = v8;
  identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
  v10 = [v6 reuseIdentifier:v22];
  LOBYTE(identifiersForOverriddenSeparatorViews) = [(NSSet *)identifiersForOverriddenSeparatorViews containsObject:v10];

  if (identifiersForOverriddenSeparatorViews)
  {
    v11 = [v6 separatorView];
    [v11 setHidden:1];

    v12 = [v6 separatorView];
    [v12 setAlpha:1.0];
LABEL_5:

    goto LABEL_6;
  }
  v13 = [(TransitDirectionsListView *)self dataSource];
  v14 = [v6 transitListItem];
  unsigned int v15 = [v13 transitDirectionsListView:self shouldShowSeparatorForItem:v14 atIndexPath:v7 insets:&v22];

  uint64_t v16 = v15 ^ 1;
  id v17 = [v6 separatorView];
  [v17 setHidden:v16];

  unint64_t v18 = [v6 separatorView];
  [v18 setAlpha:1.0];

  if ((v16 & 1) == 0)
  {
    double v19 = *((double *)&v22 + 1);
    double v20 = [v6 separatorView];
    [v20 setLeadingMargin:v19];

    double v21 = *((double *)&v23 + 1);
    v12 = [v6 separatorView];
    [v12 setTrailingMargin:v21];
    goto LABEL_5;
  }
LABEL_6:
}

- (void)reloadSectionAtIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  long long v8 = (void (**)(id, void))a5;
  v9 = sub_100656E54();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    if (!v10)
    {
      id v17 = @"<nil>";
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      int64_t v13 = a3;
      v14 = v8;
      unsigned int v15 = [(TransitDirectionsListView *)v10 performSelector:"accessibilityIdentifier"];
      uint64_t v16 = v15;
      if (v15 && ![v15 isEqualToString:v12])
      {
        id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v16];

        long long v8 = v14;
        a3 = v13;
        goto LABEL_8;
      }

      long long v8 = v14;
      a3 = v13;
    }
    id v17 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v76 = v17;
    __int16 v77 = 2048;
    int64_t v78 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadSectionAtIndex: %lu", buf, 0x16u);
  }
  v64 = [(TransitDirectionsListView *)self _requestStepViewsForSectionAtIndex:a3];
  v65 = sub_100099700(v64, &stru_1012F32D0);
  unint64_t v18 = [(NSMapTable *)self->_viewsByIndexPath keyEnumerator];
  double v19 = [v18 allObjects];
  double v20 = [v19 sortedArrayUsingSelector:"compare:"];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v21 = v20;
  id v22 = [v21 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (!v22)
  {

    goto LABEL_33;
  }
  id v23 = v22;
  BOOL v62 = v5;
  v63 = v8;
  v69 = 0;
  uint64_t v24 = *(void *)v72;
  uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
  id v67 = v21;
  do
  {
    v25 = 0;
    id v68 = v23;
    do
    {
      if (*(void *)v72 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = *(void **)(*((void *)&v71 + 1) + 8 * (void)v25);
      if ([v26 section] == (id)a3)
      {
        int64_t v27 = a3;
        id v28 = [(NSMapTable *)self->_viewsByIndexPath objectForKey:v26];
        if (![v26 item])
        {
          id v29 = [(UIStackView *)self->_stackView arrangedSubviews];
          uint64_t v66 = (uint64_t)[v29 indexOfObject:v28];
        }
        ++v69;
        [(NSMapTable *)self->_viewsByIndexPath removeObjectForKey:v26];
        viewsByIdentifier = self->_viewsByIdentifier;
        id v31 = [v28 reuseIdentifier];
        [(NSMapTable *)viewsByIdentifier removeObjectForKey:v31];

        [(NSMapTable *)self->_indexPathsByView removeObjectForKey:v26];
        id v21 = v67;
        id v23 = v68;
        a3 = v27;
      }
      v25 = (char *)v25 + 1;
    }
    while (v23 != v25);
    id v23 = [v21 countByEnumeratingWithState:&v71 objects:v81 count:16];
  }
  while (v23);

  NSUInteger v32 = v66;
  long long v8 = v63;
  if (v66 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    objc_super v45 = sub_100656E54();
    v35 = v64;
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
LABEL_54:

      v8[2](v8, 0);
      v44 = v65;
      goto LABEL_55;
    }
    v46 = self;
    if (!v46)
    {
      v52 = @"<nil>";
      goto LABEL_53;
    }
    v47 = v8;
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    if (objc_opt_respondsToSelector())
    {
      v50 = [(TransitDirectionsListView *)v46 performSelector:"accessibilityIdentifier"];
      v51 = v50;
      if (v50 && ![v50 isEqualToString:v49])
      {
        v52 = +[NSString stringWithFormat:@"%@<%p, %@>", v49, v46, v51];

        goto LABEL_40;
      }
    }
    v52 = +[NSString stringWithFormat:@"%@<%p>", v49, v46];
LABEL_40:

    long long v8 = v47;
LABEL_53:

    *(_DWORD *)buf = 138543362;
    v76 = v52;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_FAULT, "[%{public}@] - index of first item not found, bailing", buf, 0xCu);

    goto LABEL_54;
  }
  v33 = [(UIStackView *)self->_stackView arrangedSubviews];
  id v34 = [v33 mutableCopy];

  v35 = v64;
  if (&v69[v66] <= [v34 count])
  {
    [v34 removeObjectsInRange:v66, v69];
    v44 = v65;
    v53 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v66, [v65 count]);
    [v34 insertObjects:v65 atIndexes:v53];

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100658D68;
    v70[3] = &unk_1012F32F8;
    v70[4] = self;
    [v64 enumerateObjectsUsingBlock:v70];
    if (v69 == [v65 count])
    {
LABEL_50:
      [(UIStackView *)self->_stackView _maps_setArrangedSubviews:v34 animated:v62 completion:v63];
      [(TransitDirectionsListView *)self invalidateIntrinsicContentSize];
      id v21 = v67;
      goto LABEL_51;
    }
    v54 = sub_100656E54();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
LABEL_49:

      goto LABEL_50;
    }
    v55 = self;
    v56 = (objc_class *)objc_opt_class();
    v57 = NSStringFromClass(v56);
    if (objc_opt_respondsToSelector())
    {
      v58 = [(TransitDirectionsListView *)v55 performSelector:"accessibilityIdentifier"];
      v59 = v58;
      if (v58 && ![v58 isEqualToString:v57])
      {
        v60 = +[NSString stringWithFormat:@"%@<%p, %@>", v57, v55, v59];

        v44 = v65;
        goto LABEL_48;
      }

      v44 = v65;
    }
    v60 = +[NSString stringWithFormat:@"%@<%p>", v57, v55];
LABEL_48:

    id v61 = [v44 count];
    *(_DWORD *)buf = 138543874;
    v76 = v60;
    __int16 v77 = 2048;
    int64_t v78 = (int64_t)v69;
    __int16 v79 = 2048;
    id v80 = v61;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "[%{public}@] - section went from %lu to %lu views", buf, 0x20u);

    goto LABEL_49;
  }
  id v36 = sub_100656E54();
  id v21 = v67;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
  {
    __int16 v37 = self;
    id v38 = (objc_class *)objc_opt_class();
    __int16 v39 = NSStringFromClass(v38);
    if (objc_opt_respondsToSelector())
    {
      v40 = [(TransitDirectionsListView *)v37 performSelector:"accessibilityIdentifier"];
      __int16 v41 = v40;
      if (v40 && ![v40 isEqualToString:v39])
      {
        v42 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41];

        NSUInteger v32 = v66;
        goto LABEL_30;
      }

      NSUInteger v32 = v66;
    }
    v42 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
LABEL_30:

    v82.location = v32;
    v82.length = (NSUInteger)v69;
    v43 = NSStringFromRange(v82);
    *(_DWORD *)buf = 138543618;
    v76 = v42;
    __int16 v77 = 2114;
    int64_t v78 = (int64_t)v43;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "[%{public}@] invalid replacementRange (%{public}@), bailing", buf, 0x16u);
  }
  v63[2](v63, 0);
  v44 = v65;
LABEL_51:

LABEL_55:
}

- (void)setFooterView:(id)a3
{
  id v5 = a3;
  footerView = self->_footerView;
  unint64_t v7 = (unint64_t)v5;
  id v8 = footerView;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      [(UIView *)self->_footerView removeFromSuperview];
      objc_storeStrong((id *)&self->_footerView, a3);
      v11 = sub_100656E54();
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (!v12)
        {
LABEL_16:

          [(id)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
          [(TransitDirectionsListView *)self addSubview:v7];
          [(NSLayoutConstraint *)self->_stackViewToBottomConstraint setActive:0];
          LODWORD(v26) = 1148846080;
          int64_t v27 = [v7 _maps_constraintsEqualToEdgesOfView:self priority:v26];
          id v28 = [(id)v7 topAnchor];
          id v29 = [(UIStackView *)self->_stackView bottomAnchor];
          uint64_t v30 = [v28 constraintEqualToAnchor:v29];
          id v31 = [v27 leadingConstraint];
          NSUInteger v32 = [v27 bottomConstraint];
          v33 = [v27 trailingConstraint];
          id v34 = +[MapsEdgeConstraints edgeConstraintsWithTop:v30 leading:v31 bottom:v32 trailing:v33];

          v35 = [v34 bottomConstraint];
          footerViewToBottomConstraint = self->_footerViewToBottomConstraint;
          self->_footerViewToBottomConstraint = v35;

          __int16 v37 = [v34 allConstraints];
          +[NSLayoutConstraint activateConstraints:v37];

LABEL_25:
          [(TransitDirectionsListView *)self invalidateIntrinsicContentSize];
          goto LABEL_26;
        }
        int64_t v13 = self;
        v14 = (objc_class *)objc_opt_class();
        unsigned int v15 = NSStringFromClass(v14);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v16 = [(TransitDirectionsListView *)v13 performSelector:"accessibilityIdentifier"];
          id v17 = v16;
          if (v16 && ![v16 isEqualToString:v15])
          {
            unint64_t v18 = +[NSString stringWithFormat:@"%@<%p, %@>", v15, v13, v17];

LABEL_10:
            id v19 = v18;
            id v20 = (id)v7;
            id v21 = (objc_class *)objc_opt_class();
            id v22 = NSStringFromClass(v21);
            if (objc_opt_respondsToSelector())
            {
              id v23 = [v20 performSelector:"accessibilityIdentifier"];
              uint64_t v24 = v23;
              if (v23 && ![v23 isEqualToString:v22])
              {
                v25 = +[NSString stringWithFormat:@"%@<%p, %@>", v22, v20, v24];

                goto LABEL_15;
              }
            }
            v25 = +[NSString stringWithFormat:@"%@<%p>", v22, v20];
LABEL_15:

            *(_DWORD *)buf = 138543618;
            id v46 = v19;
            __int16 v47 = 2114;
            v48 = v25;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding footer view: %{public}@", buf, 0x16u);

            goto LABEL_16;
          }
        }
        unint64_t v18 = +[NSString stringWithFormat:@"%@<%p>", v15, v13];
        goto LABEL_10;
      }
      if (!v12)
      {
LABEL_24:

        v44 = self->_footerViewToBottomConstraint;
        self->_footerViewToBottomConstraint = 0;

        [(NSLayoutConstraint *)self->_stackViewToBottomConstraint setActive:1];
        goto LABEL_25;
      }
      id v38 = self;
      __int16 v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      if (objc_opt_respondsToSelector())
      {
        __int16 v41 = [(TransitDirectionsListView *)v38 performSelector:"accessibilityIdentifier"];
        v42 = v41;
        if (v41 && ![v41 isEqualToString:v40])
        {
          v43 = +[NSString stringWithFormat:@"%@<%p, %@>", v40, v38, v42];

          goto LABEL_23;
        }
      }
      v43 = +[NSString stringWithFormat:@"%@<%p>", v40, v38];
LABEL_23:

      *(_DWORD *)buf = 138543362;
      id v46 = v43;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Clearing footer view", buf, 0xCu);

      goto LABEL_24;
    }
  }
LABEL_26:
}

- (void)setStepBackgroundAlpha:(double)a3
{
  self->_stepBackgroundAlpha = a3;
  -[UIView setAlpha:](self->_activeItemBackgroundView, "setAlpha:");
  [(UIView *)self->_highlightBackgroundView setAlpha:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_identifiersForOverriddenSeparatorViews;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    double v9 = 1.0 - a3;
    do
    {
      unsigned __int8 v10 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = -[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), (void)v13);
        BOOL v12 = [v11 separatorView];
        [v12 setAlpha:v9];

        unsigned __int8 v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)isActiveTransitDirectionsListItem:(id)a3
{
  id v4 = +[TransitDirectionsStepView reuseIdentifierForItem:a3];
  BOOL v5 = v4 && [(NSString *)self->_activeItemIdentifier isEqualToString:v4];

  return v5;
}

- (void)setActiveTransitDirectionsListItem:(id)a3
{
  id v4 = +[TransitDirectionsStepView reuseIdentifierForItem:a3];
  BOOL v5 = [(NSMapTable *)self->_viewsByIdentifier objectForKey:v4];
  activeItemIdentifier = self->_activeItemIdentifier;
  unint64_t v7 = v4;
  id v8 = activeItemIdentifier;
  if (v7 | (unint64_t)v8)
  {
    double v9 = v8;
    unsigned __int8 v10 = [(id)v7 isEqual:v8];

    if ((v10 & 1) == 0)
    {
      v11 = sub_100656E54();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        [(TransitDirectionsListView *)self _setActiveStepView:v5 withIdentifier:v7];
        goto LABEL_11;
      }
      BOOL v12 = self;
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      if (objc_opt_respondsToSelector())
      {
        long long v15 = [(TransitDirectionsListView *)v12 performSelector:"accessibilityIdentifier"];
        long long v16 = v15;
        if (v15 && ![v15 isEqualToString:v14])
        {
          id v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

          goto LABEL_9;
        }
      }
      id v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

      *(_DWORD *)buf = 138543874;
      id v19 = v17;
      __int16 v20 = 2114;
      id v21 = v5;
      __int16 v22 = 2114;
      unint64_t v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] Set active step view: %{public}@ / %{public}@", buf, 0x20u);

      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)_setActiveStepView:(id)a3 withIdentifier:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(TransitDirectionsListView *)self clearActiveTransitListItem];
  objc_storeStrong((id *)&self->_activeItemIdentifier, a4);
  if (self->_activeItemBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    activeItemBackgroundConstraints = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = 0;

    identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
    self->_identifiersForOverriddenSeparatorViews = 0;
  }
  id v9 = v13;
  if (v13)
  {
    unsigned __int8 v10 = [(TransitDirectionsListView *)self _allStepViewsInSectionForStepView:v13];
    [(TransitDirectionsListView *)self _refreshSeparatorsAroundActiveStepView:v13];
    v11 = [(TransitDirectionsListView *)self _constraintsForBackgroundView:self->_activeItemBackgroundView foregroundViews:v10];
    BOOL v12 = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = v11;

    +[NSLayoutConstraint activateConstraints:self->_activeItemBackgroundConstraints];
    [(TransitDirectionsListView *)self layoutIfNeeded];

    id v9 = v13;
  }
  [(UIView *)self->_activeItemBackgroundView setHidden:v9 == 0];
}

- (void)clearActiveTransitListItem
{
  if (self->_activeItemIdentifier)
  {
    uint64_t v3 = -[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:");
    if (v3)
    {
      id v4 = (void *)v3;
      identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
      self->_identifiersForOverriddenSeparatorViews = 0;

      id v6 = [(TransitDirectionsListView *)self _allStepViewsInSectionForStepView:v4];
      unint64_t v7 = [v6 firstObject];
      id v8 = [(UIStackView *)self->_stackView arrangedSubviews];
      id v9 = (char *)[v8 indexOfObject:v7];

      if (v9)
      {
        unsigned __int8 v10 = [(UIStackView *)self->_stackView arrangedSubviews];
        v11 = [v10 objectAtIndexedSubscript:v9 - 1];

        BOOL v12 = [(TransitDirectionsListView *)self _indexPathForStepView:v11];
        [(TransitDirectionsListView *)self _requestSeparatorForStepView:v11 atIndexPath:v12];
      }
      id v13 = [v6 lastObject];
      long long v14 = [(TransitDirectionsListView *)self _indexPathForStepView:v13];
      [(TransitDirectionsListView *)self _requestSeparatorForStepView:v13 atIndexPath:v14];
    }
  }
  if (self->_activeItemBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    activeItemBackgroundConstraints = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = 0;
  }
  activeItemIdentifier = self->_activeItemIdentifier;
  self->_activeItemIdentifier = 0;

  activeItemBackgroundView = self->_activeItemBackgroundView;

  [(UIView *)activeItemBackgroundView setHidden:1];
}

- (void)_refreshSeparatorsAroundActiveStepView:(id)a3
{
  if (a3)
  {
    -[TransitDirectionsListView _allStepViewsInSectionForStepView:](self, "_allStepViewsInSectionForStepView:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:2];
    BOOL v5 = [v25 firstObject];
    id v6 = [(UIStackView *)self->_stackView arrangedSubviews];
    unint64_t v7 = (char *)[v6 indexOfObject:v5];

    if (v7)
    {
      id v8 = [(UIStackView *)self->_stackView arrangedSubviews];
      id v9 = [v8 objectAtIndexedSubscript:v7 - 1];

      unsigned __int8 v10 = [v9 separatorView];
      [v10 setHidden:1];

      [(UIView *)self->_activeItemBackgroundView alpha];
      double v12 = 1.0 - v11;
      id v13 = [v9 separatorView];
      [v13 setAlpha:v12];

      long long v14 = [v9 reuseIdentifier];
      [v4 addObject:v14];
    }
    long long v15 = [v25 lastObject];
    long long v16 = [(UIStackView *)self->_stackView arrangedSubviews];
    id v17 = [v16 lastObject];

    if (v15 != v17)
    {
      unint64_t v18 = [v15 separatorView];
      [v18 setHidden:0];

      [(UIView *)self->_activeItemBackgroundView alpha];
      double v20 = 1.0 - v19;
      id v21 = [v15 separatorView];
      [v21 setAlpha:v20];

      __int16 v22 = [v15 reuseIdentifier];
      [v4 addObject:v22];
    }
    unint64_t v23 = (NSSet *)[v4 copy];
    identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
    self->_identifiersForOverriddenSeparatorViews = v23;
  }
}

- (void)stepViewSelected:(id)a3
{
  id v4 = a3;
  [(TransitDirectionsListView *)self _clearHighlightForStepView:v4];
  BOOL v5 = [(TransitDirectionsListView *)self listDelegate];
  id v6 = [v4 transitListItem];
  unsigned int v7 = [v5 transitDirectionsListView:self canSelectItem:v6];

  if (v7)
  {
    id v8 = sub_100656E54();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      long long v16 = [(TransitDirectionsListView *)self listDelegate];
      id v17 = [v4 transitListItem];
      [v16 transitDirectionsListView:self didSelectItem:v17];

      goto LABEL_13;
    }
    id v9 = self;
    if (!v9)
    {
      long long v14 = @"<nil>";
      goto LABEL_11;
    }
    unsigned __int8 v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    if (objc_opt_respondsToSelector())
    {
      double v12 = [(TransitDirectionsListView *)v9 performSelector:"accessibilityIdentifier"];
      id v13 = v12;
      if (v12 && ![v12 isEqualToString:v11])
      {
        long long v14 = +[NSString stringWithFormat:@"%@<%p, %@>", v11, v9, v13];

        goto LABEL_9;
      }
    }
    long long v14 = +[NSString stringWithFormat:@"%@<%p>", v11, v9];
LABEL_9:

LABEL_11:
    long long v15 = [v4 transitListItem];
    *(_DWORD *)buf = 138543619;
    double v19 = v14;
    __int16 v20 = 2113;
    id v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItem: %{private}@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
}

- (void)stepViewHighlighted:(id)a3
{
  id v7 = a3;
  id v4 = [(TransitDirectionsListView *)self listDelegate];
  BOOL v5 = [v7 transitListItem];
  unsigned int v6 = [v4 transitDirectionsListView:self canSelectItem:v5];

  if (v6) {
    [(TransitDirectionsListView *)self _addHighlightForStepView:v7];
  }
}

- (void)_addHighlightForStepView:(id)a3
{
  id v14 = a3;
  id v4 = [v14 reuseIdentifier];
  unint64_t v5 = self->_highlightedIdentifier;
  unint64_t v6 = v4;
  if (v6 | v5)
  {
    unsigned __int8 v7 = [(id)v5 isEqual:v6];

    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_highlightedIdentifier, v4);
        if (self->_highlightBackgroundConstraints)
        {
          +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
          highlightBackgroundConstraints = self->_highlightBackgroundConstraints;
          self->_highlightBackgroundConstraints = 0;
        }
        id v9 = v14;
        if (v14)
        {
          highlightBackgroundView = self->_highlightBackgroundView;
          double v11 = [(TransitDirectionsListView *)self _allStepViewsInSectionForStepView:v14];
          double v12 = [(TransitDirectionsListView *)self _constraintsForBackgroundView:highlightBackgroundView foregroundViews:v11];
          id v13 = self->_highlightBackgroundConstraints;
          self->_highlightBackgroundConstraints = v12;

          +[NSLayoutConstraint activateConstraints:self->_highlightBackgroundConstraints];
          [(TransitDirectionsListView *)self layoutIfNeeded];
          id v9 = v14;
        }
        [(UIView *)self->_highlightBackgroundView setHidden:v9 == 0];
      }
    }
  }
}

- (void)_clearHighlightForStepView:(id)a3
{
  if ((unint64_t)a3 | (unint64_t)self->_highlightedIdentifier)
  {
    id v4 = [a3 reuseIdentifier];
    if (-[NSString isEqualToString:](self->_highlightedIdentifier, "isEqualToString:")) {
      [(TransitDirectionsListView *)self _clearHighlight];
    }
  }
}

- (void)_clearHighlight
{
  if (self->_highlightBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    highlightBackgroundConstraints = self->_highlightBackgroundConstraints;
    self->_highlightBackgroundConstraints = 0;
  }
  highlightedIdentifier = self->_highlightedIdentifier;
  self->_highlightedIdentifier = 0;

  highlightBackgroundView = self->_highlightBackgroundView;

  [(UIView *)highlightBackgroundView setHidden:1];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsListView;
  [(TransitDirectionsListView *)&v5 didMoveToWindow];
  uint64_t v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  visibleAdvisories = self->_visibleAdvisories;
  self->_visibleAdvisories = v3;

  [(TransitDirectionsListView *)self _updateVisibleAdvisories];
}

- (void)_updateVisibleAdvisories
{
  uint64_t v3 = [(TransitDirectionsListView *)self allStepViews];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10065A6A0;
  v40[3] = &unk_1012F3360;
  __int16 v41 = &stru_1012F3338;
  id v4 = sub_1000AC254(v3, v40);

  if ([v4 count])
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v36 objects:v46 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v37;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v10 = *(TransitDirectionsStepView **)(*((void *)&v36 + 1) + 8 * (void)v9);
          double v11 = sub_10065A5FC(v6, v10);
          if (v11)
          {
            id v12 = [(NSMutableSet *)self->_visibleAdvisories count];
            [(TransitDirectionsListView *)self bounds];
            CGFloat v14 = v13;
            CGFloat v16 = v15;
            CGFloat v18 = v17;
            CGFloat v20 = v19;
            [(TransitDirectionsStepView *)v10 frame];
            v48.origin.x = v21;
            v48.origin.double y = v22;
            v48.size.double width = v23;
            v48.size.double height = v24;
            v47.origin.x = v14;
            v47.origin.double y = v16;
            v47.size.double width = v18;
            v47.size.double height = v20;
            BOOL v25 = CGRectIntersectsRect(v47, v48);
            visibleAdvisories = self->_visibleAdvisories;
            if (v25)
            {
              [(NSMutableSet *)visibleAdvisories addObject:v11];
              if (v12 != [(NSMutableSet *)self->_visibleAdvisories count])
              {
                int64_t v27 = [(TransitDirectionsListView *)self listDelegate];
                [v27 transitDirectionsListView:self didDisplayAdvisory:v11];
              }
            }
            else
            {
              [(NSMutableSet *)visibleAdvisories removeObject:v11];
            }
          }

          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v6 = [v5 countByEnumeratingWithState:&v36 objects:v46 count:16];
        id v7 = v6;
      }
      while (v6);
    }

    id v28 = sub_100656E54();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_24;
    }
    id v29 = self;
    if (!v29)
    {
      id v34 = @"<nil>";
      goto LABEL_23;
    }
    uint64_t v30 = (objc_class *)objc_opt_class();
    id v31 = NSStringFromClass(v30);
    if (objc_opt_respondsToSelector())
    {
      NSUInteger v32 = [(TransitDirectionsListView *)v29 performSelector:"accessibilityIdentifier"];
      v33 = v32;
      if (v32 && ![v32 isEqualToString:v31])
      {
        id v34 = +[NSString stringWithFormat:@"%@<%p, %@>", v31, v29, v33];

        goto LABEL_21;
      }
    }
    id v34 = +[NSString stringWithFormat:@"%@<%p>", v31, v29];
LABEL_21:

LABEL_23:
    id v35 = [(NSMutableSet *)v29->_visibleAdvisories count];
    *(_DWORD *)buf = 138543618;
    v43 = v34;
    __int16 v44 = 2048;
    id v45 = v35;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "[%{public}@] Updated visible advisories: %lu", buf, 0x16u);

LABEL_24:
  }
}

- (id)_indexPathForStepView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [(NSMapTable *)self->_viewsByIndexPath keyEnumerator];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          unsigned __int8 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [(NSMapTable *)self->_viewsByIndexPath objectForKey:v10];

          if (v11 == v4)
          {
            id v12 = v10;
            goto LABEL_12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v12 = 0;
LABEL_12:
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_allStepViewsInSectionForStepView:(id)a3
{
  id v4 = [(TransitDirectionsListView *)self _indexPathForStepView:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = -[TransitDirectionsListView _allStepViewsForSection:](self, "_allStepViewsForSection:", [v4 section]);
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

- (id)_allStepViewsForSection:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = &__NSArray0__struct;
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(NSMapTable *)self->_viewsByIndexPath keyEnumerator];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 section] == (id)a3)
          {
            double v13 = [(NSMapTable *)self->_viewsByIndexPath objectForKey:v12];
            [v6 addObject:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10065AA90;
    v15[3] = &unk_1012F3388;
    v15[4] = self;
    uint64_t v3 = [v6 sortedArrayUsingComparator:v15];
  }

  return v3;
}

- (id)_constraintsForBackgroundView:(id)a3 foregroundViews:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = [v7 firstObject];
    id v9 = [v7 lastObject];
    uint64_t v10 = [(UIStackView *)self->_stackView arrangedSubviews];
    id v11 = (char *)[v10 indexOfObject:v9];

    id v12 = v11 + 1;
    id v13 = objc_alloc_init((Class)NSMutableArray);
    long long v14 = [v6 topAnchor];
    id v29 = v8;
    long long v15 = [v8 topAnchor];
    LODWORD(v16) = 1148846080;
    long long v17 = [v14 constraintEqualToAnchor:v15 constant:0.0 priority:v16];
    [v13 addObject:v17];

    long long v18 = [(UIStackView *)self->_stackView arrangedSubviews];
    long long v19 = (char *)[v18 count];

    if (v12 >= v19)
    {
      CGFloat v21 = [v6 bottomAnchor];
      CGFloat v22 = [v9 bottomAnchor];
      LODWORD(v27) = 1148846080;
      CGFloat v23 = [v21 constraintEqualToAnchor:v22 constant:0.0 priority:v27];
      [v13 addObject:v23];
    }
    else
    {
      CGFloat v20 = [(UIStackView *)self->_stackView arrangedSubviews];
      CGFloat v21 = [v20 objectAtIndexedSubscript:v12];

      CGFloat v22 = [v6 bottomAnchor];
      CGFloat v23 = [v21 topAnchor];
      LODWORD(v24) = 1148846080;
      BOOL v25 = [v22 constraintEqualToAnchor:v23 constant:0.0 priority:v24];
      [v13 addObject:v25];
    }
    id v26 = [v13 copy];
  }
  else
  {
    id v26 = &__NSArray0__struct;
  }

  return v26;
}

- (TransitDirectionsListViewDelegate)listDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);

  return (TransitDirectionsListViewDelegate *)WeakRetained;
}

- (void)setListDelegate:(id)a3
{
}

- (TransitDirectionsListViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (TransitDirectionsListViewDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (double)stepBackgroundAlpha
{
  return self->_stepBackgroundAlpha;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_visibleAdvisories, 0);
  objc_storeStrong((id *)&self->_footerViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundConstraints, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_highlightedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForOverriddenSeparatorViews, 0);
  objc_storeStrong((id *)&self->_activeItemBackgroundConstraints, 0);
  objc_storeStrong((id *)&self->_activeItemBackgroundView, 0);
  objc_storeStrong((id *)&self->_activeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPathsByView, 0);
  objc_storeStrong((id *)&self->_viewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_viewsByIndexPath, 0);

  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
@interface CarRouteInfoView
- (CarRouteInfoView)initWithFrame:(CGRect)a3;
- (GuidanceETA)latestETA;
- (NSArray)arrangedSubviews;
- (double)_updateWidthConstraintsByCompressionResistanceWithAvailableWidth:(double)a3;
- (double)_updateWidthConstraintsForEVWithAvailableWidth:(double)a3;
- (double)spacing;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_resetSpacerConstraints;
- (void)_updateLabels;
- (void)_updateSpacerConstraintsToAbsorbWidth:(double)a3;
- (void)_updateWidthAndSpaceConstraints;
- (void)layoutSubviews;
- (void)setArrangedSubviews:(id)a3;
- (void)setLatestETA:(id)a3;
- (void)setSpacing:(double)a3;
@end

@implementation CarRouteInfoView

- (CarRouteInfoView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)CarRouteInfoView;
  v3 = -[CarRouteInfoView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CarRouteInfoView *)v3 setAccessibilityIdentifier:@"CarRouteInfoView"];
    LODWORD(v5) = 1144750080;
    [(CarRouteInfoView *)v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v6) = 1132068864;
    [(CarRouteInfoView *)v4 setContentHuggingPriority:0 forAxis:v6];
    v7 = [CarTwoPartLabel alloc];
    LODWORD(v8) = 1144700928;
    LODWORD(v9) = 1144651776;
    v10 = [(CarTwoPartLabel *)v7 initWithTopLabelHorizontalCompressionResistancePriority:v8 bottomLabelHorizontalCompressionResistancePriority:v9];
    etaLabel = v4->_etaLabel;
    v4->_etaLabel = v10;

    [(CarTwoPartLabel *)v4->_etaLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarTwoPartLabel *)v4->_etaLabel setAccessibilityIdentifier:@"EtaLabel"];
    v12 = [CarTwoPartLabel alloc];
    LODWORD(v13) = 1144733696;
    LODWORD(v14) = 1144651776;
    v15 = [(CarTwoPartLabel *)v12 initWithTopLabelHorizontalCompressionResistancePriority:v13 bottomLabelHorizontalCompressionResistancePriority:v14];
    batteryLabel = v4->_batteryLabel;
    v4->_batteryLabel = v15;

    [(CarTwoPartLabel *)v4->_batteryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarTwoPartLabel *)v4->_batteryLabel setAccessibilityIdentifier:@"BatteryLabel"];
    v17 = [CarTwoPartLabel alloc];
    LODWORD(v18) = 1144684544;
    LODWORD(v19) = 1144733696;
    v20 = [(CarTwoPartLabel *)v17 initWithTopLabelHorizontalCompressionResistancePriority:v19 bottomLabelHorizontalCompressionResistancePriority:v18];
    distanceLabel = v4->_distanceLabel;
    v4->_distanceLabel = v20;

    [(CarTwoPartLabel *)v4->_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarTwoPartLabel *)v4->_distanceLabel setAccessibilityIdentifier:@"DistanceLabel"];
    v22 = [CarTwoPartLabel alloc];
    LODWORD(v23) = 1144717312;
    LODWORD(v24) = 1144668160;
    v25 = [(CarTwoPartLabel *)v22 initWithTopLabelHorizontalCompressionResistancePriority:v23 bottomLabelHorizontalCompressionResistancePriority:v24];
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = v25;

    [(CarTwoPartLabel *)v4->_timeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarTwoPartLabel *)v4->_timeLabel setAccessibilityIdentifier:@"TimeLabel"];
    v27 = +[GuidanceETA defaultBatteryOnArrivalString];
    [(CarTwoPartLabel *)v4->_batteryLabel setSecondaryText:v27];

    v36[0] = v4->_etaLabel;
    v36[1] = v4->_batteryLabel;
    uint64_t v28 = +[NSArray arrayWithObjects:v36 count:2];
    evLabels = v4->_evLabels;
    v4->_evLabels = (NSArray *)v28;

    v35[0] = v4->_etaLabel;
    v35[1] = v4->_timeLabel;
    v35[2] = v4->_distanceLabel;
    uint64_t v30 = +[NSArray arrayWithObjects:v35 count:3];
    normalLabels = v4->_normalLabels;
    v4->_normalLabels = (NSArray *)v30;

    arrangedSubviewsWidthConstraints = v4->_arrangedSubviewsWidthConstraints;
    v4->_arrangedSubviewsWidthConstraints = (NSArray *)&__NSArray0__struct;

    [(CarRouteInfoView *)v4 _updateLabels];
  }
  return v4;
}

- (void)_updateLabels
{
  latestETA = self->_latestETA;
  if (!latestETA)
  {
    double v5 = +[GuidanceETA invalidValueString];
    [(CarTwoPartLabel *)self->_distanceLabel setPrimaryText:v5];
    double v6 = +[GuidanceETA defaultDistanceUnit];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryText:v6];

    v7 = +[GuidanceETA defaultDistanceUnitAccessibility];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryAccessibilityText:v7];

    [(CarTwoPartLabel *)self->_timeLabel setPrimaryText:v5];
    double v8 = +[GuidanceETA defaultTimeUnit];
    [(CarTwoPartLabel *)self->_timeLabel setSecondaryText:v8];

    double v9 = +[GuidanceETA defaultTimeUnitAccessibility];
    [(CarTwoPartLabel *)self->_timeLabel setSecondaryAccessibilityText:v9];

    [(CarTwoPartLabel *)self->_etaLabel setPrimaryText:v5];
    v10 = +[GuidanceETA defaultArrivalString];
    [(CarTwoPartLabel *)self->_etaLabel setSecondaryText:v10];

    [(CarTwoPartLabel *)self->_batteryLabel setPrimaryText:v5];
LABEL_8:

    goto LABEL_9;
  }
  [(GuidanceETA *)latestETA remainingDistance];
  if (v4 >= 0.0)
  {
    v11 = [(GuidanceETA *)self->_latestETA distanceValue];
    [(CarTwoPartLabel *)self->_distanceLabel setPrimaryText:v11];

    v12 = [(GuidanceETA *)self->_latestETA distanceUnit];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryText:v12];

    double v13 = [(GuidanceETA *)self->_latestETA distanceUnitAccessibility];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryAccessibilityText:v13];
  }
  else
  {
    [(CarTwoPartLabel *)self->_distanceLabel setPrimaryText:0];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryText:0];
    [(CarTwoPartLabel *)self->_distanceLabel setSecondaryAccessibilityText:0];
  }
  double v14 = [(GuidanceETA *)self->_latestETA timeValue];
  [(CarTwoPartLabel *)self->_timeLabel setPrimaryText:v14];

  v15 = [(GuidanceETA *)self->_latestETA timeUnit];
  [(CarTwoPartLabel *)self->_timeLabel setSecondaryText:v15];

  v16 = [(GuidanceETA *)self->_latestETA timeUnitAccessibility];
  [(CarTwoPartLabel *)self->_timeLabel setSecondaryAccessibilityText:v16];

  v17 = [(GuidanceETA *)self->_latestETA etaDateStringWithAMPMSymbol:0 allowTimeZone:0];
  [(CarTwoPartLabel *)self->_etaLabel setPrimaryText:v17];

  double v18 = [(GuidanceETA *)self->_latestETA arrivalTimeBottomString];
  [(CarTwoPartLabel *)self->_etaLabel setSecondaryText:v18];

  double v19 = [(GuidanceETA *)self->_latestETA arrivalBatteryCharge];

  if (v19)
  {
    double v5 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightBold];
    v20 = [(GuidanceETA *)self->_latestETA batteryChargeStringWithFont:v5];
    [(CarTwoPartLabel *)self->_batteryLabel setPrimaryAttributedText:v20];

    goto LABEL_8;
  }
LABEL_9:
  v21 = self->_latestETA;
  if (v21)
  {
    BOOL v22 = 0;
  }
  else
  {
    double v23 = [(CarRouteInfoView *)self arrangedSubviews];
    BOOL v22 = [v23 count] == (id)2;

    v21 = self->_latestETA;
  }
  double v24 = [(GuidanceETA *)v21 arrivalBatteryCharge];
  if (v24) {
    int v25 = 1;
  }
  else {
    int v25 = v22;
  }

  uint64_t v26 = 5;
  if (v25) {
    uint64_t v26 = 4;
  }
  id v30 = *(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CarRouteInfoView__etaLabel[v26]);
  v27 = [(CarRouteInfoView *)self arrangedSubviews];
  unsigned int v28 = [v27 isEqualToArray:v30];

  if (v28)
  {
    [(CarRouteInfoView *)self _updateWidthAndSpaceConstraints];
  }
  else
  {
    double v29 = 8.0;
    if (v25) {
      double v29 = 12.0;
    }
    [(CarRouteInfoView *)self setSpacing:v29];
    [(CarRouteInfoView *)self setArrangedSubviews:v30];
    [(CarRouteInfoView *)self invalidateIntrinsicContentSize];
    [(CarRouteInfoView *)self setNeedsLayout];
  }
}

- (void)setLatestETA:(id)a3
{
  double v5 = (GuidanceETA *)a3;
  if (self->_latestETA != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_latestETA, a3);
    [(CarRouteInfoView *)self _updateLabels];
    double v5 = v6;
  }
}

- (id)viewForFirstBaselineLayout
{
  return [(CarTwoPartLabel *)self->_etaLabel viewForFirstBaselineLayout];
}

- (id)viewForLastBaselineLayout
{
  return [(CarTwoPartLabel *)self->_etaLabel viewForLastBaselineLayout];
}

- (void)setArrangedSubviews:(id)a3
{
  id v33 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  p_arrangedSubviews = &self->_arrangedSubviews;
  double v6 = self->_arrangedSubviews;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) removeFromSuperview];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  objc_storeStrong((id *)&self->_arrangedSubviews, a3);
  v11 = objc_opt_new();
  objc_super v34 = (NSArray *)objc_opt_new();
  v12 = (NSArray *)objc_opt_new();
  if ([(NSArray *)*p_arrangedSubviews count])
  {
    unint64_t v13 = 0;
    do
    {
      if (v13)
      {
        double v14 = [(NSArray *)*p_arrangedSubviews objectAtIndexedSubscript:v13 - 1];
      }
      else
      {
        double v14 = 0;
      }
      v15 = [(NSArray *)*p_arrangedSubviews objectAtIndexedSubscript:v13];
      [(CarRouteInfoView *)self addSubview:v15];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        +[NSException raise:NSInvalidArgumentException format:@"There isn't support for other views"];
      }
      v16 = [v15 heightAnchor];
      v17 = [(CarRouteInfoView *)self heightAnchor];
      double v18 = [v16 constraintEqualToAnchor:v17];
      [v11 addObject:v18];

      double v19 = [v15 centerYAnchor];
      v20 = [(CarRouteInfoView *)self centerYAnchor];
      v21 = [v19 constraintEqualToAnchor:v20];
      [v11 addObject:v21];

      BOOL v22 = [v15 leadingAnchor];
      if (v13)
      {
        double v23 = [v14 trailingAnchor];
        [(CarRouteInfoView *)self spacing];
        uint64_t v24 = [v22 constraintEqualToAnchor:v23];

        [v11 addObject:v24];
        [(NSArray *)v34 addObject:v24];
        BOOL v22 = (void *)v24;
      }
      else
      {
        int v25 = [(CarRouteInfoView *)self leadingAnchor];
        uint64_t v26 = [v22 constraintEqualToAnchor:v25];
        [v11 addObject:v26];
      }
      v27 = [v15 widthAnchor];
      unsigned int v28 = [v27 constraintEqualToConstant:0.0];

      [v11 addObject:v28];
      [(NSArray *)v12 addObject:v28];

      ++v13;
    }
    while (v13 < [(NSArray *)*p_arrangedSubviews count]);
  }
  spacerConstraints = self->_spacerConstraints;
  self->_spacerConstraints = v34;
  id v30 = v34;

  +[NSLayoutConstraint deactivateConstraints:self->_arrangedSubviewsWidthConstraints];
  arrangedSubviewsWidthConstraints = self->_arrangedSubviewsWidthConstraints;
  self->_arrangedSubviewsWidthConstraints = v12;
  v32 = v12;

  [(CarRouteInfoView *)self _updateWidthAndSpaceConstraints];
  +[NSLayoutConstraint activateConstraints:v11];
}

- (void)_updateWidthAndSpaceConstraints
{
  v3 = [(NSArray *)self->_arrangedSubviews count];
  if (v3 == (void *)[(NSArray *)self->_arrangedSubviewsWidthConstraints count]
    && [(NSArray *)self->_arrangedSubviews count])
  {
    [(CarRouteInfoView *)self frame];
    double Width = CGRectGetWidth(v41);
    double v5 = (double)([(NSArray *)self->_arrangedSubviews count] - 1);
    [(CarRouteInfoView *)self spacing];
    double v7 = Width - v5 * v6;
    if (v7 <= 0.0)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v12 = self->_arrangedSubviewsWidthConstraints;
      id v13 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v31;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v31 != v15) {
              objc_enumerationMutation(v12);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * i) setConstant:0.0];
          }
          id v14 = [(NSArray *)v12 countByEnumeratingWithState:&v30 objects:v40 count:16];
        }
        while (v14);
      }
LABEL_24:

      return;
    }
    [(CarRouteInfoView *)self frame];
    id v8 = +[NSNumber numberWithDouble:CGRectGetWidth(v42)];
    renderedIndouble Width = self->_renderedInWidth;
    self->_renderedIndouble Width = v8;

    if (self->_arrangedSubviews == self->_evLabels)
    {
      [(CarRouteInfoView *)self _updateWidthConstraintsForEVWithAvailableWidth:v7];
      double v11 = v17;
    }
    else
    {
      [(CarRouteInfoView *)self _updateWidthConstraintsByCompressionResistanceWithAvailableWidth:v7];
      double v11 = v10;
      if (v10 < v7)
      {
        [(CarRouteInfoView *)self _updateSpacerConstraintsToAbsorbWidth:v7 - v10];
LABEL_17:
        double v18 = sub_10078E744();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

        if (!v19) {
          return;
        }
        v12 = (NSArray *)objc_opt_new();
        if ([(NSArray *)self->_arrangedSubviewsWidthConstraints count])
        {
          unint64_t v20 = 0;
          do
          {
            v21 = [(NSArray *)self->_arrangedSubviews objectAtIndexedSubscript:v20];
            BOOL v22 = [(NSArray *)self->_arrangedSubviewsWidthConstraints objectAtIndexedSubscript:v20];
            [v21 topLabelIntrinsicWidth];
            uint64_t v24 = v23;
            [v21 bottomLabelIntrinsicWidth];
            uint64_t v26 = v25;
            [v22 constant];
            +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<CarTwoPartLabel %p; intrinsicWidths: top %f, bottom %f; assignedWidth: %f>",
              v21,
              v24,
              v26,
            unsigned int v28 = v27);
            [(NSArray *)v12 addObject:v28];

            ++v20;
          }
          while (v20 < [(NSArray *)self->_arrangedSubviewsWidthConstraints count]);
        }
        double v29 = sub_10078E744();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543874;
          long long v35 = v12;
          __int16 v36 = 2048;
          double v37 = v7;
          __int16 v38 = 2048;
          double v39 = v11;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Drawing labels %{public}@ in availableWidth: %f, contentWidth: %f", buf, 0x20u);
        }

        goto LABEL_24;
      }
    }
    [(CarRouteInfoView *)self _resetSpacerConstraints];
    goto LABEL_17;
  }
}

- (double)_updateWidthConstraintsForEVWithAvailableWidth:(double)a3
{
  [(CarTwoPartLabel *)self->_etaLabel topLabelIntrinsicWidth];
  double v6 = v5;
  [(CarTwoPartLabel *)self->_batteryLabel topLabelIntrinsicWidth];
  double v8 = v6 + v7;
  if (v6 + v7 <= a3)
  {
    [(CarTwoPartLabel *)self->_etaLabel intrinsicContentSize];
    double v15 = v14;
    [(CarTwoPartLabel *)self->_batteryLabel intrinsicContentSize];
    double v17 = v15 + v16;
    NSUInteger v18 = [(NSArray *)self->_arrangedSubviewsWidthConstraints count];
    if (v17 <= a3)
    {
      if (v18)
      {
        unint64_t v23 = 0;
        do
        {
          uint64_t v24 = [(NSArray *)self->_arrangedSubviews objectAtIndexedSubscript:v23];
          uint64_t v25 = [(NSArray *)self->_arrangedSubviewsWidthConstraints objectAtIndexedSubscript:v23];
          [v24 intrinsicContentSize];
          [v25 setConstant:];

          ++v23;
        }
        while (v23 < [(NSArray *)self->_arrangedSubviewsWidthConstraints count]);
      }
      return v17;
    }
    else if (v18)
    {
      unint64_t v19 = 0;
      do
      {
        unint64_t v20 = [(NSArray *)self->_arrangedSubviews objectAtIndexedSubscript:v19];
        v21 = [(NSArray *)self->_arrangedSubviewsWidthConstraints objectAtIndexedSubscript:v19];
        [v20 topLabelIntrinsicWidth];
        [v21 setConstant:(a3 - v8) * 0.5 + v22];

        ++v19;
      }
      while (v19 < [(NSArray *)self->_arrangedSubviewsWidthConstraints count]);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v9 = self->_arrangedSubviewsWidthConstraints;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * i) setConstant:a3 * 0.5];
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
  }
  return a3;
}

- (double)_updateWidthConstraintsByCompressionResistanceWithAvailableWidth:(double)a3
{
  v68 = objc_opt_new();
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obj = self->_arrangedSubviews;
  id v71 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v71)
  {
    id v69 = *(id *)v81;
    double v5 = NSCollectionLayoutEdgeSpacing_ptr;
    do
    {
      for (i = 0; i != v71; i = (char *)i + 1)
      {
        if (*(id *)v81 != v69) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        double v8 = v5[55];
        [v7 topLabelPriority];
        uint64_t v9 = [v8 numberWithFloat:];
        id v10 = [v68 objectForKeyedSubscript:v9];
        id v11 = v10;
        if (v10) {
          id v12 = v10;
        }
        else {
          id v12 = (id)objc_opt_new();
        }
        id v13 = v12;

        [v13 addObject:v7];
        [v68 setObject:v13 forKeyedSubscript:v9];
        double v14 = v5;
        double v15 = v5[55];
        [v7 bottomLabelPriority];
        double v16 = [v15 numberWithFloat:];
        double v17 = [v68 objectForKeyedSubscript:v16];
        NSUInteger v18 = v17;
        if (v17) {
          id v19 = v17;
        }
        else {
          id v19 = (id)objc_opt_new();
        }
        unint64_t v20 = v19;

        [v20 addObject:v7];
        [v68 setObject:v20 forKeyedSubscript:v16];

        double v5 = v14;
      }
      id v71 = [(NSArray *)obj countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v71);
  }

  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v21 = [v68 allKeys];
  double v22 = [v21 sortedArrayUsingSelector:"compare:"];
  unint64_t v23 = [v22 reverseObjectEnumerator];

  id v63 = v23;
  v65 = (char *)[v23 countByEnumeratingWithState:&v76 objects:v85 count:16];
  if (v65)
  {
    char v24 = 0;
    uint64_t v64 = *(void *)v77;
    double v25 = 0.0;
    while (1)
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v77 != v64) {
          objc_enumerationMutation(v63);
        }
        obja = v26;
        long long v27 = *(void **)(*((void *)&v76 + 1) + 8 * (void)v26);
        [v27 floatValue];
        float v29 = v28;
        long long v30 = [v68 objectForKeyedSubscript:v27];
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v70 = v30;
        id v31 = [v30 countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v73;
          do
          {
            for (j = 0; j != v32; j = (char *)j + 1)
            {
              if (*(void *)v73 != v33) {
                objc_enumerationMutation(v70);
              }
              long long v35 = *(void **)(*((void *)&v72 + 1) + 8 * (void)j);
              unint64_t v36 = [(NSArray *)self->_arrangedSubviews indexOfObject:v35];
              if (v36 == 0x7FFFFFFFFFFFFFFFLL
                || v36 >= [(NSArray *)self->_arrangedSubviewsWidthConstraints count])
              {
                +[NSException raise:NSInternalInconsistencyException, @"arrangedSubview (%@) not found in arrangedSubviews (%@) and/or widthConstraints (%@)", v35, self->_arrangedSubviews, self->_arrangedSubviewsWidthConstraints format];
              }
              double v37 = [(NSArray *)self->_arrangedSubviewsWidthConstraints objectAtIndexedSubscript:v36];
              [v35 topLabelPriority];
              float v39 = vabds_f32(v38, v29);
              [v35 bottomLabelPriority];
              float v41 = vabds_f32(v40, v29);
              if (v39 < 2.2204e-16 && v41 < 2.2204e-16)
              {
                [v35 intrinsicContentSize];
                if (v24)
                {
                  char v24 = 1;
                  double v44 = 0.0;
LABEL_65:
                  [v37 setConstant:v44];
                  goto LABEL_66;
                }
                double v44 = v46;
                double v49 = v25 + v46;
                if (v49 < a3)
                {
                  char v24 = 0;
                  double v25 = v49;
                  goto LABEL_65;
                }
                double v44 = a3 - v25 + 0.0;
LABEL_64:
                char v24 = 1;
                double v25 = a3;
                goto LABEL_65;
              }
              if (v39 >= 2.2204e-16)
              {
                [v35 bottomLabelIntrinsicWidth];
                double v44 = v47;
                [v35 topLabelPriority];
              }
              else
              {
                [v35 topLabelIntrinsicWidth];
                double v44 = v43;
                [v35 bottomLabelPriority];
              }
              float v48 = v45;
              if ((v24 & 1) == 0)
              {
                BOOL v50 = v45 <= v29 || v39 >= 2.2204e-16;
                if (!v50
                  || ((double v51 = 0.0, v39 >= 2.2204e-16) ? (v52 = v41 < 2.2204e-16) : (v52 = 0),
                      v52 ? (BOOL v53 = v48 <= v29) : (BOOL v53 = 1),
                      !v53))
                {
                  [v35 topLabelIntrinsicWidth];
                  double v55 = v54;
                  [v35 bottomLabelIntrinsicWidth];
                  if (v55 >= v56) {
                    [v35 bottomLabelIntrinsicWidth];
                  }
                  else {
                    [v35 topLabelIntrinsicWidth];
                  }
                }
                double v57 = v25 + v44 - v51;
                if (v57 < a3)
                {
                  if (v48 > v29)
                  {
                    [v37 constant];
                    if (v58 > v44)
                    {
                      [v37 constant];
                      double v44 = v59;
                    }
                  }
                  char v24 = 0;
                  double v25 = v57;
                  goto LABEL_65;
                }
                double v44 = a3 - v25 + v51;
                if (v48 > v29)
                {
                  [v37 constant];
                  if (v60 > v44)
                  {
                    [v37 constant];
                    double v44 = v61;
                  }
                }
                goto LABEL_64;
              }
              char v24 = 1;
              double v44 = 0.0;
              if (v45 <= v29) {
                goto LABEL_65;
              }
LABEL_66:
            }
            id v32 = [v70 countByEnumeratingWithState:&v72 objects:v84 count:16];
          }
          while (v32);
        }

        uint64_t v26 = obja + 1;
      }
      while (obja + 1 != v65);
      v65 = (char *)[v63 countByEnumeratingWithState:&v76 objects:v85 count:16];
      if (!v65) {
        goto LABEL_72;
      }
    }
  }
  double v25 = 0.0;
LABEL_72:

  return v25;
}

- (void)_updateSpacerConstraintsToAbsorbWidth:(double)a3
{
  NSUInteger v5 = [(NSArray *)self->_spacerConstraints count];
  if (v5 > 1)
  {
    unint64_t v8 = v5;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = self->_spacerConstraints;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      double v12 = (double)((unint64_t)a3 / v8);
      unint64_t v13 = vcvtpd_u64_f64(a3 - (double)v8 * v12);
      uint64_t v14 = *(void *)v25;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v9);
          }
          double v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [(CarRouteInfoView *)self spacing];
          double v18 = v17 + v12;
          if (v13) {
            double v19 = 1.0;
          }
          else {
            double v19 = 0.0;
          }
          [v16 setConstant:v19 + v18];
          if (v13)
          {
            --v13;
            [(CarRouteInfoView *)self spacing];
            double v21 = v20 + v12 + 1.0;
          }
          else
          {
            [(CarRouteInfoView *)self spacing];
            double v21 = v22 + v12;
          }
          [v16 setConstant:v21];
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v11);
    }
  }
  else
  {
    [(CarRouteInfoView *)self spacing];
    double v7 = v6 + a3;
    id v23 = [(NSArray *)self->_spacerConstraints firstObject];
    [v23 setConstant:v7];
  }
}

- (void)_resetSpacerConstraints
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_spacerConstraints;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        [(CarRouteInfoView *)self spacing];
        [v8 setConstant:];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CarRouteInfoView;
  [(CarRouteInfoView *)&v9 layoutSubviews];
  [(NSNumber *)self->_renderedInWidth cgFloatValue];
  double v4 = v3;
  [(CarRouteInfoView *)self frame];
  double Width = CGRectGetWidth(v14);
  double v6 = vabdd_f64(Width, v4);
  if (self->_renderedInWidth) {
    BOOL v7 = v6 < 1.0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    unint64_t v8 = sub_10078E744();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      double v11 = v4;
      __int16 v12 = 2048;
      double v13 = Width;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Re-drawing due to frame width changing from %f to %f", buf, 0x16u);
    }

    [(CarRouteInfoView *)self _updateWidthAndSpaceConstraints];
  }
}

- (GuidanceETA)latestETA
{
  return self->_latestETA;
}

- (NSArray)arrangedSubviews
{
  return self->_arrangedSubviews;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrangedSubviews, 0);
  objc_storeStrong((id *)&self->_latestETA, 0);
  objc_storeStrong((id *)&self->_renderedInWidth, 0);
  objc_storeStrong((id *)&self->_arrangedSubviewsWidthConstraints, 0);
  objc_storeStrong((id *)&self->_spacerConstraints, 0);
  objc_storeStrong((id *)&self->_normalLabels, 0);
  objc_storeStrong((id *)&self->_evLabels, 0);
  objc_storeStrong((id *)&self->_batteryLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);

  objc_storeStrong((id *)&self->_etaLabel, 0);
}

@end
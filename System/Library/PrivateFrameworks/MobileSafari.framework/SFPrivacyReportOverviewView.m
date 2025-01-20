@interface SFPrivacyReportOverviewView
- (BOOL)itemViewCanUseCompactWidth:(id)a3;
- (BOOL)itemViewIsLineBreak:(id)a3;
- (BOOL)usesInsetStyle;
- (SFPrivacyReportOverviewView)initWithPrivacyReportDataProvider:(id)a3;
- (double)cellBackgroundCornerRadius;
- (double)interItemSpacing;
- (id)cellBackgroundColor;
- (int64_t)contextType;
- (void)setContextType:(int64_t)a3;
- (void)setItemViews:(id)a3;
- (void)setUsesInsetStyle:(BOOL)a3;
- (void)updateItemBackgroundProperties;
@end

@implementation SFPrivacyReportOverviewView

- (SFPrivacyReportOverviewView)initWithPrivacyReportDataProvider:(id)a3
{
  v52[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SFPrivacyReportOverviewView;
  v6 = [(SFPrivacyReportGridView *)&v51 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_reportDataProvider, a3);
    [(SFPrivacyReportOverviewView *)v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v8, v10, v12, v14);
    trackersPreventedFromProfilingView = v7->_trackersPreventedFromProfilingView;
    v7->_trackersPreventedFromProfilingView = v16;

    v18 = _WBSLocalizedString();
    v19 = [(SFPrivacyReportOverviewCellContentView *)v7->_trackersPreventedFromProfilingView titleLabel];
    [v19 setText:v18];

    v20 = (void *)MEMORY[0x1E4F28EE0];
    v21 = NSNumber;
    v22 = [v5 knownTrackers];
    v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "count"));
    v24 = [v20 localizedStringFromNumber:v23 numberStyle:1];
    v25 = [(SFPrivacyReportOverviewCellContentView *)v7->_trackersPreventedFromProfilingView subtitleLabel];
    [v25 setText:v24];

    v26 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v9, v11, v13, v15);
    websitesContainingTrackersView = v7->_websitesContainingTrackersView;
    v7->_websitesContainingTrackersView = v26;

    v28 = _WBSLocalizedString();
    v29 = [(SFPrivacyReportOverviewCellContentView *)v7->_websitesContainingTrackersView titleLabel];
    [v29 setText:v28];

    id v30 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v30 setNumberStyle:3];
    [v30 setRoundingMode:2];
    [v30 setMaximumFractionDigits:0];
    [v30 setMinimumIntegerDigits:1];
    [v30 setMaximumIntegerDigits:3];
    v31 = NSNumber;
    [(WBSPrivacyReportDataProvider *)v7->_reportDataProvider ratioOfTrackedFirstPartiesToAllVisited];
    v32 = objc_msgSend(v31, "numberWithDouble:");
    v33 = [v30 stringFromNumber:v32];
    v34 = [(SFPrivacyReportOverviewCellContentView *)v7->_websitesContainingTrackersView subtitleLabel];
    [v34 setText:v33];

    v35 = -[SFPrivacyReportOverviewCellContentView initWithFrame:]([SFPrivacyReportOverviewCellContentView alloc], "initWithFrame:", v9, v11, v13, v15);
    mostBlockedTrackerView = v7->_mostBlockedTrackerView;
    v7->_mostBlockedTrackerView = v35;

    v37 = _WBSLocalizedString();
    v38 = [(SFPrivacyReportOverviewCellContentView *)v7->_mostBlockedTrackerView titleLabel];
    [v38 setText:v37];

    v39 = [v5 mostSeenKnownTracker];
    v40 = [v39 firstParties];
    uint64_t v41 = [v40 count];

    v42 = NSString;
    v43 = _WBSLocalizedString();
    [v39 domain];
    if (v41 == 1) {
      v44 = {;
    }
      v45 = objc_msgSend(v42, "localizedStringWithFormat:", v43, v44);
      v46 = [(SFPrivacyReportOverviewCellContentView *)v7->_mostBlockedTrackerView subtitleLabel];
      [v46 setText:v45];
    }
    else {
      v44 = {;
    }
      v45 = [v39 firstParties];
      v46 = objc_msgSend(v42, "localizedStringWithFormat:", v43, v44, objc_msgSend(v45, "count"));
      v47 = [(SFPrivacyReportOverviewCellContentView *)v7->_mostBlockedTrackerView subtitleLabel];
      [v47 setText:v46];
    }
    v52[0] = v7->_trackersPreventedFromProfilingView;
    v52[1] = v7->_websitesContainingTrackersView;
    v52[2] = v7->_mostBlockedTrackerView;
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
    [(SFPrivacyReportOverviewView *)v7 setItemViews:v48];

    v49 = v7;
  }

  return v7;
}

- (void)setContextType:(int64_t)a3
{
  if (self->_contextType != a3)
  {
    self->_contextType = a3;
    [(SFPrivacyReportOverviewView *)self updateItemBackgroundProperties];
  }
}

- (void)setItemViews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportOverviewView;
  [(SFPrivacyReportGridView *)&v4 setItemViews:a3];
  [(SFPrivacyReportOverviewView *)self updateItemBackgroundProperties];
}

- (void)updateItemBackgroundProperties
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(SFPrivacyReportGridView *)self itemViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        double v9 = [(SFPrivacyReportOverviewView *)self cellBackgroundColor];
        [v8 setCellBackgroundColor:v9];

        [(SFPrivacyReportOverviewView *)self cellBackgroundCornerRadius];
        objc_msgSend(v8, "setCellBackgroundCornerRadius:");
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)cellBackgroundColor
{
  int64_t contextType = self->_contextType;
  if (contextType == 1)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"startPagePrivacyReportColor");
    self = (SFPrivacyReportOverviewView *)objc_claimAutoreleasedReturnValue();
  }
  else if (!contextType)
  {
    self = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
  }

  return self;
}

- (double)cellBackgroundCornerRadius
{
  int IsPad = _SFDeviceIsPad();
  double result = 9.22337204e18;
  if (IsPad) {
    return 10.0;
  }
  return result;
}

- (double)interItemSpacing
{
  double result = 20.0;
  if (!self->_usesInsetStyle) {
    return 0.0;
  }
  return result;
}

- (BOOL)itemViewCanUseCompactWidth:(id)a3
{
  return self->_mostBlockedTrackerView != a3;
}

- (BOOL)itemViewIsLineBreak:(id)a3
{
  return self->_mostBlockedTrackerView == a3;
}

- (void)setUsesInsetStyle:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_usesInsetStyle != a3)
  {
    BOOL v3 = a3;
    self->_usesInsetStyle = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(SFPrivacyReportGridView *)self itemViews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) setUsesInsetStyle:v3];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(SFPrivacyReportGridView *)self updateInterItemSpacing];
  }
}

- (BOOL)usesInsetStyle
{
  return self->_usesInsetStyle;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostBlockedTrackerView, 0);
  objc_storeStrong((id *)&self->_websitesContainingTrackersView, 0);
  objc_storeStrong((id *)&self->_trackersPreventedFromProfilingView, 0);

  objc_storeStrong((id *)&self->_reportDataProvider, 0);
}

@end
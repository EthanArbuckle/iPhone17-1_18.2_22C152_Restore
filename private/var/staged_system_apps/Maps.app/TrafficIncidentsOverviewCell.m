@interface TrafficIncidentsOverviewCell
+ (id)reuseIdentifier;
- (BOOL)showVotingButtons;
- (DeclineAcceptButtonsView)reportingButtonsView;
- (TrafficIncidentReport)incidentReport;
- (TrafficIncidentsDateFormatter)formatter;
- (TrafficIncidentsOverviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (TrafficIncidentsOverviewCellDelegate)delegate;
- (VKTrafficIncidentFeature)incident;
- (void)_detailsUpdateLabels;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)setDelegate:(id)a3;
- (void)setFormatter:(id)a3;
- (void)setIncident:(id)a3;
- (void)setIncidentReport:(id)a3;
- (void)setReportingButtonsView:(id)a3;
- (void)setShowVotingButtons:(BOOL)a3;
@end

@implementation TrafficIncidentsOverviewCell

+ (id)reuseIdentifier
{
  return @"TrafficIncidentsOverviewCellIdentifier";
}

- (TrafficIncidentsOverviewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TrafficIncidentsOverviewCell;
  v4 = [(TrafficIncidentsOverviewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TrafficIncidentsDateFormatter);
    [(TrafficIncidentsOverviewCell *)v4 setFormatter:v5];

    [(TrafficIncidentsOverviewCell *)v4 _setupViews];
    [(TrafficIncidentsOverviewCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)setIncident:(id)a3
{
  v8 = (VKTrafficIncidentFeature *)a3;
  if (self->_incident != v8)
  {
    incidentReport = self->_incidentReport;
    self->_incidentReport = 0;

    objc_storeStrong((id *)&self->_incident, a3);
    [(TrafficIncidentsOverviewCell *)self _detailsUpdateLabels];
  }
  uint64_t v6 = [(TrafficIncidentsOverviewCell *)self showVotingButtons] ^ 1;
  objc_super v7 = [(TrafficIncidentsOverviewCell *)self reportingButtonsView];
  [v7 setHidden:v6];
}

- (void)setIncidentReport:(id)a3
{
  v8 = (TrafficIncidentReport *)a3;
  if (self->_incidentReport != v8)
  {
    incident = self->_incident;
    self->_incident = 0;

    objc_storeStrong((id *)&self->_incidentReport, a3);
    [(TrafficIncidentsOverviewCell *)self _detailsUpdateLabels];
  }
  uint64_t v6 = [(TrafficIncidentsOverviewCell *)self showVotingButtons] ^ 1;
  objc_super v7 = [(TrafficIncidentsOverviewCell *)self reportingButtonsView];
  [v7 setHidden:v6];
}

- (void)_setupViews
{
  v3 = +[UIColor clearColor];
  [(TrafficIncidentsOverviewCell *)self setBackgroundColor:v3];

  [(TrafficIncidentsOverviewCell *)self setOpaque:0];
  v4 = +[UIColor clearColor];
  v5 = [(TrafficIncidentsOverviewCell *)self contentView];
  [v5 setBackgroundColor:v4];

  uint64_t v6 = [(TrafficIncidentsOverviewCell *)self contentView];
  [v6 setOpaque:0];

  objc_super v7 = [DeclineAcceptButtonsView alloc];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Cleared" value:@"localized string not found" table:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100C7CCB8;
  v18[3] = &unk_1012E5D08;
  v18[4] = self;
  v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Still Here" value:@"localized string not found" table:0];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100C7CD10;
  v17[3] = &unk_1012E5D08;
  v17[4] = self;
  v12 = [(DeclineAcceptButtonsView *)v7 initWithDeclineTitle:v9 declineAction:v18 acceptTitle:v11 acceptAction:v17];
  [(TrafficIncidentsOverviewCell *)self setReportingButtonsView:v12];

  v13 = [(TrafficIncidentsOverviewCell *)self reportingButtonsView];
  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

  v14 = [objc_alloc((Class)MKIncidentDetailContentView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  incidentDetailContentView = self->_incidentDetailContentView;
  self->_incidentDetailContentView = v14;

  [(MKIncidentDetailContentView *)self->_incidentDetailContentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKIncidentDetailContentView *)self->_incidentDetailContentView setDelegate:self];
  v16 = [(TrafficIncidentsOverviewCell *)self contentView];
  [v16 addSubview:self->_incidentDetailContentView];
}

- (void)_setupConstraints
{
  v18 = [(MKIncidentDetailContentView *)self->_incidentDetailContentView leadingAnchor];
  v19 = [(TrafficIncidentsOverviewCell *)self contentView];
  v17 = [v19 leadingAnchor];
  v16 = [v18 constraintEqualToAnchor:v17];
  v20[0] = v16;
  v14 = [(MKIncidentDetailContentView *)self->_incidentDetailContentView trailingAnchor];
  v15 = [(TrafficIncidentsOverviewCell *)self contentView];
  v13 = [v15 trailingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v20[1] = v3;
  v4 = [(MKIncidentDetailContentView *)self->_incidentDetailContentView topAnchor];
  v5 = [(TrafficIncidentsOverviewCell *)self contentView];
  uint64_t v6 = [v5 topAnchor];
  objc_super v7 = [v4 constraintEqualToAnchor:v6];
  v20[2] = v7;
  v8 = [(MKIncidentDetailContentView *)self->_incidentDetailContentView bottomAnchor];
  v9 = [(TrafficIncidentsOverviewCell *)self contentView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v20[3] = v11;
  v12 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)_detailsUpdateLabels
{
  v3 = [(TrafficIncidentsOverviewCell *)self incidentReport];

  if (v3)
  {
    v4 = [(TrafficIncidentsOverviewCell *)self incidentReport];
    unint64_t v5 = +[TrafficIncidentLayoutItem vkTrafficIncidentTypeForGEOType:](TrafficIncidentLayoutItem, "vkTrafficIncidentTypeForGEOType:", [v4 incidentType]);

    uint64_t v6 = self;
    objc_super v7 = [(TrafficIncidentsOverviewCell *)v6 window];
    v8 = [v7 screen];
    if (v8)
    {
      v9 = [(TrafficIncidentsOverviewCell *)v6 window];
      v10 = [v9 screen];
      [v10 nativeScale];
    }
    else
    {
      v9 = +[UIScreen mainScreen];
      [v9 nativeScale];
    }

    sub_1007240D8(v5, 4);
    id v57 = (id)objc_claimAutoreleasedReturnValue();
    v20 = [(TrafficIncidentsOverviewCell *)v6 incidentReport];
    v21 = [v20 incidentUpdateTime];

    if (v21)
    {
      v22 = [(TrafficIncidentsOverviewCell *)v6 formatter];
      v23 = [(TrafficIncidentsOverviewCell *)v6 incidentReport];
      v24 = [v23 incidentUpdateTime];
      v25 = [v22 lastUpdatedUIStringForDate:v24];
    }
    else
    {
      v25 = 0;
    }
    [(MKIncidentDetailContentView *)v6->_incidentDetailContentView configureWithTitle:0 subtitle:v25 body:0 image:v57];
    goto LABEL_29;
  }
  v11 = [(TrafficIncidentsOverviewCell *)self incident];

  if (!v11) {
    return;
  }
  v12 = [(TrafficIncidentsOverviewCell *)self incident];
  v13 = self;
  v14 = [(TrafficIncidentsOverviewCell *)v13 window];
  v15 = [v14 screen];
  if (v15)
  {
    v16 = [(TrafficIncidentsOverviewCell *)v13 window];
    v17 = [v16 screen];
    [v17 nativeScale];
    double v19 = v18;
  }
  else
  {
    v16 = +[UIScreen mainScreen];
    [v16 nativeScale];
    double v19 = v26;
  }

  v27 = sub_100723FDC(v12, 4, v19);

  v28 = [(TrafficIncidentsOverviewCell *)v13 incident];
  unsigned int v29 = [v28 isRestrictionIncident];

  v30 = [(TrafficIncidentsOverviewCell *)v13 incident];
  v31 = v30;
  if (v29)
  {
    id v32 = [v30 restrictionCombinedDetails];
  }
  else
  {
    v33 = [v30 info];
    v34 = v33;
    if (v33)
    {
      id v32 = v33;
    }
    else
    {
      v35 = [(TrafficIncidentsOverviewCell *)v13 incident];
      id v32 = [v35 subtitle];
    }
  }

  v36 = [(TrafficIncidentsOverviewCell *)v13 incident];
  unsigned int v37 = [v36 isRestrictionIncident];

  v38 = [(TrafficIncidentsOverviewCell *)v13 incident];
  v25 = v38;
  if (v37)
  {
    uint64_t v39 = [v38 restrictionEffectiveTimeRange];
  }
  else
  {
    v40 = [v38 endDate];

    if (v40)
    {
      v41 = +[NSBundle mainBundle];
      v55 = [v41 localizedStringForKey:@"TrafficIncidentEndDate" value:@"localized string not found" table:0];

      v56 = [(TrafficIncidentsOverviewCell *)v13 formatter];
      v42 = [(TrafficIncidentsOverviewCell *)v13 incident];
      [v42 endDate];
      v43 = id v58 = v27;
      v44 = [v56 dateStringForDate:v43];
      v45 = [(TrafficIncidentsOverviewCell *)v13 formatter];
      v46 = [(TrafficIncidentsOverviewCell *)v13 incident];
      v47 = [v46 endDate];
      v48 = [v45 timeStringForDate:v47];
      v25 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v55, v44, v48);

      v27 = v58;
    }
    else
    {
      v25 = 0;
    }
    v49 = [(TrafficIncidentsOverviewCell *)v13 incident];
    v50 = [v49 lastUpdatedDate];

    if (!v50) {
      goto LABEL_28;
    }
    v51 = [(TrafficIncidentsOverviewCell *)v13 formatter];
    v52 = [(TrafficIncidentsOverviewCell *)v13 incident];
    v53 = [v52 lastUpdatedDate];
    uint64_t v39 = [v51 lastUpdatedUIStringForDate:v53];
  }
  v25 = (void *)v39;
LABEL_28:
  v54 = [(TrafficIncidentsOverviewCell *)v13 incident];
  id v57 = [v54 title];

  [(MKIncidentDetailContentView *)v13->_incidentDetailContentView configureWithTitle:v57 subtitle:v25 body:v32 image:v27];
LABEL_29:
}

- (VKTrafficIncidentFeature)incident
{
  return self->_incident;
}

- (TrafficIncidentReport)incidentReport
{
  return self->_incidentReport;
}

- (BOOL)showVotingButtons
{
  return self->_showVotingButtons;
}

- (void)setShowVotingButtons:(BOOL)a3
{
  self->_showVotingButtons = a3;
}

- (TrafficIncidentsOverviewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TrafficIncidentsOverviewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (TrafficIncidentsDateFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (DeclineAcceptButtonsView)reportingButtonsView
{
  return self->_reportingButtonsView;
}

- (void)setReportingButtonsView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingButtonsView, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_incidentReport, 0);
  objc_storeStrong((id *)&self->_incident, 0);

  objc_storeStrong((id *)&self->_incidentDetailContentView, 0);
}

@end
@interface TrafficIncidentsDescriptionView
- (NSString)incidentString;
- (TrafficIncidentsDescriptionView)init;
- (_MKUILabel)hiddenCenteringLabel;
- (void)setHiddenCenteringLabel:(id)a3;
- (void)setIncidentString:(id)a3;
@end

@implementation TrafficIncidentsDescriptionView

- (TrafficIncidentsDescriptionView)init
{
  v37.receiver = self;
  v37.super_class = (Class)TrafficIncidentsDescriptionView;
  v2 = [(TrafficIncidentsDescriptionView *)&v37 init];
  if (v2)
  {
    v3 = (_MKUILabel *)objc_alloc_init((Class)_MKUILabel);
    label = v2->_label;
    v2->_label = v3;

    [(_MKUILabel *)v2->_label setNumberOfLines:0];
    [(_MKUILabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = +[UIColor labelColor];
    [(_MKUILabel *)v2->_label setTextColor:v5];

    id v6 = objc_alloc_init((Class)_MKUILabel);
    [(TrafficIncidentsDescriptionView *)v2 setHiddenCenteringLabel:v6];

    v7 = [(TrafficIncidentsDescriptionView *)v2 hiddenCenteringLabel];
    [v7 setNumberOfLines:2];

    v8 = [(TrafficIncidentsDescriptionView *)v2 hiddenCenteringLabel];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(TrafficIncidentsDescriptionView *)v2 hiddenCenteringLabel];
    [v9 setAlpha:0.0];

    [(TrafficIncidentsDescriptionView *)v2 addSubview:v2->_label];
    v10 = [(TrafficIncidentsDescriptionView *)v2 hiddenCenteringLabel];
    [(TrafficIncidentsDescriptionView *)v2 addSubview:v10];

    v11 = [(TrafficIncidentsDescriptionView *)v2 hiddenCenteringLabel];
    +[DynamicTypeWizard autorefreshLabel:v11 withFontProvider:&stru_101321300];

    +[DynamicTypeWizard autorefreshLabel:v2->_label withFontProvider:&stru_101321300];
    v36 = [(_MKUILabel *)v2->_label leadingAnchor];
    v35 = [(TrafficIncidentsDescriptionView *)v2 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v38[0] = v34;
    v33 = [(_MKUILabel *)v2->_label trailingAnchor];
    v32 = [(TrafficIncidentsDescriptionView *)v2 trailingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v38[1] = v31;
    v30 = [(_MKUILabel *)v2->_label bottomAnchor];
    v29 = [(TrafficIncidentsDescriptionView *)v2 bottomAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:-10.0];
    v38[2] = v28;
    v27 = [(_MKUILabel *)v2->_hiddenCenteringLabel leadingAnchor];
    v26 = [(TrafficIncidentsDescriptionView *)v2 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v38[3] = v25;
    v24 = [(_MKUILabel *)v2->_hiddenCenteringLabel trailingAnchor];
    v23 = [(TrafficIncidentsDescriptionView *)v2 trailingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v38[4] = v22;
    v21 = [(_MKUILabel *)v2->_label firstBaselineAnchor];
    v12 = [(TrafficIncidentsDescriptionView *)v2 topAnchor];
    v13 = [v21 constraintEqualToAnchor:v12];
    v14 = +[DynamicTypeWizard autoscaledConstraint:v13 constant:&stru_101321300 withFontProvider:32.0];
    v38[5] = v14;
    v15 = [(_MKUILabel *)v2->_hiddenCenteringLabel firstBaselineAnchor];
    v16 = [(TrafficIncidentsDescriptionView *)v2 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v18 = +[DynamicTypeWizard autoscaledConstraint:v17 constant:&stru_101321300 withFontProvider:32.0];
    v38[6] = v18;
    v19 = +[NSArray arrayWithObjects:v38 count:7];
    +[NSLayoutConstraint activateConstraints:v19];
  }
  return v2;
}

- (void)setIncidentString:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_incidentString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_incidentString, a3);
    [(_MKUILabel *)self->_label setText:v5];
    [(_MKUILabel *)self->_hiddenCenteringLabel setText:v5];
  }
}

- (NSString)incidentString
{
  return self->_incidentString;
}

- (_MKUILabel)hiddenCenteringLabel
{
  return self->_hiddenCenteringLabel;
}

- (void)setHiddenCenteringLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenCenteringLabel, 0);
  objc_storeStrong((id *)&self->_incidentString, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
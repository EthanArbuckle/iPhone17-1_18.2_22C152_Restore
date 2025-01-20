@interface MTAAlarmCollectionViewCell
+ (double)cellHeight;
- (BOOL)_disableRasterizeInAnimations;
- (BOOL)editing;
- (CGRect)editingPopoverSourceRect;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAAlarmCollectionViewCell)initWithFrame:(CGRect)a3;
- (MTAAlarmCollectionViewCellDelegate)delegate;
- (MTUIDigitalClockLabel)timeLabel;
- (NUIContainerGridView)gridView;
- (UIButton)deleteButton;
- (UILabel)nameLabel;
- (UILabel)repeatLabel;
- (UILabel)soundLabel;
- (UISwitch)enableSwitch;
- (void)deleteTapped:(id)a3;
- (void)refreshUI:(id)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnableSwitch:(id)a3;
- (void)setGridView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setRepeatLabel:(id)a3;
- (void)setSoundLabel:(id)a3;
- (void)setTimeLabel:(id)a3;
- (void)toggleEnabled:(id)a3;
@end

@implementation MTAAlarmCollectionViewCell

- (MTAAlarmCollectionViewCell)initWithFrame:(CGRect)a3
{
  v73.receiver = self;
  v73.super_class = (Class)MTAAlarmCollectionViewCell;
  v3 = -[MTAAlarmCollectionViewCell initWithFrame:](&v73, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [objc_alloc((Class)MTUIDigitalClockLabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(MTAAlarmCollectionViewCell *)v3 setTimeLabel:v4];

    v5 = +[UIFont mtui_thinTimeFontOfSize:58.0];
    v6 = [(MTAAlarmCollectionViewCell *)v3 timeLabel];
    [v6 setFont:v5];

    v7 = +[UIFont _lightSystemFontOfSize:30.0];
    v8 = [(MTAAlarmCollectionViewCell *)v3 timeLabel];
    [v8 setTimeDesignatorFont:v7];

    v9 = +[UIColor clearColor];
    v10 = [(MTAAlarmCollectionViewCell *)v3 timeLabel];
    [v10 setBackgroundColor:v9];

    v11 = [(MTAAlarmCollectionViewCell *)v3 timeLabel];
    v12 = [v11 dateLabel];
    [v12 setAdjustsFontSizeToFitWidth:1];

    v13 = objc_opt_new();
    [(MTAAlarmCollectionViewCell *)v3 setNameLabel:v13];

    v14 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    [v14 setAdjustsFontForContentSizeCategory:1];

    v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v16 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    [v16 setFont:v15];

    v17 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    [v17 setAdjustsFontSizeToFitWidth:1];

    v18 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    [v18 setMinimumFontSize:10.0];

    v19 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    [v19 setLineBreakMode:4];

    v20 = objc_opt_new();
    [(MTAAlarmCollectionViewCell *)v3 setRepeatLabel:v20];

    v21 = [(MTAAlarmCollectionViewCell *)v3 repeatLabel];
    [v21 setAdjustsFontForContentSizeCategory:1];

    v22 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v23 = [(MTAAlarmCollectionViewCell *)v3 repeatLabel];
    [v23 setFont:v22];

    v24 = [(MTAAlarmCollectionViewCell *)v3 repeatLabel];
    [v24 setAdjustsFontSizeToFitWidth:1];

    v25 = objc_opt_new();
    [(MTAAlarmCollectionViewCell *)v3 setSoundLabel:v25];

    v26 = [(MTAAlarmCollectionViewCell *)v3 soundLabel];
    [v26 setAdjustsFontForContentSizeCategory:1];

    v27 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v28 = [(MTAAlarmCollectionViewCell *)v3 soundLabel];
    [v28 setFont:v27];

    v29 = [(MTAAlarmCollectionViewCell *)v3 soundLabel];
    [v29 setAdjustsFontSizeToFitWidth:1];

    v30 = objc_opt_new();
    [(MTAAlarmCollectionViewCell *)v3 setEnableSwitch:v30];

    v31 = +[UIColor mtui_switchTintColor];
    v32 = [(MTAAlarmCollectionViewCell *)v3 enableSwitch];
    [v32 setTintColor:v31];

    v33 = [(MTAAlarmCollectionViewCell *)v3 enableSwitch];
    [v33 addTarget:v3 action:"toggleEnabled:" forControlEvents:4096];

    v34 = [(MTAAlarmCollectionViewCell *)v3 enableSwitch];
    [v34 setPreferredStyle:2];

    v35 = +[UIButton buttonWithType:0];
    [(MTAAlarmCollectionViewCell *)v3 setDeleteButton:v35];

    v36 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    v37 = +[UIImage mtui_deleteButtonImage];
    [v36 setImage:v37 forState:0];

    v38 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    [v38 addTarget:v3 action:"deleteTapped:" forControlEvents:64];

    v39 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    LODWORD(v40) = 1148846080;
    [v39 setContentCompressionResistancePriority:0 forAxis:v40];

    v41 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    LODWORD(v42) = 1148846080;
    [v41 setContentHuggingPriority:0 forAxis:v42];

    v43 = +[UIShape circleShape];
    v44 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    v45 = [v44 hoverStyle];
    [v45 setShape:v43];

    v46 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    [v46 setAlpha:0.0];

    v47 = +[UIColor mtui_foregroundColor];
    v48 = [(MTAAlarmCollectionViewCell *)v3 contentView];
    [v48 setBackgroundColor:v47];

    v49 = objc_opt_new();
    v50 = +[UIColor clearColor];
    [v49 setBackgroundColor:v50];

    v71 = [(MTAAlarmCollectionViewCell *)v3 deleteButton];
    v78[0] = v71;
    v70 = [(MTAAlarmCollectionViewCell *)v3 timeLabel];
    v78[1] = v70;
    v69 = +[NSArray arrayWithObjects:v78 count:2];
    v79[0] = v69;
    v77[0] = v49;
    v68 = [(MTAAlarmCollectionViewCell *)v3 nameLabel];
    v77[1] = v68;
    v51 = +[NSArray arrayWithObjects:v77 count:2];
    v79[1] = v51;
    v76[0] = v49;
    v52 = [(MTAAlarmCollectionViewCell *)v3 repeatLabel];
    v76[1] = v52;
    v53 = +[NSArray arrayWithObjects:v76 count:2];
    v79[2] = v53;
    v75[0] = v49;
    v72 = v49;
    v54 = [(MTAAlarmCollectionViewCell *)v3 soundLabel];
    v75[1] = v54;
    v55 = +[NSArray arrayWithObjects:v75 count:2];
    v79[3] = v55;
    v74[0] = v49;
    v56 = [(MTAAlarmCollectionViewCell *)v3 enableSwitch];
    v74[1] = v56;
    v57 = +[NSArray arrayWithObjects:v74 count:2];
    v79[4] = v57;
    v58 = +[NSArray arrayWithObjects:v79 count:5];
    uint64_t v59 = +[NUIContainerGridView containerGridViewWithArrangedSubviewRows:v58];
    gridView = v3->_gridView;
    v3->_gridView = (NUIContainerGridView *)v59;

    v61 = [(MTAAlarmCollectionViewCell *)v3 contentView];
    [v61 bounds];
    -[NUIContainerGridView setFrame:](v3->_gridView, "setFrame:");

    [(NUIContainerGridView *)v3->_gridView setAutoresizingMask:18];
    [(NUIContainerGridView *)v3->_gridView setVerticalAlignment:3];
    [(NUIContainerGridView *)v3->_gridView setHorizontalAlignment:1];
    v62 = [(MTAAlarmCollectionViewCell *)v3 gridView];
    v63 = [v62 columnAtIndex:0];

    [v63 setAlignment:3];
    [v63 setLength:38.0];
    [(NUIContainerGridView *)v3->_gridView setColumnSpacing:0.0];
    -[NUIContainerGridView setDirectionalLayoutMargins:](v3->_gridView, "setDirectionalLayoutMargins:", 98.0, 0.0, 53.0, 16.0);
    [(NUIContainerGridView *)v3->_gridView setBaselineRelativeLayoutMarginsForArrangement:1];
    v64 = [(MTAAlarmCollectionViewCell *)v3 contentView];
    [v64 addSubview:v3->_gridView];

    v65 = [(MTAAlarmCollectionViewCell *)v3 contentView];
    v66 = [v65 layer];
    [v66 setCornerRadius:16.0];
  }
  return v3;
}

+ (double)cellHeight
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v2 lineHeight];
  double v4 = v3 * 3.0 + 7.0 + 115.0;
  [v2 _scaledValueForValue:8.0];
  double v6 = v4 + v5 + 31.0 + 53.0;

  return v6;
}

- (void)deleteTapped:(id)a3
{
  id v4 = [(MTAAlarmCollectionViewCell *)self delegate];
  [v4 deleteCell:self];
}

- (void)toggleEnabled:(id)a3
{
  id v4 = [a3 isOn];
  double v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CollectionViewCell: alarm active toggled to %d", (uint8_t *)v7, 8u);
  }

  double v6 = [(MTAAlarmCollectionViewCell *)self delegate];
  [v6 setAlarmEnabled:v4 forCell:self];
}

- (CGRect)editingPopoverSourceRect
{
  double v3 = [(MTAAlarmCollectionViewCell *)self timeLabel];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(MTAAlarmCollectionViewCell *)self contentView];
  -[MTAAlarmCollectionViewCell convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a3) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.0;
    }
    double v5 = [(MTAAlarmCollectionViewCell *)self deleteButton];
    [v5 setAlpha:v4];

    if (self->_editing) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
    double v7 = [(MTAAlarmCollectionViewCell *)self enableSwitch];
    [v7 setAlpha:v6];

    BOOL v8 = !self->_editing;
    id v9 = [(MTAAlarmCollectionViewCell *)self enableSwitch];
    [v9 setEnabled:v8];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    +[UIView beginAnimations:@"MTAlarmCollectionCellEditing"];
    [(MTAAlarmCollectionViewCell *)self setEditing:v4];
    +[UIView commitAnimations];
  }
  else
  {
    -[MTAAlarmCollectionViewCell setEditing:](self, "setEditing:");
  }
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v34 = a3;
  id v5 = [v34 isEnabled];
  double v6 = [(MTAAlarmCollectionViewCell *)self timeLabel];
  [v6 setHour:[v34 hour] minute:[v34 minute]];

  if (v5) {
    +[UIColor mtui_primaryTextColor];
  }
  else {
  double v7 = +[UIColor mtui_disabledTextColor];
  }
  BOOL v8 = [(MTAAlarmCollectionViewCell *)self timeLabel];
  [v8 setTextColor:v7];

  id v9 = [v34 displayTitle];
  double v10 = [(MTAAlarmCollectionViewCell *)self nameLabel];
  [v10 setText:v9];

  if (v5) {
    +[UIColor mtui_primaryTextColor];
  }
  else {
  double v11 = +[UIColor mtui_disabledTextColor];
  }
  v12 = [(MTAAlarmCollectionViewCell *)self nameLabel];
  [v12 setTextColor:v11];

  [v34 repeatSchedule];
  double v13 = DateMaskToString();
  double v14 = +[NSBundle bundleForClass:objc_opt_class()];
  double v15 = [v14 localizedStringForKey:@"EDIT_REPEAT_FORMAT" value:&stru_1000A2560 table:@"Localizable"];
  double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);
  double v17 = [(MTAAlarmCollectionViewCell *)self repeatLabel];
  [v17 setText:v16];

  if (v5) {
    +[UIColor mtui_secondaryTextColor];
  }
  else {
  double v18 = +[UIColor mtui_disabledTextColor];
  }
  double v19 = [(MTAAlarmCollectionViewCell *)self repeatLabel];
  [v19 setTextColor:v18];

  double v20 = +[TLToneManager sharedToneManager];
  double v21 = [v34 sound];
  if ([v21 soundType] == (id)2)
  {
    id v22 = [v21 toneIdentifier];
    uint64_t v23 = [v20 nameForToneIdentifier:v22];
LABEL_14:
    v26 = (__CFString *)v23;

    goto LABEL_16;
  }
  if ([v21 soundType] == (id)3)
  {
    id v24 = objc_alloc((Class)MPMediaItem);
    v25 = [v21 mediaItemIdentifier];
    id v22 = [v24 initWithPersistentID:[v25 longLongValue]];

    uint64_t v23 = [v22 valueForProperty:MPMediaItemPropertyTitle];
    goto LABEL_14;
  }
  v26 = &stru_1000A2560;
LABEL_16:
  v27 = +[NSBundle bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"EDIT_SOUND_FORMAT" value:&stru_1000A2560 table:@"Localizable"];
  v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v26);
  v30 = [(MTAAlarmCollectionViewCell *)self soundLabel];
  [v30 setText:v29];

  if (v5) {
    +[UIColor mtui_secondaryTextColor];
  }
  else {
  v31 = +[UIColor mtui_disabledTextColor];
  }
  v32 = [(MTAAlarmCollectionViewCell *)self soundLabel];
  [v32 setTextColor:v31];

  v33 = [(MTAAlarmCollectionViewCell *)self enableSwitch];
  [v33 setOn:v5];

  [(MTAAlarmCollectionViewCell *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(MTAAlarmCollectionViewCell *)self gridView];
  [v5 effectiveLayoutSizeFittingSize:width height];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (MTAAlarmCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAAlarmCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (BOOL)editing
{
  return self->_editing;
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
}

- (MTUIDigitalClockLabel)timeLabel
{
  return self->_timeLabel;
}

- (void)setTimeLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)repeatLabel
{
  return self->_repeatLabel;
}

- (void)setRepeatLabel:(id)a3
{
}

- (UILabel)soundLabel
{
  return self->_soundLabel;
}

- (void)setSoundLabel:(id)a3
{
}

- (UISwitch)enableSwitch
{
  return self->_enableSwitch;
}

- (void)setEnableSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableSwitch, 0);
  objc_storeStrong((id *)&self->_soundLabel, 0);
  objc_storeStrong((id *)&self->_repeatLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
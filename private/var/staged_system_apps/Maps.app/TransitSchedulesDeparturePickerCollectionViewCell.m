@interface TransitSchedulesDeparturePickerCollectionViewCell
- (TransitSchedulesDeparturePickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (TransitSchedulesDeparturePickerCollectionViewCellDelegate)delegate;
- (id)statusStringForDeparture:(id)a3;
- (id)titleForDeparture:(id)a3;
- (void)_updateDeparturePickerWithSelectedDeparture:(id)a3;
- (void)configureViews;
- (void)setDelegate:(id)a3;
- (void)setDepartures:(id)a3 withSelectedDeparture:(id)a4 referenceDate:(id)a5 timeZone:(id)a6 timeDisplayStyle:(unint64_t)a7;
@end

@implementation TransitSchedulesDeparturePickerCollectionViewCell

- (TransitSchedulesDeparturePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesDeparturePickerCollectionViewCell;
  v3 = -[TransitSchedulesDeparturePickerCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(TransitSchedulesDeparturePickerCollectionViewCell *)v3 configureViews];
  }
  return v4;
}

- (void)configureViews
{
  v3 = [(TransitSchedulesDeparturePickerCollectionViewCell *)self contentView];
  v4 = +[UIButton buttonWithType:124];
  picker = self->_picker;
  self->_picker = v4;

  objc_super v6 = [(UIButton *)self->_picker titleLabel];
  [v6 setTextAlignment:0];

  [(UIButton *)self->_picker setContentHorizontalAlignment:1];
  [(UIButton *)self->_picker setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_picker setShowsMenuAsPrimaryAction:1];
  [(UIButton *)self->_picker setContextMenuInteractionEnabled:1];
  [v3 addSubview:self->_picker];
  v19 = [(UIButton *)self->_picker leadingAnchor];
  v18 = [v3 leadingAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v16 = [(UIButton *)self->_picker trailingAnchor];
  v7 = [v3 trailingAnchor];
  v8 = [v16 constraintEqualToAnchor:v7];
  v20[1] = v8;
  v9 = [(UIButton *)self->_picker topAnchor];
  v10 = [v3 topAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v20[2] = v11;
  v12 = [(UIButton *)self->_picker bottomAnchor];
  v13 = [v3 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v20[3] = v14;
  v15 = +[NSArray arrayWithObjects:v20 count:4];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)setDepartures:(id)a3 withSelectedDeparture:(id)a4 referenceDate:(id)a5 timeZone:(id)a6 timeDisplayStyle:(unint64_t)a7
{
  id v12 = a5;
  id v16 = a4;
  id v13 = a3;
  [(TransitSchedulesDepartureBaseViewCell *)self setTimeZone:a6];
  [(TransitSchedulesDepartureBaseViewCell *)self setReferenceDate:v12];

  [(TransitSchedulesDepartureBaseViewCell *)self setTimeDisplayStyle:a7];
  v14 = (NSArray *)[v13 copy];

  departures = self->_departures;
  self->_departures = v14;

  [(TransitSchedulesDeparturePickerCollectionViewCell *)self _updateDeparturePickerWithSelectedDeparture:v16];
}

- (id)titleForDeparture:(id)a3
{
  id v4 = a3;
  v5 = [(TransitSchedulesDepartureBaseViewCell *)self timeStringForDeparture:v4];
  objc_super v6 = [(TransitSchedulesDeparturePickerCollectionViewCell *)self statusStringForDeparture:v4];

  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"[Transit Schedules] %@ time · %@ status" value:@"localized string not found" table:0];

  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v5, v6);

  return v9;
}

- (void)_updateDeparturePickerWithSelectedDeparture:(id)a3
{
  id v14 = a3;
  val = self;
  if (![(NSArray *)self->_departures count])
  {
    id v4 = sub_100576CFC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Unable to populate the departures picker since there are no departures", (uint8_t *)buf, 2u);
    }

    [(UIButton *)self->_picker setMenu:0];
  }
  v5 = +[NSMutableArray array];
  objc_initWeak(buf, self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_departures;
  id v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v10 = [(TransitSchedulesDeparturePickerCollectionViewCell *)val titleForDeparture:v9];
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_1007CE46C;
        v16[3] = &unk_1012E6368;
        objc_copyWeak(&v17, buf);
        v16[4] = v9;
        v11 = +[UIAction actionWithTitle:v10 image:0 identifier:v10 handler:v16];
        [v11 setState:[v14 tripIdentifier] == [v9 tripIdentifier]];
        [v5 addObject:v11];

        objc_destroyWeak(&v17);
      }
      id v6 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  id v12 = +[UIMenu menuWithTitle:&stru_101324E70 children:v5];
  [(UIButton *)val->_picker setMenu:v12];

  objc_destroyWeak(buf);
}

- (id)statusStringForDeparture:(id)a3
{
  id v4 = a3;
  if ([v4 isCanceled])
  {
    v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"Schedules Departure cell status - Canceled";
  }
  else
  {
    uint64_t v8 = [v4 liveStatus] == 0;
    v9 = [(TransitSchedulesDepartureBaseViewCell *)self referenceDate];
    LODWORD(v8) = [v4 isPastDepartureRelativeToDate:v9 usingGracePeriod:v8];

    if (!v8)
    {
      id v6 = [v4 liveStatusString];
      if (v6)
      {
        id v11 = objc_alloc((Class)MKServerFormattedStringParameters);
        MKFormattedStringOptionsMakeDefault();
        id v12 = [v11 initWithOptions:&v19 variableOverrides:0];
        id v13 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v6 parameters:v12];
        id v14 = [v13 multiPartAttributedStringWithAttributes:&__NSDictionary0__struct];
        v15 = [v14 attributedString];
        v10 = [v15 string];
      }
      else
      {
        id v12 = [(TransitSchedulesDepartureBaseViewCell *)self emphasizedLowFrequencyDepartureDateForDeparture:v4];
        id v16 = [(TransitSchedulesDepartureBaseViewCell *)self dateFormatter];
        id v17 = [v16 stringFromDate:v12];

        v10 = +[NSString _navigation_formattedDescriptionForLiveStatus:[(TransitSchedulesDepartureBaseViewCell *)self effectiveLiveStatusForDeparture:v4] updatedDepartureTimeString:v17];
      }
      goto LABEL_10;
    }
    v5 = +[NSBundle mainBundle];
    id v6 = v5;
    CFStringRef v7 = @"Schedules Departure cell status - Departed";
  }
  v10 = [v5 localizedStringForKey:v7 value:@"localized string not found" table:0];
LABEL_10:

  return v10;
}

- (TransitSchedulesDeparturePickerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransitSchedulesDeparturePickerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_departures, 0);

  objc_storeStrong((id *)&self->_picker, 0);
}

@end
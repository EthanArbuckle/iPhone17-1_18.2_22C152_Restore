@interface TransitStationDatePickerHeaderView
- (TransitStationDatePickerHeaderView)initWithFrame:(CGRect)a3;
- (UIDatePicker)datePicker;
@end

@implementation TransitStationDatePickerHeaderView

- (TransitStationDatePickerHeaderView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TransitStationDatePickerHeaderView;
  v3 = -[TransitStationLineScheduleSectionHeaderView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [objc_alloc((Class)UIDatePicker) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    datePicker = v3->_datePicker;
    v3->_datePicker = v4;

    [(UIDatePicker *)v3->_datePicker setDatePickerMode:1];
    v6 = v3->_datePicker;
    v8.receiver = v3;
    v8.super_class = (Class)TransitStationDatePickerHeaderView;
    [(TransitStationLineScheduleSectionHeaderView *)&v8 _addSecondaryView:v6];
  }
  return v3;
}

- (UIDatePicker)datePicker
{
  return self->_datePicker;
}

- (void).cxx_destruct
{
}

@end
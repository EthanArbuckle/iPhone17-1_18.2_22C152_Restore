@interface GeoRequestResponseLogDatePickerViewController
- (void)loadView;
@end

@implementation GeoRequestResponseLogDatePickerViewController

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIDatePicker) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setDatePickerMode:2];
  [(GeoRequestResponseLogDatePickerViewController *)self setView:v3];
}

@end
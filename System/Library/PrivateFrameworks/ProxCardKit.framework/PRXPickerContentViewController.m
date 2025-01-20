@interface PRXPickerContentViewController
+ (Class)contentViewClass;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PRXPickerContentViewController

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)PRXPickerContentViewController;
  [(PRXCardContentViewController *)&v7 viewDidLoad];
  v3 = [(PRXCardContentViewController *)self contentView];
  v4 = [v3 pickerView];
  [v4 setDataSource:self];

  v5 = [(PRXCardContentViewController *)self contentView];
  v6 = [v5 pickerView];
  [v6 setDelegate:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PRXPickerContentViewController;
  [(PRXPickerContentViewController *)&v14 viewWillAppear:a3];
  v4 = [(PRXCardContentViewController *)self contentView];
  v5 = [v4 pickerView];

  uint64_t v6 = [v5 numberOfRowsInComponent:0];
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v5 selectedRowInComponent:0] == -1)
    {
      v8 = [(PRXCardContentViewController *)self contentView];
      v9 = [v8 pickerView];
      v10 = v9;
      if (v7 >= 0) {
        uint64_t v11 = v7;
      }
      else {
        uint64_t v11 = v7 + 1;
      }
      uint64_t v12 = v11 >> 1;
      if (v12 >= 3) {
        uint64_t v13 = 3;
      }
      else {
        uint64_t v13 = v12;
      }
      [v9 selectRow:v13 inComponent:0 animated:0];
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"PRXPickerContentViewController subclasses must override pickerView:numberOfRowsInComponent:" userInfo:0];
  objc_exception_throw(v5);
}

@end
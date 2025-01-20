@interface SBCalendarIconImageProvider
+ (NSString)significantTimeChangeNotificationName;
+ (void)setSignificantTimeChangeNotificationName:(id)a3;
- (SBCalendarIconImageProvider)init;
- (SBCalendarIconImageProvider)initWithDateTimeController:(id)a3;
- (SBCalendarIconImageProviderDelegate)delegate;
- (SBFDateTimeController)dateTimeController;
- (id)iconImageWithInfo:(SBIconImageInfo *)a3;
- (id)iconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5;
- (id)preparedISIcon;
- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3;
- (void)_startListeningForSignificantTimeChanges;
- (void)_stopListeningForSignificantTimeChanges;
- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4;
- (void)dealloc;
- (void)reloadIconImage;
- (void)setDelegate:(id)a3;
@end

@implementation SBCalendarIconImageProvider

- (SBCalendarIconImageProvider)init
{
  v3 = [MEMORY[0x1E4FA5EE8] sharedInstance];
  v4 = [(SBCalendarIconImageProvider *)self initWithDateTimeController:v3];

  return v4;
}

- (SBCalendarIconImageProvider)initWithDateTimeController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBCalendarIconImageProvider;
  v6 = [(SBCalendarIconImageProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dateTimeController, a3);
    [v5 addObserver:v7];
    v8 = [v5 overrideDate];
    if (v8) {
      [(SBCalendarIconImageProvider *)v7 controller:v5 didChangeOverrideDateFromDate:0];
    }
    else {
      [(SBCalendarIconImageProvider *)v7 _startListeningForSignificantTimeChanges];
    }
  }
  return v7;
}

- (void)dealloc
{
  [(SBFDateTimeController *)self->_dateTimeController removeObserver:self];
  [(SBCalendarIconImageProvider *)self _stopListeningForSignificantTimeChanges];
  v3.receiver = self;
  v3.super_class = (Class)SBCalendarIconImageProvider;
  [(SBCalendarIconImageProvider *)&v3 dealloc];
}

+ (NSString)significantTimeChangeNotificationName
{
  if (significantTimeChangeNotificationName) {
    return (NSString *)(id)significantTimeChangeNotificationName;
  }
  else {
    return (NSString *)(id)*MEMORY[0x1E4FB2708];
  }
}

+ (void)setSignificantTimeChangeNotificationName:(id)a3
{
  uint64_t v3 = [a3 copy];
  v4 = (void *)significantTimeChangeNotificationName;
  significantTimeChangeNotificationName = v3;
}

- (void)reloadIconImage
{
  id v3 = [(SBCalendarIconImageProvider *)self delegate];
  [v3 calendarIconImageProviderHasChanged:self];
}

- (void)_startListeningForSignificantTimeChanges
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = [(id)objc_opt_class() significantTimeChangeNotificationName];
  [v4 addObserver:self selector:sel_reloadIconImage name:v3 object:0];
}

- (void)_stopListeningForSignificantTimeChanges
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = [(id)objc_opt_class() significantTimeChangeNotificationName];
  [v4 removeObserver:self name:v3 object:0];
}

- (id)preparedISIcon
{
  v2 = [(SBCalendarIconImageProvider *)self dateTimeController];
  id v3 = [v2 currentDate];

  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithDate:v3 calendar:v4 format:0];

  return v5;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  objc_super v10 = (void *)MEMORY[0x1D9484600](self, a2, a3);
  v11 = [(SBCalendarIconImageProvider *)self preparedISIcon];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v7, v6);
  v13 = [v11 prepareImageForDescriptor:v12];
  v14 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v15 = [v13 CGImage];
  [v13 scale];
  v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);

  return v16;
}

- (id)unmaskedIconImageWithInfo:(SBIconImageInfo *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  objc_super v10 = (void *)MEMORY[0x1D9484600](self, a2, a3);
  v11 = [(SBCalendarIconImageProvider *)self preparedISIcon];
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v8, v7, v6);
  [v12 setShouldApplyMask:0];
  v13 = [v11 prepareImageForDescriptor:v12];
  v14 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v15 = [v13 CGImage];
  [v13 scale];
  v16 = objc_msgSend(v14, "imageWithCGImage:scale:orientation:", v15, 0);

  return v16;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3 traitCollection:(id)a4 options:(unint64_t)a5
{
  int v8 = (int)a4;
  double v9 = v7;
  double v10 = v6;
  double v11 = v5;
  v13 = a3;
  v14 = (void *)MEMORY[0x1D9484600]();
  uint64_t v15 = [(SBCalendarIconImageProvider *)self preparedISIcon];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", v11, v10, v9);
  char v17 = SBHIconServicesOptionsForImageOptions(v8);
  SBHModifyImageDescriptorWithTraitCollection(v16, (uint64_t)v13, v17);
  v18 = [v15 prepareImageForDescriptor:v16];
  v19 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v20 = [v18 CGImage];
  [v18 scale];
  v21 = objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);

  return v21;
}

- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4
{
  uint64_t v6 = [a3 overrideDate];
  id v7 = (id)v6;
  if (a4 || !v6)
  {
    if (a4 && !v6) {
      [(SBCalendarIconImageProvider *)self _startListeningForSignificantTimeChanges];
    }
  }
  else
  {
    [(SBCalendarIconImageProvider *)self _stopListeningForSignificantTimeChanges];
  }
  [(SBCalendarIconImageProvider *)self reloadIconImage];
}

- (SBCalendarIconImageProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBCalendarIconImageProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBFDateTimeController)dateTimeController
{
  return self->_dateTimeController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
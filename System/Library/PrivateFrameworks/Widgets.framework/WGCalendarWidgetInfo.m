@interface WGCalendarWidgetInfo
+ (BOOL)isCalendarExtension:(id)a3;
- (NSDate)date;
- (WGCalendarWidgetInfo)initWithExtension:(id)a3;
- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4;
- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6;
- (void)_handleSignificantTimeChange:(id)a3;
- (void)_resetIconsImpl;
- (void)_setDate:(id)a3;
@end

@implementation WGCalendarWidgetInfo

+ (BOOL)isCalendarExtension:(id)a3
{
  v3 = [a3 identifier];
  if ([v3 hasPrefix:@"com.apple.mobilecal"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 hasPrefix:@"com.apple.UpNextWidget"];
  }

  return v4;
}

- (WGCalendarWidgetInfo)initWithExtension:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WGCalendarWidgetInfo;
  v3 = [(WGWidgetInfo *)&v7 initWithExtension:a3];
  if (v3)
  {
    char v4 = [MEMORY[0x263EFF910] date];
    [(WGCalendarWidgetInfo *)v3 _setDate:v4];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v3 selector:sel__handleSignificantTimeChange_ name:*MEMORY[0x263F1D0A0] object:0];
  }
  return v3;
}

- (id)_queue_iconWithSize:(CGSize)a3 scale:(double)a4 forWidgetWithIdentifier:(id)a5 extension:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x263EFF910]);
  v14 = [MEMORY[0x263EFF8F0] currentCalendar];
  v15 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithDate:v13 calendar:v14 format:0];
  v16 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", width, height, a4);
  v17 = [v15 imageForImageDescriptor:v16];
  v18 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v19 = [v17 CGImage];
  [v17 scale];
  v20 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v19, 0);
  v21 = v20;
  if (v20)
  {
    id v22 = v20;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)WGCalendarWidgetInfo;
    -[WGWidgetInfo _queue_iconWithSize:scale:forWidgetWithIdentifier:extension:](&v25, sel__queue_iconWithSize_scale_forWidgetWithIdentifier_extension_, v11, v12, width, height, a4);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;

  return v23;
}

- (id)_queue_iconWithOutlineForWidgetWithIdentifier:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF910]);
  v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithDate:v8 calendar:v9 format:0];
  id v11 = [MEMORY[0x263F4B558] imageDescriptorNamed:*MEMORY[0x263F4B590]];
  [v11 setDrawBorder:1];
  id v12 = [v10 imageForImageDescriptor:v11];
  id v13 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v14 = [v12 CGImage];
  [v12 scale];
  v15 = objc_msgSend(v13, "imageWithCGImage:scale:orientation:", v14, 0);
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)WGCalendarWidgetInfo;
    id v17 = [(WGWidgetInfo *)&v20 _queue_iconWithOutlineForWidgetWithIdentifier:v6 extension:v7];
  }
  v18 = v17;

  return v18;
}

- (void)_resetIconsImpl
{
  v3 = [MEMORY[0x263EFF910] date];
  [(WGCalendarWidgetInfo *)self _setDate:v3];

  v4.receiver = self;
  v4.super_class = (Class)WGCalendarWidgetInfo;
  [(WGWidgetInfo *)&v4 _resetIconsImpl];
}

- (void)_handleSignificantTimeChange:(id)a3
{
  objc_msgSend(MEMORY[0x263EFF8F0], "currentCalendar", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (([v4 isDateInToday:self->_date] & 1) == 0) {
    [(WGWidgetInfo *)self _resetIcons];
  }
}

- (NSDate)date
{
  return self->_date;
}

- (void)_setDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface NTKLuxViewerComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (NTKLuxViewerComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)alwaysOnTemplate;
- (id)currentSwitcherTemplate;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation NTKLuxViewerComplicationDataSource

- (NTKLuxViewerComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKLuxViewerComplicationDataSource;
  return [(CLKCComplicationDataSource *)&v6 initWithComplication:a3 family:a4 forDevice:a5];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKLuxViewerComplicationDataSource;
  [(NTKLuxViewerComplicationDataSource *)&v2 dealloc];
}

- (id)currentSwitcherTemplate
{
  objc_super v2 = [(NTKLuxViewerComplicationDataSource *)self _currentTimelineEntry];
  v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKLuxViewerComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 50) {
    return NTKInternalBuild(a1, a2, 50, a4);
  }
  else {
    return 0;
  }
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 8;
}

- (id)alwaysOnTemplate
{
  v3 = +[NTKLuxViewerComplicationEntryModel tritiumModel];
  v4 = objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  id v5 = [v4 complicationTemplate];

  return v5;
}

- (id)_currentTimelineEntry
{
  LODWORD(v2) = -1082130432;
  v4 = +[NTKLuxViewerComplicationEntryModel modelWithLux:v2];
  id v5 = objc_msgSend(v4, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));

  return v5;
}

- (void).cxx_destruct
{
}

@end
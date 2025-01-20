@interface NTKCBuildNumberComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (NTKCBuildNumberComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
@end

@implementation NTKCBuildNumberComplicationDataSource

- (NTKCBuildNumberComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)NTKCBuildNumberComplicationDataSource;
  v5 = [(CLKCComplicationDataSource *)&v15 initWithComplication:a3 family:a4 forDevice:a5];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F79EF0] sharedInstance];
    v7 = [MEMORY[0x1E4F79EF0] activeDeviceSelectorBlock];
    v8 = [v6 getAllDevicesWithArchivedDevicesMatching:v7];
    uint64_t v9 = [v8 firstObject];
    nrDevice = v5->nrDevice;
    v5->nrDevice = (NRDevice *)v9;

    uint64_t v11 = [(NRDevice *)v5->nrDevice valueForProperty:*MEMORY[0x1E4F79E40]];
    companionBuild = v5->companionBuild;
    v5->companionBuild = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

- (id)_currentTimelineEntry
{
  v3 = +[NTKCBuildNumberComplicationEntryModel modelWithBuildNum:self->companionBuild];
  v4 = objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));

  return v4;
}

- (id)currentSwitcherTemplate
{
  v2 = [(NTKCBuildNumberComplicationDataSource *)self _currentTimelineEntry];
  v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKCBuildNumberComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 53) {
    return NTKInternalBuild(a1, a2, 53, a4);
  }
  else {
    return 0;
  }
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 8 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a3 == 12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->companionBuild, 0);

  objc_storeStrong((id *)&self->nrDevice, 0);
}

@end
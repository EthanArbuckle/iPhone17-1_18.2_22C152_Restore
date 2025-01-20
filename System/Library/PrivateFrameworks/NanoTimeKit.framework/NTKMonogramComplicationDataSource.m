@interface NTKMonogramComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)supportsTapAction;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (NTKMonogramComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (void)_handleMonogramTextReload;
- (void)_reloadMonogramText;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)pause;
- (void)resume;
- (void)startListeningForMonogramNotifications;
- (void)stopListeningForMonogramNotifications;
@end

@implementation NTKMonogramComplicationDataSource

- (NTKMonogramComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKMonogramComplicationDataSource;
  v5 = [(CLKCComplicationDataSource *)&v8 initWithComplication:a3 family:a4 forDevice:a5];
  v6 = v5;
  if (v5) {
    [(NTKMonogramComplicationDataSource *)v5 startListeningForMonogramNotifications];
  }
  return v6;
}

- (void)resume
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMonogramComplicationDataSource;
  [(CLKCComplicationDataSource *)&v3 resume];
  [(NTKMonogramComplicationDataSource *)self startListeningForMonogramNotifications];
}

- (void)pause
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMonogramComplicationDataSource;
  [(CLKCComplicationDataSource *)&v3 pause];
  [(NTKMonogramComplicationDataSource *)self stopListeningForMonogramNotifications];
}

- (BOOL)supportsTapAction
{
  return 0;
}

- (void)startListeningForMonogramNotifications
{
  if (!self->_listeningForMonogramNotifications)
  {
    self->_listeningForMonogramNotifications = 1;
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__handleMonogramTextReload name:@"NTKCustomMonogramChangedNotification" object:0];
    [v3 addObserver:self selector:sel__handleMonogramTextReload name:@"NTKFaceDefaultsChangedNotification" object:0];
    [v3 addObserver:self selector:sel__handleMonogramTextReload name:*MEMORY[0x1E4F1C370] object:0];
    [v3 addObserver:self selector:sel__handleMonogramTextReload name:*MEMORY[0x1E4F19660] object:0];
  }

  [(NTKMonogramComplicationDataSource *)self _reloadMonogramText];
}

- (void)stopListeningForMonogramNotifications
{
  self->_listeningForMonogramNotifications = 0;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKCustomMonogramChangedNotification" object:0];
  [v3 removeObserver:self name:@"NTKFaceDefaultsChangedNotification" object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F1C370] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F19660] object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NTKMonogramComplicationDataSource;
  [(NTKMonogramComplicationDataSource *)&v4 dealloc];
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 14;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (unint64_t)(a3 - 9) < 2 || *MEMORY[0x1E4F19650] == a3;
}

- (id)currentSwitcherTemplate
{
  if (!self->_monogramText) {
    [(NTKMonogramComplicationDataSource *)self _reloadMonogramText];
  }
  id v3 = [(NTKMonogramComplicationDataSource *)self _currentTimelineEntry];
  objc_super v4 = [v3 complicationTemplate];

  return v4;
}

- (id)_currentTimelineEntry
{
  if (!self->_currentEntry)
  {
    id v3 = (NTKMonogramTimelineEntryModel *)objc_opt_new();
    currentEntry = self->_currentEntry;
    self->_currentEntry = v3;
  }
  v5 = [MEMORY[0x1E4F1C9C8] date];
  [(NTKTimelineEntryModel *)self->_currentEntry setEntryDate:v5];

  [(NTKMonogramTimelineEntryModel *)self->_currentEntry setMonogram:self->_monogramText];
  v6 = self->_currentEntry;
  int64_t v7 = [(CLKCComplicationDataSource *)self family];

  return [(NTKTimelineEntryModel *)v6 entryForComplicationFamily:v7];
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKMonogramComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  int64_t v3 = [(CLKCComplicationDataSource *)self family];
  if (v3 == 10 || v3 == 9) {
    objc_super v4 = objc_opt_class();
  }
  else {
    objc_super v4 = 0;
  }

  return (Class)v4;
}

- (void)_handleMonogramTextReload
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__NTKMonogramComplicationDataSource__handleMonogramTextReload__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__NTKMonogramComplicationDataSource__handleMonogramTextReload__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadMonogramText];
}

- (void)_reloadMonogramText
{
  uint64_t v3 = +[NTKMonogram monogram];
  objc_super v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F1635E90;
  }
  int64_t v7 = v5;

  if (![(NSString *)self->_monogramText isEqualToString:v7])
  {
    objc_storeStrong((id *)&self->_monogramText, v5);
    id v6 = [(CLKCComplicationDataSource *)self delegate];
    [v6 invalidateEntries];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramText, 0);

  objc_storeStrong((id *)&self->_currentEntry, 0);
}

@end
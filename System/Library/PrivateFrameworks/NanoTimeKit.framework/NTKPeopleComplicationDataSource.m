@interface NTKPeopleComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (int64_t)tritiumUpdatePriority;
- (BOOL)supportsTapAction;
- (NTKPeopleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_loadTimelineEntry;
- (id)complicationApplicationIdentifier;
- (id)currentSwitcherTemplate;
- (id)lockedTemplate;
- (unint64_t)timelineAnimationBehavior;
- (void)_didReceiveContactsCachceChangedNotification;
- (void)_invalidateIfNeeded;
- (void)_loadTimelineEntry;
- (void)_queue_reloadTimelineEntry;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)dealloc;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5;
- (void)pause;
- (void)resume;
@end

@implementation NTKPeopleComplicationDataSource

- (NTKPeopleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKPeopleComplicationDataSource;
  v10 = [(CLKCComplicationDataSource *)&v21 initWithComplication:v9 family:a4 forDevice:a5];
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPeopleComplicationDataSource", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_complication, a3);
    if (NTKIsDaemonOrFaceSnapshotService())
    {
      uint64_t v14 = [(NTKPeopleComplicationDataSource *)v10 _loadTimelineEntry];
      switcherEntry = v10->_switcherEntry;
      v10->_switcherEntry = (NTKPeopleComplicationEntry *)v14;
    }
    else
    {
      v16 = [NTKPeopleComplicationEntry alloc];
      switcherEntry = [v9 fullName];
      v17 = [v9 abbreviation];
      uint64_t v18 = [(NTKPeopleComplicationEntry *)v16 initWithFullName:switcherEntry abbreviation:v17 profileImage:0];
      v19 = v10->_switcherEntry;
      v10->_switcherEntry = (NTKPeopleComplicationEntry *)v18;
    }
    v10->_isPaused = 0;
    v10->_needsInvalidation = 1;
    [(NTKPeopleComplicationDataSource *)v10 _setupNotifications];
  }
  return v10;
}

- (void)dealloc
{
  [(NTKPeopleComplicationDataSource *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationDataSource;
  [(NTKPeopleComplicationDataSource *)&v3 dealloc];
}

- (BOOL)supportsTapAction
{
  return 1;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v9 = (void (**)(id, void *))a5;
  v6 = [(NTKPeopleComplication *)self->_complication storeBackedContactID];
  if (v6)
  {
    v7 = [NSString stringWithFormat:@"%@%@", @"contact://show?id=", v6];
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }
  v9[2](v9, v8);
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  timelineEntry = self->_timelineEntry;
  if (timelineEntry)
  {
    v6 = [(NTKTimelineEntryModel *)timelineEntry entryForComplicationFamily:[(CLKCComplicationDataSource *)self family]];
    v4[2](v4, v6);
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__NTKPeopleComplicationDataSource_getCurrentTimelineEntryWithHandler___block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __70__NTKPeopleComplicationDataSource_getCurrentTimelineEntryWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (id)lockedTemplate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (NTKIsDaemonOrFaceSnapshotService())
  {
    objc_super v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = [(NTKPeopleComplication *)self->_complication contactID];
      int v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "People complication: asked for lockedEntry in daemon for id: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v5 = +[NTKPeopleComplicationEntry lockedEntry];
  v6 = objc_msgSend(v5, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v7 = [v6 complicationTemplate];

  return v7;
}

- (id)currentSwitcherTemplate
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  timelineEntry = self->_timelineEntry;
  if (!timelineEntry)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__NTKPeopleComplicationDataSource_currentSwitcherTemplate__block_invoke;
    block[3] = &unk_1E62BFF20;
    block[4] = self;
    dispatch_async(queue, block);
    timelineEntry = self->_switcherEntry;
  }
  v5 = [(NTKTimelineEntryModel *)timelineEntry entryForComplicationFamily:[(CLKCComplicationDataSource *)self family]];
  v6 = [v5 complicationTemplate];

  return v6;
}

uint64_t __58__NTKPeopleComplicationDataSource_currentSwitcherTemplate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (id)complicationApplicationIdentifier
{
  return @"com.apple.NanoPhone";
}

- (void)resume
{
  self->_isPaused = 0;
  objc_super v3 = +[NTKPeopleComplicationContactsCache sharedCache];
  [v3 setupNotificationsIfNecessary];

  [(NTKPeopleComplicationDataSource *)self _invalidateIfNeeded];
}

- (void)pause
{
  self->_isPaused = 1;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 37;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  BOOL result = 1;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 8 && *MEMORY[0x1E4F19648] != a3)
  {
    if ((unint64_t)a3 <= 0xC) {
      return (0x1495u >> a3) & 1;
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (int64_t)tritiumUpdatePriority
{
  return 1;
}

- (void)_invalidateIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_needsInvalidation)
  {
    objc_super v3 = [(CLKCComplicationDataSource *)self delegate];
    [v3 invalidateEntries];

    v4 = [(CLKCComplicationDataSource *)self delegate];
    [v4 invalidateSwitcherTemplate];

    self->_needsInvalidation = 0;
  }
}

- (void)_queue_reloadTimelineEntry
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v3 = [(NTKPeopleComplicationDataSource *)self _loadTimelineEntry];
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __61__NTKPeopleComplicationDataSource__queue_reloadTimelineEntry__block_invoke;
    v5[3] = &unk_1E62C09C0;
    v5[4] = self;
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __61__NTKPeopleComplicationDataSource__queue_reloadTimelineEntry__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  v2 = *(void **)(a1 + 32);

  return [v2 _invalidateIfNeeded];
}

- (id)_loadTimelineEntry
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[NTKPeopleComplicationContactsCache sharedCache];
  p_complication = &self->_complication;
  v5 = [(NTKPeopleComplication *)self->_complication storeBackedContactID];
  id v6 = [v3 contactForId:v5];
  if (v6)
  {
    v7 = [v3 fullNameForContact:v6];
    v8 = [v3 abbreviatedNameForContact:v6];
    if (v7)
    {
      if ([v6 isKeyAvailable:*MEMORY[0x1E4F1AF98]]
        && ([v6 thumbnailImageData],
            int v9 = objc_claimAutoreleasedReturnValue(),
            v9,
            v9))
      {
        id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
        uint64_t v11 = [v6 thumbnailImageData];
        dispatch_queue_t v12 = [v10 initWithData:v11];

        v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = @"No";
          if (!v12) {
            uint64_t v14 = @"Yes";
          }
          int v19 = 138412546;
          v20 = v5;
          __int16 v21 = 2112;
          v22 = v14;
          _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "People complication: is _roundedProfileImageFromImage for id: %@ nil? %@", (uint8_t *)&v19, 0x16u);
        }
      }
      else
      {
        v13 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(NTKPeopleComplicationDataSource *)(uint64_t)v5 _loadTimelineEntry];
        }
        dispatch_queue_t v12 = 0;
      }

      v16 = [NTKPeopleComplicationEntry alloc];
      if (v8) {
        v17 = v8;
      }
      else {
        v17 = &stru_1F1635E90;
      }
      v15 = [(NTKPeopleComplicationEntry *)v16 initWithFullName:v7 abbreviation:v17 profileImage:v12];
    }
    else
    {
      dispatch_queue_t v12 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[NTKPeopleComplicationDataSource _loadTimelineEntry](v12);
      }
      v15 = 0;
    }
  }
  else
  {
    v7 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(NTKPeopleComplicationDataSource *)(id *)p_complication _loadTimelineEntry];
    }
    v15 = 0;
  }

  return v15;
}

- (void)_setupNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _setupNotifications,addObserver", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__didReceiveContactsCachceChangedNotification name:@"NTKPeopleComplicationContactsCacheDidChangeNotification" object:0];
}

- (void)_tearDownNotifications
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ tearDownNotification,removeObserver", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self];
}

- (void)_didReceiveContactsCachceChangedNotification
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v5;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveContactsCachceChangedNotification", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__NTKPeopleComplicationDataSource__didReceiveContactsCachceChangedNotification__block_invoke;
  block[3] = &unk_1E62BFF20;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __79__NTKPeopleComplicationDataSource__didReceiveContactsCachceChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherEntry, 0);
  objc_storeStrong((id *)&self->_timelineEntry, 0);
  objc_storeStrong((id *)&self->_storeBackedContactID, 0);
  objc_storeStrong((id *)&self->_secondaryContactID, 0);
  objc_storeStrong((id *)&self->_complication, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_loadTimelineEntry
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "People complication: contact thumbnailImageData is nil for id: %@", (uint8_t *)&v2, 0xCu);
}

@end
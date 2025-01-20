@interface NTKCGreenfieldPlaceholderComplicationDataSource
+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4;
+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
- (Class)richComplicationDisplayViewClassForDevice:(id)a3;
- (NTKCGreenfieldPlaceholderComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5;
- (id)_currentTimelineEntry;
- (id)currentSwitcherTemplate;
- (void)getCurrentTimelineEntryWithHandler:(id)a3;
- (void)pause;
- (void)resume;
@end

@implementation NTKCGreenfieldPlaceholderComplicationDataSource

- (NTKCGreenfieldPlaceholderComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
    v11 = [(CLKCComplicationDataSource *)&v17 initWithComplication:v9 family:a4 forDevice:v10];
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_placeholderComplication, a3);
      v13 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl(&dword_1BC5A9000, v13, OS_LOG_TYPE_DEFAULT, "NTKCGreenfieldPlaceholderComplicationDataSource: Created for complication: %@", buf, 0xCu);
      }
    }
    self = v12;
    v14 = self;
  }
  else
  {
    v15 = _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NTKCGreenfieldPlaceholderComplicationDataSource initWithComplication:family:forDevice:]((uint64_t)v9, v15);
    }

    v14 = 0;
  }

  return v14;
}

- (void)pause
{
  v2.receiver = self;
  v2.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
  [(CLKCComplicationDataSource *)&v2 pause];
}

- (void)resume
{
  v2.receiver = self;
  v2.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
  [(CLKCComplicationDataSource *)&v2 resume];
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  id v4 = a3;
  v5 = [(CLKCComplicationDataSource *)self complication];
  if ([v5 complicationType] == 48) {
    goto LABEL_8;
  }
  v6 = [(CLKCComplicationDataSource *)self complication];
  if ([v6 complicationType] == 55)
  {

LABEL_8:
    id v9 = 0;
    goto LABEL_9;
  }
  v7 = [(CLKCComplicationDataSource *)self complication];
  uint64_t v8 = [v7 complicationType];

  if (v8 == 31)
  {
    id v9 = 0;
    goto LABEL_10;
  }
  id v10 = [(CLKCComplicationDataSource *)self complication];
  v11 = +[NTKLocalTimelineComplicationController complicationDataSourceClassForComplication:v10 family:[(CLKCComplicationDataSource *)self family] device:v4];

  id v12 = [v11 alloc];
  v13 = [(CLKCComplicationDataSource *)self complication];
  int64_t v14 = [(CLKCComplicationDataSource *)self family];
  v15 = [(CLKCComplicationDataSource *)self context];
  v5 = (void *)[v12 initWithComplication:v13 family:v14 forDevice:v4 context:v15];

  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_8;
  }
  id v9 = [v5 richComplicationDisplayViewClassForDevice:v4];
LABEL_9:

LABEL_10:
  return (Class)v9;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 55;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return ((unint64_t)a3 < 0xD) & (0x1FDFu >> a3);
}

- (id)currentSwitcherTemplate
{
  objc_super v2 = [(NTKCGreenfieldPlaceholderComplicationDataSource *)self _currentTimelineEntry];
  v3 = [v2 complicationTemplate];

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5 = a3;
  id v6 = [(NTKCGreenfieldPlaceholderComplicationDataSource *)self _currentTimelineEntry];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)_currentTimelineEntry
{
  cachedTimelineEntry = self->_cachedTimelineEntry;
  if (cachedTimelineEntry)
  {
    v3 = cachedTimelineEntry;
  }
  else
  {
    id v5 = [(NTKGreenfieldPlaceholderComplication *)self->_placeholderComplication appStoreItemId];

    if (v5)
    {
      id v6 = [(NTKGreenfieldPlaceholderComplication *)self->_placeholderComplication appName];
      LODWORD(v7) = 1.0;
      uint64_t v8 = +[NTKGreenfieldPlaceholderTimelineEntryModel entryModelWithAppIcon:0 appName:v6 installationProgress:v7];
    }
    else
    {
      uint64_t v8 = +[NTKGreenfieldPlaceholderTimelineEntryModel entryModelWithNullState];
    }
    objc_msgSend(v8, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
    id v9 = (CLKComplicationTimelineEntry *)objc_claimAutoreleasedReturnValue();
    id v10 = self->_cachedTimelineEntry;
    self->_cachedTimelineEntry = v9;

    v3 = self->_cachedTimelineEntry;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTimelineEntry, 0);
  objc_storeStrong((id *)&self->_placeholderComplication, 0);
}

- (void)initWithComplication:(uint64_t)a1 family:(NSObject *)a2 forDevice:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "NTKCGreenfieldPlaceholderComplicationDataSource: invalid complication type: %@", (uint8_t *)&v2, 0xCu);
}

@end
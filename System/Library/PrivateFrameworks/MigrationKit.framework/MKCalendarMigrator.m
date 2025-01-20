@interface MKCalendarMigrator
- (MKCalendarMigrator)init;
- (void)import:(id)a3;
- (void)importiCal:(id)a3;
@end

@implementation MKCalendarMigrator

- (MKCalendarMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKCalendarMigrator;
  v2 = [(MKMigrator *)&v6 init];
  if (v2)
  {
    v3 = (EKEventStore *)objc_alloc_init(MEMORY[0x263F04B98]);
    eventStore = v2->_eventStore;
    v2->_eventStore = v3;

    [(MKMigrator *)v2 setType:4];
  }
  return v2;
}

- (void)importiCal:(id)a3
{
  id v7 = a3;
  v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  objc_super v6 = (void *)MEMORY[0x230F5C060](v5);
  [(MKCalendarMigrator *)v4 import:v7];
  objc_sync_exit(v4);
}

- (void)import:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  objc_super v6 = +[MKLog log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_22BFAC000, v6, OS_LOG_TYPE_INFO, "%@ will import iCal.", (uint8_t *)&v24, 0xCu);
  }

  id v7 = [(EKEventStore *)self->_eventStore defaultCalendarForNewEvents];
  v8 = [(EKEventStore *)self->_eventStore importICSData:v4 intoCalendar:v7 options:0];
  [(EKEventStore *)self->_eventStore reset];
  if ([v8 count])
  {
    -[MKMigrator migratorDidImportWithCount:](self, "migratorDidImportWithCount:", [v8 count]);
    -[MKMigrator migratorDidAppendDataSize:](self, "migratorDidAppendDataSize:", [v4 length]);
  }
  else
  {
    v9 = +[MKLog log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      v25 = self;
      _os_log_impl(&dword_22BFAC000, v9, OS_LOG_TYPE_INFO, "%@ EKEventStore was failed to import data.", (uint8_t *)&v24, 0xCu);
    }

    v10 = [MEMORY[0x263F087E8] errorWithDomain:@"MKCalendarError" code:1 userInfo:0];
    v11 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    if ([v11 length])
    {
      unint64_t v12 = objc_msgSend(v11, "mk_occurrenceCountOfString:", @"BEGIN:VCALENDAR");
      if (v12 <= 1) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = v12;
      }
      [(MKMigrator *)self migratorDidFailWithImportError:v10 count:v13];
    }
    else
    {
      [(MKMigrator *)self migratorDidFailWithImportError:v10];
    }
  }
  id v14 = +[MKAnalytics sharedInstance];
  objc_sync_enter(v14);
  v15 = [v14 payload];
  v16 = [v15 calendars];

  v17 = [MEMORY[0x263EFF910] date];
  [v17 timeIntervalSinceDate:v5];
  double v19 = v18;

  v20 = (void *)[objc_alloc(MEMORY[0x263F087B0]) initWithDouble:v19];
  v21 = [v16 importElapsedTime];
  v22 = [v21 decimalNumberByAdding:v20];
  [v16 setImportElapsedTime:v22];

  objc_sync_exit(v14);
  v23 = +[MKLog log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    int v24 = 138412290;
    v25 = self;
    _os_log_impl(&dword_22BFAC000, v23, OS_LOG_TYPE_INFO, "%@ did import iCal.", (uint8_t *)&v24, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end
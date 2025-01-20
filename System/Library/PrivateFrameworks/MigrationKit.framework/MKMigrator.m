@interface MKMigrator
+ (void)initialize;
- (BOOL)importAndWait;
- (MKMigrator)init;
- (MKMigratorDelegate)delegate;
- (double)importTime;
- (int64_t)type;
- (unint64_t)importCount;
- (unint64_t)importErrorCount;
- (unint64_t)size;
- (void)addError:(id)a3;
- (void)import;
- (void)migratorDidAppendDataSize:(unint64_t)a3;
- (void)migratorDidFailWithImportError:(id)a3;
- (void)migratorDidFailWithImportError:(id)a3 count:(unint64_t)a4;
- (void)migratorDidImport;
- (void)migratorDidImportWithCount:(unint64_t)a3;
- (void)migratorDidMeasureImport;
- (void)migratorDidResetImport;
- (void)migratorWillMeasureImport;
- (void)sendAnalytics;
- (void)setDelegate:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MKMigrator

+ (void)initialize
{
  v7[13] = *MEMORY[0x263EF8340];
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v6[0] = &unk_26DF7A3E0;
    v6[1] = &unk_26DF7A410;
    v7[0] = &unk_26DF7A3F8;
    v7[1] = &unk_26DF7A3E0;
    v6[2] = &unk_26DF7A428;
    v6[3] = &unk_26DF7A440;
    v7[2] = &unk_26DF7A410;
    v7[3] = &unk_26DF7A428;
    v6[4] = &unk_26DF7A458;
    v6[5] = &unk_26DF7A470;
    v7[4] = &unk_26DF7A440;
    v7[5] = &unk_26DF7A458;
    v6[6] = &unk_26DF7A488;
    v6[7] = &unk_26DF7A4B8;
    v7[6] = &unk_26DF7A4A0;
    v7[7] = &unk_26DF7A470;
    v6[8] = &unk_26DF7A4D0;
    v6[9] = &unk_26DF7A3F8;
    v7[8] = &unk_26DF7A4E8;
    v7[9] = &unk_26DF7A500;
    v6[10] = &unk_26DF7A4E8;
    v6[11] = &unk_26DF7A530;
    v7[10] = &unk_26DF7A518;
    v7[11] = &unk_26DF7A530;
    v6[12] = &unk_26DF7A548;
    v7[12] = &unk_26DF7A560;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:13];
    v5 = (void *)importContentTypes;
    importContentTypes = v4;
  }
}

- (MKMigrator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKMigrator;
  v2 = [(MKMigrator *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    importErrors = v2->_importErrors;
    v2->_importErrors = v3;
  }
  return v2;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  uint64_t v4 = (void *)importContentTypes;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v8 = [v4 objectForKeyedSubscript:v5];

  if (v8)
  {
    objc_super v6 = -[MKImportAnalytics initWithContentType:]([MKImportAnalytics alloc], "initWithContentType:", [v8 integerValue]);
    analytics = self->_analytics;
    self->_analytics = v6;
  }
}

- (void)import
{
  [(MKMigrator *)self sendAnalytics];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained migratorDidComplete:self];
}

- (void)migratorDidImport
{
}

- (void)migratorDidImportWithCount:(unint64_t)a3
{
  self->_importCount += a3;
}

- (void)migratorDidFailWithImportError:(id)a3
{
}

- (void)migratorDidFailWithImportError:(id)a3 count:(unint64_t)a4
{
  self->_importErrorCount += a4;
  [(MKMigrator *)self addError:a3];
}

- (void)migratorDidAppendDataSize:(unint64_t)a3
{
  self->_size += a3;
}

- (void)migratorDidResetImport
{
  self->_importCount = 0;
  self->_importErrorCount = 0;
  self->_size = 0;
  [(NSMutableSet *)self->_importErrors removeAllObjects];
}

- (void)migratorWillMeasureImport
{
  self->_importTime = objc_alloc_init(MKTime);
  MEMORY[0x270F9A758]();
}

- (void)migratorDidMeasureImport
{
  [(MKTime *)self->_importTime elapsedTimeInSeconds];
  self->_totalImportTime = v3 + self->_totalImportTime;
  importTime = self->_importTime;
  self->_importTime = 0;
}

- (BOOL)importAndWait
{
  return 1;
}

- (unint64_t)importCount
{
  return self->_importCount;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (unint64_t)size
{
  return self->_size;
}

- (double)importTime
{
  return self->_totalImportTime;
}

- (void)addError:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSString;
    id v5 = a3;
    objc_super v6 = [v5 domain];
    uint64_t v7 = [v5 code];

    id v8 = [v4 stringWithFormat:@"%@.%ld", v6, v7];

    [(NSMutableSet *)self->_importErrors addObject:v8];
  }
}

- (void)sendAnalytics
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_importCount || [(NSMutableSet *)self->_importErrors count])
  {
    uint64_t v3 = [(NSMutableSet *)self->_importErrors count];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = self->_importErrors;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          -[MKImportAnalytics send:](self->_analytics, "send:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [(MKImportAnalytics *)self->_analytics complete:v3 == 0];
  }
}

- (MKMigratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MKMigratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_importTime, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_importErrors, 0);
}

@end
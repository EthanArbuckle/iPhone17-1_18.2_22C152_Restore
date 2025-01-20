@interface MKDiscoverabilitySignals
- (MKDiscoverabilitySignals)init;
- (NSMutableDictionary)signals;
- (void)addSignalsForClient:(id)a3;
- (void)addSignalsForMigrator:(id)a3;
- (void)donateSignals;
- (void)setSignals:(id)a3;
@end

@implementation MKDiscoverabilitySignals

- (MKDiscoverabilitySignals)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKDiscoverabilitySignals;
  v2 = [(MKDiscoverabilitySignals *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(MKDiscoverabilitySignals *)v2 setSignals:v3];
  }
  return v2;
}

- (void)addSignalsForClient:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x263EFF960];
  v6 = [v4 locale];
  v7 = [v5 localeWithLocaleIdentifier:v6];

  v8 = [(MKDiscoverabilitySignals *)self signals];
  v9 = [v7 languageCode];
  [v8 setValue:v9 forKey:@"device_language"];

  v10 = [(MKDiscoverabilitySignals *)self signals];
  v11 = [v7 regionCode];
  [v10 setValue:v11 forKey:@"device_region"];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v13 = objc_msgSend(v4, "inputMethodLanguages", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [MEMORY[0x263EFF960] canonicalLanguageIdentifierFromString:*(void *)(*((void *)&v20 + 1) + 8 * v17)];
        [v12 addObject:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  v19 = [(MKDiscoverabilitySignals *)self signals];
  [v19 setValue:v12 forKey:@"input_method_languages"];
}

- (void)addSignalsForMigrator:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([v4 type])
  {
    case 5:
      v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "importCount") != 0);
      v10 = [(MKDiscoverabilitySignals *)self signals];
      v11 = v10;
      id v12 = @"contacts_imported";
      goto LABEL_6;
    case 10:
      v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "importCount") != 0);
      v10 = [(MKDiscoverabilitySignals *)self signals];
      v11 = v10;
      id v12 = @"messages_imported";
LABEL_6:
      [v10 setValue:v9 forKey:v12];

      break;
    case 11:
    case 12:
      objc_super v5 = [(MKDiscoverabilitySignals *)self signals];
      v6 = [v5 objectForKey:@"photo_library_imported"];

      v7 = NSNumber;
      BOOL v8 = ([v6 BOOLValue] & 1) != 0 || objc_msgSend(v4, "importCount") != 0;
      uint64_t v17 = [v7 numberWithInt:v8];

      v18 = [(MKDiscoverabilitySignals *)self signals];
      [v18 setValue:v17 forKey:@"photo_library_imported"];

      break;
    case 16:
      uint64_t v13 = [v4 aggregatedActivatedCellularPlansCount];
      uint64_t v14 = [(MKDiscoverabilitySignals *)self signals];
      uint64_t v15 = [NSNumber numberWithUnsignedInteger:v13];
      [v14 setValue:v15 forKey:@"cellular_plans"];

      uint64_t v16 = +[MKLog log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = 134217984;
        uint64_t v20 = v13;
        _os_log_impl(&dword_22BFAC000, v16, OS_LOG_TYPE_INFO, "did set a signal. aggregated_activated_sims_count=%ld", (uint8_t *)&v19, 0xCu);
      }

      break;
    default:
      break;
  }
}

- (void)donateSignals
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22BFAC000, a2, OS_LOG_TYPE_ERROR, "%@ could not serialise signals", (uint8_t *)&v2, 0xCu);
}

- (NSMutableDictionary)signals
{
  return self->_signals;
}

- (void)setSignals:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
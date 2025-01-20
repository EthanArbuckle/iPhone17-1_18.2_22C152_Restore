@interface UNCNotificationSettingsPersistentStore
- (BOOL)hasSectionInfoLegacyFile;
- (NSString)dataDirectoryPath;
- (UNCNotificationSettingsPersistentStore)init;
- (UNCNotificationSettingsPersistentStore)initWithDataDirectoryPath:(id)a3;
- (id)_clearedSectionsPath;
- (id)_sectionInfoLegacyPath;
- (id)_sectionInfoPath;
- (id)_sectionOrderPath;
- (id)readClearedSections;
- (id)readSectionInfo;
- (id)readSectionInfoLegacy;
- (id)readSectionInfoWithVersionNumberForMigration;
- (id)readSectionOrder;
- (void)deleteSectionInfoFile;
- (void)deleteSectionInfoLegacyFile;
- (void)writeClearedSections:(id)a3;
- (void)writeSectionInfo:(id)a3;
- (void)writeSectionOrder:(id)a3;
@end

@implementation UNCNotificationSettingsPersistentStore

- (UNCNotificationSettingsPersistentStore)initWithDataDirectoryPath:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UNCNotificationSettingsPersistentStore;
  v6 = [(UNCNotificationSettingsPersistentStore *)&v9 init];
  if (v6)
  {
    v7 = *MEMORY[0x263F1E050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_2608DB000, v7, OS_LOG_TYPE_DEFAULT, "Created UNPersistedStore with path %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&v6->_dataDirectoryPath, a3);
  }

  return v6;
}

- (UNCNotificationSettingsPersistentStore)init
{
  v3 = [@"~/Library/BulletinBoard/" stringByExpandingTildeInPath];
  v4 = [(UNCNotificationSettingsPersistentStore *)self initWithDataDirectoryPath:v3];

  return v4;
}

- (id)readClearedSections
{
  v3 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Reading cleared sections from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(UNCNotificationSettingsPersistentStore *)self _clearedSectionsPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (id)readSectionInfo
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Reading UNCSectionInfo from persistence", buf, 2u);
  }
  id v25 = [MEMORY[0x263EFF9A0] dictionary];
  context = (void *)MEMORY[0x261221EF0]();
  v4 = NSDictionary;
  id v5 = [(UNCNotificationSettingsPersistentStore *)self _sectionInfoPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  v23 = v6;
  v7 = [v6 objectForKey:@"sectionInfo"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v26 = *MEMORY[0x263F081D0];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x261221EF0]();
        v14 = [v7 objectForKey:v12];
        id v15 = objc_alloc(MEMORY[0x263F08928]);
        id v29 = 0;
        v16 = (void *)[v15 initForReadingFromData:v14 error:&v29];
        id v17 = v29;
        if (v17) {
          goto LABEL_12;
        }
        [v16 setClass:objc_opt_class() forClassName:@"BBMuteAssertion"];
        [v16 setClass:objc_opt_class() forClassName:@"BBSectionIcon"];
        [v16 setClass:objc_opt_class() forClassName:@"BBSectionIconVariant"];
        [v16 setClass:objc_opt_class() forClassName:@"BBSectionInfo"];
        [v16 setClass:objc_opt_class() forClassName:@"BBSectionInfoSettings"];
        [v16 setClass:objc_opt_class() forClassName:@"BBSectionMuteAssertion"];
        [v16 setClass:objc_opt_class() forClassName:@"BBThreadsMuteAssertion"];
        uint64_t v18 = objc_opt_class();
        id v28 = 0;
        v19 = [v16 decodeTopLevelObjectOfClass:v18 forKey:v26 error:&v28];
        id v17 = v28;
        if (v19) {
          [v25 setObject:v19 forKey:v12];
        }

        if (v17)
        {
LABEL_12:
          v20 = *MEMORY[0x263F1E050];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            id v35 = v12;
            __int16 v36 = 2114;
            id v37 = v17;
            _os_log_error_impl(&dword_2608DB000, v20, OS_LOG_TYPE_ERROR, "Decoding UNCSectionInfo for sectionID %{public}@ failed: %{public}@", buf, 0x16u);
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v9);
  }

  v21 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v25;
    _os_log_impl(&dword_2608DB000, v21, OS_LOG_TYPE_DEFAULT, "Returning sectionInfo %@", buf, 0xCu);
  }

  return v25;
}

- (id)readSectionInfoLegacy
{
  v3 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Reading legacy SectionInfo from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(UNCNotificationSettingsPersistentStore *)self _sectionInfoLegacyPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (id)readSectionOrder
{
  v3 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_2608DB000, v3, OS_LOG_TYPE_DEFAULT, "Reading section order from persistence", v8, 2u);
  }
  v4 = NSDictionary;
  id v5 = [(UNCNotificationSettingsPersistentStore *)self _sectionOrderPath];
  v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (void)writeClearedSections:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E050];
  v6 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "Writing cleared sections to persistence", v11, 2u);
  }
  v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:200 options:0 error:0];
  uint64_t v8 = [(UNCNotificationSettingsPersistentStore *)self _clearedSectionsPath];
  char v9 = [v7 writeToFile:v8 options:268435457 error:0];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSettingsPersistentStore writeClearedSections:](v10);
    }
  }
}

- (void)writeSectionOrder:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E050];
  v6 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_2608DB000, v6, OS_LOG_TYPE_DEFAULT, "Writing section order to persistence", v11, 2u);
  }
  v7 = [MEMORY[0x263F08AC0] dataWithPropertyList:v4 format:100 options:0 error:0];
  uint64_t v8 = [(UNCNotificationSettingsPersistentStore *)self _sectionOrderPath];
  char v9 = [v7 writeToFile:v8 options:268435457 error:0];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSettingsPersistentStore writeSectionOrder:](v10);
    }
  }
}

- (void)writeSectionInfo:(id)a3
{
  uint64_t v26 = self;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = *MEMORY[0x263F1E050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2608DB000, v4, OS_LOG_TYPE_DEFAULT, "Writing section info to persistence", buf, 2u);
  }
  context = (void *)MEMORY[0x261221EF0]();
  v27 = [MEMORY[0x263EFF9A0] dictionary];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKey:", v11, v26);
        if (([v12 suppressFromSettings] & 1) == 0)
        {
          v13 = (void *)MEMORY[0x261221EF0]();
          v14 = [MEMORY[0x263F08910] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
          [v5 setObject:v14 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v8);
  }

  [v27 setObject:v5 forKey:@"sectionInfo"];
  id v15 = [NSNumber numberWithUnsignedInteger:2];
  [v27 setObject:v15 forKey:@"sectionInfoVersionNumber"];

  v16 = [MEMORY[0x263F08AC0] dataWithPropertyList:v27 format:100 options:0 error:0];
  id v17 = [(UNCNotificationSettingsPersistentStore *)v26 _sectionInfoPath];
  id v29 = 0;
  [v16 writeToFile:v17 options:268435457 error:&v29];
  id v18 = v29;

  if (v18)
  {
    v19 = *MEMORY[0x263F1E050];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E050], OS_LOG_TYPE_ERROR)) {
      -[UNCNotificationSettingsPersistentStore writeSectionInfo:]((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
}

- (void)deleteSectionInfoFile
{
}

- (void)deleteSectionInfoLegacyFile
{
}

- (BOOL)hasSectionInfoLegacyFile
{
  id v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = [(UNCNotificationSettingsPersistentStore *)self _sectionInfoLegacyPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)readSectionInfoWithVersionNumberForMigration
{
  v2 = NSDictionary;
  id v3 = [(UNCNotificationSettingsPersistentStore *)self _sectionInfoPath];
  id v4 = [v2 dictionaryWithContentsOfFile:v3];

  return v4;
}

- (id)_clearedSectionsPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"ClearedSections.plist"];
}

- (id)_sectionOrderPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"SectionOrder.plist"];
}

- (id)_sectionInfoPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"VersionedSectionInfo.plist"];
}

- (id)_sectionInfoLegacyPath
{
  return [(NSString *)self->_dataDirectoryPath stringByAppendingPathComponent:@"SectionInfo.plist"];
}

- (NSString)dataDirectoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (void)writeClearedSections:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Error writing cleared sections data.", v1, 2u);
}

- (void)writeSectionOrder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "Error writing section order data.", v1, 2u);
}

- (void)writeSectionInfo:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
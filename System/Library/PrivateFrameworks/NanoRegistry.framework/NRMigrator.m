@interface NRMigrator
+ (id)migrationDataPreRestoreForConsentedDevices:(id)a3;
+ (id)sharedMigrator;
+ (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3;
- (BOOL)migrationIsAvailable;
- (NRDevice)migratingDevice;
- (NSArray)devicesExpectedToBeMigratableAfterRestore;
- (NSArray)migratableDevices;
- (NSArray)migratableDevicesRequiringConsent;
- (id)UDIDUUID;
- (id)devicesFromMigrationConsentRequestData:(id)a3;
- (id)lastMigrationRequestPhoneName;
- (id)migrationConsentRequestData;
- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5;
- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4;
- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4;
- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5;
- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5;
@end

@implementation NRMigrator

+ (id)sharedMigrator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__NRMigrator_sharedMigrator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1E95CEA58 != -1) {
    dispatch_once(&qword_1E95CEA58, block);
  }
  v2 = (void *)qword_1E95CEA50;

  return v2;
}

uint64_t __28__NRMigrator_sharedMigrator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = qword_1E95CEA50;
  qword_1E95CEA50 = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (id)UDIDUUID
{
  if (a1)
  {
    id v1 = (void *)MGCopyAnswer();
    uint64_t v2 = [v1 dataUsingEncoding:4];
    v3 = [v2 NRSHA256];

    v4 = objc_msgSend(v3, "subdataWithRange:", 0, 16);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)devicesFromMigrationConsentRequestData:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A356E000, v6, OS_LOG_TYPE_DEFAULT, "devicesFromMigrationConsentRequestData called", buf, 2u);
    }
  }
  *(void *)buf = 0;
  v52 = buf;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__2;
  v55 = __Block_byref_object_dispose__2;
  id v56 = 0;
  v7 = v41;
  if (v41)
  {
    v40 = [[NRPBCompressedData alloc] initWithData:v41];
    if ([(NRPBCompressedData *)v40 compressed])
    {
      v8 = (uint8_t *)malloc_type_malloc(0x2000uLL, 0x100004077774924uLL);
      if (!v8)
      {
LABEL_32:

        v7 = (void *)*((void *)v52 + 5);
        goto LABEL_33;
      }
      id v9 = [(NRPBCompressedData *)v40 possiblyCompressedData];
      v10 = (const uint8_t *)[v9 bytes];
      v11 = [(NRPBCompressedData *)v40 possiblyCompressedData];
      size_t v12 = compression_decode_buffer(v8, 0x2000uLL, v10, [v11 length], 0, COMPRESSION_ZLIB);

      if (v12)
      {
        v39 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:v12];
      }
      else
      {
        v39 = 0;
      }
      free(v8);
    }
    else
    {
      v39 = [(NRPBCompressedData *)v40 possiblyCompressedData];
    }
    if (v39)
    {
      v38 = [[NRPBMigrationDevices alloc] initWithData:v39];
      if (![(NRPBMigrationDevices *)v38 hasPhoneUDIDHash]
        || ([(NRPBMigrationDevices *)v38 phoneUDIDHash],
            v13 = objc_claimAutoreleasedReturnValue(),
            -[NRMigrator UDIDUUID]((uint64_t)self),
            v14 = objc_claimAutoreleasedReturnValue(),
            char v15 = [v13 isEqual:v14],
            v14,
            v13,
            (v15 & 1) == 0))
      {
        v42 = objc_opt_new();
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        v16 = [(NRPBMigrationDevices *)v38 devices];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v58 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v48;
          id obj = v16;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v48 != v18) {
                objc_enumerationMutation(obj);
              }
              v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v21 = [v20 iD];
              if (v21)
              {
                v22 = [v20 name];
                if (v22)
                {
                  v23 = [v20 advertisedName];
                  BOOL v24 = v23 == 0;

                  if (!v24)
                  {
                    v57[0] = 0;
                    v57[1] = 0;
                    v25 = [v20 iD];
                    [v25 getBytes:v57 length:16];

                    v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v57];
                    v27 = [v20 name];
                    v28 = [v20 advertisedName];
                    v29 = objc_opt_new();
                    v30 = [[NRMutableDeviceProperty alloc] initWithValue:v26];
                    [v29 setObject:v30 forKeyedSubscript:@"pairingID"];
                    v31 = [[NRMutableDeviceProperty alloc] initWithValue:v27];
                    [v29 setObject:v31 forKeyedSubscript:@"name"];
                    v32 = [[NRMutableDeviceProperty alloc] initWithValue:v28];
                    [v29 setObject:v32 forKeyedSubscript:@"advertisedName"];
                    [v42 setObject:v29 forKeyedSubscript:v26];
                  }
                }
                else
                {
                }
              }
            }
            v16 = obj;
            uint64_t v17 = [obj countByEnumeratingWithState:&v47 objects:v58 count:16];
          }
          while (v17);
        }

        v33 = [[NRPairedDeviceRegistry alloc] initWithBoost:0 disconnected:1];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke;
        v45[3] = &unk_1E5B016F8;
        id v34 = v42;
        id v46 = v34;
        [(NRRegistry *)v33 deasyncGrabRegistryWithWriteBlock:v45];
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke_2;
        v44[3] = &unk_1E5B01488;
        v44[4] = buf;
        [(NRPairedDeviceRegistry *)v33 threadIsBlockedWaitingOn_nanoregistryd_syncGrabLegacyRegistryWithBlock:v44];
        if (![*((id *)v52 + 5) count])
        {
          v35 = (void *)*((void *)v52 + 5);
          *((void *)v52 + 5) = 0;
        }
      }
    }
    goto LABEL_32;
  }
LABEL_33:
  id v36 = v7;
  _Block_object_dispose(buf, 8);

  return v36;
}

id __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = +[NRMutableDeviceCollection diffFrom:v2 to:*(void *)(a1 + 32)];

  return v3;
}

uint64_t __53__NRMigrator_devicesFromMigrationConsentRequestData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = [a4 allValues];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void *)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return MEMORY[0x1F41817F8](v5, v7);
}

- (id)migrationConsentRequestData
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = nr_framework_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    v4 = nr_framework_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A356E000, v4, OS_LOG_TYPE_DEFAULT, "migrationConsentRequestData called", buf, 2u);
    }
  }
  id v5 = [(NRMigrator *)self devicesExpectedToBeMigratableAfterRestore];
  uint64_t v6 = v5;
  if (self
    && (long long v84 = 0u,
        long long v85 = 0u,
        long long v82 = 0u,
        long long v83 = 0u,
        (uint64_t v7 = [v5 countByEnumeratingWithState:&v82 objects:buf count:16]) != 0))
  {
    uint64_t v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v83;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v83 != v10) {
          objc_enumerationMutation(v6);
        }
        size_t v12 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v13 = nr_framework_log();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

        if (v14)
        {
          char v15 = nr_framework_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_1A356E000, v15, OS_LOG_TYPE_DEFAULT, "NRDevice found", v86, 2u);
          }
        }
        if ([v12 canMigrate])
        {
          v16 = nr_framework_log();
          BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

          if (v17)
          {
            uint64_t v18 = nr_framework_log();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v86 = 0;
              _os_log_impl(&dword_1A356E000, v18, OS_LOG_TYPE_DEFAULT, "NRDevice supports migration", v86, 2u);
            }
          }
          v19 = objc_opt_new();
          *(void *)v86 = 0;
          uint64_t v87 = 0;
          v20 = [v12 valueForProperty:@"pairingID"];
          [v20 getUUIDBytes:v86];

          v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v86 length:16];
          [v19 setID:v21];

          v22 = [v12 valueForProperty:@"name"];
          [v19 setName:v22];

          v23 = [v12 valueForProperty:@"advertisedName"];
          [v19 setAdvertisedName:v23];

          if (!v9)
          {
            BOOL v24 = nr_framework_log();
            BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

            if (v25)
            {
              v26 = nr_framework_log();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v81 = 0;
                _os_log_impl(&dword_1A356E000, v26, OS_LOG_TYPE_DEFAULT, "protobuf created", v81, 2u);
              }
            }
            id v9 = objc_opt_new();
          }
          [v9 addDevices:v19];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v82 objects:buf count:16];
    }
    while (v8);
    if (v9)
    {
      v27 = -[NRMigrator UDIDUUID]((uint64_t)self);
      [v9 setPhoneUDIDHash:v27];
    }
  }
  else
  {
    id v9 = 0;
  }

  if (!v9)
  {
    v32 = 0;
    goto LABEL_73;
  }
  int v29 = 0;
  v30 = 0;
  *(void *)&long long v28 = 67109120;
  long long v76 = v28;
  v77 = v9;
  do
  {
    int v80 = v29;
    id v31 = v9;
    if (self)
    {
      v33 = nr_framework_log();
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

      if (v34)
      {
        v35 = nr_framework_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v31 data];
          int v37 = [v36 length];
          *(_DWORD *)buf = v76;
          int v89 = v37;
          _os_log_impl(&dword_1A356E000, v35, OS_LOG_TYPE_DEFAULT, "%d bytes of protobuf created", buf, 8u);
        }
      }
      v38 = objc_opt_new();
      id v39 = [v31 data];
      v40 = (const uint8_t *)[v39 bytes];

      id v41 = [v31 data];
      size_t v42 = [v41 length];

      v43 = (uint8_t *)malloc_type_malloc(v42, 0x100004077774924uLL);
      v44 = v43;
      if (v43 && (size_t v45 = compression_encode_buffer(v43, v42, v40, v42, 0, COMPRESSION_ZLIB)) != 0)
      {
        size_t v46 = v45;
        long long v47 = nr_framework_log();
        BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

        if (v48)
        {
          long long v49 = nr_framework_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v76;
            int v89 = v46;
            _os_log_impl(&dword_1A356E000, v49, OS_LOG_TYPE_DEFAULT, "data compressed! It is now only %d bytes", buf, 8u);
          }
        }
        objc_msgSend(v38, "setCompressed:", 1, v76);
        long long v50 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v44 length:v46];
        [v38 setPossiblyCompressedData:v50];
      }
      else
      {
        v51 = nr_framework_log();
        BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);

        if (v52)
        {
          uint64_t v53 = nr_framework_log();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A356E000, v53, OS_LOG_TYPE_DEFAULT, "data did not compress. Bummer.", buf, 2u);
          }
        }
        objc_msgSend(v38, "setCompressed:", 0, v76);
        v54 = [v31 data];
        [v38 setPossiblyCompressedData:v54];

        if (!v44) {
          goto LABEL_53;
        }
      }
      free(v44);
LABEL_53:
      v32 = [v38 data];

      goto LABEL_54;
    }
    v32 = 0;
LABEL_54:

    if ((unint64_t)[v32 length] < 0x201) {
      break;
    }
    v78 = v32;
    if (!self) {
      goto LABEL_70;
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    v55 = [v31 devices];
    uint64_t v56 = [v55 countByEnumeratingWithState:&v82 objects:buf count:16];
    if (!v56) {
      goto LABEL_69;
    }
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v83;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v83 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = *(void **)(*((void *)&v82 + 1) + 8 * v59);
        objc_msgSend(v60, "name", v76);
        id v61 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v62 = [v61 length];
        v63 = v61;
        if (v62 < 0x15) {
          goto LABEL_64;
        }
        unint64_t v64 = v62 - v62 / 3;
        v65 = malloc_type_malloc(2 * v64, 0xEEED5C46uLL);
        if (v65)
        {
          v66 = v65;
          objc_msgSend(v61, "getCharacters:range:", v65, 0, v64);
          v63 = [NSString stringWithCharacters:v66 length:v64];

          free(v66);
LABEL_64:
          id v67 = v63;
          v68 = v67;
          goto LABEL_65;
        }
        v68 = 0;
        id v67 = v61;
LABEL_65:

        [v60 setName:v68];
        ++v59;
      }
      while (v57 != v59);
      uint64_t v69 = [v55 countByEnumeratingWithState:&v82 objects:buf count:16];
      uint64_t v57 = v69;
    }
    while (v69);
LABEL_69:

LABEL_70:
    int v29 = v80 + 1;
    id v9 = v77;
    v32 = v78;
    v30 = v78;
  }
  while (v80 != 9);
LABEL_73:
  if ((unint64_t)objc_msgSend(v32, "length", v76) > 0x200)
  {
    v71 = nr_framework_log();
    BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_ERROR);

    if (v72)
    {
      v73 = nr_framework_log();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        uint64_t v75 = [v32 length];
        *(_DWORD *)buf = 67109376;
        int v89 = 512;
        __int16 v90 = 2048;
        uint64_t v91 = v75;
        _os_log_error_impl(&dword_1A356E000, v73, OS_LOG_TYPE_ERROR, "migrationConsentRequestData called- could not squish protobuf data to %d bytes (it's %ld bytes). Not returning any data!", buf, 0x12u);
      }
    }
    id v70 = 0;
  }
  else
  {
    id v70 = v32;
  }

  return v70;
}

- (BOOL)migrationIsAvailable
{
  uint64_t v2 = [(NRMigrator *)self migratableDevices];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSArray)devicesExpectedToBeMigratableAfterRestore
{
  uint64_t v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getDevicesMatching:&__block_literal_global_627];

  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

uint64_t __55__NRMigrator_devicesExpectedToBeMigratableAfterRestore__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 valueForProperty:@"isPaired"];
  if ([v3 BOOLValue]) {
    uint64_t v4 = [v2 canMigrate];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSArray)migratableDevicesRequiringConsent
{
  BOOL v3 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v4 = [v3 getAllDevicesWithArchivedDevicesMatching:&__block_literal_global_629];

  id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = [(NRMigrator *)self migratableDevices];
  uint64_t v8 = [v6 setWithArray:v7];

  [v5 minusSet:v8];
  id v9 = [v5 allObjects];
  if ([v9 count]) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  return (NSArray *)v10;
}

uint64_t __47__NRMigrator_migratableDevicesRequiringConsent__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 valueForProperty:@"isArchived"];
  if ([v3 BOOLValue])
  {
    uint64_t v4 = [v2 valueForProperty:@"isAltAccount"];
    uint64_t v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (NSArray)migratableDevices
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = [v2 getAllDevicesWithArchivedDevicesMatching:&__block_literal_global_633];

  if ([v3 count]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSArray *)v4;
}

BOOL __31__NRMigrator_migratableDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 valueForProperty:@"isAltAccount"];
  if ([v3 BOOLValue])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [v2 valueForProperty:@"isArchived"];
    if ([v5 BOOLValue])
    {
      uint64_t v6 = [v2 valueForProperty:@"migrationConsent"];
      if ([v6 BOOLValue])
      {
        uint64_t v7 = [v2 valueForProperty:@"migrationConsentDate"];
        uint64_t v8 = v7;
        if (v7)
        {
          [v7 timeIntervalSinceNow];
          BOOL v4 = v9 >= -86400.0 && v9 <= 0.0;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
      else
      {
        BOOL v4 = 0;
      }
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  return v4;
}

+ (id)migrationDataPreRestoreForConsentedDevices:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = [v3 count];
      _os_log_impl(&dword_1A356E000, v6, OS_LOG_TYPE_DEFAULT, "Generating pre-restore migration data blob for (%lu) devices", buf, 0xCu);
    }
  }
  uint64_t v7 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) pairingID];
        BOOL v14 = [v13 UUIDString];

        [v7 addObject:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }

  id v26 = 0;
  char v15 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:200 options:0 error:&v26];
  id v16 = v26;
  BOOL v17 = nr_framework_log();
  uint64_t v18 = v17;
  if (v16)
  {
    BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      v20 = nr_framework_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = (uint64_t)v16;
        __int16 v33 = 2112;
        BOOL v34 = v7;
        _os_log_error_impl(&dword_1A356E000, v20, OS_LOG_TYPE_ERROR, "Failed to serialize with error (%@) device IDs: (%@)", buf, 0x16u);
      }
    }
    id v21 = 0;
  }
  else
  {
    BOOL v22 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      v23 = nr_framework_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v15 length];
        *(_DWORD *)buf = 134217984;
        uint64_t v32 = v24;
        _os_log_impl(&dword_1A356E000, v23, OS_LOG_TYPE_DEFAULT, "Generated pre-restore migration data blob of length (%lu bytes)", buf, 0xCu);
      }
    }
    id v21 = v15;
  }

  return v21;
}

+ (void)ingestPostRestoreMigrationDataForConsentedDevices:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = nr_framework_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    uint64_t v6 = nr_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v50 = [v3 length];
      _os_log_impl(&dword_1A356E000, v6, OS_LOG_TYPE_DEFAULT, "Ingesting post-restore migration data blob of length (%lu bytes)", buf, 0xCu);
    }
  }
  if ([v3 length])
  {
    id v47 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v47];
    id v8 = v47;
    if (v8)
    {
      uint64_t v9 = nr_framework_log();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

      if (!v10) {
        goto LABEL_10;
      }
      uint64_t v11 = nr_framework_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v50 = (uint64_t)v8;
      __int16 v51 = 2112;
      id v52 = v3;
      __int16 v33 = "Failed to unserialize with error (%@) pre-restore data : (%@)";
      BOOL v34 = v11;
      uint32_t v35 = 22;
      goto LABEL_45;
    }
    if (!v7)
    {
      id v31 = nr_framework_log();
      BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

      if (!v32) {
        goto LABEL_10;
      }
      uint64_t v11 = nr_framework_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      *(_WORD *)buf = 0;
      __int16 v33 = "Unserialization returned nil object without error";
      BOOL v34 = v11;
      uint32_t v35 = 2;
LABEL_45:
      _os_log_error_impl(&dword_1A356E000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
      goto LABEL_9;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = v7;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (!v13) {
        goto LABEL_35;
      }
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v44;
      while (1)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v44 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * v16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v18 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
            if (v18)
            {
              BOOL v19 = +[NRMigrator sharedMigrator];
              v41[0] = MEMORY[0x1E4F143A8];
              v41[1] = 3221225472;
              v41[2] = __64__NRMigrator_ingestPostRestoreMigrationDataForConsentedDevices___block_invoke;
              v41[3] = &unk_1E5B01720;
              size_t v42 = v18;
              [v19 setMigrationConsented:1 forDeviceID:v42 withBlock:v41];

              v20 = v42;
            }
            else
            {
              id v26 = nr_framework_log();
              BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

              if (!v27)
              {
                uint64_t v18 = 0;
                goto LABEL_28;
              }
              v20 = nr_framework_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v50 = v17;
                uint64_t v24 = v20;
                BOOL v25 = "Failed to convert unserialized deviceID (%@) into a UUID";
LABEL_33:
                _os_log_error_impl(&dword_1A356E000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0xCu);
              }
            }

            goto LABEL_28;
          }
          id v21 = nr_framework_log();
          BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

          if (!v22) {
            goto LABEL_29;
          }
          uint64_t v18 = nr_framework_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v23 = objc_opt_class();
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = (uint64_t)v23;
            v20 = v23;
            uint64_t v24 = v18;
            BOOL v25 = "Unserialization deviceID not a string: (%@)";
            goto LABEL_33;
          }
LABEL_28:

LABEL_29:
          ++v16;
        }
        while (v14 != v16);
        uint64_t v28 = [v12 countByEnumeratingWithState:&v43 objects:v48 count:16];
        uint64_t v14 = v28;
        if (!v28)
        {
LABEL_35:

          long long v29 = nr_framework_log();
          BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

          uint64_t v7 = v40;
          if (v30)
          {
            uint64_t v11 = nr_framework_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A356E000, v11, OS_LOG_TYPE_DEFAULT, "Ingesting post-restore migration data complete", buf, 2u);
            }
            goto LABEL_9;
          }
          goto LABEL_10;
        }
      }
    }
    uint64_t v36 = nr_framework_log();
    BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

    if (v37)
    {
      uint64_t v11 = nr_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v38 = objc_opt_class();
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = (uint64_t)v38;
        id v39 = v38;
        _os_log_error_impl(&dword_1A356E000, v11, OS_LOG_TYPE_ERROR, "Unserialized root object not an array (%@)", buf, 0xCu);
      }
LABEL_9:
    }
LABEL_10:
  }
}

void __64__NRMigrator_ingestPostRestoreMigrationDataForConsentedDevices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = nr_framework_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

    if (v5)
    {
      uint64_t v6 = nr_framework_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        int v8 = 138412546;
        id v9 = v3;
        __int16 v10 = 2112;
        uint64_t v11 = v7;
        _os_log_error_impl(&dword_1A356E000, v6, OS_LOG_TYPE_ERROR, "Failed with error: (%@) to apply consent for deviceID: %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)setMigrationConsented:(BOOL)a3 forDevice:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v10 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = [v8 pairingID];

  [v10 setMigrationConsented:v6 forDeviceID:v9 withBlock:v7];
}

- (void)setMigrationConsented:(BOOL)a3 forDeviceID:(id)a4 withBlock:(id)a5
{
  BOOL v6 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = +[NRPairedDeviceRegistry sharedInstance];
  [v9 setMigrationConsented:v6 forDeviceID:v8 withBlock:v7];
}

- (void)beginMigrationWithDevice:(id)a3 passcode:(id)a4 withBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[NRPairedDeviceRegistry sharedInstance];
  [v10 beginMigrationWithDevice:v9 passcode:v8 withBlock:v7];
}

- (void)beginMigrationWithDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NRPairedDeviceRegistry sharedInstance];
  [v7 beginMigrationWithDevice:v6 withCompletion:v5];
}

- (id)lastMigrationRequestPhoneName
{
  id v2 = +[NRPairedDeviceRegistry sharedInstance];
  id v3 = [v2 lastMigrationRequestPhoneName];

  return v3;
}

- (void)isPhoneReadyToMigrateDevice:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NRPairedDeviceRegistry sharedInstance];
  [v7 isPhoneReadyToMigrateDevice:v6 withCompletion:v5];
}

- (NRDevice)migratingDevice
{
  return self->_migratingDevice;
}

- (void).cxx_destruct
{
}

@end
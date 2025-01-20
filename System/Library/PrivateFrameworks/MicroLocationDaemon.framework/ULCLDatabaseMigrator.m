@interface ULCLDatabaseMigrator
- (BOOL)_migrateData:(ULMiloSqliteDatabase *)a3;
- (BOOL)_migrateTableUsingPaging:(ULMiloSqliteDatabase *)a3 tableName:(const char *)a4 migrationLimit:(unsigned int)a5 pageSize:(unsigned int)a6 copyPageBlock:(id)a7;
- (BOOL)migrateAllData;
- (BOOL)migrateCLDatabaseFromPath:(id)a3;
- (ULCLDatabaseMigrator)initWithLocalDb:(ULDatabase *)a3;
- (ULDatabase)localDb;
- (unique_ptr<CLSqliteDatabase,)_connectToLocationdDatabase:(id)a3;
- (void)_logStatsForExportedDatabase:(ULMiloSqliteDatabase *)a3;
- (void)_logStatsForLocalDatabase;
- (void)setLocalDb:(ULDatabase *)a3;
- (void)setMigrateAllData:(BOOL)a3;
@end

@implementation ULCLDatabaseMigrator

- (ULCLDatabaseMigrator)initWithLocalDb:(ULDatabase *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ULCLDatabaseMigrator;
  v4 = [(ULCLDatabaseMigrator *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ULCLDatabaseMigrator *)v4 setLocalDb:a3];
  }
  return v5;
}

- (BOOL)migrateCLDatabaseFromPath:(id)a3
{
  id v4 = a3;
  [(ULCLDatabaseMigrator *)self _connectToLocationdDatabase:v4];
  if (CLSqliteDatabase::isDatabaseValid(v6)) {
    operator new();
  }
  if (v6) {
    (*(void (**)())(*(void *)v6 + 8))();
  }

  return 0;
}

- (unique_ptr<CLSqliteDatabase,)_connectToLocationdDatabase:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a3 path];
  std::string::basic_string[abi:ne180100]<0>(&v5, (char *)[v3 UTF8String]);

  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v5.__r_.__value_.__l.__data_, v5.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v5;
  }
  operator new();
}

- (BOOL)_migrateTableUsingPaging:(ULMiloSqliteDatabase *)a3 tableName:(const char *)a4 migrationLimit:(unsigned int)a5 pageSize:(unsigned int)a6 copyPageBlock:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a7;
  int v13 = ![(ULCLDatabaseMigrator *)self migrateAllData];
  if (a5) {
    int v13 = 0;
  }
  if (!a6 || v13)
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_36);
    }
    uint64_t v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = 68289794;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 1026;
      *(_DWORD *)v24 = a5;
      *(_WORD *)&v24[4] = 1026;
      *(_DWORD *)&v24[6] = a6;
      __int16 v25 = 2082;
      v26 = a4;
      v15 = "{\"msg%{public}.0s\":\"#dataMigrator, migrationLimit or pageSize is 0. skipping migration for table\", \"mig"
            "rationLimit\":%{public}u, \"pageSize\":%{public}u, \"tableName\":%{public, location:escape_only}s}";
      v16 = v14;
      uint32_t v17 = 40;
LABEL_15:
      _os_log_impl(&dword_25631F000, v16, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v20, v17);
    }
  }
  else
  {
    if (ULMiloSqliteDatabase::tableExists(a3, a4)) {
      ULMiloSqliteDatabase::numEntries(a3, a4);
    }
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_36);
    }
    uint64_t v18 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = 68289282;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2082;
      *(void *)v24 = a4;
      v15 = "{\"msg%{public}.0s\":\"#dataMigrator, table is missing in imported db\", \"tableName\":%{public, location:escape_only}s}";
      v16 = v18;
      uint32_t v17 = 28;
      goto LABEL_15;
    }
  }

  return 1;
}

- (BOOL)_migrateData:(ULMiloSqliteDatabase *)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  if (![(ULCLDatabaseMigrator *)self migrateAllData])
  {
    id v5 = (id)[(ULCLDatabaseMigrator *)self localDb][112];
    CFAbsoluteTime v66 = cl::chrono::CFAbsoluteTimeClock::now();
    CLMicroLocationMigrationTable::Entry::Entry((uint64_t)&v70, 1, &v66);
    uint64_t v6 = operator new(0x10uLL);
    v68 = v6 + 4;
    v69 = (char *)(v6 + 4);
    *(void *)uint64_t v6 = v70;
    v6[2] = v71;
    v67 = v6;
    [v5 insertEntries:&v67];
    if (v67)
    {
      v68 = v67;
      operator delete(v67);
    }
  }
  [(ULCLDatabaseMigrator *)self _logStatsForExportedDatabase:a3];
  objc_super v7 = (ULRecordingEventTable *)ULRecordingEventTable::migrationLimit((ULRecordingEventTable *)[(ULCLDatabaseMigrator *)self _logStatsForLocalDatabase]);
  uint64_t v8 = ULRecordingEventTable::pageSize(v7);
  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke;
  v65[3] = &unk_2653F9898;
  v65[4] = self;
  v65[5] = a3;
  v9 = (ULMeasurementTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationRecordingEvents" migrationLimit:v7 pageSize:v8 copyPageBlock:v65];
  int v10 = (int)v9;
  v11 = (ULMeasurementTable *)ULMeasurementTable::migrationLimit(v9);
  uint64_t v12 = ULMeasurementTable::pageSize(v11);
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_2;
  v64[3] = &unk_2653F9898;
  v64[4] = self;
  v64[5] = a3;
  int v13 = (ULLabelTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationMeasurements" migrationLimit:v11 pageSize:v12 copyPageBlock:v64];
  int v14 = (int)v13;
  v15 = (ULLabelTable *)ULLabelTable::migrationLimit(v13);
  uint64_t v16 = ULLabelTable::pageSize(v15);
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_3;
  v63[3] = &unk_2653F9898;
  v63[4] = self;
  v63[5] = a3;
  uint32_t v17 = (ULServiceTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationLabels" migrationLimit:v15 pageSize:v16 copyPageBlock:v63];
  uint64_t v18 = (ULServiceTable *)ULServiceTable::migrationLimit(v17);
  uint64_t v19 = ULServiceTable::pageSize(v18);
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_4;
  v62[3] = &unk_2653F9898;
  v62[4] = self;
  v62[5] = a3;
  uint64_t v20 = (ULLoiTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MiLoServices" migrationLimit:v18 pageSize:v19 copyPageBlock:v62];
  unsigned int v21 = v20;
  v22 = (ULLoiTable *)ULLoiTable::migrationLimit(v20);
  uint64_t v23 = ULLoiTable::pageSize(v22);
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_5;
  v61[3] = &unk_2653F9898;
  v61[4] = self;
  v61[5] = a3;
  v24 = (ULRapportTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MiLoLoiTable" migrationLimit:v22 pageSize:v23 copyPageBlock:v61];
  unsigned int v25 = v24;
  v26 = (ULRapportTable *)ULRapportTable::migrationLimit(v24);
  uint64_t v27 = ULRapportTable::pageSize(v26);
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_6;
  v60[3] = &unk_2653F9898;
  v60[4] = self;
  v60[5] = a3;
  v28 = (ULAssociatedStateTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationRapport" migrationLimit:v26 pageSize:v27 copyPageBlock:v60];
  unsigned int v29 = v28;
  v30 = (ULAssociatedStateTable *)ULAssociatedStateTable::migrationLimit(v28);
  uint64_t v31 = ULAssociatedStateTable::pageSize(v30);
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_7;
  v59[3] = &unk_2653F9898;
  v59[4] = self;
  v59[5] = a3;
  v32 = (ULBlueToothIdentityTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationAssociatedState" migrationLimit:v30 pageSize:v31 copyPageBlock:v59];
  unint64_t v52 = __PAIR64__(v25, v29);
  unint64_t v53 = __PAIR64__(v32, v21);
  int v33 = (int)v17;
  int v34 = v14;
  LODWORD(v17) = v10;
  v35 = (ULBlueToothIdentityTable *)ULBlueToothIdentityTable::migrationLimit(v32);
  uint64_t v36 = ULBlueToothIdentityTable::pageSize(v35);
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_8;
  v58[3] = &unk_2653F9898;
  v58[4] = self;
  v58[5] = a3;
  v37 = (ULConfigurationTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationBluetoothIdentityTable" migrationLimit:v35 pageSize:v36 copyPageBlock:v58];
  int v38 = (int)v37;
  v39 = (ULConfigurationTable *)ULConfigurationTable::migrationLimit(v37);
  uint64_t v40 = ULConfigurationTable::pageSize(v39);
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_9;
  v57[3] = &unk_2653F9898;
  v57[4] = self;
  v57[5] = a3;
  v41 = (ULModelTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationConfiguration" migrationLimit:v39 pageSize:v40 copyPageBlock:v57];
  LODWORD(v39) = v41;
  v42 = (ULModelTable *)ULModelTable::migrationLimit(v41);
  uint64_t v43 = ULModelTable::pageSize(v42);
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_10;
  v56[3] = &unk_2653F9898;
  v56[4] = self;
  v56[5] = a3;
  v44 = (ULCustomLoiTable *)[(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationModels" migrationLimit:v42 pageSize:v43 copyPageBlock:v56];
  LODWORD(v42) = v44;
  v45 = (ULCustomLoiTable *)ULCustomLoiTable::migrationLimit(v44);
  uint64_t v46 = ULCustomLoiTable::pageSize(v45);
  v55[0] = MEMORY[0x263EF8330];
  v55[1] = 3221225472;
  v55[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_11;
  v55[3] = &unk_2653F9898;
  v55[4] = self;
  v55[5] = a3;
  LODWORD(v45) = [(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MiLoCustomLoiTable" migrationLimit:v45 pageSize:v46 copyPageBlock:v55];
  v47 = (ULLoggedEventTable *)[(ULCLDatabaseMigrator *)self migrateAllData];
  int v48 = v17 & v34 & v33 & v53 & HIDWORD(v52) & v52 & HIDWORD(v53) & v38 & v39 & v42 & v45;
  if (v47)
  {
    v49 = (ULLoggedEventTable *)ULLoggedEventTable::migrationLimit(v47);
    uint64_t v50 = ULLoggedEventTable::pageSize(v49);
    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __37__ULCLDatabaseMigrator__migrateData___block_invoke_12;
    v54[3] = &unk_2653F9898;
    v54[4] = self;
    v54[5] = a3;
    v48 &= [(ULCLDatabaseMigrator *)self _migrateTableUsingPaging:a3 tableName:"MicroLocationLoggedEvents" migrationLimit:v49 pageSize:v50 copyPageBlock:v54];
  }
  [(ULCLDatabaseMigrator *)self _logStatsForLocalDatabase];
  return v48;
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_2(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_3(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_4(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_5(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_6(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_7(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_8(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_9(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_10(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_11(uint64_t a1, unsigned int a2, double *a3)
{
}

void __37__ULCLDatabaseMigrator__migrateData___block_invoke_12(uint64_t a1, unsigned int a2, double *a3)
{
}

- (void)_logStatsForExportedDatabase:(ULMiloSqliteDatabase *)a3
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_36);
  }
  id v4 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO)) {
    ULMiloSqliteDatabase::numEntries(a3, "MicroLocationRecordingEvents");
  }
}

- (void)_logStatsForLocalDatabase
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  if (onceToken_MicroLocation_Default != -1) {
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_36);
  }
  id v3 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    log = v3;
    id v32 = (id)[(ULCLDatabaseMigrator *)self localDb][88];
    int v4 = [v32 count];
    id v31 = (id)[(ULCLDatabaseMigrator *)self localDb][64];
    int v5 = [v31 count];
    id v30 = (id)[(ULCLDatabaseMigrator *)self localDb][40];
    int v6 = [v30 count];
    id v29 = (id)[(ULCLDatabaseMigrator *)self localDb][96];
    int v7 = [v29 count];
    id v28 = (id)[(ULCLDatabaseMigrator *)self localDb][56];
    int v8 = [v28 count];
    id v27 = (id)[(ULCLDatabaseMigrator *)self localDb][80];
    int v9 = [v27 count];
    id v26 = (id)[(ULCLDatabaseMigrator *)self localDb][16];
    int v10 = [v26 count];
    id v25 = (id)[(ULCLDatabaseMigrator *)self localDb][24];
    int v20 = [v25 count];
    int v21 = v10;
    int v22 = v9;
    int v23 = v8;
    int v11 = v6;
    id v24 = (id)[(ULCLDatabaseMigrator *)self localDb][32];
    int v12 = [v24 count];
    int v13 = v5;
    int v14 = v4;
    id v15 = (id)[(ULCLDatabaseMigrator *)self localDb][72];
    int v16 = [v15 count];
    id v17 = (id)[(ULCLDatabaseMigrator *)self localDb][104];
    int v18 = [v17 count];
    id v19 = (id)[(ULCLDatabaseMigrator *)self localDb][48];
    *(_DWORD *)buf = 68292099;
    int v35 = 0;
    __int16 v36 = 2082;
    v37 = "";
    __int16 v38 = 1025;
    int v39 = v14;
    __int16 v40 = 1025;
    int v41 = v13;
    __int16 v42 = 1025;
    int v43 = v11;
    __int16 v44 = 1025;
    int v45 = v7;
    __int16 v46 = 1025;
    int v47 = v23;
    __int16 v48 = 1025;
    int v49 = v22;
    __int16 v50 = 1025;
    int v51 = v21;
    __int16 v52 = 1025;
    int v53 = v20;
    __int16 v54 = 1025;
    int v55 = v12;
    __int16 v56 = 1025;
    int v57 = v16;
    __int16 v58 = 1025;
    int v59 = v18;
    __int16 v60 = 1025;
    int v61 = [v19 count];
    id v3 = log;
    _os_log_impl(&dword_25631F000, log, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Local database stats\", \"RecordingEvent\":%{private}u, \"Measurement\":%{private}u, \"Label\":%{private}u, \"Service\":%{private}u, \"LOI\":%{private}u, \"Rapport\":%{private}u, \"AssociatedState\":%{private}u, \"BluetoothIdentity\":%{private}u, \"Configuration\":%{private}u, \"Model\":%{private}u, \"CustomLOI\":%{private}u, \"LoggedEvent\":%{private}u}", buf, 0x5Au);
  }
}

- (ULDatabase)localDb
{
  return self->_localDb;
}

- (void)setLocalDb:(ULDatabase *)a3
{
  self->_localDb = a3;
}

- (BOOL)migrateAllData
{
  return self->_migrateAllData;
}

- (void)setMigrateAllData:(BOOL)a3
{
  self->_migrateAllData = a3;
}

@end
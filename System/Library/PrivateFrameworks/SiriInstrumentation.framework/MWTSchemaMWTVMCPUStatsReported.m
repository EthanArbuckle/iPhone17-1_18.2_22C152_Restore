@interface MWTSchemaMWTVMCPUStatsReported
- (BOOL)hasCompressions;
- (BOOL)hasCpuTicksIdle;
- (BOOL)hasCpuTicksNice;
- (BOOL)hasCpuTicksSystem;
- (BOOL)hasCpuTicksUser;
- (BOOL)hasDecompressions;
- (BOOL)hasFaults;
- (BOOL)hasPageins;
- (BOOL)hasSnapshotStage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MWTSchemaMWTVMCPUStatsReported)initWithDictionary:(id)a3;
- (MWTSchemaMWTVMCPUStatsReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)snapshotStage;
- (unint64_t)compressions;
- (unint64_t)cpuTicksIdle;
- (unint64_t)cpuTicksNice;
- (unint64_t)cpuTicksSystem;
- (unint64_t)cpuTicksUser;
- (unint64_t)decompressions;
- (unint64_t)faults;
- (unint64_t)hash;
- (unint64_t)pageins;
- (void)deleteCompressions;
- (void)deleteCpuTicksIdle;
- (void)deleteCpuTicksNice;
- (void)deleteCpuTicksSystem;
- (void)deleteCpuTicksUser;
- (void)deleteDecompressions;
- (void)deleteFaults;
- (void)deletePageins;
- (void)deleteSnapshotStage;
- (void)setCompressions:(unint64_t)a3;
- (void)setCpuTicksIdle:(unint64_t)a3;
- (void)setCpuTicksNice:(unint64_t)a3;
- (void)setCpuTicksSystem:(unint64_t)a3;
- (void)setCpuTicksUser:(unint64_t)a3;
- (void)setDecompressions:(unint64_t)a3;
- (void)setFaults:(unint64_t)a3;
- (void)setHasCompressions:(BOOL)a3;
- (void)setHasCpuTicksIdle:(BOOL)a3;
- (void)setHasCpuTicksNice:(BOOL)a3;
- (void)setHasCpuTicksSystem:(BOOL)a3;
- (void)setHasCpuTicksUser:(BOOL)a3;
- (void)setHasDecompressions:(BOOL)a3;
- (void)setHasFaults:(BOOL)a3;
- (void)setHasPageins:(BOOL)a3;
- (void)setHasSnapshotStage:(BOOL)a3;
- (void)setPageins:(unint64_t)a3;
- (void)setSnapshotStage:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MWTSchemaMWTVMCPUStatsReported

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unint64_t)faults
{
  return self->_faults;
}

- (unint64_t)pageins
{
  return self->_pageins;
}

- (unint64_t)decompressions
{
  return self->_decompressions;
}

- (unint64_t)compressions
{
  return self->_compressions;
}

- (unint64_t)cpuTicksNice
{
  return self->_cpuTicksNice;
}

- (unint64_t)cpuTicksIdle
{
  return self->_cpuTicksIdle;
}

- (unint64_t)cpuTicksUser
{
  return self->_cpuTicksUser;
}

- (unint64_t)cpuTicksSystem
{
  return self->_cpuTicksSystem;
}

- (int)snapshotStage
{
  return self->_snapshotStage;
}

- (MWTSchemaMWTVMCPUStatsReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MWTSchemaMWTVMCPUStatsReported;
  v5 = [(MWTSchemaMWTVMCPUStatsReported *)&v20 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"snapshotStage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setSnapshotStage:](v5, "setSnapshotStage:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"cpuTicksSystem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksSystem:](v5, "setCpuTicksSystem:", [v7 unsignedLongLongValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"cpuTicksUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksUser:](v5, "setCpuTicksUser:", [v8 unsignedLongLongValue]);
    }
    v9 = objc_msgSend(v4, "objectForKeyedSubscript:", @"cpuTicksIdle", v8);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksIdle:](v5, "setCpuTicksIdle:", [v9 unsignedLongLongValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"cpuTicksNice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setCpuTicksNice:](v5, "setCpuTicksNice:", [v10 unsignedLongLongValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"compressions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setCompressions:](v5, "setCompressions:", [v11 unsignedLongLongValue]);
    }
    v19 = v7;
    v12 = [v4 objectForKeyedSubscript:@"decompressions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setDecompressions:](v5, "setDecompressions:", [v12 unsignedLongLongValue]);
    }
    v13 = v6;
    v14 = [v4 objectForKeyedSubscript:@"pageins"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setPageins:](v5, "setPageins:", [v14 unsignedLongLongValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"faults"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MWTSchemaMWTVMCPUStatsReported setFaults:](v5, "setFaults:", [v15 unsignedLongLongValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (MWTSchemaMWTVMCPUStatsReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MWTSchemaMWTVMCPUStatsReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MWTSchemaMWTVMCPUStatsReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported compressions](self, "compressions"));
    [v3 setObject:v5 forKeyedSubscript:@"compressions"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksIdle](self, "cpuTicksIdle"));
  [v3 setObject:v6 forKeyedSubscript:@"cpuTicksIdle"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksNice](self, "cpuTicksNice"));
  [v3 setObject:v7 forKeyedSubscript:@"cpuTicksNice"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksSystem](self, "cpuTicksSystem"));
  [v3 setObject:v8 forKeyedSubscript:@"cpuTicksSystem"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported cpuTicksUser](self, "cpuTicksUser"));
  [v3 setObject:v9 forKeyedSubscript:@"cpuTicksUser"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported decompressions](self, "decompressions"));
  [v3 setObject:v10 forKeyedSubscript:@"decompressions"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
LABEL_18:
    v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported pageins](self, "pageins"));
    [v3 setObject:v12 forKeyedSubscript:@"pageins"];

    if ((*(_WORD *)&self->_has & 1) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    unsigned int v13 = [(MWTSchemaMWTVMCPUStatsReported *)self snapshotStage] - 1;
    if (v13 > 4) {
      v14 = @"MWTVMCPUSNAPSHOTSTAGE_UNKNOWN";
    }
    else {
      v14 = off_1E5EB27D0[v13];
    }
    [v3 setObject:v14 forKeyedSubscript:@"snapshotStage"];
    goto LABEL_23;
  }
LABEL_17:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[MWTSchemaMWTVMCPUStatsReported faults](self, "faults"));
  [v3 setObject:v11 forKeyedSubscript:@"faults"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_18;
  }
LABEL_9:
  if (has) {
    goto LABEL_19;
  }
LABEL_23:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_snapshotStage;
    if ((has & 2) != 0)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_cpuTicksSystem;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_cpuTicksUser;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    unint64_t v6 = 2654435761u * self->_cpuTicksIdle;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v7 = 2654435761u * self->_cpuTicksNice;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    unint64_t v8 = 2654435761u * self->_compressions;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  unint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    unint64_t v9 = 2654435761u * self->_decompressions;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
LABEL_19:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_17:
  unint64_t v9 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  unint64_t v10 = 2654435761u * self->_pageins;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  unint64_t v11 = 2654435761u * self->_faults;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
  unsigned int v6 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_38;
  }
  if (*(unsigned char *)&has)
  {
    int snapshotStage = self->_snapshotStage;
    if (snapshotStage != [v4 snapshotStage]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_38;
  }
  if (v8)
  {
    unint64_t cpuTicksSystem = self->_cpuTicksSystem;
    if (cpuTicksSystem != [v4 cpuTicksSystem]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_38;
  }
  if (v10)
  {
    unint64_t cpuTicksUser = self->_cpuTicksUser;
    if (cpuTicksUser != [v4 cpuTicksUser]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_38;
  }
  if (v12)
  {
    unint64_t cpuTicksIdle = self->_cpuTicksIdle;
    if (cpuTicksIdle != [v4 cpuTicksIdle]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_38;
  }
  if (v14)
  {
    unint64_t cpuTicksNice = self->_cpuTicksNice;
    if (cpuTicksNice != [v4 cpuTicksNice]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_38;
  }
  if (v16)
  {
    unint64_t compressions = self->_compressions;
    if (compressions != [v4 compressions]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_38;
  }
  if (v18)
  {
    deunint64_t compressions = self->_decompressions;
    if (decompressions != [v4 decompressions]) {
      goto LABEL_38;
    }
    $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
    unsigned int v6 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_38;
  }
  if (v20)
  {
    unint64_t pageins = self->_pageins;
    if (pageins == [v4 pageins])
    {
      $2F0359052CA830D7BE8AAAE42FB827D0 has = self->_has;
      unsigned int v6 = v4[40];
      goto LABEL_34;
    }
LABEL_38:
    BOOL v24 = 0;
    goto LABEL_39;
  }
LABEL_34:
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_38;
  }
  if (v22)
  {
    unint64_t faults = self->_faults;
    if (faults != [v4 faults]) {
      goto LABEL_38;
    }
  }
  BOOL v24 = 1;
LABEL_39:

  return v24;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint64Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return MWTSchemaMWTVMCPUStatsReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteFaults
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasFaults:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFaults
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFaults:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unint64_t faults = a3;
}

- (void)deletePageins
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasPageins:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPageins
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setPageins:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unint64_t pageins = a3;
}

- (void)deleteDecompressions
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasDecompressions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDecompressions
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDecompressions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_deunint64_t compressions = a3;
}

- (void)deleteCompressions
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasCompressions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCompressions
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setCompressions:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unint64_t compressions = a3;
}

- (void)deleteCpuTicksNice
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasCpuTicksNice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasCpuTicksNice
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCpuTicksNice:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unint64_t cpuTicksNice = a3;
}

- (void)deleteCpuTicksIdle
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasCpuTicksIdle:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasCpuTicksIdle
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCpuTicksIdle:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_unint64_t cpuTicksIdle = a3;
}

- (void)deleteCpuTicksUser
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasCpuTicksUser:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCpuTicksUser
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setCpuTicksUser:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_unint64_t cpuTicksUser = a3;
}

- (void)deleteCpuTicksSystem
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasCpuTicksSystem:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCpuTicksSystem
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setCpuTicksSystem:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_unint64_t cpuTicksSystem = a3;
}

- (void)deleteSnapshotStage
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasSnapshotStage:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSnapshotStage
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSnapshotStage:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int snapshotStage = a3;
}

@end
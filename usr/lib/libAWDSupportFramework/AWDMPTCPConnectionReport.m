@interface AWDMPTCPConnectionReport
+ (Class)interfaceReportsType;
+ (Class)subflowSwitchingReportsType;
- (BOOL)establishmentCellularFallback;
- (BOOL)establishmentForcedTcpFallback;
- (BOOL)establishmentSuccess;
- (BOOL)establishmentTcpFallback;
- (BOOL)hasClientId;
- (BOOL)hasEstablishmentCellularFallback;
- (BOOL)hasEstablishmentFailureError;
- (BOOL)hasEstablishmentForcedTcpFallback;
- (BOOL)hasEstablishmentInterfaceName;
- (BOOL)hasEstablishmentSuccess;
- (BOOL)hasEstablishmentSynRetransmits;
- (BOOL)hasEstablishmentTcpFallback;
- (BOOL)hasEstablishmentTime;
- (BOOL)hasPostConnectMultiHomed;
- (BOOL)hasPostConnectSessionLifetime;
- (BOOL)hasPostConnectSingleHomed;
- (BOOL)hasPostConnectSubflowAttemptCount;
- (BOOL)hasPostConnectSubflowMaxSubflowCount;
- (BOOL)hasSubflowSwitchingCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)postConnectMultiHomed;
- (BOOL)postConnectSingleHomed;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)interfaceReports;
- (NSMutableArray)subflowSwitchingReports;
- (NSString)clientId;
- (NSString)establishmentInterfaceName;
- (double)establishmentTime;
- (double)postConnectSessionLifetime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceReportsAtIndex:(unint64_t)a3;
- (id)subflowSwitchingReportsAtIndex:(unint64_t)a3;
- (int)establishmentFailureError;
- (int)establishmentSynRetransmits;
- (int)postConnectSubflowAttemptCount;
- (int)postConnectSubflowMaxSubflowCount;
- (int)subflowSwitchingCount;
- (unint64_t)hash;
- (unint64_t)interfaceReportsCount;
- (unint64_t)subflowSwitchingReportsCount;
- (unint64_t)timestamp;
- (void)addInterfaceReports:(id)a3;
- (void)addSubflowSwitchingReports:(id)a3;
- (void)clearInterfaceReports;
- (void)clearSubflowSwitchingReports;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClientId:(id)a3;
- (void)setEstablishmentCellularFallback:(BOOL)a3;
- (void)setEstablishmentFailureError:(int)a3;
- (void)setEstablishmentForcedTcpFallback:(BOOL)a3;
- (void)setEstablishmentInterfaceName:(id)a3;
- (void)setEstablishmentSuccess:(BOOL)a3;
- (void)setEstablishmentSynRetransmits:(int)a3;
- (void)setEstablishmentTcpFallback:(BOOL)a3;
- (void)setEstablishmentTime:(double)a3;
- (void)setHasEstablishmentCellularFallback:(BOOL)a3;
- (void)setHasEstablishmentFailureError:(BOOL)a3;
- (void)setHasEstablishmentForcedTcpFallback:(BOOL)a3;
- (void)setHasEstablishmentSuccess:(BOOL)a3;
- (void)setHasEstablishmentSynRetransmits:(BOOL)a3;
- (void)setHasEstablishmentTcpFallback:(BOOL)a3;
- (void)setHasEstablishmentTime:(BOOL)a3;
- (void)setHasPostConnectMultiHomed:(BOOL)a3;
- (void)setHasPostConnectSessionLifetime:(BOOL)a3;
- (void)setHasPostConnectSingleHomed:(BOOL)a3;
- (void)setHasPostConnectSubflowAttemptCount:(BOOL)a3;
- (void)setHasPostConnectSubflowMaxSubflowCount:(BOOL)a3;
- (void)setHasSubflowSwitchingCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInterfaceReports:(id)a3;
- (void)setPostConnectMultiHomed:(BOOL)a3;
- (void)setPostConnectSessionLifetime:(double)a3;
- (void)setPostConnectSingleHomed:(BOOL)a3;
- (void)setPostConnectSubflowAttemptCount:(int)a3;
- (void)setPostConnectSubflowMaxSubflowCount:(int)a3;
- (void)setSubflowSwitchingCount:(int)a3;
- (void)setSubflowSwitchingReports:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMPTCPConnectionReport

- (void)dealloc
{
  [(AWDMPTCPConnectionReport *)self setClientId:0];
  [(AWDMPTCPConnectionReport *)self setEstablishmentInterfaceName:0];
  [(AWDMPTCPConnectionReport *)self setInterfaceReports:0];
  [(AWDMPTCPConnectionReport *)self setSubflowSwitchingReports:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionReport;
  [(AWDMPTCPConnectionReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasEstablishmentInterfaceName
{
  return self->_establishmentInterfaceName != 0;
}

- (void)setEstablishmentSuccess:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_establishmentSuccess = a3;
}

- (void)setHasEstablishmentSuccess:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasEstablishmentSuccess
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setEstablishmentFailureError:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_establishmentFailureError = a3;
}

- (void)setHasEstablishmentFailureError:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEstablishmentFailureError
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setEstablishmentTcpFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_establishmentTcpFallback = a3;
}

- (void)setHasEstablishmentTcpFallback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasEstablishmentTcpFallback
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setEstablishmentCellularFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_establishmentCellularFallback = a3;
}

- (void)setHasEstablishmentCellularFallback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasEstablishmentCellularFallback
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEstablishmentTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_establishmentTime = a3;
}

- (void)setHasEstablishmentTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasEstablishmentTime
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setEstablishmentSynRetransmits:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_establishmentSynRetransmits = a3;
}

- (void)setHasEstablishmentSynRetransmits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasEstablishmentSynRetransmits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setEstablishmentForcedTcpFallback:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_establishmentForcedTcpFallback = a3;
}

- (void)setHasEstablishmentForcedTcpFallback:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasEstablishmentForcedTcpFallback
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPostConnectMultiHomed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_postConnectMultiHomed = a3;
}

- (void)setHasPostConnectMultiHomed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPostConnectMultiHomed
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setPostConnectSingleHomed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_postConnectSingleHomed = a3;
}

- (void)setHasPostConnectSingleHomed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasPostConnectSingleHomed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPostConnectSubflowAttemptCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_postConnectSubflowAttemptCount = a3;
}

- (void)setHasPostConnectSubflowAttemptCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPostConnectSubflowAttemptCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPostConnectSubflowMaxSubflowCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_postConnectSubflowMaxSubflowCount = a3;
}

- (void)setHasPostConnectSubflowMaxSubflowCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPostConnectSubflowMaxSubflowCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPostConnectSessionLifetime:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_postConnectSessionLifetime = a3;
}

- (void)setHasPostConnectSessionLifetime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPostConnectSessionLifetime
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setSubflowSwitchingCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_subflowSwitchingCount = a3;
}

- (void)setHasSubflowSwitchingCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSubflowSwitchingCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearInterfaceReports
{
}

- (void)addInterfaceReports:(id)a3
{
  interfaceReports = self->_interfaceReports;
  if (!interfaceReports)
  {
    interfaceReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_interfaceReports = interfaceReports;
  }

  [(NSMutableArray *)interfaceReports addObject:a3];
}

- (unint64_t)interfaceReportsCount
{
  return [(NSMutableArray *)self->_interfaceReports count];
}

- (id)interfaceReportsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_interfaceReports objectAtIndex:a3];
}

+ (Class)interfaceReportsType
{
  return (Class)objc_opt_class();
}

- (void)clearSubflowSwitchingReports
{
}

- (void)addSubflowSwitchingReports:(id)a3
{
  subflowSwitchingReports = self->_subflowSwitchingReports;
  if (!subflowSwitchingReports)
  {
    subflowSwitchingReports = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_subflowSwitchingReports = subflowSwitchingReports;
  }

  [(NSMutableArray *)subflowSwitchingReports addObject:a3];
}

- (unint64_t)subflowSwitchingReportsCount
{
  return [(NSMutableArray *)self->_subflowSwitchingReports count];
}

- (id)subflowSwitchingReportsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subflowSwitchingReports objectAtIndex:a3];
}

+ (Class)subflowSwitchingReportsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMPTCPConnectionReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMPTCPConnectionReport description](&v3, sel_description), -[AWDMPTCPConnectionReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"client_id"];
  }
  establishmentInterfaceName = self->_establishmentInterfaceName;
  if (establishmentInterfaceName) {
    [v3 setObject:establishmentInterfaceName forKey:@"establishment_interface_name"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_establishmentSuccess] forKey:@"establishment_success"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_42;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_establishmentFailureError] forKey:@"establishment_failure_error"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithBool:self->_establishmentTcpFallback] forKey:@"establishment_tcp_fallback"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithBool:self->_establishmentCellularFallback] forKey:@"establishment_cellular_fallback"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithDouble:self->_establishmentTime] forKey:@"establishment_time"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithInt:self->_establishmentSynRetransmits] forKey:@"establishment_syn_retransmits"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithBool:self->_establishmentForcedTcpFallback] forKey:@"establishment_forced_tcp_fallback"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithBool:self->_postConnectMultiHomed] forKey:@"post_connect_multi_homed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithBool:self->_postConnectSingleHomed] forKey:@"post_connect_single_homed"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithInt:self->_postConnectSubflowAttemptCount] forKey:@"post_connect_subflow_attempt_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithInt:self->_postConnectSubflowMaxSubflowCount] forKey:@"post_connect_subflow_max_subflow_count"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithDouble:self->_postConnectSessionLifetime] forKey:@"post_connect_session_lifetime"];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_20:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_subflowSwitchingCount] forKey:@"subflow_switching_count"];
LABEL_21:
  if ([(NSMutableArray *)self->_interfaceReports count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_interfaceReports, "count")];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    interfaceReports = self->_interfaceReports;
    uint64_t v9 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(interfaceReports);
          }
          [v7 addObject:[*(id *)(*((void *)&v24 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"interface_reports"];
  }
  if ([(NSMutableArray *)self->_subflowSwitchingReports count])
  {
    v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_subflowSwitchingReports, "count")];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    subflowSwitchingReports = self->_subflowSwitchingReports;
    uint64_t v15 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(subflowSwitchingReports);
          }
          [v13 addObject:[*(id *)(*((void *)&v20 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v16 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v16);
    }
    [v3 setObject:v13 forKey:@"subflow_switching_reports"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMPTCPConnectionReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  if (self->_establishmentInterfaceName) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_38;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_20:
  }
    PBDataWriterWriteInt32Field();
LABEL_21:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  interfaceReports = self->_interfaceReports;
  uint64_t v6 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(interfaceReports);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  subflowSwitchingReports = self->_subflowSwitchingReports;
  uint64_t v11 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(subflowSwitchingReports);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_WORD *)a3 + 52) |= 4u;
  }
  if (self->_clientId) {
    [a3 setClientId:];
  }
  if (self->_establishmentInterfaceName) {
    [a3 setEstablishmentInterfaceName:];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((unsigned char *)a3 + 98) = self->_establishmentSuccess;
    *((_WORD *)a3 + 52) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_9:
      if ((has & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 10) = self->_establishmentFailureError;
  *((_WORD *)a3 + 52) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((unsigned char *)a3 + 99) = self->_establishmentTcpFallback;
  *((_WORD *)a3 + 52) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((unsigned char *)a3 + 96) = self->_establishmentCellularFallback;
  *((_WORD *)a3 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)a3 + 1) = *(void *)&self->_establishmentTime;
  *((_WORD *)a3 + 52) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 14) = self->_establishmentSynRetransmits;
  *((_WORD *)a3 + 52) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_14:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((unsigned char *)a3 + 97) = self->_establishmentForcedTcpFallback;
  *((_WORD *)a3 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_15:
    if ((has & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((unsigned char *)a3 + 100) = self->_postConnectMultiHomed;
  *((_WORD *)a3 + 52) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)a3 + 101) = self->_postConnectSingleHomed;
  *((_WORD *)a3 + 52) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 18) = self->_postConnectSubflowAttemptCount;
  *((_WORD *)a3 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_18:
    if ((has & 2) == 0) {
      goto LABEL_19;
    }
LABEL_41:
    *((void *)a3 + 2) = *(void *)&self->_postConnectSessionLifetime;
    *((_WORD *)a3 + 52) |= 2u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_40:
  *((_DWORD *)a3 + 19) = self->_postConnectSubflowMaxSubflowCount;
  *((_WORD *)a3 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_41;
  }
LABEL_19:
  if ((has & 0x80) != 0)
  {
LABEL_20:
    *((_DWORD *)a3 + 20) = self->_subflowSwitchingCount;
    *((_WORD *)a3 + 52) |= 0x80u;
  }
LABEL_21:
  if ([(AWDMPTCPConnectionReport *)self interfaceReportsCount])
  {
    [a3 clearInterfaceReports];
    unint64_t v6 = [(AWDMPTCPConnectionReport *)self interfaceReportsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addInterfaceReports:-[AWDMPTCPConnectionReport interfaceReportsAtIndex:](self, "interfaceReportsAtIndex:", i)];
    }
  }
  if ([(AWDMPTCPConnectionReport *)self subflowSwitchingReportsCount])
  {
    [a3 clearSubflowSwitchingReports];
    unint64_t v9 = [(AWDMPTCPConnectionReport *)self subflowSwitchingReportsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addSubflowSwitchingReports:-[AWDMPTCPConnectionReport subflowSwitchingReportsAtIndex:](self, "subflowSwitchingReportsAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_WORD *)(v5 + 104) |= 4u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_clientId copyWithZone:a3];
  *(void *)(v6 + 48) = [(NSString *)self->_establishmentInterfaceName copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 98) = self->_establishmentSuccess;
    *(_WORD *)(v6 + 104) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 40) = self->_establishmentFailureError;
  *(_WORD *)(v6 + 104) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(unsigned char *)(v6 + 99) = self->_establishmentTcpFallback;
  *(_WORD *)(v6 + 104) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(unsigned char *)(v6 + 96) = self->_establishmentCellularFallback;
  *(_WORD *)(v6 + 104) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v6 + 8) = self->_establishmentTime;
  *(_WORD *)(v6 + 104) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v6 + 56) = self->_establishmentSynRetransmits;
  *(_WORD *)(v6 + 104) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x1000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(unsigned char *)(v6 + 97) = self->_establishmentForcedTcpFallback;
  *(_WORD *)(v6 + 104) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_11:
    if ((has & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v6 + 100) = self->_postConnectMultiHomed;
  *(_WORD *)(v6 + 104) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(unsigned char *)(v6 + 101) = self->_postConnectSingleHomed;
  *(_WORD *)(v6 + 104) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v6 + 72) = self->_postConnectSubflowAttemptCount;
  *(_WORD *)(v6 + 104) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_14:
    if ((has & 2) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v6 + 76) = self->_postConnectSubflowMaxSubflowCount;
  *(_WORD *)(v6 + 104) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_43:
  *(double *)(v6 + 16) = self->_postConnectSessionLifetime;
  *(_WORD *)(v6 + 104) |= 2u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 80) = self->_subflowSwitchingCount;
    *(_WORD *)(v6 + 104) |= 0x80u;
  }
LABEL_17:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  interfaceReports = self->_interfaceReports;
  uint64_t v9 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(interfaceReports);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addInterfaceReports:v13];
      }
      uint64_t v10 = [(NSMutableArray *)interfaceReports countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  subflowSwitchingReports = self->_subflowSwitchingReports;
  uint64_t v15 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(subflowSwitchingReports);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addSubflowSwitchingReports:v19];
      }
      uint64_t v16 = [(NSMutableArray *)subflowSwitchingReports countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 v6 = *((_WORD *)a3 + 52);
    if ((*(_WORD *)&self->_has & 4) != 0)
    {
      if ((v6 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_98;
      }
    }
    else if ((v6 & 4) != 0)
    {
      goto LABEL_98;
    }
    clientId = self->_clientId;
    if (!((unint64_t)clientId | *((void *)a3 + 4)) || (int v5 = -[NSString isEqual:](clientId, "isEqual:")) != 0)
    {
      establishmentInterfaceName = self->_establishmentInterfaceName;
      if (!((unint64_t)establishmentInterfaceName | *((void *)a3 + 6))
        || (int v5 = -[NSString isEqual:](establishmentInterfaceName, "isEqual:")) != 0)
      {
        __int16 has = (__int16)self->_has;
        __int16 v10 = *((_WORD *)a3 + 52);
        if ((has & 0x400) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x400) == 0) {
            goto LABEL_98;
          }
          if (self->_establishmentSuccess)
          {
            if (!*((unsigned char *)a3 + 98)) {
              goto LABEL_98;
            }
          }
          else if (*((unsigned char *)a3 + 98))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x400) != 0)
        {
          goto LABEL_98;
        }
        if ((has & 8) != 0)
        {
          if ((v10 & 8) == 0 || self->_establishmentFailureError != *((_DWORD *)a3 + 10)) {
            goto LABEL_98;
          }
        }
        else if ((v10 & 8) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x800) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x800) == 0) {
            goto LABEL_98;
          }
          if (self->_establishmentTcpFallback)
          {
            if (!*((unsigned char *)a3 + 99)) {
              goto LABEL_98;
            }
          }
          else if (*((unsigned char *)a3 + 99))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x800) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x100) == 0) {
            goto LABEL_98;
          }
          if (self->_establishmentCellularFallback)
          {
            if (!*((unsigned char *)a3 + 96)) {
              goto LABEL_98;
            }
          }
          else if (*((unsigned char *)a3 + 96))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x100) != 0)
        {
          goto LABEL_98;
        }
        if (has)
        {
          if ((v10 & 1) == 0 || self->_establishmentTime != *((double *)a3 + 1)) {
            goto LABEL_98;
          }
        }
        else if (v10)
        {
          goto LABEL_98;
        }
        if ((has & 0x10) != 0)
        {
          if ((v10 & 0x10) == 0 || self->_establishmentSynRetransmits != *((_DWORD *)a3 + 14)) {
            goto LABEL_98;
          }
        }
        else if ((v10 & 0x10) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x200) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x200) == 0) {
            goto LABEL_98;
          }
          if (self->_establishmentForcedTcpFallback)
          {
            if (!*((unsigned char *)a3 + 97)) {
              goto LABEL_98;
            }
          }
          else if (*((unsigned char *)a3 + 97))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x200) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x1000) != 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x1000) == 0) {
            goto LABEL_98;
          }
          if (self->_postConnectMultiHomed)
          {
            if (!*((unsigned char *)a3 + 100)) {
              goto LABEL_98;
            }
          }
          else if (*((unsigned char *)a3 + 100))
          {
            goto LABEL_98;
          }
        }
        else if ((*((_WORD *)a3 + 52) & 0x1000) != 0)
        {
          goto LABEL_98;
        }
        if ((*(_WORD *)&self->_has & 0x2000) == 0)
        {
          if ((*((_WORD *)a3 + 52) & 0x2000) != 0) {
            goto LABEL_98;
          }
          goto LABEL_74;
        }
        if ((*((_WORD *)a3 + 52) & 0x2000) != 0)
        {
          if (self->_postConnectSingleHomed)
          {
            if (!*((unsigned char *)a3 + 101)) {
              goto LABEL_98;
            }
            goto LABEL_74;
          }
          if (!*((unsigned char *)a3 + 101))
          {
LABEL_74:
            if ((has & 0x20) != 0)
            {
              if ((v10 & 0x20) == 0 || self->_postConnectSubflowAttemptCount != *((_DWORD *)a3 + 18)) {
                goto LABEL_98;
              }
            }
            else if ((v10 & 0x20) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 0x40) != 0)
            {
              if ((v10 & 0x40) == 0 || self->_postConnectSubflowMaxSubflowCount != *((_DWORD *)a3 + 19)) {
                goto LABEL_98;
              }
            }
            else if ((v10 & 0x40) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 2) != 0)
            {
              if ((v10 & 2) == 0 || self->_postConnectSessionLifetime != *((double *)a3 + 2)) {
                goto LABEL_98;
              }
            }
            else if ((v10 & 2) != 0)
            {
              goto LABEL_98;
            }
            if ((has & 0x80) != 0)
            {
              if ((v10 & 0x80) == 0 || self->_subflowSwitchingCount != *((_DWORD *)a3 + 20)) {
                goto LABEL_98;
              }
            }
            else if ((v10 & 0x80) != 0)
            {
              goto LABEL_98;
            }
            interfaceReports = self->_interfaceReports;
            if (!((unint64_t)interfaceReports | *((void *)a3 + 8))
              || (int v5 = -[NSMutableArray isEqual:](interfaceReports, "isEqual:")) != 0)
            {
              subflowSwitchingReports = self->_subflowSwitchingReports;
              if ((unint64_t)subflowSwitchingReports | *((void *)a3 + 11))
              {
                LOBYTE(v5) = -[NSMutableArray isEqual:](subflowSwitchingReports, "isEqual:");
              }
              else
              {
                LOBYTE(v5) = 1;
              }
            }
            return v5;
          }
        }
LABEL_98:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    unint64_t v29 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v29 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_clientId hash];
  NSUInteger v27 = [(NSString *)self->_establishmentInterfaceName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    uint64_t v26 = 2654435761 * self->_establishmentSuccess;
    if ((has & 8) != 0)
    {
LABEL_6:
      uint64_t v25 = 2654435761 * self->_establishmentFailureError;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v25 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v24 = 2654435761 * self->_establishmentTcpFallback;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v23 = 0;
    if (has) {
      goto LABEL_9;
    }
LABEL_17:
    unint64_t v8 = 0;
    goto LABEL_20;
  }
LABEL_15:
  uint64_t v24 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v23 = 2654435761 * self->_establishmentCellularFallback;
  if ((has & 1) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  double establishmentTime = self->_establishmentTime;
  double v5 = -establishmentTime;
  if (establishmentTime >= 0.0) {
    double v5 = self->_establishmentTime;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_20:
  if ((has & 0x10) != 0)
  {
    uint64_t v9 = 2654435761 * self->_establishmentSynRetransmits;
    if ((has & 0x200) != 0)
    {
LABEL_22:
      uint64_t v10 = 2654435761 * self->_establishmentForcedTcpFallback;
      if ((has & 0x1000) != 0) {
        goto LABEL_23;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v10 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_23:
    uint64_t v11 = 2654435761 * self->_postConnectMultiHomed;
    if ((has & 0x2000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v11 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_24:
    uint64_t v12 = 2654435761 * self->_postConnectSingleHomed;
    if ((has & 0x20) != 0) {
      goto LABEL_25;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v12 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_25:
    uint64_t v13 = 2654435761 * self->_postConnectSubflowAttemptCount;
    if ((has & 0x40) != 0) {
      goto LABEL_26;
    }
LABEL_36:
    uint64_t v14 = 0;
    if ((has & 2) != 0) {
      goto LABEL_27;
    }
LABEL_37:
    unint64_t v19 = 0;
    goto LABEL_40;
  }
LABEL_35:
  uint64_t v13 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_36;
  }
LABEL_26:
  uint64_t v14 = 2654435761 * self->_postConnectSubflowMaxSubflowCount;
  if ((has & 2) == 0) {
    goto LABEL_37;
  }
LABEL_27:
  double postConnectSessionLifetime = self->_postConnectSessionLifetime;
  double v16 = -postConnectSessionLifetime;
  if (postConnectSessionLifetime >= 0.0) {
    double v16 = self->_postConnectSessionLifetime;
  }
  long double v17 = floor(v16 + 0.5);
  double v18 = (v16 - v17) * 1.84467441e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabs(v18);
  }
LABEL_40:
  if ((has & 0x80) != 0) {
    uint64_t v20 = 2654435761 * self->_subflowSwitchingCount;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = v25 ^ v24 ^ v23 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ [(NSMutableArray *)self->_interfaceReports hash];
  return v28 ^ v29 ^ v27 ^ v26 ^ v21 ^ [(NSMutableArray *)self->_subflowSwitchingReports hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ((*((_WORD *)a3 + 52) & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDMPTCPConnectionReport setClientId:](self, "setClientId:");
  }
  if (*((void *)a3 + 6)) {
    -[AWDMPTCPConnectionReport setEstablishmentInterfaceName:](self, "setEstablishmentInterfaceName:");
  }
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x400) != 0)
  {
    self->_establishmentSuccess = *((unsigned char *)a3 + 98);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v5 = *((_WORD *)a3 + 52);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_38;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  self->_establishmentFailureError = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_establishmentTcpFallback = *((unsigned char *)a3 + 99);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_establishmentCellularFallback = *((unsigned char *)a3 + 96);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double establishmentTime = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_establishmentSynRetransmits = *((_DWORD *)a3 + 14);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_establishmentForcedTcpFallback = *((unsigned char *)a3 + 97);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x1000) == 0)
  {
LABEL_15:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_postConnectMultiHomed = *((unsigned char *)a3 + 100);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_postConnectSingleHomed = *((unsigned char *)a3 + 101);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_postConnectSubflowAttemptCount = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_18:
    if ((v5 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_postConnectSubflowMaxSubflowCount = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_47:
  self->_double postConnectSessionLifetime = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)a3 + 52) & 0x80) != 0)
  {
LABEL_20:
    self->_subflowSwitchingCount = *((_DWORD *)a3 + 20);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_21:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long double v6 = (void *)*((void *)a3 + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDMPTCPConnectionReport *)self addInterfaceReports:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 11);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDMPTCPConnectionReport *)self addSubflowSwitchingReports:*(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)establishmentInterfaceName
{
  return self->_establishmentInterfaceName;
}

- (void)setEstablishmentInterfaceName:(id)a3
{
}

- (BOOL)establishmentSuccess
{
  return self->_establishmentSuccess;
}

- (int)establishmentFailureError
{
  return self->_establishmentFailureError;
}

- (BOOL)establishmentTcpFallback
{
  return self->_establishmentTcpFallback;
}

- (BOOL)establishmentCellularFallback
{
  return self->_establishmentCellularFallback;
}

- (double)establishmentTime
{
  return self->_establishmentTime;
}

- (int)establishmentSynRetransmits
{
  return self->_establishmentSynRetransmits;
}

- (BOOL)establishmentForcedTcpFallback
{
  return self->_establishmentForcedTcpFallback;
}

- (BOOL)postConnectMultiHomed
{
  return self->_postConnectMultiHomed;
}

- (BOOL)postConnectSingleHomed
{
  return self->_postConnectSingleHomed;
}

- (int)postConnectSubflowAttemptCount
{
  return self->_postConnectSubflowAttemptCount;
}

- (int)postConnectSubflowMaxSubflowCount
{
  return self->_postConnectSubflowMaxSubflowCount;
}

- (double)postConnectSessionLifetime
{
  return self->_postConnectSessionLifetime;
}

- (int)subflowSwitchingCount
{
  return self->_subflowSwitchingCount;
}

- (NSMutableArray)interfaceReports
{
  return self->_interfaceReports;
}

- (void)setInterfaceReports:(id)a3
{
}

- (NSMutableArray)subflowSwitchingReports
{
  return self->_subflowSwitchingReports;
}

- (void)setSubflowSwitchingReports:(id)a3
{
}

@end
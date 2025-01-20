@interface NETSchemaNETSessionConnectionNetwork
- (BOOL)hasAttempCount;
- (BOOL)hasCarrierName;
- (BOOL)hasClearChannelAssessmentScore;
- (BOOL)hasConnectionEstablishmentTime;
- (BOOL)hasConnectionMethod;
- (BOOL)hasConnectionStartToEstablishmentTime;
- (BOOL)hasConnectionStartToTLSHandshake;
- (BOOL)hasDnsResolutionTime;
- (BOOL)hasFirstByteTime;
- (BOOL)hasIsCaptive;
- (BOOL)hasPrimarySubflowInterfaceName;
- (BOOL)hasRssi;
- (BOOL)hasSnr;
- (BOOL)hasStartToDNSResolution;
- (BOOL)hasTlsHandshakeTime;
- (BOOL)hasTlsVersion;
- (BOOL)isCaptive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NETSchemaNETSessionConnectionNetwork)initWithDictionary:(id)a3;
- (NETSchemaNETSessionConnectionNetwork)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)carrierName;
- (NSString)primarySubflowInterfaceName;
- (double)clearChannelAssessmentScore;
- (double)rssi;
- (double)snr;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)connectionMethod;
- (int)tlsVersion;
- (unint64_t)connectionEstablishmentTime;
- (unint64_t)connectionStartToEstablishmentTime;
- (unint64_t)connectionStartToTLSHandshake;
- (unint64_t)dnsResolutionTime;
- (unint64_t)firstByteTime;
- (unint64_t)hash;
- (unint64_t)startToDNSResolution;
- (unint64_t)tlsHandshakeTime;
- (unsigned)attempCount;
- (void)deleteAttempCount;
- (void)deleteCarrierName;
- (void)deleteClearChannelAssessmentScore;
- (void)deleteConnectionEstablishmentTime;
- (void)deleteConnectionMethod;
- (void)deleteConnectionStartToEstablishmentTime;
- (void)deleteConnectionStartToTLSHandshake;
- (void)deleteDnsResolutionTime;
- (void)deleteFirstByteTime;
- (void)deleteIsCaptive;
- (void)deletePrimarySubflowInterfaceName;
- (void)deleteRssi;
- (void)deleteSnr;
- (void)deleteStartToDNSResolution;
- (void)deleteTlsHandshakeTime;
- (void)deleteTlsVersion;
- (void)setAttempCount:(unsigned int)a3;
- (void)setCarrierName:(id)a3;
- (void)setClearChannelAssessmentScore:(double)a3;
- (void)setConnectionEstablishmentTime:(unint64_t)a3;
- (void)setConnectionMethod:(int)a3;
- (void)setConnectionStartToEstablishmentTime:(unint64_t)a3;
- (void)setConnectionStartToTLSHandshake:(unint64_t)a3;
- (void)setDnsResolutionTime:(unint64_t)a3;
- (void)setFirstByteTime:(unint64_t)a3;
- (void)setHasAttempCount:(BOOL)a3;
- (void)setHasCarrierName:(BOOL)a3;
- (void)setHasClearChannelAssessmentScore:(BOOL)a3;
- (void)setHasConnectionEstablishmentTime:(BOOL)a3;
- (void)setHasConnectionMethod:(BOOL)a3;
- (void)setHasConnectionStartToEstablishmentTime:(BOOL)a3;
- (void)setHasConnectionStartToTLSHandshake:(BOOL)a3;
- (void)setHasDnsResolutionTime:(BOOL)a3;
- (void)setHasFirstByteTime:(BOOL)a3;
- (void)setHasIsCaptive:(BOOL)a3;
- (void)setHasPrimarySubflowInterfaceName:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasSnr:(BOOL)a3;
- (void)setHasStartToDNSResolution:(BOOL)a3;
- (void)setHasTlsHandshakeTime:(BOOL)a3;
- (void)setHasTlsVersion:(BOOL)a3;
- (void)setIsCaptive:(BOOL)a3;
- (void)setPrimarySubflowInterfaceName:(id)a3;
- (void)setRssi:(double)a3;
- (void)setSnr:(double)a3;
- (void)setStartToDNSResolution:(unint64_t)a3;
- (void)setTlsHandshakeTime:(unint64_t)a3;
- (void)setTlsVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NETSchemaNETSessionConnectionNetwork

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
}

- (void)setHasPrimarySubflowInterfaceName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasCarrierName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (double)clearChannelAssessmentScore
{
  return self->_clearChannelAssessmentScore;
}

- (unint64_t)connectionStartToTLSHandshake
{
  return self->_connectionStartToTLSHandshake;
}

- (unint64_t)connectionStartToEstablishmentTime
{
  return self->_connectionStartToEstablishmentTime;
}

- (unint64_t)connectionEstablishmentTime
{
  return self->_connectionEstablishmentTime;
}

- (unint64_t)tlsHandshakeTime
{
  return self->_tlsHandshakeTime;
}

- (int)tlsVersion
{
  return self->_tlsVersion;
}

- (unint64_t)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (unint64_t)startToDNSResolution
{
  return self->_startToDNSResolution;
}

- (unint64_t)firstByteTime
{
  return self->_firstByteTime;
}

- (unsigned)attempCount
{
  return self->_attempCount;
}

- (double)snr
{
  return self->_snr;
}

- (double)rssi
{
  return self->_rssi;
}

- (BOOL)isCaptive
{
  return self->_isCaptive;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (int)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (NETSchemaNETSessionConnectionNetwork)initWithDictionary:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NETSchemaNETSessionConnectionNetwork;
  v5 = [(NETSchemaNETSessionConnectionNetwork *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"carrierName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(NETSchemaNETSessionConnectionNetwork *)v5 setCarrierName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"connectionMethod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setConnectionMethod:](v5, "setConnectionMethod:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"primarySubflowInterfaceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(NETSchemaNETSessionConnectionNetwork *)v5 setPrimarySubflowInterfaceName:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"isCaptive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setIsCaptive:](v5, "setIsCaptive:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"rssi"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v12 doubleValue];
      -[NETSchemaNETSessionConnectionNetwork setRssi:](v5, "setRssi:");
    }
    v13 = [v4 objectForKeyedSubscript:@"snr"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v13 doubleValue];
      -[NETSchemaNETSessionConnectionNetwork setSnr:](v5, "setSnr:");
    }
    v14 = [v4 objectForKeyedSubscript:@"attempCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setAttempCount:](v5, "setAttempCount:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"firstByteTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setFirstByteTime:](v5, "setFirstByteTime:", [v15 unsignedLongLongValue]);
    }
    v32 = v11;
    v16 = [v4 objectForKeyedSubscript:@"startToDNSResolution"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setStartToDNSResolution:](v5, "setStartToDNSResolution:", [v16 unsignedLongLongValue]);
    }
    v31 = v12;
    v17 = [v4 objectForKeyedSubscript:@"dnsResolutionTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setDnsResolutionTime:](v5, "setDnsResolutionTime:", [v17 unsignedLongLongValue]);
    }
    v27 = v17;
    v34 = v8;
    v18 = [v4 objectForKeyedSubscript:@"tlsVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setTlsVersion:](v5, "setTlsVersion:", [v18 intValue]);
    }
    v33 = v9;
    v19 = [v4 objectForKeyedSubscript:@"tlsHandshakeTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setTlsHandshakeTime:](v5, "setTlsHandshakeTime:", [v19 unsignedLongLongValue]);
    }
    v30 = v13;
    v20 = [v4 objectForKeyedSubscript:@"connectionEstablishmentTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setConnectionEstablishmentTime:](v5, "setConnectionEstablishmentTime:", [v20 unsignedLongLongValue]);
    }
    v28 = v16;
    v29 = v14;
    v21 = [v4 objectForKeyedSubscript:@"connectionStartToEstablishmentTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setConnectionStartToEstablishmentTime:](v5, "setConnectionStartToEstablishmentTime:", [v21 unsignedLongLongValue]);
    }
    v22 = v15;
    v23 = [v4 objectForKeyedSubscript:@"connectionStartToTLSHandshake"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[NETSchemaNETSessionConnectionNetwork setConnectionStartToTLSHandshake:](v5, "setConnectionStartToTLSHandshake:", [v23 unsignedLongLongValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"clearChannelAssessmentScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v24 doubleValue];
      -[NETSchemaNETSessionConnectionNetwork setClearChannelAssessmentScore:](v5, "setClearChannelAssessmentScore:");
    }
    v25 = v5;
  }
  return v5;
}

- (NETSchemaNETSessionConnectionNetwork)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(NETSchemaNETSessionConnectionNetwork *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(NETSchemaNETSessionConnectionNetwork *)self dictionaryRepresentation];
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
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NETSchemaNETSessionConnectionNetwork attempCount](self, "attempCount"));
    [v3 setObject:v4 forKeyedSubscript:@"attempCount"];
  }
  if (self->_carrierName)
  {
    v5 = [(NETSchemaNETSessionConnectionNetwork *)self carrierName];
    v6 = (void *)[v5 copy];
    [v3 setObject:v6 forKeyedSubscript:@"carrierName"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    v12 = NSNumber;
    [(NETSchemaNETSessionConnectionNetwork *)self clearChannelAssessmentScore];
    v13 = objc_msgSend(v12, "numberWithDouble:");
    [v3 setObject:v13 forKeyedSubscript:@"clearChannelAssessmentScore"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionEstablishmentTime](self, "connectionEstablishmentTime"));
  [v3 setObject:v14 forKeyedSubscript:@"connectionEstablishmentTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_24:
  unsigned int v15 = [(NETSchemaNETSessionConnectionNetwork *)self connectionMethod] - 1;
  if (v15 > 6) {
    v16 = @"NETCONNECTIONMETHOD_UNKNOWN";
  }
  else {
    v16 = off_1E5EB2B88[v15];
  }
  [v3 setObject:v16 forKeyedSubscript:@"connectionMethod"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionStartToEstablishmentTime](self, "connectionStartToEstablishmentTime"));
  [v3 setObject:v25 forKeyedSubscript:@"connectionStartToEstablishmentTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_10:
    if ((has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork connectionStartToTLSHandshake](self, "connectionStartToTLSHandshake"));
  [v3 setObject:v26 forKeyedSubscript:@"connectionStartToTLSHandshake"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork dnsResolutionTime](self, "dnsResolutionTime"));
  [v3 setObject:v27 forKeyedSubscript:@"dnsResolutionTime"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_37:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork firstByteTime](self, "firstByteTime"));
  [v3 setObject:v28 forKeyedSubscript:@"firstByteTime"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_13:
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[NETSchemaNETSessionConnectionNetwork isCaptive](self, "isCaptive"));
    [v3 setObject:v8 forKeyedSubscript:@"isCaptive"];
  }
LABEL_14:
  if (self->_primarySubflowInterfaceName)
  {
    v9 = [(NETSchemaNETSessionConnectionNetwork *)self primarySubflowInterfaceName];
    v10 = (void *)[v9 copy];
    [v3 setObject:v10 forKeyedSubscript:@"primarySubflowInterfaceName"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) != 0)
  {
    v17 = NSNumber;
    [(NETSchemaNETSessionConnectionNetwork *)self rssi];
    v18 = objc_msgSend(v17, "numberWithDouble:");
    [v3 setObject:v18 forKeyedSubscript:@"rssi"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 8) == 0)
    {
LABEL_18:
      if ((v11 & 0x40) == 0) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_18;
  }
  v19 = NSNumber;
  [(NETSchemaNETSessionConnectionNetwork *)self snr];
  v20 = objc_msgSend(v19, "numberWithDouble:");
  [v3 setObject:v20 forKeyedSubscript:@"snr"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_19:
    if ((v11 & 0x200) == 0) {
      goto LABEL_20;
    }
LABEL_29:
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork tlsHandshakeTime](self, "tlsHandshakeTime"));
    [v3 setObject:v22 forKeyedSubscript:@"tlsHandshakeTime"];

    if ((*(_WORD *)&self->_has & 0x100) == 0) {
      goto LABEL_41;
    }
LABEL_30:
    unsigned int v23 = [(NETSchemaNETSessionConnectionNetwork *)self tlsVersion] - 1;
    if (v23 > 5) {
      v24 = @"NETTLSVERSION_UNKNOWN";
    }
    else {
      v24 = off_1E5EB2BC0[v23];
    }
    [v3 setObject:v24 forKeyedSubscript:@"tlsVersion"];
    goto LABEL_41;
  }
LABEL_28:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NETSchemaNETSessionConnectionNetwork startToDNSResolution](self, "startToDNSResolution"));
  [v3 setObject:v21 forKeyedSubscript:@"startToDNSResolution"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0) {
    goto LABEL_29;
  }
LABEL_20:
  if ((v11 & 0x100) != 0) {
    goto LABEL_30;
  }
LABEL_41:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v36 = [(NSString *)self->_carrierName hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v35 = 2654435761 * self->_connectionMethod;
  }
  else {
    uint64_t v35 = 0;
  }
  NSUInteger v34 = [(NSString *)self->_primarySubflowInterfaceName hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v33 = 2654435761 * self->_isCaptive;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v33 = 0;
  if ((has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double rssi = self->_rssi;
  double v5 = -rssi;
  if (rssi >= 0.0) {
    double v5 = self->_rssi;
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
LABEL_14:
  if ((has & 8) != 0)
  {
    unint64_t v10 = v8;
    double snr = self->_snr;
    double v12 = -snr;
    if (snr >= 0.0) {
      double v12 = self->_snr;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      unint64_t v8 = v10;
      if (v14 > 0.0) {
        v9 += (unint64_t)v14;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v14);
      unint64_t v8 = v10;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_attempCount;
    if ((has & 0x20) != 0)
    {
LABEL_24:
      unint64_t v16 = 2654435761u * self->_firstByteTime;
      if ((has & 0x40) != 0) {
        goto LABEL_25;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_24;
    }
  }
  unint64_t v16 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_25:
    unint64_t v17 = 2654435761u * self->_startToDNSResolution;
    if ((has & 0x80) != 0) {
      goto LABEL_26;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v17 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    unint64_t v18 = 2654435761u * self->_dnsResolutionTime;
    if ((has & 0x100) != 0) {
      goto LABEL_27;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v18 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_27:
    uint64_t v19 = 2654435761 * self->_tlsVersion;
    if ((has & 0x200) != 0) {
      goto LABEL_28;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v19 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_28:
    unint64_t v20 = 2654435761u * self->_tlsHandshakeTime;
    if ((has & 0x400) != 0) {
      goto LABEL_29;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v20 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_29:
    unint64_t v21 = 2654435761u * self->_connectionEstablishmentTime;
    if ((has & 0x800) != 0) {
      goto LABEL_30;
    }
    goto LABEL_43;
  }
LABEL_42:
  unint64_t v21 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_30:
    unint64_t v22 = 2654435761u * self->_connectionStartToEstablishmentTime;
    if ((has & 0x1000) != 0) {
      goto LABEL_31;
    }
LABEL_44:
    unint64_t v23 = 0;
    if ((has & 0x2000) != 0) {
      goto LABEL_32;
    }
LABEL_45:
    unint64_t v29 = 0;
    return v35 ^ v36 ^ v34 ^ v33 ^ v8 ^ v9 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v29;
  }
LABEL_43:
  unint64_t v22 = 0;
  if ((has & 0x1000) == 0) {
    goto LABEL_44;
  }
LABEL_31:
  unint64_t v23 = 2654435761u * self->_connectionStartToTLSHandshake;
  if ((has & 0x2000) == 0) {
    goto LABEL_45;
  }
LABEL_32:
  unint64_t v31 = v20;
  uint64_t v32 = v19;
  unint64_t v24 = v8;
  double clearChannelAssessmentScore = self->_clearChannelAssessmentScore;
  double v26 = -clearChannelAssessmentScore;
  if (clearChannelAssessmentScore >= 0.0) {
    double v26 = self->_clearChannelAssessmentScore;
  }
  long double v27 = floor(v26 + 0.5);
  double v28 = (v26 - v27) * 1.84467441e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
  if (v28 >= 0.0)
  {
    unint64_t v8 = v24;
    unint64_t v20 = v31;
    uint64_t v19 = v32;
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabs(v28);
    unint64_t v8 = v24;
    unint64_t v20 = v31;
    uint64_t v19 = v32;
  }
  return v35 ^ v36 ^ v34 ^ v33 ^ v8 ^ v9 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  double v5 = [(NETSchemaNETSessionConnectionNetwork *)self carrierName];
  long double v6 = [v4 carrierName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_14;
  }
  uint64_t v7 = [(NETSchemaNETSessionConnectionNetwork *)self carrierName];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(NETSchemaNETSessionConnectionNetwork *)self carrierName];
    unint64_t v10 = [v4 carrierName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  if ((*(_WORD *)&self->_has & 1) != (v4[68] & 1)) {
    goto LABEL_15;
  }
  if (*(_WORD *)&self->_has)
  {
    int connectionMethod = self->_connectionMethod;
    if (connectionMethod != [v4 connectionMethod]) {
      goto LABEL_15;
    }
  }
  double v5 = [(NETSchemaNETSessionConnectionNetwork *)self primarySubflowInterfaceName];
  long double v6 = [v4 primarySubflowInterfaceName];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(NETSchemaNETSessionConnectionNetwork *)self primarySubflowInterfaceName];
  if (v13)
  {
    double v14 = (void *)v13;
    uint64_t v15 = [(NETSchemaNETSessionConnectionNetwork *)self primarySubflowInterfaceName];
    unint64_t v16 = [v4 primarySubflowInterfaceName];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
  int v21 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v22 = (unsigned __int16)v4[68];
  if (v21 == ((v22 >> 1) & 1))
  {
    if (v21)
    {
      int isCaptive = self->_isCaptive;
      if (isCaptive != [v4 isCaptive]) {
        goto LABEL_15;
      }
      $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
      unsigned int v22 = (unsigned __int16)v4[68];
    }
    int v24 = (*(unsigned int *)&has >> 2) & 1;
    if (v24 == ((v22 >> 2) & 1))
    {
      if (v24)
      {
        double rssi = self->_rssi;
        [v4 rssi];
        if (rssi != v26) {
          goto LABEL_15;
        }
        $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
        unsigned int v22 = (unsigned __int16)v4[68];
      }
      int v27 = (*(unsigned int *)&has >> 3) & 1;
      if (v27 == ((v22 >> 3) & 1))
      {
        if (v27)
        {
          double snr = self->_snr;
          [v4 snr];
          if (snr != v29) {
            goto LABEL_15;
          }
          $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
          unsigned int v22 = (unsigned __int16)v4[68];
        }
        int v30 = (*(unsigned int *)&has >> 4) & 1;
        if (v30 == ((v22 >> 4) & 1))
        {
          if (v30)
          {
            unsigned int attempCount = self->_attempCount;
            if (attempCount != [v4 attempCount]) {
              goto LABEL_15;
            }
            $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
            unsigned int v22 = (unsigned __int16)v4[68];
          }
          int v32 = (*(unsigned int *)&has >> 5) & 1;
          if (v32 == ((v22 >> 5) & 1))
          {
            if (v32)
            {
              unint64_t firstByteTime = self->_firstByteTime;
              if (firstByteTime != [v4 firstByteTime]) {
                goto LABEL_15;
              }
              $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
              unsigned int v22 = (unsigned __int16)v4[68];
            }
            int v34 = (*(unsigned int *)&has >> 6) & 1;
            if (v34 == ((v22 >> 6) & 1))
            {
              if (v34)
              {
                unint64_t startToDNSResolution = self->_startToDNSResolution;
                if (startToDNSResolution != [v4 startToDNSResolution]) {
                  goto LABEL_15;
                }
                $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                unsigned int v22 = (unsigned __int16)v4[68];
              }
              int v36 = (*(unsigned int *)&has >> 7) & 1;
              if (v36 == ((v22 >> 7) & 1))
              {
                if (v36)
                {
                  unint64_t dnsResolutionTime = self->_dnsResolutionTime;
                  if (dnsResolutionTime != [v4 dnsResolutionTime]) {
                    goto LABEL_15;
                  }
                  $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                  unsigned int v22 = (unsigned __int16)v4[68];
                }
                int v38 = (*(unsigned int *)&has >> 8) & 1;
                if (v38 == ((v22 >> 8) & 1))
                {
                  if (v38)
                  {
                    int tlsVersion = self->_tlsVersion;
                    if (tlsVersion != [v4 tlsVersion]) {
                      goto LABEL_15;
                    }
                    $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                    unsigned int v22 = (unsigned __int16)v4[68];
                  }
                  int v40 = (*(unsigned int *)&has >> 9) & 1;
                  if (v40 == ((v22 >> 9) & 1))
                  {
                    if (v40)
                    {
                      unint64_t tlsHandshakeTime = self->_tlsHandshakeTime;
                      if (tlsHandshakeTime != [v4 tlsHandshakeTime]) {
                        goto LABEL_15;
                      }
                      $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                      unsigned int v22 = (unsigned __int16)v4[68];
                    }
                    int v42 = (*(unsigned int *)&has >> 10) & 1;
                    if (v42 == ((v22 >> 10) & 1))
                    {
                      if (v42)
                      {
                        unint64_t connectionEstablishmentTime = self->_connectionEstablishmentTime;
                        if (connectionEstablishmentTime != [v4 connectionEstablishmentTime]) {
                          goto LABEL_15;
                        }
                        $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                        unsigned int v22 = (unsigned __int16)v4[68];
                      }
                      int v44 = (*(unsigned int *)&has >> 11) & 1;
                      if (v44 == ((v22 >> 11) & 1))
                      {
                        if (v44)
                        {
                          unint64_t connectionStartToEstablishmentTime = self->_connectionStartToEstablishmentTime;
                          if (connectionStartToEstablishmentTime != [v4 connectionStartToEstablishmentTime])goto LABEL_15; {
                          $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                          }
                          unsigned int v22 = (unsigned __int16)v4[68];
                        }
                        int v46 = (*(unsigned int *)&has >> 12) & 1;
                        if (v46 == ((v22 >> 12) & 1))
                        {
                          if (v46)
                          {
                            unint64_t connectionStartToTLSHandshake = self->_connectionStartToTLSHandshake;
                            if (connectionStartToTLSHandshake != [v4 connectionStartToTLSHandshake]) {
                              goto LABEL_15;
                            }
                            $E3BE65C9752B703C9C6C61D3C06CA71F has = self->_has;
                            unsigned int v22 = (unsigned __int16)v4[68];
                          }
                          int v48 = (*(unsigned int *)&has >> 13) & 1;
                          if (v48 == ((v22 >> 13) & 1))
                          {
                            if (!v48
                              || (double clearChannelAssessmentScore = self->_clearChannelAssessmentScore,
                                  [v4 clearChannelAssessmentScore],
                                  clearChannelAssessmentScore == v50))
                            {
                              BOOL v18 = 1;
                              goto LABEL_16;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(NETSchemaNETSessionConnectionNetwork *)self carrierName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  double v5 = [(NETSchemaNETSessionConnectionNetwork *)self primarySubflowInterfaceName];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  uint64_t v7 = v8;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v7 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_9:
      if ((has & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_17:
    if ((has & 0x800) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_18:
    if ((has & 0x1000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_19:
    if ((has & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_35:
  PBDataWriterWriteUint64Field();
  uint64_t v7 = v8;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_20:
    PBDataWriterWriteDoubleField();
    uint64_t v7 = v8;
  }
LABEL_21:
}

- (BOOL)readFrom:(id)a3
{
  return NETSchemaNETSessionConnectionNetworkReadFrom(self, (uint64_t)a3);
}

- (void)deleteClearChannelAssessmentScore
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasClearChannelAssessmentScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasClearChannelAssessmentScore
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setClearChannelAssessmentScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_double clearChannelAssessmentScore = a3;
}

- (void)deleteConnectionStartToTLSHandshake
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasConnectionStartToTLSHandshake:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasConnectionStartToTLSHandshake
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setConnectionStartToTLSHandshake:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unint64_t connectionStartToTLSHandshake = a3;
}

- (void)deleteConnectionStartToEstablishmentTime
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasConnectionStartToEstablishmentTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasConnectionStartToEstablishmentTime
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setConnectionStartToEstablishmentTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unint64_t connectionStartToEstablishmentTime = a3;
}

- (void)deleteConnectionEstablishmentTime
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasConnectionEstablishmentTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasConnectionEstablishmentTime
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setConnectionEstablishmentTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unint64_t connectionEstablishmentTime = a3;
}

- (void)deleteTlsHandshakeTime
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasTlsHandshakeTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTlsHandshakeTime
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setTlsHandshakeTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unint64_t tlsHandshakeTime = a3;
}

- (void)deleteTlsVersion
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasTlsVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTlsVersion
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTlsVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int tlsVersion = a3;
}

- (void)deleteDnsResolutionTime
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasDnsResolutionTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDnsResolutionTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setDnsResolutionTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_unint64_t dnsResolutionTime = a3;
}

- (void)deleteStartToDNSResolution
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasStartToDNSResolution:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStartToDNSResolution
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setStartToDNSResolution:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_unint64_t startToDNSResolution = a3;
}

- (void)deleteFirstByteTime
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasFirstByteTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFirstByteTime
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setFirstByteTime:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_unint64_t firstByteTime = a3;
}

- (void)deleteAttempCount
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasAttempCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasAttempCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAttempCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_unsigned int attempCount = a3;
}

- (void)deleteSnr
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasSnr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasSnr
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSnr:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_double snr = a3;
}

- (void)deleteRssi
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRssi
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRssi:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_double rssi = a3;
}

- (void)deleteIsCaptive
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasIsCaptive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasIsCaptive
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsCaptive:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int isCaptive = a3;
}

- (void)deletePrimarySubflowInterfaceName
{
}

- (BOOL)hasPrimarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName != 0;
}

- (void)deleteConnectionMethod
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasConnectionMethod:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasConnectionMethod
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setConnectionMethod:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int connectionMethod = a3;
}

- (void)deleteCarrierName
{
}

- (BOOL)hasCarrierName
{
  return self->_carrierName != 0;
}

@end
@interface KCellularFwCoreStats
- (BOOL)hasEutraStats;
- (BOOL)hasGeraStats;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasUtraFddStats;
- (BOOL)hasUtraTddStats;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (EutraStats)eutraStats;
- (GeraStats)geraStats;
- (UtraFddStats)utraFddStats;
- (UtraTddStats)utraTddStats;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEutraStats:(id)a3;
- (void)setGeraStats:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUtraFddStats:(id)a3;
- (void)setUtraTddStats:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularFwCoreStats

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGeraStats
{
  return self->_geraStats != 0;
}

- (BOOL)hasUtraFddStats
{
  return self->_utraFddStats != 0;
}

- (BOOL)hasUtraTddStats
{
  return self->_utraTddStats != 0;
}

- (BOOL)hasEutraStats
{
  return self->_eutraStats != 0;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularFwCoreStats;
  v4 = [(KCellularFwCoreStats *)&v8 description];
  v5 = [(KCellularFwCoreStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  geraStats = self->_geraStats;
  if (geraStats)
  {
    v6 = [(GeraStats *)geraStats dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"gera_stats"];
  }
  utraFddStats = self->_utraFddStats;
  if (utraFddStats)
  {
    objc_super v8 = [(UtraFddStats *)utraFddStats dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"utra_fdd_stats"];
  }
  utraTddStats = self->_utraTddStats;
  if (utraTddStats)
  {
    v10 = [(UtraTddStats *)utraTddStats dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"utra_tdd_stats"];
  }
  eutraStats = self->_eutraStats;
  if (eutraStats)
  {
    v12 = [(EutraStats *)eutraStats dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"eutra_stats"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v13 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularFwCoreStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_geraStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_utraFddStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_utraTddStats) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_eutraStats) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  v5 = v4;
  if (self->_geraStats)
  {
    objc_msgSend(v4, "setGeraStats:");
    id v4 = v5;
  }
  if (self->_utraFddStats)
  {
    objc_msgSend(v5, "setUtraFddStats:");
    id v4 = v5;
  }
  if (self->_utraTddStats)
  {
    objc_msgSend(v5, "setUtraTddStats:");
    id v4 = v5;
  }
  if (self->_eutraStats)
  {
    objc_msgSend(v5, "setEutraStats:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_subsId;
    *((unsigned char *)v4 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v7 = [(GeraStats *)self->_geraStats copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  id v9 = [(UtraFddStats *)self->_utraFddStats copyWithZone:a3];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  id v11 = [(UtraTddStats *)self->_utraTddStats copyWithZone:a3];
  v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  id v13 = [(EutraStats *)self->_eutraStats copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_subsId;
    *(unsigned char *)(v6 + 56) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  geraStats = self->_geraStats;
  if ((unint64_t)geraStats | *((void *)v4 + 3) && !-[GeraStats isEqual:](geraStats, "isEqual:")) {
    goto LABEL_19;
  }
  utraFddStats = self->_utraFddStats;
  if ((unint64_t)utraFddStats | *((void *)v4 + 5))
  {
    if (!-[UtraFddStats isEqual:](utraFddStats, "isEqual:")) {
      goto LABEL_19;
    }
  }
  utraTddStats = self->_utraTddStats;
  if ((unint64_t)utraTddStats | *((void *)v4 + 6))
  {
    if (!-[UtraTddStats isEqual:](utraTddStats, "isEqual:")) {
      goto LABEL_19;
    }
  }
  eutraStats = self->_eutraStats;
  if ((unint64_t)eutraStats | *((void *)v4 + 2))
  {
    if (!-[EutraStats isEqual:](eutraStats, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  unint64_t v4 = [(GeraStats *)self->_geraStats hash];
  unint64_t v5 = [(UtraFddStats *)self->_utraFddStats hash];
  unint64_t v6 = [(UtraTddStats *)self->_utraTddStats hash];
  unint64_t v7 = [(EutraStats *)self->_eutraStats hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if (v4[7])
  {
    self->_timestamp = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  geraStats = self->_geraStats;
  uint64_t v7 = v5[3];
  v14 = v5;
  if (geraStats)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[GeraStats mergeFrom:](geraStats, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[KCellularFwCoreStats setGeraStats:](self, "setGeraStats:");
  }
  unint64_t v5 = v14;
LABEL_9:
  utraFddStats = self->_utraFddStats;
  uint64_t v9 = v5[5];
  if (utraFddStats)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[UtraFddStats mergeFrom:](utraFddStats, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[KCellularFwCoreStats setUtraFddStats:](self, "setUtraFddStats:");
  }
  unint64_t v5 = v14;
LABEL_15:
  utraTddStats = self->_utraTddStats;
  uint64_t v11 = v5[6];
  if (utraTddStats)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[UtraTddStats mergeFrom:](utraTddStats, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[KCellularFwCoreStats setUtraTddStats:](self, "setUtraTddStats:");
  }
  unint64_t v5 = v14;
LABEL_21:
  eutraStats = self->_eutraStats;
  uint64_t v13 = v5[2];
  if (eutraStats)
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[EutraStats mergeFrom:](eutraStats, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    -[KCellularFwCoreStats setEutraStats:](self, "setEutraStats:");
  }
  unint64_t v5 = v14;
LABEL_27:
  if ((v5[7] & 2) != 0)
  {
    self->_subsId = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (GeraStats)geraStats
{
  return self->_geraStats;
}

- (void)setGeraStats:(id)a3
{
}

- (UtraFddStats)utraFddStats
{
  return self->_utraFddStats;
}

- (void)setUtraFddStats:(id)a3
{
}

- (UtraTddStats)utraTddStats
{
  return self->_utraTddStats;
}

- (void)setUtraTddStats:(id)a3
{
}

- (EutraStats)eutraStats
{
  return self->_eutraStats;
}

- (void)setEutraStats:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utraTddStats, 0);
  objc_storeStrong((id *)&self->_utraFddStats, 0);
  objc_storeStrong((id *)&self->_geraStats, 0);
  objc_storeStrong((id *)&self->_eutraStats, 0);
}

@end
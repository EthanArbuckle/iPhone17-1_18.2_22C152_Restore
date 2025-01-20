@interface RfBandDuration
- (BOOL)hasDurationMs;
- (BOOL)hasEutraRfBand;
- (BOOL)hasGeraRfBand;
- (BOOL)hasRat;
- (BOOL)hasUtraFddRfBand;
- (BOOL)hasUtraTddRfBand;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eutraRfBandAsString:(int)a3;
- (id)geraRfBandAsString:(int)a3;
- (id)ratAsString:(int)a3;
- (id)utraFddRfBandAsString:(int)a3;
- (id)utraTddRfBandAsString:(int)a3;
- (int)StringAsEutraRfBand:(id)a3;
- (int)StringAsGeraRfBand:(id)a3;
- (int)StringAsRat:(id)a3;
- (int)StringAsUtraFddRfBand:(id)a3;
- (int)StringAsUtraTddRfBand:(id)a3;
- (int)eutraRfBand;
- (int)geraRfBand;
- (int)rat;
- (int)utraFddRfBand;
- (int)utraTddRfBand;
- (unint64_t)hash;
- (unsigned)durationMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setEutraRfBand:(int)a3;
- (void)setGeraRfBand:(int)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasEutraRfBand:(BOOL)a3;
- (void)setHasGeraRfBand:(BOOL)a3;
- (void)setHasRat:(BOOL)a3;
- (void)setHasUtraFddRfBand:(BOOL)a3;
- (void)setHasUtraTddRfBand:(BOOL)a3;
- (void)setRat:(int)a3;
- (void)setUtraFddRfBand:(int)a3;
- (void)setUtraTddRfBand:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation RfBandDuration

- (int)rat
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_rat;
  }
  else {
    return 0;
  }
}

- (void)setRat:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_rat = a3;
}

- (void)setHasRat:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRat
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)ratAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6931418[a3];
  }
  return v3;
}

- (int)StringAsRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KCELLULAR_RAT_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KCELLULAR_RAT_GERA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KCELLULAR_RAT_UTRA_FDD"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KCELLULAR_RAT_EUTRA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KCELLULAR_RAT_UTRA_TDD"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)geraRfBand
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_geraRfBand;
  }
  else {
    return 0;
  }
}

- (void)setGeraRfBand:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_geraRfBand = a3;
}

- (void)setHasGeraRfBand:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGeraRfBand
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)geraRfBandAsString:(int)a3
{
  if (a3 >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6931440[a3];
  }
  return v3;
}

- (int)StringAsGeraRfBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KGSM_RF_BAND_900"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_P_900"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_E_900"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_R_900"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_DCS_1800"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_PCS_1900"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_850"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_450"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_480"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_750"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_T_380"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_T_410"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_T_900"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_710"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KGSM_RF_BAND_T_810"])
  {
    int v4 = 14;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)utraFddRfBand
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_utraFddRfBand;
  }
  else {
    return 0;
  }
}

- (void)setUtraFddRfBand:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_utraFddRfBand = a3;
}

- (void)setHasUtraFddRfBand:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUtraFddRfBand
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)utraFddRfBandAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E69314B8[a3];
  }
  return v3;
}

- (int)StringAsUtraFddRfBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KWCDMA_RF_BAND_1"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_2"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_3"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_4"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_5"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_6"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_7"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_8"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_9"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_10"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_11"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_12"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_13"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_14"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_15"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_16"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_17"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_18"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_19"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_20"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_21"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_22"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KWCDMA_RF_BAND_25"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)utraTddRfBand
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_utraTddRfBand;
  }
  else {
    return 0;
  }
}

- (void)setUtraTddRfBand:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_utraTddRfBand = a3;
}

- (void)setHasUtraTddRfBand:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUtraTddRfBand
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)utraTddRfBandAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6931570[a3];
  }
  return v3;
}

- (int)StringAsUtraTddRfBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KTDS_RF_BAND_A"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"KTDS_RF_BAND_E"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KTDS_RF_BAND_F"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)eutraRfBand
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_eutraRfBand;
  }
  else {
    return 1;
  }
}

- (void)setEutraRfBand:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eutraRfBand = a3;
}

- (void)setHasEutraRfBand:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEutraRfBand
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)eutraRfBandAsString:(int)a3
{
  if ((a3 - 1) >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E6931588[a3 - 1];
  }
  return v3;
}

- (int)StringAsEutraRfBand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"KLTE_RF_BAND_1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_3"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_4"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_5"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_6"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_7"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_8"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_9"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_10"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_11"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_12"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_13"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_14"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_15"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_16"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_17"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_18"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_19"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_20"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_21"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_22"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_23"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_24"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_25"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_26"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_27"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_28"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_29"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_30"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_31"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_32"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_33"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_34"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_35"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_36"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_37"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_38"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_39"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_40"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_41"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_42"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_43"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"KLTE_RF_BAND_44"])
  {
    int v4 = 44;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDurationMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)RfBandDuration;
  int v4 = [(RfBandDuration *)&v8 description];
  v5 = [(RfBandDuration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t rat = self->_rat;
    if (rat >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_rat);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E6931418[rat];
    }
    [v3 setObject:v8 forKey:@"rat"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t geraRfBand = self->_geraRfBand;
  if (geraRfBand >= 0xF)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_geraRfBand);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E6931440[geraRfBand];
  }
  [v3 setObject:v10 forKey:@"gera_rf_band"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_19:
  uint64_t utraFddRfBand = self->_utraFddRfBand;
  if (utraFddRfBand >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_utraFddRfBand);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E69314B8[utraFddRfBand];
  }
  [v3 setObject:v12 forKey:@"utra_fdd_rf_band"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_23:
  uint64_t utraTddRfBand = self->_utraTddRfBand;
  if (utraTddRfBand >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_utraTddRfBand);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E6931570[utraTddRfBand];
  }
  [v3 setObject:v14 forKey:@"utra_tdd_rf_band"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_27:
  unsigned int v15 = self->_eutraRfBand - 1;
  if (v15 >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eutraRfBand);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_1E6931588[v15];
  }
  [v3 setObject:v16 forKey:@"eutra_rf_band"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_7:
  v5 = [NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v5 forKey:@"duration_ms"];

LABEL_8:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return RfBandDurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[5] = self->_rat;
    *((unsigned char *)v4 + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_geraRfBand;
  *((unsigned char *)v4 + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v4[6] = self->_utraFddRfBand;
  *((unsigned char *)v4 + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v4[7] = self->_utraTddRfBand;
  *((unsigned char *)v4 + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v4[3] = self->_eutraRfBand;
  *((unsigned char *)v4 + 32) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_7:
    v4[2] = self->_durationMs;
    *((unsigned char *)v4 + 32) |= 1u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 5) = self->_rat;
    *((unsigned char *)result + 32) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_geraRfBand;
  *((unsigned char *)result + 32) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 6) = self->_utraFddRfBand;
  *((unsigned char *)result + 32) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_utraTddRfBand;
  *((unsigned char *)result + 32) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 3) = self->_eutraRfBand;
  *((unsigned char *)result + 32) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 2) = self->_durationMs;
  *((unsigned char *)result + 32) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_rat != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_geraRfBand != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x10) == 0 || self->_utraFddRfBand != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 0x20) == 0 || self->_utraTddRfBand != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_eutraRfBand != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_durationMs != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_rat;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_geraRfBand;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_utraFddRfBand;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_utraTddRfBand;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_eutraRfBand;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_durationMs;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 8) != 0)
  {
    self->_uint64_t rat = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t geraRfBand = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_uint64_t utraFddRfBand = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t utraTddRfBand = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_eutraRfBand = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_7:
    self->_durationMs = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_8:
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

@end
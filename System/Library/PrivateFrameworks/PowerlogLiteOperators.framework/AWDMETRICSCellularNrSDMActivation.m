@interface AWDMETRICSCellularNrSDMActivation
- (BOOL)apNrRecomm;
- (BOOL)apNrRecommConfFactor;
- (BOOL)fr1MeasDisabled;
- (BOOL)fr2MeasDisabled;
- (BOOL)hasApNrRecomm;
- (BOOL)hasApNrRecommConfFactor;
- (BOOL)hasCurrentRat;
- (BOOL)hasDeployment;
- (BOOL)hasDurationInPrevState;
- (BOOL)hasFr;
- (BOOL)hasFr1MeasDisabled;
- (BOOL)hasFr2MeasDisabled;
- (BOOL)hasNewState;
- (BOOL)hasPrevRat;
- (BOOL)hasPrevTriggerCause;
- (BOOL)hasSaVerdict;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentRatAsString:(int)a3;
- (id)deploymentAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)frAsString:(int)a3;
- (id)newStateAsString:(int)a3;
- (id)prevRatAsString:(int)a3;
- (id)prevTriggerCauseAsString:(int)a3;
- (id)saVerdictAsString:(int)a3;
- (id)triggerCauseAsString:(int)a3;
- (int)StringAsCurrentRat:(id)a3;
- (int)StringAsDeployment:(id)a3;
- (int)StringAsFr:(id)a3;
- (int)StringAsNewState:(id)a3;
- (int)StringAsPrevRat:(id)a3;
- (int)StringAsPrevTriggerCause:(id)a3;
- (int)StringAsSaVerdict:(id)a3;
- (int)StringAsTriggerCause:(id)a3;
- (int)currentRat;
- (int)deployment;
- (int)fr;
- (int)newState;
- (int)prevRat;
- (int)prevTriggerCause;
- (int)saVerdict;
- (int)triggerCause;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)durationInPrevState;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApNrRecomm:(BOOL)a3;
- (void)setApNrRecommConfFactor:(BOOL)a3;
- (void)setCurrentRat:(int)a3;
- (void)setDeployment:(int)a3;
- (void)setDurationInPrevState:(unsigned int)a3;
- (void)setFr1MeasDisabled:(BOOL)a3;
- (void)setFr2MeasDisabled:(BOOL)a3;
- (void)setFr:(int)a3;
- (void)setHasApNrRecomm:(BOOL)a3;
- (void)setHasApNrRecommConfFactor:(BOOL)a3;
- (void)setHasCurrentRat:(BOOL)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasDurationInPrevState:(BOOL)a3;
- (void)setHasFr1MeasDisabled:(BOOL)a3;
- (void)setHasFr2MeasDisabled:(BOOL)a3;
- (void)setHasFr:(BOOL)a3;
- (void)setHasNewState:(BOOL)a3;
- (void)setHasPrevRat:(BOOL)a3;
- (void)setHasPrevTriggerCause:(BOOL)a3;
- (void)setHasSaVerdict:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerCause:(BOOL)a3;
- (void)setNewState:(int)a3;
- (void)setPrevRat:(int)a3;
- (void)setPrevTriggerCause:(int)a3;
- (void)setSaVerdict:(int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularNrSDMActivation

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (int)deployment
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_deployment;
  }
  else {
    return 0;
  }
}

- (void)setDeployment:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeployment
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)deploymentAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929D98[a3];
  }
  return v3;
}

- (int)StringAsDeployment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEPLOYMENT_SA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DEPLOYMENT_NSA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DEPLOYMENT_NRDC"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setFr1MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_fr1MeasDisabled = a3;
}

- (void)setHasFr1MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFr1MeasDisabled
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setFr2MeasDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_fr2MeasDisabled = a3;
}

- (void)setHasFr2MeasDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasFr2MeasDisabled
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (int)triggerCause
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_triggerCause;
  }
  else {
    return 0;
  }
}

- (void)setTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929DB0[a3];
  }
  return v3;
}

- (int)StringAsTriggerCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AP_SLEEP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_CELLULAR_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_GOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOIP_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_COREMEDIA_STALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SCREEN_STATUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_UI_SWITCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_RLGS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_PHS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AVS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_LPM"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOLTE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_SNR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DCNR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_RLGS"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MT_DATA"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FTV_DUP"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_VOIP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ULD"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ENH_BUFF"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_ASSOCIATED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR_SL"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW_SL"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS_SL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_VONR_CON"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_THERMAL"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MAX"])
  {
    int v4 = 31;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)prevTriggerCause
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_prevTriggerCause;
  }
  else {
    return 0;
  }
}

- (void)setPrevTriggerCause:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_prevTriggerCause = a3;
}

- (void)setHasPrevTriggerCause:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPrevTriggerCause
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)prevTriggerCauseAsString:(int)a3
{
  if (a3 >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929DB0[a3];
  }
  return v3;
}

- (int)StringAsPrevTriggerCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AP_SLEEP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_CELLULAR_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_GOOD"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOIP_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_COREMEDIA_STALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SCREEN_STATUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_UI_SWITCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_RLGS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_PHS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AVS"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_LPM"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOLTE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_SNR"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DCNR"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FR1_SCG_RLGS"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MT_DATA"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_FTV_DUP"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_VOIP"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ULD"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_DROP_NR_ENH_BUFF"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_ASSOCIATED"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_BWP_SWITCH_TMR_SL"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_HI_BW_SL"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SA_UPGRADE_RLGS_SL"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_VONR_CON"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SADC_THERMAL"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MAX"])
  {
    int v4 = 31;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setApNrRecomm:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_apNrRecomm = a3;
}

- (void)setHasApNrRecomm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasApNrRecomm
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setApNrRecommConfFactor:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_apNrRecommConfFactor = a3;
}

- (void)setHasApNrRecommConfFactor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasApNrRecommConfFactor
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setDurationInPrevState:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationInPrevState = a3;
}

- (void)setHasDurationInPrevState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationInPrevState
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubsId
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)fr
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_fr;
  }
  else {
    return 0;
  }
}

- (void)setFr:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_fr = a3;
}

- (void)setHasFr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFr
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)frAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929EB0[a3];
  }
  return v3;
}

- (int)StringAsFr:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SUB6"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MMWAVE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALID"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)prevRat
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_prevRat;
  }
  else {
    return 0;
  }
}

- (void)setPrevRat:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_prevRat = a3;
}

- (void)setHasPrevRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPrevRat
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)prevRatAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929EC8[a3];
  }
  return v3;
}

- (int)StringAsPrevRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENDC_SUB6"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENDC_MMW"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR_SA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GSM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EVDO"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ONEXSRLTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ONEXHYBRID"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NRDC_SUB6"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRDC_MMW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)currentRat
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_currentRat;
  }
  else {
    return 0;
  }
}

- (void)setCurrentRat:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_currentRat = a3;
}

- (void)setHasCurrentRat:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCurrentRat
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)currentRatAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929EC8[a3];
  }
  return v3;
}

- (int)StringAsCurrentRat:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WCDMA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LTE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENDC_SUB6"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENDC_MMW"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NR_SA"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GSM"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMA"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EVDO"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ONEXSRLTE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ONEXHYBRID"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NRDC_SUB6"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRDC_MMW"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"MAX"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)newState
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_newState;
  }
  else {
    return 0;
  }
}

- (void)setNewState:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_newState = a3;
}

- (void)setHasNewState:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNewState
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)newStateAsString:(int)a3
{
  if (a3 < 8) {
    return off_1E6929F38[a3];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_DISABLE_SA"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_ENABLE_SA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_UNKNOWN_SA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_DISABLE_NR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_DISABLE_FR1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_DISABLE_FR2"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_ENABLE_NR"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_UNKNOWN_STATE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)saVerdict
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_saVerdict;
  }
  else {
    return 0;
  }
}

- (void)setSaVerdict:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_saVerdict = a3;
}

- (void)setHasSaVerdict:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSaVerdict
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)saVerdictAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E6929F78[a3];
  }
  return v3;
}

- (int)StringAsSaVerdict:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DISABLEMENT_WITH_RAT_CHANGE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISABLEMENT_WITHOUT_RAT_CHANGE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DISABLEMENT_NOT_RELEVANT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ENABLEMENT_WITH_RAT_CHANGE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ENABLEMENT_WITHOUT_RAT_CHANGE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ENABLEMENT_NOT_RELEVANT"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularNrSDMActivation;
  int v4 = [(AWDMETRICSCellularNrSDMActivation *)&v8 description];
  v5 = [(AWDMETRICSCellularNrSDMActivation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t deployment = self->_deployment;
  if (deployment >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deployment);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E6929D98[deployment];
  }
  [v3 setObject:v7 forKey:@"deployment"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_4:
    if ((has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  objc_super v8 = [NSNumber numberWithBool:self->_fr1MeasDisabled];
  [v3 setObject:v8 forKey:@"fr1_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_5:
    if ((has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  v9 = [NSNumber numberWithBool:self->_fr2MeasDisabled];
  [v3 setObject:v9 forKey:@"fr2_meas_disabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_24:
  uint64_t triggerCause = self->_triggerCause;
  if (triggerCause >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerCause);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E6929DB0[triggerCause];
  }
  [v3 setObject:v11 forKey:@"trigger_cause"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_28:
  uint64_t prevTriggerCause = self->_prevTriggerCause;
  if (prevTriggerCause >= 0x20)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevTriggerCause);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E6929DB0[prevTriggerCause];
  }
  [v3 setObject:v13 forKey:@"prev_trigger_cause"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_8:
    if ((has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  v14 = [NSNumber numberWithBool:self->_apNrRecomm];
  [v3 setObject:v14 forKey:@"ap_nr_recomm"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  v15 = [NSNumber numberWithBool:self->_apNrRecommConfFactor];
  [v3 setObject:v15 forKey:@"ap_nr_recomm_conf_factor"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  v16 = [NSNumber numberWithUnsignedInt:self->_durationInPrevState];
  [v3 setObject:v16 forKey:@"duration_in_prev_state"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  v17 = [NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v17 forKey:@"subs_id"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_36:
  uint64_t fr = self->_fr;
  if (fr >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_fr);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = off_1E6929EB0[fr];
  }
  [v3 setObject:v19 forKey:@"fr"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_40:
  uint64_t prevRat = self->_prevRat;
  if (prevRat >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_prevRat);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = off_1E6929EC8[prevRat];
  }
  [v3 setObject:v21 forKey:@"prev_rat"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_44:
  uint64_t currentRat = self->_currentRat;
  if (currentRat >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_currentRat);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = off_1E6929EC8[currentRat];
  }
  [v3 setObject:v23 forKey:@"current_rat"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_56;
    }
    goto LABEL_52;
  }
LABEL_48:
  uint64_t newState = self->_newState;
  if (newState >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newState);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_1E6929F38[newState];
  }
  [v3 setObject:v25 forKey:@"new_state"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_52:
    uint64_t saVerdict = self->_saVerdict;
    if (saVerdict >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_saVerdict);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_1E6929F78[saVerdict];
    }
    [v3 setObject:v27 forKey:@"sa_verdict"];
  }
LABEL_56:
  id v28 = v3;

  return v28;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularNrSDMActivationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_16:
  }
    PBDataWriterWriteInt32Field();
LABEL_17:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 58) = self->_fr1MeasDisabled;
  *((_WORD *)v4 + 30) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 59) = self->_fr2MeasDisabled;
  *((_WORD *)v4 + 30) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 13) = self->_triggerCause;
  *((_WORD *)v4 + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 56) = self->_apNrRecomm;
  *((_WORD *)v4 + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 57) = self->_apNrRecommConfFactor;
  *((_WORD *)v4 + 30) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 6) = self->_durationInPrevState;
  *((_WORD *)v4 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 12) = self->_subsId;
  *((_WORD *)v4 + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)v4 + 7) = self->_fr;
  *((_WORD *)v4 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 5) = self->_deployment;
  *((_WORD *)v4 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)v4 + 9) = self->_prevRat;
  *((_WORD *)v4 + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 4) = self->_currentRat;
  *((_WORD *)v4 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 10) = self->_prevTriggerCause;
  *((_WORD *)v4 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  *((_DWORD *)v4 + 8) = self->_newState;
  *((_WORD *)v4 + 30) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 11) = self->_saVerdict;
    *((_WORD *)v4 + 30) |= 0x100u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_WORD *)result + 30) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x2000) == 0)
    {
LABEL_3:
      if ((has & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 58) = self->_fr1MeasDisabled;
  *((_WORD *)result + 30) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)result + 59) = self->_fr2MeasDisabled;
  *((_WORD *)result + 30) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 13) = self->_triggerCause;
  *((_WORD *)result + 30) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)result + 56) = self->_apNrRecomm;
  *((_WORD *)result + 30) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)result + 57) = self->_apNrRecommConfFactor;
  *((_WORD *)result + 30) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 6) = self->_durationInPrevState;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 12) = self->_subsId;
  *((_WORD *)result + 30) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)result + 7) = self->_fr;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)result + 5) = self->_deployment;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)result + 9) = self->_prevRat;
  *((_WORD *)result + 30) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)result + 4) = self->_currentRat;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)result + 10) = self->_prevTriggerCause;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x100) == 0) {
      return result;
    }
    goto LABEL_16;
  }
LABEL_31:
  *((_DWORD *)result + 8) = self->_newState;
  *((_WORD *)result + 30) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    return result;
  }
LABEL_16:
  *((_DWORD *)result + 11) = self->_saVerdict;
  *((_WORD *)result + 30) |= 0x100u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_89;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 30);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_89;
    }
  }
  else if (v6)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x2000) == 0) {
      goto LABEL_89;
    }
    if (self->_fr1MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_89;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x2000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x4000) == 0) {
      goto LABEL_89;
    }
    if (self->_fr2MeasDisabled)
    {
      if (!*((unsigned char *)v4 + 59)) {
        goto LABEL_89;
      }
    }
    else if (*((unsigned char *)v4 + 59))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x4000) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x400) == 0 || self->_triggerCause != *((_DWORD *)v4 + 13)) {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x400) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x800) == 0) {
      goto LABEL_89;
    }
    if (self->_apNrRecomm)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_89;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x800) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x1000) != 0)
    {
      if (self->_apNrRecommConfFactor)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_89;
        }
        goto LABEL_44;
      }
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_44;
      }
    }
LABEL_89:
    BOOL v7 = 0;
    goto LABEL_90;
  }
  if ((*((_WORD *)v4 + 30) & 0x1000) != 0) {
    goto LABEL_89;
  }
LABEL_44:
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_durationInPrevState != *((_DWORD *)v4 + 6)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x200) == 0 || self->_subsId != *((_DWORD *)v4 + 12)) {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x200) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_fr != *((_DWORD *)v4 + 7)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_deployment != *((_DWORD *)v4 + 5)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_prevRat != *((_DWORD *)v4 + 9)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_currentRat != *((_DWORD *)v4 + 4)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_prevTriggerCause != *((_DWORD *)v4 + 10)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_89;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_newState != *((_DWORD *)v4 + 8)) {
      goto LABEL_89;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_89;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 30) & 0x100) == 0 || self->_saVerdict != *((_DWORD *)v4 + 11)) {
      goto LABEL_89;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x100) == 0;
  }
LABEL_90:

  return v7;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_fr1MeasDisabled;
      if ((*(_WORD *)&self->_has & 0x4000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_fr2MeasDisabled;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_triggerCause;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_apNrRecomm;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_apNrRecommConfFactor;
    if ((has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_durationInPrevState;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_subsId;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v10 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_fr;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_deployment;
    if ((has & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_prevRat;
    if ((has & 2) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v13 = 0;
  if ((has & 2) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_currentRat;
    if ((has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_prevTriggerCause;
    if ((has & 0x20) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_16;
    }
LABEL_31:
    uint64_t v17 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_29:
  uint64_t v15 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v16 = 2654435761 * self->_newState;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_31;
  }
LABEL_16:
  uint64_t v17 = 2654435761 * self->_saVerdict;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 30);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 30);
    if ((v5 & 0x2000) == 0)
    {
LABEL_3:
      if ((v5 & 0x4000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*((_WORD *)v4 + 30) & 0x2000) == 0)
  {
    goto LABEL_3;
  }
  self->_fr1MeasDisabled = *((unsigned char *)v4 + 58);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x4000) == 0)
  {
LABEL_4:
    if ((v5 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_fr2MeasDisabled = *((unsigned char *)v4 + 59);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x400) == 0)
  {
LABEL_5:
    if ((v5 & 0x800) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_uint64_t triggerCause = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x800) == 0)
  {
LABEL_6:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_apNrRecomm = *((unsigned char *)v4 + 56);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x1000) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_apNrRecommConfFactor = *((unsigned char *)v4 + 57);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_durationInPrevState = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_subsId = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_uint64_t fr = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_uint64_t deployment = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_uint64_t prevRat = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_uint64_t currentRat = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_uint64_t prevTriggerCause = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 30);
  if ((v5 & 0x20) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_33:
  self->_uint64_t newState = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 30) & 0x100) != 0)
  {
LABEL_16:
    self->_uint64_t saVerdict = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_17:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)fr1MeasDisabled
{
  return self->_fr1MeasDisabled;
}

- (BOOL)fr2MeasDisabled
{
  return self->_fr2MeasDisabled;
}

- (BOOL)apNrRecomm
{
  return self->_apNrRecomm;
}

- (BOOL)apNrRecommConfFactor
{
  return self->_apNrRecommConfFactor;
}

- (unsigned)durationInPrevState
{
  return self->_durationInPrevState;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end
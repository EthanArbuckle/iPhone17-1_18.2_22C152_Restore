@interface PeoplePredictionDataFeature
- (BOOL)hasEventVolumeToComputeFeature;
- (BOOL)hasFeatureFreshnessInHours;
- (BOOL)hasFeatureItselfVersion;
- (BOOL)hasFeatureName;
- (BOOL)hasFeatureValue;
- (BOOL)hasTimeSpentToComputeFeature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PeoplePredictionDataFeatureValue)featureValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureNameAsString:(int)a3;
- (int)StringAsFeatureName:(id)a3;
- (int)featureName;
- (unint64_t)hash;
- (unsigned)eventVolumeToComputeFeature;
- (unsigned)featureFreshnessInHours;
- (unsigned)featureItselfVersion;
- (unsigned)timeSpentToComputeFeature;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEventVolumeToComputeFeature:(unsigned int)a3;
- (void)setFeatureFreshnessInHours:(unsigned int)a3;
- (void)setFeatureItselfVersion:(unsigned int)a3;
- (void)setFeatureName:(int)a3;
- (void)setFeatureValue:(id)a3;
- (void)setHasEventVolumeToComputeFeature:(BOOL)a3;
- (void)setHasFeatureFreshnessInHours:(BOOL)a3;
- (void)setHasFeatureItselfVersion:(BOOL)a3;
- (void)setHasFeatureName:(BOOL)a3;
- (void)setHasTimeSpentToComputeFeature:(BOOL)a3;
- (void)setTimeSpentToComputeFeature:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeoplePredictionDataFeature

- (int)featureName
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_featureName;
  }
  else {
    return 0;
  }
}

- (void)setFeatureName:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_featureName = a3;
}

- (void)setHasFeatureName:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasFeatureName
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)featureNameAsString:(int)a3
{
  if (a3 >= 0x2C6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26547C638[a3];
  }

  return v3;
}

- (int)StringAsFeatureName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"FeatureNameUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"textInteractionsSent"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"textInteractionsReceived"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"shareInteractionsSent"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"highConfidenceRuleCount"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"mediumConfidenceRuleCount"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"lowConfidenceRuleCount"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLast3Months"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastWeek"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLast6Months"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastMonth"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastDay"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLast3Months"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastWeek"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLast6Months"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastMonth"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastDay"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLast3Months"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastWeek"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLast6Months"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastMonth"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastDay"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLast3Months"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastWeek"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLast6Months"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastMonth"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastDay"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLast3Months"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastWeek"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLast6Months"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastMonth"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastDay"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLast3Months"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastWeek"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLast6Months"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastMonth"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastDay"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInA3Months"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInAWeek"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInA6Months"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInAMonth"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInADay"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInA3Months"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInAWeek"])
  {
    int v4 = 43;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInA6Months"])
  {
    int v4 = 44;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInAMonth"])
  {
    int v4 = 45;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInADay"])
  {
    int v4 = 46;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInA3Months"])
  {
    int v4 = 47;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInAWeek"])
  {
    int v4 = 48;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInA6Months"])
  {
    int v4 = 49;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInAMonth"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInADay"])
  {
    int v4 = 51;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInA3Months"])
  {
    int v4 = 52;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInAWeek"])
  {
    int v4 = 53;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInA6Months"])
  {
    int v4 = 54;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInAMonth"])
  {
    int v4 = 55;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInADay"])
  {
    int v4 = 56;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInA3Months"])
  {
    int v4 = 57;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInAWeek"])
  {
    int v4 = 58;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInA6Months"])
  {
    int v4 = 59;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInAMonth"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInADay"])
  {
    int v4 = 61;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInA3Months"])
  {
    int v4 = 62;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInAWeek"])
  {
    int v4 = 63;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInA6Months"])
  {
    int v4 = 64;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInAMonth"])
  {
    int v4 = 65;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInADay"])
  {
    int v4 = 66;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingCallInTheLast3Months"])
  {
    int v4 = 67;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingCallInTheLastWeek"])
  {
    int v4 = 68;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingCallInTheLast6Months"])
  {
    int v4 = 69;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingCallInTheLastMonth"])
  {
    int v4 = 70;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingCallInTheLastDay"])
  {
    int v4 = 71;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMeetingInTheLast3Months"])
  {
    int v4 = 72;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMeetingInTheLastWeek"])
  {
    int v4 = 73;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMeetingInTheLast6Months"])
  {
    int v4 = 74;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMeetingInTheLastMonth"])
  {
    int v4 = 75;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMeetingInTheLastDay"])
  {
    int v4 = 76;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingShareInTheLast3Months"])
  {
    int v4 = 77;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingShareInTheLastWeek"])
  {
    int v4 = 78;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingShareInTheLast6Months"])
  {
    int v4 = 79;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingShareInTheLastMonth"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingShareInTheLastDay"])
  {
    int v4 = 81;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingFaceTimeInTheLast3Months"])
  {
    int v4 = 82;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingFaceTimeInTheLastWeek"])
  {
    int v4 = 83;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingFaceTimeInTheLast6Months"])
  {
    int v4 = 84;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingFaceTimeInTheLastMonth"])
  {
    int v4 = 85;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingFaceTimeInTheLastDay"])
  {
    int v4 = 86;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingTextInTheLast3Months"])
  {
    int v4 = 87;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingTextInTheLastWeek"])
  {
    int v4 = 88;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingTextInTheLast6Months"])
  {
    int v4 = 89;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingTextInTheLastMonth"])
  {
    int v4 = 90;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingTextInTheLastDay"])
  {
    int v4 = 91;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMailInTheLast3Months"])
  {
    int v4 = 92;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMailInTheLastWeek"])
  {
    int v4 = 93;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMailInTheLast6Months"])
  {
    int v4 = 94;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMailInTheLastMonth"])
  {
    int v4 = 95;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueOutgoingMailInTheLastDay"])
  {
    int v4 = 96;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingCallInTheLast3Months"])
  {
    int v4 = 97;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingCallInTheLastWeek"])
  {
    int v4 = 98;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingCallInTheLast6Months"])
  {
    int v4 = 99;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingCallInTheLastMonth"])
  {
    int v4 = 100;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingCallInTheLastDay"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMeetingInTheLast3Months"])
  {
    int v4 = 102;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMeetingInTheLastWeek"])
  {
    int v4 = 103;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMeetingInTheLast6Months"])
  {
    int v4 = 104;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMeetingInTheLastMonth"])
  {
    int v4 = 105;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMeetingInTheLastDay"])
  {
    int v4 = 106;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingShareInTheLast3Months"])
  {
    int v4 = 107;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingShareInTheLastWeek"])
  {
    int v4 = 108;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingShareInTheLast6Months"])
  {
    int v4 = 109;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingShareInTheLastMonth"])
  {
    int v4 = 110;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingShareInTheLastDay"])
  {
    int v4 = 111;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingFaceTimeInTheLast3Months"])
  {
    int v4 = 112;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingFaceTimeInTheLastWeek"])
  {
    int v4 = 113;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingFaceTimeInTheLast6Months"])
  {
    int v4 = 114;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingFaceTimeInTheLastMonth"])
  {
    int v4 = 115;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingFaceTimeInTheLastDay"])
  {
    int v4 = 116;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingTextInTheLast3Months"])
  {
    int v4 = 117;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingTextInTheLastWeek"])
  {
    int v4 = 118;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingTextInTheLast6Months"])
  {
    int v4 = 119;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingTextInTheLastMonth"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingTextInTheLastDay"])
  {
    int v4 = 121;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMailInTheLast3Months"])
  {
    int v4 = 122;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMailInTheLastWeek"])
  {
    int v4 = 123;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMailInTheLast6Months"])
  {
    int v4 = 124;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMailInTheLastMonth"])
  {
    int v4 = 125;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueOutgoingMailInTheLastDay"])
  {
    int v4 = 126;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueConversationsSharedToInTheLast3Months"])
  {
    int v4 = 127;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueConversationsSharedToInTheLastWeek"])
  {
    int v4 = 128;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueConversationsSharedToInTheLast6Months"])
  {
    int v4 = 129;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueConversationsSharedToInTheLastMonth"])
  {
    int v4 = 130;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueConversationsSharedToInTheLastDay"])
  {
    int v4 = 131;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueUTISharedToInTheLast3Months"])
  {
    int v4 = 132;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueUTISharedToInTheLastWeek"])
  {
    int v4 = 133;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueUTISharedToInTheLast6Months"])
  {
    int v4 = 134;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueUTISharedToInTheLastMonth"])
  {
    int v4 = 135;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueUTISharedToInTheLastDay"])
  {
    int v4 = 136;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLTopLevelDomainSharedToInTheLast3Months"])
  {
    int v4 = 137;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLTopLevelDomainSharedToInTheLastWeek"])
  {
    int v4 = 138;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLTopLevelDomainSharedToInTheLast6Months"])
  {
    int v4 = 139;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLTopLevelDomainSharedToInTheLastMonth"])
  {
    int v4 = 140;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLTopLevelDomainSharedToInTheLastDay"])
  {
    int v4 = 141;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTransportsSharedToInTheLast3Months"])
  {
    int v4 = 142;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTransportsSharedToInTheLastWeek"])
  {
    int v4 = 143;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTransportsSharedToInTheLast6Months"])
  {
    int v4 = 144;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTransportsSharedToInTheLastMonth"])
  {
    int v4 = 145;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTransportsSharedToInTheLastDay"])
  {
    int v4 = 146;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueIsWeekendSharedToInTheLast3Months"])
  {
    int v4 = 147;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueIsWeekendSharedToInTheLastWeek"])
  {
    int v4 = 148;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueIsWeekendSharedToInTheLast6Months"])
  {
    int v4 = 149;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueIsWeekendSharedToInTheLastMonth"])
  {
    int v4 = 150;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueIsWeekendSharedToInTheLastDay"])
  {
    int v4 = 151;
  }
  else if ([v3 isEqualToString:@"numberOfUniquePersonUUIDSetSharedToInTheLast3Months"])
  {
    int v4 = 152;
  }
  else if ([v3 isEqualToString:@"numberOfUniquePersonUUIDSetSharedToInTheLastWeek"])
  {
    int v4 = 153;
  }
  else if ([v3 isEqualToString:@"numberOfUniquePersonUUIDSetSharedToInTheLast6Months"])
  {
    int v4 = 154;
  }
  else if ([v3 isEqualToString:@"numberOfUniquePersonUUIDSetSharedToInTheLastMonth"])
  {
    int v4 = 155;
  }
  else if ([v3 isEqualToString:@"numberOfUniquePersonUUIDSetSharedToInTheLastDay"])
  {
    int v4 = 156;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueMemeUUIDSetSharedToInTheLast3Months"])
  {
    int v4 = 157;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueMemeUUIDSetSharedToInTheLastWeek"])
  {
    int v4 = 158;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueMemeUUIDSetSharedToInTheLast6Months"])
  {
    int v4 = 159;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueMemeUUIDSetSharedToInTheLastMonth"])
  {
    int v4 = 160;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueMemeUUIDSetSharedToInTheLastDay"])
  {
    int v4 = 161;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLScreenTimeCategorySharedToInTheLast3Months"])
  {
    int v4 = 162;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLScreenTimeCategorySharedToInTheLastWeek"])
  {
    int v4 = 163;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLScreenTimeCategorySharedToInTheLast6Months"])
  {
    int v4 = 164;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLScreenTimeCategorySharedToInTheLastMonth"])
  {
    int v4 = 165;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueURLScreenTimeCategorySharedToInTheLastDay"])
  {
    int v4 = 166;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueLocationUUIDSharedToInTheLast3Months"])
  {
    int v4 = 167;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueLocationUUIDSharedToInTheLastWeek"])
  {
    int v4 = 168;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueLocationUUIDSharedToInTheLast6Months"])
  {
    int v4 = 169;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueLocationUUIDSharedToInTheLastMonth"])
  {
    int v4 = 170;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueLocationUUIDSharedToInTheLastDay"])
  {
    int v4 = 171;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueDayOfWeekSharedToInTheLast3Months"])
  {
    int v4 = 172;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueDayOfWeekSharedToInTheLastWeek"])
  {
    int v4 = 173;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueDayOfWeekSharedToInTheLast6Months"])
  {
    int v4 = 174;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueDayOfWeekSharedToInTheLastMonth"])
  {
    int v4 = 175;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueDayOfWeekSharedToInTheLastDay"])
  {
    int v4 = 176;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSourceAppSharedToInTheLast3Months"])
  {
    int v4 = 177;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSourceAppSharedToInTheLastWeek"])
  {
    int v4 = 178;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSourceAppSharedToInTheLast6Months"])
  {
    int v4 = 179;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSourceAppSharedToInTheLastMonth"])
  {
    int v4 = 180;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSourceAppSharedToInTheLastDay"])
  {
    int v4 = 181;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSceneUUIDSetSharedToInTheLast3Months"])
  {
    int v4 = 182;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSceneUUIDSetSharedToInTheLastWeek"])
  {
    int v4 = 183;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSceneUUIDSetSharedToInTheLast6Months"])
  {
    int v4 = 184;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSceneUUIDSetSharedToInTheLastMonth"])
  {
    int v4 = 185;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueSceneUUIDSetSharedToInTheLastDay"])
  {
    int v4 = 186;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTextTopicSetSharedToInTheLast3Months"])
  {
    int v4 = 187;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTextTopicSetSharedToInTheLastWeek"])
  {
    int v4 = 188;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTextTopicSetSharedToInTheLast6Months"])
  {
    int v4 = 189;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTextTopicSetSharedToInTheLastMonth"])
  {
    int v4 = 190;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueTextTopicSetSharedToInTheLastDay"])
  {
    int v4 = 191;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueHourOfDaySlotSharedToInTheLast3Months"])
  {
    int v4 = 192;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueHourOfDaySlotSharedToInTheLastWeek"])
  {
    int v4 = 193;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueHourOfDaySlotSharedToInTheLast6Months"])
  {
    int v4 = 194;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueHourOfDaySlotSharedToInTheLastMonth"])
  {
    int v4 = 195;
  }
  else if ([v3 isEqualToString:@"numberOfUniqueHourOfDaySlotSharedToInTheLastDay"])
  {
    int v4 = 196;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueConversationsSharedToInA3Months"])
  {
    int v4 = 197;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueConversationsSharedToInAWeek"])
  {
    int v4 = 198;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueConversationsSharedToInA6Months"])
  {
    int v4 = 199;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueConversationsSharedToInAMonth"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueConversationsSharedToInADay"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueUTISharedToInA3Months"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueUTISharedToInAWeek"])
  {
    int v4 = 203;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueUTISharedToInA6Months"])
  {
    int v4 = 204;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueUTISharedToInAMonth"])
  {
    int v4 = 205;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueUTISharedToInADay"])
  {
    int v4 = 206;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLTopLevelDomainSharedToInA3Months"])
  {
    int v4 = 207;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLTopLevelDomainSharedToInAWeek"])
  {
    int v4 = 208;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLTopLevelDomainSharedToInA6Months"])
  {
    int v4 = 209;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLTopLevelDomainSharedToInAMonth"])
  {
    int v4 = 210;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLTopLevelDomainSharedToInADay"])
  {
    int v4 = 211;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTransportsSharedToInA3Months"])
  {
    int v4 = 212;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTransportsSharedToInAWeek"])
  {
    int v4 = 213;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTransportsSharedToInA6Months"])
  {
    int v4 = 214;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTransportsSharedToInAMonth"])
  {
    int v4 = 215;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTransportsSharedToInADay"])
  {
    int v4 = 216;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueIsWeekendSharedToInA3Months"])
  {
    int v4 = 217;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueIsWeekendSharedToInAWeek"])
  {
    int v4 = 218;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueIsWeekendSharedToInA6Months"])
  {
    int v4 = 219;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueIsWeekendSharedToInAMonth"])
  {
    int v4 = 220;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueIsWeekendSharedToInADay"])
  {
    int v4 = 221;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniquePersonUUIDSetSharedToInA3Months"])
  {
    int v4 = 222;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniquePersonUUIDSetSharedToInAWeek"])
  {
    int v4 = 223;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniquePersonUUIDSetSharedToInA6Months"])
  {
    int v4 = 224;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniquePersonUUIDSetSharedToInAMonth"])
  {
    int v4 = 225;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniquePersonUUIDSetSharedToInADay"])
  {
    int v4 = 226;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueMemeUUIDSetSharedToInA3Months"])
  {
    int v4 = 227;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueMemeUUIDSetSharedToInAWeek"])
  {
    int v4 = 228;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueMemeUUIDSetSharedToInA6Months"])
  {
    int v4 = 229;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueMemeUUIDSetSharedToInAMonth"])
  {
    int v4 = 230;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueMemeUUIDSetSharedToInADay"])
  {
    int v4 = 231;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLScreenTimeCategorySharedToInA3Months"])
  {
    int v4 = 232;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLScreenTimeCategorySharedToInAWeek"])
  {
    int v4 = 233;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLScreenTimeCategorySharedToInA6Months"])
  {
    int v4 = 234;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLScreenTimeCategorySharedToInAMonth"])
  {
    int v4 = 235;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueURLScreenTimeCategorySharedToInADay"])
  {
    int v4 = 236;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueLocationUUIDSharedToInA3Months"])
  {
    int v4 = 237;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueLocationUUIDSharedToInAWeek"])
  {
    int v4 = 238;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueLocationUUIDSharedToInA6Months"])
  {
    int v4 = 239;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueLocationUUIDSharedToInAMonth"])
  {
    int v4 = 240;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueLocationUUIDSharedToInADay"])
  {
    int v4 = 241;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueDayOfWeekSharedToInA3Months"])
  {
    int v4 = 242;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueDayOfWeekSharedToInAWeek"])
  {
    int v4 = 243;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueDayOfWeekSharedToInA6Months"])
  {
    int v4 = 244;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueDayOfWeekSharedToInAMonth"])
  {
    int v4 = 245;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueDayOfWeekSharedToInADay"])
  {
    int v4 = 246;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSourceAppSharedToInA3Months"])
  {
    int v4 = 247;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSourceAppSharedToInAWeek"])
  {
    int v4 = 248;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSourceAppSharedToInA6Months"])
  {
    int v4 = 249;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSourceAppSharedToInAMonth"])
  {
    int v4 = 250;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSourceAppSharedToInADay"])
  {
    int v4 = 251;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSceneUUIDSetSharedToInA3Months"])
  {
    int v4 = 252;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSceneUUIDSetSharedToInAWeek"])
  {
    int v4 = 253;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSceneUUIDSetSharedToInA6Months"])
  {
    int v4 = 254;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSceneUUIDSetSharedToInAMonth"])
  {
    int v4 = 255;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueSceneUUIDSetSharedToInADay"])
  {
    int v4 = 256;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTextTopicSetSharedToInA3Months"])
  {
    int v4 = 257;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTextTopicSetSharedToInAWeek"])
  {
    int v4 = 258;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTextTopicSetSharedToInA6Months"])
  {
    int v4 = 259;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTextTopicSetSharedToInAMonth"])
  {
    int v4 = 260;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueTextTopicSetSharedToInADay"])
  {
    int v4 = 261;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueHourOfDaySlotSharedToInA3Months"])
  {
    int v4 = 262;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueHourOfDaySlotSharedToInAWeek"])
  {
    int v4 = 263;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueHourOfDaySlotSharedToInA6Months"])
  {
    int v4 = 264;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueHourOfDaySlotSharedToInAMonth"])
  {
    int v4 = 265;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUniqueHourOfDaySlotSharedToInADay"])
  {
    int v4 = 266;
  }
  else if ([v3 isEqualToString:@"installedAppCount"])
  {
    int v4 = 267;
  }
  else if ([v3 isEqualToString:@"numberOfUsedAppsInTheLast3Months"])
  {
    int v4 = 268;
  }
  else if ([v3 isEqualToString:@"numberOfUsedAppsInTheLastWeek"])
  {
    int v4 = 269;
  }
  else if ([v3 isEqualToString:@"numberOfUsedAppsInTheLast6Months"])
  {
    int v4 = 270;
  }
  else if ([v3 isEqualToString:@"numberOfUsedAppsInTheLastMonth"])
  {
    int v4 = 271;
  }
  else if ([v3 isEqualToString:@"numberOfUsedAppsInTheLastDay"])
  {
    int v4 = 272;
  }
  else if ([v3 isEqualToString:@"numberOfDailyUsedAppsInTheLast3Months"])
  {
    int v4 = 273;
  }
  else if ([v3 isEqualToString:@"numberOfDailyUsedAppsInTheLastWeek"])
  {
    int v4 = 274;
  }
  else if ([v3 isEqualToString:@"numberOfDailyUsedAppsInTheLast6Months"])
  {
    int v4 = 275;
  }
  else if ([v3 isEqualToString:@"numberOfDailyUsedAppsInTheLastMonth"])
  {
    int v4 = 276;
  }
  else if ([v3 isEqualToString:@"numberOfDailyUsedAppsInTheLastDay"])
  {
    int v4 = 277;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUsedAppsInA3Months"])
  {
    int v4 = 278;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUsedAppsInAWeek"])
  {
    int v4 = 279;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUsedAppsInA6Months"])
  {
    int v4 = 280;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUsedAppsInAMonth"])
  {
    int v4 = 281;
  }
  else if ([v3 isEqualToString:@"avgNumberOfUsedAppsInADay"])
  {
    int v4 = 282;
  }
  else if ([v3 isEqualToString:@"avgNumberOfDailyUsedAppsIn3Months"])
  {
    int v4 = 283;
  }
  else if ([v3 isEqualToString:@"avgNumberOfDailyUsedAppsInWeek"])
  {
    int v4 = 284;
  }
  else if ([v3 isEqualToString:@"avgNumberOfDailyUsedAppsIn6Months"])
  {
    int v4 = 285;
  }
  else if ([v3 isEqualToString:@"avgNumberOfDailyUsedAppsInMonth"])
  {
    int v4 = 286;
  }
  else if ([v3 isEqualToString:@"avgNumberOfDailyUsedAppsInDay"])
  {
    int v4 = 287;
  }
  else if ([v3 isEqualToString:@"screenTimeInTheLast3Months"])
  {
    int v4 = 288;
  }
  else if ([v3 isEqualToString:@"screenTimeInTheLastWeek"])
  {
    int v4 = 289;
  }
  else if ([v3 isEqualToString:@"screenTimeInTheLast6Months"])
  {
    int v4 = 290;
  }
  else if ([v3 isEqualToString:@"screenTimeInTheLastMonth"])
  {
    int v4 = 291;
  }
  else if ([v3 isEqualToString:@"screenTimeInTheLastDay"])
  {
    int v4 = 292;
  }
  else if ([v3 isEqualToString:@"avgScreenTimeInA3Months"])
  {
    int v4 = 293;
  }
  else if ([v3 isEqualToString:@"avgScreenTimeInAWeek"])
  {
    int v4 = 294;
  }
  else if ([v3 isEqualToString:@"avgScreenTimeInA6Months"])
  {
    int v4 = 295;
  }
  else if ([v3 isEqualToString:@"avgScreenTimeInAMonth"])
  {
    int v4 = 296;
  }
  else if ([v3 isEqualToString:@"avgScreenTimeInADay"])
  {
    int v4 = 297;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAt1InTheLast3Months"])
  {
    int v4 = 298;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAt1InTheLastWeek"])
  {
    int v4 = 299;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAt1InTheLast6Months"])
  {
    int v4 = 300;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAt1InTheLastMonth"])
  {
    int v4 = 301;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAt1InTheLastDay"])
  {
    int v4 = 302;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAtVisibleInTheLast3Months"])
  {
    int v4 = 303;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAtVisibleInTheLastWeek"])
  {
    int v4 = 304;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAtVisibleInTheLast6Months"])
  {
    int v4 = 305;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAtVisibleInTheLastMonth"])
  {
    int v4 = 306;
  }
  else if ([v3 isEqualToString:@"sharingHitRatioAtVisibleInTheLastDay"])
  {
    int v4 = 307;
  }
  else if ([v3 isEqualToString:@"sharingMRRInTheLast3Months"])
  {
    int v4 = 308;
  }
  else if ([v3 isEqualToString:@"sharingMRRInTheLastWeek"])
  {
    int v4 = 309;
  }
  else if ([v3 isEqualToString:@"sharingMRRInTheLast6Months"])
  {
    int v4 = 310;
  }
  else if ([v3 isEqualToString:@"sharingMRRInTheLastMonth"])
  {
    int v4 = 311;
  }
  else if ([v3 isEqualToString:@"sharingMRRInTheLastDay"])
  {
    int v4 = 312;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAt1InA3Months"])
  {
    int v4 = 313;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAt1InAWeek"])
  {
    int v4 = 314;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAt1InA6Months"])
  {
    int v4 = 315;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAt1InAMonth"])
  {
    int v4 = 316;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAt1InADay"])
  {
    int v4 = 317;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAtVisibleInA3Months"])
  {
    int v4 = 318;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAtVisibleInAWeek"])
  {
    int v4 = 319;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAtVisibleInA6Months"])
  {
    int v4 = 320;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAtVisibleInAMonth"])
  {
    int v4 = 321;
  }
  else if ([v3 isEqualToString:@"avgSharingHitRatioAtVisibleInADay"])
  {
    int v4 = 322;
  }
  else if ([v3 isEqualToString:@"avgSharingMRRInA3Months"])
  {
    int v4 = 323;
  }
  else if ([v3 isEqualToString:@"avgSharingMRRInAWeek"])
  {
    int v4 = 324;
  }
  else if ([v3 isEqualToString:@"avgSharingMRRInA6Months"])
  {
    int v4 = 325;
  }
  else if ([v3 isEqualToString:@"avgSharingMRRInAMonth"])
  {
    int v4 = 326;
  }
  else if ([v3 isEqualToString:@"avgSharingMRRInADay"])
  {
    int v4 = 327;
  }
  else if ([v3 isEqualToString:@"isInAMeeting"])
  {
    int v4 = 328;
  }
  else if ([v3 isEqualToString:@"isInACall"])
  {
    int v4 = 329;
  }
  else if ([v3 isEqualToString:@"isInAFaceTime"])
  {
    int v4 = 330;
  }
  else if ([v3 isEqualToString:@"isDeviceCharging"])
  {
    int v4 = 331;
  }
  else if ([v3 isEqualToString:@"isDeviceOnWifi"])
  {
    int v4 = 332;
  }
  else if ([v3 isEqualToString:@"isDeviceOnAirplaneMode"])
  {
    int v4 = 333;
  }
  else if ([v3 isEqualToString:@"isBluetoothDeviceConnected"])
  {
    int v4 = 334;
  }
  else if ([v3 isEqualToString:@"isWearingHeadphones"])
  {
    int v4 = 335;
  }
  else if ([v3 isEqualToString:@"isCarplayConnected"])
  {
    int v4 = 336;
  }
  else if ([v3 isEqualToString:@"focusMode"])
  {
    int v4 = 337;
  }
  else if ([v3 isEqualToString:@"isMediaPlaying"])
  {
    int v4 = 338;
  }
  else if ([v3 isEqualToString:@"motionState"])
  {
    int v4 = 339;
  }
  else if ([v3 isEqualToString:@"batteryState"])
  {
    int v4 = 340;
  }
  else if ([v3 isEqualToString:@"UTI"])
  {
    int v4 = 341;
  }
  else if ([v3 isEqualToString:@"SourceApp"])
  {
    int v4 = 342;
  }
  else if ([v3 isEqualToString:@"numberOfPersonUUIDs"])
  {
    int v4 = 343;
  }
  else if ([v3 isEqualToString:@"numberOfSceneUUIDs"])
  {
    int v4 = 344;
  }
  else if ([v3 isEqualToString:@"numberOfMemeUUIDs"])
  {
    int v4 = 345;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomain"])
  {
    int v4 = 346;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategory"])
  {
    int v4 = 347;
  }
  else if ([v3 isEqualToString:@"ageOfTheContent"])
  {
    int v4 = 348;
  }
  else if ([v3 isEqualToString:@"numberOfItemsShared"])
  {
    int v4 = 349;
  }
  else if ([v3 isEqualToString:@"timeSinceLastContactViaShare"])
  {
    int v4 = 350;
  }
  else if ([v3 isEqualToString:@"timeSinceLastContactViaIncomingText"])
  {
    int v4 = 351;
  }
  else if ([v3 isEqualToString:@"timeSinceLastContactViaOutgoingText"])
  {
    int v4 = 352;
  }
  else if ([v3 isEqualToString:@"timeSinceLastContactViaIncomingCall"])
  {
    int v4 = 353;
  }
  else if ([v3 isEqualToString:@"timeSinceLastContactViaOutgoingCall"])
  {
    int v4 = 354;
  }
  else if ([v3 isEqualToString:@"normalizedShareFrequency"])
  {
    int v4 = 355;
  }
  else if ([v3 isEqualToString:@"normalizedIncomingTextFrequency"])
  {
    int v4 = 356;
  }
  else if ([v3 isEqualToString:@"normalizedOutgoingTextFrequency"])
  {
    int v4 = 357;
  }
  else if ([v3 isEqualToString:@"normalizedIncomingCallFrequency"])
  {
    int v4 = 358;
  }
  else if ([v3 isEqualToString:@"normalizedOutgoingCallFrequency"])
  {
    int v4 = 359;
  }
  else if ([v3 isEqualToString:@"numberOfBehavioralRulesAdvocating"])
  {
    int v4 = 360;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRuleSupport"])
  {
    int v4 = 361;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRuleConfidence"])
  {
    int v4 = 362;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRuleLift"])
  {
    int v4 = 363;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRuleConviction"])
  {
    int v4 = 364;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRulePowerFactor"])
  {
    int v4 = 365;
  }
  else if ([v3 isEqualToString:@"averageBehavioralRuleMLScore"])
  {
    int v4 = 366;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRuleSupport"])
  {
    int v4 = 367;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRuleConfidence"])
  {
    int v4 = 368;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRuleLift"])
  {
    int v4 = 369;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRuleConviction"])
  {
    int v4 = 370;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRulePowerFactor"])
  {
    int v4 = 371;
  }
  else if ([v3 isEqualToString:@"minimumBehavioralRuleMLScore"])
  {
    int v4 = 372;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRuleSupport"])
  {
    int v4 = 373;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRuleConfidence"])
  {
    int v4 = 374;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRuleLift"])
  {
    int v4 = 375;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRuleConviction"])
  {
    int v4 = 376;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRulePowerFactor"])
  {
    int v4 = 377;
  }
  else if ([v3 isEqualToString:@"maximumBehavioralRuleMLScore"])
  {
    int v4 = 378;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRuleSupport"])
  {
    int v4 = 379;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRuleConfidence"])
  {
    int v4 = 380;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRuleLift"])
  {
    int v4 = 381;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRuleConviction"])
  {
    int v4 = 382;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRulePowerFactor"])
  {
    int v4 = 383;
  }
  else if ([v3 isEqualToString:@"stdevBehavioralRuleMLScore"])
  {
    int v4 = 384;
  }
  else if ([v3 isEqualToString:@"interactionModelScore"])
  {
    int v4 = 385;
  }
  else if ([v3 isEqualToString:@"wasShareRecipient"])
  {
    int v4 = 386;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMeetingInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 387;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMeetingInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 388;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMeetingInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 389;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMeetingInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 390;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMeetingInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 391;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMailInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 392;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMailInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 393;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMailInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 394;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMailInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 395;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingMailInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 396;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingShareInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 397;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingShareInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 398;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingShareInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 399;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingShareInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 400;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingShareInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 401;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingCallInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 402;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingCallInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 403;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingCallInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 404;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingCallInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 405;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingCallInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 406;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingTextInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 407;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingTextInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 408;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingTextInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 409;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingTextInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 410;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingTextInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 411;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingFaceTimeInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 412;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingFaceTimeInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 413;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingFaceTimeInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 414;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingFaceTimeInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 415;
  }
  else if ([v3 isEqualToString:@"numberOfIncomingFaceTimeInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 416;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 417;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 418;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 419;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 420;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMeetingInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 421;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 422;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 423;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 424;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 425;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingMailInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 426;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 427;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 428;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 429;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 430;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingShareInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 431;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 432;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 433;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 434;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 435;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingCallInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 436;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 437;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 438;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 439;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 440;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingTextInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 441;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLast6MonthsNormalizedAcrossItems"])
  {
    int v4 = 442;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastMonthNormalizedAcrossItems"])
  {
    int v4 = 443;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLast3MonthsNormalizedAcrossItems"])
  {
    int v4 = 444;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastDayNormalizedAcrossItems"])
  {
    int v4 = 445;
  }
  else if ([v3 isEqualToString:@"numberOfOutgoingFaceTimeInTheLastWeekNormalizedAcrossItems"])
  {
    int v4 = 446;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMeetingInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 447;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMeetingInAMonthNormalizedAcrossItems"])
  {
    int v4 = 448;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMeetingInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 449;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMeetingInADayNormalizedAcrossItems"])
  {
    int v4 = 450;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMeetingInAWeekNormalizedAcrossItems"])
  {
    int v4 = 451;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMailInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 452;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMailInAMonthNormalizedAcrossItems"])
  {
    int v4 = 453;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMailInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 454;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMailInADayNormalizedAcrossItems"])
  {
    int v4 = 455;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingMailInAWeekNormalizedAcrossItems"])
  {
    int v4 = 456;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingShareInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 457;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingShareInAMonthNormalizedAcrossItems"])
  {
    int v4 = 458;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingShareInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 459;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingShareInADayNormalizedAcrossItems"])
  {
    int v4 = 460;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingShareInAWeekNormalizedAcrossItems"])
  {
    int v4 = 461;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingCallInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 462;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingCallInAMonthNormalizedAcrossItems"])
  {
    int v4 = 463;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingCallInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 464;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingCallInADayNormalizedAcrossItems"])
  {
    int v4 = 465;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingCallInAWeekNormalizedAcrossItems"])
  {
    int v4 = 466;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingTextInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 467;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingTextInAMonthNormalizedAcrossItems"])
  {
    int v4 = 468;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingTextInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 469;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingTextInADayNormalizedAcrossItems"])
  {
    int v4 = 470;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingTextInAWeekNormalizedAcrossItems"])
  {
    int v4 = 471;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingFaceTimeInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 472;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingFaceTimeInAMonthNormalizedAcrossItems"])
  {
    int v4 = 473;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingFaceTimeInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 474;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingFaceTimeInADayNormalizedAcrossItems"])
  {
    int v4 = 475;
  }
  else if ([v3 isEqualToString:@"avgNumberOfIncomingFaceTimeInAWeekNormalizedAcrossItems"])
  {
    int v4 = 476;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 477;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInAMonthNormalizedAcrossItems"])
  {
    int v4 = 478;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 479;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInADayNormalizedAcrossItems"])
  {
    int v4 = 480;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMeetingInAWeekNormalizedAcrossItems"])
  {
    int v4 = 481;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 482;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInAMonthNormalizedAcrossItems"])
  {
    int v4 = 483;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 484;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInADayNormalizedAcrossItems"])
  {
    int v4 = 485;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingMailInAWeekNormalizedAcrossItems"])
  {
    int v4 = 486;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 487;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInAMonthNormalizedAcrossItems"])
  {
    int v4 = 488;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 489;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInADayNormalizedAcrossItems"])
  {
    int v4 = 490;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingShareInAWeekNormalizedAcrossItems"])
  {
    int v4 = 491;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 492;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInAMonthNormalizedAcrossItems"])
  {
    int v4 = 493;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 494;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInADayNormalizedAcrossItems"])
  {
    int v4 = 495;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingCallInAWeekNormalizedAcrossItems"])
  {
    int v4 = 496;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 497;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInAMonthNormalizedAcrossItems"])
  {
    int v4 = 498;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 499;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInADayNormalizedAcrossItems"])
  {
    int v4 = 500;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingTextInAWeekNormalizedAcrossItems"])
  {
    int v4 = 501;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInA6MonthsNormalizedAcrossItems"])
  {
    int v4 = 502;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInAMonthNormalizedAcrossItems"])
  {
    int v4 = 503;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInA3MonthsNormalizedAcrossItems"])
  {
    int v4 = 504;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInADayNormalizedAcrossItems"])
  {
    int v4 = 505;
  }
  else if ([v3 isEqualToString:@"avgNumberOfOutgoingFaceTimeInAWeekNormalizedAcrossItems"])
  {
    int v4 = 506;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingMeeting"])
  {
    int v4 = 507;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingMail"])
  {
    int v4 = 508;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingShare"])
  {
    int v4 = 509;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingCall"])
  {
    int v4 = 510;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingText"])
  {
    int v4 = 511;
  }
  else if ([v3 isEqualToString:@"timeSinceLastIncomingFaceTime"])
  {
    int v4 = 512;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingMeeting"])
  {
    int v4 = 513;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingMail"])
  {
    int v4 = 514;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingShare"])
  {
    int v4 = 515;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingCall"])
  {
    int v4 = 516;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingText"])
  {
    int v4 = 517;
  }
  else if ([v3 isEqualToString:@"timeSinceLastOutgoingFaceTime"])
  {
    int v4 = 518;
  }
  else if ([v3 isEqualToString:@"hasActiveNotificationAboutContact"])
  {
    int v4 = 519;
  }
  else if ([v3 isEqualToString:@"hasActiveNotificationAboutTransport"])
  {
    int v4 = 520;
  }
  else if ([v3 isEqualToString:@"hasActiveNotificationAboutBoth"])
  {
    int v4 = 521;
  }
  else if ([v3 isEqualToString:@"timeSinceLastMeetingWithContact"])
  {
    int v4 = 522;
  }
  else if ([v3 isEqualToString:@"timeUntilNextMeetingWithContact"])
  {
    int v4 = 523;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 524;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 525;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 526;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 527;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 528;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 529;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 530;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 531;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 532;
  }
  else if ([v3 isEqualToString:@"HourOfDaySlotConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 533;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 534;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 535;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 536;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 537;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 538;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 539;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 540;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 541;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 542;
  }
  else if ([v3 isEqualToString:@"IsWeekendConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 543;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 544;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 545;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 546;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 547;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 548;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 549;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 550;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 551;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 552;
  }
  else if ([v3 isEqualToString:@"LocationUUIDConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 553;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 554;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 555;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 556;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 557;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 558;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 559;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 560;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 561;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 562;
  }
  else if ([v3 isEqualToString:@"PersonUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 563;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 564;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 565;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 566;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 567;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 568;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 569;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 570;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 571;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 572;
  }
  else if ([v3 isEqualToString:@"URLTopLevelDomainConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 573;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 574;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 575;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 576;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 577;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 578;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 579;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 580;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 581;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 582;
  }
  else if ([v3 isEqualToString:@"SourceAppConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 583;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 584;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 585;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 586;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 587;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 588;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 589;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 590;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 591;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 592;
  }
  else if ([v3 isEqualToString:@"MemeUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 593;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 594;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 595;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 596;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 597;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 598;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 599;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 600;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 601;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 602;
  }
  else if ([v3 isEqualToString:@"URLScreenTimeCategoryConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 603;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 604;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 605;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 606;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 607;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 608;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 609;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 610;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 611;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 612;
  }
  else if ([v3 isEqualToString:@"DayOfWeekConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 613;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 614;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 615;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 616;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 617;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 618;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 619;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 620;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 621;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 622;
  }
  else if ([v3 isEqualToString:@"SceneUUIDSetConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 623;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 624;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 625;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 626;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 627;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 628;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 629;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 630;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 631;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 632;
  }
  else if ([v3 isEqualToString:@"TextTopicSetConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 633;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllBucketsInTheLast6Months"])
  {
    int v4 = 634;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllCandidatesInTheLast6Months"])
  {
    int v4 = 635;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllBucketsInTheLastMonth"])
  {
    int v4 = 636;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllCandidatesInTheLastMonth"])
  {
    int v4 = 637;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllBucketsInTheLast3Months"])
  {
    int v4 = 638;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllCandidatesInTheLast3Months"])
  {
    int v4 = 639;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllBucketsInTheLastDay"])
  {
    int v4 = 640;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllCandidatesInTheLastDay"])
  {
    int v4 = 641;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllBucketsInTheLastWeek"])
  {
    int v4 = 642;
  }
  else if ([v3 isEqualToString:@"UTIConditionedProbabilityAcrossAllCandidatesInTheLastWeek"])
  {
    int v4 = 643;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisHourOfDaySlotBucket"])
  {
    int v4 = 644;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisIsWeekendBucket"])
  {
    int v4 = 645;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisLocationUUIDBucket"])
  {
    int v4 = 646;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisPersonUUIDSetBucket"])
  {
    int v4 = 647;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisURLTopLevelDomainBucket"])
  {
    int v4 = 648;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisSourceAppBucket"])
  {
    int v4 = 649;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisMemeUUIDSetBucket"])
  {
    int v4 = 650;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisURLScreenTimeCategoryBucket"])
  {
    int v4 = 651;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisDayOfWeekBucket"])
  {
    int v4 = 652;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisSceneUUIDSetBucket"])
  {
    int v4 = 653;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisTextTopicSetBucket"])
  {
    int v4 = 654;
  }
  else if ([v3 isEqualToString:@"hasEverSharedInThisUTIBucket"])
  {
    int v4 = 655;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedWithContact"])
  {
    int v4 = 656;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedWithTransport"])
  {
    int v4 = 657;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedWithBoth"])
  {
    int v4 = 658;
  }
  else if ([v3 isEqualToString:@"isPreferredTransportAppInSharing"])
  {
    int v4 = 659;
  }
  else if ([v3 isEqualToString:@"isPreferredTransportAppInTexting"])
  {
    int v4 = 660;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedPhotoWithItem"])
  {
    int v4 = 661;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedVideoWithItem"])
  {
    int v4 = 662;
  }
  else if ([v3 isEqualToString:@"hasUserEverSharedURLWithItem"])
  {
    int v4 = 663;
  }
  else if ([v3 isEqualToString:@"conversationCreationAge"])
  {
    int v4 = 664;
  }
  else if ([v3 isEqualToString:@"contactOrGroupCreationAge"])
  {
    int v4 = 665;
  }
  else if ([v3 isEqualToString:@"transportAppInstallAge"])
  {
    int v4 = 666;
  }
  else if ([v3 isEqualToString:@"isSingleContact"])
  {
    int v4 = 667;
  }
  else if ([v3 isEqualToString:@"isGroup"])
  {
    int v4 = 668;
  }
  else if ([v3 isEqualToString:@"favoritedContactRatio"])
  {
    int v4 = 669;
  }
  else if ([v3 isEqualToString:@"suggestLessContactRatio"])
  {
    int v4 = 670;
  }
  else if ([v3 isEqualToString:@"icloudFamilyMemberContactRatio"])
  {
    int v4 = 671;
  }
  else if ([v3 isEqualToString:@"childTaggedRatio"])
  {
    int v4 = 672;
  }
  else if ([v3 isEqualToString:@"pinnedConversationRatio"])
  {
    int v4 = 673;
  }
  else if ([v3 isEqualToString:@"emergencyContactRatio"])
  {
    int v4 = 674;
  }
  else if ([v3 isEqualToString:@"familyRelationshipTaggedRatio"])
  {
    int v4 = 675;
  }
  else if ([v3 isEqualToString:@"contactInHomekitHomeRatio"])
  {
    int v4 = 676;
  }
  else if ([v3 isEqualToString:@"findMyFriendsUserSharingLocationRatio"])
  {
    int v4 = 677;
  }
  else if ([v3 isEqualToString:@"findMyFriendsItemSharingLocationRatio"])
  {
    int v4 = 678;
  }
  else if ([v3 isEqualToString:@"photosGraphContactLabel"])
  {
    int v4 = 679;
  }
  else if ([v3 isEqualToString:@"numberOfPhotosInLibraryWithThisPersonInTheLast6Months"])
  {
    int v4 = 680;
  }
  else if ([v3 isEqualToString:@"numberOfPhotosInLibraryWithThisPersonInTheLastMonth"])
  {
    int v4 = 681;
  }
  else if ([v3 isEqualToString:@"numberOfPhotosInLibraryWithThisPersonInTheLast3Months"])
  {
    int v4 = 682;
  }
  else if ([v3 isEqualToString:@"numberOfPhotosInLibraryWithThisPersonInTheLastDay"])
  {
    int v4 = 683;
  }
  else if ([v3 isEqualToString:@"numberOfPhotosInLibraryWithThisPersonInTheLastWeek"])
  {
    int v4 = 684;
  }
  else if ([v3 isEqualToString:@"numberOfTimeIsInProximityOfContactInTheLast6Months"])
  {
    int v4 = 685;
  }
  else if ([v3 isEqualToString:@"numberOfTimeIsInProximityOfContactInTheLastMonth"])
  {
    int v4 = 686;
  }
  else if ([v3 isEqualToString:@"numberOfTimeIsInProximityOfContactInTheLast3Months"])
  {
    int v4 = 687;
  }
  else if ([v3 isEqualToString:@"numberOfTimeIsInProximityOfContactInTheLastDay"])
  {
    int v4 = 688;
  }
  else if ([v3 isEqualToString:@"numberOfTimeIsInProximityOfContactInTheLastWeek"])
  {
    int v4 = 689;
  }
  else if ([v3 isEqualToString:@"currentProductionModelRank"])
  {
    int v4 = 690;
  }
  else if ([v3 isEqualToString:@"knnModelRank"])
  {
    int v4 = 691;
  }
  else if ([v3 isEqualToString:@"ruleMiningModelRank"])
  {
    int v4 = 692;
  }
  else if ([v3 isEqualToString:@"frequencyModelRank"])
  {
    int v4 = 693;
  }
  else if ([v3 isEqualToString:@"recencyModelRank"])
  {
    int v4 = 694;
  }
  else if ([v3 isEqualToString:@"inCallHeuristicModelRank"])
  {
    int v4 = 695;
  }
  else if ([v3 isEqualToString:@"inMeetingHeuristicModelRank"])
  {
    int v4 = 696;
  }
  else if ([v3 isEqualToString:@"inFaceTimeHeuristicModelRank"])
  {
    int v4 = 697;
  }
  else if ([v3 isEqualToString:@"hyperRecencyHeuristicModelRank"])
  {
    int v4 = 698;
  }
  else if ([v3 isEqualToString:@"photoHeuristicAssetOrMomentModelRank"])
  {
    int v4 = 699;
  }
  else if ([v3 isEqualToString:@"photoGroupSuggestionHeuristicModelRank"])
  {
    int v4 = 700;
  }
  else if ([v3 isEqualToString:@"photoGroupSuggestionHeuristicAssetModelRank"])
  {
    int v4 = 701;
  }
  else if ([v3 isEqualToString:@"recencyBackfillModelRank"])
  {
    int v4 = 702;
  }
  else if ([v3 isEqualToString:@"coreMLModelRank"])
  {
    int v4 = 703;
  }
  else if ([v3 isEqualToString:@"returnToSenderModelRank"])
  {
    int v4 = 704;
  }
  else if ([v3 isEqualToString:@"modelUsedInProduction"])
  {
    int v4 = 705;
  }
  else if ([v3 isEqualToString:@"modelInfo"])
  {
    int v4 = 706;
  }
  else if ([v3 isEqualToString:@"ImageEmbeddings"])
  {
    int v4 = 707;
  }
  else if ([v3 isEqualToString:@"shareSheetRecency"])
  {
    int v4 = 708;
  }
  else if ([v3 isEqualToString:@"messagesRecency"])
  {
    int v4 = 709;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeatureValue
{
  return self->_featureValue != 0;
}

- (void)setFeatureItselfVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_featureItselfVersion = a3;
}

- (void)setHasFeatureItselfVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeatureItselfVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFeatureFreshnessInHours:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_featureFreshnessInHours = a3;
}

- (void)setHasFeatureFreshnessInHours:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeatureFreshnessInHours
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEventVolumeToComputeFeature:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventVolumeToComputeFeature = a3;
}

- (void)setHasEventVolumeToComputeFeature:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventVolumeToComputeFeature
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimeSpentToComputeFeature:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timeSpentToComputeFeature = a3;
}

- (void)setHasTimeSpentToComputeFeature:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimeSpentToComputeFeature
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataFeature;
  int v4 = [(PeoplePredictionDataFeature *)&v8 description];
  v5 = [(PeoplePredictionDataFeature *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t featureName = self->_featureName;
    if (featureName >= 0x2C6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_featureName);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26547C638[featureName];
    }
    [v3 setObject:v5 forKey:@"featureName"];
  }
  featureValue = self->_featureValue;
  if (featureValue)
  {
    v7 = [(PeoplePredictionDataFeatureValue *)featureValue dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"featureValue"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_featureItselfVersion];
    [v3 setObject:v11 forKey:@"featureItselfVersion"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  v12 = [NSNumber numberWithUnsignedInt:self->_featureFreshnessInHours];
  [v3 setObject:v12 forKey:@"featureFreshnessInHours"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_18:
  v13 = [NSNumber numberWithUnsignedInt:self->_eventVolumeToComputeFeature];
  [v3 setObject:v13 forKey:@"eventVolumeToComputeFeature"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    v9 = [NSNumber numberWithUnsignedInt:self->_timeSpentToComputeFeature];
    [v3 setObject:v9 forKey:@"timeSpentToComputeFeature"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataFeatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_featureValue) {
    PBDataWriterWriteSubmessage();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[5] = self->_featureName;
    *((unsigned char *)v4 + 36) |= 8u;
  }
  if (self->_featureValue)
  {
    v6 = v4;
    objc_msgSend(v4, "setFeatureValue:");
    int v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[4] = self->_featureItselfVersion;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  v4[3] = self->_featureFreshnessInHours;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  v4[2] = self->_eventVolumeToComputeFeature;
  *((unsigned char *)v4 + 36) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    v4[8] = self->_timeSpentToComputeFeature;
    *((unsigned char *)v4 + 36) |= 0x10u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_featureName;
    *(unsigned char *)(v5 + 36) |= 8u;
  }
  id v7 = [(PeoplePredictionDataFeatureValue *)self->_featureValue copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_featureItselfVersion;
    *(unsigned char *)(v6 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(_DWORD *)(v6 + 8) = self->_eventVolumeToComputeFeature;
      *(unsigned char *)(v6 + 36) |= 1u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return (id)v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 12) = self->_featureFreshnessInHours;
  *(unsigned char *)(v6 + 36) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 32) = self->_timeSpentToComputeFeature;
    *(unsigned char *)(v6 + 36) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_featureName != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_29;
  }
  featureValue = self->_featureValue;
  if ((unint64_t)featureValue | *((void *)v4 + 3))
  {
    if (!-[PeoplePredictionDataFeatureValue isEqual:](featureValue, "isEqual:"))
    {
LABEL_29:
      BOOL v7 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_featureItselfVersion != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_featureFreshnessInHours != *((_DWORD *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_eventVolumeToComputeFeature != *((_DWORD *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_29;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_timeSpentToComputeFeature != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
    BOOL v7 = 1;
  }
LABEL_30:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_featureName;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(PeoplePredictionDataFeatureValue *)self->_featureValue hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_featureItselfVersion;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_featureFreshnessInHours;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_eventVolumeToComputeFeature;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_timeSpentToComputeFeature;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  uint64_t v5 = v4;
  if ((v4[9] & 8) != 0)
  {
    self->_uint64_t featureName = v4[5];
    *(unsigned char *)&self->_has |= 8u;
  }
  featureValue = self->_featureValue;
  uint64_t v7 = *((void *)v5 + 3);
  if (featureValue)
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[PeoplePredictionDataFeatureValue mergeFrom:](featureValue, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    v9 = v5;
    -[PeoplePredictionDataFeature setFeatureValue:](self, "setFeatureValue:");
  }
  uint64_t v5 = v9;
LABEL_9:
  char v8 = *((unsigned char *)v5 + 36);
  if ((v8 & 4) != 0)
  {
    self->_featureItselfVersion = v5[4];
    *(unsigned char *)&self->_has |= 4u;
    char v8 = *((unsigned char *)v5 + 36);
    if ((v8 & 2) == 0)
    {
LABEL_11:
      if ((v8 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_19;
    }
  }
  else if ((v5[9] & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_featureFreshnessInHours = v5[3];
  *(unsigned char *)&self->_has |= 2u;
  char v8 = *((unsigned char *)v5 + 36);
  if ((v8 & 1) == 0)
  {
LABEL_12:
    if ((v8 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_19:
  self->_eventVolumeToComputeFeature = v5[2];
  *(unsigned char *)&self->_has |= 1u;
  if ((v5[9] & 0x10) != 0)
  {
LABEL_13:
    self->_timeSpentToComputeFeature = v5[8];
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_14:

  MEMORY[0x270F9A758]();
}

- (PeoplePredictionDataFeatureValue)featureValue
{
  return self->_featureValue;
}

- (void)setFeatureValue:(id)a3
{
}

- (unsigned)featureItselfVersion
{
  return self->_featureItselfVersion;
}

- (unsigned)featureFreshnessInHours
{
  return self->_featureFreshnessInHours;
}

- (unsigned)eventVolumeToComputeFeature
{
  return self->_eventVolumeToComputeFeature;
}

- (unsigned)timeSpentToComputeFeature
{
  return self->_timeSpentToComputeFeature;
}

- (void).cxx_destruct
{
}

@end
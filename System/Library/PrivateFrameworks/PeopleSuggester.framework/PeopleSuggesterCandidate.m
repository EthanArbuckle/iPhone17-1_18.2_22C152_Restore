@interface PeopleSuggesterCandidate
- (BOOL)hasCoreMLModelScore;
- (BOOL)hasDeprecatedField1;
- (BOOL)hasDeprecatedField2;
- (BOOL)hasDeprecatedField3;
- (BOOL)hasFeedbackDeprecated;
- (BOOL)hasFoundInChunk;
- (BOOL)hasHasEverSharePlayedWithConversation;
- (BOOL)hasNumberOfEngagedSuggestionsFromCurrentAppWithConversation;
- (BOOL)hasNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
- (BOOL)hasNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
- (BOOL)hasNumberOfEngagedSuggestionsOfTopDomainURLWithConversation;
- (BOOL)hasNumberOfEngagedSuggestionsWithConversation;
- (BOOL)hasNumberOfIncomingInteractionsWithConversation;
- (BOOL)hasNumberOfInteractionsDuringTimePeriodWithConversation;
- (BOOL)hasNumberOfOutgoingInteractionsWithConversation;
- (BOOL)hasNumberOfSharesFromCurrentAppWithConversation;
- (BOOL)hasNumberOfSharesOfDetectedPeopleWithConversation;
- (BOOL)hasNumberOfSharesOfPeopleInPhotoWithConversation;
- (BOOL)hasNumberOfSharesOfTopDomainURLWithConversation;
- (BOOL)hasNumberOfSharesWithConversation;
- (BOOL)hasPrivatizedIdentifier;
- (BOOL)hasPrivatizedTransportBundleId;
- (BOOL)hasSuggestedRank;
- (BOOL)hasTimeSinceLastIncomingInteraction;
- (BOOL)hasTimeSinceLastOutgoingInteraction;
- (BOOL)hasTimeSinceOutgoingInteractionNumber10;
- (BOOL)hasUpdatedInChunk;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)privatizedIdentifier;
- (NSString)privatizedTransportBundleId;
- (PeopleSuggesterFeatureDouble)hasEverSharePlayedWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsFromCurrentAppWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfIncomingInteractionsWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfInteractionsDuringTimePeriodWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfOutgoingInteractionsWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfSharesFromCurrentAppWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfSharesOfDetectedPeopleWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfSharesOfPeopleInPhotoWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfSharesOfTopDomainURLWithConversation;
- (PeopleSuggesterFeatureDouble)numberOfSharesWithConversation;
- (PeopleSuggesterFeatureDouble)timeSinceLastIncomingInteraction;
- (PeopleSuggesterFeatureDouble)timeSinceLastOutgoingInteraction;
- (PeopleSuggesterFeatureDouble)timeSinceOutgoingInteractionNumber10;
- (double)coreMLModelScore;
- (double)deprecatedField1;
- (double)deprecatedField2;
- (double)deprecatedField3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackDeprecatedAsString:(int)a3;
- (int)StringAsFeedbackDeprecated:(id)a3;
- (int)feedbackDeprecated;
- (int)foundInChunk;
- (int)suggestedRank;
- (int)updatedInChunk;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCoreMLModelScore:(double)a3;
- (void)setDeprecatedField1:(double)a3;
- (void)setDeprecatedField2:(double)a3;
- (void)setDeprecatedField3:(double)a3;
- (void)setFeedbackDeprecated:(int)a3;
- (void)setFoundInChunk:(int)a3;
- (void)setHasCoreMLModelScore:(BOOL)a3;
- (void)setHasDeprecatedField1:(BOOL)a3;
- (void)setHasDeprecatedField2:(BOOL)a3;
- (void)setHasDeprecatedField3:(BOOL)a3;
- (void)setHasEverSharePlayedWithConversation:(id)a3;
- (void)setHasFeedbackDeprecated:(BOOL)a3;
- (void)setHasFoundInChunk:(BOOL)a3;
- (void)setHasSuggestedRank:(BOOL)a3;
- (void)setHasUpdatedInChunk:(BOOL)a3;
- (void)setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:(id)a3;
- (void)setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:(id)a3;
- (void)setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:(id)a3;
- (void)setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:(id)a3;
- (void)setNumberOfEngagedSuggestionsWithConversation:(id)a3;
- (void)setNumberOfIncomingInteractionsWithConversation:(id)a3;
- (void)setNumberOfInteractionsDuringTimePeriodWithConversation:(id)a3;
- (void)setNumberOfOutgoingInteractionsWithConversation:(id)a3;
- (void)setNumberOfSharesFromCurrentAppWithConversation:(id)a3;
- (void)setNumberOfSharesOfDetectedPeopleWithConversation:(id)a3;
- (void)setNumberOfSharesOfPeopleInPhotoWithConversation:(id)a3;
- (void)setNumberOfSharesOfTopDomainURLWithConversation:(id)a3;
- (void)setNumberOfSharesWithConversation:(id)a3;
- (void)setPrivatizedIdentifier:(id)a3;
- (void)setPrivatizedTransportBundleId:(id)a3;
- (void)setSuggestedRank:(int)a3;
- (void)setTimeSinceLastIncomingInteraction:(id)a3;
- (void)setTimeSinceLastOutgoingInteraction:(id)a3;
- (void)setTimeSinceOutgoingInteractionNumber10:(id)a3;
- (void)setUpdatedInChunk:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeopleSuggesterCandidate

- (BOOL)hasPrivatizedIdentifier
{
  return self->_privatizedIdentifier != 0;
}

- (int)feedbackDeprecated
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_feedbackDeprecated;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackDeprecated:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_feedbackDeprecated = a3;
}

- (void)setHasFeedbackDeprecated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasFeedbackDeprecated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)feedbackDeprecatedAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E5ADF6E0[a3];
  }

  return v3;
}

- (int)StringAsFeedbackDeprecated:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ABANDONED"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SUGGESTION_SELECTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INTERACTED_WITH_AFTER_SHARE_DEPRECATED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HANDLE_SELECTED_IN_APP_EXTENSION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HANDLE_SELECTED_IN_APP"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPrivatizedTransportBundleId
{
  return self->_privatizedTransportBundleId != 0;
}

- (BOOL)hasTimeSinceLastOutgoingInteraction
{
  return self->_timeSinceLastOutgoingInteraction != 0;
}

- (BOOL)hasTimeSinceOutgoingInteractionNumber10
{
  return self->_timeSinceOutgoingInteractionNumber10 != 0;
}

- (BOOL)hasTimeSinceLastIncomingInteraction
{
  return self->_timeSinceLastIncomingInteraction != 0;
}

- (void)setDeprecatedField1:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deprecatedField1 = a3;
}

- (void)setHasDeprecatedField1:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeprecatedField1
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDeprecatedField2:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_deprecatedField2 = a3;
}

- (void)setHasDeprecatedField2:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDeprecatedField2
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDeprecatedField3:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_deprecatedField3 = a3;
}

- (void)setHasDeprecatedField3:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDeprecatedField3
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasNumberOfSharesWithConversation
{
  return self->_numberOfSharesWithConversation != 0;
}

- (BOOL)hasNumberOfSharesFromCurrentAppWithConversation
{
  return self->_numberOfSharesFromCurrentAppWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfTopDomainURLWithConversation
{
  return self->_numberOfSharesOfTopDomainURLWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfDetectedPeopleWithConversation
{
  return self->_numberOfSharesOfDetectedPeopleWithConversation != 0;
}

- (BOOL)hasNumberOfSharesOfPeopleInPhotoWithConversation
{
  return self->_numberOfSharesOfPeopleInPhotoWithConversation != 0;
}

- (BOOL)hasNumberOfOutgoingInteractionsWithConversation
{
  return self->_numberOfOutgoingInteractionsWithConversation != 0;
}

- (BOOL)hasNumberOfIncomingInteractionsWithConversation
{
  return self->_numberOfIncomingInteractionsWithConversation != 0;
}

- (BOOL)hasNumberOfInteractionsDuringTimePeriodWithConversation
{
  return self->_numberOfInteractionsDuringTimePeriodWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsWithConversation
{
  return self->_numberOfEngagedSuggestionsWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsFromCurrentAppWithConversation
{
  return self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfTopDomainURLWithConversation
{
  return self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation
{
  return self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation != 0;
}

- (BOOL)hasNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation
{
  return self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation != 0;
}

- (BOOL)hasHasEverSharePlayedWithConversation
{
  return self->_hasEverSharePlayedWithConversation != 0;
}

- (void)setSuggestedRank:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_suggestedRank = a3;
}

- (void)setHasSuggestedRank:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSuggestedRank
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCoreMLModelScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_coreMLModelScore = a3;
}

- (void)setHasCoreMLModelScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCoreMLModelScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFoundInChunk:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_foundInChunk = a3;
}

- (void)setHasFoundInChunk:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFoundInChunk
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setUpdatedInChunk:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_updatedInChunk = a3;
}

- (void)setHasUpdatedInChunk:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasUpdatedInChunk
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterCandidate;
  int v4 = [(PeopleSuggesterCandidate *)&v8 description];
  v5 = [(PeopleSuggesterCandidate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  privatizedIdentifier = self->_privatizedIdentifier;
  if (privatizedIdentifier) {
    [v3 setObject:privatizedIdentifier forKey:@"privatizedIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t feedbackDeprecated = self->_feedbackDeprecated;
    if (feedbackDeprecated >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackDeprecated);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5ADF6E0[feedbackDeprecated];
    }
    [v4 setObject:v7 forKey:@"feedback_deprecated"];
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if (privatizedTransportBundleId) {
    [v4 setObject:privatizedTransportBundleId forKey:@"privatizedTransportBundleId"];
  }
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  if (timeSinceLastOutgoingInteraction)
  {
    v10 = [(PeopleSuggesterFeatureDouble *)timeSinceLastOutgoingInteraction dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"timeSinceLastOutgoingInteraction"];
  }
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  if (timeSinceOutgoingInteractionNumber10)
  {
    v12 = [(PeopleSuggesterFeatureDouble *)timeSinceOutgoingInteractionNumber10 dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"timeSinceOutgoingInteractionNumber10"];
  }
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  if (timeSinceLastIncomingInteraction)
  {
    v14 = [(PeopleSuggesterFeatureDouble *)timeSinceLastIncomingInteraction dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"timeSinceLastIncomingInteraction"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v47 = [NSNumber numberWithDouble:self->_deprecatedField1];
    [v4 setObject:v47 forKey:@"deprecated_field_1"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_18:
      if ((has & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  v48 = [NSNumber numberWithDouble:self->_deprecatedField2];
  [v4 setObject:v48 forKey:@"deprecated_field_2"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_19:
    v16 = [NSNumber numberWithDouble:self->_deprecatedField3];
    [v4 setObject:v16 forKey:@"deprecated_field_3"];
  }
LABEL_20:
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  if (numberOfSharesWithConversation)
  {
    v18 = [(PeopleSuggesterFeatureDouble *)numberOfSharesWithConversation dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"numberOfSharesWithConversation"];
  }
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  if (numberOfSharesFromCurrentAppWithConversation)
  {
    v20 = [(PeopleSuggesterFeatureDouble *)numberOfSharesFromCurrentAppWithConversation dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"numberOfSharesFromCurrentAppWithConversation"];
  }
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  if (numberOfSharesOfTopDomainURLWithConversation)
  {
    v22 = [(PeopleSuggesterFeatureDouble *)numberOfSharesOfTopDomainURLWithConversation dictionaryRepresentation];
    [v4 setObject:v22 forKey:@"numberOfSharesOfTopDomainURLWithConversation"];
  }
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  if (numberOfSharesOfDetectedPeopleWithConversation)
  {
    v24 = [(PeopleSuggesterFeatureDouble *)numberOfSharesOfDetectedPeopleWithConversation dictionaryRepresentation];
    [v4 setObject:v24 forKey:@"numberOfSharesOfDetectedPeopleWithConversation"];
  }
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  if (numberOfSharesOfPeopleInPhotoWithConversation)
  {
    v26 = [(PeopleSuggesterFeatureDouble *)numberOfSharesOfPeopleInPhotoWithConversation dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"numberOfSharesOfPeopleInPhotoWithConversation"];
  }
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  if (numberOfOutgoingInteractionsWithConversation)
  {
    v28 = [(PeopleSuggesterFeatureDouble *)numberOfOutgoingInteractionsWithConversation dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"numberOfOutgoingInteractionsWithConversation"];
  }
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  if (numberOfIncomingInteractionsWithConversation)
  {
    v30 = [(PeopleSuggesterFeatureDouble *)numberOfIncomingInteractionsWithConversation dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"numberOfIncomingInteractionsWithConversation"];
  }
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  if (numberOfInteractionsDuringTimePeriodWithConversation)
  {
    v32 = [(PeopleSuggesterFeatureDouble *)numberOfInteractionsDuringTimePeriodWithConversation dictionaryRepresentation];
    [v4 setObject:v32 forKey:@"numberOfInteractionsDuringTimePeriodWithConversation"];
  }
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  if (numberOfEngagedSuggestionsWithConversation)
  {
    v34 = [(PeopleSuggesterFeatureDouble *)numberOfEngagedSuggestionsWithConversation dictionaryRepresentation];
    [v4 setObject:v34 forKey:@"numberOfEngagedSuggestionsWithConversation"];
  }
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  if (numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    v36 = [(PeopleSuggesterFeatureDouble *)numberOfEngagedSuggestionsFromCurrentAppWithConversation dictionaryRepresentation];
    [v4 setObject:v36 forKey:@"numberOfEngagedSuggestionsFromCurrentAppWithConversation"];
  }
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  if (numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    v38 = [(PeopleSuggesterFeatureDouble *)numberOfEngagedSuggestionsOfTopDomainURLWithConversation dictionaryRepresentation];
    [v4 setObject:v38 forKey:@"numberOfEngagedSuggestionsOfTopDomainURLWithConversation"];
  }
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  if (numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    v40 = [(PeopleSuggesterFeatureDouble *)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation dictionaryRepresentation];
    [v4 setObject:v40 forKey:@"numberOfEngagedSuggestionsOfDetectedPeopleWithConversation"];
  }
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  if (numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    v42 = [(PeopleSuggesterFeatureDouble *)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation dictionaryRepresentation];
    [v4 setObject:v42 forKey:@"numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation"];
  }
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  if (hasEverSharePlayedWithConversation)
  {
    v44 = [(PeopleSuggesterFeatureDouble *)hasEverSharePlayedWithConversation dictionaryRepresentation];
    [v4 setObject:v44 forKey:@"hasEverSharePlayedWithConversation"];
  }
  char v45 = (char)self->_has;
  if ((v45 & 0x40) != 0)
  {
    v49 = [NSNumber numberWithInt:self->_suggestedRank];
    [v4 setObject:v49 forKey:@"suggestedRank"];

    char v45 = (char)self->_has;
    if ((v45 & 1) == 0)
    {
LABEL_50:
      if ((v45 & 0x20) == 0) {
        goto LABEL_51;
      }
LABEL_60:
      v51 = [NSNumber numberWithInt:self->_foundInChunk];
      [v4 setObject:v51 forKey:@"foundInChunk"];

      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_52;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_50;
  }
  v50 = [NSNumber numberWithDouble:self->_coreMLModelScore];
  [v4 setObject:v50 forKey:@"coreMLModelScore"];

  char v45 = (char)self->_has;
  if ((v45 & 0x20) != 0) {
    goto LABEL_60;
  }
LABEL_51:
  if ((v45 & 0x80) == 0) {
    goto LABEL_52;
  }
LABEL_61:
  v52 = [NSNumber numberWithInt:self->_updatedInChunk];
  [v4 setObject:v52 forKey:@"updatedInChunk"];

LABEL_52:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterCandidateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_privatizedIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_privatizedTransportBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_timeSinceLastOutgoingInteraction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_timeSinceOutgoingInteractionNumber10)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_timeSinceLastIncomingInteraction)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v7;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_17:
  if (self->_numberOfSharesWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfSharesFromCurrentAppWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfSharesOfTopDomainURLWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfSharesOfDetectedPeopleWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfSharesOfPeopleInPhotoWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfOutgoingInteractionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfIncomingInteractionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfInteractionsDuringTimePeriodWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_hasEverSharePlayedWithConversation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_47:
      if ((v6 & 0x20) == 0) {
        goto LABEL_48;
      }
LABEL_57:
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_49;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_47;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0) {
    goto LABEL_57;
  }
LABEL_48:
  if ((v6 & 0x80) == 0) {
    goto LABEL_49;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
LABEL_49:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_privatizedIdentifier)
  {
    objc_msgSend(v4, "setPrivatizedIdentifier:");
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_feedbackDeprecated;
    *((unsigned char *)v4 + 212) |= 0x10u;
  }
  if (self->_privatizedTransportBundleId)
  {
    objc_msgSend(v7, "setPrivatizedTransportBundleId:");
    id v4 = v7;
  }
  if (self->_timeSinceLastOutgoingInteraction)
  {
    objc_msgSend(v7, "setTimeSinceLastOutgoingInteraction:");
    id v4 = v7;
  }
  if (self->_timeSinceOutgoingInteractionNumber10)
  {
    objc_msgSend(v7, "setTimeSinceOutgoingInteractionNumber10:");
    id v4 = v7;
  }
  if (self->_timeSinceLastIncomingInteraction)
  {
    objc_msgSend(v7, "setTimeSinceLastIncomingInteraction:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_deprecatedField1;
    *((unsigned char *)v4 + 212) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((void *)v4 + 3) = *(void *)&self->_deprecatedField2;
  *((unsigned char *)v4 + 212) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    *((void *)v4 + 4) = *(void *)&self->_deprecatedField3;
    *((unsigned char *)v4 + 212) |= 8u;
  }
LABEL_17:
  if (self->_numberOfSharesWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfSharesFromCurrentAppWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesFromCurrentAppWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfSharesOfTopDomainURLWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfTopDomainURLWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfSharesOfDetectedPeopleWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfDetectedPeopleWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfSharesOfPeopleInPhotoWithConversation)
  {
    objc_msgSend(v7, "setNumberOfSharesOfPeopleInPhotoWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfOutgoingInteractionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfOutgoingInteractionsWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfIncomingInteractionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfIncomingInteractionsWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfInteractionsDuringTimePeriodWithConversation)
  {
    objc_msgSend(v7, "setNumberOfInteractionsDuringTimePeriodWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:");
    id v4 = v7;
  }
  if (self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    objc_msgSend(v7, "setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:");
    id v4 = v7;
  }
  if (self->_hasEverSharePlayedWithConversation)
  {
    objc_msgSend(v7, "setHasEverSharePlayedWithConversation:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 44) = self->_suggestedRank;
    *((unsigned char *)v4 + 212) |= 0x40u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_47:
      if ((v6 & 0x20) == 0) {
        goto LABEL_48;
      }
LABEL_57:
      *((_DWORD *)v4 + 11) = self->_foundInChunk;
      *((unsigned char *)v4 + 212) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        goto LABEL_49;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_47;
  }
  *((void *)v4 + 1) = *(void *)&self->_coreMLModelScore;
  *((unsigned char *)v4 + 212) |= 1u;
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0) {
    goto LABEL_57;
  }
LABEL_48:
  if ((v6 & 0x80) == 0) {
    goto LABEL_49;
  }
LABEL_58:
  *((_DWORD *)v4 + 52) = self->_updatedInChunk;
  *((unsigned char *)v4 + 212) |= 0x80u;
LABEL_49:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_privatizedIdentifier copyWithZone:a3];
  id v7 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v6;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_feedbackDeprecated;
    *(unsigned char *)(v5 + 212) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_privatizedTransportBundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v8;

  id v10 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceLastOutgoingInteraction copyWithZone:a3];
  v11 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v10;

  id v12 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceOutgoingInteractionNumber10 copyWithZone:a3];
  v13 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v12;

  id v14 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceLastIncomingInteraction copyWithZone:a3];
  v15 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v14;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_deprecatedField1;
    *(unsigned char *)(v5 + 212) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 24) = self->_deprecatedField2;
  *(unsigned char *)(v5 + 212) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(double *)(v5 + 32) = self->_deprecatedField3;
    *(unsigned char *)(v5 + 212) |= 8u;
  }
LABEL_7:
  id v17 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesWithConversation copyWithZone:a3];
  v18 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v17;

  id v19 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesFromCurrentAppWithConversation copyWithZone:a3];
  v20 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v19;

  id v21 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfTopDomainURLWithConversation copyWithZone:a3];
  v22 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v21;

  id v23 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfDetectedPeopleWithConversation copyWithZone:a3];
  v24 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v23;

  id v25 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfPeopleInPhotoWithConversation copyWithZone:a3];
  v26 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v25;

  id v27 = [(PeopleSuggesterFeatureDouble *)self->_numberOfOutgoingInteractionsWithConversation copyWithZone:a3];
  v28 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v27;

  id v29 = [(PeopleSuggesterFeatureDouble *)self->_numberOfIncomingInteractionsWithConversation copyWithZone:a3];
  v30 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v29;

  id v31 = [(PeopleSuggesterFeatureDouble *)self->_numberOfInteractionsDuringTimePeriodWithConversation copyWithZone:a3];
  v32 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v31;

  id v33 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsWithConversation copyWithZone:a3];
  v34 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v33;

  id v35 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation copyWithZone:a3];
  v36 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v35;

  id v37 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation copyWithZone:a3];
  v38 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v37;

  id v39 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation copyWithZone:a3];
  v40 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v39;

  id v41 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation copyWithZone:a3];
  v42 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v41;

  id v43 = [(PeopleSuggesterFeatureDouble *)self->_hasEverSharePlayedWithConversation copyWithZone:a3];
  v44 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v43;

  char v45 = (char)self->_has;
  if ((v45 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 176) = self->_suggestedRank;
    *(unsigned char *)(v5 + 212) |= 0x40u;
    char v45 = (char)self->_has;
    if ((v45 & 1) == 0)
    {
LABEL_9:
      if ((v45 & 0x20) == 0) {
        goto LABEL_10;
      }
LABEL_17:
      *(_DWORD *)(v5 + 44) = self->_foundInChunk;
      *(unsigned char *)(v5 + 212) |= 0x20u;
      if ((*(unsigned char *)&self->_has & 0x80) == 0) {
        return (id)v5;
      }
LABEL_18:
      *(_DWORD *)(v5 + 208) = self->_updatedInChunk;
      *(unsigned char *)(v5 + 212) |= 0x80u;
      return (id)v5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  *(double *)(v5 + 8) = self->_coreMLModelScore;
  *(unsigned char *)(v5 + 212) |= 1u;
  char v45 = (char)self->_has;
  if ((v45 & 0x20) != 0) {
    goto LABEL_17;
  }
LABEL_10:
  if (v45 < 0) {
    goto LABEL_18;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_80;
  }
  privatizedIdentifier = self->_privatizedIdentifier;
  if ((unint64_t)privatizedIdentifier | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](privatizedIdentifier, "isEqual:")) {
      goto LABEL_80;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[212] & 0x10) == 0 || self->_feedbackDeprecated != *((_DWORD *)v4 + 10)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 0x10) != 0)
  {
LABEL_80:
    BOOL v24 = 0;
    goto LABEL_81;
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if ((unint64_t)privatizedTransportBundleId | *((void *)v4 + 21)
    && !-[NSString isEqual:](privatizedTransportBundleId, "isEqual:"))
  {
    goto LABEL_80;
  }
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  if ((unint64_t)timeSinceLastOutgoingInteraction | *((void *)v4 + 24))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceLastOutgoingInteraction, "isEqual:")) {
      goto LABEL_80;
    }
  }
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  if ((unint64_t)timeSinceOutgoingInteractionNumber10 | *((void *)v4 + 25))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceOutgoingInteractionNumber10, "isEqual:")) {
      goto LABEL_80;
    }
  }
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  if ((unint64_t)timeSinceLastIncomingInteraction | *((void *)v4 + 23))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](timeSinceLastIncomingInteraction, "isEqual:")) {
      goto LABEL_80;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[212] & 2) == 0 || self->_deprecatedField1 != *((double *)v4 + 2)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 2) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[212] & 4) == 0 || self->_deprecatedField2 != *((double *)v4 + 3)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 4) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[212] & 8) == 0 || self->_deprecatedField3 != *((double *)v4 + 4)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 8) != 0)
  {
    goto LABEL_80;
  }
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  if ((unint64_t)numberOfSharesWithConversation | *((void *)v4 + 19)
    && !-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesWithConversation, "isEqual:"))
  {
    goto LABEL_80;
  }
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  if ((unint64_t)numberOfSharesFromCurrentAppWithConversation | *((void *)v4 + 15))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesFromCurrentAppWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  if ((unint64_t)numberOfSharesOfTopDomainURLWithConversation | *((void *)v4 + 18))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfTopDomainURLWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  if ((unint64_t)numberOfSharesOfDetectedPeopleWithConversation | *((void *)v4 + 16))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfDetectedPeopleWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  if ((unint64_t)numberOfSharesOfPeopleInPhotoWithConversation | *((void *)v4 + 17))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfSharesOfPeopleInPhotoWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  if ((unint64_t)numberOfOutgoingInteractionsWithConversation | *((void *)v4 + 14))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfOutgoingInteractionsWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  if ((unint64_t)numberOfIncomingInteractionsWithConversation | *((void *)v4 + 12))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfIncomingInteractionsWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  if ((unint64_t)numberOfInteractionsDuringTimePeriodWithConversation | *((void *)v4 + 13))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfInteractionsDuringTimePeriodWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsWithConversation | *((void *)v4 + 11))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsFromCurrentAppWithConversation | *((void *)v4 + 7))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsFromCurrentAppWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfTopDomainURLWithConversation | *((void *)v4 + 10))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation | *((void *)v4 + 8))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "isEqual:"))goto LABEL_80; {
  }
    }
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  if ((unint64_t)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation | *((void *)v4 + 9))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "isEqual:"))goto LABEL_80; {
  }
    }
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  if ((unint64_t)hasEverSharePlayedWithConversation | *((void *)v4 + 6))
  {
    if (!-[PeopleSuggesterFeatureDouble isEqual:](hasEverSharePlayedWithConversation, "isEqual:")) {
      goto LABEL_80;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[212] & 0x40) == 0 || self->_suggestedRank != *((_DWORD *)v4 + 44)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 0x40) != 0)
  {
    goto LABEL_80;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[212] & 1) == 0 || self->_coreMLModelScore != *((double *)v4 + 1)) {
      goto LABEL_80;
    }
  }
  else if (v4[212])
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[212] & 0x20) == 0 || self->_foundInChunk != *((_DWORD *)v4 + 11)) {
      goto LABEL_80;
    }
  }
  else if ((v4[212] & 0x20) != 0)
  {
    goto LABEL_80;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v4[212] & 0x80) == 0 || self->_updatedInChunk != *((_DWORD *)v4 + 52)) {
      goto LABEL_80;
    }
    BOOL v24 = 1;
  }
  else
  {
    BOOL v24 = v4[212] >= 0;
  }
LABEL_81:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v53 = [(NSString *)self->_privatizedIdentifier hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v52 = 2654435761 * self->_feedbackDeprecated;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_privatizedTransportBundleId hash];
  unint64_t v50 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceLastOutgoingInteraction hash];
  unint64_t v49 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceOutgoingInteractionNumber10 hash];
  unint64_t v48 = [(PeopleSuggesterFeatureDouble *)self->_timeSinceLastIncomingInteraction hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double deprecatedField1 = self->_deprecatedField1;
    double v6 = -deprecatedField1;
    if (deprecatedField1 >= 0.0) {
      double v6 = self->_deprecatedField1;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0)
  {
    double deprecatedField2 = self->_deprecatedField2;
    double v10 = -deprecatedField2;
    if (deprecatedField2 >= 0.0) {
      double v10 = self->_deprecatedField2;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v13 += (unint64_t)v12;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v12);
    }
    unint64_t v47 = v13;
  }
  else
  {
    unint64_t v47 = 0;
  }
  if ((has & 8) != 0)
  {
    double deprecatedField3 = self->_deprecatedField3;
    double v15 = -deprecatedField3;
    if (deprecatedField3 >= 0.0) {
      double v15 = self->_deprecatedField3;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    double v18 = fmod(v16, 1.84467441e19);
    unint64_t v19 = 2654435761u * (unint64_t)v18;
    unint64_t v20 = v19 + (unint64_t)v17;
    if (v17 <= 0.0) {
      unint64_t v20 = 2654435761u * (unint64_t)v18;
    }
    unint64_t v21 = v19 - (unint64_t)fabs(v17);
    if (v17 >= 0.0) {
      unint64_t v21 = v20;
    }
    unint64_t v46 = v21;
  }
  else
  {
    unint64_t v46 = 0;
  }
  unint64_t v45 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesWithConversation hash];
  unint64_t v44 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesFromCurrentAppWithConversation hash];
  unint64_t v43 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfTopDomainURLWithConversation hash];
  unint64_t v42 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfDetectedPeopleWithConversation hash];
  unint64_t v41 = [(PeopleSuggesterFeatureDouble *)self->_numberOfSharesOfPeopleInPhotoWithConversation hash];
  unint64_t v40 = [(PeopleSuggesterFeatureDouble *)self->_numberOfOutgoingInteractionsWithConversation hash];
  unint64_t v39 = [(PeopleSuggesterFeatureDouble *)self->_numberOfIncomingInteractionsWithConversation hash];
  unint64_t v38 = [(PeopleSuggesterFeatureDouble *)self->_numberOfInteractionsDuringTimePeriodWithConversation hash];
  unint64_t v22 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsWithConversation hash];
  unint64_t v23 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation hash];
  unint64_t v24 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation hash];
  unint64_t v25 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation hash];
  unint64_t v26 = [(PeopleSuggesterFeatureDouble *)self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation hash];
  unint64_t v27 = [(PeopleSuggesterFeatureDouble *)self->_hasEverSharePlayedWithConversation hash];
  char v28 = (char)self->_has;
  if ((v28 & 0x40) != 0)
  {
    uint64_t v29 = 2654435761 * self->_suggestedRank;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_32;
    }
LABEL_37:
    unint64_t v34 = 0;
    goto LABEL_40;
  }
  uint64_t v29 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_37;
  }
LABEL_32:
  double coreMLModelScore = self->_coreMLModelScore;
  double v31 = -coreMLModelScore;
  if (coreMLModelScore >= 0.0) {
    double v31 = self->_coreMLModelScore;
  }
  long double v32 = floor(v31 + 0.5);
  double v33 = (v31 - v32) * 1.84467441e19;
  unint64_t v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0) {
      v34 += (unint64_t)v33;
    }
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
LABEL_40:
  if ((v28 & 0x20) != 0)
  {
    uint64_t v35 = 2654435761 * self->_foundInChunk;
    if (v28 < 0) {
      goto LABEL_42;
    }
LABEL_44:
    uint64_t v36 = 0;
    return v52 ^ v53 ^ v51 ^ v50 ^ v49 ^ v48 ^ v4 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v34 ^ v35 ^ v36;
  }
  uint64_t v35 = 0;
  if ((v28 & 0x80) == 0) {
    goto LABEL_44;
  }
LABEL_42:
  uint64_t v36 = 2654435761 * self->_updatedInChunk;
  return v52 ^ v53 ^ v51 ^ v50 ^ v49 ^ v48 ^ v4 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v29 ^ v34 ^ v35 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v41 = v4;
  if (*((void *)v4 + 20))
  {
    -[PeopleSuggesterCandidate setPrivatizedIdentifier:](self, "setPrivatizedIdentifier:");
    id v4 = v41;
  }
  if ((*((unsigned char *)v4 + 212) & 0x10) != 0)
  {
    self->_uint64_t feedbackDeprecated = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 21))
  {
    -[PeopleSuggesterCandidate setPrivatizedTransportBundleId:](self, "setPrivatizedTransportBundleId:");
    id v4 = v41;
  }
  timeSinceLastOutgoingInteraction = self->_timeSinceLastOutgoingInteraction;
  uint64_t v6 = *((void *)v4 + 24);
  if (timeSinceLastOutgoingInteraction)
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceLastOutgoingInteraction, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_13;
    }
    -[PeopleSuggesterCandidate setTimeSinceLastOutgoingInteraction:](self, "setTimeSinceLastOutgoingInteraction:");
  }
  id v4 = v41;
LABEL_13:
  timeSinceOutgoingInteractionNumber10 = self->_timeSinceOutgoingInteractionNumber10;
  uint64_t v8 = *((void *)v4 + 25);
  if (timeSinceOutgoingInteractionNumber10)
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceOutgoingInteractionNumber10, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_19;
    }
    -[PeopleSuggesterCandidate setTimeSinceOutgoingInteractionNumber10:](self, "setTimeSinceOutgoingInteractionNumber10:");
  }
  id v4 = v41;
LABEL_19:
  timeSinceLastIncomingInteraction = self->_timeSinceLastIncomingInteraction;
  uint64_t v10 = *((void *)v4 + 23);
  if (timeSinceLastIncomingInteraction)
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](timeSinceLastIncomingInteraction, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_25;
    }
    -[PeopleSuggesterCandidate setTimeSinceLastIncomingInteraction:](self, "setTimeSinceLastIncomingInteraction:");
  }
  id v4 = v41;
LABEL_25:
  char v11 = *((unsigned char *)v4 + 212);
  if ((v11 & 2) != 0)
  {
    self->_double deprecatedField1 = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v11 = *((unsigned char *)v4 + 212);
    if ((v11 & 4) == 0)
    {
LABEL_27:
      if ((v11 & 8) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_double deprecatedField2 = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 212) & 8) != 0)
  {
LABEL_28:
    self->_double deprecatedField3 = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_29:
  numberOfSharesWithConversation = self->_numberOfSharesWithConversation;
  uint64_t v13 = *((void *)v4 + 19);
  if (numberOfSharesWithConversation)
  {
    if (!v13) {
      goto LABEL_38;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_38;
    }
    -[PeopleSuggesterCandidate setNumberOfSharesWithConversation:](self, "setNumberOfSharesWithConversation:");
  }
  id v4 = v41;
LABEL_38:
  numberOfSharesFromCurrentAppWithConversation = self->_numberOfSharesFromCurrentAppWithConversation;
  uint64_t v15 = *((void *)v4 + 15);
  if (numberOfSharesFromCurrentAppWithConversation)
  {
    if (!v15) {
      goto LABEL_44;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesFromCurrentAppWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_44;
    }
    -[PeopleSuggesterCandidate setNumberOfSharesFromCurrentAppWithConversation:](self, "setNumberOfSharesFromCurrentAppWithConversation:");
  }
  id v4 = v41;
LABEL_44:
  numberOfSharesOfTopDomainURLWithConversation = self->_numberOfSharesOfTopDomainURLWithConversation;
  uint64_t v17 = *((void *)v4 + 18);
  if (numberOfSharesOfTopDomainURLWithConversation)
  {
    if (!v17) {
      goto LABEL_50;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfTopDomainURLWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_50;
    }
    -[PeopleSuggesterCandidate setNumberOfSharesOfTopDomainURLWithConversation:](self, "setNumberOfSharesOfTopDomainURLWithConversation:");
  }
  id v4 = v41;
LABEL_50:
  numberOfSharesOfDetectedPeopleWithConversation = self->_numberOfSharesOfDetectedPeopleWithConversation;
  uint64_t v19 = *((void *)v4 + 16);
  if (numberOfSharesOfDetectedPeopleWithConversation)
  {
    if (!v19) {
      goto LABEL_56;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfDetectedPeopleWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_56;
    }
    -[PeopleSuggesterCandidate setNumberOfSharesOfDetectedPeopleWithConversation:](self, "setNumberOfSharesOfDetectedPeopleWithConversation:");
  }
  id v4 = v41;
LABEL_56:
  numberOfSharesOfPeopleInPhotoWithConversation = self->_numberOfSharesOfPeopleInPhotoWithConversation;
  uint64_t v21 = *((void *)v4 + 17);
  if (numberOfSharesOfPeopleInPhotoWithConversation)
  {
    if (!v21) {
      goto LABEL_62;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfSharesOfPeopleInPhotoWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_62;
    }
    -[PeopleSuggesterCandidate setNumberOfSharesOfPeopleInPhotoWithConversation:](self, "setNumberOfSharesOfPeopleInPhotoWithConversation:");
  }
  id v4 = v41;
LABEL_62:
  numberOfOutgoingInteractionsWithConversation = self->_numberOfOutgoingInteractionsWithConversation;
  uint64_t v23 = *((void *)v4 + 14);
  if (numberOfOutgoingInteractionsWithConversation)
  {
    if (!v23) {
      goto LABEL_68;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfOutgoingInteractionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v23) {
      goto LABEL_68;
    }
    -[PeopleSuggesterCandidate setNumberOfOutgoingInteractionsWithConversation:](self, "setNumberOfOutgoingInteractionsWithConversation:");
  }
  id v4 = v41;
LABEL_68:
  numberOfIncomingInteractionsWithConversation = self->_numberOfIncomingInteractionsWithConversation;
  uint64_t v25 = *((void *)v4 + 12);
  if (numberOfIncomingInteractionsWithConversation)
  {
    if (!v25) {
      goto LABEL_74;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfIncomingInteractionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v25) {
      goto LABEL_74;
    }
    -[PeopleSuggesterCandidate setNumberOfIncomingInteractionsWithConversation:](self, "setNumberOfIncomingInteractionsWithConversation:");
  }
  id v4 = v41;
LABEL_74:
  numberOfInteractionsDuringTimePeriodWithConversation = self->_numberOfInteractionsDuringTimePeriodWithConversation;
  uint64_t v27 = *((void *)v4 + 13);
  if (numberOfInteractionsDuringTimePeriodWithConversation)
  {
    if (!v27) {
      goto LABEL_80;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfInteractionsDuringTimePeriodWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v27) {
      goto LABEL_80;
    }
    -[PeopleSuggesterCandidate setNumberOfInteractionsDuringTimePeriodWithConversation:](self, "setNumberOfInteractionsDuringTimePeriodWithConversation:");
  }
  id v4 = v41;
LABEL_80:
  numberOfEngagedSuggestionsWithConversation = self->_numberOfEngagedSuggestionsWithConversation;
  uint64_t v29 = *((void *)v4 + 11);
  if (numberOfEngagedSuggestionsWithConversation)
  {
    if (!v29) {
      goto LABEL_86;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v29) {
      goto LABEL_86;
    }
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsWithConversation:](self, "setNumberOfEngagedSuggestionsWithConversation:");
  }
  id v4 = v41;
LABEL_86:
  numberOfEngagedSuggestionsFromCurrentAppWithConversation = self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
  uint64_t v31 = *((void *)v4 + 7);
  if (numberOfEngagedSuggestionsFromCurrentAppWithConversation)
  {
    if (!v31) {
      goto LABEL_92;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsFromCurrentAppWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v31) {
      goto LABEL_92;
    }
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:](self, "setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:");
  }
  id v4 = v41;
LABEL_92:
  numberOfEngagedSuggestionsOfTopDomainURLWithConversation = self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
  uint64_t v33 = *((void *)v4 + 10);
  if (numberOfEngagedSuggestionsOfTopDomainURLWithConversation)
  {
    if (!v33) {
      goto LABEL_98;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfTopDomainURLWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v33) {
      goto LABEL_98;
    }
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:](self, "setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:");
  }
  id v4 = v41;
LABEL_98:
  numberOfEngagedSuggestionsOfDetectedPeopleWithConversation = self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
  uint64_t v35 = *((void *)v4 + 8);
  if (numberOfEngagedSuggestionsOfDetectedPeopleWithConversation)
  {
    if (!v35) {
      goto LABEL_104;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v35) {
      goto LABEL_104;
    }
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:](self, "setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:");
  }
  id v4 = v41;
LABEL_104:
  numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation = self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
  uint64_t v37 = *((void *)v4 + 9);
  if (numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation)
  {
    if (!v37) {
      goto LABEL_110;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v37) {
      goto LABEL_110;
    }
    -[PeopleSuggesterCandidate setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:](self, "setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:");
  }
  id v4 = v41;
LABEL_110:
  hasEverSharePlayedWithConversation = self->_hasEverSharePlayedWithConversation;
  uint64_t v39 = *((void *)v4 + 6);
  if (hasEverSharePlayedWithConversation)
  {
    if (!v39) {
      goto LABEL_116;
    }
    -[PeopleSuggesterFeatureDouble mergeFrom:](hasEverSharePlayedWithConversation, "mergeFrom:");
  }
  else
  {
    if (!v39) {
      goto LABEL_116;
    }
    -[PeopleSuggesterCandidate setHasEverSharePlayedWithConversation:](self, "setHasEverSharePlayedWithConversation:");
  }
  id v4 = v41;
LABEL_116:
  char v40 = *((unsigned char *)v4 + 212);
  if ((v40 & 0x40) != 0)
  {
    self->_suggestedRank = *((_DWORD *)v4 + 44);
    *(unsigned char *)&self->_has |= 0x40u;
    char v40 = *((unsigned char *)v4 + 212);
    if ((v40 & 1) == 0)
    {
LABEL_118:
      if ((v40 & 0x20) == 0) {
        goto LABEL_119;
      }
LABEL_125:
      self->_foundInChunk = *((_DWORD *)v4 + 11);
      *(unsigned char *)&self->_has |= 0x20u;
      if ((*((unsigned char *)v4 + 212) & 0x80) == 0) {
        goto LABEL_120;
      }
      goto LABEL_126;
    }
  }
  else if ((*((unsigned char *)v4 + 212) & 1) == 0)
  {
    goto LABEL_118;
  }
  self->_double coreMLModelScore = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v40 = *((unsigned char *)v4 + 212);
  if ((v40 & 0x20) != 0) {
    goto LABEL_125;
  }
LABEL_119:
  if ((v40 & 0x80) == 0) {
    goto LABEL_120;
  }
LABEL_126:
  self->_updatedInChunk = *((_DWORD *)v4 + 52);
  *(unsigned char *)&self->_has |= 0x80u;
LABEL_120:

  MEMORY[0x1F41817F8]();
}

- (NSString)privatizedIdentifier
{
  return self->_privatizedIdentifier;
}

- (void)setPrivatizedIdentifier:(id)a3
{
}

- (NSString)privatizedTransportBundleId
{
  return self->_privatizedTransportBundleId;
}

- (void)setPrivatizedTransportBundleId:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)timeSinceLastOutgoingInteraction
{
  return self->_timeSinceLastOutgoingInteraction;
}

- (void)setTimeSinceLastOutgoingInteraction:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)timeSinceOutgoingInteractionNumber10
{
  return self->_timeSinceOutgoingInteractionNumber10;
}

- (void)setTimeSinceOutgoingInteractionNumber10:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)timeSinceLastIncomingInteraction
{
  return self->_timeSinceLastIncomingInteraction;
}

- (void)setTimeSinceLastIncomingInteraction:(id)a3
{
}

- (double)deprecatedField1
{
  return self->_deprecatedField1;
}

- (double)deprecatedField2
{
  return self->_deprecatedField2;
}

- (double)deprecatedField3
{
  return self->_deprecatedField3;
}

- (PeopleSuggesterFeatureDouble)numberOfSharesWithConversation
{
  return self->_numberOfSharesWithConversation;
}

- (void)setNumberOfSharesWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfSharesFromCurrentAppWithConversation
{
  return self->_numberOfSharesFromCurrentAppWithConversation;
}

- (void)setNumberOfSharesFromCurrentAppWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfTopDomainURLWithConversation
{
  return self->_numberOfSharesOfTopDomainURLWithConversation;
}

- (void)setNumberOfSharesOfTopDomainURLWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfDetectedPeopleWithConversation
{
  return self->_numberOfSharesOfDetectedPeopleWithConversation;
}

- (void)setNumberOfSharesOfDetectedPeopleWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfSharesOfPeopleInPhotoWithConversation
{
  return self->_numberOfSharesOfPeopleInPhotoWithConversation;
}

- (void)setNumberOfSharesOfPeopleInPhotoWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfOutgoingInteractionsWithConversation
{
  return self->_numberOfOutgoingInteractionsWithConversation;
}

- (void)setNumberOfOutgoingInteractionsWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfIncomingInteractionsWithConversation
{
  return self->_numberOfIncomingInteractionsWithConversation;
}

- (void)setNumberOfIncomingInteractionsWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfInteractionsDuringTimePeriodWithConversation
{
  return self->_numberOfInteractionsDuringTimePeriodWithConversation;
}

- (void)setNumberOfInteractionsDuringTimePeriodWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsWithConversation
{
  return self->_numberOfEngagedSuggestionsWithConversation;
}

- (void)setNumberOfEngagedSuggestionsWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsFromCurrentAppWithConversation
{
  return self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation;
}

- (void)setNumberOfEngagedSuggestionsFromCurrentAppWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfTopDomainURLWithConversation
{
  return self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfTopDomainURLWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfDetectedPeopleWithConversation
{
  return self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfDetectedPeopleWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation
{
  return self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation;
}

- (void)setNumberOfEngagedSuggestionsOfPeopleInPhotoWithConversation:(id)a3
{
}

- (PeopleSuggesterFeatureDouble)hasEverSharePlayedWithConversation
{
  return self->_hasEverSharePlayedWithConversation;
}

- (void)setHasEverSharePlayedWithConversation:(id)a3
{
}

- (int)suggestedRank
{
  return self->_suggestedRank;
}

- (double)coreMLModelScore
{
  return self->_coreMLModelScore;
}

- (int)foundInChunk
{
  return self->_foundInChunk;
}

- (int)updatedInChunk
{
  return self->_updatedInChunk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSinceOutgoingInteractionNumber10, 0);
  objc_storeStrong((id *)&self->_timeSinceLastOutgoingInteraction, 0);
  objc_storeStrong((id *)&self->_timeSinceLastIncomingInteraction, 0);
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, 0);
  objc_storeStrong((id *)&self->_privatizedIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfSharesWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfTopDomainURLWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfPeopleInPhotoWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesOfDetectedPeopleWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfSharesFromCurrentAppWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfOutgoingInteractionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfInteractionsDuringTimePeriodWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfIncomingInteractionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfTopDomainURLWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsOfDetectedPeopleWithConversation, 0);
  objc_storeStrong((id *)&self->_numberOfEngagedSuggestionsFromCurrentAppWithConversation, 0);

  objc_storeStrong((id *)&self->_hasEverSharePlayedWithConversation, 0);
}

@end
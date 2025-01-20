@interface PeopleSuggesterFeedbackMessage
- (BOOL)hasFeedbackType;
- (BOOL)hasPrivatizedCandidateIdentifier;
- (BOOL)hasPrivatizedTransportBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)privatizedCandidateIdentifier;
- (NSString)privatizedTransportBundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedbackTypeAsString:(int)a3;
- (int)StringAsFeedbackType:(id)a3;
- (int)feedbackType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeedbackType:(int)a3;
- (void)setHasFeedbackType:(BOOL)a3;
- (void)setPrivatizedCandidateIdentifier:(id)a3;
- (void)setPrivatizedTransportBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeopleSuggesterFeedbackMessage

- (BOOL)hasPrivatizedCandidateIdentifier
{
  return self->_privatizedCandidateIdentifier != 0;
}

- (BOOL)hasPrivatizedTransportBundleId
{
  return self->_privatizedTransportBundleId != 0;
}

- (int)feedbackType
{
  if (*(unsigned char *)&self->_has) {
    return self->_feedbackType;
  }
  else {
    return 0;
  }
}

- (void)setFeedbackType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedbackType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5ADFDA8[a3];
  }

  return v3;
}

- (int)StringAsFeedbackType:(id)a3
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeopleSuggesterFeedbackMessage;
  int v4 = [(PeopleSuggesterFeedbackMessage *)&v8 description];
  v5 = [(PeopleSuggesterFeedbackMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  privatizedCandidateIdentifier = self->_privatizedCandidateIdentifier;
  if (privatizedCandidateIdentifier) {
    [v3 setObject:privatizedCandidateIdentifier forKey:@"privatizedCandidateIdentifier"];
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if (privatizedTransportBundleId) {
    [v4 setObject:privatizedTransportBundleId forKey:@"privatizedTransportBundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t feedbackType = self->_feedbackType;
    if (feedbackType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedbackType);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E5ADFDA8[feedbackType];
    }
    [v4 setObject:v8 forKey:@"feedbackType"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterFeedbackMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privatizedCandidateIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_privatizedTransportBundleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_privatizedCandidateIdentifier)
  {
    objc_msgSend(v4, "setPrivatizedCandidateIdentifier:");
    id v4 = v5;
  }
  if (self->_privatizedTransportBundleId)
  {
    objc_msgSend(v5, "setPrivatizedTransportBundleId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_feedbackType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_privatizedCandidateIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_privatizedTransportBundleId copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_feedbackType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  privatizedCandidateIdentifier = self->_privatizedCandidateIdentifier;
  if ((unint64_t)privatizedCandidateIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](privatizedCandidateIdentifier, "isEqual:")) {
      goto LABEL_10;
    }
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if ((unint64_t)privatizedTransportBundleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](privatizedTransportBundleId, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_feedbackType == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_privatizedCandidateIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_privatizedTransportBundleId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_feedbackType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (int *)a3;
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[PeopleSuggesterFeedbackMessage setPrivatizedCandidateIdentifier:](self, "setPrivatizedCandidateIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[PeopleSuggesterFeedbackMessage setPrivatizedTransportBundleId:](self, "setPrivatizedTransportBundleId:");
    NSUInteger v4 = v5;
  }
  if (v4[8])
  {
    self->_uint64_t feedbackType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)privatizedCandidateIdentifier
{
  return self->_privatizedCandidateIdentifier;
}

- (void)setPrivatizedCandidateIdentifier:(id)a3
{
}

- (NSString)privatizedTransportBundleId
{
  return self->_privatizedTransportBundleId;
}

- (void)setPrivatizedTransportBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, 0);

  objc_storeStrong((id *)&self->_privatizedCandidateIdentifier, 0);
}

@end
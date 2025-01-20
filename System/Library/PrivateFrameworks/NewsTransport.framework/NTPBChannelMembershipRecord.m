@interface NTPBChannelMembershipRecord
- (BOOL)canAccessDrafts;
- (BOOL)hasBase;
- (BOOL)hasCanAccessDrafts;
- (BOOL)hasChannelID;
- (BOOL)hasDraftArticleListID;
- (BOOL)hasDraftIssueListID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)channelID;
- (NSString)draftArticleListID;
- (NSString)draftIssueListID;
- (NTPBRecordBase)base;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBase:(id)a3;
- (void)setCanAccessDrafts:(BOOL)a3;
- (void)setChannelID:(id)a3;
- (void)setDraftArticleListID:(id)a3;
- (void)setDraftIssueListID:(id)a3;
- (void)setHasCanAccessDrafts:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBChannelMembershipRecord

- (void)dealloc
{
  [(NTPBChannelMembershipRecord *)self setBase:0];
  [(NTPBChannelMembershipRecord *)self setChannelID:0];
  [(NTPBChannelMembershipRecord *)self setDraftArticleListID:0];
  [(NTPBChannelMembershipRecord *)self setDraftIssueListID:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBChannelMembershipRecord;
  [(NTPBChannelMembershipRecord *)&v3 dealloc];
}

- (BOOL)hasBase
{
  return self->_base != 0;
}

- (BOOL)hasChannelID
{
  return self->_channelID != 0;
}

- (void)setCanAccessDrafts:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_canAccessDrafts = a3;
}

- (void)setHasCanAccessDrafts:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCanAccessDrafts
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDraftArticleListID
{
  return self->_draftArticleListID != 0;
}

- (BOOL)hasDraftIssueListID
{
  return self->_draftIssueListID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBChannelMembershipRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBChannelMembershipRecord description](&v3, sel_description), -[NTPBChannelMembershipRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  base = self->_base;
  if (base) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBRecordBase dictionaryRepresentation](base, "dictionaryRepresentation"), @"base");
  }
  channelID = self->_channelID;
  if (channelID) {
    [v3 setObject:channelID forKey:@"channel_ID"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_canAccessDrafts), @"can_access_drafts");
  }
  draftArticleListID = self->_draftArticleListID;
  if (draftArticleListID) {
    [v3 setObject:draftArticleListID forKey:@"draft_article_list_ID"];
  }
  draftIssueListID = self->_draftIssueListID;
  if (draftIssueListID) {
    [v3 setObject:draftIssueListID forKey:@"draft_issue_list_ID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBChannelMembershipRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_base) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_draftArticleListID) {
    PBDataWriterWriteStringField();
  }
  if (self->_draftIssueListID)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 8) = [(NTPBRecordBase *)self->_base copyWithZone:a3];
  *(void *)(v5 + 16) = [(NSString *)self->_channelID copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_canAccessDrafts;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v5 + 24) = [(NSString *)self->_draftArticleListID copyWithZone:a3];
  *(void *)(v5 + 32) = [(NSString *)self->_draftIssueListID copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  base = self->_base;
  if ((unint64_t)base | *((void *)a3 + 1))
  {
    int v5 = -[NTPBRecordBase isEqual:](base, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  channelID = self->_channelID;
  if ((unint64_t)channelID | *((void *)a3 + 2))
  {
    int v5 = -[NSString isEqual:](channelID, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 44) & 1) == 0) {
      goto LABEL_16;
    }
LABEL_10:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 44) & 1) == 0) {
    goto LABEL_10;
  }
  if (self->_canAccessDrafts)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_10;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    goto LABEL_10;
  }
LABEL_16:
  draftArticleListID = self->_draftArticleListID;
  if (!((unint64_t)draftArticleListID | *((void *)a3 + 3))
    || (int v5 = -[NSString isEqual:](draftArticleListID, "isEqual:")) != 0)
  {
    draftIssueListID = self->_draftIssueListID;
    if ((unint64_t)draftIssueListID | *((void *)a3 + 4))
    {
      LOBYTE(v5) = -[NSString isEqual:](draftIssueListID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBRecordBase *)self->_base hash];
  NSUInteger v4 = [(NSString *)self->_channelID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_canAccessDrafts;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_draftArticleListID hash];
  return v6 ^ [(NSString *)self->_draftIssueListID hash];
}

- (void)mergeFrom:(id)a3
{
  base = self->_base;
  uint64_t v6 = *((void *)a3 + 1);
  if (base)
  {
    if (v6) {
      -[NTPBRecordBase mergeFrom:](base, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBChannelMembershipRecord setBase:](self, "setBase:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBChannelMembershipRecord setChannelID:](self, "setChannelID:");
  }
  if (*((unsigned char *)a3 + 44))
  {
    self->_canAccessDrafts = *((unsigned char *)a3 + 40);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 3)) {
    -[NTPBChannelMembershipRecord setDraftArticleListID:](self, "setDraftArticleListID:");
  }
  if (*((void *)a3 + 4))
  {
    -[NTPBChannelMembershipRecord setDraftIssueListID:](self, "setDraftIssueListID:");
  }
}

- (NTPBRecordBase)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
}

- (NSString)channelID
{
  return self->_channelID;
}

- (void)setChannelID:(id)a3
{
}

- (BOOL)canAccessDrafts
{
  return self->_canAccessDrafts;
}

- (NSString)draftArticleListID
{
  return self->_draftArticleListID;
}

- (void)setDraftArticleListID:(id)a3
{
}

- (NSString)draftIssueListID
{
  return self->_draftIssueListID;
}

- (void)setDraftIssueListID:(id)a3
{
}

@end
@interface NTPBIssueDownload
- (BOOL)hasDownloadLocation;
- (BOOL)hasDownloadState;
- (BOOL)hasDownloadType;
- (BOOL)hasIssueData;
- (BOOL)hasSourceChannelId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sourceChannelId;
- (NTPBIssueData)issueData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)downloadLocation;
- (int)downloadState;
- (int)downloadType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDownloadLocation:(int)a3;
- (void)setDownloadState:(int)a3;
- (void)setDownloadType:(int)a3;
- (void)setHasDownloadLocation:(BOOL)a3;
- (void)setHasDownloadState:(BOOL)a3;
- (void)setHasDownloadType:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueDownload

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (int)downloadLocation
{
  if (*(unsigned char *)&self->_has) {
    return self->_downloadLocation;
  }
  else {
    return 0;
  }
}

- (void)setDownloadLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_downloadLocation = a3;
}

- (void)setHasDownloadLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDownloadLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)downloadState
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_downloadState;
  }
  else {
    return 0;
  }
}

- (void)setDownloadState:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_downloadState = a3;
}

- (void)setHasDownloadState:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDownloadState
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)downloadType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_downloadType;
  }
  else {
    return 0;
  }
}

- (void)setDownloadType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_downloadType = a3;
}

- (void)setHasDownloadType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDownloadType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBIssueDownload;
  v4 = [(NTPBIssueDownload *)&v8 description];
  v5 = [(NTPBIssueDownload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  issueData = self->_issueData;
  if (issueData)
  {
    v5 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"issue_data"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithInt:self->_downloadLocation];
    [v3 setObject:v10 forKey:@"download_location"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v11 = [NSNumber numberWithInt:self->_downloadState];
  [v3 setObject:v11 forKey:@"download_state"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    v7 = [NSNumber numberWithInt:self->_downloadType];
    [v3 setObject:v7 forKey:@"download_type"];
  }
LABEL_7:
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueDownloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_7:
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 12) = self->_downloadState;
    *(unsigned char *)(v5 + 40) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 8) = self->_downloadLocation;
  *(unsigned char *)(v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_downloadType;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 3))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_downloadLocation != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_21:
    char v7 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_downloadState != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_downloadType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 4)) {
    char v7 = -[NSString isEqual:](sourceChannelId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NTPBIssueData *)self->_issueData hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_sourceChannelId hash];
  }
  uint64_t v4 = 2654435761 * self->_downloadLocation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_downloadState;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_downloadType;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_sourceChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  issueData = self->_issueData;
  uint64_t v6 = *((void *)v4 + 3);
  id v8 = v4;
  if (issueData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBIssueDownload setIssueData:](self, "setIssueData:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_downloadLocation = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_downloadState = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_10:
    self->_downloadType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_11:
  if (*((void *)v4 + 4)) {
    -[NTPBIssueDownload setSourceChannelId:](self, "setSourceChannelId:");
  }

  MEMORY[0x270F9A758]();
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);

  objc_storeStrong((id *)&self->_issueData, 0);
}

@end
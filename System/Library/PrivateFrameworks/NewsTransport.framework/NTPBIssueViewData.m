@interface NTPBIssueViewData
- (BOOL)hasIssueViewingSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)issueViewingSessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setIssueViewingSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueViewData

- (BOOL)hasIssueViewingSessionId
{
  return self->_issueViewingSessionId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBIssueViewData;
  v4 = [(NTPBIssueViewData *)&v8 description];
  v5 = [(NTPBIssueViewData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  issueViewingSessionId = self->_issueViewingSessionId;
  if (issueViewingSessionId) {
    [v3 setObject:issueViewingSessionId forKey:@"issue_viewing_session_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueViewDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_issueViewingSessionId) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_issueViewingSessionId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    issueViewingSessionId = self->_issueViewingSessionId;
    if ((unint64_t)issueViewingSessionId | v4[1]) {
      char v6 = -[NSData isEqual:](issueViewingSessionId, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_issueViewingSessionId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBIssueViewData setIssueViewingSessionId:](self, "setIssueViewingSessionId:");
  }
}

- (NSData)issueViewingSessionId
{
  return self->_issueViewingSessionId;
}

- (void)setIssueViewingSessionId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
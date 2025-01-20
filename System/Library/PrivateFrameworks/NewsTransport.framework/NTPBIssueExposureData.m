@interface NTPBIssueExposureData
- (BOOL)hasIssueSessionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)issueSessionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setIssueSessionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIssueExposureData

- (BOOL)hasIssueSessionId
{
  return self->_issueSessionId != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBIssueExposureData;
  v4 = [(NTPBIssueExposureData *)&v8 description];
  v5 = [(NTPBIssueExposureData *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  issueSessionId = self->_issueSessionId;
  if (issueSessionId) {
    [v3 setObject:issueSessionId forKey:@"issue_session_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIssueExposureDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_issueSessionId) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_issueSessionId copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    issueSessionId = self->_issueSessionId;
    if ((unint64_t)issueSessionId | v4[1]) {
      char v6 = -[NSData isEqual:](issueSessionId, "isEqual:");
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
  return [(NSData *)self->_issueSessionId hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBIssueExposureData setIssueSessionId:](self, "setIssueSessionId:");
  }
}

- (NSData)issueSessionId
{
  return self->_issueSessionId;
}

- (void)setIssueSessionId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
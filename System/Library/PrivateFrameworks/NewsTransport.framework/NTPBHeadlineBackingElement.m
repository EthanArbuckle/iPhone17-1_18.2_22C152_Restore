@interface NTPBHeadlineBackingElement
- (BOOL)hasArticleRecordData;
- (BOOL)hasParentIssueRecordData;
- (BOOL)hasSourceChannelRecordData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleRecordData;
- (NSData)parentIssueRecordData;
- (NSData)sourceChannelRecordData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleRecordData:(id)a3;
- (void)setParentIssueRecordData:(id)a3;
- (void)setSourceChannelRecordData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBHeadlineBackingElement

- (BOOL)hasArticleRecordData
{
  return self->_articleRecordData != 0;
}

- (BOOL)hasSourceChannelRecordData
{
  return self->_sourceChannelRecordData != 0;
}

- (BOOL)hasParentIssueRecordData
{
  return self->_parentIssueRecordData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBHeadlineBackingElement;
  v4 = [(NTPBHeadlineBackingElement *)&v8 description];
  v5 = [(NTPBHeadlineBackingElement *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  articleRecordData = self->_articleRecordData;
  if (articleRecordData) {
    [v3 setObject:articleRecordData forKey:@"article_record_data"];
  }
  sourceChannelRecordData = self->_sourceChannelRecordData;
  if (sourceChannelRecordData) {
    [v4 setObject:sourceChannelRecordData forKey:@"source_channel_record_data"];
  }
  parentIssueRecordData = self->_parentIssueRecordData;
  if (parentIssueRecordData) {
    [v4 setObject:parentIssueRecordData forKey:@"parent_issue_record_data"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBHeadlineBackingElementReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_articleRecordData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sourceChannelRecordData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_parentIssueRecordData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_articleRecordData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_sourceChannelRecordData copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSData *)self->_parentIssueRecordData copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((articleRecordData = self->_articleRecordData, !((unint64_t)articleRecordData | v4[1]))
     || -[NSData isEqual:](articleRecordData, "isEqual:"))
    && ((sourceChannelRecordData = self->_sourceChannelRecordData, !((unint64_t)sourceChannelRecordData | v4[3]))
     || -[NSData isEqual:](sourceChannelRecordData, "isEqual:")))
  {
    parentIssueRecordData = self->_parentIssueRecordData;
    if ((unint64_t)parentIssueRecordData | v4[2]) {
      char v8 = -[NSData isEqual:](parentIssueRecordData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_articleRecordData hash];
  uint64_t v4 = [(NSData *)self->_sourceChannelRecordData hash] ^ v3;
  return v4 ^ [(NSData *)self->_parentIssueRecordData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[NTPBHeadlineBackingElement setArticleRecordData:](self, "setArticleRecordData:");
  }
  if (v4[3]) {
    -[NTPBHeadlineBackingElement setSourceChannelRecordData:](self, "setSourceChannelRecordData:");
  }
  if (v4[2]) {
    -[NTPBHeadlineBackingElement setParentIssueRecordData:](self, "setParentIssueRecordData:");
  }
}

- (NSData)articleRecordData
{
  return self->_articleRecordData;
}

- (void)setArticleRecordData:(id)a3
{
}

- (NSData)sourceChannelRecordData
{
  return self->_sourceChannelRecordData;
}

- (void)setSourceChannelRecordData:(id)a3
{
}

- (NSData)parentIssueRecordData
{
  return self->_parentIssueRecordData;
}

- (void)setParentIssueRecordData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelRecordData, 0);
  objc_storeStrong((id *)&self->_parentIssueRecordData, 0);

  objc_storeStrong((id *)&self->_articleRecordData, 0);
}

@end
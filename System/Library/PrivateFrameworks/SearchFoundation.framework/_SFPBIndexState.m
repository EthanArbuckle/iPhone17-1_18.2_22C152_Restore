@interface _SFPBIndexState
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBIndexState)initWithDictionary:(id)a3;
- (_SFPBIndexState)initWithFacade:(id)a3;
- (_SFPBIndexState)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (int)indexedMessageCount;
- (int)percentAttachmentsIndexed;
- (int)percentMessagesIndexed;
- (int)searchIndex;
- (int)totalMessageCount;
- (unint64_t)hash;
- (void)setIndexedMessageCount:(int)a3;
- (void)setPercentAttachmentsIndexed:(int)a3;
- (void)setPercentMessagesIndexed:(int)a3;
- (void)setSearchIndex:(int)a3;
- (void)setTotalMessageCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBIndexState

- (_SFPBIndexState)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBIndexState *)self init];
  if (v5)
  {
    v6 = [v4 percentMessagesIndexed];

    if (v6)
    {
      v7 = [v4 percentMessagesIndexed];
      -[_SFPBIndexState setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", [v7 intValue]);
    }
    v8 = [v4 percentAttachmentsIndexed];

    if (v8)
    {
      v9 = [v4 percentAttachmentsIndexed];
      -[_SFPBIndexState setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", [v9 intValue]);
    }
    v10 = [v4 searchIndex];

    if (v10)
    {
      v11 = [v4 searchIndex];
      -[_SFPBIndexState setSearchIndex:](v5, "setSearchIndex:", [v11 intValue]);
    }
    v12 = [v4 totalMessageCount];

    if (v12)
    {
      v13 = [v4 totalMessageCount];
      -[_SFPBIndexState setTotalMessageCount:](v5, "setTotalMessageCount:", [v13 intValue]);
    }
    v14 = [v4 indexedMessageCount];

    if (v14)
    {
      v15 = [v4 indexedMessageCount];
      -[_SFPBIndexState setIndexedMessageCount:](v5, "setIndexedMessageCount:", [v15 intValue]);
    }
    v16 = v5;
  }

  return v5;
}

- (int)indexedMessageCount
{
  return self->_indexedMessageCount;
}

- (int)totalMessageCount
{
  return self->_totalMessageCount;
}

- (int)searchIndex
{
  return self->_searchIndex;
}

- (int)percentAttachmentsIndexed
{
  return self->_percentAttachmentsIndexed;
}

- (int)percentMessagesIndexed
{
  return self->_percentMessagesIndexed;
}

- (_SFPBIndexState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SFPBIndexState;
  v5 = [(_SFPBIndexState *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"percentMessagesIndexed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBIndexState setPercentMessagesIndexed:](v5, "setPercentMessagesIndexed:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"percentAttachmentsIndexed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBIndexState setPercentAttachmentsIndexed:](v5, "setPercentAttachmentsIndexed:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"searchIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBIndexState setSearchIndex:](v5, "setSearchIndex:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"totalMessageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBIndexState setTotalMessageCount:](v5, "setTotalMessageCount:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"indexedMessageCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBIndexState setIndexedMessageCount:](v5, "setIndexedMessageCount:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (_SFPBIndexState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBIndexState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBIndexState *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_indexedMessageCount)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBIndexState indexedMessageCount](self, "indexedMessageCount"));
    [v3 setObject:v4 forKeyedSubscript:@"indexedMessageCount"];
  }
  if (self->_percentAttachmentsIndexed)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBIndexState percentAttachmentsIndexed](self, "percentAttachmentsIndexed"));
    [v3 setObject:v5 forKeyedSubscript:@"percentAttachmentsIndexed"];
  }
  if (self->_percentMessagesIndexed)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBIndexState percentMessagesIndexed](self, "percentMessagesIndexed"));
    [v3 setObject:v6 forKeyedSubscript:@"percentMessagesIndexed"];
  }
  if (self->_searchIndex)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBIndexState searchIndex](self, "searchIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"searchIndex"];
  }
  if (self->_totalMessageCount)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBIndexState totalMessageCount](self, "totalMessageCount"));
    [v3 setObject:v8 forKeyedSubscript:@"totalMessageCount"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761 * self->_percentAttachmentsIndexed) ^ (2654435761 * self->_percentMessagesIndexed) ^ (2654435761 * self->_searchIndex) ^ (2654435761 * self->_totalMessageCount) ^ (2654435761 * self->_indexedMessageCount);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int percentMessagesIndexed = self->_percentMessagesIndexed,
        percentMessagesIndexed == [v4 percentMessagesIndexed])
    && (int percentAttachmentsIndexed = self->_percentAttachmentsIndexed,
        percentAttachmentsIndexed == [v4 percentAttachmentsIndexed])
    && (int searchIndex = self->_searchIndex, searchIndex == [v4 searchIndex])
    && (int totalMessageCount = self->_totalMessageCount,
        totalMessageCount == [v4 totalMessageCount]))
  {
    int indexedMessageCount = self->_indexedMessageCount;
    BOOL v10 = indexedMessageCount == [v4 indexedMessageCount];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ([(_SFPBIndexState *)self percentMessagesIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBIndexState *)self percentAttachmentsIndexed]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBIndexState *)self searchIndex]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBIndexState *)self totalMessageCount]) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = [(_SFPBIndexState *)self indexedMessageCount];
  v5 = v6;
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    v5 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBIndexStateReadFrom(self, (uint64_t)a3);
}

- (void)setIndexedMessageCount:(int)a3
{
  self->_int indexedMessageCount = a3;
}

- (void)setTotalMessageCount:(int)a3
{
  self->_int totalMessageCount = a3;
}

- (void)setSearchIndex:(int)a3
{
  self->_int searchIndex = a3;
}

- (void)setPercentAttachmentsIndexed:(int)a3
{
  self->_int percentAttachmentsIndexed = a3;
}

- (void)setPercentMessagesIndexed:(int)a3
{
  self->_int percentMessagesIndexed = a3;
}

@end
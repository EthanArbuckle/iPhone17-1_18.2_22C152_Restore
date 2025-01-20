@interface NPKProtoRelevantPassTuple
- (BOOL)hasRelevantText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)passID;
- (NSString)relevantText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPassID:(id)a3;
- (void)setRelevantText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRelevantPassTuple

- (BOOL)hasRelevantText
{
  return self->_relevantText != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRelevantPassTuple;
  v4 = [(NPKProtoRelevantPassTuple *)&v8 description];
  v5 = [(NPKProtoRelevantPassTuple *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  passID = self->_passID;
  if (passID) {
    [v3 setObject:passID forKey:@"passID"];
  }
  relevantText = self->_relevantText;
  if (relevantText) {
    [v4 setObject:relevantText forKey:@"relevantText"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRelevantPassTupleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_passID) {
    -[NPKProtoRelevantPassTuple writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (self->_relevantText) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setPassID:self->_passID];
  if (self->_relevantText) {
    objc_msgSend(v4, "setRelevantText:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_passID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_relevantText copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((passID = self->_passID, !((unint64_t)passID | v4[1]))
     || -[NSString isEqual:](passID, "isEqual:")))
  {
    relevantText = self->_relevantText;
    if ((unint64_t)relevantText | v4[2]) {
      char v7 = -[NSString isEqual:](relevantText, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_passID hash];
  return [(NSString *)self->_relevantText hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[NPKProtoRelevantPassTuple setPassID:](self, "setPassID:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoRelevantPassTuple setRelevantText:](self, "setRelevantText:");
    id v4 = v5;
  }
}

- (NSString)passID
{
  return self->_passID;
}

- (void)setPassID:(id)a3
{
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (void)setRelevantText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_passID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRelevantPassTuple writeTo:]", "NPKProtoRelevantPassTuple.m", 87, "nil != self->_passID");
}

@end
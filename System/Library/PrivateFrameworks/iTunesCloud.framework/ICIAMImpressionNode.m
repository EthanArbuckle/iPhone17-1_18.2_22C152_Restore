@interface ICIAMImpressionNode
- (BOOL)hasImpressionType;
- (BOOL)hasRecoAlgoId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)impressionType;
- (NSString)recoAlgoId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setImpressionType:(id)a3;
- (void)setRecoAlgoId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMImpressionNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoAlgoId, 0);

  objc_storeStrong((id *)&self->_impressionType, 0);
}

- (void)setRecoAlgoId:(id)a3
{
}

- (NSString)recoAlgoId
{
  return self->_recoAlgoId;
}

- (void)setImpressionType:(id)a3
{
}

- (NSString)impressionType
{
  return self->_impressionType;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ICIAMImpressionNode setImpressionType:](self, "setImpressionType:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ICIAMImpressionNode setRecoAlgoId:](self, "setRecoAlgoId:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_impressionType hash];
  return [(NSString *)self->_recoAlgoId hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((impressionType = self->_impressionType, !((unint64_t)impressionType | v4[1]))
     || -[NSString isEqual:](impressionType, "isEqual:")))
  {
    recoAlgoId = self->_recoAlgoId;
    if ((unint64_t)recoAlgoId | v4[2]) {
      char v7 = -[NSString isEqual:](recoAlgoId, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_impressionType copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_recoAlgoId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_impressionType)
  {
    objc_msgSend(v4, "setImpressionType:");
    id v4 = v5;
  }
  if (self->_recoAlgoId)
  {
    objc_msgSend(v5, "setRecoAlgoId:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_impressionType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recoAlgoId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMImpressionNodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  impressionType = self->_impressionType;
  if (impressionType) {
    [v3 setObject:impressionType forKey:@"impressionType"];
  }
  recoAlgoId = self->_recoAlgoId;
  if (recoAlgoId) {
    [v4 setObject:recoAlgoId forKey:@"recoAlgoId"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMImpressionNode;
  id v4 = [(ICIAMImpressionNode *)&v8 description];
  id v5 = [(ICIAMImpressionNode *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRecoAlgoId
{
  return self->_recoAlgoId != 0;
}

- (BOOL)hasImpressionType
{
  return self->_impressionType != 0;
}

@end
@interface PPPBExperimentalGroup
- (BOOL)hasAbGroupIdentifier;
- (BOOL)hasExperimentId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroupIdentifier;
- (NSString)experimentId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroupIdentifier:(id)a3;
- (void)setExperimentId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBExperimentalGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_abGroupIdentifier, 0);
}

- (void)setAbGroupIdentifier:(id)a3
{
}

- (NSString)abGroupIdentifier
{
  return self->_abGroupIdentifier;
}

- (void)setExperimentId:(id)a3
{
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[PPPBExperimentalGroup setExperimentId:](self, "setExperimentId:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[PPPBExperimentalGroup setAbGroupIdentifier:](self, "setAbGroupIdentifier:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_experimentId hash];
  return [(NSString *)self->_abGroupIdentifier hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((experimentId = self->_experimentId, !((unint64_t)experimentId | v4[2]))
     || -[NSString isEqual:](experimentId, "isEqual:")))
  {
    abGroupIdentifier = self->_abGroupIdentifier;
    if ((unint64_t)abGroupIdentifier | v4[1]) {
      char v7 = -[NSString isEqual:](abGroupIdentifier, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_experimentId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_abGroupIdentifier copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_experimentId)
  {
    objc_msgSend(v4, "setExperimentId:");
    id v4 = v5;
  }
  if (self->_abGroupIdentifier)
  {
    objc_msgSend(v5, "setAbGroupIdentifier:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_experimentId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_abGroupIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBExperimentalGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  experimentId = self->_experimentId;
  if (experimentId) {
    [v3 setObject:experimentId forKey:@"experimentId"];
  }
  abGroupIdentifier = self->_abGroupIdentifier;
  if (abGroupIdentifier) {
    [v4 setObject:abGroupIdentifier forKey:@"abGroupIdentifier"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBExperimentalGroup;
  id v4 = [(PPPBExperimentalGroup *)&v8 description];
  id v5 = [(PPPBExperimentalGroup *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAbGroupIdentifier
{
  return self->_abGroupIdentifier != 0;
}

- (BOOL)hasExperimentId
{
  return self->_experimentId != 0;
}

@end
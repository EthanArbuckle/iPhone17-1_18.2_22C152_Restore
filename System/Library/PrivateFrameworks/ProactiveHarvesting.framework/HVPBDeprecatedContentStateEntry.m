@interface HVPBDeprecatedContentStateEntry
- (BOOL)hasState;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HVPBContentState)state;
- (NSString)uniqueId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setState:(id)a3;
- (void)setUniqueId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HVPBDeprecatedContentStateEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueId, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

- (void)setState:(id)a3
{
}

- (HVPBContentState)state
{
  return self->_state;
}

- (void)setUniqueId:(id)a3
{
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[HVPBDeprecatedContentStateEntry setUniqueId:](self, "setUniqueId:");
    v4 = v7;
  }
  state = self->_state;
  uint64_t v6 = v4[1];
  if (state)
  {
    if (v6) {
      -[HVPBContentState mergeFrom:](state, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[HVPBDeprecatedContentStateEntry setState:](self, "setState:");
  }

  MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uniqueId hash];
  return [(HVPBContentState *)self->_state hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uniqueId = self->_uniqueId, !((unint64_t)uniqueId | v4[2]))
     || -[NSString isEqual:](uniqueId, "isEqual:")))
  {
    state = self->_state;
    if ((unint64_t)state | v4[1]) {
      char v7 = -[HVPBContentState isEqual:](state, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_uniqueId copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(HVPBContentState *)self->_state copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    objc_msgSend(v4, "setUniqueId:");
    id v4 = v5;
  }
  if (self->_state)
  {
    objc_msgSend(v5, "setState:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_uniqueId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_state)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HVPBDeprecatedContentStateEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uniqueId = self->_uniqueId;
  if (uniqueId) {
    [v3 setObject:uniqueId forKey:@"uniqueId"];
  }
  state = self->_state;
  if (state)
  {
    char v7 = [(HVPBContentState *)state dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"state"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HVPBDeprecatedContentStateEntry;
  id v4 = [(HVPBDeprecatedContentStateEntry *)&v8 description];
  id v5 = [(HVPBDeprecatedContentStateEntry *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasState
{
  return self->_state != 0;
}

- (BOOL)hasUniqueId
{
  return self->_uniqueId != 0;
}

@end
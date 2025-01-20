@interface OTEscrowMoveRequestContext
- (BOOL)hasCurrentFederation;
- (BOOL)hasEscrowRecordLabel;
- (BOOL)hasIntendedFederation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)currentFederation;
- (NSString)escrowRecordLabel;
- (NSString)intendedFederation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentFederation:(id)a3;
- (void)setEscrowRecordLabel:(id)a3;
- (void)setIntendedFederation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTEscrowMoveRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedFederation, 0);
  objc_storeStrong((id *)&self->_escrowRecordLabel, 0);
  objc_storeStrong((id *)&self->_currentFederation, 0);
}

- (void)setIntendedFederation:(id)a3
{
}

- (NSString)intendedFederation
{
  return self->_intendedFederation;
}

- (void)setCurrentFederation:(id)a3
{
}

- (NSString)currentFederation
{
  return self->_currentFederation;
}

- (void)setEscrowRecordLabel:(id)a3
{
}

- (NSString)escrowRecordLabel
{
  return self->_escrowRecordLabel;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[OTEscrowMoveRequestContext setEscrowRecordLabel:](self, "setEscrowRecordLabel:");
  }
  if (v4[1]) {
    -[OTEscrowMoveRequestContext setCurrentFederation:](self, "setCurrentFederation:");
  }
  if (v4[3]) {
    -[OTEscrowMoveRequestContext setIntendedFederation:](self, "setIntendedFederation:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_escrowRecordLabel hash];
  NSUInteger v4 = [(NSString *)self->_currentFederation hash] ^ v3;
  return v4 ^ [(NSString *)self->_intendedFederation hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((escrowRecordLabel = self->_escrowRecordLabel, !((unint64_t)escrowRecordLabel | v4[2]))
     || -[NSString isEqual:](escrowRecordLabel, "isEqual:"))
    && ((currentFederation = self->_currentFederation, !((unint64_t)currentFederation | v4[1]))
     || -[NSString isEqual:](currentFederation, "isEqual:")))
  {
    intendedFederation = self->_intendedFederation;
    if ((unint64_t)intendedFederation | v4[3]) {
      char v8 = -[NSString isEqual:](intendedFederation, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_escrowRecordLabel copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_currentFederation copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSString *)self->_intendedFederation copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_escrowRecordLabel)
  {
    objc_msgSend(v4, "setEscrowRecordLabel:");
    id v4 = v5;
  }
  if (self->_currentFederation)
  {
    objc_msgSend(v5, "setCurrentFederation:");
    id v4 = v5;
  }
  if (self->_intendedFederation)
  {
    objc_msgSend(v5, "setIntendedFederation:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_escrowRecordLabel)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_currentFederation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_intendedFederation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTEscrowMoveRequestContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  escrowRecordLabel = self->_escrowRecordLabel;
  if (escrowRecordLabel) {
    [v3 setObject:escrowRecordLabel forKey:@"escrowRecordLabel"];
  }
  currentFederation = self->_currentFederation;
  if (currentFederation) {
    [v4 setObject:currentFederation forKey:@"currentFederation"];
  }
  intendedFederation = self->_intendedFederation;
  if (intendedFederation) {
    [v4 setObject:intendedFederation forKey:@"intendedFederation"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTEscrowMoveRequestContext;
  id v4 = [(OTEscrowMoveRequestContext *)&v8 description];
  id v5 = [(OTEscrowMoveRequestContext *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIntendedFederation
{
  return self->_intendedFederation != 0;
}

- (BOOL)hasCurrentFederation
{
  return self->_currentFederation != 0;
}

- (BOOL)hasEscrowRecordLabel
{
  return self->_escrowRecordLabel != 0;
}

@end
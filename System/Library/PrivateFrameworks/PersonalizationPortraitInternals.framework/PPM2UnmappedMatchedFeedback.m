@interface PPM2UnmappedMatchedFeedback
- (BOOL)hasActiveTreatments;
- (BOOL)hasClientId;
- (BOOL)hasMappingId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)clientId;
- (NSString)mappingId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setClientId:(id)a3;
- (void)setMappingId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2UnmappedMatchedFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[2]) {
    -[PPM2UnmappedMatchedFeedback setClientId:](self, "setClientId:");
  }
  if (v4[3]) {
    -[PPM2UnmappedMatchedFeedback setMappingId:](self, "setMappingId:");
  }
  if (v4[1]) {
    -[PPM2UnmappedMatchedFeedback setActiveTreatments:](self, "setActiveTreatments:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_clientId hash];
  NSUInteger v4 = [(NSString *)self->_mappingId hash] ^ v3;
  return v4 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((clientId = self->_clientId, !((unint64_t)clientId | v4[2]))
     || -[NSString isEqual:](clientId, "isEqual:"))
    && ((mappingId = self->_mappingId, !((unint64_t)mappingId | v4[3]))
     || -[NSString isEqual:](mappingId, "isEqual:")))
  {
    activeTreatments = self->_activeTreatments;
    if ((unint64_t)activeTreatments | v4[1]) {
      char v8 = -[NSString isEqual:](activeTreatments, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_clientId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_mappingId copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientId)
  {
    objc_msgSend(v4, "setClientId:");
    id v4 = v5;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v5, "setMappingId:");
    id v4 = v5;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v5, "setActiveTreatments:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_clientId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_mappingId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2UnmappedMatchedFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v4 setObject:mappingId forKey:@"mappingId"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v4 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2UnmappedMatchedFeedback;
  id v4 = [(PPM2UnmappedMatchedFeedback *)&v8 description];
  id v5 = [(PPM2UnmappedMatchedFeedback *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

@end
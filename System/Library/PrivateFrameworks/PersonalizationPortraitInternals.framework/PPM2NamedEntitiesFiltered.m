@interface PPM2NamedEntitiesFiltered
- (BOOL)hasActiveTreatments;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2NamedEntitiesFiltered

- (void).cxx_destruct
{
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PPM2NamedEntitiesFiltered setActiveTreatments:](self, "setActiveTreatments:");
  }
}

- (unint64_t)hash
{
  return [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    activeTreatments = self->_activeTreatments;
    if ((unint64_t)activeTreatments | v4[1]) {
      char v6 = -[NSString isEqual:](activeTreatments, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [a3 setActiveTreatments:activeTreatments];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2NamedEntitiesFilteredReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2NamedEntitiesFiltered;
  v4 = [(PPM2NamedEntitiesFiltered *)&v8 description];
  v5 = [(PPM2NamedEntitiesFiltered *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

@end
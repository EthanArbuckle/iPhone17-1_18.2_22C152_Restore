@interface PPM2ExperimentDeployed
- (BOOL)hasActiveTreatments;
- (BOOL)hasDelay;
- (BOOL)hasNamespaceName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)namespaceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)delay;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setDelay:(unsigned int)a3;
- (void)setHasDelay:(BOOL)a3;
- (void)setNamespaceName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2ExperimentDeployed

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setNamespaceName:(id)a3
{
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (unsigned)delay
{
  return self->_delay;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[8])
  {
    self->_delay = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PPM2ExperimentDeployed setNamespaceName:](self, "setNamespaceName:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PPM2ExperimentDeployed setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_delay;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_namespaceName hash] ^ v3;
  return v4 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_delay != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  namespaceName = self->_namespaceName;
  if ((unint64_t)namespaceName | *((void *)v4 + 3)
    && !-[NSString isEqual:](namespaceName, "isEqual:"))
  {
    goto LABEL_11;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_delay;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_namespaceName copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_delay;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_namespaceName)
  {
    objc_msgSend(v4, "setNamespaceName:");
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_namespaceName)
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
  return PPM2ExperimentDeployedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_delay];
    [v3 setObject:v4 forKey:@"delay"];
  }
  namespaceName = self->_namespaceName;
  if (namespaceName) {
    [v3 setObject:namespaceName forKey:@"namespaceName"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2ExperimentDeployed;
  id v4 = [(PPM2ExperimentDeployed *)&v8 description];
  id v5 = [(PPM2ExperimentDeployed *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (BOOL)hasNamespaceName
{
  return self->_namespaceName != 0;
}

- (BOOL)hasDelay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDelay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDelay:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_delay = a3;
}

@end
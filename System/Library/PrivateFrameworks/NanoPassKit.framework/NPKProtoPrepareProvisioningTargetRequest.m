@interface NPKProtoPrepareProvisioningTargetRequest
- (BOOL)checkFamilyCircle;
- (BOOL)hasCheckFamilyCircle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)targetData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCheckFamilyCircle:(BOOL)a3;
- (void)setHasCheckFamilyCircle:(BOOL)a3;
- (void)setTargetData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPrepareProvisioningTargetRequest

- (void)setCheckFamilyCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_checkFamilyCircle = a3;
}

- (void)setHasCheckFamilyCircle:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCheckFamilyCircle
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPrepareProvisioningTargetRequest;
  v4 = [(NPKProtoPrepareProvisioningTargetRequest *)&v8 description];
  v5 = [(NPKProtoPrepareProvisioningTargetRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  targetData = self->_targetData;
  if (targetData) {
    [v3 setObject:targetData forKey:@"targetData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_checkFamilyCircle];
    [v4 setObject:v6 forKey:@"checkFamilyCircle"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPrepareProvisioningTargetRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_targetData) {
    -[NPKProtoPrepareProvisioningTargetRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setTargetData:self->_targetData];
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_checkFamilyCircle;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_targetData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_checkFamilyCircle;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  targetData = self->_targetData;
  if ((unint64_t)targetData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](targetData, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_checkFamilyCircle)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_targetData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_checkFamilyCircle;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoPrepareProvisioningTargetRequest setTargetData:](self, "setTargetData:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_checkFamilyCircle = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)targetData
{
  return self->_targetData;
}

- (void)setTargetData:(id)a3
{
}

- (BOOL)checkFamilyCircle
{
  return self->_checkFamilyCircle;
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoPrepareProvisioningTargetRequest writeTo:]", "NPKProtoPrepareProvisioningTargetRequest.m", 96, "nil != self->_targetData");
}

@end
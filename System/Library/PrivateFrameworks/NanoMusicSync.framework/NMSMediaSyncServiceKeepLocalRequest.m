@interface NMSMediaSyncServiceKeepLocalRequest
- (BOOL)hasEnableState;
- (BOOL)hasModelObject;
- (BOOL)hasOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NMSMediaSyncServiceKeepLocalOptions)options;
- (NMSMediaSyncServiceModelObject)modelObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)enableStateAsString:(int)a3;
- (int)StringAsEnableState:(id)a3;
- (int)enableState;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEnableState:(int)a3;
- (void)setHasEnableState:(BOOL)a3;
- (void)setModelObject:(id)a3;
- (void)setOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NMSMediaSyncServiceKeepLocalRequest

- (BOOL)hasModelObject
{
  return self->_modelObject != 0;
}

- (int)enableState
{
  if (*(unsigned char *)&self->_has) {
    return self->_enableState;
  }
  else {
    return 0;
  }
}

- (void)setEnableState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enableState = a3;
}

- (void)setHasEnableState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnableState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)enableStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_264634A70[a3];
  }

  return v3;
}

- (int)StringAsEnableState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Enabled"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Disabled"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Automatic"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Cancelled"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasOptions
{
  return self->_options != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NMSMediaSyncServiceKeepLocalRequest;
  int v4 = [(NMSMediaSyncServiceKeepLocalRequest *)&v8 description];
  v5 = [(NMSMediaSyncServiceKeepLocalRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  modelObject = self->_modelObject;
  if (modelObject)
  {
    v5 = [(NMSMediaSyncServiceModelObject *)modelObject dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"modelObject"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t enableState = self->_enableState;
    if (enableState >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_enableState);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_264634A70[enableState];
    }
    [v3 setObject:v7 forKey:@"enableState"];
  }
  options = self->_options;
  if (options)
  {
    v9 = [(NMSMediaSyncServiceKeepLocalOptions *)options dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"options"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NMSMediaSyncServiceKeepLocalRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modelObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_options)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_modelObject)
  {
    objc_msgSend(v4, "setModelObject:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_enableState;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_options)
  {
    objc_msgSend(v5, "setOptions:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NMSMediaSyncServiceModelObject *)self->_modelObject copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_enableState;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(NMSMediaSyncServiceKeepLocalOptions *)self->_options copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  modelObject = self->_modelObject;
  if ((unint64_t)modelObject | *((void *)v4 + 2))
  {
    if (!-[NMSMediaSyncServiceModelObject isEqual:](modelObject, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_enableState != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  options = self->_options;
  if ((unint64_t)options | *((void *)v4 + 3)) {
    char v7 = -[NMSMediaSyncServiceKeepLocalOptions isEqual:](options, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NMSMediaSyncServiceModelObject *)self->_modelObject hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_enableState;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NMSMediaSyncServiceKeepLocalOptions *)self->_options hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  modelObject = self->_modelObject;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (modelObject)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NMSMediaSyncServiceModelObject mergeFrom:](modelObject, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NMSMediaSyncServiceKeepLocalRequest setModelObject:](self, "setModelObject:");
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 32))
  {
    self->_uint64_t enableState = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  options = self->_options;
  uint64_t v8 = *((void *)v4 + 3);
  if (options)
  {
    if (!v8) {
      goto LABEL_15;
    }
    options = (NMSMediaSyncServiceKeepLocalOptions *)-[NMSMediaSyncServiceKeepLocalOptions mergeFrom:](options, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    options = (NMSMediaSyncServiceKeepLocalOptions *)-[NMSMediaSyncServiceKeepLocalRequest setOptions:](self, "setOptions:");
  }
  id v4 = v9;
LABEL_15:

  MEMORY[0x270F9A758](options, v4);
}

- (NMSMediaSyncServiceModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
}

- (NMSMediaSyncServiceKeepLocalOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end
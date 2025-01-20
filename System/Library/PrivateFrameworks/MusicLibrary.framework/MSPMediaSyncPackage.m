@interface MSPMediaSyncPackage
- (BOOL)hasError;
- (BOOL)hasHeader;
- (BOOL)hasLastPackage;
- (BOOL)hasSyncOperation;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)lastPackage;
- (BOOL)readFrom:(id)a3;
- (MSPMediaSyncError)error;
- (MSPMediaSyncHeader)header;
- (MSPMediaSyncOperation)syncOperation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setHasLastPackage:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setLastPackage:(BOOL)a3;
- (void)setSyncOperation:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPMediaSyncPackage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
}

- (MSPMediaSyncError)error
{
  return self->_error;
}

- (void)setSyncOperation:(id)a3
{
}

- (MSPMediaSyncOperation)syncOperation
{
  return self->_syncOperation;
}

- (void)setHeader:(id)a3
{
}

- (MSPMediaSyncHeader)header
{
  return self->_header;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_type = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if ((v6 & 2) != 0)
  {
    self->_lastPackage = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 2u;
  }
  header = self->_header;
  uint64_t v8 = v5[2];
  v13 = v5;
  if (header)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[MSPMediaSyncHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[MSPMediaSyncPackage setHeader:](self, "setHeader:");
  }
  v5 = v13;
LABEL_11:
  syncOperation = self->_syncOperation;
  uint64_t v10 = v5[3];
  if (syncOperation)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[MSPMediaSyncOperation mergeFrom:](syncOperation, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[MSPMediaSyncPackage setSyncOperation:](self, "setSyncOperation:");
  }
  v5 = v13;
LABEL_17:
  error = self->_error;
  uint64_t v12 = v5[1];
  if (error)
  {
    if (v12) {
      -[MSPMediaSyncError mergeFrom:](error, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[MSPMediaSyncPackage setError:](self, "setError:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_lastPackage;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(MSPMediaSyncHeader *)self->_header hash];
  unint64_t v6 = [(MSPMediaSyncOperation *)self->_syncOperation hash];
  return v5 ^ v6 ^ [(MSPMediaSyncError *)self->_error hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) != 0)
    {
      if (self->_lastPackage)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_21;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_15;
      }
    }
LABEL_21:
    char v8 = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_15:
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2) && !-[MSPMediaSyncHeader isEqual:](header, "isEqual:")) {
    goto LABEL_21;
  }
  syncOperation = self->_syncOperation;
  if ((unint64_t)syncOperation | *((void *)v4 + 3))
  {
    if (!-[MSPMediaSyncOperation isEqual:](syncOperation, "isEqual:")) {
      goto LABEL_21;
    }
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    char v8 = -[MSPMediaSyncError isEqual:](error, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_22:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 36) = self->_lastPackage;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  id v8 = [(MSPMediaSyncHeader *)self->_header copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  id v10 = [(MSPMediaSyncOperation *)self->_syncOperation copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  id v12 = [(MSPMediaSyncError *)self->_error copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_type;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_lastPackage;
    *((unsigned char *)v4 + 40) |= 2u;
  }
  unint64_t v6 = v4;
  if (self->_header)
  {
    objc_msgSend(v4, "setHeader:");
    id v4 = v6;
  }
  if (self->_syncOperation)
  {
    objc_msgSend(v6, "setSyncOperation:");
    id v4 = v6;
  }
  if (self->_error)
  {
    objc_msgSend(v6, "setError:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_header)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_syncOperation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MSPMediaSyncPackageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = self->_type - 1;
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E5FB5E80[v5];
    }
    [v3 setObject:v6 forKey:@"type"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_lastPackage];
    [v3 setObject:v7 forKey:@"lastPackage"];
  }
  header = self->_header;
  if (header)
  {
    v9 = [(MSPMediaSyncHeader *)header dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"header"];
  }
  syncOperation = self->_syncOperation;
  if (syncOperation)
  {
    v11 = [(MSPMediaSyncOperation *)syncOperation dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"syncOperation"];
  }
  error = self->_error;
  if (error)
  {
    v13 = [(MSPMediaSyncError *)error dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"error"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPMediaSyncPackage;
  id v4 = [(MSPMediaSyncPackage *)&v8 description];
  unsigned int v5 = [(MSPMediaSyncPackage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasSyncOperation
{
  return self->_syncOperation != 0;
}

- (BOOL)hasHeader
{
  return self->_header != 0;
}

- (BOOL)hasLastPackage
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasLastPackage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setLastPackage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastPackage = a3;
}

- (BOOL)lastPackage
{
  return (*(unsigned char *)&self->_has & 2) != 0 && self->_lastPackage;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Header"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SyncOperation"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5FB5E80[a3 - 1];
  }

  return v3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

@end
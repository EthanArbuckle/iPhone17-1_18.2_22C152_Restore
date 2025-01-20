@interface MBSSnapshotID
- (BOOL)hasSnapshotID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)snapshotID;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSnapshotID:(BOOL)a3;
- (void)setSnapshotID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSSnapshotID

- (void)setSnapshotID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_snapshotID = a3;
}

- (void)setHasSnapshotID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnapshotID
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshotID;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSSnapshotID *)&v3 description], [(MBSSnapshotID *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_snapshotID), @"snapshotID");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        LODWORD(v7) = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v7) = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 & 0x7FFF8) == 8)
    {
      char v13 = 0;
      unsigned int v14 = 0;
      uint64_t v15 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
        v15 |= (unint64_t)(v17 & 0x7F) << v13;
        if ((v17 & 0x80) == 0) {
          goto LABEL_28;
        }
        v13 += 7;
        BOOL v10 = v14++ >= 9;
        if (v10)
        {
          LODWORD(v15) = 0;
          goto LABEL_30;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_28:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v15) = 0;
      }
LABEL_30:
      self->_snapshotID = v15;
    }
    else
    {
      int v18 = PBReaderSkipValueWithTag();
      if (!v18) {
        return v18;
      }
    }
  }
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_snapshotID;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_snapshotID;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = (*((unsigned char *)a3 + 12) & 1) == 0;
    if (*(unsigned char *)&self->_has) {
      LOBYTE(v5) = (*((unsigned char *)a3 + 12) & 1) != 0 && self->_snapshotID == *((_DWORD *)a3 + 2);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_snapshotID;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_snapshotID = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)snapshotID
{
  return self->_snapshotID;
}

@end
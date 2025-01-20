@interface MBSInviteResponse
- (BOOL)hasInviteAllowed;
- (BOOL)hasQuotaAvailable;
- (BOOL)inviteAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)quotaAvailable;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasInviteAllowed:(BOOL)a3;
- (void)setHasQuotaAvailable:(BOOL)a3;
- (void)setInviteAllowed:(BOOL)a3;
- (void)setQuotaAvailable:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSInviteResponse

- (void)setInviteAllowed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_inviteAllowed = a3;
}

- (void)setHasInviteAllowed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInviteAllowed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setQuotaAvailable:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_quotaAvailable = a3;
}

- (void)setHasQuotaAvailable:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasQuotaAvailable
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSInviteResponse;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSInviteResponse *)&v3 description], [(MBSInviteResponse *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_inviteAllowed), @"inviteAllowed");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_quotaAvailable), @"quotaAvailable");
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
    int v13 = (unsigned __int16)(v7 >> 3);
    if (v13 == 2)
    {
      char v19 = 0;
      unsigned int v20 = 0;
      unint64_t v21 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
        v21 |= (unint64_t)(v23 & 0x7F) << v19;
        if ((v23 & 0x80) == 0) {
          goto LABEL_40;
        }
        v19 += 7;
        BOOL v10 = v20++ >= 9;
        if (v10)
        {
          unint64_t v21 = 0;
          goto LABEL_42;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v21 = 0;
      }
LABEL_42:
      self->_quotaAvailable = v21;
    }
    else if (v13 == 1)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)&self->_has |= 2u;
      while (1)
      {
        unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_36;
        }
        v14 += 7;
        BOOL v10 = v15++ >= 9;
        if (v10)
        {
          uint64_t v16 = 0;
          goto LABEL_38;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v16 = 0;
      }
LABEL_38:
      self->_inviteAllowed = v16 != 0;
    }
    else
    {
      int v24 = PBReaderSkipValueWithTag();
      if (!v24) {
        return v24;
      }
    }
  }
  LOBYTE(v24) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
LABEL_5:
    *((void *)a3 + 1) = self->_quotaAvailable;
    *((unsigned char *)a3 + 20) |= 1u;
    return;
  }
  *((unsigned char *)a3 + 16) = self->_inviteAllowed;
  *((unsigned char *)a3 + 20) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_inviteAllowed;
    *((unsigned char *)result + 20) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)result + 1) = self->_quotaAvailable;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_inviteAllowed != *((unsigned __int8 *)a3 + 16)) {
        goto LABEL_11;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_quotaAvailable != *((void *)a3 + 1)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_inviteAllowed;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_quotaAvailable;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 20) & 1) == 0) {
      return;
    }
LABEL_5:
    self->_quotaAvailable = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    return;
  }
  self->_inviteAllowed = *((unsigned char *)a3 + 16);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 20)) {
    goto LABEL_5;
  }
}

- (BOOL)inviteAllowed
{
  return self->_inviteAllowed;
}

- (unint64_t)quotaAvailable
{
  return self->_quotaAvailable;
}

@end
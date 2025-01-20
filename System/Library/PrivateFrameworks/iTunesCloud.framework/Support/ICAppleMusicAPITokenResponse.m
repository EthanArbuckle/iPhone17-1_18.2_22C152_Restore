@interface ICAppleMusicAPITokenResponse
- (BOOL)hasError;
- (BOOL)hasTokenCollection;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICAppleMusicAPITokenCollection)tokenCollection;
- (ICAppleMusicAPITokenError)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)privacyConsciousDescription;
- (id)privacyConsciousDictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setTokenCollection:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCollection, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
}

- (ICAppleMusicAPITokenError)error
{
  return self->_error;
}

- (void)setTokenCollection:(id)a3
{
}

- (ICAppleMusicAPITokenCollection)tokenCollection
{
  return self->_tokenCollection;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  tokenCollection = self->_tokenCollection;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (tokenCollection)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ICAppleMusicAPITokenCollection mergeFrom:](tokenCollection, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ICAppleMusicAPITokenResponse setTokenCollection:](self, "setTokenCollection:");
  }
  v4 = v9;
LABEL_7:
  error = self->_error;
  uint64_t v8 = v4[1];
  if (error)
  {
    if (v8) {
      -[ICAppleMusicAPITokenError mergeFrom:](error, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[ICAppleMusicAPITokenResponse setError:](self, "setError:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  unint64_t v3 = [(ICAppleMusicAPITokenCollection *)self->_tokenCollection hash];
  return [(ICAppleMusicAPITokenError *)self->_error hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((tokenCollection = self->_tokenCollection, !((unint64_t)tokenCollection | v4[2]))
     || -[ICAppleMusicAPITokenCollection isEqual:](tokenCollection, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      unsigned __int8 v7 = -[ICAppleMusicAPITokenError isEqual:](error, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(ICAppleMusicAPITokenCollection *)self->_tokenCollection copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(ICAppleMusicAPITokenError *)self->_error copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_tokenCollection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
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
        if (v6++ >= 9)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v7 >> 3) == 2) {
        break;
      }
      if ((v7 >> 3) == 1)
      {
        v13 = objc_alloc_init(ICAppleMusicAPITokenCollection);
        objc_storeStrong((id *)&self->_tokenCollection, v13);
        if (!PBReaderPlaceMark() || !sub_1000DE644((uint64_t)v13, (uint64_t)a3)) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = objc_alloc_init(ICAppleMusicAPITokenError);
    objc_storeStrong((id *)&self->_error, v13);
    if (!PBReaderPlaceMark() || (sub_1000D7CA4((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  tokenCollection = self->_tokenCollection;
  if (tokenCollection)
  {
    char v5 = [(ICAppleMusicAPITokenCollection *)tokenCollection dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tokenCollection"];
  }
  error = self->_error;
  if (error)
  {
    unint64_t v7 = [(ICAppleMusicAPITokenError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenResponse;
  unint64_t v3 = [(ICAppleMusicAPITokenResponse *)&v7 description];
  id v4 = [(ICAppleMusicAPITokenResponse *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasTokenCollection
{
  return self->_tokenCollection != 0;
}

- (id)privacyConsciousDescription
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenResponse;
  unint64_t v3 = [(ICAppleMusicAPITokenResponse *)&v7 description];
  id v4 = [(ICAppleMusicAPITokenResponse *)self privacyConsciousDictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)privacyConsciousDictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  if ([(ICAppleMusicAPITokenResponse *)self hasTokenCollection])
  {
    id v4 = [(ICAppleMusicAPITokenResponse *)self tokenCollection];
    char v5 = [v4 privacyConsciousDictionaryRepresentation];
    [v3 setObject:v5 forKey:@"tokenCollection"];
  }
  if ([(ICAppleMusicAPITokenResponse *)self hasError])
  {
    unsigned int v6 = [(ICAppleMusicAPITokenResponse *)self error];
    objc_super v7 = [v6 dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }

  return v3;
}

@end
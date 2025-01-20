@interface AMPMusicArtistNewContentResponse
+ (Class)artistContentType;
- (BOOL)hasModel;
- (BOOL)hasRecoId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)model;
- (NSMutableArray)artistContents;
- (NSString)recoId;
- (id)artistContentAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)artistContentsCount;
- (unint64_t)hash;
- (void)addArtistContent:(id)a3;
- (void)clearArtistContents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtistContents:(id)a3;
- (void)setModel:(id)a3;
- (void)setRecoId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicArtistNewContentResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoId, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_artistContents, 0);
}

- (void)setModel:(id)a3
{
}

- (NSData)model
{
  return self->_model;
}

- (void)setRecoId:(id)a3
{
}

- (NSString)recoId
{
  return self->_recoId;
}

- (void)setArtistContents:(id)a3
{
}

- (NSMutableArray)artistContents
{
  return self->_artistContents;
}

- (void)mergeFrom:(id)a3
{
  v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[AMPMusicArtistNewContentResponse addArtistContent:](self, "addArtistContent:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[AMPMusicArtistNewContentResponse setRecoId:](self, "setRecoId:");
  }
  if (v4[2]) {
    -[AMPMusicArtistNewContentResponse setModel:](self, "setModel:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSMutableArray *)self->_artistContents hash];
  unint64_t v4 = [(NSString *)self->_recoId hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_model hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((artistContents = self->_artistContents, !((unint64_t)artistContents | v4[1]))
     || -[NSMutableArray isEqual:](artistContents, "isEqual:"))
    && ((recoId = self->_recoId, !((unint64_t)recoId | v4[3]))
     || -[NSString isEqual:](recoId, "isEqual:")))
  {
    model = self->_model;
    if ((unint64_t)model | v4[2]) {
      unsigned __int8 v8 = -[NSData isEqual:](model, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_artistContents;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v17);
        [v5 addArtistContent:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v12 = [(NSString *)self->_recoId copyWithZone:a3];
  long long v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(NSData *)self->_model copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(AMPMusicArtistNewContentResponse *)self artistContentsCount])
  {
    [v9 clearArtistContents];
    unint64_t v4 = [(AMPMusicArtistNewContentResponse *)self artistContentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(AMPMusicArtistNewContentResponse *)self artistContentAtIndex:i];
        [v9 addArtistContent:v7];
      }
    }
  }
  if (self->_recoId) {
    objc_msgSend(v9, "setRecoId:");
  }
  id v8 = v9;
  if (self->_model)
  {
    objc_msgSend(v9, "setModel:");
    id v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = self->_artistContents;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_recoId) {
    PBDataWriterWriteStringField();
  }
  if (self->_model) {
    PBDataWriterWriteDataField();
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
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 24;
        goto LABEL_25;
      }
      if (v13 == 1)
      {
        id v14 = objc_alloc_init(AMPMusicArtistContent);
        [(AMPMusicArtistNewContentResponse *)self addArtistContent:v14];
        if (!PBReaderPlaceMark() || (sub_1000BB8AC((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_28:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    uint64_t v15 = PBReaderReadData();
    uint64_t v16 = 16;
LABEL_25:
    id v14 = *(AMPMusicArtistContent **)&self->PBCodable_opaque[v16];
    *(void *)&self->PBCodable_opaque[v16] = v15;
LABEL_26:

    goto LABEL_28;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_artistContents count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_artistContents, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    char v5 = self->_artistContents;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"artistContent"];
  }
  recoId = self->_recoId;
  if (recoId) {
    [v3 setObject:recoId forKey:@"recoId"];
  }
  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AMPMusicArtistNewContentResponse;
  unint64_t v3 = [(AMPMusicArtistNewContentResponse *)&v7 description];
  id v4 = [(AMPMusicArtistNewContentResponse *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasModel
{
  return self->_model != 0;
}

- (BOOL)hasRecoId
{
  return self->_recoId != 0;
}

- (id)artistContentAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_artistContents objectAtIndex:a3];
}

- (unint64_t)artistContentsCount
{
  return (unint64_t)[(NSMutableArray *)self->_artistContents count];
}

- (void)addArtistContent:(id)a3
{
  id v4 = a3;
  artistContents = self->_artistContents;
  id v8 = v4;
  if (!artistContents)
  {
    id v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_artistContents;
    self->_artistContents = v6;

    id v4 = v8;
    artistContents = self->_artistContents;
  }
  [(NSMutableArray *)artistContents addObject:v4];
}

- (void)clearArtistContents
{
}

+ (Class)artistContentType
{
  return (Class)objc_opt_class();
}

@end
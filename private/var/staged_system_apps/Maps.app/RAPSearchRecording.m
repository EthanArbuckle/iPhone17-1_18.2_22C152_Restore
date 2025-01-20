@interface RAPSearchRecording
+ (Class)auxiliaryControlsType;
- (BOOL)hasCorrectedSearchTemplate;
- (BOOL)hasOriginatingAuxiliaryControlIndex;
- (BOOL)hasRequest;
- (BOOL)hasResponse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPlaceSearchRequest)request;
- (GEOPlaceSearchResponse)response;
- (GEORPCorrectedSearch)correctedSearchTemplate;
- (NSMutableArray)auxiliaryControls;
- (id)auxiliaryControlsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)auxiliaryControlsCount;
- (unint64_t)hash;
- (unint64_t)originatingAuxiliaryControlIndex;
- (void)addAuxiliaryControls:(id)a3;
- (void)clearAuxiliaryControls;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryControls:(id)a3;
- (void)setCorrectedSearchTemplate:(id)a3;
- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3;
- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RAPSearchRecording

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (BOOL)hasCorrectedSearchTemplate
{
  return self->_correctedSearchTemplate != 0;
}

- (void)clearAuxiliaryControls
{
}

- (void)addAuxiliaryControls:(id)a3
{
  id v4 = a3;
  auxiliaryControls = self->_auxiliaryControls;
  id v8 = v4;
  if (!auxiliaryControls)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_auxiliaryControls;
    self->_auxiliaryControls = v6;

    id v4 = v8;
    auxiliaryControls = self->_auxiliaryControls;
  }
  [(NSMutableArray *)auxiliaryControls addObject:v4];
}

- (unint64_t)auxiliaryControlsCount
{
  return (unint64_t)[(NSMutableArray *)self->_auxiliaryControls count];
}

- (id)auxiliaryControlsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_auxiliaryControls objectAtIndex:a3];
}

+ (Class)auxiliaryControlsType
{
  return (Class)objc_opt_class();
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)RAPSearchRecording;
  v3 = [(RAPSearchRecording *)&v7 description];
  id v4 = [(RAPSearchRecording *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  request = self->_request;
  if (request)
  {
    v5 = [(GEOPlaceSearchRequest *)request dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"request"];
  }
  response = self->_response;
  if (response)
  {
    objc_super v7 = [(GEOPlaceSearchResponse *)response dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"response"];
  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  if (correctedSearchTemplate)
  {
    v9 = [(GEORPCorrectedSearch *)correctedSearchTemplate dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"correctedSearchTemplate"];
  }
  if ([(NSMutableArray *)self->_auxiliaryControls count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_auxiliaryControls, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v11 = self->_auxiliaryControls;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [v19 dictionaryRepresentation];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"auxiliaryControls"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v17 = +[NSNumber numberWithUnsignedLongLong:self->_originatingAuxiliaryControlIndex];
    [v3 setObject:v17 forKey:@"originatingAuxiliaryControlIndex"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
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
        BOOL v10 = v6++ >= 9;
        if (v10)
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
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          id v13 = objc_alloc_init((Class)GEOPlaceSearchRequest);
          uint64_t v14 = 32;
          goto LABEL_23;
        case 2u:
          id v13 = objc_alloc_init((Class)GEOPlaceSearchResponse);
          uint64_t v14 = 40;
          goto LABEL_23;
        case 3u:
          id v13 = objc_alloc_init((Class)GEORPCorrectedSearch);
          uint64_t v14 = 24;
LABEL_23:
          objc_storeStrong((id *)&self->PBCodable_opaque[v14], v13);
          goto LABEL_25;
        case 4u:
          id v13 = objc_alloc_init((Class)GEORPAuxiliaryControl);
          [(RAPSearchRecording *)self addAuxiliaryControls:v13];
LABEL_25:
          if (!PBReaderPlaceMark()
            || (objc_msgSend(v13, "readFrom:", a3, 0, 0) & 1) == 0)
          {

            LOBYTE(v15) = 0;
            return v15;
          }
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_40;
          break;
        case 5u:
          char v16 = 0;
          unsigned int v17 = 0;
          unint64_t v18 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                BOOL v10 = v17++ >= 9;
                if (v10)
                {
                  unint64_t v18 = 0;
                  goto LABEL_38;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            unint64_t v18 = 0;
          }
LABEL_38:
          self->_originatingAuxiliaryControlIndex = v18;
          goto LABEL_39;
        default:
          int v15 = PBReaderSkipValueWithTag();
          if (!v15) {
            return v15;
          }
          goto LABEL_39;
      }
    }
  }
LABEL_40:
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_request) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_response) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_correctedSearchTemplate) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v5 = self->_auxiliaryControls;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_request) {
    [v8 setRequest:];
  }
  if (self->_response) {
    [v8 setResponse:];
  }
  if (self->_correctedSearchTemplate) {
    [v8 setCorrectedSearchTemplate];
  }
  if ([(RAPSearchRecording *)self auxiliaryControlsCount])
  {
    [v8 clearAuxiliaryControls];
    unint64_t v4 = [(RAPSearchRecording *)self auxiliaryControlsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        unint64_t v7 = [(RAPSearchRecording *)self auxiliaryControlsAtIndex:i];
        [v8 addAuxiliaryControls:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v8 + 1) = self->_originatingAuxiliaryControlIndex;
    *((unsigned char *)v8 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(GEOPlaceSearchRequest *)self->_request copyWithZone:a3];
  unint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(GEOPlaceSearchResponse *)self->_response copyWithZone:a3];
  char v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(GEORPCorrectedSearch *)self->_correctedSearchTemplate copyWithZone:a3];
  long long v11 = (void *)v5[3];
  v5[3] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_auxiliaryControls;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      char v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) copyWithZone:a3];
        [v5 addAuxiliaryControls:v17];

        char v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_originatingAuxiliaryControlIndex;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 4))
  {
    if (!-[GEOPlaceSearchRequest isEqual:](request, "isEqual:")) {
      goto LABEL_14;
    }
  }
  response = self->_response;
  if ((unint64_t)response | *((void *)v4 + 5))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](response, "isEqual:")) {
      goto LABEL_14;
    }
  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  if ((unint64_t)correctedSearchTemplate | *((void *)v4 + 3))
  {
    if (!-[GEORPCorrectedSearch isEqual:](correctedSearchTemplate, "isEqual:")) {
      goto LABEL_14;
    }
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:")) {
      goto LABEL_14;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 48) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) != 0 && self->_originatingAuxiliaryControlIndex == *((void *)v4 + 1))
    {
      BOOL v9 = 1;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v9 = 0;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(GEOPlaceSearchRequest *)self->_request hash];
  unint64_t v4 = (unint64_t)[(GEOPlaceSearchResponse *)self->_response hash];
  unint64_t v5 = (unint64_t)[(GEORPCorrectedSearch *)self->_correctedSearchTemplate hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_auxiliaryControls hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_originatingAuxiliaryControlIndex;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  request = self->_request;
  uint64_t v6 = *((void *)v4 + 4);
  if (request)
  {
    if (v6) {
      -[GEOPlaceSearchRequest mergeFrom:](request, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[RAPSearchRecording setRequest:](self, "setRequest:");
  }
  response = self->_response;
  uint64_t v8 = *((void *)v4 + 5);
  if (response)
  {
    if (v8) {
      -[GEOPlaceSearchResponse mergeFrom:](response, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[RAPSearchRecording setResponse:](self, "setResponse:");
  }
  correctedSearchTemplate = self->_correctedSearchTemplate;
  uint64_t v10 = *((void *)v4 + 3);
  if (correctedSearchTemplate)
  {
    if (v10) {
      -[GEORPCorrectedSearch mergeFrom:](correctedSearchTemplate, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[RAPSearchRecording setCorrectedSearchTemplate:](self, "setCorrectedSearchTemplate:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v4 + 2);
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[RAPSearchRecording addAuxiliaryControls:](self, "addAuxiliaryControls:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }

  if (*((unsigned char *)v4 + 48))
  {
    self->_originatingAuxiliaryControlIndex = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (GEOPlaceSearchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (GEOPlaceSearchResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (GEORPCorrectedSearch)correctedSearchTemplate
{
  return self->_correctedSearchTemplate;
}

- (void)setCorrectedSearchTemplate:(id)a3
{
}

- (NSMutableArray)auxiliaryControls
{
  return self->_auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_correctedSearchTemplate, 0);

  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
}

@end
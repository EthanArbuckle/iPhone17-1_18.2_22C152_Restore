@interface PersistentDirections
- (BOOL)hasAddressEndSearch;
- (BOOL)hasAddressStartSearch;
- (BOOL)hasEndAddress;
- (BOOL)hasRouteEndSearch;
- (BOOL)hasRouteStartSearch;
- (BOOL)hasStartAddress;
- (BOOL)hasUserEndSearch;
- (BOOL)hasUserStartSearch;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)endAddress;
- (NSString)startAddress;
- (SearchResult)addressEndSearch;
- (SearchResult)addressStartSearch;
- (SearchResult)routeEndSearch;
- (SearchResult)routeStartSearch;
- (SearchResult)userEndSearch;
- (SearchResult)userStartSearch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressEndSearch:(id)a3;
- (void)setAddressStartSearch:(id)a3;
- (void)setEndAddress:(id)a3;
- (void)setRouteEndSearch:(id)a3;
- (void)setRouteStartSearch:(id)a3;
- (void)setStartAddress:(id)a3;
- (void)setUserEndSearch:(id)a3;
- (void)setUserStartSearch:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentDirections

- (BOOL)hasStartAddress
{
  return self->_startAddress != 0;
}

- (BOOL)hasEndAddress
{
  return self->_endAddress != 0;
}

- (BOOL)hasUserStartSearch
{
  return self->_userStartSearch != 0;
}

- (BOOL)hasUserEndSearch
{
  return self->_userEndSearch != 0;
}

- (BOOL)hasAddressStartSearch
{
  return self->_addressStartSearch != 0;
}

- (BOOL)hasAddressEndSearch
{
  return self->_addressEndSearch != 0;
}

- (BOOL)hasRouteStartSearch
{
  return self->_routeStartSearch != 0;
}

- (BOOL)hasRouteEndSearch
{
  return self->_routeEndSearch != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentDirections;
  v3 = [(PersistentDirections *)&v7 description];
  v4 = [(PersistentDirections *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  startAddress = self->_startAddress;
  if (startAddress) {
    [v3 setObject:startAddress forKey:@"StartAddress"];
  }
  endAddress = self->_endAddress;
  if (endAddress) {
    [v4 setObject:endAddress forKey:@"EndAddress"];
  }
  userStartSearch = self->_userStartSearch;
  if (userStartSearch)
  {
    v8 = [(SearchResultRepr *)userStartSearch dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"UserStartSearch"];
  }
  userEndSearch = self->_userEndSearch;
  if (userEndSearch)
  {
    v10 = [(SearchResultRepr *)userEndSearch dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"UserEndSearch"];
  }
  addressStartSearch = self->_addressStartSearch;
  if (addressStartSearch)
  {
    v12 = [(SearchResultRepr *)addressStartSearch dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"AddressStartSearch"];
  }
  addressEndSearch = self->_addressEndSearch;
  if (addressEndSearch)
  {
    v14 = [(SearchResultRepr *)addressEndSearch dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"AddressEndSearch"];
  }
  routeStartSearch = self->_routeStartSearch;
  if (routeStartSearch)
  {
    v16 = [(SearchResultRepr *)routeStartSearch dictionaryRepresentation];
    [v4 setObject:v16 forKey:@"RouteStartSearch"];
  }
  routeEndSearch = self->_routeEndSearch;
  if (routeEndSearch)
  {
    v18 = [(SearchResultRepr *)routeEndSearch dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"RouteEndSearch"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                            + OBJC_IVAR___PBDataReader__length))
    return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
    switch((v7 >> 3))
    {
      case 0xAu:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 64;
        goto LABEL_29;
      case 0xBu:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 56;
        goto LABEL_29;
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x13u:
        goto LABEL_22;
      case 0x11u:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 16;
        goto LABEL_29;
      case 0x12u:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 8;
        goto LABEL_29;
      case 0x14u:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 40;
        goto LABEL_29;
      case 0x15u:
        v14 = objc_alloc_init(SearchResult);
        uint64_t v15 = 32;
LABEL_29:
        objc_storeStrong((id *)&self->PBCodable_opaque[v15], v14);
        if (PBReaderPlaceMark() && -[SearchResult readFrom:](v14, "readFrom:", a3, 0, 0))
        {
          PBReaderRecallMark();
LABEL_34:

          goto LABEL_35;
        }

        return 0;
      default:
        if (v13 == 2)
        {
          uint64_t v16 = PBReaderReadString();
          uint64_t v17 = 24;
          goto LABEL_33;
        }
        if (v13 == 1)
        {
          uint64_t v16 = PBReaderReadString();
          uint64_t v17 = 48;
LABEL_33:
          v14 = *(SearchResult **)&self->PBCodable_opaque[v17];
          *(void *)&self->PBCodable_opaque[v17] = v16;
          goto LABEL_34;
        }
LABEL_22:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
LABEL_35:
        if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                  + OBJC_IVAR___PBDataReader__length))
          return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
        break;
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_endAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userStartSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userEndSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addressStartSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addressEndSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_routeStartSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_routeEndSearch)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_startAddress)
  {
    [v4 setStartAddress:];
    id v4 = v5;
  }
  if (self->_endAddress)
  {
    [v5 setEndAddress:];
    id v4 = v5;
  }
  if (self->_userStartSearch)
  {
    [v5 setUserStartSearch:];
    id v4 = v5;
  }
  if (self->_userEndSearch)
  {
    [v5 setUserEndSearch:];
    id v4 = v5;
  }
  if (self->_addressStartSearch)
  {
    [v5 setAddressStartSearch:];
    id v4 = v5;
  }
  if (self->_addressEndSearch)
  {
    [v5 setAddressEndSearch:];
    id v4 = v5;
  }
  if (self->_routeStartSearch)
  {
    [v5 setRouteStartSearch:];
    id v4 = v5;
  }
  if (self->_routeEndSearch)
  {
    [v5 setRouteEndSearch:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_startAddress copyWithZone:a3];
  unint64_t v7 = (void *)v5[6];
  v5[6] = v6;

  id v8 = [(NSString *)self->_endAddress copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(SearchResult *)self->_userStartSearch copyWithZone:a3];
  int v11 = (void *)v5[8];
  v5[8] = v10;

  id v12 = [(SearchResult *)self->_userEndSearch copyWithZone:a3];
  unint64_t v13 = (void *)v5[7];
  v5[7] = v12;

  id v14 = [(SearchResult *)self->_addressStartSearch copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  id v16 = [(SearchResult *)self->_addressEndSearch copyWithZone:a3];
  uint64_t v17 = (void *)v5[1];
  v5[1] = v16;

  id v18 = [(SearchResult *)self->_routeStartSearch copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  id v20 = [(SearchResult *)self->_routeEndSearch copyWithZone:a3];
  v21 = (void *)v5[4];
  v5[4] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((startAddress = self->_startAddress, !((unint64_t)startAddress | v4[6]))
     || -[NSString isEqual:](startAddress, "isEqual:"))
    && ((endAddress = self->_endAddress, !((unint64_t)endAddress | v4[3]))
     || -[NSString isEqual:](endAddress, "isEqual:"))
    && ((userStartSearch = self->_userStartSearch, !((unint64_t)userStartSearch | v4[8]))
     || -[SearchResult isEqual:](userStartSearch, "isEqual:"))
    && ((userEndSearch = self->_userEndSearch, !((unint64_t)userEndSearch | v4[7]))
     || -[SearchResult isEqual:](userEndSearch, "isEqual:"))
    && ((addressStartSearch = self->_addressStartSearch, !((unint64_t)addressStartSearch | v4[2]))
     || -[SearchResult isEqual:](addressStartSearch, "isEqual:"))
    && ((addressEndSearch = self->_addressEndSearch, !((unint64_t)addressEndSearch | v4[1]))
     || -[SearchResult isEqual:](addressEndSearch, "isEqual:"))
    && ((routeStartSearch = self->_routeStartSearch, !((unint64_t)routeStartSearch | v4[5]))
     || -[SearchResult isEqual:](routeStartSearch, "isEqual:")))
  {
    routeEndSearch = self->_routeEndSearch;
    if ((unint64_t)routeEndSearch | v4[4]) {
      unsigned __int8 v13 = -[SearchResult isEqual:](routeEndSearch, "isEqual:");
    }
    else {
      unsigned __int8 v13 = 1;
    }
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_startAddress hash];
  unint64_t v4 = [(NSString *)self->_endAddress hash] ^ v3;
  unint64_t v5 = [(SearchResult *)self->_userStartSearch hash];
  unint64_t v6 = v4 ^ v5 ^ [(SearchResult *)self->_userEndSearch hash];
  unint64_t v7 = [(SearchResult *)self->_addressStartSearch hash];
  unint64_t v8 = v7 ^ [(SearchResult *)self->_addressEndSearch hash];
  unint64_t v9 = v6 ^ v8 ^ [(SearchResult *)self->_routeStartSearch hash];
  return v9 ^ [(SearchResult *)self->_routeEndSearch hash];
}

- (void)mergeFrom:(id)a3
{
  id v16 = a3;
  if (v16[6]) {
    -[PersistentDirections setStartAddress:](self, "setStartAddress:");
  }
  if (v16[3]) {
    -[PersistentDirections setEndAddress:](self, "setEndAddress:");
  }
  userStartSearch = self->_userStartSearch;
  uint64_t v5 = v16[8];
  if (userStartSearch)
  {
    if (v5) {
      -[SearchResultRepr mergeFrom:](userStartSearch, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[PersistentDirections setUserStartSearch:](self, "setUserStartSearch:");
  }
  userEndSearch = self->_userEndSearch;
  uint64_t v7 = v16[7];
  if (userEndSearch)
  {
    if (v7) {
      -[SearchResultRepr mergeFrom:](userEndSearch, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[PersistentDirections setUserEndSearch:](self, "setUserEndSearch:");
  }
  addressStartSearch = self->_addressStartSearch;
  uint64_t v9 = v16[2];
  if (addressStartSearch)
  {
    if (v9) {
      -[SearchResultRepr mergeFrom:](addressStartSearch, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[PersistentDirections setAddressStartSearch:](self, "setAddressStartSearch:");
  }
  addressEndSearch = self->_addressEndSearch;
  uint64_t v11 = v16[1];
  if (addressEndSearch)
  {
    if (v11) {
      -[SearchResultRepr mergeFrom:](addressEndSearch, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[PersistentDirections setAddressEndSearch:](self, "setAddressEndSearch:");
  }
  routeStartSearch = self->_routeStartSearch;
  uint64_t v13 = v16[5];
  if (routeStartSearch)
  {
    if (v13) {
      -[SearchResultRepr mergeFrom:](routeStartSearch, "mergeFrom:");
    }
  }
  else if (v13)
  {
    [(PersistentDirections *)self setRouteStartSearch:"setRouteStartSearch:"];
  }
  routeEndSearch = self->_routeEndSearch;
  uint64_t v15 = v16[4];
  if (routeEndSearch)
  {
    if (v15) {
      -[SearchResultRepr mergeFrom:](routeEndSearch, "mergeFrom:");
    }
  }
  else if (v15)
  {
    [(PersistentDirections *)self setRouteEndSearch:"setRouteEndSearch:"];
  }
}

- (NSString)startAddress
{
  return self->_startAddress;
}

- (void)setStartAddress:(id)a3
{
}

- (NSString)endAddress
{
  return self->_endAddress;
}

- (void)setEndAddress:(id)a3
{
}

- (SearchResult)userStartSearch
{
  return self->_userStartSearch;
}

- (void)setUserStartSearch:(id)a3
{
}

- (SearchResult)userEndSearch
{
  return self->_userEndSearch;
}

- (void)setUserEndSearch:(id)a3
{
}

- (SearchResult)addressStartSearch
{
  return self->_addressStartSearch;
}

- (void)setAddressStartSearch:(id)a3
{
}

- (SearchResult)addressEndSearch
{
  return self->_addressEndSearch;
}

- (void)setAddressEndSearch:(id)a3
{
}

- (SearchResult)routeStartSearch
{
  return self->_routeStartSearch;
}

- (void)setRouteStartSearch:(id)a3
{
}

- (SearchResult)routeEndSearch
{
  return self->_routeEndSearch;
}

- (void)setRouteEndSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStartSearch, 0);
  objc_storeStrong((id *)&self->_userEndSearch, 0);
  objc_storeStrong((id *)&self->_startAddress, 0);
  objc_storeStrong((id *)&self->_routeStartSearch, 0);
  objc_storeStrong((id *)&self->_routeEndSearch, 0);
  objc_storeStrong((id *)&self->_endAddress, 0);
  objc_storeStrong((id *)&self->_addressStartSearch, 0);

  objc_storeStrong((id *)&self->_addressEndSearch, 0);
}

@end
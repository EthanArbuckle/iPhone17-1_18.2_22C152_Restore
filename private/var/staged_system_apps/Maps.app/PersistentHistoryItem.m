@interface PersistentHistoryItem
- (BOOL)hasAddressBookItem;
- (BOOL)hasDirectionsHistoryItem;
- (BOOL)hasSearchRequestHistoryItem;
- (BOOL)hasSearchResultHistoryItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PersistentAddressBookAddress)addressBookItem;
- (PersistentDirectionsHistoryItem)directionsHistoryItem;
- (PersistentSearchRequestHistoryItem)searchRequestHistoryItem;
- (PersistentSearchResultHistoryItem)searchResultHistoryItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressBookItem:(id)a3;
- (void)setDirectionsHistoryItem:(id)a3;
- (void)setSearchRequestHistoryItem:(id)a3;
- (void)setSearchResultHistoryItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PersistentHistoryItem

- (BOOL)hasAddressBookItem
{
  return self->_addressBookItem != 0;
}

- (BOOL)hasSearchRequestHistoryItem
{
  return self->_searchRequestHistoryItem != 0;
}

- (BOOL)hasSearchResultHistoryItem
{
  return self->_searchResultHistoryItem != 0;
}

- (BOOL)hasDirectionsHistoryItem
{
  return self->_directionsHistoryItem != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PersistentHistoryItem;
  v3 = [(PersistentHistoryItem *)&v7 description];
  v4 = [(PersistentHistoryItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  addressBookItem = self->_addressBookItem;
  if (addressBookItem)
  {
    v5 = [(PersistentAddressBookAddress *)addressBookItem dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"addressBookItem"];
  }
  searchRequestHistoryItem = self->_searchRequestHistoryItem;
  if (searchRequestHistoryItem)
  {
    objc_super v7 = [(PersistentSearchRequestHistoryItem *)searchRequestHistoryItem dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"searchRequestHistoryItem"];
  }
  searchResultHistoryItem = self->_searchResultHistoryItem;
  if (searchResultHistoryItem)
  {
    v9 = [(PersistentSearchResultHistoryItem *)searchResultHistoryItem dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"searchResultHistoryItem"];
  }
  directionsHistoryItem = self->_directionsHistoryItem;
  if (directionsHistoryItem)
  {
    v11 = [(PersistentDirectionsHistoryItem *)directionsHistoryItem dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"directionsHistoryItem"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100BA7280((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_searchRequestHistoryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_searchResultHistoryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_directionsHistoryItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_addressBookItem)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_searchRequestHistoryItem)
  {
    [v4 setSearchRequestHistoryItem:];
    id v4 = v5;
  }
  if (self->_searchResultHistoryItem)
  {
    [v5 setSearchResultHistoryItem:];
    id v4 = v5;
  }
  if (self->_directionsHistoryItem)
  {
    [v5 setDirectionsHistoryItem:];
    id v4 = v5;
  }
  if (self->_addressBookItem)
  {
    [v5 setAddressBookItem:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PersistentSearchRequestHistoryItem *)self->_searchRequestHistoryItem copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PersistentSearchResultHistoryItem *)self->_searchResultHistoryItem copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(PersistentDirectionsHistoryItem *)self->_directionsHistoryItem copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  id v12 = [(PersistentAddressBookAddress *)self->_addressBookItem copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((searchRequestHistoryItem = self->_searchRequestHistoryItem,
         !((unint64_t)searchRequestHistoryItem | v4[3]))
     || -[PersistentSearchRequestHistoryItem isEqual:](searchRequestHistoryItem, "isEqual:"))
    && ((searchResultHistoryItem = self->_searchResultHistoryItem, !((unint64_t)searchResultHistoryItem | v4[4]))
     || -[PersistentSearchResultHistoryItem isEqual:](searchResultHistoryItem, "isEqual:"))
    && ((directionsHistoryItem = self->_directionsHistoryItem, !((unint64_t)directionsHistoryItem | v4[2]))
     || -[PersistentDirectionsHistoryItem isEqual:](directionsHistoryItem, "isEqual:")))
  {
    addressBookItem = self->_addressBookItem;
    if ((unint64_t)addressBookItem | v4[1]) {
      unsigned __int8 v9 = -[PersistentAddressBookAddress isEqual:](addressBookItem, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PersistentSearchRequestHistoryItem *)self->_searchRequestHistoryItem hash];
  unint64_t v4 = [(PersistentSearchResultHistoryItem *)self->_searchResultHistoryItem hash] ^ v3;
  unint64_t v5 = [(PersistentDirectionsHistoryItem *)self->_directionsHistoryItem hash];
  return v4 ^ v5 ^ [(PersistentAddressBookAddress *)self->_addressBookItem hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  searchRequestHistoryItem = self->_searchRequestHistoryItem;
  uint64_t v6 = v4[3];
  v13 = v4;
  if (searchRequestHistoryItem)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersistentSearchRequestHistoryItem mergeFrom:](searchRequestHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PersistentHistoryItem setSearchRequestHistoryItem:](self, "setSearchRequestHistoryItem:");
  }
  unint64_t v4 = v13;
LABEL_7:
  searchResultHistoryItem = self->_searchResultHistoryItem;
  uint64_t v8 = v4[4];
  if (searchResultHistoryItem)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PersistentSearchResultHistoryItem mergeFrom:](searchResultHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PersistentHistoryItem setSearchResultHistoryItem:](self, "setSearchResultHistoryItem:");
  }
  unint64_t v4 = v13;
LABEL_13:
  directionsHistoryItem = self->_directionsHistoryItem;
  uint64_t v10 = v4[2];
  if (directionsHistoryItem)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PersistentDirectionsHistoryItem mergeFrom:](directionsHistoryItem, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PersistentHistoryItem setDirectionsHistoryItem:](self, "setDirectionsHistoryItem:");
  }
  unint64_t v4 = v13;
LABEL_19:
  addressBookItem = self->_addressBookItem;
  uint64_t v12 = v4[1];
  if (addressBookItem)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[PersistentAddressBookAddress mergeFrom:](addressBookItem, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[PersistentHistoryItem setAddressBookItem:](self, "setAddressBookItem:");
  }
  unint64_t v4 = v13;
LABEL_25:
}

- (PersistentAddressBookAddress)addressBookItem
{
  return self->_addressBookItem;
}

- (void)setAddressBookItem:(id)a3
{
}

- (PersistentSearchRequestHistoryItem)searchRequestHistoryItem
{
  return self->_searchRequestHistoryItem;
}

- (void)setSearchRequestHistoryItem:(id)a3
{
}

- (PersistentSearchResultHistoryItem)searchResultHistoryItem
{
  return self->_searchResultHistoryItem;
}

- (void)setSearchResultHistoryItem:(id)a3
{
}

- (PersistentDirectionsHistoryItem)directionsHistoryItem
{
  return self->_directionsHistoryItem;
}

- (void)setDirectionsHistoryItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultHistoryItem, 0);
  objc_storeStrong((id *)&self->_searchRequestHistoryItem, 0);
  objc_storeStrong((id *)&self->_directionsHistoryItem, 0);

  objc_storeStrong((id *)&self->_addressBookItem, 0);
}

@end
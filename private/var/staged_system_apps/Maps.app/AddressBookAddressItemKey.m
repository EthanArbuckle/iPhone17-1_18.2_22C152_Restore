@interface AddressBookAddressItemKey
- (AddressBookAddressItemKey)init;
- (AddressBookAddressItemKey)initWithAddressBookAddress:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (GEOMapItem)geoMapItem;
- (NSString)keyString;
- (NSString)shortAddress;
- (unint64_t)geoMapItemHash;
- (unint64_t)hash;
- (void)setContact:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setGeoMapItemHash:(unint64_t)a3;
- (void)setKeyString:(id)a3;
- (void)setShortAddress:(id)a3;
@end

@implementation AddressBookAddressItemKey

- (unint64_t)hash
{
  if (self->_geoMapItemHash) {
    return self->_geoMapItemHash;
  }
  v3 = [(AddressBookAddressItemKey *)self keyString];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (NSString)keyString
{
  return self->_keyString;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AddressBookAddressItemKey *)a3;
  if (self == v4)
  {
    unsigned __int8 v8 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (![(AddressBookAddressItemKey *)v4 conformsToProtocol:&OBJC_PROTOCOL___PersonalizedItemKeyWithGEOMapItem])
    {
      unsigned __int8 v8 = 0;
      goto LABEL_12;
    }
    v6 = [(AddressBookAddressItemKey *)v4 geoMapItem];
    if (v6)
    {
      v9 = [(AddressBookAddressItemKey *)self geoMapItem];

      if (v9)
      {
        v10 = [(AddressBookAddressItemKey *)self geoMapItem];
        char IsEqualToMapItemForPurposeWithinDistance = GEOMapItemIsEqualToMapItemForPurposeWithinDistance();

        if ((IsEqualToMapItemForPurposeWithinDistance & 1) == 0) {
          goto LABEL_22;
        }
LABEL_20:
        unsigned __int8 v8 = 1;
        goto LABEL_4;
      }
    }
    v13 = [(AddressBookAddressItemKey *)self contact];

    unsigned __int8 v8 = 0;
    if (!v6 || !v13) {
      goto LABEL_4;
    }
    v14 = [(AddressBookAddressItemKey *)self contact];
    v15 = +[CNContactFormatter stringFromContact:v14 style:0];

    v16 = [v6 addressObject];
    v17 = [v16 shortAddress];

    v18 = [v6 name];
    unint64_t v19 = v15;
    unint64_t v20 = v18;
    if (v19 | v20
      && (unsigned __int8 v21 = [(id)v19 isEqual:v20],
          (id)v20,
          (id)v19,
          (v21 & 1) == 0))
    {
    }
    else
    {
      unint64_t v22 = [(AddressBookAddressItemKey *)self shortAddress];
      unint64_t v23 = v17;
      if (!(v23 | v22))
      {

        goto LABEL_20;
      }
      v24 = (void *)v23;
      unsigned __int8 v25 = [(id)v22 isEqual:v23];

      if (v25) {
        goto LABEL_20;
      }
    }
LABEL_22:
    unsigned __int8 v8 = 0;
    goto LABEL_4;
  }
  v5 = v4;
  v6 = [(AddressBookAddressItemKey *)self keyString];
  v7 = [(AddressBookAddressItemKey *)v5 keyString];

  unsigned __int8 v8 = [v6 isEqualToString:v7];
LABEL_4:

LABEL_12:
  return v8;
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (CNContact)contact
{
  return self->_contact;
}

- (AddressBookAddressItemKey)init
{
  return 0;
}

- (AddressBookAddressItemKey)initWithAddressBookAddress:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AddressBookAddressItemKey;
  v5 = [(AddressBookAddressItemKey *)&v26 init];
  if (v5)
  {
    v6 = [v4 addressValue];
    v7 = [v6 label];
    unsigned __int8 v8 = [v4 addressValue];
    v9 = [v8 identifier];
    uint64_t v10 = +[NSString stringWithFormat:@"%@ - %@", v7, v9];
    keyString = v5->_keyString;
    v5->_keyString = (NSString *)v10;

    v12 = [v4 geocodedMapItem];

    if (v12)
    {
      v13 = [v4 geocodedMapItem];
      uint64_t v14 = [v13 _geoMapItem];
      geoMapItem = v5->_geoMapItem;
      v5->_geoMapItem = (GEOMapItem *)v14;

      v5->_geoMapItemHash = GEOMapItemHashForPurpose();
    }
    else
    {
      v16 = [(AddressBookAddressItemKey *)v5 contact];
      uint64_t v17 = +[CNContactFormatter stringFromContact:v16 style:0];
      v18 = v5->_keyString;
      v5->_keyString = (NSString *)v17;

      unint64_t v19 = [v4 contact];
      unint64_t v20 = (CNContact *)[v19 copy];
      contact = v5->_contact;
      v5->_contact = v20;

      id v22 = [objc_alloc((Class)MKMapItem) initWithContact:v5->_contact];
      uint64_t v23 = [v22 _addressFormattedAsShortenedAddress];
      shortAddress = v5->_shortAddress;
      v5->_shortAddress = (NSString *)v23;
    }
  }

  return v5;
}

- (void)setKeyString:(id)a3
{
}

- (NSString)shortAddress
{
  return self->_shortAddress;
}

- (void)setShortAddress:(id)a3
{
}

- (void)setContact:(id)a3
{
}

- (void)setGeoMapItem:(id)a3
{
}

- (unint64_t)geoMapItemHash
{
  return self->_geoMapItemHash;
}

- (void)setGeoMapItemHash:(unint64_t)a3
{
  self->_geoMapItemHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_shortAddress, 0);

  objc_storeStrong((id *)&self->_keyString, 0);
}

@end
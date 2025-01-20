@interface CSDMessagingCallDisplayContext
+ (Class)contactIdentifiersType;
- (BOOL)hasCallDirectoryExtensionIdentifier;
- (BOOL)hasCallDirectoryLabel;
- (BOOL)hasCallDirectoryLocalizedExtensionContainingAppName;
- (BOOL)hasCompanyDepartment;
- (BOOL)hasCompanyImageURL;
- (BOOL)hasCompanyName;
- (BOOL)hasContactIdentifier;
- (BOOL)hasContactLabel;
- (BOOL)hasContactName;
- (BOOL)hasLabel;
- (BOOL)hasLocation;
- (BOOL)hasMapName;
- (BOOL)hasName;
- (BOOL)hasProtoPersonNameComponents;
- (BOOL)hasSuggestedName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingCallDisplayContext)initWithCallDisplayContext:(id)a3;
- (CSDMessagingPersonNameComponents)protoPersonNameComponents;
- (NSMutableArray)contactIdentifiers;
- (NSString)callDirectoryExtensionIdentifier;
- (NSString)callDirectoryLabel;
- (NSString)callDirectoryLocalizedExtensionContainingAppName;
- (NSString)companyDepartment;
- (NSString)companyImageURL;
- (NSString)companyName;
- (NSString)contactIdentifier;
- (NSString)contactLabel;
- (NSString)contactName;
- (NSString)label;
- (NSString)location;
- (NSString)mapName;
- (NSString)name;
- (NSString)suggestedName;
- (TUCallDisplayContext)displayContext;
- (id)contactIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contactIdentifiersCount;
- (unint64_t)hash;
- (void)addContactIdentifiers:(id)a3;
- (void)clearContactIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCallDirectoryExtensionIdentifier:(id)a3;
- (void)setCallDirectoryLabel:(id)a3;
- (void)setCallDirectoryLocalizedExtensionContainingAppName:(id)a3;
- (void)setCompanyDepartment:(id)a3;
- (void)setCompanyImageURL:(id)a3;
- (void)setCompanyName:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setContactName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapName:(id)a3;
- (void)setName:(id)a3;
- (void)setProtoPersonNameComponents:(id)a3;
- (void)setSuggestedName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingCallDisplayContext

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasProtoPersonNameComponents
{
  return self->_protoPersonNameComponents != 0;
}

- (BOOL)hasSuggestedName
{
  return self->_suggestedName != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasCompanyName
{
  return self->_companyName != 0;
}

- (BOOL)hasMapName
{
  return self->_mapName != 0;
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (BOOL)hasContactName
{
  return self->_contactName != 0;
}

- (BOOL)hasContactLabel
{
  return self->_contactLabel != 0;
}

- (BOOL)hasCallDirectoryLabel
{
  return self->_callDirectoryLabel != 0;
}

- (BOOL)hasCallDirectoryLocalizedExtensionContainingAppName
{
  return self->_callDirectoryLocalizedExtensionContainingAppName != 0;
}

- (BOOL)hasCallDirectoryExtensionIdentifier
{
  return self->_callDirectoryExtensionIdentifier != 0;
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (void)clearContactIdentifiers
{
}

- (void)addContactIdentifiers:(id)a3
{
  id v4 = a3;
  contactIdentifiers = self->_contactIdentifiers;
  id v8 = v4;
  if (!contactIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contactIdentifiers;
    self->_contactIdentifiers = v6;

    id v4 = v8;
    contactIdentifiers = self->_contactIdentifiers;
  }
  [(NSMutableArray *)contactIdentifiers addObject:v4];
}

- (unint64_t)contactIdentifiersCount
{
  return (unint64_t)[(NSMutableArray *)self->_contactIdentifiers count];
}

- (id)contactIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contactIdentifiers objectAtIndex:a3];
}

+ (Class)contactIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCompanyDepartment
{
  return self->_companyDepartment != 0;
}

- (BOOL)hasCompanyImageURL
{
  return self->_companyImageURL != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingCallDisplayContext;
  v3 = [(CSDMessagingCallDisplayContext *)&v7 description];
  id v4 = [(CSDMessagingCallDisplayContext *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  protoPersonNameComponents = self->_protoPersonNameComponents;
  if (protoPersonNameComponents)
  {
    objc_super v7 = [(CSDMessagingPersonNameComponents *)protoPersonNameComponents dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"protoPersonNameComponents"];
  }
  suggestedName = self->_suggestedName;
  if (suggestedName) {
    [v4 setObject:suggestedName forKey:@"suggestedName"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"label"];
  }
  companyName = self->_companyName;
  if (companyName) {
    [v4 setObject:companyName forKey:@"companyName"];
  }
  mapName = self->_mapName;
  if (mapName) {
    [v4 setObject:mapName forKey:@"mapName"];
  }
  location = self->_location;
  if (location) {
    [v4 setObject:location forKey:@"location"];
  }
  contactName = self->_contactName;
  if (contactName) {
    [v4 setObject:contactName forKey:@"contactName"];
  }
  contactLabel = self->_contactLabel;
  if (contactLabel) {
    [v4 setObject:contactLabel forKey:@"contactLabel"];
  }
  callDirectoryLabel = self->_callDirectoryLabel;
  if (callDirectoryLabel) {
    [v4 setObject:callDirectoryLabel forKey:@"callDirectoryLabel"];
  }
  callDirectoryLocalizedExtensionContainingAppName = self->_callDirectoryLocalizedExtensionContainingAppName;
  if (callDirectoryLocalizedExtensionContainingAppName) {
    [v4 setObject:callDirectoryLocalizedExtensionContainingAppName forKey:@"callDirectoryLocalizedExtensionContainingAppName"];
  }
  callDirectoryExtensionIdentifier = self->_callDirectoryExtensionIdentifier;
  if (callDirectoryExtensionIdentifier) {
    [v4 setObject:callDirectoryExtensionIdentifier forKey:@"callDirectoryExtensionIdentifier"];
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier) {
    [v4 setObject:contactIdentifier forKey:@"contactIdentifier"];
  }
  contactIdentifiers = self->_contactIdentifiers;
  if (contactIdentifiers) {
    [v4 setObject:contactIdentifiers forKey:@"contactIdentifiers"];
  }
  companyDepartment = self->_companyDepartment;
  if (companyDepartment) {
    [v4 setObject:companyDepartment forKey:@"companyDepartment"];
  }
  companyImageURL = self->_companyImageURL;
  if (companyImageURL) {
    [v4 setObject:companyImageURL forKey:@"companyImageURL"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10014771C((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_protoPersonNameComponents) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_suggestedName) {
    PBDataWriterWriteStringField();
  }
  if (self->_label) {
    PBDataWriterWriteStringField();
  }
  if (self->_companyName) {
    PBDataWriterWriteStringField();
  }
  if (self->_mapName) {
    PBDataWriterWriteStringField();
  }
  if (self->_location) {
    PBDataWriterWriteStringField();
  }
  if (self->_contactName) {
    PBDataWriterWriteStringField();
  }
  if (self->_contactLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_callDirectoryLabel) {
    PBDataWriterWriteStringField();
  }
  if (self->_callDirectoryLocalizedExtensionContainingAppName) {
    PBDataWriterWriteStringField();
  }
  if (self->_callDirectoryExtensionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_contactIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_contactIdentifiers;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_companyDepartment) {
    PBDataWriterWriteStringField();
  }
  if (self->_companyImageURL) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_name) {
    objc_msgSend(v9, "setName:");
  }
  if (self->_protoPersonNameComponents) {
    objc_msgSend(v9, "setProtoPersonNameComponents:");
  }
  if (self->_suggestedName) {
    objc_msgSend(v9, "setSuggestedName:");
  }
  if (self->_label) {
    objc_msgSend(v9, "setLabel:");
  }
  if (self->_companyName) {
    objc_msgSend(v9, "setCompanyName:");
  }
  if (self->_mapName) {
    objc_msgSend(v9, "setMapName:");
  }
  if (self->_location) {
    objc_msgSend(v9, "setLocation:");
  }
  if (self->_contactName) {
    objc_msgSend(v9, "setContactName:");
  }
  if (self->_contactLabel) {
    objc_msgSend(v9, "setContactLabel:");
  }
  if (self->_callDirectoryLabel) {
    objc_msgSend(v9, "setCallDirectoryLabel:");
  }
  if (self->_callDirectoryLocalizedExtensionContainingAppName) {
    objc_msgSend(v9, "setCallDirectoryLocalizedExtensionContainingAppName:");
  }
  if (self->_callDirectoryExtensionIdentifier) {
    objc_msgSend(v9, "setCallDirectoryExtensionIdentifier:");
  }
  if (self->_contactIdentifier) {
    objc_msgSend(v9, "setContactIdentifier:");
  }
  if ([(CSDMessagingCallDisplayContext *)self contactIdentifiersCount])
  {
    [v9 clearContactIdentifiers];
    unint64_t v4 = [(CSDMessagingCallDisplayContext *)self contactIdentifiersCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(CSDMessagingCallDisplayContext *)self contactIdentifiersAtIndex:i];
        [v9 addContactIdentifiers:v7];
      }
    }
  }
  if (self->_companyDepartment) {
    objc_msgSend(v9, "setCompanyDepartment:");
  }
  uint64_t v8 = v9;
  if (self->_companyImageURL)
  {
    objc_msgSend(v9, "setCompanyImageURL:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v7 = (void *)v5[14];
  v5[14] = v6;

  id v8 = [(CSDMessagingPersonNameComponents *)self->_protoPersonNameComponents copyWithZone:a3];
  id v9 = (void *)v5[15];
  v5[15] = v8;

  id v10 = [(NSString *)self->_suggestedName copyWithZone:a3];
  long long v11 = (void *)v5[16];
  v5[16] = v10;

  id v12 = [(NSString *)self->_label copyWithZone:a3];
  long long v13 = (void *)v5[11];
  v5[11] = v12;

  id v14 = [(NSString *)self->_companyName copyWithZone:a3];
  v15 = (void *)v5[6];
  v5[6] = v14;

  id v16 = [(NSString *)self->_mapName copyWithZone:a3];
  v17 = (void *)v5[13];
  v5[13] = v16;

  id v18 = [(NSString *)self->_location copyWithZone:a3];
  v19 = (void *)v5[12];
  v5[12] = v18;

  id v20 = [(NSString *)self->_contactName copyWithZone:a3];
  v21 = (void *)v5[10];
  v5[10] = v20;

  id v22 = [(NSString *)self->_contactLabel copyWithZone:a3];
  v23 = (void *)v5[9];
  v5[9] = v22;

  id v24 = [(NSString *)self->_callDirectoryLabel copyWithZone:a3];
  v25 = (void *)v5[2];
  v5[2] = v24;

  id v26 = [(NSString *)self->_callDirectoryLocalizedExtensionContainingAppName copyWithZone:a3];
  v27 = (void *)v5[3];
  v5[3] = v26;

  id v28 = [(NSString *)self->_callDirectoryExtensionIdentifier copyWithZone:a3];
  v29 = (void *)v5[1];
  v5[1] = v28;

  id v30 = [(NSString *)self->_contactIdentifier copyWithZone:a3];
  v31 = (void *)v5[7];
  v5[7] = v30;

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v32 = self->_contactIdentifiers;
  id v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v44;
    do
    {
      v36 = 0;
      do
      {
        if (*(void *)v44 != v35) {
          objc_enumerationMutation(v32);
        }
        id v37 = objc_msgSend(*(id *)(*((void *)&v43 + 1) + 8 * (void)v36), "copyWithZone:", a3, (void)v43);
        [v5 addContactIdentifiers:v37];

        v36 = (char *)v36 + 1;
      }
      while (v34 != v36);
      id v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v34);
  }

  id v38 = [(NSString *)self->_companyDepartment copyWithZone:a3];
  v39 = (void *)v5[4];
  v5[4] = v38;

  id v40 = [(NSString *)self->_companyImageURL copyWithZone:a3];
  v41 = (void *)v5[5];
  v5[5] = v40;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  name = self->_name;
  if ((unint64_t)name | v4[14])
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_34;
    }
  }
  protoPersonNameComponents = self->_protoPersonNameComponents;
  if ((unint64_t)protoPersonNameComponents | v4[15]
    && !-[CSDMessagingPersonNameComponents isEqual:](protoPersonNameComponents, "isEqual:"))
  {
    goto LABEL_34;
  }
  suggestedName = self->_suggestedName;
  if ((unint64_t)suggestedName | v4[16] && !-[NSString isEqual:](suggestedName, "isEqual:")) {
    goto LABEL_34;
  }
  label = self->_label;
  if ((unint64_t)label | v4[11] && !-[NSString isEqual:](label, "isEqual:")) {
    goto LABEL_34;
  }
  companyName = self->_companyName;
  if ((unint64_t)companyName | v4[6] && !-[NSString isEqual:](companyName, "isEqual:")) {
    goto LABEL_34;
  }
  mapName = self->_mapName;
  if ((unint64_t)mapName | v4[13] && !-[NSString isEqual:](mapName, "isEqual:")) {
    goto LABEL_34;
  }
  location = self->_location;
  if ((unint64_t)location | v4[12] && !-[NSString isEqual:](location, "isEqual:")) {
    goto LABEL_34;
  }
  contactName = self->_contactName;
  if ((unint64_t)contactName | v4[10] && !-[NSString isEqual:](contactName, "isEqual:")) {
    goto LABEL_34;
  }
  if (((contactLabel = self->_contactLabel, !((unint64_t)contactLabel | v4[9]))
     || -[NSString isEqual:](contactLabel, "isEqual:"))
    && ((callDirectoryLabel = self->_callDirectoryLabel, !((unint64_t)callDirectoryLabel | v4[2]))
     || -[NSString isEqual:](callDirectoryLabel, "isEqual:"))
    && ((callDirectoryLocalizedExtensionContainingAppName = self->_callDirectoryLocalizedExtensionContainingAppName,
         !((unint64_t)callDirectoryLocalizedExtensionContainingAppName | v4[3]))
     || -[NSString isEqual:](callDirectoryLocalizedExtensionContainingAppName, "isEqual:"))
    && ((callDirectoryExtensionIdentifier = self->_callDirectoryExtensionIdentifier,
         !((unint64_t)callDirectoryExtensionIdentifier | v4[1]))
     || -[NSString isEqual:](callDirectoryExtensionIdentifier, "isEqual:"))
    && ((contactIdentifier = self->_contactIdentifier, !((unint64_t)contactIdentifier | v4[7]))
     || -[NSString isEqual:](contactIdentifier, "isEqual:"))
    && ((contactIdentifiers = self->_contactIdentifiers, !((unint64_t)contactIdentifiers | v4[8]))
     || -[NSMutableArray isEqual:](contactIdentifiers, "isEqual:"))
    && ((companyDepartment = self->_companyDepartment, !((unint64_t)companyDepartment | v4[4]))
     || -[NSString isEqual:](companyDepartment, "isEqual:")))
  {
    companyImageURL = self->_companyImageURL;
    if ((unint64_t)companyImageURL | v4[5]) {
      unsigned __int8 v21 = -[NSString isEqual:](companyImageURL, "isEqual:");
    }
    else {
      unsigned __int8 v21 = 1;
    }
  }
  else
  {
LABEL_34:
    unsigned __int8 v21 = 0;
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  unint64_t v4 = [(CSDMessagingPersonNameComponents *)self->_protoPersonNameComponents hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_suggestedName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_label hash];
  NSUInteger v7 = [(NSString *)self->_companyName hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_mapName hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_location hash];
  NSUInteger v10 = [(NSString *)self->_contactName hash];
  unint64_t v11 = v10 ^ [(NSString *)self->_contactLabel hash];
  unint64_t v12 = v11 ^ [(NSString *)self->_callDirectoryLabel hash];
  unint64_t v13 = v9 ^ v12 ^ [(NSString *)self->_callDirectoryLocalizedExtensionContainingAppName hash];
  NSUInteger v14 = [(NSString *)self->_callDirectoryExtensionIdentifier hash];
  unint64_t v15 = v14 ^ [(NSString *)self->_contactIdentifier hash];
  unint64_t v16 = v15 ^ (unint64_t)[(NSMutableArray *)self->_contactIdentifiers hash];
  unint64_t v17 = v16 ^ [(NSString *)self->_companyDepartment hash];
  return v13 ^ v17 ^ [(NSString *)self->_companyImageURL hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 14)) {
    -[CSDMessagingCallDisplayContext setName:](self, "setName:");
  }
  protoPersonNameComponents = self->_protoPersonNameComponents;
  uint64_t v6 = *((void *)v4 + 15);
  if (protoPersonNameComponents)
  {
    if (v6) {
      -[CSDMessagingPersonNameComponents mergeFrom:](protoPersonNameComponents, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[CSDMessagingCallDisplayContext setProtoPersonNameComponents:](self, "setProtoPersonNameComponents:");
  }
  if (*((void *)v4 + 16)) {
    -[CSDMessagingCallDisplayContext setSuggestedName:](self, "setSuggestedName:");
  }
  if (*((void *)v4 + 11)) {
    -[CSDMessagingCallDisplayContext setLabel:](self, "setLabel:");
  }
  if (*((void *)v4 + 6)) {
    -[CSDMessagingCallDisplayContext setCompanyName:](self, "setCompanyName:");
  }
  if (*((void *)v4 + 13)) {
    -[CSDMessagingCallDisplayContext setMapName:](self, "setMapName:");
  }
  if (*((void *)v4 + 12)) {
    -[CSDMessagingCallDisplayContext setLocation:](self, "setLocation:");
  }
  if (*((void *)v4 + 10)) {
    -[CSDMessagingCallDisplayContext setContactName:](self, "setContactName:");
  }
  if (*((void *)v4 + 9)) {
    -[CSDMessagingCallDisplayContext setContactLabel:](self, "setContactLabel:");
  }
  if (*((void *)v4 + 2)) {
    -[CSDMessagingCallDisplayContext setCallDirectoryLabel:](self, "setCallDirectoryLabel:");
  }
  if (*((void *)v4 + 3)) {
    -[CSDMessagingCallDisplayContext setCallDirectoryLocalizedExtensionContainingAppName:](self, "setCallDirectoryLocalizedExtensionContainingAppName:");
  }
  if (*((void *)v4 + 1)) {
    -[CSDMessagingCallDisplayContext setCallDirectoryExtensionIdentifier:](self, "setCallDirectoryExtensionIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[CSDMessagingCallDisplayContext setContactIdentifier:](self, "setContactIdentifier:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 8);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[CSDMessagingCallDisplayContext addContactIdentifiers:](self, "addContactIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((void *)v4 + 4)) {
    -[CSDMessagingCallDisplayContext setCompanyDepartment:](self, "setCompanyDepartment:");
  }
  if (*((void *)v4 + 5)) {
    -[CSDMessagingCallDisplayContext setCompanyImageURL:](self, "setCompanyImageURL:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (CSDMessagingPersonNameComponents)protoPersonNameComponents
{
  return self->_protoPersonNameComponents;
}

- (void)setProtoPersonNameComponents:(id)a3
{
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSString)mapName
{
  return self->_mapName;
}

- (void)setMapName:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (NSString)contactName
{
  return self->_contactName;
}

- (void)setContactName:(id)a3
{
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
}

- (NSString)callDirectoryLabel
{
  return self->_callDirectoryLabel;
}

- (void)setCallDirectoryLabel:(id)a3
{
}

- (NSString)callDirectoryLocalizedExtensionContainingAppName
{
  return self->_callDirectoryLocalizedExtensionContainingAppName;
}

- (void)setCallDirectoryLocalizedExtensionContainingAppName:(id)a3
{
}

- (NSString)callDirectoryExtensionIdentifier
{
  return self->_callDirectoryExtensionIdentifier;
}

- (void)setCallDirectoryExtensionIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSMutableArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (NSString)companyDepartment
{
  return self->_companyDepartment;
}

- (void)setCompanyDepartment:(id)a3
{
}

- (NSString)companyImageURL
{
  return self->_companyImageURL;
}

- (void)setCompanyImageURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_protoPersonNameComponents, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mapName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_companyImageURL, 0);
  objc_storeStrong((id *)&self->_companyDepartment, 0);
  objc_storeStrong((id *)&self->_callDirectoryLocalizedExtensionContainingAppName, 0);
  objc_storeStrong((id *)&self->_callDirectoryLabel, 0);

  objc_storeStrong((id *)&self->_callDirectoryExtensionIdentifier, 0);
}

- (CSDMessagingCallDisplayContext)initWithCallDisplayContext:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSDMessagingCallDisplayContext;
  NSUInteger v5 = [(CSDMessagingCallDisplayContext *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    [(CSDMessagingCallDisplayContext *)v5 setName:v6];

    id v7 = [CSDMessagingPersonNameComponents alloc];
    id v8 = [v4 personNameComponents];
    id v9 = [(CSDMessagingPersonNameComponents *)v7 initWithPersonNameComponents:v8];
    [(CSDMessagingCallDisplayContext *)v5 setProtoPersonNameComponents:v9];

    uint64_t v10 = [v4 suggestedName];
    [(CSDMessagingCallDisplayContext *)v5 setSuggestedName:v10];

    unint64_t v11 = [v4 label];
    [(CSDMessagingCallDisplayContext *)v5 setLabel:v11];

    long long v12 = [v4 companyName];
    [(CSDMessagingCallDisplayContext *)v5 setCompanyName:v12];

    long long v13 = [v4 companyDepartment];
    [(CSDMessagingCallDisplayContext *)v5 setCompanyDepartment:v13];

    long long v14 = [v4 location];
    [(CSDMessagingCallDisplayContext *)v5 setLocation:v14];

    long long v15 = [v4 contactName];
    [(CSDMessagingCallDisplayContext *)v5 setContactName:v15];

    unint64_t v16 = [v4 contactLabel];
    [(CSDMessagingCallDisplayContext *)v5 setContactLabel:v16];

    unint64_t v17 = [v4 callDirectoryLabel];
    [(CSDMessagingCallDisplayContext *)v5 setCallDirectoryLabel:v17];

    id v18 = [v4 callDirectoryLocalizedExtensionContainingAppName];
    [(CSDMessagingCallDisplayContext *)v5 setCallDirectoryLocalizedExtensionContainingAppName:v18];

    v19 = [v4 callDirectoryExtensionIdentifier];
    [(CSDMessagingCallDisplayContext *)v5 setCallDirectoryExtensionIdentifier:v19];

    id v20 = [v4 contactIdentifiers];
    unsigned __int8 v21 = [v20 firstObject];
    [(CSDMessagingCallDisplayContext *)v5 setContactIdentifier:v21];

    id v22 = [v4 contactIdentifiers];
    id v23 = [v22 mutableCopy];
    [(CSDMessagingCallDisplayContext *)v5 setContactIdentifiers:v23];

    id v24 = [v4 companyLogoURL];
    v25 = [v24 relativePath];
    [(CSDMessagingCallDisplayContext *)v5 setCompanyImageURL:v25];
  }
  return v5;
}

- (TUCallDisplayContext)displayContext
{
  id v3 = objc_alloc_init((Class)TUMutableCallDisplayContext);
  id v4 = [(CSDMessagingCallDisplayContext *)self name];
  [v3 setName:v4];

  NSUInteger v5 = [(CSDMessagingCallDisplayContext *)self protoPersonNameComponents];
  uint64_t v6 = [v5 personNameComponents];
  [v3 setPersonNameComponents:v6];

  id v7 = [(CSDMessagingCallDisplayContext *)self location];
  [v3 setLocation:v7];

  id v8 = [(CSDMessagingCallDisplayContext *)self label];
  [v3 setLabel:v8];

  id v9 = [(CSDMessagingCallDisplayContext *)self companyName];
  [v3 setCompanyName:v9];

  uint64_t v10 = [(CSDMessagingCallDisplayContext *)self companyDepartment];
  [v3 setCompanyDepartment:v10];

  unint64_t v11 = [(CSDMessagingCallDisplayContext *)self suggestedName];
  [v3 setSuggestedName:v11];

  long long v12 = [(CSDMessagingCallDisplayContext *)self contactName];
  [v3 setContactName:v12];

  long long v13 = [(CSDMessagingCallDisplayContext *)self contactLabel];
  [v3 setContactLabel:v13];

  long long v14 = [(CSDMessagingCallDisplayContext *)self callDirectoryLabel];
  [v3 setCallDirectoryLabel:v14];

  long long v15 = [(CSDMessagingCallDisplayContext *)self callDirectoryLocalizedExtensionContainingAppName];
  [v3 setCallDirectoryLocalizedExtensionContainingAppName:v15];

  unint64_t v16 = [(CSDMessagingCallDisplayContext *)self callDirectoryExtensionIdentifier];
  [v3 setCallDirectoryExtensionIdentifier:v16];

  unint64_t v17 = [(CSDMessagingCallDisplayContext *)self contactIdentifiers];
  [v3 setContactIdentifiers:v17];

  id v18 = [(CSDMessagingCallDisplayContext *)self companyImageURL];

  if (v18)
  {
    v19 = [(CSDMessagingCallDisplayContext *)self companyImageURL];
    id v20 = +[NSURL fileURLWithPath:v19 isDirectory:0];
    [v3 setCompanyLogoURL:v20];
  }
  id v21 = [v3 copy];

  return (TUCallDisplayContext *)v21;
}

@end
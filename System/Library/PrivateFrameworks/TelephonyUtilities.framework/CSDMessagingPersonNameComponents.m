@interface CSDMessagingPersonNameComponents
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickname;
- (BOOL)hasPhoneticRepresentation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingPersonNameComponents)initWithPersonNameComponents:(id)a3;
- (CSDMessagingPersonNameComponents)phoneticRepresentation;
- (NSPersonNameComponents)personNameComponents;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhoneticRepresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingPersonNameComponents

- (CSDMessagingPersonNameComponents)initWithPersonNameComponents:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSDMessagingPersonNameComponents;
  v5 = [(CSDMessagingPersonNameComponents *)&v21 init];
  if (v5)
  {
    v6 = [v4 givenName];
    [(CSDMessagingPersonNameComponents *)v5 setGivenName:v6];

    v7 = [v4 middleName];
    [(CSDMessagingPersonNameComponents *)v5 setMiddleName:v7];

    v8 = [v4 familyName];
    [(CSDMessagingPersonNameComponents *)v5 setFamilyName:v8];

    v9 = [v4 namePrefix];
    [(CSDMessagingPersonNameComponents *)v5 setNamePrefix:v9];

    v10 = [v4 nameSuffix];
    [(CSDMessagingPersonNameComponents *)v5 setNameSuffix:v10];

    v11 = [v4 nickname];
    [(CSDMessagingPersonNameComponents *)v5 setNickname:v11];

    v12 = [v4 phoneticRepresentation];

    if (v12)
    {
      v13 = objc_alloc_init(CSDMessagingPersonNameComponents);
      v14 = [v4 phoneticRepresentation];
      v15 = [v14 givenName];
      [(CSDMessagingPersonNameComponents *)v13 setGivenName:v15];

      v16 = [v4 phoneticRepresentation];
      v17 = [v16 middleName];
      [(CSDMessagingPersonNameComponents *)v13 setMiddleName:v17];

      v18 = [v4 phoneticRepresentation];
      v19 = [v18 familyName];
      [(CSDMessagingPersonNameComponents *)v13 setFamilyName:v19];

      [(CSDMessagingPersonNameComponents *)v5 setPhoneticRepresentation:v13];
    }
  }

  return v5;
}

- (NSPersonNameComponents)personNameComponents
{
  id v3 = objc_alloc_init((Class)NSPersonNameComponents);
  id v4 = [(CSDMessagingPersonNameComponents *)self givenName];
  [v3 setGivenName:v4];

  v5 = [(CSDMessagingPersonNameComponents *)self middleName];
  [v3 setMiddleName:v5];

  v6 = [(CSDMessagingPersonNameComponents *)self familyName];
  [v3 setFamilyName:v6];

  v7 = [(CSDMessagingPersonNameComponents *)self namePrefix];
  [v3 setNamePrefix:v7];

  v8 = [(CSDMessagingPersonNameComponents *)self nameSuffix];
  [v3 setNameSuffix:v8];

  v9 = [(CSDMessagingPersonNameComponents *)self nickname];
  [v3 setNickname:v9];

  v10 = [(CSDMessagingPersonNameComponents *)self phoneticRepresentation];

  if (v10)
  {
    id v11 = objc_alloc_init((Class)NSPersonNameComponents);
    v12 = [(CSDMessagingPersonNameComponents *)self phoneticRepresentation];
    v13 = [v12 givenName];
    [v11 setGivenName:v13];

    v14 = [(CSDMessagingPersonNameComponents *)self phoneticRepresentation];
    v15 = [v14 middleName];
    [v11 setMiddleName:v15];

    v16 = [(CSDMessagingPersonNameComponents *)self phoneticRepresentation];
    v17 = [v16 familyName];
    [v11 setFamilyName:v17];

    [v3 setPhoneticRepresentation:v11];
  }

  return (NSPersonNameComponents *)v3;
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0;
}

- (BOOL)hasPhoneticRepresentation
{
  return self->_phoneticRepresentation != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingPersonNameComponents;
  id v3 = [(CSDMessagingPersonNameComponents *)&v7 description];
  id v4 = [(CSDMessagingPersonNameComponents *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  namePrefix = self->_namePrefix;
  if (namePrefix) {
    [v3 setObject:namePrefix forKey:@"namePrefix"];
  }
  givenName = self->_givenName;
  if (givenName) {
    [v4 setObject:givenName forKey:@"givenName"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middleName"];
  }
  familyName = self->_familyName;
  if (familyName) {
    [v4 setObject:familyName forKey:@"familyName"];
  }
  nameSuffix = self->_nameSuffix;
  if (nameSuffix) {
    [v4 setObject:nameSuffix forKey:@"nameSuffix"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }
  phoneticRepresentation = self->_phoneticRepresentation;
  if (phoneticRepresentation)
  {
    v12 = [(CSDMessagingPersonNameComponents *)phoneticRepresentation dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"phoneticRepresentation"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000D2BD8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_namePrefix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_givenName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_middleName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_familyName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameSuffix)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nickname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_phoneticRepresentation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_namePrefix)
  {
    objc_msgSend(v4, "setNamePrefix:");
    id v4 = v5;
  }
  if (self->_givenName)
  {
    objc_msgSend(v5, "setGivenName:");
    id v4 = v5;
  }
  if (self->_middleName)
  {
    objc_msgSend(v5, "setMiddleName:");
    id v4 = v5;
  }
  if (self->_familyName)
  {
    objc_msgSend(v5, "setFamilyName:");
    id v4 = v5;
  }
  if (self->_nameSuffix)
  {
    objc_msgSend(v5, "setNameSuffix:");
    id v4 = v5;
  }
  if (self->_nickname)
  {
    objc_msgSend(v5, "setNickname:");
    id v4 = v5;
  }
  if (self->_phoneticRepresentation)
  {
    objc_msgSend(v5, "setPhoneticRepresentation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_namePrefix copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NSString *)self->_givenName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_middleName copyWithZone:a3];
  id v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSString *)self->_familyName copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = [(NSString *)self->_nameSuffix copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSString *)self->_nickname copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = [(CSDMessagingPersonNameComponents *)self->_phoneticRepresentation copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((namePrefix = self->_namePrefix, !((unint64_t)namePrefix | v4[4]))
     || -[NSString isEqual:](namePrefix, "isEqual:"))
    && ((givenName = self->_givenName, !((unint64_t)givenName | v4[2]))
     || -[NSString isEqual:](givenName, "isEqual:"))
    && ((middleName = self->_middleName, !((unint64_t)middleName | v4[3]))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | v4[1]))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((nameSuffix = self->_nameSuffix, !((unint64_t)nameSuffix | v4[5]))
     || -[NSString isEqual:](nameSuffix, "isEqual:"))
    && ((nickname = self->_nickname, !((unint64_t)nickname | v4[6]))
     || -[NSString isEqual:](nickname, "isEqual:")))
  {
    phoneticRepresentation = self->_phoneticRepresentation;
    if ((unint64_t)phoneticRepresentation | v4[7]) {
      unsigned __int8 v12 = -[CSDMessagingPersonNameComponents isEqual:](phoneticRepresentation, "isEqual:");
    }
    else {
      unsigned __int8 v12 = 1;
    }
  }
  else
  {
    unsigned __int8 v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_namePrefix hash];
  unint64_t v4 = [(NSString *)self->_givenName hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_middleName hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_familyName hash];
  NSUInteger v7 = [(NSString *)self->_nameSuffix hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_nickname hash];
  return v6 ^ v8 ^ [(CSDMessagingPersonNameComponents *)self->_phoneticRepresentation hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v6 = a3;
  if (v6[4]) {
    -[CSDMessagingPersonNameComponents setNamePrefix:](self, "setNamePrefix:");
  }
  if (v6[2]) {
    -[CSDMessagingPersonNameComponents setGivenName:](self, "setGivenName:");
  }
  if (v6[3]) {
    -[CSDMessagingPersonNameComponents setMiddleName:](self, "setMiddleName:");
  }
  if (v6[1]) {
    -[CSDMessagingPersonNameComponents setFamilyName:](self, "setFamilyName:");
  }
  if (v6[5]) {
    -[CSDMessagingPersonNameComponents setNameSuffix:](self, "setNameSuffix:");
  }
  if (v6[6]) {
    -[CSDMessagingPersonNameComponents setNickname:](self, "setNickname:");
  }
  phoneticRepresentation = self->_phoneticRepresentation;
  uint64_t v5 = v6[7];
  if (phoneticRepresentation)
  {
    if (v5) {
      -[CSDMessagingPersonNameComponents mergeFrom:](phoneticRepresentation, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[CSDMessagingPersonNameComponents setPhoneticRepresentation:](self, "setPhoneticRepresentation:");
  }
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingPersonNameComponents)phoneticRepresentation
{
  return self->_phoneticRepresentation;
}

- (void)setPhoneticRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticRepresentation, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);

  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
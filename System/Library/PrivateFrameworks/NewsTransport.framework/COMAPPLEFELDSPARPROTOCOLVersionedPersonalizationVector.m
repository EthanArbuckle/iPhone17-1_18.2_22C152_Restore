@interface COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector
- (BOOL)hasBundleSubscribedVector;
- (BOOL)hasBundleSubscribedVectorVersion;
- (BOOL)hasPersonalizationVector;
- (BOOL)hasSportsFavoritesVector;
- (BOOL)hasSportsUuidVector;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bundleSubscribedVector;
- (NSData)personalizationVector;
- (NSData)sportsFavoritesVector;
- (NSData)sportsUuidVector;
- (NSString)bundleSubscribedVectorVersion;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleSubscribedVector:(id)a3;
- (void)setBundleSubscribedVectorVersion:(id)a3;
- (void)setPersonalizationVector:(id)a3;
- (void)setSportsFavoritesVector:(id)a3;
- (void)setSportsUuidVector:(id)a3;
- (void)setVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector

- (BOOL)hasPersonalizationVector
{
  return self->_personalizationVector != 0;
}

- (BOOL)hasVersion
{
  return self->_version != 0;
}

- (BOOL)hasBundleSubscribedVector
{
  return self->_bundleSubscribedVector != 0;
}

- (BOOL)hasBundleSubscribedVectorVersion
{
  return self->_bundleSubscribedVectorVersion != 0;
}

- (BOOL)hasSportsUuidVector
{
  return self->_sportsUuidVector != 0;
}

- (BOOL)hasSportsFavoritesVector
{
  return self->_sportsFavoritesVector != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector;
  v4 = [(COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  personalizationVector = self->_personalizationVector;
  if (personalizationVector) {
    [v3 setObject:personalizationVector forKey:@"personalization_vector"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKey:@"version"];
  }
  bundleSubscribedVector = self->_bundleSubscribedVector;
  if (bundleSubscribedVector) {
    [v4 setObject:bundleSubscribedVector forKey:@"bundle_subscribed_vector"];
  }
  bundleSubscribedVectorVersion = self->_bundleSubscribedVectorVersion;
  if (bundleSubscribedVectorVersion) {
    [v4 setObject:bundleSubscribedVectorVersion forKey:@"bundle_subscribed_vector_version"];
  }
  sportsUuidVector = self->_sportsUuidVector;
  if (sportsUuidVector) {
    [v4 setObject:sportsUuidVector forKey:@"sports_uuid_vector"];
  }
  sportsFavoritesVector = self->_sportsFavoritesVector;
  if (sportsFavoritesVector) {
    [v4 setObject:sportsFavoritesVector forKey:@"sports_favorites_vector"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personalizationVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_version)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bundleSubscribedVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_bundleSubscribedVectorVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_sportsUuidVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_sportsFavoritesVector)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_personalizationVector)
  {
    objc_msgSend(v4, "setPersonalizationVector:");
    id v4 = v5;
  }
  if (self->_version)
  {
    objc_msgSend(v5, "setVersion:");
    id v4 = v5;
  }
  if (self->_bundleSubscribedVector)
  {
    objc_msgSend(v5, "setBundleSubscribedVector:");
    id v4 = v5;
  }
  if (self->_bundleSubscribedVectorVersion)
  {
    objc_msgSend(v5, "setBundleSubscribedVectorVersion:");
    id v4 = v5;
  }
  if (self->_sportsUuidVector)
  {
    objc_msgSend(v5, "setSportsUuidVector:");
    id v4 = v5;
  }
  if (self->_sportsFavoritesVector)
  {
    objc_msgSend(v5, "setSportsFavoritesVector:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_personalizationVector copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_version copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  uint64_t v10 = [(NSData *)self->_bundleSubscribedVector copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  uint64_t v12 = [(NSString *)self->_bundleSubscribedVectorVersion copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSData *)self->_sportsUuidVector copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSData *)self->_sportsFavoritesVector copyWithZone:a3];
  v17 = (void *)v5[4];
  v5[4] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((personalizationVector = self->_personalizationVector, !((unint64_t)personalizationVector | v4[3]))
     || -[NSData isEqual:](personalizationVector, "isEqual:"))
    && ((version = self->_version, !((unint64_t)version | v4[6]))
     || -[NSString isEqual:](version, "isEqual:"))
    && ((bundleSubscribedVector = self->_bundleSubscribedVector, !((unint64_t)bundleSubscribedVector | v4[1]))
     || -[NSData isEqual:](bundleSubscribedVector, "isEqual:"))
    && ((bundleSubscribedVectorVersion = self->_bundleSubscribedVectorVersion,
         !((unint64_t)bundleSubscribedVectorVersion | v4[2]))
     || -[NSString isEqual:](bundleSubscribedVectorVersion, "isEqual:"))
    && ((sportsUuidVector = self->_sportsUuidVector, !((unint64_t)sportsUuidVector | v4[5]))
     || -[NSData isEqual:](sportsUuidVector, "isEqual:")))
  {
    sportsFavoritesVector = self->_sportsFavoritesVector;
    if ((unint64_t)sportsFavoritesVector | v4[4]) {
      char v11 = -[NSData isEqual:](sportsFavoritesVector, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_personalizationVector hash];
  NSUInteger v4 = [(NSString *)self->_version hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_bundleSubscribedVector hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_bundleSubscribedVectorVersion hash];
  uint64_t v7 = [(NSData *)self->_sportsUuidVector hash];
  return v6 ^ v7 ^ [(NSData *)self->_sportsFavoritesVector hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setPersonalizationVector:](self, "setPersonalizationVector:");
  }
  if (v4[6]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setVersion:](self, "setVersion:");
  }
  if (v4[1]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setBundleSubscribedVector:](self, "setBundleSubscribedVector:");
  }
  if (v4[2]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setBundleSubscribedVectorVersion:](self, "setBundleSubscribedVectorVersion:");
  }
  if (v4[5]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setSportsUuidVector:](self, "setSportsUuidVector:");
  }
  if (v4[4]) {
    -[COMAPPLEFELDSPARPROTOCOLVersionedPersonalizationVector setSportsFavoritesVector:](self, "setSportsFavoritesVector:");
  }
}

- (NSData)personalizationVector
{
  return self->_personalizationVector;
}

- (void)setPersonalizationVector:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSData)bundleSubscribedVector
{
  return self->_bundleSubscribedVector;
}

- (void)setBundleSubscribedVector:(id)a3
{
}

- (NSString)bundleSubscribedVectorVersion
{
  return self->_bundleSubscribedVectorVersion;
}

- (void)setBundleSubscribedVectorVersion:(id)a3
{
}

- (NSData)sportsUuidVector
{
  return self->_sportsUuidVector;
}

- (void)setSportsUuidVector:(id)a3
{
}

- (NSData)sportsFavoritesVector
{
  return self->_sportsFavoritesVector;
}

- (void)setSportsFavoritesVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_sportsUuidVector, 0);
  objc_storeStrong((id *)&self->_sportsFavoritesVector, 0);
  objc_storeStrong((id *)&self->_personalizationVector, 0);
  objc_storeStrong((id *)&self->_bundleSubscribedVectorVersion, 0);

  objc_storeStrong((id *)&self->_bundleSubscribedVector, 0);
}

@end
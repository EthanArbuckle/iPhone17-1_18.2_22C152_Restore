@interface NPSManagedConfigurationMsg
- (BOOL)hasFeature;
- (BOOL)hasKind;
- (BOOL)hasRestriction;
- (BOOL)hasSetting;
- (BOOL)hasUserSettingsAndRestrictions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)restriction;
- (NSData)setting;
- (NSData)userSettingsAndRestrictions;
- (NSString)feature;
- (NSString)kind;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeature:(id)a3;
- (void)setKind:(id)a3;
- (void)setRestriction:(id)a3;
- (void)setSetting:(id)a3;
- (void)setUserSettingsAndRestrictions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPSManagedConfigurationMsg

- (BOOL)hasKind
{
  return self->_kind != 0;
}

- (BOOL)hasFeature
{
  return self->_feature != 0;
}

- (BOOL)hasSetting
{
  return self->_setting != 0;
}

- (BOOL)hasRestriction
{
  return self->_restriction != 0;
}

- (BOOL)hasUserSettingsAndRestrictions
{
  return self->_userSettingsAndRestrictions != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPSManagedConfigurationMsg;
  v3 = [(NPSManagedConfigurationMsg *)&v7 description];
  v4 = [(NPSManagedConfigurationMsg *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  kind = self->_kind;
  if (kind) {
    [v3 setObject:kind forKey:@"kind"];
  }
  feature = self->_feature;
  if (feature) {
    [v4 setObject:feature forKey:@"feature"];
  }
  setting = self->_setting;
  if (setting) {
    [v4 setObject:setting forKey:@"setting"];
  }
  restriction = self->_restriction;
  if (restriction) {
    [v4 setObject:restriction forKey:@"restriction"];
  }
  userSettingsAndRestrictions = self->_userSettingsAndRestrictions;
  if (userSettingsAndRestrictions) {
    [v4 setObject:userSettingsAndRestrictions forKey:@"userSettingsAndRestrictions"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000043E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_kind)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_feature)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_setting)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_restriction)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_userSettingsAndRestrictions)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_kind)
  {
    objc_msgSend(v4, "setKind:");
    id v4 = v5;
  }
  if (self->_feature)
  {
    objc_msgSend(v5, "setFeature:");
    id v4 = v5;
  }
  if (self->_setting)
  {
    objc_msgSend(v5, "setSetting:");
    id v4 = v5;
  }
  if (self->_restriction)
  {
    objc_msgSend(v5, "setRestriction:");
    id v4 = v5;
  }
  if (self->_userSettingsAndRestrictions)
  {
    objc_msgSend(v5, "setUserSettingsAndRestrictions:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_kind copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_feature copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSData *)self->_setting copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(NSData *)self->_restriction copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  id v14 = [(NSData *)self->_userSettingsAndRestrictions copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((kind = self->_kind, !((unint64_t)kind | v4[2])) || -[NSString isEqual:](kind, "isEqual:"))
    && ((feature = self->_feature, !((unint64_t)feature | v4[1]))
     || -[NSString isEqual:](feature, "isEqual:"))
    && ((setting = self->_setting, !((unint64_t)setting | v4[4]))
     || -[NSData isEqual:](setting, "isEqual:"))
    && ((restriction = self->_restriction, !((unint64_t)restriction | v4[3]))
     || -[NSData isEqual:](restriction, "isEqual:")))
  {
    userSettingsAndRestrictions = self->_userSettingsAndRestrictions;
    if ((unint64_t)userSettingsAndRestrictions | v4[5]) {
      unsigned __int8 v10 = -[NSData isEqual:](userSettingsAndRestrictions, "isEqual:");
    }
    else {
      unsigned __int8 v10 = 1;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_kind hash];
  unint64_t v4 = [(NSString *)self->_feature hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSData *)self->_setting hash];
  unint64_t v6 = v4 ^ v5 ^ (unint64_t)[(NSData *)self->_restriction hash];
  return v6 ^ (unint64_t)[(NSData *)self->_userSettingsAndRestrictions hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if (v4[2]) {
    -[NPSManagedConfigurationMsg setKind:](self, "setKind:");
  }
  if (v4[1]) {
    -[NPSManagedConfigurationMsg setFeature:](self, "setFeature:");
  }
  if (v4[4]) {
    -[NPSManagedConfigurationMsg setSetting:](self, "setSetting:");
  }
  if (v4[3]) {
    -[NPSManagedConfigurationMsg setRestriction:](self, "setRestriction:");
  }
  if (v4[5]) {
    -[NPSManagedConfigurationMsg setUserSettingsAndRestrictions:](self, "setUserSettingsAndRestrictions:");
  }
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
}

- (NSString)feature
{
  return self->_feature;
}

- (void)setFeature:(id)a3
{
}

- (NSData)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
}

- (NSData)restriction
{
  return self->_restriction;
}

- (void)setRestriction:(id)a3
{
}

- (NSData)userSettingsAndRestrictions
{
  return self->_userSettingsAndRestrictions;
}

- (void)setUserSettingsAndRestrictions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettingsAndRestrictions, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_restriction, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_feature, 0);
}

@end
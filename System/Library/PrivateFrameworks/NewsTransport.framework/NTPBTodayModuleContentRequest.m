@interface NTPBTodayModuleContentRequest
- (BOOL)hasModuleDescriptorType;
- (BOOL)hasName;
- (BOOL)hasNameColorDark;
- (BOOL)hasNameColorLight;
- (BOOL)hasTagID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (NSString)nameColorDark;
- (NSString)nameColorLight;
- (NSString)tagID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)moduleDescriptorType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasModuleDescriptorType:(BOOL)a3;
- (void)setModuleDescriptorType:(int)a3;
- (void)setName:(id)a3;
- (void)setNameColorDark:(id)a3;
- (void)setNameColorLight:(id)a3;
- (void)setTagID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayModuleContentRequest

- (void)setModuleDescriptorType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_moduleDescriptorType = a3;
}

- (void)setHasModuleDescriptorType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModuleDescriptorType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTagID
{
  return self->_tagID != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayModuleContentRequest;
  v4 = [(NTPBTodayModuleContentRequest *)&v8 description];
  v5 = [(NTPBTodayModuleContentRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_moduleDescriptorType];
    [v3 setObject:v4 forKey:@"module_descriptor_type"];
  }
  tagID = self->_tagID;
  if (tagID) {
    [v3 setObject:tagID forKey:@"tag_ID"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  nameColorLight = self->_nameColorLight;
  if (nameColorLight) {
    [v3 setObject:nameColorLight forKey:@"name_color_light"];
  }
  nameColorDark = self->_nameColorDark;
  if (nameColorDark) {
    [v3 setObject:nameColorDark forKey:@"name_color_dark"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayModuleContentRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_tagID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameColorLight)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameColorDark)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_moduleDescriptorType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_tagID copyWithZone:a3];
  objc_super v8 = (void *)v6[5];
  v6[5] = v7;

  uint64_t v9 = [(NSString *)self->_name copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = [(NSString *)self->_nameColorLight copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  uint64_t v13 = [(NSString *)self->_nameColorDark copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_moduleDescriptorType != *((_DWORD *)v4 + 2)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  tagID = self->_tagID;
  if ((unint64_t)tagID | *((void *)v4 + 5) && !-[NSString isEqual:](tagID, "isEqual:")) {
    goto LABEL_15;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_15;
    }
  }
  nameColorLight = self->_nameColorLight;
  if ((unint64_t)nameColorLight | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](nameColorLight, "isEqual:")) {
      goto LABEL_15;
    }
  }
  nameColorDark = self->_nameColorDark;
  if ((unint64_t)nameColorDark | *((void *)v4 + 3)) {
    char v9 = -[NSString isEqual:](nameColorDark, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_moduleDescriptorType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_tagID hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_name hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_nameColorLight hash];
  return v6 ^ [(NSString *)self->_nameColorDark hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[12])
  {
    self->_moduleDescriptorType = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
  NSUInteger v5 = v4;
  if (*((void *)v4 + 5))
  {
    -[NTPBTodayModuleContentRequest setTagID:](self, "setTagID:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBTodayModuleContentRequest setName:](self, "setName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBTodayModuleContentRequest setNameColorLight:](self, "setNameColorLight:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBTodayModuleContentRequest setNameColorDark:](self, "setNameColorDark:");
    NSUInteger v4 = v5;
  }
}

- (int)moduleDescriptorType
{
  return self->_moduleDescriptorType;
}

- (NSString)tagID
{
  return self->_tagID;
}

- (void)setTagID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)nameColorLight
{
  return self->_nameColorLight;
}

- (void)setNameColorLight:(id)a3
{
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagID, 0);
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end
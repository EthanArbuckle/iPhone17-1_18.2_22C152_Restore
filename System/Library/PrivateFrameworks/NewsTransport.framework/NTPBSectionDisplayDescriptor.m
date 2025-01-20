@interface NTPBSectionDisplayDescriptor
- (BOOL)hasActionTitle;
- (BOOL)hasActionURLString;
- (BOOL)hasBackgroundColorDark;
- (BOOL)hasBackgroundColorLight;
- (BOOL)hasBackgroundGradientColor;
- (BOOL)hasName;
- (BOOL)hasNameActionURLString;
- (BOOL)hasNameColorDark;
- (BOOL)hasNameColorLight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionTitle;
- (NSString)actionURLString;
- (NSString)backgroundColorDark;
- (NSString)backgroundColorLight;
- (NSString)backgroundGradientColor;
- (NSString)name;
- (NSString)nameActionURLString;
- (NSString)nameColorDark;
- (NSString)nameColorLight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionURLString:(id)a3;
- (void)setBackgroundColorDark:(id)a3;
- (void)setBackgroundColorLight:(id)a3;
- (void)setBackgroundGradientColor:(id)a3;
- (void)setName:(id)a3;
- (void)setNameActionURLString:(id)a3;
- (void)setNameColorDark:(id)a3;
- (void)setNameColorLight:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSectionDisplayDescriptor

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasNameColorLight
{
  return self->_nameColorLight != 0;
}

- (BOOL)hasBackgroundGradientColor
{
  return self->_backgroundGradientColor != 0;
}

- (BOOL)hasActionTitle
{
  return self->_actionTitle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (BOOL)hasNameColorDark
{
  return self->_nameColorDark != 0;
}

- (BOOL)hasNameActionURLString
{
  return self->_nameActionURLString != 0;
}

- (BOOL)hasBackgroundColorLight
{
  return self->_backgroundColorLight != 0;
}

- (BOOL)hasBackgroundColorDark
{
  return self->_backgroundColorDark != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSectionDisplayDescriptor;
  v4 = [(NTPBSectionDisplayDescriptor *)&v8 description];
  v5 = [(NTPBSectionDisplayDescriptor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  nameColorLight = self->_nameColorLight;
  if (nameColorLight) {
    [v4 setObject:nameColorLight forKey:@"name_color_light"];
  }
  backgroundGradientColor = self->_backgroundGradientColor;
  if (backgroundGradientColor) {
    [v4 setObject:backgroundGradientColor forKey:@"background_gradient_color"];
  }
  actionTitle = self->_actionTitle;
  if (actionTitle) {
    [v4 setObject:actionTitle forKey:@"actionTitle"];
  }
  actionURLString = self->_actionURLString;
  if (actionURLString) {
    [v4 setObject:actionURLString forKey:@"action_URL_string"];
  }
  nameColorDark = self->_nameColorDark;
  if (nameColorDark) {
    [v4 setObject:nameColorDark forKey:@"name_color_dark"];
  }
  nameActionURLString = self->_nameActionURLString;
  if (nameActionURLString) {
    [v4 setObject:nameActionURLString forKey:@"name_action_URL_string"];
  }
  backgroundColorLight = self->_backgroundColorLight;
  if (backgroundColorLight) {
    [v4 setObject:backgroundColorLight forKey:@"background_color_light"];
  }
  backgroundColorDark = self->_backgroundColorDark;
  if (backgroundColorDark) {
    [v4 setObject:backgroundColorDark forKey:@"background_color_dark"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSectionDisplayDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
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
  if (self->_backgroundGradientColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionTitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_actionURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameColorDark)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_nameActionURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backgroundColorLight)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backgroundColorDark)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[6];
  v5[6] = v6;

  uint64_t v8 = [(NSString *)self->_nameColorLight copyWithZone:a3];
  v9 = (void *)v5[9];
  v5[9] = v8;

  uint64_t v10 = [(NSString *)self->_backgroundGradientColor copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_actionTitle copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  uint64_t v14 = [(NSString *)self->_actionURLString copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  uint64_t v16 = [(NSString *)self->_nameColorDark copyWithZone:a3];
  v17 = (void *)v5[8];
  v5[8] = v16;

  uint64_t v18 = [(NSString *)self->_nameActionURLString copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  uint64_t v20 = [(NSString *)self->_backgroundColorLight copyWithZone:a3];
  v21 = (void *)v5[4];
  v5[4] = v20;

  uint64_t v22 = [(NSString *)self->_backgroundColorDark copyWithZone:a3];
  v23 = (void *)v5[3];
  v5[3] = v22;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  name = self->_name;
  if ((unint64_t)name | v4[6])
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if (((nameColorLight = self->_nameColorLight, !((unint64_t)nameColorLight | v4[9]))
     || -[NSString isEqual:](nameColorLight, "isEqual:"))
    && ((backgroundGradientColor = self->_backgroundGradientColor, !((unint64_t)backgroundGradientColor | v4[5]))
     || -[NSString isEqual:](backgroundGradientColor, "isEqual:"))
    && ((actionTitle = self->_actionTitle, !((unint64_t)actionTitle | v4[1]))
     || -[NSString isEqual:](actionTitle, "isEqual:"))
    && ((actionURLString = self->_actionURLString, !((unint64_t)actionURLString | v4[2]))
     || -[NSString isEqual:](actionURLString, "isEqual:"))
    && ((nameColorDark = self->_nameColorDark, !((unint64_t)nameColorDark | v4[8]))
     || -[NSString isEqual:](nameColorDark, "isEqual:"))
    && ((nameActionURLString = self->_nameActionURLString, !((unint64_t)nameActionURLString | v4[7]))
     || -[NSString isEqual:](nameActionURLString, "isEqual:"))
    && ((backgroundColorLight = self->_backgroundColorLight, !((unint64_t)backgroundColorLight | v4[4]))
     || -[NSString isEqual:](backgroundColorLight, "isEqual:")))
  {
    backgroundColorDark = self->_backgroundColorDark;
    if ((unint64_t)backgroundColorDark | v4[3]) {
      char v14 = -[NSString isEqual:](backgroundColorDark, "isEqual:");
    }
    else {
      char v14 = 1;
    }
  }
  else
  {
LABEL_20:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_nameColorLight hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_backgroundGradientColor hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_actionTitle hash];
  NSUInteger v7 = [(NSString *)self->_actionURLString hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_nameColorDark hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_nameActionURLString hash];
  NSUInteger v10 = [(NSString *)self->_backgroundColorLight hash];
  return v9 ^ v10 ^ [(NSString *)self->_backgroundColorDark hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[6]) {
    -[NTPBSectionDisplayDescriptor setName:](self, "setName:");
  }
  if (v4[9]) {
    -[NTPBSectionDisplayDescriptor setNameColorLight:](self, "setNameColorLight:");
  }
  if (v4[5]) {
    -[NTPBSectionDisplayDescriptor setBackgroundGradientColor:](self, "setBackgroundGradientColor:");
  }
  if (v4[1]) {
    -[NTPBSectionDisplayDescriptor setActionTitle:](self, "setActionTitle:");
  }
  if (v4[2]) {
    -[NTPBSectionDisplayDescriptor setActionURLString:](self, "setActionURLString:");
  }
  if (v4[8]) {
    -[NTPBSectionDisplayDescriptor setNameColorDark:](self, "setNameColorDark:");
  }
  if (v4[7]) {
    -[NTPBSectionDisplayDescriptor setNameActionURLString:](self, "setNameActionURLString:");
  }
  if (v4[4]) {
    -[NTPBSectionDisplayDescriptor setBackgroundColorLight:](self, "setBackgroundColorLight:");
  }
  if (v4[3]) {
    -[NTPBSectionDisplayDescriptor setBackgroundColorDark:](self, "setBackgroundColorDark:");
  }
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

- (NSString)backgroundGradientColor
{
  return self->_backgroundGradientColor;
}

- (void)setBackgroundGradientColor:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

- (void)setActionURLString:(id)a3
{
}

- (NSString)nameColorDark
{
  return self->_nameColorDark;
}

- (void)setNameColorDark:(id)a3
{
}

- (NSString)nameActionURLString
{
  return self->_nameActionURLString;
}

- (void)setNameActionURLString:(id)a3
{
}

- (NSString)backgroundColorLight
{
  return self->_backgroundColorLight;
}

- (void)setBackgroundColorLight:(id)a3
{
}

- (NSString)backgroundColorDark
{
  return self->_backgroundColorDark;
}

- (void)setBackgroundColorDark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameColorLight, 0);
  objc_storeStrong((id *)&self->_nameColorDark, 0);
  objc_storeStrong((id *)&self->_nameActionURLString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_backgroundGradientColor, 0);
  objc_storeStrong((id *)&self->_backgroundColorLight, 0);
  objc_storeStrong((id *)&self->_backgroundColorDark, 0);
  objc_storeStrong((id *)&self->_actionURLString, 0);

  objc_storeStrong((id *)&self->_actionTitle, 0);
}

@end
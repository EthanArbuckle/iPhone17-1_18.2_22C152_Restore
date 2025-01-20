@interface NTPBTopStoriesStyleConfig
- (BOOL)hasBackgroundColor;
- (BOOL)hasForegroundColor;
- (BOOL)hasLabel;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)backgroundColor;
- (NSString)foregroundColor;
- (NSString)label;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTopStoriesStyleConfig

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasForegroundColor
{
  return self->_foregroundColor != 0;
}

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTopStoriesStyleConfig;
  v4 = [(NTPBTopStoriesStyleConfig *)&v8 description];
  v5 = [(NTPBTopStoriesStyleConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:@"label"];
  }
  foregroundColor = self->_foregroundColor;
  if (foregroundColor) {
    [v4 setObject:foregroundColor forKey:@"foreground_color"];
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor) {
    [v4 setObject:backgroundColor forKey:@"background_color"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTopStoriesStyleConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_foregroundColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_backgroundColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_type copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  uint64_t v8 = [(NSString *)self->_label copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_foregroundColor copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_backgroundColor copyWithZone:a3];
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((type = self->_type, !((unint64_t)type | v4[4])) || -[NSString isEqual:](type, "isEqual:"))
    && ((label = self->_label, !((unint64_t)label | v4[3]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((foregroundColor = self->_foregroundColor, !((unint64_t)foregroundColor | v4[2]))
     || -[NSString isEqual:](foregroundColor, "isEqual:")))
  {
    backgroundColor = self->_backgroundColor;
    if ((unint64_t)backgroundColor | v4[1]) {
      char v9 = -[NSString isEqual:](backgroundColor, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_label hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_foregroundColor hash];
  return v4 ^ v5 ^ [(NSString *)self->_backgroundColor hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[4]) {
    -[NTPBTopStoriesStyleConfig setType:](self, "setType:");
  }
  if (v4[3]) {
    -[NTPBTopStoriesStyleConfig setLabel:](self, "setLabel:");
  }
  if (v4[2]) {
    -[NTPBTopStoriesStyleConfig setForegroundColor:](self, "setForegroundColor:");
  }
  if (v4[1]) {
    -[NTPBTopStoriesStyleConfig setBackgroundColor:](self, "setBackgroundColor:");
  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (NSString)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
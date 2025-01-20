@interface APPBButton
- (APPBButtonStyle)buttonStyle;
- (BOOL)hasAccessText;
- (BOOL)hasButtonStyle;
- (BOOL)hasPredefined;
- (BOOL)hasText;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)accessText;
- (NSString)text;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)predefinedAsString:(int)a3;
- (int)StringAsPredefined:(id)a3;
- (int)predefined;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessText:(id)a3;
- (void)setButtonStyle:(id)a3;
- (void)setHasPredefined:(BOOL)a3;
- (void)setPredefined:(int)a3;
- (void)setText:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBButton

- (int)predefined
{
  if (*(unsigned char *)&self->_has) {
    return self->_predefined;
  }
  else {
    return 100000;
  }
}

- (void)setPredefined:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_predefined = a3;
}

- (void)setHasPredefined:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredefined
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)predefinedAsString:(int)a3
{
  if ((a3 - 100000) >= 7)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1002361B8[a3 - 100000];
  }

  return v3;
}

- (int)StringAsPredefined:(id)a3
{
  int v3 = 100000;
  id v4 = a3;
  if (([v4 isEqualToString:@"BUY_NOW"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"DOWNLOAD_NOW"])
    {
      int v3 = 100001;
    }
    else if ([v4 isEqualToString:@"READ_MORE"])
    {
      int v3 = 100002;
    }
    else if ([v4 isEqualToString:@"SUBSCRIBE_NOW"])
    {
      int v3 = 100003;
    }
    else if ([v4 isEqualToString:@"VIEW_MORE"])
    {
      int v3 = 100004;
    }
    else if ([v4 isEqualToString:@"LEARN_MORE"])
    {
      int v3 = 100005;
    }
    else if ([v4 isEqualToString:@"TRY_IT_FREE"])
    {
      int v3 = 100006;
    }
    else
    {
      int v3 = 100000;
    }
  }

  return v3;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (BOOL)hasAccessText
{
  return self->_accessText != 0;
}

- (BOOL)hasButtonStyle
{
  return self->_buttonStyle != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBButton;
  int v3 = [(APPBButton *)&v7 description];
  id v4 = [(APPBButton *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  int v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v4 = self->_predefined - 100000;
    if (v4 >= 7)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_predefined];
    }
    else
    {
      v5 = off_1002361B8[v4];
    }
    [v3 setObject:v5 forKey:@"predefined"];
  }
  text = self->_text;
  if (text) {
    [v3 setObject:text forKey:@"text"];
  }
  accessText = self->_accessText;
  if (accessText) {
    [v3 setObject:accessText forKey:@"accessText"];
  }
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    v9 = [(APPBButtonStyle *)buttonStyle dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"buttonStyle"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBButtonReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_text)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_accessText)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_buttonStyle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_predefined;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  id v5 = v4;
  if (self->_text)
  {
    [v4 setText:];
    id v4 = v5;
  }
  if (self->_accessText)
  {
    [v5 setAccessText:];
    id v4 = v5;
  }
  if (self->_buttonStyle)
  {
    [v5 setButtonStyle:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = self->_predefined;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(NSString *)self->_text copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(NSString *)self->_accessText copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(APPBButtonStyle *)self->_buttonStyle copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_predefined != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    unsigned __int8 v8 = 0;
    goto LABEL_14;
  }
  text = self->_text;
  if ((unint64_t)text | *((void *)v4 + 4) && !-[NSString isEqual:](text, "isEqual:")) {
    goto LABEL_13;
  }
  accessText = self->_accessText;
  if ((unint64_t)accessText | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](accessText, "isEqual:")) {
      goto LABEL_13;
    }
  }
  buttonStyle = self->_buttonStyle;
  if ((unint64_t)buttonStyle | *((void *)v4 + 2)) {
    unsigned __int8 v8 = -[APPBButtonStyle isEqual:](buttonStyle, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_predefined;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_text hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_accessText hash];
  return v4 ^ v5 ^ [(APPBButtonStyle *)self->_buttonStyle hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  NSUInteger v5 = v4;
  if (v4[10])
  {
    self->_predefined = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  unsigned __int8 v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[APPBButton setText:](self, "setText:");
    NSUInteger v5 = v8;
  }
  if (*((void *)v5 + 1))
  {
    -[APPBButton setAccessText:](self, "setAccessText:");
    NSUInteger v5 = v8;
  }
  buttonStyle = self->_buttonStyle;
  uint64_t v7 = *((void *)v5 + 2);
  if (buttonStyle)
  {
    if (v7) {
      -[APPBButtonStyle mergeFrom:](buttonStyle, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[APPBButton setButtonStyle:](self, "setButtonStyle:");
  }

  _objc_release_x1();
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)accessText
{
  return self->_accessText;
}

- (void)setAccessText:(id)a3
{
}

- (APPBButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);

  objc_storeStrong((id *)&self->_accessText, 0);
}

@end
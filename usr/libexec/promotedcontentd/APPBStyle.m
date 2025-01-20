@interface APPBStyle
- (APPBBorderStyle)borderStyle;
- (APPBButtonStyle)buttonStyle;
- (APPBColor)backgroundColor;
- (APPBColor)textColor;
- (APPBShadowStyle)shadowStyle;
- (BOOL)hasBackgroundColor;
- (BOOL)hasBorderStyle;
- (BOOL)hasButtonStyle;
- (BOOL)hasShadowStyle;
- (BOOL)hasTextColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBorderStyle:(id)a3;
- (void)setButtonStyle:(id)a3;
- (void)setShadowStyle:(id)a3;
- (void)setTextColor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBStyle

- (BOOL)hasBackgroundColor
{
  return self->_backgroundColor != 0;
}

- (BOOL)hasBorderStyle
{
  return self->_borderStyle != 0;
}

- (BOOL)hasButtonStyle
{
  return self->_buttonStyle != 0;
}

- (BOOL)hasShadowStyle
{
  return self->_shadowStyle != 0;
}

- (BOOL)hasTextColor
{
  return self->_textColor != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBStyle;
  v3 = [(APPBStyle *)&v7 description];
  v4 = [(APPBStyle *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
  {
    v5 = [(APPBColor *)backgroundColor dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"backgroundColor"];
  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    objc_super v7 = [(APPBBorderStyle *)borderStyle dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"borderStyle"];
  }
  buttonStyle = self->_buttonStyle;
  if (buttonStyle)
  {
    v9 = [(APPBButtonStyle *)buttonStyle dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"buttonStyle"];
  }
  shadowStyle = self->_shadowStyle;
  if (shadowStyle)
  {
    v11 = [(APPBShadowStyle *)shadowStyle dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"shadowStyle"];
  }
  textColor = self->_textColor;
  if (textColor)
  {
    v13 = [(APPBColor *)textColor dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"textColor"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBStyleReadFrom((id *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backgroundColor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_borderStyle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_buttonStyle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shadowStyle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_textColor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_backgroundColor)
  {
    [v4 setBackgroundColor:];
    id v4 = v5;
  }
  if (self->_borderStyle)
  {
    [v5 setBorderStyle:];
    id v4 = v5;
  }
  if (self->_buttonStyle)
  {
    [v5 setButtonStyle:];
    id v4 = v5;
  }
  if (self->_shadowStyle)
  {
    [v5 setShadowStyle:];
    id v4 = v5;
  }
  if (self->_textColor)
  {
    [v5 setTextColor:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBColor *)self->_backgroundColor copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(APPBBorderStyle *)self->_borderStyle copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(APPBButtonStyle *)self->_buttonStyle copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(APPBShadowStyle *)self->_shadowStyle copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(APPBColor *)self->_textColor copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((backgroundColor = self->_backgroundColor, !((unint64_t)backgroundColor | v4[1]))
     || -[APPBColor isEqual:](backgroundColor, "isEqual:"))
    && ((borderStyle = self->_borderStyle, !((unint64_t)borderStyle | v4[2]))
     || -[APPBBorderStyle isEqual:](borderStyle, "isEqual:"))
    && ((buttonStyle = self->_buttonStyle, !((unint64_t)buttonStyle | v4[3]))
     || -[APPBButtonStyle isEqual:](buttonStyle, "isEqual:"))
    && ((shadowStyle = self->_shadowStyle, !((unint64_t)shadowStyle | v4[4]))
     || -[APPBShadowStyle isEqual:](shadowStyle, "isEqual:")))
  {
    textColor = self->_textColor;
    if ((unint64_t)textColor | v4[5]) {
      unsigned __int8 v10 = -[APPBColor isEqual:](textColor, "isEqual:");
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
  unint64_t v3 = [(APPBColor *)self->_backgroundColor hash];
  unint64_t v4 = [(APPBBorderStyle *)self->_borderStyle hash] ^ v3;
  unint64_t v5 = [(APPBButtonStyle *)self->_buttonStyle hash];
  unint64_t v6 = v4 ^ v5 ^ [(APPBShadowStyle *)self->_shadowStyle hash];
  return v6 ^ [(APPBColor *)self->_textColor hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  backgroundColor = self->_backgroundColor;
  v15 = v4;
  uint64_t v6 = v4[1];
  if (backgroundColor)
  {
    if (v6) {
      -[APPBColor mergeFrom:](backgroundColor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBStyle setBackgroundColor:](self, "setBackgroundColor:");
  }
  borderStyle = self->_borderStyle;
  uint64_t v8 = v15[2];
  if (borderStyle)
  {
    if (v8) {
      -[APPBBorderStyle mergeFrom:](borderStyle, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[APPBStyle setBorderStyle:](self, "setBorderStyle:");
  }
  buttonStyle = self->_buttonStyle;
  uint64_t v10 = v15[3];
  if (buttonStyle)
  {
    if (v10) {
      -[APPBButtonStyle mergeFrom:](buttonStyle, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[APPBStyle setButtonStyle:](self, "setButtonStyle:");
  }
  shadowStyle = self->_shadowStyle;
  uint64_t v12 = v15[4];
  if (shadowStyle)
  {
    if (v12) {
      -[APPBShadowStyle mergeFrom:](shadowStyle, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[APPBStyle setShadowStyle:](self, "setShadowStyle:");
  }
  textColor = self->_textColor;
  uint64_t v14 = v15[5];
  if (textColor)
  {
    if (v14) {
      -[APPBColor mergeFrom:](textColor, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[APPBStyle setTextColor:](self, "setTextColor:");
  }
}

- (APPBColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (APPBBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
}

- (APPBButtonStyle)buttonStyle
{
  return self->_buttonStyle;
}

- (void)setButtonStyle:(id)a3
{
}

- (APPBShadowStyle)shadowStyle
{
  return self->_shadowStyle;
}

- (void)setShadowStyle:(id)a3
{
}

- (APPBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_shadowStyle, 0);
  objc_storeStrong((id *)&self->_buttonStyle, 0);
  objc_storeStrong((id *)&self->_borderStyle, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
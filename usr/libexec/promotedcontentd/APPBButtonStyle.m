@interface APPBButtonStyle
- (APPBBorderStyle)borderStyle;
- (APPBColor)color;
- (APPBColor)disabledColor;
- (APPBColor)highlightedColor;
- (APPBColor)textColor;
- (BOOL)hasBorderStyle;
- (BOOL)hasColor;
- (BOOL)hasCornerRadius;
- (BOOL)hasDisabledColor;
- (BOOL)hasHighlightedColor;
- (BOOL)hasTextColor;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (float)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBorderStyle:(id)a3;
- (void)setColor:(id)a3;
- (void)setCornerRadius:(float)a3;
- (void)setDisabledColor:(id)a3;
- (void)setHasCornerRadius:(BOOL)a3;
- (void)setHighlightedColor:(id)a3;
- (void)setTextColor:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBButtonStyle

- (BOOL)hasColor
{
  return self->_color != 0;
}

- (BOOL)hasHighlightedColor
{
  return self->_highlightedColor != 0;
}

- (BOOL)hasDisabledColor
{
  return self->_disabledColor != 0;
}

- (BOOL)hasTextColor
{
  return self->_textColor != 0;
}

- (void)setCornerRadius:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cornerRadius = a3;
}

- (void)setHasCornerRadius:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCornerRadius
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBorderStyle
{
  return self->_borderStyle != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBButtonStyle;
  v3 = [(APPBButtonStyle *)&v7 description];
  v4 = [(APPBButtonStyle *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  color = self->_color;
  if (color)
  {
    v6 = [(APPBColor *)color dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"color"];
  }
  highlightedColor = self->_highlightedColor;
  if (highlightedColor)
  {
    v8 = [(APPBColor *)highlightedColor dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"highlightedColor"];
  }
  disabledColor = self->_disabledColor;
  if (disabledColor)
  {
    v10 = [(APPBColor *)disabledColor dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"disabledColor"];
  }
  textColor = self->_textColor;
  if (textColor)
  {
    v12 = [(APPBColor *)textColor dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"textColor"];
  }
  if (*(unsigned char *)&self->_has)
  {
    *(float *)&double v4 = self->_cornerRadius;
    v13 = +[NSNumber numberWithFloat:v4];
    [v3 setObject:v13 forKey:@"cornerRadius"];
  }
  borderStyle = self->_borderStyle;
  if (borderStyle)
  {
    v15 = [(APPBBorderStyle *)borderStyle dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"borderStyle"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBButtonStyleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_color)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_highlightedColor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_disabledColor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_textColor)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_borderStyle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_color)
  {
    [v4 setColor:];
    id v4 = v5;
  }
  if (self->_highlightedColor)
  {
    [v5 setHighlightedColor:];
    id v4 = v5;
  }
  if (self->_disabledColor)
  {
    [v5 setDisabledColor:];
    id v4 = v5;
  }
  if (self->_textColor)
  {
    [v5 setTextColor:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = LODWORD(self->_cornerRadius);
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_borderStyle)
  {
    [v5 setBorderStyle:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBColor *)self->_color copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(APPBColor *)self->_highlightedColor copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  id v10 = [(APPBColor *)self->_disabledColor copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  id v12 = [(APPBColor *)self->_textColor copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 6) = LODWORD(self->_cornerRadius);
    *((unsigned char *)v5 + 56) |= 1u;
  }
  id v14 = [(APPBBorderStyle *)self->_borderStyle copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  color = self->_color;
  if ((unint64_t)color | *((void *)v4 + 2))
  {
    if (!-[APPBColor isEqual:](color, "isEqual:")) {
      goto LABEL_17;
    }
  }
  highlightedColor = self->_highlightedColor;
  if ((unint64_t)highlightedColor | *((void *)v4 + 5))
  {
    if (!-[APPBColor isEqual:](highlightedColor, "isEqual:")) {
      goto LABEL_17;
    }
  }
  disabledColor = self->_disabledColor;
  if ((unint64_t)disabledColor | *((void *)v4 + 4))
  {
    if (!-[APPBColor isEqual:](disabledColor, "isEqual:")) {
      goto LABEL_17;
    }
  }
  textColor = self->_textColor;
  if ((unint64_t)textColor | *((void *)v4 + 6))
  {
    if (!-[APPBColor isEqual:](textColor, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_cornerRadius != *((float *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    unsigned __int8 v10 = 0;
    goto LABEL_18;
  }
  borderStyle = self->_borderStyle;
  if ((unint64_t)borderStyle | *((void *)v4 + 1)) {
    unsigned __int8 v10 = -[APPBBorderStyle isEqual:](borderStyle, "isEqual:");
  }
  else {
    unsigned __int8 v10 = 1;
  }
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = [(APPBColor *)self->_color hash];
  unint64_t v4 = [(APPBColor *)self->_highlightedColor hash];
  unint64_t v5 = [(APPBColor *)self->_disabledColor hash];
  unint64_t v6 = [(APPBColor *)self->_textColor hash];
  if (*(unsigned char *)&self->_has)
  {
    float cornerRadius = self->_cornerRadius;
    float v9 = -cornerRadius;
    if (cornerRadius >= 0.0) {
      float v9 = self->_cornerRadius;
    }
    float v10 = floorf(v9 + 0.5);
    float v11 = (float)(v9 - v10) * 1.8447e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabsf(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(APPBBorderStyle *)self->_borderStyle hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  color = self->_color;
  uint64_t v6 = *((void *)v4 + 2);
  id v15 = v4;
  if (color)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBColor mergeFrom:](color, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[APPBButtonStyle setColor:](self, "setColor:");
  }
  id v4 = v15;
LABEL_7:
  highlightedColor = self->_highlightedColor;
  uint64_t v8 = *((void *)v4 + 5);
  if (highlightedColor)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[APPBColor mergeFrom:](highlightedColor, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[APPBButtonStyle setHighlightedColor:](self, "setHighlightedColor:");
  }
  id v4 = v15;
LABEL_13:
  disabledColor = self->_disabledColor;
  uint64_t v10 = *((void *)v4 + 4);
  if (disabledColor)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[APPBColor mergeFrom:](disabledColor, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[APPBButtonStyle setDisabledColor:](self, "setDisabledColor:");
  }
  id v4 = v15;
LABEL_19:
  textColor = self->_textColor;
  uint64_t v12 = *((void *)v4 + 6);
  if (textColor)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[APPBColor mergeFrom:](textColor, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[APPBButtonStyle setTextColor:](self, "setTextColor:");
  }
  id v4 = v15;
LABEL_25:
  if (*((unsigned char *)v4 + 56))
  {
    self->_float cornerRadius = *((float *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  borderStyle = self->_borderStyle;
  uint64_t v14 = *((void *)v4 + 1);
  if (borderStyle)
  {
    if (v14) {
      -[APPBBorderStyle mergeFrom:](borderStyle, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[APPBButtonStyle setBorderStyle:](self, "setBorderStyle:");
  }

  _objc_release_x1();
}

- (APPBColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (APPBColor)highlightedColor
{
  return self->_highlightedColor;
}

- (void)setHighlightedColor:(id)a3
{
}

- (APPBColor)disabledColor
{
  return self->_disabledColor;
}

- (void)setDisabledColor:(id)a3
{
}

- (APPBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
}

- (float)cornerRadius
{
  return self->_cornerRadius;
}

- (APPBBorderStyle)borderStyle
{
  return self->_borderStyle;
}

- (void)setBorderStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_disabledColor, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_borderStyle, 0);
}

@end
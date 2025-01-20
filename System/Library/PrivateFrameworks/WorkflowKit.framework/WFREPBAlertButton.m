@interface WFREPBAlertButton
- (BOOL)isEqual:(id)a3;
- (BOOL)preferred;
- (BOOL)readFrom:(id)a3;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)styleAsString:(int)a3;
- (int)StringAsStyle:(id)a3;
- (int)style;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPreferred:(BOOL)a3;
- (void)setStyle:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAlertButton

- (void).cxx_destruct
{
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (BOOL)preferred
{
  return self->_preferred;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int)style
{
  return self->_style;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[WFREPBAlertButton setTitle:](self, "setTitle:");
    id v4 = v5;
  }
  self->_style = *((_DWORD *)v4 + 2);
  self->_preferred = *((unsigned char *)v4 + 24);
}

- (unint64_t)hash
{
  return (2654435761 * self->_style) ^ [(NSString *)self->_title hash] ^ (2654435761 * self->_preferred);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((title = self->_title, !((unint64_t)title | *((void *)v4 + 2)))
     || -[NSString isEqual:](title, "isEqual:"))
    && self->_style == *((_DWORD *)v4 + 2))
  {
    if (self->_preferred) {
      BOOL v6 = v4[24] != 0;
    }
    else {
      BOOL v6 = v4[24] == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(_DWORD *)(v5 + 8) = self->_style;
  *(unsigned char *)(v5 + 24) = self->_preferred;
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 setTitle:title];
  *((_DWORD *)v5 + 2) = self->_style;
  *((unsigned char *)v5 + 24) = self->_preferred;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_title) {
    __assert_rtn("-[WFREPBAlertButton writeTo:]", "WFREPBAlertButton.m", 94, "nil != self->_title");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteBOOLField();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertButtonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  uint64_t style = self->_style;
  if (style >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_style);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E654DC70[style];
  }
  [v4 setObject:v7 forKey:@"style"];

  v8 = [NSNumber numberWithBool:self->_preferred];
  [v4 setObject:v8 forKey:@"preferred"];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAlertButton;
  id v4 = [(WFREPBAlertButton *)&v8 description];
  id v5 = [(WFREPBAlertButton *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsStyle:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Cancel"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Destructive"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)styleAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E654DC70[a3];
  }
  return v3;
}

@end
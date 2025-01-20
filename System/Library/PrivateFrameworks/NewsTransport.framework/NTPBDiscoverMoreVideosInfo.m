@interface NTPBDiscoverMoreVideosInfo
- (BOOL)hasActionURLString;
- (BOOL)hasSubtitle;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)actionURLString;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActionURLString:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBDiscoverMoreVideosInfo

- (void)dealloc
{
  [(NTPBDiscoverMoreVideosInfo *)self setTitle:0];
  [(NTPBDiscoverMoreVideosInfo *)self setSubtitle:0];
  [(NTPBDiscoverMoreVideosInfo *)self setActionURLString:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBDiscoverMoreVideosInfo;
  [(NTPBDiscoverMoreVideosInfo *)&v3 dealloc];
}

- (void)setTitle:(id)a3
{
}

- (void)setSubtitle:(id)a3
{
}

- (void)setActionURLString:(id)a3
{
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasActionURLString
{
  return self->_actionURLString != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBDiscoverMoreVideosInfo;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBDiscoverMoreVideosInfo description](&v3, sel_description), -[NTPBDiscoverMoreVideosInfo dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  actionURLString = self->_actionURLString;
  if (actionURLString) {
    [v4 setObject:actionURLString forKey:@"actionURLString"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDiscoverMoreVideosInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionURLString)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)[(NSString *)self->_title copyWithZone:a3];
  v5[2] = (id)[(NSString *)self->_subtitle copyWithZone:a3];

  v5[1] = (id)[(NSString *)self->_actionURLString copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    title = self->_title;
    if (!((unint64_t)title | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](title, "isEqual:")) != 0)
    {
      subtitle = self->_subtitle;
      if (!((unint64_t)subtitle | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](subtitle, "isEqual:")) != 0)
      {
        actionURLString = self->_actionURLString;
        if ((unint64_t)actionURLString | *((void *)a3 + 1))
        {
          LOBYTE(v5) = -[NSString isEqual:](actionURLString, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_subtitle hash] ^ v3;
  return v4 ^ [(NSString *)self->_actionURLString hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[NTPBDiscoverMoreVideosInfo setTitle:](self, "setTitle:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBDiscoverMoreVideosInfo setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)a3 + 1))
  {
    -[NTPBDiscoverMoreVideosInfo setActionURLString:](self, "setActionURLString:");
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionURLString
{
  return self->_actionURLString;
}

@end
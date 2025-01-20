@interface SFPerformContactActionCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)didDisplayHandleOptions;
- (BOOL)didSelectFromOptionsMenu;
- (BOOL)hasContactActionType;
- (BOOL)hasDidDisplayHandleOptions;
- (BOOL)hasDidSelectFromOptionsMenu;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFPerformContactActionCommand)initWithCoder:(id)a3;
- (SFPerformContactActionCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)contactActionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactActionType:(int)a3;
- (void)setDidDisplayHandleOptions:(BOOL)a3;
- (void)setDidSelectFromOptionsMenu:(BOOL)a3;
@end

@implementation SFPerformContactActionCommand

- (SFPerformContactActionCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFPerformContactActionCommand;
  v5 = [(SFPerformContactActionCommand *)&v8 init];
  if (v5)
  {
    if ([v4 contactActionType]) {
      -[SFPerformContactActionCommand setContactActionType:](v5, "setContactActionType:", [v4 contactActionType]);
    }
    if ([v4 didDisplayHandleOptions]) {
      -[SFPerformContactActionCommand setDidDisplayHandleOptions:](v5, "setDidDisplayHandleOptions:", [v4 didDisplayHandleOptions]);
    }
    if ([v4 didSelectFromOptionsMenu]) {
      -[SFPerformContactActionCommand setDidSelectFromOptionsMenu:](v5, "setDidSelectFromOptionsMenu:", [v4 didSelectFromOptionsMenu]);
    }
    v6 = v5;
  }

  return v5;
}

- (BOOL)didSelectFromOptionsMenu
{
  return self->_didSelectFromOptionsMenu;
}

- (BOOL)didDisplayHandleOptions
{
  return self->_didDisplayHandleOptions;
}

- (int)contactActionType
{
  return self->_contactActionType;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFPerformContactActionCommand;
  unint64_t v3 = [(SFCommand *)&v7 hash];
  uint64_t v4 = [(SFPerformContactActionCommand *)self contactActionType];
  uint64_t v5 = v4 ^ [(SFPerformContactActionCommand *)self didDisplayHandleOptions];
  return v3 ^ v5 ^ [(SFPerformContactActionCommand *)self didSelectFromOptionsMenu];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFPerformContactActionCommand *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else if ([(SFPerformContactActionCommand *)v4 isMemberOfClass:objc_opt_class()] {
         && (v11.receiver = self,
  }
             v11.super_class = (Class)SFPerformContactActionCommand,
             [(SFCommand *)&v11 isEqual:v4]))
  {
    uint64_t v5 = v4;
    int v6 = [(SFPerformContactActionCommand *)self contactActionType];
    if (v6 == [(SFPerformContactActionCommand *)v5 contactActionType]
      && (BOOL v7 = [(SFPerformContactActionCommand *)self didDisplayHandleOptions],
          v7 == [(SFPerformContactActionCommand *)v5 didDisplayHandleOptions]))
    {
      BOOL v9 = [(SFPerformContactActionCommand *)self didSelectFromOptionsMenu];
      BOOL v8 = v9 ^ [(SFPerformContactActionCommand *)v5 didSelectFromOptionsMenu] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFPerformContactActionCommand;
  id v4 = [(SFCommand *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setContactActionType:", -[SFPerformContactActionCommand contactActionType](self, "contactActionType"));
  objc_msgSend(v4, "setDidDisplayHandleOptions:", -[SFPerformContactActionCommand didDisplayHandleOptions](self, "didDisplayHandleOptions"));
  objc_msgSend(v4, "setDidSelectFromOptionsMenu:", -[SFPerformContactActionCommand didSelectFromOptionsMenu](self, "didSelectFromOptionsMenu"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPerformContactActionCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformContactActionCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPerformContactActionCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPerformContactActionCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFPerformContactActionCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFPerformContactActionCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFPerformContactActionCommand *)self init];
  objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  BOOL v7 = [[_SFPBCommand alloc] initWithData:v6];
  BOOL v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SFPerformContactActionCommand *)v5 setContactActionType:[(SFCommand *)v8 contactActionType]];
    [(SFPerformContactActionCommand *)v5 setDidDisplayHandleOptions:[(SFCommand *)v8 didDisplayHandleOptions]];
    [(SFPerformContactActionCommand *)v5 setDidSelectFromOptionsMenu:[(SFCommand *)v8 didSelectFromOptionsMenu]];
    BOOL v9 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v9];

    v10 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v10];

    objc_super v11 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v11];

    v12 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v12];
  }
  return v5;
}

- (BOOL)hasDidSelectFromOptionsMenu
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDidSelectFromOptionsMenu:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_didSelectFromOptionsMenu = a3;
}

- (BOOL)hasDidDisplayHandleOptions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDidDisplayHandleOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_didDisplayHandleOptions = a3;
}

- (BOOL)hasContactActionType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContactActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contactActionType = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
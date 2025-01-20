@interface SFToggleWatchListStatusCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)hasShouldAddToWatchList;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldAddToWatchList;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFToggleWatchListStatusCommand)initWithCoder:(id)a3;
- (SFToggleWatchListStatusCommand)initWithProtobuf:(id)a3;
- (SFWatchListItem)watchListItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldAddToWatchList:(BOOL)a3;
- (void)setWatchListItem:(id)a3;
@end

@implementation SFToggleWatchListStatusCommand

- (void).cxx_destruct
{
}

- (BOOL)shouldAddToWatchList
{
  return self->_shouldAddToWatchList;
}

- (void)setWatchListItem:(id)a3
{
}

- (SFWatchListItem)watchListItem
{
  return self->_watchListItem;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFToggleWatchListStatusCommand;
  unint64_t v3 = [(SFCommand *)&v8 hash];
  v4 = [(SFToggleWatchListStatusCommand *)self watchListItem];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFToggleWatchListStatusCommand *)self shouldAddToWatchList] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFToggleWatchListStatusCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFToggleWatchListStatusCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFToggleWatchListStatusCommand;
      if ([(SFCommand *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFToggleWatchListStatusCommand *)self watchListItem];
        v9 = [(SFToggleWatchListStatusCommand *)v7 watchListItem];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFToggleWatchListStatusCommand *)self watchListItem];
        if (!v10
          || ([(SFToggleWatchListStatusCommand *)self watchListItem],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFToggleWatchListStatusCommand *)v7 watchListItem],
              v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(SFToggleWatchListStatusCommand *)self shouldAddToWatchList];
          BOOL v11 = v12 ^ [(SFToggleWatchListStatusCommand *)v7 shouldAddToWatchList] ^ 1;
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          LOBYTE(v11) = 0;
        }

        goto LABEL_13;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFToggleWatchListStatusCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFToggleWatchListStatusCommand *)self watchListItem];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setWatchListItem:v6];

  objc_msgSend(v4, "setShouldAddToWatchList:", -[SFToggleWatchListStatusCommand shouldAddToWatchList](self, "shouldAddToWatchList"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBToggleWatchListStatusCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBToggleWatchListStatusCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBToggleWatchListStatusCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBToggleWatchListStatusCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFToggleWatchListStatusCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFToggleWatchListStatusCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFToggleWatchListStatusCommand *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 watchListItem];
    [(SFToggleWatchListStatusCommand *)v5 setWatchListItem:v9];

    [(SFToggleWatchListStatusCommand *)v5 setShouldAddToWatchList:[(SFCommand *)v8 shouldAddToWatchList]];
    v10 = [(SFCommand *)v8 commandDetail];
    [(SFCommand *)v5 setCommandDetail:v10];

    BOOL v11 = [(SFCommand *)v8 normalizedTopic];
    [(SFCommand *)v5 setNormalizedTopic:v11];

    BOOL v12 = [(SFCommand *)v8 backendData];
    [(SFCommand *)v5 setBackendData:v12];

    v13 = [(SFCommand *)v8 commandReference];
    [(SFCommand *)v5 setCommandReference:v13];
  }
  return v5;
}

- (BOOL)hasShouldAddToWatchList
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setShouldAddToWatchList:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldAddToWatchList = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFToggleWatchListStatusCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFToggleWatchListStatusCommand;
  uint64_t v5 = [(SFToggleWatchListStatusCommand *)&v12 init];
  if (v5)
  {
    unint64_t v6 = [v4 watchListItem];

    if (v6)
    {
      v7 = [SFWatchListItem alloc];
      objc_super v8 = [v4 watchListItem];
      v9 = [(SFWatchListItem *)v7 initWithProtobuf:v8];
      [(SFToggleWatchListStatusCommand *)v5 setWatchListItem:v9];
    }
    if ([v4 shouldAddToWatchList]) {
      -[SFToggleWatchListStatusCommand setShouldAddToWatchList:](v5, "setShouldAddToWatchList:", [v4 shouldAddToWatchList]);
    }
    v10 = v5;
  }

  return v5;
}

@end
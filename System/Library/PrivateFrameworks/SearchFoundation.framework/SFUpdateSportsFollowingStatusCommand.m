@interface SFUpdateSportsFollowingStatusCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)follow;
- (BOOL)hasFollow;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFSportsItem)sportsItem;
- (SFUpdateSportsFollowingStatusCommand)initWithCoder:(id)a3;
- (SFUpdateSportsFollowingStatusCommand)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFollow:(BOOL)a3;
- (void)setSportsItem:(id)a3;
@end

@implementation SFUpdateSportsFollowingStatusCommand

- (SFUpdateSportsFollowingStatusCommand)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  v5 = [(SFUpdateSportsFollowingStatusCommand *)&v12 init];
  if (v5)
  {
    v6 = [v4 sportsItem];

    if (v6)
    {
      v7 = [SFSportsItem alloc];
      v8 = [v4 sportsItem];
      v9 = [(SFSportsItem *)v7 initWithProtobuf:v8];
      [(SFUpdateSportsFollowingStatusCommand *)v5 setSportsItem:v9];
    }
    if ([v4 follow]) {
      -[SFUpdateSportsFollowingStatusCommand setFollow:](v5, "setFollow:", [v4 follow]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (BOOL)follow
{
  return self->_follow;
}

- (void)setSportsItem:(id)a3
{
}

- (SFSportsItem)sportsItem
{
  return self->_sportsItem;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  unint64_t v3 = [(SFCommand *)&v8 hash];
  id v4 = [(SFUpdateSportsFollowingStatusCommand *)self sportsItem];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFUpdateSportsFollowingStatusCommand *)self follow] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFUpdateSportsFollowingStatusCommand *)a3;
  if (self == v6)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if ([(SFUpdateSportsFollowingStatusCommand *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
      if ([(SFCommand *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFUpdateSportsFollowingStatusCommand *)self sportsItem];
        v9 = [(SFUpdateSportsFollowingStatusCommand *)v7 sportsItem];
        if ((v8 == 0) == (v9 != 0))
        {
          LOBYTE(v11) = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFUpdateSportsFollowingStatusCommand *)self sportsItem];
        if (!v10
          || ([(SFUpdateSportsFollowingStatusCommand *)self sportsItem],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFUpdateSportsFollowingStatusCommand *)v7 sportsItem],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          BOOL v12 = [(SFUpdateSportsFollowingStatusCommand *)self follow];
          BOOL v11 = v12 ^ [(SFUpdateSportsFollowingStatusCommand *)v7 follow] ^ 1;
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
  v8.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  id v4 = [(SFCommand *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFUpdateSportsFollowingStatusCommand *)self sportsItem];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setSportsItem:v6];

  objc_msgSend(v4, "setFollow:", -[SFUpdateSportsFollowingStatusCommand follow](self, "follow"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBUpdateSportsFollowingStatusCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBUpdateSportsFollowingStatusCommand *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBUpdateSportsFollowingStatusCommand alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBUpdateSportsFollowingStatusCommand *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFUpdateSportsFollowingStatusCommand;
  [(SFCommand *)&v3 encodeWithCoder:a3];
}

- (SFUpdateSportsFollowingStatusCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFUpdateSportsFollowingStatusCommand *)self init];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v7 = [[_SFPBCommand alloc] initWithData:v6];
  objc_super v8 = [[SFCommand alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFCommand *)v8 sportsItem];
    [(SFUpdateSportsFollowingStatusCommand *)v5 setSportsItem:v9];

    [(SFUpdateSportsFollowingStatusCommand *)v5 setFollow:[(SFCommand *)v8 follow]];
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

- (BOOL)hasFollow
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFollow:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_follow = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
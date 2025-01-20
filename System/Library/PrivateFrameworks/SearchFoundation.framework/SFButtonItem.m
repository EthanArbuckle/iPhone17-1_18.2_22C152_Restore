@interface SFButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasUniqueId;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFButtonItem)initWithCoder:(id)a3;
- (SFButtonItem)initWithProtobuf:(id)a3;
- (SFButtonItemAppearance)buttonAppearance;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)encodeWithCoder:(id)a3;
- (void)setButtonAppearance:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
@end

@implementation SFButtonItem

- (SFButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SFButtonItem;
  v5 = [(SFButtonItem *)&v28 init];
  if (v5)
  {
    v6 = [v4 buttonAppearance];

    if (v6)
    {
      v7 = [SFButtonItemAppearance alloc];
      v8 = [v4 buttonAppearance];
      v9 = [(SFButtonItemAppearance *)v7 initWithProtobuf:v8];
      [(SFButtonItem *)v5 setButtonAppearance:v9];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v10 = [v4 commandButtonItem];

    if (v10)
    {
      v11 = [SFCommandButtonItem alloc];
      uint64_t v12 = [v4 commandButtonItem];
    }
    else
    {
      v14 = [v4 contactButtonItem];

      if (v14)
      {
        v11 = [SFContactButtonItem alloc];
        uint64_t v12 = [v4 contactButtonItem];
      }
      else
      {
        v15 = [v4 coreSpotlightButtonItem];

        if (v15)
        {
          v11 = [SFCoreSpotlightButtonItem alloc];
          uint64_t v12 = [v4 coreSpotlightButtonItem];
        }
        else
        {
          v16 = [v4 watchListButtonItem];

          if (v16)
          {
            v11 = [SFWatchListButtonItem alloc];
            uint64_t v12 = [v4 watchListButtonItem];
          }
          else
          {
            v17 = [v4 appActionsButtonItem];

            if (v17)
            {
              v11 = [SFAppAutoShortcutsButtonItem alloc];
              uint64_t v12 = [v4 appActionsButtonItem];
            }
            else
            {
              v18 = [v4 sportsFollowButtonItem];

              if (v18)
              {
                v11 = [SFSportsFollowButtonItem alloc];
                uint64_t v12 = [v4 sportsFollowButtonItem];
              }
              else
              {
                v19 = [v4 playWatchListItemButtonItem];

                if (v19)
                {
                  v11 = [SFPlayWatchListItemButtonItem alloc];
                  uint64_t v12 = [v4 playWatchListItemButtonItem];
                }
                else
                {
                  v20 = [v4 playAudioButtonItem];

                  if (v20)
                  {
                    v11 = [SFPlayAudioButtonItem alloc];
                    uint64_t v12 = [v4 playAudioButtonItem];
                  }
                  else
                  {
                    v21 = [v4 storeButtonItem];

                    if (!v21)
                    {
                      v13 = v5;
                      goto LABEL_29;
                    }
                    v11 = [SFStoreButtonItem alloc];
                    uint64_t v12 = [v4 storeButtonItem];
                  }
                }
              }
            }
          }
        }
      }
    }
    v22 = (void *)v12;
    v13 = [(SFCommandButtonItem *)v11 initWithProtobuf:v12];

    v23 = [v4 buttonAppearance];

    if (v23)
    {
      v24 = [SFButtonItemAppearance alloc];
      v25 = [v4 buttonAppearance];
      v26 = [(SFButtonItemAppearance *)v24 initWithProtobuf:v25];
      [(SFButtonItem *)v13 setButtonAppearance:v26];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v13, "setUniqueId:", [v4 uniqueId]);
    }
  }
  else
  {
    v13 = 0;
  }
LABEL_29:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void)setButtonAppearance:(id)a3
{
}

- (SFButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (unint64_t)hash
{
  v3 = [(SFButtonItem *)self buttonAppearance];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(SFButtonItem *)self uniqueId] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (SFButtonItem *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFButtonItem *)v6 isMemberOfClass:objc_opt_class()])
    {
      v7 = v6;
      v8 = [(SFButtonItem *)self buttonAppearance];
      v9 = [(SFButtonItem *)v7 buttonAppearance];
      if ((v8 == 0) == (v9 != 0))
      {
        BOOL v11 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v10 = [(SFButtonItem *)self buttonAppearance];
      if (!v10
        || ([(SFButtonItem *)self buttonAppearance],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SFButtonItem *)v7 buttonAppearance],
            uint64_t v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        unint64_t v12 = [(SFButtonItem *)self uniqueId];
        BOOL v11 = v12 == [(SFButtonItem *)v7 uniqueId];
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        BOOL v11 = 0;
      }

      goto LABEL_12;
    }
    BOOL v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v5 = [(SFButtonItem *)self buttonAppearance];
  v6 = (void *)[v5 copy];
  [v4 setButtonAppearance:v6];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBButtonItem alloc] initWithFacade:self];
  v3 = [(_SFPBButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBButtonItem alloc] initWithFacade:self];
  v3 = [(_SFPBButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBButtonItem alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBButtonItem alloc] initWithData:v5];
  v7 = [(SFButtonItem *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasUniqueId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUniqueId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uniqueId = a3;
}

@end
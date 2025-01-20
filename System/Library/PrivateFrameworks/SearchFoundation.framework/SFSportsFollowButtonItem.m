@interface SFSportsFollowButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)fallbackTitle;
- (SFSportsFollowButtonItem)initWithCoder:(id)a3;
- (SFSportsFollowButtonItem)initWithProtobuf:(id)a3;
- (SFSportsItem)sportsItem;
- (SFToggleButtonConfiguration)toggleButtonConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFallbackTitle:(id)a3;
- (void)setSportsItem:(id)a3;
- (void)setToggleButtonConfiguration:(id)a3;
@end

@implementation SFSportsFollowButtonItem

- (SFSportsFollowButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFSportsFollowButtonItem;
  v5 = [(SFSportsFollowButtonItem *)&v18 init];
  if (v5)
  {
    v6 = [v4 sportsItem];

    if (v6)
    {
      v7 = [SFSportsItem alloc];
      v8 = [v4 sportsItem];
      v9 = [(SFSportsItem *)v7 initWithProtobuf:v8];
      [(SFSportsFollowButtonItem *)v5 setSportsItem:v9];
    }
    v10 = [v4 toggleButtonConfiguration];

    if (v10)
    {
      v11 = [SFToggleButtonConfiguration alloc];
      v12 = [v4 toggleButtonConfiguration];
      v13 = [(SFToggleButtonConfiguration *)v11 initWithProtobuf:v12];
      [(SFSportsFollowButtonItem *)v5 setToggleButtonConfiguration:v13];
    }
    v14 = [v4 fallbackTitle];

    if (v14)
    {
      v15 = [v4 fallbackTitle];
      [(SFSportsFollowButtonItem *)v5 setFallbackTitle:v15];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v16 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackTitle, 0);
  objc_storeStrong((id *)&self->_toggleButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_sportsItem, 0);
}

- (void)setFallbackTitle:(id)a3
{
}

- (NSString)fallbackTitle
{
  return self->_fallbackTitle;
}

- (void)setToggleButtonConfiguration:(id)a3
{
}

- (SFToggleButtonConfiguration)toggleButtonConfiguration
{
  return self->_toggleButtonConfiguration;
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
  v12.receiver = self;
  v12.super_class = (Class)SFSportsFollowButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v12 hash];
  id v4 = [(SFSportsFollowButtonItem *)self sportsItem];
  uint64_t v5 = [v4 hash];
  v6 = [(SFSportsFollowButtonItem *)self toggleButtonConfiguration];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFSportsFollowButtonItem *)self fallbackTitle];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFSportsFollowButtonItem *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFSportsFollowButtonItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFSportsFollowButtonItem;
      if ([(SFButtonItem *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFSportsFollowButtonItem *)self sportsItem];
        v8 = [(SFSportsFollowButtonItem *)v6 sportsItem];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFSportsFollowButtonItem *)self sportsItem];
        if (v9)
        {
          unint64_t v10 = [(SFSportsFollowButtonItem *)self sportsItem];
          unint64_t v3 = [(SFSportsFollowButtonItem *)v6 sportsItem];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFSportsFollowButtonItem *)self toggleButtonConfiguration];
        v13 = [(SFSportsFollowButtonItem *)v6 toggleButtonConfiguration];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_30;
        }
        v15 = [(SFSportsFollowButtonItem *)self toggleButtonConfiguration];
        if (v15)
        {
          v26 = v12;
          v16 = [(SFSportsFollowButtonItem *)self toggleButtonConfiguration];
          v29 = [(SFSportsFollowButtonItem *)v6 toggleButtonConfiguration];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            BOOL v11 = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        v17 = [(SFSportsFollowButtonItem *)self fallbackTitle];
        objc_super v18 = [(SFSportsFollowButtonItem *)v6 fallbackTitle];
        if ((v17 == 0) == (v18 != 0))
        {

          BOOL v11 = 0;
          v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        v24 = v18;
        v25 = v17;
        [(SFSportsFollowButtonItem *)self fallbackTitle];
        v27 = v15 = v31;
        if (!v27
          || ([(SFSportsFollowButtonItem *)self fallbackTitle],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFSportsFollowButtonItem *)v6 fallbackTitle],
              v22 = objc_claimAutoreleasedReturnValue(),
              v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          unint64_t v20 = [(SFButtonItem *)self uniqueId];
          BOOL v11 = v20 == [(SFButtonItem *)v6 uniqueId];
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFSportsFollowButtonItem;
  id v4 = [(SFButtonItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFSportsFollowButtonItem *)self sportsItem];
  v6 = (void *)[v5 copy];
  [v4 setSportsItem:v6];

  uint64_t v7 = [(SFSportsFollowButtonItem *)self toggleButtonConfiguration];
  v8 = (void *)[v7 copy];
  [v4 setToggleButtonConfiguration:v8];

  uint64_t v9 = [(SFSportsFollowButtonItem *)self fallbackTitle];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setFallbackTitle:v10];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBSportsFollowButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSportsFollowButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBSportsFollowButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBSportsFollowButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBSportsFollowButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBSportsFollowButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFSportsFollowButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBSportsFollowButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFSportsFollowButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
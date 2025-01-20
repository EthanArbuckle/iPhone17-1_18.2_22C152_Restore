@interface SFPlayWatchListItemButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)title;
- (SFImage)image;
- (SFPlayWatchListItemButtonItem)initWithCoder:(id)a3;
- (SFPlayWatchListItemButtonItem)initWithProtobuf:(id)a3;
- (SFWatchListItem)watchListItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWatchListItem:(id)a3;
@end

@implementation SFPlayWatchListItemButtonItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_watchListItem, 0);
}

- (void)setImage:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
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
  v12.receiver = self;
  v12.super_class = (Class)SFPlayWatchListItemButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v12 hash];
  v4 = [(SFPlayWatchListItemButtonItem *)self watchListItem];
  uint64_t v5 = [v4 hash];
  v6 = [(SFPlayWatchListItemButtonItem *)self title];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFPlayWatchListItemButtonItem *)self image];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFPlayWatchListItemButtonItem *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFPlayWatchListItemButtonItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFPlayWatchListItemButtonItem;
      if ([(SFButtonItem *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFPlayWatchListItemButtonItem *)self watchListItem];
        v8 = [(SFPlayWatchListItemButtonItem *)v6 watchListItem];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFPlayWatchListItemButtonItem *)self watchListItem];
        if (v9)
        {
          unint64_t v10 = [(SFPlayWatchListItemButtonItem *)self watchListItem];
          unint64_t v3 = [(SFPlayWatchListItemButtonItem *)v6 watchListItem];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFPlayWatchListItemButtonItem *)self title];
        v13 = [(SFPlayWatchListItemButtonItem *)v6 title];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_30;
        }
        v15 = [(SFPlayWatchListItemButtonItem *)self title];
        if (v15)
        {
          v26 = v12;
          v16 = [(SFPlayWatchListItemButtonItem *)self title];
          v29 = [(SFPlayWatchListItemButtonItem *)v6 title];
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
        v17 = [(SFPlayWatchListItemButtonItem *)self image];
        v18 = [(SFPlayWatchListItemButtonItem *)v6 image];
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
        [(SFPlayWatchListItemButtonItem *)self image];
        v27 = v15 = v31;
        if (!v27
          || ([(SFPlayWatchListItemButtonItem *)self image],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFPlayWatchListItemButtonItem *)v6 image],
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
  v12.super_class = (Class)SFPlayWatchListItemButtonItem;
  id v4 = [(SFButtonItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFPlayWatchListItemButtonItem *)self watchListItem];
  v6 = (void *)[v5 copy];
  [v4 setWatchListItem:v6];

  uint64_t v7 = [(SFPlayWatchListItemButtonItem *)self title];
  v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  uint64_t v9 = [(SFPlayWatchListItemButtonItem *)self image];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setImage:v10];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPlayWatchListItemButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayWatchListItemButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPlayWatchListItemButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBPlayWatchListItemButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBPlayWatchListItemButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBPlayWatchListItemButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPlayWatchListItemButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBPlayWatchListItemButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFPlayWatchListItemButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPlayWatchListItemButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFPlayWatchListItemButtonItem;
  uint64_t v5 = [(SFPlayWatchListItemButtonItem *)&v18 init];
  if (v5)
  {
    v6 = [v4 watchListItem];

    if (v6)
    {
      uint64_t v7 = [SFWatchListItem alloc];
      v8 = [v4 watchListItem];
      uint64_t v9 = [(SFWatchListItem *)v7 initWithProtobuf:v8];
      [(SFPlayWatchListItemButtonItem *)v5 setWatchListItem:v9];
    }
    unint64_t v10 = [v4 title];

    if (v10)
    {
      BOOL v11 = [v4 title];
      [(SFPlayWatchListItemButtonItem *)v5 setTitle:v11];
    }
    objc_super v12 = [v4 image];

    if (v12)
    {
      v13 = [SFImage alloc];
      v14 = [v4 image];
      v15 = [(SFImage *)v13 initWithProtobuf:v14];
      [(SFPlayWatchListItemButtonItem *)v5 setImage:v15];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v16 = v5;
  }

  return v5;
}

@end
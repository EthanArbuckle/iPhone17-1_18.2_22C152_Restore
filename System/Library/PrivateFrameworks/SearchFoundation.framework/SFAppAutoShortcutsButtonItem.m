@interface SFAppAutoShortcutsButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (SFAppAutoShortcutsButtonItem)initWithCoder:(id)a3;
- (SFAppAutoShortcutsButtonItem)initWithProtobuf:(id)a3;
- (SFAppAutoShortcutsItem)appAutoShortcutsItem;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAppAutoShortcutsItem:(id)a3;
@end

@implementation SFAppAutoShortcutsButtonItem

- (SFAppAutoShortcutsButtonItem)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFAppAutoShortcutsButtonItem;
  v5 = [(SFAppAutoShortcutsButtonItem *)&v12 init];
  if (v5)
  {
    v6 = [v4 appAutoShortcutsItem];

    if (v6)
    {
      v7 = [SFAppAutoShortcutsItem alloc];
      v8 = [v4 appAutoShortcutsItem];
      v9 = [(SFAppAutoShortcutsItem *)v7 initWithProtobuf:v8];
      [(SFAppAutoShortcutsButtonItem *)v5 setAppAutoShortcutsItem:v9];
    }
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setAppAutoShortcutsItem:(id)a3
{
}

- (SFAppAutoShortcutsItem)appAutoShortcutsItem
{
  return self->_appAutoShortcutsItem;
}

- (unint64_t)hash
{
  v8.receiver = self;
  v8.super_class = (Class)SFAppAutoShortcutsButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v8 hash];
  id v4 = [(SFAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v5 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v6 = (SFAppAutoShortcutsButtonItem *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFAppAutoShortcutsButtonItem *)v6 isMemberOfClass:objc_opt_class()])
    {
      v14.receiver = self;
      v14.super_class = (Class)SFAppAutoShortcutsButtonItem;
      if ([(SFButtonItem *)&v14 isEqual:v6])
      {
        v7 = v6;
        objc_super v8 = [(SFAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
        v9 = [(SFAppAutoShortcutsButtonItem *)v7 appAutoShortcutsItem];
        if ((v8 == 0) == (v9 != 0))
        {
          BOOL v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
        v10 = [(SFAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
        if (!v10
          || ([(SFAppAutoShortcutsButtonItem *)self appAutoShortcutsItem],
              unint64_t v3 = objc_claimAutoreleasedReturnValue(),
              [(SFAppAutoShortcutsButtonItem *)v7 appAutoShortcutsItem],
              id v4 = objc_claimAutoreleasedReturnValue(),
              [v3 isEqual:v4]))
        {
          unint64_t v12 = [(SFButtonItem *)self uniqueId];
          BOOL v11 = v12 == [(SFButtonItem *)v7 uniqueId];
          if (!v10)
          {
LABEL_13:

            goto LABEL_14;
          }
        }
        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }
    BOOL v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFAppAutoShortcutsButtonItem;
  id v4 = [(SFButtonItem *)&v8 copyWithZone:a3];
  uint64_t v5 = [(SFAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
  unint64_t v6 = (void *)[v5 copy];
  [v4 setAppAutoShortcutsItem:v6];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAppAutoShortcutsButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppAutoShortcutsButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAppAutoShortcutsButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBAppAutoShortcutsButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBAppAutoShortcutsButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBAppAutoShortcutsButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAppAutoShortcutsButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  unint64_t v6 = [[_SFPBAppAutoShortcutsButtonItem alloc] initWithData:v5];
  v7 = [(SFAppAutoShortcutsButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
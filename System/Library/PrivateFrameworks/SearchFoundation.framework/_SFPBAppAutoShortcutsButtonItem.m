@interface _SFPBAppAutoShortcutsButtonItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBAppAutoShortcutsButtonItem)initWithDictionary:(id)a3;
- (_SFPBAppAutoShortcutsButtonItem)initWithFacade:(id)a3;
- (_SFPBAppAutoShortcutsButtonItem)initWithJSON:(id)a3;
- (_SFPBAppAutoShortcutsItem)appAutoShortcutsItem;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)setAppAutoShortcutsItem:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAppAutoShortcutsButtonItem

- (_SFPBAppAutoShortcutsButtonItem)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAppAutoShortcutsButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 appAutoShortcutsItem];

    if (v6)
    {
      v7 = [_SFPBAppAutoShortcutsItem alloc];
      v8 = [v4 appAutoShortcutsItem];
      v9 = [(_SFPBAppAutoShortcutsItem *)v7 initWithFacade:v8];
      [(_SFPBAppAutoShortcutsButtonItem *)v5 setAppAutoShortcutsItem:v9];
    }
    if ([v4 hasUniqueId]) {
      -[_SFPBAppAutoShortcutsButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (_SFPBAppAutoShortcutsItem)appAutoShortcutsItem
{
  return self->_appAutoShortcutsItem;
}

- (_SFPBAppAutoShortcutsButtonItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBAppAutoShortcutsButtonItem;
  v5 = [(_SFPBAppAutoShortcutsButtonItem *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"appAutoShortcutsItem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBAppAutoShortcutsItem alloc] initWithDictionary:v6];
      [(_SFPBAppAutoShortcutsButtonItem *)v5 setAppAutoShortcutsItem:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAppAutoShortcutsButtonItem setUniqueId:](v5, "setUniqueId:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (_SFPBAppAutoShortcutsButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAppAutoShortcutsButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAppAutoShortcutsButtonItem *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_appAutoShortcutsItem)
  {
    id v4 = [(_SFPBAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"appAutoShortcutsItem"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"appAutoShortcutsItem"];
    }
  }
  if (self->_uniqueId)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBAppAutoShortcutsButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v7 forKeyedSubscript:@"uniqueId"];
  }
  return v3;
}

- (unint64_t)hash
{
  return (2654435761u * self->_uniqueId) ^ [(_SFPBAppAutoShortcutsItem *)self->_appAutoShortcutsItem hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
    v6 = [v4 appAutoShortcutsItem];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
      if (!v8)
      {

LABEL_10:
        unint64_t uniqueId = self->_uniqueId;
        BOOL v13 = uniqueId == [v4 uniqueId];
        goto LABEL_8;
      }
      v9 = (void *)v8;
      v10 = [(_SFPBAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
      objc_super v11 = [v4 appAutoShortcutsItem];
      int v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBAppAutoShortcutsButtonItem *)self appAutoShortcutsItem];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }

  if ([(_SFPBAppAutoShortcutsButtonItem *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAppAutoShortcutsButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (void)setAppAutoShortcutsItem:(id)a3
{
}

@end
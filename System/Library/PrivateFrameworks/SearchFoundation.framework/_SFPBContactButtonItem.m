@interface _SFPBContactButtonItem
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)actionTypesToShows;
- (NSData)jsonData;
- (NSString)contactIdentifier;
- (_SFPBContactButtonItem)initWithDictionary:(id)a3;
- (_SFPBContactButtonItem)initWithFacade:(id)a3;
- (_SFPBContactButtonItem)initWithJSON:(id)a3;
- (_SFPBPerson)person;
- (id)dictionaryRepresentation;
- (int)actionTypesToShowAtIndex:(unint64_t)a3;
- (unint64_t)actionTypesToShowCount;
- (unint64_t)hash;
- (unint64_t)uniqueId;
- (void)addActionTypesToShow:(int)a3;
- (void)clearActionTypesToShow;
- (void)setActionTypesToShow:(id)a3;
- (void)setActionTypesToShows:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setPerson:(id)a3;
- (void)setUniqueId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBContactButtonItem

- (_SFPBContactButtonItem)initWithFacade:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBContactButtonItem *)self init];
  if (v5)
  {
    v6 = [v4 contactIdentifier];

    if (v6)
    {
      v7 = [v4 contactIdentifier];
      [(_SFPBContactButtonItem *)v5 setContactIdentifier:v7];
    }
    v8 = [v4 person];

    if (v8)
    {
      v9 = [_SFPBPerson alloc];
      v10 = [v4 person];
      v11 = [(_SFPBPerson *)v9 initWithFacade:v10];
      [(_SFPBContactButtonItem *)v5 setPerson:v11];
    }
    v12 = [v4 actionTypesToShow];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = objc_msgSend(v4, "actionTypesToShow", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (*(void *)(*((void *)&v21 + 1) + 8 * i)) {
            objc_msgSend(v13, "addObject:");
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }

    [(_SFPBContactButtonItem *)v5 setActionTypesToShows:v13];
    if ([v4 hasUniqueId]) {
      -[_SFPBContactButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v19 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypesToShows, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (unint64_t)uniqueId
{
  return self->_uniqueId;
}

- (void)setActionTypesToShows:(id)a3
{
}

- (NSArray)actionTypesToShows
{
  return self->_actionTypesToShows;
}

- (_SFPBPerson)person
{
  return self->_person;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (_SFPBContactButtonItem)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_SFPBContactButtonItem;
  v5 = [(_SFPBContactButtonItem *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBContactButtonItem *)v5 setContactIdentifier:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"person"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[_SFPBPerson alloc] initWithDictionary:v8];
      [(_SFPBContactButtonItem *)v5 setPerson:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"actionTypesToShow"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[_SFPBContactButtonItem addActionTypesToShow:](v5, "addActionTypesToShow:", [v16 intValue]);
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v13);
      }

      v6 = v20;
    }
    uint64_t v17 = [v4 objectForKeyedSubscript:@"uniqueId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBContactButtonItem setUniqueId:](v5, "setUniqueId:", [v17 unsignedLongLongValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBContactButtonItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBContactButtonItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBContactButtonItem *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_actionTypesToShows count])
  {
    id v4 = [(_SFPBContactButtonItem *)self actionTypesToShows];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionTypesToShow"];
  }
  if (self->_contactIdentifier)
  {
    v6 = [(_SFPBContactButtonItem *)self contactIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"contactIdentifier"];
  }
  if (self->_person)
  {
    v8 = [(_SFPBContactButtonItem *)self person];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"person"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"person"];
    }
  }
  if (self->_uniqueId)
  {
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_SFPBContactButtonItem uniqueId](self, "uniqueId"));
    [v3 setObject:v11 forKeyedSubscript:@"uniqueId"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  unint64_t v4 = [(_SFPBPerson *)self->_person hash];
  return v4 ^ v3 ^ [(NSArray *)self->_actionTypesToShows hash] ^ (2654435761u * self->_uniqueId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(_SFPBContactButtonItem *)self contactIdentifier];
  v6 = [v4 contactIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(_SFPBContactButtonItem *)self contactIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBContactButtonItem *)self contactIdentifier];
    v10 = [v4 contactIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBContactButtonItem *)self person];
  v6 = [v4 person];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(_SFPBContactButtonItem *)self person];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(_SFPBContactButtonItem *)self person];
    uint64_t v15 = [v4 person];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(_SFPBContactButtonItem *)self actionTypesToShows];
  v6 = [v4 actionTypesToShows];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(_SFPBContactButtonItem *)self actionTypesToShows];
    if (!v17)
    {

LABEL_20:
      unint64_t uniqueId = self->_uniqueId;
      BOOL v22 = uniqueId == [v4 uniqueId];
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(_SFPBContactButtonItem *)self actionTypesToShows];
    v20 = [v4 actionTypesToShows];
    int v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBContactButtonItem *)self contactIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  v6 = [(_SFPBContactButtonItem *)self person];
  if (v6) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v7 = [(_SFPBContactButtonItem *)self actionTypesToShows];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11) intValue];
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ([(_SFPBContactButtonItem *)self uniqueId]) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBContactButtonItemReadFrom(self, (uint64_t)a3);
}

- (void)setUniqueId:(unint64_t)a3
{
  self->_unint64_t uniqueId = a3;
}

- (int)actionTypesToShowAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_actionTypesToShows objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)actionTypesToShowCount
{
  return [(NSArray *)self->_actionTypesToShows count];
}

- (void)addActionTypesToShow:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  actionTypesToShows = self->_actionTypesToShows;
  if (!actionTypesToShows)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_actionTypesToShows;
    self->_actionTypesToShows = v6;

    actionTypesToShows = self->_actionTypesToShows;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)actionTypesToShows addObject:v8];
}

- (void)clearActionTypesToShow
{
}

- (void)setActionTypesToShow:(id)a3
{
  self->_actionTypesToShows = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPerson:(id)a3
{
}

- (void)setContactIdentifier:(id)a3
{
  self->_contactIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end
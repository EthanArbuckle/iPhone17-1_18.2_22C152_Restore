@interface ATXPBSuggestionCollection
+ (Class)suggestionsType;
- (BOOL)hasContextTitle;
- (BOOL)hasSectionIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestions;
- (NSString)contextTitle;
- (NSString)sectionIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)suggestionsCount;
- (void)addSuggestions:(id)a3;
- (void)clearSuggestions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContextTitle:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSuggestionCollection

- (BOOL)hasContextTitle
{
  return self->_contextTitle != 0;
}

- (void)clearSuggestions
{
}

- (void)addSuggestions:(id)a3
{
  id v4 = a3;
  suggestions = self->_suggestions;
  id v8 = v4;
  if (!suggestions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestions;
    self->_suggestions = v6;

    id v4 = v8;
    suggestions = self->_suggestions;
  }
  [(NSMutableArray *)suggestions addObject:v4];
}

- (unint64_t)suggestionsCount
{
  return [(NSMutableArray *)self->_suggestions count];
}

- (id)suggestionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestions objectAtIndex:a3];
}

+ (Class)suggestionsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSectionIdentifier
{
  return self->_sectionIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSuggestionCollection;
  id v4 = [(ATXPBSuggestionCollection *)&v8 description];
  v5 = [(ATXPBSuggestionCollection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  contextTitle = self->_contextTitle;
  if (contextTitle) {
    [v3 setObject:contextTitle forKey:@"contextTitle"];
  }
  if ([(NSMutableArray *)self->_suggestions count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_suggestions, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = self->_suggestions;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"suggestions"];
  }
  sectionIdentifier = self->_sectionIdentifier;
  if (sectionIdentifier) {
    [v4 setObject:sectionIdentifier forKey:@"sectionIdentifier"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSuggestionCollectionReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_contextTitle) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestions;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_sectionIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_contextTitle) {
    objc_msgSend(v8, "setContextTitle:");
  }
  if ([(ATXPBSuggestionCollection *)self suggestionsCount])
  {
    [v8 clearSuggestions];
    unint64_t v4 = [(ATXPBSuggestionCollection *)self suggestionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBSuggestionCollection *)self suggestionsAtIndex:i];
        [v8 addSuggestions:v7];
      }
    }
  }
  if (self->_sectionIdentifier) {
    objc_msgSend(v8, "setSectionIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_contextTitle copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->_suggestions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12), "copyWithZone:", a3, (void)v17);
        [v5 addSuggestions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [(NSString *)self->_sectionIdentifier copyWithZone:a3];
  uint64_t v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((contextTitle = self->_contextTitle, !((unint64_t)contextTitle | v4[1]))
     || -[NSString isEqual:](contextTitle, "isEqual:"))
    && ((suggestions = self->_suggestions, !((unint64_t)suggestions | v4[3]))
     || -[NSMutableArray isEqual:](suggestions, "isEqual:")))
  {
    sectionIdentifier = self->_sectionIdentifier;
    if ((unint64_t)sectionIdentifier | v4[2]) {
      char v8 = -[NSString isEqual:](sectionIdentifier, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contextTitle hash];
  uint64_t v4 = [(NSMutableArray *)self->_suggestions hash] ^ v3;
  return v4 ^ [(NSString *)self->_sectionIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[ATXPBSuggestionCollection setContextTitle:](self, "setContextTitle:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ATXPBSuggestionCollection addSuggestions:](self, "addSuggestions:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[ATXPBSuggestionCollection setSectionIdentifier:](self, "setSectionIdentifier:");
  }
}

- (NSString)contextTitle
{
  return self->_contextTitle;
}

- (void)setContextTitle:(id)a3
{
}

- (NSMutableArray)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_contextTitle, 0);
}

@end
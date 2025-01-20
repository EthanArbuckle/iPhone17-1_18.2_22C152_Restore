@interface VUIPlistMediaDatabaseShow
- (BOOL)isEqual:(id)a3;
- (NSArray)seasons;
- (VUIPlistMediaDatabaseShow)initWithDictionary:(id)a3;
- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3;
- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)isLocal;
- (id)seasonForIdentifier:(id)a3;
- (void)setSeasons:(id)a3;
@end

@implementation VUIPlistMediaDatabaseShow

- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseShow;
  v4 = [(VUIPlistMediaDatabaseEntity *)&v8 initWithIdentifier:a3 type:a4];
  v5 = v4;
  if (v4)
  {
    seasons = v4->_seasons;
    v4->_seasons = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (VUIPlistMediaDatabaseShow)initWithIdentifier:(id)a3
{
  return [(VUIPlistMediaDatabaseShow *)self initWithIdentifier:a3 type:4];
}

- (VUIPlistMediaDatabaseShow)initWithDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaDatabaseShow;
  v5 = [(VUIPlistMediaDatabaseEntity *)&v18 initWithDictionary:v4];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = objc_msgSend(v4, "vui_arrayForKey:", @"Seasons");
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [[VUIPlistMediaDatabaseSeason alloc] initWithDictionary:*(void *)(*((void *)&v14 + 1) + 8 * v11) show:v5];
          [v6 addObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }
    [(VUIPlistMediaDatabaseShow *)v5 setSeasons:v6];
  }
  return v5;
}

- (void)setSeasons:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = a3;
  id v6 = [v4 sortDescriptorWithKey:@"seasonNumber" ascending:1];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v5 sortedArrayUsingDescriptors:v7];

  seasons = self->_seasons;
  self->_seasons = v8;
}

- (id)seasonForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VUIPlistMediaDatabaseShow *)self seasons];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)isLocal
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(VUIPlistMediaDatabaseShow *)self seasons];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) isLocal];

        if (v6)
        {
          uint64_t v3 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  uint64_t v7 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  return v7;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)VUIPlistMediaDatabaseShow;
  uint64_t v3 = [(VUIPlistMediaDatabaseEntity *)&v17 dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(VUIPlistMediaDatabaseShow *)self seasons];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v8);
  }

  [v4 setObject:v5 forKey:@"Seasons"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseShow;
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_seasons copy];
  id v6 = (void *)v4[8];
  v4[8] = v5;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIPlistMediaDatabaseShow *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)VUIPlistMediaDatabaseShow;
    if ([(VUIPlistMediaDatabaseEntity *)&v14 isEqual:v6])
    {
      uint64_t v7 = [(VUIPlistMediaDatabaseShow *)self seasons];
      objc_super v8 = [(VUIPlistMediaDatabaseShow *)v6 seasons];
      id v9 = v7;
      id v10 = v8;
      long long v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIPlistMediaDatabaseShow;
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)&v12 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = [(VUIPlistMediaDatabaseShow *)self seasons];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"seasons", v6];
  [v3 addObject:v7];

  objc_super v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (NSArray)seasons
{
  return self->_seasons;
}

- (void).cxx_destruct
{
}

@end
@interface VUIPlistMediaDatabaseSeason
- (BOOL)isEqual:(id)a3;
- (NSArray)episodes;
- (NSNumber)seasonNumber;
- (VUIPlistMediaDatabaseSeason)initWithDictionary:(id)a3 show:(id)a4;
- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 show:(id)a4;
- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 type:(unint64_t)a4;
- (VUIPlistMediaDatabaseShow)show;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)episodeForIdentifier:(id)a3;
- (id)isLocal;
- (void)setEpisodes:(id)a3;
- (void)setSeasonNumber:(id)a3;
- (void)setShow:(id)a3;
@end

@implementation VUIPlistMediaDatabaseSeason

- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 type:(unint64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VUIPlistMediaDatabaseSeason;
  v4 = [(VUIPlistMediaDatabaseEntity *)&v8 initWithIdentifier:a3 type:a4];
  v5 = v4;
  if (v4)
  {
    episodes = v4->_episodes;
    v4->_episodes = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (VUIPlistMediaDatabaseSeason)initWithIdentifier:(id)a3 show:(id)a4
{
  id v6 = a4;
  v7 = [(VUIPlistMediaDatabaseSeason *)self initWithIdentifier:a3 type:5];
  objc_super v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_show, v6);
  }

  return v8;
}

- (VUIPlistMediaDatabaseSeason)initWithDictionary:(id)a3 show:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)VUIPlistMediaDatabaseSeason;
  objc_super v8 = [(VUIPlistMediaDatabaseEntity *)&v25 initWithDictionary:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_show, v7);
    v10 = objc_msgSend(v6, "vui_numberForKey:", @"SeasonNumber");
    uint64_t v11 = [v10 copy];
    seasonNumber = v9->_seasonNumber;
    v9->_seasonNumber = (NSNumber *)v11;

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v14 = objc_msgSend(v6, "vui_arrayForKey:", @"Episodes");
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[VUIPlistMediaDatabaseItem alloc] initWithDictionary:*(void *)(*((void *)&v21 + 1) + 8 * v18)];
          [(VUIPlistMediaDatabaseItem *)v19 setSeason:v9];
          [v13 addObject:v19];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }
    [(VUIPlistMediaDatabaseSeason *)v9 setEpisodes:v13];
  }
  return v9;
}

- (void)setEpisodes:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F29008];
  id v5 = a3;
  id v6 = [v4 sortDescriptorWithKey:@"episodeNumber" ascending:1];
  v10[0] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  objc_super v8 = [v5 sortedArrayUsingDescriptors:v7];

  episodes = self->_episodes;
  self->_episodes = v8;
}

- (id)episodeForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(VUIPlistMediaDatabaseSeason *)self episodes];
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 identifier];
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
  v2 = [(VUIPlistMediaDatabaseSeason *)self episodes];
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
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaDatabaseSeason;
  uint64_t v3 = [(VUIPlistMediaDatabaseEntity *)&v18 dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];
  id v5 = [(VUIPlistMediaDatabaseSeason *)self seasonNumber];
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v5, @"SeasonNumber");

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [(VUIPlistMediaDatabaseSeason *)self episodes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
        [v6 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }

  [v4 setObject:v6 forKey:@"Episodes"];
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)VUIPlistMediaDatabaseSeason;
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NSNumber *)self->_seasonNumber copy];
  id v6 = (void *)v4[9];
  v4[9] = v5;

  uint64_t v7 = [(NSArray *)self->_episodes copy];
  uint64_t v8 = (void *)v4[10];
  v4[10] = v7;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIPlistMediaDatabaseSeason *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        v18.receiver = self;
        v18.super_class = (Class)VUIPlistMediaDatabaseSeason;
        if (![(VUIPlistMediaDatabaseEntity *)&v18 isEqual:v6])
        {
LABEL_9:
          char v12 = 0;
LABEL_19:

          goto LABEL_20;
        }
        uint64_t v7 = [(VUIPlistMediaDatabaseSeason *)self seasonNumber];
        uint64_t v8 = [(VUIPlistMediaDatabaseSeason *)v6 seasonNumber];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          long long v11 = v10;
          char v12 = 0;
          if (!v9 || !v10)
          {
LABEL_18:

            goto LABEL_19;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_9;
          }
        }
        long long v14 = [(VUIPlistMediaDatabaseSeason *)self episodes];
        long long v15 = [(VUIPlistMediaDatabaseSeason *)v6 episodes];
        id v9 = v14;
        id v16 = v15;
        long long v11 = v16;
        if (v9 == v16)
        {
          char v12 = 1;
        }
        else
        {
          char v12 = 0;
          if (v9 && v16) {
            char v12 = [v9 isEqual:v16];
          }
        }
        goto LABEL_18;
      }
    }
    char v12 = 0;
  }
LABEL_20:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIPlistMediaDatabaseSeason;
  uint64_t v4 = [(VUIPlistMediaDatabaseEntity *)&v15 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  id v6 = [(VUIPlistMediaDatabaseSeason *)self seasonNumber];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"seasonNumber", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [(VUIPlistMediaDatabaseSeason *)self episodes];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"episodes", v9];
  [v3 addObject:v10];

  long long v11 = NSString;
  char v12 = [v3 componentsJoinedByString:@", "];
  char v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (VUIPlistMediaDatabaseShow)show
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_show);
  return (VUIPlistMediaDatabaseShow *)WeakRetained;
}

- (void)setShow:(id)a3
{
}

- (NSNumber)seasonNumber
{
  return self->_seasonNumber;
}

- (void)setSeasonNumber:(id)a3
{
}

- (NSArray)episodes
{
  return self->_episodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodes, 0);
  objc_storeStrong((id *)&self->_seasonNumber, 0);
  objc_destroyWeak((id *)&self->_show);
}

@end
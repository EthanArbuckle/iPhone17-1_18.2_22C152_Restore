@interface _SFPBPunchout
- (BOOL)forceOpenInBrowser;
- (BOOL)hasClip;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRunnableInBackground;
- (BOOL)readFrom:(id)a3;
- (NSArray)urls;
- (NSData)jsonData;
- (NSString)actionTarget;
- (NSString)bundleIdentifier;
- (NSString)label;
- (NSString)name;
- (_SFPBPunchout)initWithDictionary:(id)a3;
- (_SFPBPunchout)initWithFacade:(id)a3;
- (_SFPBPunchout)initWithJSON:(id)a3;
- (_SFPBUserActivityData)userActivityData;
- (id)dictionaryRepresentation;
- (id)urlsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)urlsCount;
- (void)addUrls:(id)a3;
- (void)clearUrls;
- (void)setActionTarget:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setForceOpenInBrowser:(BOOL)a3;
- (void)setHasClip:(BOOL)a3;
- (void)setIsRunnableInBackground:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setName:(id)a3;
- (void)setUrls:(id)a3;
- (void)setUserActivityData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPunchout

- (_SFPBPunchout)initWithFacade:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBPunchout *)self init];
  if (v5)
  {
    v6 = [v4 name];

    if (v6)
    {
      v7 = [v4 name];
      [(_SFPBPunchout *)v5 setName:v7];
    }
    v8 = [v4 bundleIdentifier];

    if (v8)
    {
      v9 = [v4 bundleIdentifier];
      [(_SFPBPunchout *)v5 setBundleIdentifier:v9];
    }
    v10 = [v4 label];

    if (v10)
    {
      v11 = [v4 label];
      [(_SFPBPunchout *)v5 setLabel:v11];
    }
    v12 = [v4 urls];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v14 = objc_msgSend(v4, "urls", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [[_SFPBURL alloc] initWithNSURL:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [(_SFPBPunchout *)v5 setUrls:v13];
    v20 = [v4 userActivityData];

    if (v20)
    {
      v21 = [_SFPBUserActivityData alloc];
      v22 = [v4 userActivityData];
      v23 = [(_SFPBUserActivityData *)v21 initWithFacade:v22];
      [(_SFPBPunchout *)v5 setUserActivityData:v23];
    }
    v24 = [v4 actionTarget];

    if (v24)
    {
      v25 = [v4 actionTarget];
      [(_SFPBPunchout *)v5 setActionTarget:v25];
    }
    if ([v4 hasIsRunnableInBackground]) {
      -[_SFPBPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", [v4 isRunnableInBackground]);
    }
    if ([v4 hasHasClip]) {
      -[_SFPBPunchout setHasClip:](v5, "setHasClip:", [v4 hasClip]);
    }
    if ([v4 hasForceOpenInBrowser]) {
      -[_SFPBPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", [v4 forceOpenInBrowser]);
    }
    v26 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTarget, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)forceOpenInBrowser
{
  return self->_forceOpenInBrowser;
}

- (BOOL)hasClip
{
  return self->_hasClip;
}

- (BOOL)isRunnableInBackground
{
  return self->_isRunnableInBackground;
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (_SFPBUserActivityData)userActivityData
{
  return self->_userActivityData;
}

- (NSArray)urls
{
  return self->_urls;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (_SFPBPunchout)initWithDictionary:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_SFPBPunchout;
  v5 = [(_SFPBPunchout *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBPunchout *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBPunchout *)v5 setBundleIdentifier:v9];
    }
    long long v30 = v8;
    v10 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBPunchout *)v5 setLabel:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"urls"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v29 = v6;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v32 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[_SFPBURL alloc] initWithDictionary:v18];
              [(_SFPBPunchout *)v5 addUrls:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v15);
      }

      v6 = v29;
    }
    v20 = [v4 objectForKeyedSubscript:@"userActivityData"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[_SFPBUserActivityData alloc] initWithDictionary:v20];
      [(_SFPBPunchout *)v5 setUserActivityData:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"actionTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = (void *)[v22 copy];
      [(_SFPBPunchout *)v5 setActionTarget:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"isRunnableInBackground"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"hasClip"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPunchout setHasClip:](v5, "setHasClip:", [v25 BOOLValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"forceOpenInBrowser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", [v26 BOOLValue]);
    }
    v27 = v5;
  }
  return v5;
}

- (_SFPBPunchout)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPunchout *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPunchout *)self dictionaryRepresentation];
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
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_actionTarget)
  {
    id v4 = [(_SFPBPunchout *)self actionTarget];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"actionTarget"];
  }
  if (self->_bundleIdentifier)
  {
    v6 = [(_SFPBPunchout *)self bundleIdentifier];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_forceOpenInBrowser)
  {
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPunchout forceOpenInBrowser](self, "forceOpenInBrowser"));
    [v3 setObject:v8 forKeyedSubscript:@"forceOpenInBrowser"];
  }
  if (self->_hasClip)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPunchout hasClip](self, "hasClip"));
    [v3 setObject:v9 forKeyedSubscript:@"hasClip"];
  }
  if (self->_isRunnableInBackground)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBPunchout isRunnableInBackground](self, "isRunnableInBackground"));
    [v3 setObject:v10 forKeyedSubscript:@"isRunnableInBackground"];
  }
  if (self->_label)
  {
    v11 = [(_SFPBPunchout *)self label];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"label"];
  }
  if (self->_name)
  {
    id v13 = [(_SFPBPunchout *)self name];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"name"];
  }
  if ([(NSArray *)self->_urls count])
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v16 = self->_urls;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (void)v27);
          if (v21)
          {
            [v15 addObject:v21];
          }
          else
          {
            v22 = [MEMORY[0x1E4F1CA98] null];
            [v15 addObject:v22];
          }
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"urls"];
  }
  if (self->_userActivityData)
  {
    v23 = [(_SFPBPunchout *)self userActivityData];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"userActivityData"];
    }
    else
    {
      v25 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v25 forKeyedSubscript:@"userActivityData"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_bundleIdentifier hash];
  NSUInteger v5 = [(NSString *)self->_label hash];
  uint64_t v6 = [(NSArray *)self->_urls hash];
  unint64_t v7 = [(_SFPBUserActivityData *)self->_userActivityData hash];
  NSUInteger v8 = [(NSString *)self->_actionTarget hash];
  uint64_t v9 = 2654435761;
  if (self->_isRunnableInBackground) {
    uint64_t v10 = 2654435761;
  }
  else {
    uint64_t v10 = 0;
  }
  if (self->_hasClip) {
    uint64_t v11 = 2654435761;
  }
  else {
    uint64_t v11 = 0;
  }
  if (!self->_forceOpenInBrowser) {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(_SFPBPunchout *)self name];
  uint64_t v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBPunchout *)self name];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(_SFPBPunchout *)self name];
    uint64_t v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPunchout *)self bundleIdentifier];
  uint64_t v6 = [v4 bundleIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBPunchout *)self bundleIdentifier];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBPunchout *)self bundleIdentifier];
    uint64_t v15 = [v4 bundleIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPunchout *)self label];
  uint64_t v6 = [v4 label];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBPunchout *)self label];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_SFPBPunchout *)self label];
    v20 = [v4 label];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPunchout *)self urls];
  uint64_t v6 = [v4 urls];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBPunchout *)self urls];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(_SFPBPunchout *)self urls];
    v25 = [v4 urls];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPunchout *)self userActivityData];
  uint64_t v6 = [v4 userActivityData];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBPunchout *)self userActivityData];
  if (v27)
  {
    long long v28 = (void *)v27;
    long long v29 = [(_SFPBPunchout *)self userActivityData];
    long long v30 = [v4 userActivityData];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPunchout *)self actionTarget];
  uint64_t v6 = [v4 actionTarget];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v32 = [(_SFPBPunchout *)self actionTarget];
  if (v32)
  {
    long long v33 = (void *)v32;
    long long v34 = [(_SFPBPunchout *)self actionTarget];
    objc_super v35 = [v4 actionTarget];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  int isRunnableInBackground = self->_isRunnableInBackground;
  if (isRunnableInBackground == [v4 isRunnableInBackground])
  {
    int hasClip = self->_hasClip;
    if (hasClip == [v4 hasClip])
    {
      int forceOpenInBrowser = self->_forceOpenInBrowser;
      BOOL v37 = forceOpenInBrowser == [v4 forceOpenInBrowser];
      goto LABEL_33;
    }
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBPunchout *)self name];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBPunchout *)self bundleIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBPunchout *)self label];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBPunchout *)self urls];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  id v13 = [(_SFPBPunchout *)self userActivityData];
  if (v13) {
    PBDataWriterWriteSubmessage();
  }

  uint64_t v14 = [(_SFPBPunchout *)self actionTarget];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBPunchout *)self isRunnableInBackground]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBPunchout *)self hasClip]) {
    PBDataWriterWriteBOOLField();
  }
  if ([(_SFPBPunchout *)self forceOpenInBrowser]) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPunchoutReadFrom(self, (uint64_t)a3);
}

- (void)setForceOpenInBrowser:(BOOL)a3
{
  self->_int forceOpenInBrowser = a3;
}

- (void)setHasClip:(BOOL)a3
{
  self->_int hasClip = a3;
}

- (void)setIsRunnableInBackground:(BOOL)a3
{
  self->_int isRunnableInBackground = a3;
}

- (void)setActionTarget:(id)a3
{
  self->_actionTarget = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setUserActivityData:(id)a3
{
}

- (id)urlsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_urls objectAtIndexedSubscript:a3];
}

- (unint64_t)urlsCount
{
  return [(NSArray *)self->_urls count];
}

- (void)addUrls:(id)a3
{
  id v4 = a3;
  urls = self->_urls;
  id v8 = v4;
  if (!urls)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_urls;
    self->_urls = v6;

    id v4 = v8;
    urls = self->_urls;
  }
  [(NSArray *)urls addObject:v4];
}

- (void)clearUrls
{
}

- (void)setUrls:(id)a3
{
  self->_urls = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setLabel:(id)a3
{
  self->_label = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setBundleIdentifier:(id)a3
{
  self->_bundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setName:(id)a3
{
  self->_name = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end
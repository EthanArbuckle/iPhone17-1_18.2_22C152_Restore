@interface NSSLocalesInfoRespMsg
+ (Class)defaultCalendarsType;
+ (Class)localeIdentifiersType;
+ (Class)numberingSystemsType;
+ (Class)supportedCalendarsType;
+ (Class)systemLanguagesType;
- (BOOL)hasBuildVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)defaultCalendars;
- (NSMutableArray)localeIdentifiers;
- (NSMutableArray)numberingSystems;
- (NSMutableArray)supportedCalendars;
- (NSMutableArray)systemLanguages;
- (NSString)buildVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultCalendarsAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localeIdentifiersAtIndex:(unint64_t)a3;
- (id)numberingSystemsAtIndex:(unint64_t)a3;
- (id)supportedCalendarsAtIndex:(unint64_t)a3;
- (id)systemLanguagesAtIndex:(unint64_t)a3;
- (unint64_t)defaultCalendarsCount;
- (unint64_t)hash;
- (unint64_t)localeIdentifiersCount;
- (unint64_t)numberingSystemsCount;
- (unint64_t)supportedCalendarsCount;
- (unint64_t)systemLanguagesCount;
- (void)addDefaultCalendars:(id)a3;
- (void)addLocaleIdentifiers:(id)a3;
- (void)addNumberingSystems:(id)a3;
- (void)addSupportedCalendars:(id)a3;
- (void)addSystemLanguages:(id)a3;
- (void)clearDefaultCalendars;
- (void)clearLocaleIdentifiers;
- (void)clearNumberingSystems;
- (void)clearSupportedCalendars;
- (void)clearSystemLanguages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDefaultCalendars:(id)a3;
- (void)setLocaleIdentifiers:(id)a3;
- (void)setNumberingSystems:(id)a3;
- (void)setSupportedCalendars:(id)a3;
- (void)setSystemLanguages:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLocalesInfoRespMsg

- (void)clearSystemLanguages
{
}

- (void)addSystemLanguages:(id)a3
{
  id v4 = a3;
  systemLanguages = self->_systemLanguages;
  id v8 = v4;
  if (!systemLanguages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_systemLanguages;
    self->_systemLanguages = v6;

    id v4 = v8;
    systemLanguages = self->_systemLanguages;
  }
  [(NSMutableArray *)systemLanguages addObject:v4];
}

- (unint64_t)systemLanguagesCount
{
  return [(NSMutableArray *)self->_systemLanguages count];
}

- (id)systemLanguagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_systemLanguages objectAtIndex:a3];
}

+ (Class)systemLanguagesType
{
  return (Class)objc_opt_class();
}

- (void)clearLocaleIdentifiers
{
}

- (void)addLocaleIdentifiers:(id)a3
{
  id v4 = a3;
  localeIdentifiers = self->_localeIdentifiers;
  id v8 = v4;
  if (!localeIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_localeIdentifiers;
    self->_localeIdentifiers = v6;

    id v4 = v8;
    localeIdentifiers = self->_localeIdentifiers;
  }
  [(NSMutableArray *)localeIdentifiers addObject:v4];
}

- (unint64_t)localeIdentifiersCount
{
  return [(NSMutableArray *)self->_localeIdentifiers count];
}

- (id)localeIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_localeIdentifiers objectAtIndex:a3];
}

+ (Class)localeIdentifiersType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)clearSupportedCalendars
{
}

- (void)addSupportedCalendars:(id)a3
{
  id v4 = a3;
  supportedCalendars = self->_supportedCalendars;
  id v8 = v4;
  if (!supportedCalendars)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_supportedCalendars;
    self->_supportedCalendars = v6;

    id v4 = v8;
    supportedCalendars = self->_supportedCalendars;
  }
  [(NSMutableArray *)supportedCalendars addObject:v4];
}

- (unint64_t)supportedCalendarsCount
{
  return [(NSMutableArray *)self->_supportedCalendars count];
}

- (id)supportedCalendarsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_supportedCalendars objectAtIndex:a3];
}

+ (Class)supportedCalendarsType
{
  return (Class)objc_opt_class();
}

- (void)clearDefaultCalendars
{
}

- (void)addDefaultCalendars:(id)a3
{
  id v4 = a3;
  defaultCalendars = self->_defaultCalendars;
  id v8 = v4;
  if (!defaultCalendars)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_defaultCalendars;
    self->_defaultCalendars = v6;

    id v4 = v8;
    defaultCalendars = self->_defaultCalendars;
  }
  [(NSMutableArray *)defaultCalendars addObject:v4];
}

- (unint64_t)defaultCalendarsCount
{
  return [(NSMutableArray *)self->_defaultCalendars count];
}

- (id)defaultCalendarsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_defaultCalendars objectAtIndex:a3];
}

+ (Class)defaultCalendarsType
{
  return (Class)objc_opt_class();
}

- (void)clearNumberingSystems
{
}

- (void)addNumberingSystems:(id)a3
{
  id v4 = a3;
  numberingSystems = self->_numberingSystems;
  id v8 = v4;
  if (!numberingSystems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_numberingSystems;
    self->_numberingSystems = v6;

    id v4 = v8;
    numberingSystems = self->_numberingSystems;
  }
  [(NSMutableArray *)numberingSystems addObject:v4];
}

- (unint64_t)numberingSystemsCount
{
  return [(NSMutableArray *)self->_numberingSystems count];
}

- (id)numberingSystemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_numberingSystems objectAtIndex:a3];
}

+ (Class)numberingSystemsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLocalesInfoRespMsg;
  id v4 = [(NSSLocalesInfoRespMsg *)&v8 description];
  v5 = [(NSSLocalesInfoRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  systemLanguages = self->_systemLanguages;
  if (systemLanguages) {
    [v3 setObject:systemLanguages forKey:@"systemLanguages"];
  }
  localeIdentifiers = self->_localeIdentifiers;
  if (localeIdentifiers) {
    [v4 setObject:localeIdentifiers forKey:@"localeIdentifiers"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  supportedCalendars = self->_supportedCalendars;
  if (supportedCalendars) {
    [v4 setObject:supportedCalendars forKey:@"supportedCalendars"];
  }
  if ([(NSMutableArray *)self->_defaultCalendars count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_defaultCalendars, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v10 = self->_defaultCalendars;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v28 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"defaultCalendars"];
  }
  if ([(NSMutableArray *)self->_numberingSystems count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_numberingSystems, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v17 = self->_numberingSystems;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "dictionaryRepresentation", (void)v24);
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    [v4 setObject:v16 forKey:@"numberingSystems"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLocalesInfoRespMsgReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v5 = self->_systemLanguages;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v10 = self->_localeIdentifiers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  if (self->_buildVersion) {
    PBDataWriterWriteStringField();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v15 = self->_supportedCalendars;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v20 = self->_defaultCalendars;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v25 = self->_numberingSystems;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (void)copyTo:(id)a3
{
  id v24 = a3;
  if ([(NSSLocalesInfoRespMsg *)self systemLanguagesCount])
  {
    [v24 clearSystemLanguages];
    unint64_t v4 = [(NSSLocalesInfoRespMsg *)self systemLanguagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NSSLocalesInfoRespMsg *)self systemLanguagesAtIndex:i];
        [v24 addSystemLanguages:v7];
      }
    }
  }
  if ([(NSSLocalesInfoRespMsg *)self localeIdentifiersCount])
  {
    [v24 clearLocaleIdentifiers];
    unint64_t v8 = [(NSSLocalesInfoRespMsg *)self localeIdentifiersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(NSSLocalesInfoRespMsg *)self localeIdentifiersAtIndex:j];
        [v24 addLocaleIdentifiers:v11];
      }
    }
  }
  if (self->_buildVersion) {
    objc_msgSend(v24, "setBuildVersion:");
  }
  if ([(NSSLocalesInfoRespMsg *)self supportedCalendarsCount])
  {
    [v24 clearSupportedCalendars];
    unint64_t v12 = [(NSSLocalesInfoRespMsg *)self supportedCalendarsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(NSSLocalesInfoRespMsg *)self supportedCalendarsAtIndex:k];
        [v24 addSupportedCalendars:v15];
      }
    }
  }
  if ([(NSSLocalesInfoRespMsg *)self defaultCalendarsCount])
  {
    [v24 clearDefaultCalendars];
    unint64_t v16 = [(NSSLocalesInfoRespMsg *)self defaultCalendarsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(NSSLocalesInfoRespMsg *)self defaultCalendarsAtIndex:m];
        [v24 addDefaultCalendars:v19];
      }
    }
  }
  if ([(NSSLocalesInfoRespMsg *)self numberingSystemsCount])
  {
    [v24 clearNumberingSystems];
    unint64_t v20 = [(NSSLocalesInfoRespMsg *)self numberingSystemsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(NSSLocalesInfoRespMsg *)self numberingSystemsAtIndex:n];
        [v24 addNumberingSystems:v23];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v6 = self->_systemLanguages;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v56;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v56 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addSystemLanguages:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v8);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  unint64_t v12 = self->_localeIdentifiers;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v52;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v52 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addLocaleIdentifiers:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [(NSString *)self->_buildVersion copyWithZone:a3];
  uint64_t v19 = (void *)v5[1];
  v5[1] = v18;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  unint64_t v20 = self->_supportedCalendars;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * v24) copyWithZone:a3];
        [v5 addSupportedCalendars:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v22);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v26 = self->_defaultCalendars;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * v30) copyWithZone:a3];
        [v5 addDefaultCalendars:v31];

        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v28);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v32 = self->_numberingSystems;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(v32);
        }
        long long v37 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * v36), "copyWithZone:", a3, (void)v39);
        [v5 addNumberingSystems:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v34);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((systemLanguages = self->_systemLanguages, !((unint64_t)systemLanguages | v4[6]))
     || -[NSMutableArray isEqual:](systemLanguages, "isEqual:"))
    && ((localeIdentifiers = self->_localeIdentifiers, !((unint64_t)localeIdentifiers | v4[3]))
     || -[NSMutableArray isEqual:](localeIdentifiers, "isEqual:"))
    && ((buildVersiouint64_t n = self->_buildVersion, !((unint64_t)buildVersion | v4[1]))
     || -[NSString isEqual:](buildVersion, "isEqual:"))
    && ((supportedCalendars = self->_supportedCalendars, !((unint64_t)supportedCalendars | v4[5]))
     || -[NSMutableArray isEqual:](supportedCalendars, "isEqual:"))
    && ((defaultCalendars = self->_defaultCalendars, !((unint64_t)defaultCalendars | v4[2]))
     || -[NSMutableArray isEqual:](defaultCalendars, "isEqual:")))
  {
    numberingSystems = self->_numberingSystems;
    if ((unint64_t)numberingSystems | v4[4]) {
      char v11 = -[NSMutableArray isEqual:](numberingSystems, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_systemLanguages hash];
  uint64_t v4 = [(NSMutableArray *)self->_localeIdentifiers hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_buildVersion hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_supportedCalendars hash];
  uint64_t v7 = [(NSMutableArray *)self->_defaultCalendars hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_numberingSystems hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v5 = v4[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NSSLocalesInfoRespMsg *)self addSystemLanguages:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = v4[3];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        [(NSSLocalesInfoRespMsg *)self addLocaleIdentifiers:*(void *)(*((void *)&v42 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }

  if (v4[1]) {
    -[NSSLocalesInfoRespMsg setBuildVersion:](self, "setBuildVersion:");
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = v4[5];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NSSLocalesInfoRespMsg *)self addSupportedCalendars:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v4[2];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        [(NSSLocalesInfoRespMsg *)self addDefaultCalendars:*(void *)(*((void *)&v34 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v4[4];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[NSSLocalesInfoRespMsg addNumberingSystems:](self, "addNumberingSystems:", *(void *)(*((void *)&v30 + 1) + 8 * n), (void)v30);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (NSMutableArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void)setSystemLanguages:(id)a3
{
}

- (NSMutableArray)localeIdentifiers
{
  return self->_localeIdentifiers;
}

- (void)setLocaleIdentifiers:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSMutableArray)supportedCalendars
{
  return self->_supportedCalendars;
}

- (void)setSupportedCalendars:(id)a3
{
}

- (NSMutableArray)defaultCalendars
{
  return self->_defaultCalendars;
}

- (void)setDefaultCalendars:(id)a3
{
}

- (NSMutableArray)numberingSystems
{
  return self->_numberingSystems;
}

- (void)setNumberingSystems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_supportedCalendars, 0);
  objc_storeStrong((id *)&self->_numberingSystems, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
  objc_storeStrong((id *)&self->_defaultCalendars, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
}

@end
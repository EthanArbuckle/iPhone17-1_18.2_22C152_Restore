@interface MOEventExtendedAttributes
+ (BOOL)supportsSecureCoding;
+ (id)lowerCaseArrayOfStrings:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOEventExtendedAttributes)initWithCoder:(id)a3;
- (MOEventExtendedAttributes)initWithLocalIdentifier:(id)a3;
- (MOEventExtendedAttributes)initWithMoment:(id)a3;
- (NSArray)momentPropertyOfAssets;
- (NSArray)photoMomentHolidays;
- (NSArray)photoMomentInferences;
- (NSArray)photoMomentPersons;
- (NSArray)photoMomentPublicEvents;
- (NSString)photoMomentLocalIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMomentPropertyOfAssets:(id)a3;
- (void)setPhotoMomentHolidays:(id)a3;
- (void)setPhotoMomentInferences:(id)a3;
- (void)setPhotoMomentLocalIdentifier:(id)a3;
- (void)setPhotoMomentPersons:(id)a3;
- (void)setPhotoMomentPublicEvents:(id)a3;
@end

@implementation MOEventExtendedAttributes

- (MOEventExtendedAttributes)initWithLocalIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MOEventExtendedAttributes initWithLocalIdentifier:](v6);
    }

    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MOEventExtendedAtrributes.m", 216, @"Invalid parameter not satisfying: localIdentifier (in %s:%d)", "-[MOEventExtendedAttributes initWithLocalIdentifier:]", 216);
  }
  v12.receiver = self;
  v12.super_class = (Class)MOEventExtendedAttributes;
  v8 = [(MOEventExtendedAttributes *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v5 copy];
    photoMomentLocalIdentifier = v8->_photoMomentLocalIdentifier;
    v8->_photoMomentLocalIdentifier = (NSString *)v9;
  }
  return v8;
}

+ (id)lowerCaseArrayOfStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "lowercaseString", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (MOEventExtendedAttributes)initWithMoment:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"localIdentifier"];
  uint64_t v6 = [(MOEventExtendedAttributes *)self initWithLocalIdentifier:v5];
  if (v6)
  {
    v42 = v5;
    uint64_t v7 = [v4 objectForKey:@"inferences"];
    uint64_t v8 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:v7];
    v41 = (void *)v7;
    if (v7)
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8 copyItems:1];
      photoMomentInferences = v6->_photoMomentInferences;
      v6->_photoMomentInferences = (NSArray *)v9;
    }
    v40 = (void *)v8;
    uint64_t v11 = [v4 objectForKey:@"holidays"];
    uint64_t v12 = +[MOEventExtendedAttributes lowerCaseArrayOfStrings:v11];
    v39 = (void *)v11;
    if (v11)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v12 copyItems:1];
      photoMomentHolidays = v6->_photoMomentHolidays;
      v6->_photoMomentHolidays = (NSArray *)v13;
    }
    v38 = (void *)v12;
    long long v15 = [v4 objectForKey:@"publicEvents"];
    if (v15)
    {
      v16 = objc_opt_new();
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      uint64_t v17 = v15;
      id v18 = v15;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v48 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[MOPublicEvent alloc] initWithEventDictionary:*(void *)(*((void *)&v47 + 1) + 8 * i)];
            [v16 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v20);
      }

      uint64_t v24 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v16 copyItems:1];
      photoMomentPublicEvents = v6->_photoMomentPublicEvents;
      v6->_photoMomentPublicEvents = (NSArray *)v24;

      long long v15 = v17;
    }
    v26 = [v4 objectForKey:@"persons"];
    if (v26)
    {
      v27 = objc_opt_new();
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v28 = v26;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v44 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = [[MOPerson alloc] initWithPersonDictionary:*(void *)(*((void *)&v43 + 1) + 8 * j)];
            v34 = v33;
            if (v33)
            {
              [(MOPerson *)v33 setSourceEventAccessType:3];
              [v27 addObject:v34];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v30);
      }

      uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v27 copyItems:1];
      photoMomentPersons = v6->_photoMomentPersons;
      v6->_photoMomentPersons = (NSArray *)v35;
    }
    id v5 = v42;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(MOEventExtendedAttributes *)self photoMomentLocalIdentifier];
  id v5 = [(MOEventExtendedAttributes *)self photoMomentInferences];
  uint64_t v6 = [(MOEventExtendedAttributes *)self photoMomentHolidays];
  uint64_t v7 = [(MOEventExtendedAttributes *)self photoMomentPublicEvents];
  uint64_t v8 = [v7 description];
  uint64_t v9 = [(MOEventExtendedAttributes *)self photoMomentPersons];
  v10 = [v9 description];
  uint64_t v11 = [(MOEventExtendedAttributes *)self momentPropertyOfAssets];
  uint64_t v12 = [v11 description];
  uint64_t v13 = [v3 stringWithFormat:@"<MOEventExtendedAttributes localIdentifier, %@, photoMomentInferences, %@, photoMomentHolidays, %@, photoMomentPublicEvents, %@, photoMomentPersons, %@, momentPropertyOfAssets, %@>", v4, v5, v6, v8, v10, v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventExtendedAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"photoMomentLocalIdentifier"];
  if (v5)
  {
    uint64_t v6 = [(MOEventExtendedAttributes *)self initWithLocalIdentifier:v5];
    if (v6)
    {
      uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"photoMomentInferences"];
      photoMomentInferences = v6->_photoMomentInferences;
      v6->_photoMomentInferences = (NSArray *)v10;

      uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = objc_opt_class();
      long long v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
      uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"photoMomentHolidays"];
      photoMomentHolidays = v6->_photoMomentHolidays;
      v6->_photoMomentHolidays = (NSArray *)v15;

      uint64_t v17 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
      uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"photoMomentPublicEvents"];
      photoMomentPublicEvents = v6->_photoMomentPublicEvents;
      v6->_photoMomentPublicEvents = (NSArray *)v20;

      v22 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
      uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"photoMomentPersons"];
      photoMomentPersons = v6->_photoMomentPersons;
      v6->_photoMomentPersons = (NSArray *)v25;

      v27 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
      uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"momentPropertyOfAssets"];
      momentPropertyOfAssets = v6->_momentPropertyOfAssets;
      v6->_momentPropertyOfAssets = (NSArray *)v30;
    }
    self = v6;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)encodeWithCoder:(id)a3
{
  photoMomentLocalIdentifier = self->_photoMomentLocalIdentifier;
  id v5 = a3;
  [v5 encodeObject:photoMomentLocalIdentifier forKey:@"photoMomentLocalIdentifier"];
  [v5 encodeObject:self->_photoMomentInferences forKey:@"photoMomentInferences"];
  [v5 encodeObject:self->_photoMomentHolidays forKey:@"photoMomentHolidays"];
  [v5 encodeObject:self->_photoMomentPublicEvents forKey:@"photoMomentPublicEvents"];
  [v5 encodeObject:self->_photoMomentPersons forKey:@"photoMomentPersons"];
  [v5 encodeObject:self->_momentPropertyOfAssets forKey:@"momentPropertyOfAssets"];
}

- (unint64_t)hash
{
  return [(NSString *)self->_photoMomentLocalIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (MOEventExtendedAttributes *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        uint64_t v8 = [(MOEventExtendedAttributes *)self photoMomentLocalIdentifier];
        if (v8
          || ([(MOEventExtendedAttributes *)v7 photoMomentLocalIdentifier],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v9 = [(MOEventExtendedAttributes *)self photoMomentLocalIdentifier];
          uint64_t v10 = [(MOEventExtendedAttributes *)v7 photoMomentLocalIdentifier];
          char v11 = [v9 isEqual:v10];

          if (v8)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          char v11 = 1;
        }

        goto LABEL_12;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (NSArray)photoMomentInferences
{
  return self->_photoMomentInferences;
}

- (void)setPhotoMomentInferences:(id)a3
{
}

- (NSString)photoMomentLocalIdentifier
{
  return self->_photoMomentLocalIdentifier;
}

- (void)setPhotoMomentLocalIdentifier:(id)a3
{
}

- (NSArray)photoMomentHolidays
{
  return self->_photoMomentHolidays;
}

- (void)setPhotoMomentHolidays:(id)a3
{
}

- (NSArray)photoMomentPublicEvents
{
  return self->_photoMomentPublicEvents;
}

- (void)setPhotoMomentPublicEvents:(id)a3
{
}

- (NSArray)photoMomentPersons
{
  return self->_photoMomentPersons;
}

- (void)setPhotoMomentPersons:(id)a3
{
}

- (NSArray)momentPropertyOfAssets
{
  return self->_momentPropertyOfAssets;
}

- (void)setMomentPropertyOfAssets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentPropertyOfAssets, 0);
  objc_storeStrong((id *)&self->_photoMomentPersons, 0);
  objc_storeStrong((id *)&self->_photoMomentPublicEvents, 0);
  objc_storeStrong((id *)&self->_photoMomentHolidays, 0);
  objc_storeStrong((id *)&self->_photoMomentLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_photoMomentInferences, 0);
}

- (void)initWithLocalIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  v2 = "-[MOEventExtendedAttributes initWithLocalIdentifier:]";
  __int16 v3 = 1024;
  int v4 = 216;
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: localIdentifier (in %s:%d)", (uint8_t *)&v1, 0x12u);
}

@end
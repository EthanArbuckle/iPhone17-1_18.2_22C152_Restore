@interface PKMapContainer
+ (BOOL)supportsSecureCoding;
- (NSMutableDictionary)recipientMap;
- (NSMutableDictionary)scoreMap;
- (PKMapContainer)init;
- (PKMapContainer)initWithCoder:(id)a3;
- (int64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)removeAllObjects;
- (void)updateWithContainer:(id)a3;
@end

@implementation PKMapContainer

- (PKMapContainer)init
{
  v9.receiver = self;
  v9.super_class = (Class)PKMapContainer;
  v2 = [(PKMapContainer *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    recipientMap = v3->_recipientMap;
    v3->_recipientMap = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    scoreMap = v3->_scoreMap;
    v3->_scoreMap = (NSMutableDictionary *)v6;
  }
  return v3;
}

- (PKMapContainer)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKMapContainer;
  v5 = [(PKMapContainer *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"version"];
    v5->_version = v6;
    if (v6 == 1)
    {
      v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"recipientMap"];
      recipientMap = v5->_recipientMap;
      v5->_recipientMap = (NSMutableDictionary *)v11;

      v13 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"scoreMap"];
      scoreMap = v5->_scoreMap;
      v5->_scoreMap = (NSMutableDictionary *)v17;
    }
    else
    {
      uint64_t v19 = v6;
      v10 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v27 = v19;
        __int16 v28 = 2048;
        uint64_t v29 = 1;
        _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Archive version (%li) does not match current version (%li). Ignoring map values.", buf, 0x16u);
      }
    }

    if (!v5->_recipientMap)
    {
      uint64_t v20 = [MEMORY[0x1E4F1CA60] dictionary];
      v21 = v5->_recipientMap;
      v5->_recipientMap = (NSMutableDictionary *)v20;
    }
    if (!v5->_scoreMap)
    {
      uint64_t v22 = [MEMORY[0x1E4F1CA60] dictionary];
      v23 = v5->_scoreMap;
      v5->_scoreMap = (NSMutableDictionary *)v22;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:1 forKey:@"version"];
  [v4 encodeObject:self->_recipientMap forKey:@"recipientMap"];
  [v4 encodeObject:self->_scoreMap forKey:@"scoreMap"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)updateWithContainer:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 version] == 1)
  {
    v5 = [v4 recipientMap];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v6 = [v5 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
    id v40 = v4;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * i);
          v13 = -[NSObject objectForKey:](v5, "objectForKey:", v12, v40);
          if ([v13 hasExpired])
          {
            [v5 removeObjectForKey:v12];
          }
          else
          {
            uint64_t v14 = [(NSMutableDictionary *)self->_recipientMap objectForKey:v12];
            uint64_t v15 = v14;
            if (v14 && [v14 isNewerThan:v13]) {
              [v5 removeObjectForKey:v12];
            }
            else {
              ++v9;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v8);

      id v4 = v40;
      if (!v9)
      {
LABEL_27:
        v23 = objc_msgSend(v4, "scoreMap", v40);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v24 = [v23 allKeys];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v42 = 0;
          uint64_t v27 = *(void *)v48;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v48 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void *)(*((void *)&v47 + 1) + 8 * j);
              uint64_t v30 = [v23 objectForKey:v29];
              if ([v30 hasExpired])
              {
                [v23 removeObjectForKey:v29];
              }
              else
              {
                v31 = [(NSMutableDictionary *)self->_scoreMap objectForKey:v29];
                v32 = v31;
                if (v31 && [v31 isNewerThan:v30]) {
                  [v23 removeObjectForKey:v29];
                }
                else {
                  ++v42;
                }
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v47 objects:v60 count:16];
          }
          while (v26);

          id v4 = v41;
          if (!v42) {
            goto LABEL_52;
          }
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v33 = [v23 allKeys];
          uint64_t v34 = [v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
          if (v34)
          {
            uint64_t v35 = v34;
            uint64_t v36 = *(void *)v44;
            do
            {
              for (uint64_t k = 0; k != v35; ++k)
              {
                if (*(void *)v44 != v36) {
                  objc_enumerationMutation(v33);
                }
                uint64_t v38 = *(void *)(*((void *)&v43 + 1) + 8 * k);
                v39 = [v23 objectForKey:v38];
                [(NSMutableDictionary *)self->_scoreMap setObject:v39 forKey:v38];
              }
              uint64_t v35 = [v33 countByEnumeratingWithState:&v43 objects:v59 count:16];
            }
            while (v35);
          }

          v24 = PKLogFacilityTypeGetObject(0xBuLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v64 = v42;
            _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Loaded %lu new cached score submission dates.", buf, 0xCu);
          }
        }

LABEL_52:
        goto LABEL_55;
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v16 = [v5 allKeys];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v18; ++m)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v51 + 1) + 8 * m);
            uint64_t v22 = [v5 objectForKey:v21];
            [(NSMutableDictionary *)self->_recipientMap setObject:v22 forKey:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v61 count:16];
        }
        while (v18);
      }

      uint64_t v6 = PKLogFacilityTypeGetObject(0xBuLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v64 = v9;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Loaded %lu new cached recipients.", buf, 0xCu);
      }
    }

    goto LABEL_27;
  }
  v5 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v64 = [v4 version];
    __int16 v65 = 2048;
    uint64_t v66 = 1;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Refusing to update map container with container (version %li) that does not match current version (%li).", buf, 0x16u);
  }
LABEL_55:
}

- (void)removeAllObjects
{
  [(NSMutableDictionary *)self->_recipientMap removeAllObjects];
  scoreMap = self->_scoreMap;
  [(NSMutableDictionary *)scoreMap removeAllObjects];
}

- (NSMutableDictionary)recipientMap
{
  return self->_recipientMap;
}

- (NSMutableDictionary)scoreMap
{
  return self->_scoreMap;
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreMap, 0);
  objc_storeStrong((id *)&self->_recipientMap, 0);
}

@end
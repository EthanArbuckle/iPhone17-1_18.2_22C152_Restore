@interface UserDefaultsDomain
- (NSMutableDictionary)keyArrays;
- (NSMutableDictionary)keyPrefixArrays;
- (NSString)domain;
- (id)description;
- (void)log;
- (void)setDomain:(id)a3;
- (void)setKeyArrays:(id)a3;
- (void)setKeyPrefixArrays:(id)a3;
@end

@implementation UserDefaultsDomain

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p domain = \"%@\" _keys = \"%@\"", v4, self, self->_domain, self->_keyArrays];

  return v5;
}

- (void)log
{
  v3 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG)) {
    sub_100028F14(v3);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = self->_keyArrays;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v8);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_keyArrays, "objectForKeyedSubscript:", v9, 0);
        id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            v14 = 0;
            do
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) log];
              v14 = (char *)v14 + 1;
            }
            while (v12 != v14);
            id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSMutableDictionary)keyArrays
{
  return self->_keyArrays;
}

- (void)setKeyArrays:(id)a3
{
}

- (NSMutableDictionary)keyPrefixArrays
{
  return self->_keyPrefixArrays;
}

- (void)setKeyPrefixArrays:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPrefixArrays, 0);
  objc_storeStrong((id *)&self->_keyArrays, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
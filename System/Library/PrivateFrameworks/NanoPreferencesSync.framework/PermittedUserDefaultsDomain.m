@interface PermittedUserDefaultsDomain
- (NSMutableDictionary)keyPrefixes;
- (NSMutableDictionary)keys;
- (NSString)domain;
- (id)description;
- (void)log;
- (void)setDomain:(id)a3;
- (void)setKeyPrefixes:(id)a3;
- (void)setKeys:(id)a3;
@end

@implementation PermittedUserDefaultsDomain

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p domain = \"%@\" _keys = \"%@\"", v4, self, self->_domain, self->_keys];

  return v5;
}

- (void)log
{
  v3 = (void *)nps_daemon_log;
  if (os_log_type_enabled(nps_daemon_log, OS_LOG_TYPE_DEBUG)) {
    sub_100028F14(v3);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = self->_keys;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), (void)v10);
        [v9 log];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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

- (NSMutableDictionary)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (NSMutableDictionary)keyPrefixes
{
  return self->_keyPrefixes;
}

- (void)setKeyPrefixes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPrefixes, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
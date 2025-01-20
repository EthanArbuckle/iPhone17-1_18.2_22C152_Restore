@interface SWCDomainCache
- (BOOL)isValid;
- (id)_entriesForDomain:(id)a3;
- (id)_entriesForDomain:(id)a3 operationMode:(char)a4;
- (id)_entriesFromDomain:(id)a3;
- (id)entriesForDomain:(id)a3;
- (void)clear;
- (void)updateCachedDomainsForEntries:(id)a3;
@end

@implementation SWCDomainCache

- (void)updateCachedDomainsForEntries:(id)a3
{
  id v4 = a3;
  v5 = +[_SWCPrefs sharedPrefs];
  unsigned int v6 = [v5 isFastCheckEnabled];

  if (v6)
  {
    if (!self->_cachedEntries)
    {
      v7 = +[NSMutableDictionary dictionary];
      cachedEntries = self->_cachedEntries;
      self->_cachedEntries = v7;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v22 = v4;
    id obj = v4;
    id v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v14 = [v13 domain];
          if ([v14 modeOfOperation]) {
            self->_hasDeveloperModeDomains = 1;
          }
          if (([v14 modeOfOperation] & 2) != 0) {
            self->_hasManagedModeDomains = 1;
          }
          v15 = [(SWCDomainCache *)self _entriesFromDomain:v14];
          v16 = v15;
          if (v15)
          {
            id v17 = [v15 mutableCopy];
            [v17 addObject:v13];
            [(NSMutableDictionary *)self->_cachedEntries setObject:v17 forKeyedSubscript:v14];
          }
          else
          {
            [(NSMutableDictionary *)self->_cachedEntries setObject:v13 forKeyedSubscript:v14];
          }
          if ([v14 isWildcard])
          {
            v18 = [v14 nonWildcardDomain];
            v19 = [(SWCDomainCache *)self _entriesFromDomain:v18];
            v20 = v19;
            if (v19)
            {
              id v21 = [v19 mutableCopy];
              [v21 addObject:v13];
              [(NSMutableDictionary *)self->_cachedEntries setObject:v21 forKeyedSubscript:v18];
            }
            else
            {
              [(NSMutableDictionary *)self->_cachedEntries setObject:v13 forKeyedSubscript:v18];
            }
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    id v4 = v22;
  }
}

- (id)entriesForDomain:(id)a3
{
  id v4 = a3;
  v5 = [(SWCDomainCache *)self _entriesForDomain:v4 operationMode:0];
  unsigned int v6 = v5;
  if (*(_WORD *)&self->_hasDeveloperModeDomains)
  {
    if (v5) {
      id v7 = [v5 mutableCopy];
    }
    else {
      id v7 = objc_alloc_init((Class)NSMutableOrderedSet);
    }
    id v11 = v7;
    if (self->_hasDeveloperModeDomains)
    {
      v8 = [(SWCDomainCache *)self _entriesForDomain:v4 operationMode:1];
      [v11 unionOrderedSet:v8];
      if (self->_hasManagedModeDomains)
      {
        id v9 = [(SWCDomainCache *)self _entriesForDomain:v4 operationMode:3];
        [v11 unionOrderedSet:v9];
      }
    }
    if (self->_hasManagedModeDomains)
    {
      id v10 = [(SWCDomainCache *)self _entriesForDomain:v4 operationMode:2];
      [v11 unionOrderedSet:v10];
    }
  }
  else
  {
    id v11 = v5;
  }

  return v11;
}

- (id)_entriesForDomain:(id)a3
{
  id v4 = a3;
  v5 = [(SWCDomainCache *)self _entriesFromDomain:v4];
  if (v5 || ![v4 isWildcard])
  {
    unsigned int v6 = [v4 host];
    v8 = [v6 componentsSeparatedByString:@"."];
    if ((unint64_t)[v8 count] >= 3)
    {
      id v22 = v6;
      if ([v8 count] == (id)2)
      {
LABEL_13:
        id v7 = v5;
        unsigned int v6 = v22;
      }
      else
      {
        id v9 = 0;
        while (1)
        {
          ++v9;
          id v10 = &stru_100035ED8;
          if (v9 < (char *)[v8 count] - 1)
          {
            id v11 = v9;
            v12 = &stru_100035ED8;
            do
            {
              v13 = [v8 objectAtIndexedSubscript:v11];
              id v10 = [(__CFString *)v12 stringByAppendingFormat:@"%@.", v13];

              ++v11;
              v12 = v10;
            }
            while (v11 < (char *)[v8 count] - 1);
          }
          v14 = [v8 objectAtIndexedSubscript:[v8 count] - 1];
          v15 = [(__CFString *)v10 stringByAppendingFormat:@"%@", v14];

          id v16 = objc_alloc((Class)_SWCDomain);
          id v17 = [v4 port];
          id v18 = [v16 initWithHost:v15 port:v17 wildcard:1 modeOfOperation:[v4 modeOfOperation]];

          v19 = [(SWCDomainCache *)self _entriesFromDomain:v18];
          if (v19) {
            break;
          }

          if (v9 >= (char *)[v8 count] - 2) {
            goto LABEL_13;
          }
        }
        v20 = v19;
        if (v5)
        {
          id v7 = [v5 mutableCopy];
          [v7 unionOrderedSet:v20];
        }
        else
        {
          id v7 = v19;
        }
        unsigned int v6 = v22;
      }
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    unsigned int v6 = [v4 nonWildcardDomain];
    id v7 = [(SWCDomainCache *)self _entriesFromDomain:v6];
  }

  return v7;
}

- (id)_entriesForDomain:(id)a3 operationMode:(char)a4
{
  if (a4)
  {
    v5 = [a3 domainRequiringModeOfOperation:a4];
    unsigned int v6 = [(SWCDomainCache *)self _entriesForDomain:v5];
  }
  else
  {
    unsigned int v6 = [(SWCDomainCache *)self _entriesForDomain:a3];
  }

  return v6;
}

- (void)clear
{
  self->_cachedEntries = 0;
  _objc_release_x1();
}

- (BOOL)isValid
{
  return [(NSMutableDictionary *)self->_cachedEntries count] != 0;
}

- (id)_entriesFromDomain:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_cachedEntries objectForKeyedSubscript:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[NSOrderedSet orderedSetWithObject:v3];
LABEL_5:
    v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_5;
  }
  v5 = 0;
LABEL_7:

  return v5;
}

- (void).cxx_destruct
{
}

@end
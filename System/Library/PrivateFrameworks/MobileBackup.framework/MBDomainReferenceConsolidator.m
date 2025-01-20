@interface MBDomainReferenceConsolidator
- (BOOL)addDomainReference:(id)a3 error:(id *)a4;
- (BOOL)consolidateDomainName:(id)a3 hmacKey:(id)a4;
- (MBDomainReferenceConsolidator)init;
- (NSMutableDictionary)domainNamesByHmac;
- (NSMutableDictionary)domainReferencesByHmac;
- (NSMutableSet)domainHmacsWithUnknownDomainName;
- (void)enumerateConsolidatedDomainNamesAndReference:(id)a3;
- (void)enumerateReferencesWithUnknownDomainName:(id)a3;
- (void)setDomainHmacsWithUnknownDomainName:(id)a3;
- (void)setDomainNamesByHmac:(id)a3;
- (void)setDomainReferencesByHmac:(id)a3;
@end

@implementation MBDomainReferenceConsolidator

- (MBDomainReferenceConsolidator)init
{
  v10.receiver = self;
  v10.super_class = (Class)MBDomainReferenceConsolidator;
  v2 = [(MBDomainReferenceConsolidator *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    domainReferencesByHmac = v2->_domainReferencesByHmac;
    v2->_domainReferencesByHmac = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    domainNamesByHmac = v2->_domainNamesByHmac;
    v2->_domainNamesByHmac = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    domainHmacsWithUnknownDomainName = v2->_domainHmacsWithUnknownDomainName;
    v2->_domainHmacsWithUnknownDomainName = (NSMutableSet *)v7;
  }
  return v2;
}

- (BOOL)addDomainReference:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 baseRecordID];
  v8 = +[MBDomainRecord domainHmacFromBaseRecordID:v7];

  v9 = [(NSMutableDictionary *)self->_domainReferencesByHmac objectForKeyedSubscript:v8];
  objc_super v10 = v9;
  if (!v9)
  {
    [(NSMutableDictionary *)self->_domainReferencesByHmac setObject:v6 forKeyedSubscript:v8];
    [(NSMutableSet *)self->_domainHmacsWithUnknownDomainName addObject:v8];
    goto LABEL_8;
  }
  if ([v9 isEqualToReference:v6])
  {
LABEL_8:
    BOOL v12 = 1;
    goto LABEL_9;
  }
  v11 = MBGetDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Inconsistent baseRecordIDs %@ != %@", buf, 0x16u);
    _MBLog();
  }

  if (a4)
  {
    +[MBError errorWithCode:205, @"Inconsistent baseRecordIDs %@ != %@", v10, v6 format];
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_9:

  return v12;
}

- (BOOL)consolidateDomainName:(id)a3 hmacKey:(id)a4
{
  id v6 = a3;
  uint64_t v7 = +[MBDomainRecord domainHmacForDomainName:v6 hmacKey:a4];
  v8 = [(NSMutableDictionary *)self->_domainReferencesByHmac objectForKeyedSubscript:v7];

  if (v8)
  {
    [(NSMutableDictionary *)self->_domainNamesByHmac setObject:v6 forKeyedSubscript:v7];
    [(NSMutableSet *)self->_domainHmacsWithUnknownDomainName removeObject:v7];
  }

  return v8 != 0;
}

- (void)enumerateReferencesWithUnknownDomainName:(id)a3
{
  v4 = (uint64_t (**)(id, uint64_t))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_domainHmacsWithUnknownDomainName;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_domainReferencesByHmac, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v9), (void)v13);
      if (!v10) {
        __assert_rtn("-[MBDomainReferenceConsolidator enumerateReferencesWithUnknownDomainName:]", "MBDomainReferenceConsolidator.m", 61, "reference");
      }
      v11 = (void *)v10;
      int v12 = v4[2](v4, v10);

      if (!v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)enumerateConsolidatedDomainNamesAndReference:(id)a3
{
  id v4 = a3;
  domainNamesByHmac = self->_domainNamesByHmac;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10014148C;
  v7[3] = &unk_1004145B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)domainNamesByHmac enumerateKeysAndObjectsUsingBlock:v7];
}

- (NSMutableDictionary)domainReferencesByHmac
{
  return self->_domainReferencesByHmac;
}

- (void)setDomainReferencesByHmac:(id)a3
{
}

- (NSMutableDictionary)domainNamesByHmac
{
  return self->_domainNamesByHmac;
}

- (void)setDomainNamesByHmac:(id)a3
{
}

- (NSMutableSet)domainHmacsWithUnknownDomainName
{
  return self->_domainHmacsWithUnknownDomainName;
}

- (void)setDomainHmacsWithUnknownDomainName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainHmacsWithUnknownDomainName, 0);
  objc_storeStrong((id *)&self->_domainNamesByHmac, 0);
  objc_storeStrong((id *)&self->_domainReferencesByHmac, 0);
}

@end
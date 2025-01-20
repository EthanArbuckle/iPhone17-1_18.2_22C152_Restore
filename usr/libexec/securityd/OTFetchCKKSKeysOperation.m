@interface OTFetchCKKSKeysOperation
- (BOOL)fetchBeforeGettingKeyset;
- (CKKSKeychainView)ckks;
- (NSArray)incompleteKeySets;
- (NSArray)pendingTLKShares;
- (NSArray)viewKeySets;
- (NSSet)viewFilter;
- (NSSet)zonesTimedOutWithoutKeysets;
- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 refetchNeeded:(BOOL)a4;
- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 viewsToFetch:(id)a4;
- (unint64_t)desiredTimeout;
- (void)groupStart;
- (void)setCkks:(id)a3;
- (void)setDesiredTimeout:(unint64_t)a3;
- (void)setFetchBeforeGettingKeyset:(BOOL)a3;
- (void)setIncompleteKeySets:(id)a3;
- (void)setPendingTLKShares:(id)a3;
- (void)setViewFilter:(id)a3;
- (void)setViewKeySets:(id)a3;
- (void)setZonesTimedOutWithoutKeysets:(id)a3;
@end

@implementation OTFetchCKKSKeysOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_ckks + 6), 0);
  objc_storeStrong((id *)((char *)&self->_desiredTimeout + 6), 0);
  objc_storeStrong((id *)((char *)&self->_pendingTLKShares + 6), 0);
  objc_storeStrong((id *)((char *)&self->_incompleteKeySets + 6), 0);
  objc_storeStrong((id *)((char *)&self->_viewKeySets + 6), 0);

  objc_storeStrong((id *)(&self->_fetchBeforeGettingKeyset + 6), 0);
}

- (void)setFetchBeforeGettingKeyset:(BOOL)a3
{
  self->_fetchBeforeGettingKeyset = a3;
}

- (BOOL)fetchBeforeGettingKeyset
{
  return self->_fetchBeforeGettingKeyset;
}

- (void)setViewFilter:(id)a3
{
}

- (NSSet)viewFilter
{
  return (NSSet *)objc_getProperty(self, a2, 182, 1);
}

- (void)setCkks:(id)a3
{
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 174, 1);
}

- (void)setDesiredTimeout:(unint64_t)a3
{
  *(NSSet **)((char *)&self->_zonesTimedOutWithoutKeysets + 6) = (NSSet *)a3;
}

- (unint64_t)desiredTimeout
{
  return *(unint64_t *)((char *)&self->_zonesTimedOutWithoutKeysets + 6);
}

- (void)setZonesTimedOutWithoutKeysets:(id)a3
{
}

- (NSSet)zonesTimedOutWithoutKeysets
{
  return (NSSet *)objc_getProperty(self, a2, 158, 1);
}

- (void)setPendingTLKShares:(id)a3
{
}

- (NSArray)pendingTLKShares
{
  return (NSArray *)objc_getProperty(self, a2, 150, 1);
}

- (void)setIncompleteKeySets:(id)a3
{
}

- (NSArray)incompleteKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 142, 1);
}

- (void)setViewKeySets:(id)a3
{
}

- (NSArray)viewKeySets
{
  return (NSArray *)objc_getProperty(self, a2, 134, 1);
}

- (void)groupStart
{
  v3 = +[NSMutableArray array];
  v4 = [(OTFetchCKKSKeysOperation *)self ckks];

  if (v4)
  {
    v5 = sub_10000B070("octagon-ckks");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(OTFetchCKKSKeysOperation *)self ckks];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for %@", buf, 0xCu);
    }
    v7 = [(OTFetchCKKSKeysOperation *)self ckks];
    v8 = [v7 findKeySets:-[OTFetchCKKSKeysOperation fetchBeforeGettingKeyset](self, "fetchBeforeGettingKeyset")];
    v9 = [v8 timeout:-[OTFetchCKKSKeysOperation desiredTimeout](self, "desiredTimeout")];
    [v3 addObject:v9];
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003F700;
  v20[3] = &unk_100306AD0;
  objc_copyWeak(&v22, (id *)buf);
  id v10 = v3;
  id v21 = v10;
  v11 = +[CKKSResultOperation named:@"proceed-with-ckks-keys" withBlock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        [v11 addDependency:*(void *)(*((void *)&v16 + 1) + 8 * (void)v15) :v16];
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }
    while (v13);
  }

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v11];
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 viewsToFetch:(id)a4
{
  id v7 = a4;
  v8 = [(OTFetchCKKSKeysOperation *)self initWithDependencies:a3 refetchNeeded:0];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)((char *)&v8->_ckks + 6), a4);
  }

  return v9;
}

- (OTFetchCKKSKeysOperation)initWithDependencies:(id)a3 refetchNeeded:(BOOL)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)OTFetchCKKSKeysOperation;
  id v7 = [(CKKSGroupOperation *)&v17 init];
  if (v7)
  {
    uint64_t v8 = [v6 ckks];
    v9 = *(void **)(v7 + 174);
    *(void *)(v7 + 174) = v8;

    id v10 = *(void **)(v7 + 182);
    *(void *)(v7 + 182) = 0;

    v11 = *(void **)(v7 + 134);
    *(void *)(v7 + 134) = &__NSArray0__struct;

    id v12 = *(void **)(v7 + 150);
    *(void *)(v7 + 150) = &__NSArray0__struct;

    id v13 = *(void **)(v7 + 142);
    *(void *)(v7 + 142) = &__NSArray0__struct;

    *(void *)(v7 + 166) = 15000000000;
    v7[128] = a4;
    uint64_t v14 = +[NSSet set];
    v15 = *(void **)(v7 + 158);
    *(void *)(v7 + 158) = v14;
  }
  return (OTFetchCKKSKeysOperation *)v7;
}

@end
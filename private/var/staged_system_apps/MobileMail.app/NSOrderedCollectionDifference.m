@interface NSOrderedCollectionDifference
- (id)mf_groupedInsertionsForCollection:(id)a3;
@end

@implementation NSOrderedCollectionDifference

- (id)mf_groupedInsertionsForCollection:(id)a3
{
  id v18 = a3;
  v4 = [(NSOrderedCollectionDifference *)self insertions];
  id v5 = [v4 count];

  if (!v5)
  {
    id v15 = &__NSArray0__struct;
    goto LABEL_18;
  }
  v6 = +[NSMutableArray array];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100034B38;
  v23[3] = &unk_10060DC58;
  id v24 = v18;
  id v17 = v6;
  id v25 = v17;
  v7 = objc_retainBlock(v23);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(NSOrderedCollectionDifference *)self insertions];
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
  uint64_t v10 = 0;
  if (!v9)
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_17;
  }
  uint64_t v11 = *(void *)v20;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v8);
      }
      v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = (uint64_t)[*(id *)(*((void *)&v19 + 1) + 8 * i) index];
LABEL_10:
        ++v10;
        continue;
      }
      if (objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "index", v17) == (id)(v12 + v10)) {
        goto LABEL_10;
      }
      ((void (*)(void *, uint64_t, uint64_t))v7[2])(v7, v12, v10);
      uint64_t v12 = (uint64_t)[v14 index];
      uint64_t v10 = 1;
    }
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v26 count:16];
  }
  while (v9);
LABEL_17:

  ((void (*)(void *, uint64_t, uint64_t))v7[2])(v7, v12, v10);
  id v15 = v17;

LABEL_18:

  return v15;
}

@end
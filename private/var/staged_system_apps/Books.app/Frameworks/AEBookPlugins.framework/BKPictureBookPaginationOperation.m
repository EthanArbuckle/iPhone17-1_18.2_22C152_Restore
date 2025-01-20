@interface BKPictureBookPaginationOperation
- (BOOL)_needsFullReparseForRecordedChapterPageCountForDocumentInfos:(id)a3 context:(id)a4;
- (id)copyDocumentArray:(id)a3;
- (id)copyNavigationInfos:(id)a3;
- (id)unpaginatedAnnotations;
- (unint64_t)countPaginatedChapters:(id)a3;
- (unint64_t)countPaginatedDocuments:(id)a3;
- (void)_clearAllChapterPageCountEntities:(id)a3;
- (void)execute;
- (void)recordAnnotationPageNumbers:(id)a3;
- (void)recordDocumentPageCountForDocumentInfos:(id)a3 context:(id)a4;
@end

@implementation BKPictureBookPaginationOperation

- (id)copyDocumentArray:(id)a3
{
  id v4 = a3;
  v5 = [(BKPictureBookPaginationOperation *)self batchJob];
  v6 = [v5 bookDatabaseKey];
  v7 = +[AEBookInfo linearDocumentPredicateForDatabaseKey:v6];

  v8 = +[NSArray arrayWithObjects:@"href", @"documentOrdinal", 0];
  id v9 = [v4 copyEntityPropertiesArray:v8 fromEntityName:@"BKDocument" withPredicate:v7 sortBy:@"documentOrdinal" ascending:1];

  return v9;
}

- (unint64_t)countPaginatedDocuments:(id)a3
{
  id v4 = a3;
  v5 = [(BKPictureBookPaginationOperation *)self batchJob];
  v6 = [v5 lookupKey];
  v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v6];

  id v8 = [v4 countEntity:@"BKDocumentPageCount" withPredicate:v7];
  return (unint64_t)v8;
}

- (void)recordDocumentPageCountForDocumentInfos:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v26 = a4;
  unint64_t v7 = -[BKPictureBookPaginationOperation countPaginatedDocuments:](self, "countPaginatedDocuments:");
  if (v7 < (unint64_t)[v6 count])
  {
    id v25 = [objc_alloc((Class)NSNumber) initWithInt:1];
    id v8 = [(BKPaginationOperation *)self paginationOperationController];
    v24 = [v8 paginationRevision];

    id v9 = [(BKPictureBookPaginationOperation *)self batchJob];
    v10 = [v9 bookDatabaseKey];

    v11 = [(BKPictureBookPaginationOperation *)self batchJob];
    v12 = [v11 lookupKey];

    id v22 = v6;
    [v6 subarrayWithRange:v7, (char *)[v6 count] - v7];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v28;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * v16);
        if ([(BKPictureBookPaginationOperation *)self isCancelled]) {
          break;
        }
        v18 = [v17 valueForKey:@"documentOrdinal"];
        id v19 = [objc_alloc((Class)NSNumber) initWithInt:[v18 intValue] + 1];
        id v20 = +[BKDocumentPageCount newEmptyDocumentPageCount:v26];
        [v20 setDocumentOrdinal:v18];
        v21 = [v17 valueForKey:@"href"];
        [v20 setHref:v21];

        [v20 setLookupKey:v12];
        [v20 setPageCount:v25];
        [v20 setPageNumber:v19];
        [v20 setBookDatabaseKey:v10];
        [v20 setPaginationRevision:v24];

        if (v14 == (id)++v16)
        {
          id v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v6 = v22;
  }
}

- (id)unpaginatedAnnotations
{
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_8DA48;
  v31 = sub_8DA58;
  id v32 = 0;
  v3 = [(BKPictureBookPaginationOperation *)self batchJob];
  id v4 = [v3 bookDatabaseKey];
  v5 = +[AEAnnotation predicateForUserAnnotationsWithAssetID:v4 includingDeleted:0];

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_8DA60;
  v20[3] = &unk_1DCCC8;
  id v22 = &v23;
  id v6 = v5;
  id v21 = v6;
  [(BKPaginationOperation *)self performBackgroundAnnotationsBlockAndWait:v20];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_8DA48;
  v18 = sub_8DA58;
  id v19 = 0;
  if (v24[3])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_8DAA0;
    v13[3] = &unk_1DCCF0;
    v13[4] = self;
    v13[5] = &v23;
    v13[6] = &v14;
    [(BKPaginationOperation *)self performBlockAndWait:v13];
    if (v15[5])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_8DC00;
      v9[3] = &unk_1DCD18;
      v11 = &v14;
      id v10 = v6;
      v12 = &v27;
      [(BKPaginationOperation *)self performBackgroundAnnotationsBlockAndWait:v9];
    }
  }
  id v7 = (id)v28[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  return v7;
}

- (void)recordAnnotationPageNumbers:(id)a3
{
  id v4 = a3;
  if (([(BKPictureBookPaginationOperation *)self isCancelled] & 1) == 0)
  {
    v5 = [(BKPictureBookPaginationOperation *)self unpaginatedAnnotations];
    if ([v5 count])
    {
      id v6 = [(BKPaginationOperation *)self paginationOperationController];
      id v7 = [v6 paginationRevision];

      id v8 = [(BKPictureBookPaginationOperation *)self batchJob];
      id v9 = [v8 lookupKey];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v18 = v5;
      id obj = v5;
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v21;
LABEL_5:
        uint64_t v13 = 0;
        while (1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
          if ([(BKPictureBookPaginationOperation *)self isCancelled]) {
            break;
          }
          id v15 = [v4 newByClass:objc_opt_class()];
          [v15 setLookupKey:v9];
          uint64_t v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v14 ordinal] + 1);
          [v15 setPageNumber:v16];

          [v15 setPaginationRevision:v7];
          v17 = [v14 annotationUuid];
          [v15 setAnnotationUuid:v17];

          if (v11 == (id)++v13)
          {
            id v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v11) {
              goto LABEL_5;
            }
            break;
          }
        }
      }

      v5 = v18;
    }
  }
}

- (id)copyNavigationInfos:(id)a3
{
  id v4 = a3;
  v5 = [(BKPaginationOperation *)self bookObjectID];
  id v6 = +[NSPredicate predicateWithFormat:@"bookInfo == %@", v5];

  id v7 = [objc_alloc((Class)NSArray) initWithObjects:@"baseHref", @"href", @"name", 0];
  id v8 = [v4 copyEntityPropertiesArray:v7 fromEntityName:@"BKNavigationInfo" withPredicate:v6 sortBy:0 ascending:0];

  return v8;
}

- (unint64_t)countPaginatedChapters:(id)a3
{
  id v4 = a3;
  v5 = [(BKPictureBookPaginationOperation *)self batchJob];
  id v6 = [v5 lookupKey];
  id v7 = +[NSPredicate predicateWithFormat:@"lookupKey ==[n] %@", v6];

  id v8 = [v4 countEntity:@"BKChapterPageCount" withPredicate:v7];
  return (unint64_t)v8;
}

- (void)_clearAllChapterPageCountEntities:(id)a3
{
  id v3 = a3;
  id v4 = +[NSPredicate predicateWithValue:1];
  [v3 batchDeleteEntity:@"BKChapterPageCount" matching:v4 prefetchRelationships:0];
}

- (BOOL)_needsFullReparseForRecordedChapterPageCountForDocumentInfos:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKPictureBookPaginationOperation *)self isCancelled])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [(BKPictureBookPaginationOperation *)self copyNavigationInfos:v7];
    unint64_t v10 = [(BKPictureBookPaginationOperation *)self countPaginatedChapters:v7];
    id v11 = [v9 count];
    BOOL v8 = v10 > (unint64_t)v11;
    if (v10 > (unint64_t)v11)
    {
      [(BKPictureBookPaginationOperation *)self _clearAllChapterPageCountEntities:v7];
      unint64_t v10 = 0;
    }
    if (v10 < (unint64_t)[v9 count])
    {
      BOOL v31 = v8;
      id v38 = v7;
      id v37 = [objc_alloc((Class)NSNumber) initWithInt:0];
      uint64_t v12 = [(BKPaginationOperation *)self paginationOperationController];
      v36 = [v12 paginationRevision];

      uint64_t v13 = [(BKPictureBookPaginationOperation *)self batchJob];
      v35 = [v13 bookDatabaseKey];

      uint64_t v14 = [(BKPictureBookPaginationOperation *)self batchJob];
      v34 = [v14 lookupKey];

      uint64_t v15 = [v6 valueForKey:@"href"];
      id v32 = v6;
      long long v28 = [v6 valueForKey:@"documentOrdinal"];
      uint64_t v29 = (void *)v15;
      id v39 = [objc_alloc((Class)NSDictionary) initWithObjects:v28 forKeys:v15];
      id v30 = v9;
      objc_msgSend(v9, "subarrayWithRange:", v10, (char *)objc_msgSend(v9, "count") - v10);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v41;
LABEL_8:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v40 + 1) + 8 * v19);
          if ([(BKPictureBookPaginationOperation *)self isCancelled]) {
            break;
          }
          long long v21 = [v20 objectForKey:@"baseHref"];
          long long v22 = [v39 valueForKey:v21];
          if (v22)
          {
            id v23 = [objc_alloc((Class)NSNumber) initWithInt:[v22 intValue] + 1];
            id v24 = +[BKChapterPageCount newEmptyChapterPageNumber:v38];
            uint64_t v25 = [v20 objectForKey:@"href"];
            [v24 setHref:v25];

            uint64_t v26 = [v20 objectForKey:@"name"];
            [v24 setName:v26];

            [v24 setDocumentPageOffset:v37];
            [v24 setPageNumber:v23];
            [v24 setLookupKey:v34];
            [v24 setBookDatabaseKey:v35];
            [v24 setPaginationRevision:v36];
          }
          if (v17 == (id)++v19)
          {
            id v17 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
            if (v17) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      id v6 = v32;
      id v7 = v38;
      BOOL v8 = v31;
      id v9 = v30;
    }
  }
  return v8;
}

- (void)execute
{
  if ([(BKPaginationOperation *)self isJobGenerationValid])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_8E5D8;
    v4[3] = &unk_1DCD40;
    v4[4] = self;
    [(BKPaginationOperation *)self performBlockAndWait:v4];
  }
  id v3 = [(BKPaginationOperation *)self paginationOperationController];
  [v3 batchEnded:[self isJobGenerationValid]];
}

@end
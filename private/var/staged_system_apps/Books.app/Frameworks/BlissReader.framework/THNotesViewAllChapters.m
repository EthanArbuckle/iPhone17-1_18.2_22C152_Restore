@interface THNotesViewAllChapters
- (BOOL)hasGlossaryTerms;
- (BOOL)isAllNotes;
- (BOOL)isOrphanedNotes;
- (BOOL)needsMigration;
- (BOOL)shouldEnableStudyButton;
- (BOOL)wantsVisibility;
- (NSArray)navigationUnits;
- (NSArray)sectionArray;
- (NSString)subtitle;
- (NSString)title;
- (THNotesViewAllChapters)initWithNavigationUnits:(id)a3 navigationModel:(id)a4;
- (UIImage)image;
- (id)p_annotationCacheForContentNode:(id)a3;
- (unint64_t)annotationCount;
- (unint64_t)annotationCountForStudyCards;
- (void)dealloc;
- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6;
@end

@implementation THNotesViewAllChapters

- (THNotesViewAllChapters)initWithNavigationUnits:(id)a3 navigationModel:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)THNotesViewAllChapters;
  v6 = [(THNotesViewAllChapters *)&v8 init];
  if (v6)
  {
    v6->mNavigationUnits = (NSArray *)a3;
    v6->mNavigationModel = (THDocumentNavigationModel *)a4;
    v6->mCachedAnnotationsByContentNode = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mImage = (UIImage *)+[UIImage th_imageNamed:@"notes-all-chapters"];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewAllChapters;
  [(THNotesViewAllChapters *)&v3 dealloc];
}

- (BOOL)hasGlossaryTerms
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mNavigationUnits = self->mNavigationUnits;
  id v3 = [(NSArray *)mNavigationUnits countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(mNavigationUnits);
        }
        v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = [v7 contentNodes];
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v15;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)j) glossaryTermExists])
              {
                LOBYTE(v3) = 1;
                return (char)v3;
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      id v4 = [(NSArray *)mNavigationUnits countByEnumeratingWithState:&v18 objects:v23 count:16];
      LOBYTE(v3) = 0;
    }
    while (v4);
  }
  return (char)v3;
}

- (BOOL)shouldEnableStudyButton
{
  return 1;
}

- (NSArray)navigationUnits
{
  return self->mNavigationUnits;
}

- (unint64_t)annotationCount
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = [(NSMutableDictionary *)self->mCachedAnnotationsByContentNode allValues];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v12;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v12 != v6) {
        objc_enumerationMutation(v2);
      }
      id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      id v9 = [v8 numberOfHighlightAnnotations];
      v5 += (unint64_t)[v8 numberOfOrphanedAnnotations] + (void)v9;
    }
    id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v4);
  return v5;
}

- (unint64_t)annotationCountForStudyCards
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->mCachedAnnotationsByContentNode allValues];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) numberOfHighlightAnnotations];
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (NSString)title
{
  id v2 = (void *)THBundle();

  return (NSString *)[v2 localizedStringForKey:@"All Chapters" value:&stru_46D7E8 table:0];
}

- (NSString)subtitle
{
  return 0;
}

- (UIImage)image
{
  return self->mImage;
}

- (BOOL)needsMigration
{
  return self->mNeedsMigration;
}

- (BOOL)wantsVisibility
{
  return 1;
}

- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6
{
  self->mNeedsMigration = 0;
  if (!a3) {
    a3 = +[NSArray array];
  }
  id v9 = [a3 arrayByAddingObjectsFromArray:a4, a4, a5, a6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->mNavigationUnits;
  id v21 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v10;
        long long v11 = *(void **)(*((void *)&v27 + 1) + 8 * v10);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v12 = [v11 contentNodes];
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              id v18 = [a5 cachedAnnotationsForAnnotations:v9 filteredWithContentNode:v17];
              if ([v18 needsMigration]) {
                self->mNeedsMigration = 1;
              }
              -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotationsByContentNode, "setObject:forKey:", v18, [v17 nodeGUID]);
            }
            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v14);
        }
        uint64_t v10 = v22 + 1;
      }
      while ((id)(v22 + 1) != v21);
      id v21 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v21);
  }
}

- (id)p_annotationCacheForContentNode:(id)a3
{
  mCachedAnnotationsByContentNode = self->mCachedAnnotationsByContentNode;
  id v4 = [a3 nodeGUID];

  return [(NSMutableDictionary *)mCachedAnnotationsByContentNode objectForKey:v4];
}

- (NSArray)sectionArray
{
  uint64_t v22 = (NSArray *)+[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->mNavigationUnits;
  id v17 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v28 + 1) + 8 * v3);
        id v5 = [(THDocumentNavigationModel *)self->mNavigationModel sectionIdentifierForNavigationUnit:v4];
        uint64_t v18 = v3;
        if (v5) {
          id v19 = -[NSString stringByTransformingForTHNotesSectionHeader](+[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Chapter %@" value:&stru_46D7E8 table:0], v5), "stringByTransformingForTHNotesSectionHeader");
        }
        else {
          id v19 = 0;
        }
        id v6 = objc_alloc_init((Class)NSMutableArray);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v20 = [v4 contentNodes];
        id v23 = [v20 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v23)
        {
          uint64_t v7 = 0;
          uint64_t v21 = *(void *)v25;
          char v8 = 1;
          do
          {
            for (i = 0; i != v23; i = (char *)i + 1)
            {
              if (*(void *)v25 != v21) {
                objc_enumerationMutation(v20);
              }
              uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              long long v11 = objc_alloc_init(THNotesViewSection);
              [(NSArray *)v22 addObject:v11];
              if ((char *)i + v7) {
                id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Section %lu - %@" value:&stru_46D7E8 table:0], (char *)i + v7, objc_msgSend(v10, "title"));
              }
              else {
                id v12 = (NSString *)[v10 title];
              }
              [(THNotesViewSection *)v11 setTitle:[(NSString *)v12 stringByTransformingForTHNotesSectionHeader]];
              [v11 setNotes:[-[THNotesViewAllChapters p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v10) highlightAnnotationsSortedByRange]];
              if ((([(NSArray *)[(THNotesViewSection *)v11 notes] count] != 0) & v8) == 1)
              {
                [(THNotesViewSection *)v11 setChapterTitle:v19];
                char v8 = 0;
              }

              [v6 addObjectsFromArray:[-[THNotesViewAllChapters p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v10) orphanedAnnotations]];
            }
            v7 += (uint64_t)i;
            id v23 = [v20 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v23);
        }
        else
        {
          char v8 = 1;
        }
        if ([v6 count])
        {
          id v13 = objc_alloc_init(THNotesViewSection);
          [(NSArray *)v22 addObject:v13];
          -[THNotesViewSection setTitle:](v13, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Old Notes", &stru_46D7E8, 0), "stringByTransformingForTHNotesSectionHeader"));
          if (v8) {
            [(THNotesViewSection *)v13 setChapterTitle:v19];
          }
          [(THNotesViewSection *)v13 setNotes:v6];
        }
        ++v3;
      }
      while ((id)(v18 + 1) != v17);
      id v17 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v17);
  }
  return v22;
}

- (BOOL)isAllNotes
{
  return 1;
}

- (BOOL)isOrphanedNotes
{
  return 0;
}

@end
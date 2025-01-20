@interface THNotesViewChapter
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
- (THNotesViewChapter)initWithNavigationUnit:(id)a3 navigationModel:(id)a4 tocModel:(id)a5 chapterIndex:(unint64_t)a6;
- (UIImage)image;
- (id)p_annotationCacheForContentNode:(id)a3;
- (unint64_t)annotationCount;
- (unint64_t)annotationCountForStudyCards;
- (void)dealloc;
- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6;
@end

@implementation THNotesViewChapter

- (THNotesViewChapter)initWithNavigationUnit:(id)a3 navigationModel:(id)a4 tocModel:(id)a5 chapterIndex:(unint64_t)a6
{
  v16.receiver = self;
  v16.super_class = (Class)THNotesViewChapter;
  v10 = [(THNotesViewChapter *)&v16 init];
  v11 = v10;
  if (v10)
  {
    v10->mNavigationUnit = (THNavigationUnit *)a3;
    v10->mTitle = (NSString *)[a4 parentTitleForNavigationUnit:a3];
    id v12 = [a4 sectionIdentifierForNavigationUnit:a3];
    if (v12) {
      v11->mSubtitle = (NSString *)[objc_alloc((Class)NSString) initWithFormat:[THBundle localizedStringForKey:@"Chapter %@" value:&stru_46D7E8 table:0], v12];
    }
    v11->mCachedAnnotationsByContentNode = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v13 = objc_msgSend(objc_msgSend(a5, "toc:tileModelForChapterIndex:", 0, a6), "notesThumb");
    if (v13) {
      v14 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider temporaryCGImageForImageData:v13]);
    }
    else {
      v14 = +[UIImage th_imageNamed:@"notes-no-image"];
    }
    v11->mImage = v14;
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewChapter;
  [(THNotesViewChapter *)&v3 dealloc];
}

- (BOOL)hasGlossaryTerms
{
  v2 = [(THNavigationUnit *)self->mNavigationUnit contentNodes];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) glossaryTermExists])
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)shouldEnableStudyButton
{
  return 1;
}

- (NSArray)navigationUnits
{
  id v3 = (NSArray *)+[NSMutableArray array];
  [(NSArray *)v3 addObject:self->mNavigationUnit];
  return v3;
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
      long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
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
  return self->mTitle;
}

- (NSString)subtitle
{
  return self->mSubtitle;
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
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v10 = [(THNavigationUnit *)self->mNavigationUnit contentNodes];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = [a5 cachedAnnotationsForAnnotations:v9 filteredWithContentNode:v15];
        if ([v16 needsMigration]) {
          self->mNeedsMigration = 1;
        }
        -[NSMutableDictionary setObject:forKey:](self->mCachedAnnotationsByContentNode, "setObject:forKey:", v16, [v15 nodeGUID]);
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
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
  v15 = (NSArray *)+[NSMutableArray array];
  id v3 = [(THNavigationUnit *)self->mNavigationUnit contentNodes];
  id v4 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v10 = objc_alloc_init(THNotesViewSection);
        [(NSArray *)v15 addObject:v10];
        if ((char *)i + v7) {
          id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Section %lu - %@" value:&stru_46D7E8 table:0], (char *)i + v7, objc_msgSend(v9, "title"));
        }
        else {
          id v11 = (NSString *)[v9 title];
        }
        [(THNotesViewSection *)v10 setTitle:[(NSString *)v11 stringByTransformingForTHNotesSectionHeader]];
        -[THNotesViewSection setNotes:[self p_annotationCacheForContentNode:v9] highlightAnnotationsSortedByRange];

        [v4 addObjectsFromArray:[-[THNotesViewChapter p_annotationCacheForContentNode:](self, "p_annotationCacheForContentNode:", v9) orphanedAnnotations]];
      }
      id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      v7 += (uint64_t)i;
    }
    while (v6);
  }
  if ([v4 count])
  {
    id v12 = objc_alloc_init(THNotesViewSection);
    [(NSArray *)v15 addObject:v12];
    -[THNotesViewSection setTitle:](v12, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Old Notes", &stru_46D7E8, 0), "stringByTransformingForTHNotesSectionHeader"));
    [(THNotesViewSection *)v12 setNotes:v4];
  }
  return v15;
}

- (BOOL)isAllNotes
{
  return 0;
}

- (BOOL)isOrphanedNotes
{
  return 0;
}

@end
@interface THNotesViewOrphans
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
- (THNotesViewOrphans)init;
- (UIImage)image;
- (unint64_t)annotationCount;
- (unint64_t)annotationCountForStudyCards;
- (void)dealloc;
- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6;
@end

@implementation THNotesViewOrphans

- (THNotesViewOrphans)init
{
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewOrphans;
  v2 = [(THNotesViewOrphans *)&v4 init];
  if (v2) {
    v2->mImage = (UIImage *)+[UIImage th_imageNamed:@"notes-general"];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewOrphans;
  [(THNotesViewOrphans *)&v3 dealloc];
}

- (BOOL)hasGlossaryTerms
{
  return 0;
}

- (BOOL)shouldEnableStudyButton
{
  return 0;
}

- (NSArray)navigationUnits
{
  return 0;
}

- (unint64_t)annotationCount
{
  return [(THAnnotationCache *)self->mOrphanedAnnotations numberOfOrphanedAnnotations];
}

- (unint64_t)annotationCountForStudyCards
{
  return 0;
}

- (NSString)title
{
  v2 = (void *)THBundle();

  return (NSString *)[v2 localizedStringForKey:@"Notes from previous versions" value:&stru_46D7E8 table:0];
}

- (NSString)subtitle
{
  v2 = (void *)THBundle();

  return (NSString *)[v2 localizedStringForKey:@"Old Notes" value:&stru_46D7E8 table:0];
}

- (UIImage)image
{
  return self->mImage;
}

- (BOOL)needsMigration
{
  return 0;
}

- (BOOL)wantsVisibility
{
  return [(THNotesViewOrphans *)self annotationCount] != 0;
}

- (void)updateWithAllAnnotations:(id)a3 orphanedAnnotations:(id)a4 annotationController:(id)a5 navigationModel:(id)a6
{
  self->mOrphanedAnnotations = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_12F480;
  v10[3] = &unk_459C98;
  v10[4] = a6;
  self->mOrphanedAnnotations = (THAnnotationCache *)[a5 cachedAnnotationsForAnnotations:a4 withFilter:v10];
}

- (NSArray)sectionArray
{
  objc_super v3 = (NSArray *)+[NSMutableArray array];
  objc_super v4 = objc_alloc_init(THNotesViewSection);
  [(NSArray *)v3 addObject:v4];
  -[THNotesViewSection setTitle:](v4, "setTitle:", objc_msgSend(objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", @"Old Notes", &stru_46D7E8, 0), "stringByTransformingForTHNotesSectionHeader"));
  [(THNotesViewSection *)v4 setNotes:[(THAnnotationCache *)self->mOrphanedAnnotations highlightAnnotationsSortedByRange]];

  return v3;
}

- (BOOL)isAllNotes
{
  return 0;
}

- (BOOL)isOrphanedNotes
{
  return 1;
}

@end
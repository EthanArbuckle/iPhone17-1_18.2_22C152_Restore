@interface _PXStoryTimeBasedChapterCollectionConfiguration
- (BOOL)usesAssetLocalCreationDates;
- (NSMutableArray)chapters;
- (_PXStoryTimeBasedChapterCollectionConfiguration)init;
- (void)addChapterWithDateInterval:(id)a3 configuration:(id)a4;
- (void)setUsesAssetLocalCreationDates:(BOOL)a3;
@end

@implementation _PXStoryTimeBasedChapterCollectionConfiguration

- (void).cxx_destruct
{
}

- (NSMutableArray)chapters
{
  return self->_chapters;
}

- (void)setUsesAssetLocalCreationDates:(BOOL)a3
{
  self->_usesAssetLocalCreationDates = a3;
}

- (BOOL)usesAssetLocalCreationDates
{
  return self->_usesAssetLocalCreationDates;
}

- (void)addChapterWithDateInterval:(id)a3 configuration:(id)a4
{
  v6 = (void (**)(id, _PXStoryTimeBasedChapter *))a4;
  id v7 = a3;
  v9 = [[_PXStoryTimeBasedChapter alloc] initWithDateInterval:v7 firstAssetLocalIdentifier:0];

  v6[2](v6, v9);
  v8 = [(_PXStoryTimeBasedChapterCollectionConfiguration *)self chapters];
  [v8 addObject:v9];
}

- (_PXStoryTimeBasedChapterCollectionConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXStoryTimeBasedChapterCollectionConfiguration;
  v2 = [(_PXStoryTimeBasedChapterCollectionConfiguration *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    chapters = v2->_chapters;
    v2->_chapters = v3;
  }
  return v2;
}

@end
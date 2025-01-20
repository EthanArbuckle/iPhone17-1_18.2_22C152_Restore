@interface THTOCTileModel
- (NSArray)landscapeEntries;
- (NSArray)largerThumbs;
- (NSArray)portraitEntries;
- (NSArray)tinyThumbs;
- (NSString)backOrdinalText;
- (NSString)backTitleText;
- (NSString)frontOrdinalText;
- (NSString)frontTitleText;
- (THModelContentNode)browserPageNode;
- (THModelLink)firstModelLink;
- (THTOCModel)tocModel;
- (THTOCTileModel)initWithTOCModel:(id)a3;
- (TSPData)backImage;
- (TSPData)frontImage;
- (TSPData)notesThumb;
- (TSPData)tocThumb;
- (id)description;
- (id)displayPageNumberForPageIndex:(unint64_t)a3;
- (id)p_displayPageNumberForPageIndex:(unint64_t)a3 entries:(id)a4;
- (unint64_t)pageIndex;
- (void)addLargerThumb:(id)a3;
- (void)addTinyThumb:(id)a3;
- (void)dealloc;
- (void)setBackImage:(id)a3;
- (void)setBackOrdinalText:(id)a3;
- (void)setBackTitleText:(id)a3;
- (void)setBrowserPageNode:(id)a3;
- (void)setFrontImage:(id)a3;
- (void)setFrontOrdinalText:(id)a3;
- (void)setFrontTitleText:(id)a3;
- (void)setLandscapeEntries:(id)a3;
- (void)setNotesThumb:(id)a3;
- (void)setPortraitEntries:(id)a3;
- (void)setTocModel:(id)a3;
- (void)setTocThumb:(id)a3;
@end

@implementation THTOCTileModel

- (THTOCModel)tocModel
{
  return self->mTOCModel;
}

- (void)setTocModel:(id)a3
{
  self->mTOCModel = (THTOCModel *)a3;
}

- (NSArray)landscapeEntries
{
  return self->mLandscapeEntries;
}

- (void)setLandscapeEntries:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mLandscapeEntries = (NSArray *)a3;
}

- (NSArray)portraitEntries
{
  return self->mPortraitEntries;
}

- (void)setPortraitEntries:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mPortraitEntries = (NSArray *)a3;
}

- (NSString)frontOrdinalText
{
  return self->mFrontOrdinalText;
}

- (void)setFrontOrdinalText:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mFrontOrdinalText = v5;
}

- (NSString)frontTitleText
{
  return self->mFrontTitleText;
}

- (void)setFrontTitleText:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mFrontTitleText = v5;
}

- (TSPData)frontImage
{
  return self->mFrontImage;
}

- (void)setFrontImage:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mFrontImage = (TSPData *)a3;
}

- (NSString)backOrdinalText
{
  return self->mBackOrdinalText;
}

- (void)setBackOrdinalText:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mBackOrdinalText = v5;
}

- (NSString)backTitleText
{
  return self->mBackTitleText;
}

- (void)setBackTitleText:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mBackTitleText = v5;
}

- (TSPData)backImage
{
  return self->mBackImage;
}

- (void)setBackImage:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mBackImage = (TSPData *)a3;
}

- (TSPData)tocThumb
{
  return self->mTOCThumb;
}

- (void)setTocThumb:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mTOCThumb = (TSPData *)a3;
}

- (TSPData)notesThumb
{
  return self->mNotesThumb;
}

- (void)setNotesThumb:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mNotesThumb = (TSPData *)a3;
}

- (THModelContentNode)browserPageNode
{
  return self->mBrowserPageNode;
}

- (void)setBrowserPageNode:(id)a3
{
  [(THTOCTileModel *)self willModify];
  id v5 = a3;

  self->mBrowserPageNode = (THModelContentNode *)a3;
}

- (void)addTinyThumb:(id)a3
{
  mTinyThumbs = self->mTinyThumbs;
  if (!mTinyThumbs)
  {
    mTinyThumbs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mTinyThumbs = mTinyThumbs;
  }

  [(NSMutableArray *)mTinyThumbs addObject:a3];
}

- (void)addLargerThumb:(id)a3
{
  mLargerThumbs = self->mLargerThumbs;
  if (!mLargerThumbs)
  {
    mLargerThumbs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mLargerThumbs = mLargerThumbs;
  }

  [(NSMutableArray *)mLargerThumbs addObject:a3];
}

- (THTOCTileModel)initWithTOCModel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THTOCTileModel;
  result = -[THTOCTileModel initWithContext:](&v5, "initWithContext:", [a3 context]);
  if (result) {
    result->mTOCModel = (THTOCModel *)a3;
  }
  return result;
}

- (THModelLink)firstModelLink
{
  result = [(NSArray *)[(THTOCTileModel *)self portraitEntries] count];
  if (result)
  {
    id v4 = [(NSArray *)[(THTOCTileModel *)self portraitEntries] objectAtIndex:0];
    return (THModelLink *)[v4 modelLink];
  }
  return result;
}

- (unint64_t)pageIndex
{
  unint64_t result = [(NSArray *)[(THTOCTileModel *)self portraitEntries] count];
  if (result)
  {
    id v4 = [(NSArray *)[(THTOCTileModel *)self portraitEntries] objectAtIndex:0];
    return (unint64_t)[v4 pageIndex];
  }
  return result;
}

- (id)p_displayPageNumberForPageIndex:(unint64_t)a3 entries:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(a4);
      }
      v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
      if ((unint64_t)[v11 pageIndex] > a3) {
        break;
      }
      if ([v11 displayPageNumberForPageIndex:a3]) {
        v8 = v11;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [a4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        return [v8 displayPageNumberForPageIndex:a3];
      }
    }
  }
  else
  {
    v8 = 0;
  }
  return [v8 displayPageNumberForPageIndex:a3];
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  objc_super v5 = [(THTOCTileModel *)self portraitEntries];

  return [(THTOCTileModel *)self p_displayPageNumberForPageIndex:a3 entries:v5];
}

- (void)dealloc
{
  self->mTOCModel = 0;

  self->mLandscapeEntries = 0;
  self->mPortraitEntries = 0;

  self->mFrontOrdinalText = 0;
  self->mFrontTitleText = 0;

  self->mFrontImage = 0;
  self->mBackOrdinalText = 0;

  self->mBackTitleText = 0;
  self->mBackImage = 0;

  self->mTinyThumbs = 0;
  self->mLargerThumbs = 0;

  self->mBrowserPageNode = 0;
  self->mTOCThumb = 0;

  self->mNotesThumb = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModel;
  [(THTOCTileModel *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@(%p) pageIndex=%@ frontOrdinalText='%@' frontTitleText='%@' backOrdinalText='%@' backTitleText='%@' firstModelLink=%@> \nlandscapeEntries = %@\nportraitEntries=%@\nbrowserPageNode = %@", NSStringFromClass(v3), self, +[NSNumber numberWithUnsignedInteger:[(THTOCTileModel *)self pageIndex]], [(THTOCTileModel *)self frontOrdinalText], [(THTOCTileModel *)self frontTitleText], [(THTOCTileModel *)self backOrdinalText], [(THTOCTileModel *)self backTitleText], [(THTOCTileModel *)self firstModelLink], [(THTOCTileModel *)self landscapeEntries], [(THTOCTileModel *)self portraitEntries], [(THTOCTileModel *)self browserPageNode]);
}

- (NSArray)tinyThumbs
{
  return &self->mTinyThumbs->super;
}

- (NSArray)largerThumbs
{
  return &self->mLargerThumbs->super;
}

@end
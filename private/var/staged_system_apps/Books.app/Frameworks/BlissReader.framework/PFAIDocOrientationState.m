@interface PFAIDocOrientationState
- (BOOL)hasHints;
- (NSMutableArray)pageDrawableMaps;
- (THModelContentNodeBody)contentNodeBody;
- (THPresentationType)presentationType;
- (id)currentPageDrawableMap;
- (id)hintsData;
- (id)initWitContentNodeBody:(id)a3 presentationType:(id)a4 readerState:(id)a5;
- (id)nextHintShapeRef;
- (id)pageAtRelativeIndex:(unint64_t)a3;
- (int64_t)currentPageIndex;
- (unint64_t)lastHintLocation;
- (unint64_t)nextHintLocation;
- (void)clearHints;
- (void)clearIDsForTemporaryTableCellStorage;
- (void)dealloc;
- (void)invalidateLineHints;
- (void)popHint;
- (void)setCurrentPageIndex:(int64_t)a3;
- (void)setLineHints:(id)a3;
- (void)takeHintsFromState:(id)a3;
@end

@implementation PFAIDocOrientationState

- (id)initWitContentNodeBody:(id)a3 presentationType:(id)a4 readerState:(id)a5
{
  id v9 = [a3 bodyStorage];
  v12.receiver = self;
  v12.super_class = (Class)PFAIDocOrientationState;
  v10 = [(PFXHtmlDocMediaState *)&v12 initWithStorage:v9 readerState:a5 defaultParagraphStyleIdentifier:kTSWPDefaultContentParagraphStyleIdentifier];
  if (v10)
  {
    v10->mContentNodeBody = (THModelContentNodeBody *)a3;
    v10->mPresentationType = (THPresentationType *)a4;
    v10->mPageDrawableMaps = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v10->mHintsExhausted = 0;
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIDocOrientationState;
  [(PFXHtmlDocMediaState *)&v3 dealloc];
}

- (BOOL)hasHints
{
  return self->mHintLocations || self->mHintsExhausted;
}

- (void)popHint
{
  self->mLastHintLocation = self->mNextHintLocation;
  objc_opt_class();
  [(NSEnumerator *)self->mHintEnumerator nextObject];
  objc_super v3 = (NSDictionary *)TSUDynamicCast();
  self->mNextHintEntry = v3;
  if (v3)
  {

    objc_opt_class();
    [(NSDictionary *)self->mNextHintEntry objectForKey:@"p"];
    self->mNextHintLocation = (unint64_t)[(id)TSUDynamicCast() integerValue];
    objc_opt_class();
    [(NSDictionary *)self->mNextHintEntry objectForKey:@"idref"];
    self->mNextHintShapeRef = (NSString *)(id)TSUDynamicCast();
  }
  else
  {
    [(PFAIDocOrientationState *)self invalidateLineHints];
    self->mHintsExhausted = 1;
  }
}

- (unint64_t)nextHintLocation
{
  return self->mNextHintLocation;
}

- (id)nextHintShapeRef
{
  return self->mNextHintShapeRef;
}

- (id)hintsData
{
  return self->mHintsData;
}

- (unint64_t)lastHintLocation
{
  return self->mLastHintLocation;
}

- (void)invalidateLineHints
{
  self->mNextHintLocation = 0x7FFFFFFFFFFFFFFFLL;
  self->mHintEnumerator = 0;

  self->mNextHintShapeRef = 0;
  self->mHintLocations = 0;
}

- (void)setCurrentPageIndex:(int64_t)a3
{
  self->mCurrentPageIndex = a3;
  while ((uint64_t)[(NSMutableArray *)self->mPageDrawableMaps count] <= self->mCurrentPageIndex)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    [(NSMutableArray *)self->mPageDrawableMaps addObject:v4];
  }
}

- (id)currentPageDrawableMap
{
  return [(NSMutableArray *)self->mPageDrawableMaps objectAtIndex:self->mCurrentPageIndex];
}

- (id)pageAtRelativeIndex:(unint64_t)a3
{
  if ([(NSArray *)[(THModelContentNodeBody *)self->mContentNodeBody pages] count] <= a3) {
    return 0;
  }
  v5 = [(THModelContentNodeBody *)self->mContentNodeBody pages];

  return [(NSArray *)v5 objectAtIndex:a3];
}

- (void)clearIDsForTemporaryTableCellStorage
{
  mContentNodeBody = self->mContentNodeBody;
  id v3 = [(PFXHtmlDocMediaState *)self temporaryTableCellStorage];

  [(THModelContentNodeBody *)mContentNodeBody clearNodeUniqueIDForInfo:v3];
}

- (THModelContentNodeBody)contentNodeBody
{
  return self->mContentNodeBody;
}

- (THPresentationType)presentationType
{
  return self->mPresentationType;
}

- (int64_t)currentPageIndex
{
  return self->mCurrentPageIndex;
}

- (NSMutableArray)pageDrawableMaps
{
  return self->mPageDrawableMaps;
}

- (void)clearHints
{
  self->mNextHintLocation = 0x7FFFFFFFFFFFFFFFLL;
  self->mHintEnumerator = 0;

  self->mHintsData = 0;
  self->mHintLocations = 0;

  self->mNextHintShapeRef = 0;
}

- (void)takeHintsFromState:(id)a3
{
  if (*((void *)a3 + 58))
  {
    self->mHintLocations = (NSArray *)*((id *)a3 + 59);
    self->mHintsData = (NSData *)*((id *)a3 + 58);
    self->mHintEnumerator = (NSEnumerator *)*((void *)a3 + 54);
    self->mLastHintLocation = *((void *)a3 + 57);
    self->mNextHintEntry = (NSDictionary *)*((void *)a3 + 53);
    self->mNextHintLocation = *((void *)a3 + 55);
    self->mNextHintShapeRef = (NSString *)*((id *)a3 + 56);
    [a3 clearHints];
  }
}

- (void)setLineHints:(id)a3
{
  self->mHintsData = 0;
  self->mHintLocations = 0;
  self->mNextHintEntry = 0;
  self->mHintEnumerator = 0;
  self->mNextHintLocation = 0;
  if (a3)
  {
    objc_opt_class();
    [a3 objectForKey:@"version"];
    v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      if ([v5 integerValue] == (char *)&dword_0 + 1)
      {
        objc_opt_class();
        [a3 objectForKey:@"data"];
        v6 = (void *)TSUDynamicCast();
        if (v6) {
          self->mHintsData = (NSData *)v6;
        }
        objc_opt_class();
        [a3 objectForKey:@"positions"];
        v7 = (void *)TSUDynamicCast();
        if (v7)
        {
          mHintLocations = v7;
          self->mHintLocations = mHintLocations;
        }
        else
        {
          mHintLocations = self->mHintLocations;
        }
        self->mHintEnumerator = [(NSArray *)mHintLocations objectEnumerator];
        [(PFAIDocOrientationState *)self popHint];
      }
    }
  }
}

@end
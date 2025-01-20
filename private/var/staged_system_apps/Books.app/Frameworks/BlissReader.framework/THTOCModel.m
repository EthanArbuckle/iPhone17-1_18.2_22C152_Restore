@interface THTOCModel
- (BOOL)showPageNumbers;
- (NSArray)tiles;
- (NSDictionary)figureReference;
- (NSString)bookSubtitle;
- (NSString)bookTitle;
- (TSPData)tocHeaderImageData;
- (id)bookTOCHeaderImageDataForTOC:(id)a3;
- (id)displayPageNumberForPageIndex:(unint64_t)a3;
- (id)toc:(id)a3 tileModelForChapterIndex:(int64_t)a4;
- (int64_t)numberOfDivisionsInTOC:(id)a3;
- (unint64_t)pageIndex;
- (unint64_t)toc:(id)a3 numberOfTilesInDivision:(int64_t)a4;
- (void)dealloc;
- (void)setBookSubtitle:(id)a3;
- (void)setBookTitle:(id)a3;
- (void)setFigureReference:(id)a3;
- (void)setShowPageNumbers:(BOOL)a3;
- (void)setTiles:(id)a3;
- (void)setTocHeaderImageData:(id)a3;
@end

@implementation THTOCModel

- (NSArray)tiles
{
  return self->mTiles;
}

- (void)setTiles:(id)a3
{
  [(THTOCModel *)self willModify];
  id v5 = a3;

  self->mTiles = (NSArray *)a3;
}

- (NSString)bookTitle
{
  return self->mBookTitle;
}

- (void)setBookTitle:(id)a3
{
  [(THTOCModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mBookTitle = v5;
}

- (NSString)bookSubtitle
{
  return self->mBookSubtitle;
}

- (void)setBookSubtitle:(id)a3
{
  [(THTOCModel *)self willModify];
  id v5 = (NSString *)[a3 copy];

  self->mBookSubtitle = v5;
}

- (TSPData)tocHeaderImageData
{
  return self->mTocHeaderImageData;
}

- (void)setTocHeaderImageData:(id)a3
{
  [(THTOCModel *)self willModify];
  id v5 = a3;

  self->mTocHeaderImageData = (TSPData *)a3;
}

- (BOOL)showPageNumbers
{
  return self->mShowPageNumbers;
}

- (void)setShowPageNumbers:(BOOL)a3
{
  self->mShowPageNumbers = a3;
}

- (void)dealloc
{
  self->mTiles = 0;
  self->mBookTitle = 0;

  self->mBookSubtitle = 0;
  self->mTocHeaderImageData = 0;

  self->_figureReference = 0;
  v3.receiver = self;
  v3.super_class = (Class)THTOCModel;
  [(THTOCModel *)&v3 dealloc];
}

- (unint64_t)pageIndex
{
  unint64_t result = [(NSArray *)[(THTOCModel *)self tiles] count];
  if (result)
  {
    id v4 = [(NSArray *)[(THTOCModel *)self tiles] objectAtIndex:0];
    return (unint64_t)[v4 pageIndex];
  }
  return result;
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(THTOCModel *)self tiles];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v4);
      }
      v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if ((unint64_t)[v10 pageIndex] > a3) {
        break;
      }
      if ([v10 displayPageNumberForPageIndex:a3]) {
        v7 = v10;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          goto LABEL_3;
        }
        return [v7 displayPageNumberForPageIndex:a3];
      }
    }
  }
  else
  {
    v7 = 0;
  }
  return [v7 displayPageNumberForPageIndex:a3];
}

- (NSDictionary)figureReference
{
  return self->_figureReference;
}

- (void)setFigureReference:(id)a3
{
}

- (int64_t)numberOfDivisionsInTOC:(id)a3
{
  return 1;
}

- (unint64_t)toc:(id)a3 numberOfTilesInDivision:(int64_t)a4
{
  if (![(NSArray *)[(THTOCModel *)self tiles] count]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THTOCModel(THTOCViewControllerDataSource) toc:numberOfTilesInDivision:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THTOCModel.m") lineNumber:80 description:@"No tiles in the TOC Model"];
  }
  id v5 = [(THTOCModel *)self tiles];

  return [(NSArray *)v5 count];
}

- (id)toc:(id)a3 tileModelForChapterIndex:(int64_t)a4
{
  if ([(NSArray *)[(THTOCModel *)self tiles] count] <= a4) {
    return 0;
  }
  id v6 = [(THTOCModel *)self tiles];

  return [(NSArray *)v6 objectAtIndex:a4];
}

- (id)bookTOCHeaderImageDataForTOC:(id)a3
{
  return [(THTOCModel *)self tocHeaderImageData];
}

@end
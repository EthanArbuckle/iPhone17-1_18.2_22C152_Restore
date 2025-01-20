@interface WDParagraph
- (BOOL)isContinuationOf:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isTextFrame;
- (WDParagraph)initWithText:(id)a3;
- (WDParagraph)initWithText:(id)a3 string:(id)a4;
- (float)maxReflectionDistance;
- (id)addAnnotation:(int)a3;
- (id)addAnnotation:(int)a3 atIndex:(unint64_t)a4;
- (id)addBookmark;
- (id)addBookmark:(id)a3 type:(int)a4;
- (id)addCharacterRun;
- (id)addDateTime:(id)a3;
- (id)addEndnote;
- (id)addFieldMarker;
- (id)addFieldMarker:(int)a3;
- (id)addFootnote;
- (id)addHyperlinkFieldMarker;
- (id)addHyperlinkFieldMarker:(int)a3;
- (id)addMath:(id)a3;
- (id)addSpecialCharacter;
- (id)addSymbol;
- (id)description;
- (id)newRunIterator;
- (id)properties;
- (id)runAt:(unint64_t)a3;
- (id)runIterator;
- (id)runs;
- (int)blockType;
- (unint64_t)identifier;
- (unint64_t)runCount;
- (void)addRun:(id)a3;
- (void)clearProperties;
- (void)clearRuns;
- (void)insertRun:(id)a3 atIndex:(unint64_t)a4;
- (void)removeLastCharacter:(unsigned __int16)a3;
- (void)removeRun:(id)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation WDParagraph

- (WDParagraph)initWithText:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDParagraph;
  v5 = [(WDBlock *)&v13 initWithText:v4];
  if (v5)
  {
    v6 = [WDParagraphProperties alloc];
    v7 = [v4 document];
    uint64_t v8 = [(WDParagraphProperties *)v6 initWithDocument:v7];
    mProperties = v5->mProperties;
    v5->mProperties = (WDParagraphProperties *)v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mRuns = v5->mRuns;
    v5->mRuns = v10;

    v5->identifier = 0;
  }

  return v5;
}

- (id)properties
{
  return self->mProperties;
}

- (id)addCharacterRun
{
  v3 = [[WDCharacterRun alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (unint64_t)runCount
{
  return [(NSMutableArray *)self->mRuns count];
}

- (id)runAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mRuns objectAtIndex:a3];
}

- (void)removeLastCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v5 = [(NSMutableArray *)self->mRuns count];
  if (v5)
  {
    unint64_t v6 = v5;
    id v11 = [(NSMutableArray *)self->mRuns objectAtIndex:v5 - 1];
    if (![v11 runType])
    {
      id v7 = v11;
      [v7 removeLastCharacter:v3];
      uint64_t v8 = [v7 string];
      uint64_t v9 = [v8 length];

      if (v6 >= 2 && v9 == 0) {
        [(NSMutableArray *)self->mRuns removeLastObject];
      }
    }
  }
}

- (void)addRun:(id)a3
{
}

- (id)addFieldMarker
{
  uint64_t v3 = [[WDFieldMarker alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addBookmark:(id)a3 type:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [[WDBookmark alloc] initWithParagraph:self name:v6 type:v4];
  [(NSMutableArray *)self->mRuns addObject:v7];

  return v7;
}

- (int)blockType
{
  return 0;
}

- (BOOL)isTextFrame
{
  v2 = [(WDParagraph *)self properties];
  if ([v2 isHorizontalAnchorOverridden]
    && [v2 horizontalAnchor]
    || [v2 isVerticalAnchorOverridden]
    && [v2 verticalAnchor] != 2
    || [v2 isHorizontalPositionOverridden] && objc_msgSend(v2, "horizontalPosition"))
  {
    BOOL v3 = 1;
  }
  else if ([v2 isVerticalPositionOverridden])
  {
    BOOL v3 = [v2 verticalPosition] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isContinuationOf:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WDParagraph *)self properties];
  id v6 = [v4 properties];
  if ([v5 isHorizontalAnchorOverridden]
    && [v6 isHorizontalAnchorOverridden]
    && (int v7 = [v5 horizontalAnchor], v7 == objc_msgSend(v6, "horizontalAnchor"))
    && [v5 isVerticalAnchorOverridden]
    && [v6 isVerticalAnchorOverridden]
    && (int v8 = [v5 verticalAnchor], v8 == objc_msgSend(v6, "verticalAnchor"))
    && [v5 isHorizontalPositionOverridden]
    && [v6 isHorizontalPositionOverridden]
    && (uint64_t v9 = [v5 horizontalPosition], v9 == objc_msgSend(v6, "horizontalPosition"))
    && [v5 isVerticalPositionOverridden]
    && [v6 isVerticalPositionOverridden]
    && (uint64_t v10 = [v5 verticalPosition], v10 == objc_msgSend(v6, "verticalPosition"))
    && [v5 isWidthOverridden]
    && [v6 isWidthOverridden])
  {
    uint64_t v11 = [v5 width];
    BOOL v12 = v11 == [v6 width];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)addSpecialCharacter
{
  BOOL v3 = [[WDSpecialCharacter alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addFootnote
{
  BOOL v3 = [[WDNote alloc] initWithParagraph:self footnote:1];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addBookmark
{
  BOOL v3 = [(WDRun *)[WDBookmark alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addFieldMarker:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(WDParagraph *)self addFieldMarker];
  [v4 setFieldMarkerType:v3];
  return v4;
}

- (id)addSymbol
{
  uint64_t v3 = [[WDSymbol alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addEndnote
{
  uint64_t v3 = [[WDNote alloc] initWithParagraph:self footnote:0];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addAnnotation:(int)a3
{
  return [(WDParagraph *)self addAnnotation:*(void *)&a3 atIndex:-1];
}

- (WDParagraph)initWithText:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(WDParagraph *)self initWithText:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    [(WDParagraphProperties *)v8->mProperties setBaseStyle:0];
    uint64_t v10 = [[WDCharacterRun alloc] initWithParagraph:v9 string:v7];
    [(NSMutableArray *)v9->mRuns addObject:v10];
  }
  return v9;
}

- (void)clearProperties
{
  mProperties = self->mProperties;
  self->mProperties = 0;
}

- (id)runs
{
  return self->mRuns;
}

- (void)insertRun:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)removeRun:(id)a3
{
}

- (void)clearRuns
{
  mRuns = self->mRuns;
  self->mRuns = 0;
}

- (id)addAnnotation:(int)a3 atIndex:(unint64_t)a4
{
  id v6 = [[WDAnnotation alloc] initWithParagraph:self type:*(void *)&a3];
  if (a4 == -1 || [(NSMutableArray *)self->mRuns count] < a4) {
    [(NSMutableArray *)self->mRuns addObject:v6];
  }
  else {
    [(NSMutableArray *)self->mRuns insertObject:v6 atIndex:a4];
  }
  return v6;
}

- (id)addHyperlinkFieldMarker
{
  uint64_t v3 = [(WDFieldMarker *)[WDHyperlinkFieldMarker alloc] initWithParagraph:self];
  [(NSMutableArray *)self->mRuns addObject:v3];
  return v3;
}

- (id)addHyperlinkFieldMarker:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(WDParagraph *)self addHyperlinkFieldMarker];
  [v4 setFieldMarkerType:v3];
  return v4;
}

- (id)addDateTime:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WDDateTime alloc] initWithParagraph:self date:v4];
  [(NSMutableArray *)self->mRuns addObject:v5];

  return v5;
}

- (id)addMath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[WDMath alloc] initWithParagraph:self xmlBlob:v4];
  [(NSMutableArray *)self->mRuns addObject:v5];

  return v5;
}

- (float)maxReflectionDistance
{
  uint64_t v3 = [(NSMutableArray *)self->mRuns count];
  if (!v3) {
    return 0.0;
  }
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  float v6 = 0.0;
  do
  {
    id v7 = [(NSMutableArray *)self->mRuns objectAtIndex:v5];
    if (![v7 runType])
    {
      id v8 = v7;
      uint64_t v9 = [v8 properties];
      if ([v9 isReflectionOverridden])
      {
        uint64_t v10 = [v9 reflection];
        uint64_t v11 = v10;
        if (v10)
        {
          [v10 distance];
          if (v12 > v6) {
            float v6 = v12;
          }
        }
      }
    }

    ++v5;
  }
  while (v4 != v5);
  return v6;
}

- (id)runIterator
{
  v2 = [[WDArrayIterator alloc] initWithArray:self->mRuns];
  return v2;
}

- (id)newRunIterator
{
  uint64_t v3 = [WDArrayIterator alloc];
  mRuns = self->mRuns;
  return [(WDArrayIterator *)v3 initWithArray:mRuns];
}

- (BOOL)isEmpty
{
  if (![(NSMutableArray *)self->mRuns count]) {
    return 1;
  }
  uint64_t v3 = 0;
  unsigned int v4 = 1;
  do
  {
    uint64_t v5 = [(NSMutableArray *)self->mRuns objectAtIndex:v3];
    char v6 = [v5 isEmpty];

    if ((v6 & 1) == 0) {
      break;
    }
    uint64_t v3 = v4;
  }
  while ([(NSMutableArray *)self->mRuns count] > (unint64_t)v4++);
  return v6;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDParagraph;
  v2 = [(WDBlock *)&v4 description];
  return v2;
}

- (unint64_t)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->identifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRuns, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
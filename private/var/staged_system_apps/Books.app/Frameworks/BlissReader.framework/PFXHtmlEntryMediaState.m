@interface PFXHtmlEntryMediaState
- (BOOL)processOrientation;
- (NSArray)childResults;
- (NSString)altDesc;
- (NSURL)URL;
- (PFSPropertySet)propertySet;
- (PFXHtmlEntryMediaState)initWithHtmlStackEntry:(id)a3 parentEntryMediaState:(id)a4;
- (PFXHtmlEntryMediaState)parentEntryMediaState;
- (TSSStylesheet)stylesheet;
- (TSWPCharacterStyle)characterStyle;
- (TSWPListStyle)listStyle;
- (TSWPParagraphStyle)paragraphStyle;
- (TSWPStorage)originalStorage;
- (TSWPStorage)storage;
- (double)blockWidth;
- (double)fontSize;
- (double)leftMargin;
- (double)leftPadding;
- (double)marginAfter;
- (double)marginBefore;
- (double)paddingAfter;
- (double)paddingBefore;
- (double)parentFontSize;
- (double)rightMargin;
- (double)rightPadding;
- (id)ancestorParagraphStyle;
- (id)childElementNameAtIndex:(unint64_t)a3;
- (id)childPairAtIndex:(unint64_t)a3;
- (id)childResultAtIndex:(unint64_t)a3;
- (id)firstChildResultWithElementName:(id)a3;
- (id)result;
- (id)xmlAttributeValueForResult:(id)a3 attributeName:(const char *)a4;
- (int)whitespace;
- (unint64_t)childResultCount;
- (unint64_t)startCharIndex;
- (unsigned)currentBreakState;
- (unsigned)parentBreakState;
- (void)addAttributes:(const void *)a3 forResult:(id)a4;
- (void)addChildResultsFromState:(id)a3;
- (void)addElementName:(const char *)a3 result:(id)a4;
- (void)dealloc;
- (void)loadPropertiesIfNecessary;
- (void)setAltDesc:(id)a3;
- (void)setBlockWidth:(double)a3;
- (void)setCharacterStyle:(id)a3;
- (void)setCurrentBreakState:(unsigned __int16)a3;
- (void)setCurrentBreakStateSameAsParent;
- (void)setFontSize:(double)a3;
- (void)setLeftMargin:(double)a3;
- (void)setLeftPadding:(double)a3;
- (void)setListStyle:(id)a3;
- (void)setMarginAfter:(double)a3;
- (void)setMarginBefore:(double)a3;
- (void)setNextBreak:(int64_t)a3;
- (void)setOriginalStorage:(id)a3;
- (void)setOverriddenStorage:(id)a3;
- (void)setPaddingAfter:(double)a3;
- (void)setPaddingBefore:(double)a3;
- (void)setParagraphStyle:(id)a3;
- (void)setParentBreakStateSameAsCurrent;
- (void)setProcessOrientation:(BOOL)a3;
- (void)setPropertySet:(id)a3;
- (void)setResult:(id)a3;
- (void)setRightMargin:(double)a3;
- (void)setRightPadding:(double)a3;
- (void)setStartCharIndex:(unint64_t)a3;
- (void)setStylesheet:(id)a3;
- (void)setURL:(id)a3;
- (void)setWhitespace:(int)a3;
@end

@implementation PFXHtmlEntryMediaState

- (void)setPropertySet:(id)a3
{
  mPropertySet = self->mPropertySet;
  if (mPropertySet != a3)
  {

    self->mPropertySet = (PFSPropertySet *)a3;
  }
}

- (PFXHtmlEntryMediaState)initWithHtmlStackEntry:(id)a3 parentEntryMediaState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PFXHtmlEntryMediaState;
  v6 = [(PFXHtmlEntryMediaState *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->mHtmlStackEntry = (PFXHtmlStackEntry *)a3;
    v6->mParentEntryMediaState = (PFXHtmlEntryMediaState *)a4;
    v6->mFontSize = 12.0;
    v6->mWhitespace = 5;
    v6->mNextBreak = 0;
    v6->mStorage = (TSWPStorage *)[a4 storage];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXHtmlEntryMediaState;
  [(PFXHtmlEntryMediaState *)&v3 dealloc];
}

- (PFSPropertySet)propertySet
{
  return self->mPropertySet;
}

- (int)whitespace
{
  return self->mWhitespace;
}

- (double)parentFontSize
{
  mParentEntryMediaState = self->mParentEntryMediaState;
  if (!mParentEntryMediaState) {
    return self->mFontSize;
  }
  [(PFXHtmlEntryMediaState *)mParentEntryMediaState fontSize];
  return result;
}

- (unsigned)parentBreakState
{
  return [(PFXHtmlEntryMediaState *)self->mParentEntryMediaState currentBreakState];
}

- (void)setCurrentBreakStateSameAsParent
{
  self->mNextBreak = [(PFXHtmlEntryMediaState *)self->mParentEntryMediaState currentBreakState];
}

- (void)setParentBreakStateSameAsCurrent
{
}

- (id)ancestorParagraphStyle
{
  id result = [(PFXHtmlEntryMediaState *)self->mParentEntryMediaState paragraphStyle];
  if (!result)
  {
    mParentEntryMediaState = self->mParentEntryMediaState;
    return [(PFXHtmlEntryMediaState *)mParentEntryMediaState ancestorParagraphStyle];
  }
  return result;
}

- (NSArray)childResults
{
  return &self->mChildResults->super;
}

- (unint64_t)childResultCount
{
  return (unint64_t)[(NSMutableArray *)self->mChildResults count];
}

- (id)childPairAtIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->mChildResults count] <= a3) {
    return 0;
  }
  mChildResults = self->mChildResults;

  return [(NSMutableArray *)mChildResults objectAtIndex:a3];
}

- (id)childElementNameAtIndex:(unint64_t)a3
{
  id v3 = [(PFXHtmlEntryMediaState *)self childPairAtIndex:a3];

  return [v3 first];
}

- (id)childResultAtIndex:(unint64_t)a3
{
  id v3 = [(PFXHtmlEntryMediaState *)self childPairAtIndex:a3];

  return [v3 second];
}

- (id)firstChildResultWithElementName:(id)a3
{
  id v5 = [(NSMutableArray *)self->mChildResults count];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    id v8 = [(NSMutableArray *)self->mChildResults objectAtIndex:v7];
    if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v8, "first"))) {
      break;
    }
    if (v6 == (id)++v7) {
      return 0;
    }
  }

  return [v8 second];
}

- (void)addElementName:(const char *)a3 result:(id)a4
{
  if (a3 && a4 && xmlStrlen((const xmlChar *)a3))
  {
    if (!self->mChildResults) {
      self->mChildResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    }
    id v7 = [objc_alloc((Class)TSUPair) initWithFirst:[NSString stringWithXmlString:a3] second:a4];
    [(NSMutableArray *)self->mChildResults addObject:v7];
  }
}

- (void)addChildResultsFromState:(id)a3
{
  if (!self->mChildResults) {
    self->mChildResults = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  id v5 = (char *)[a3 childResultCount];
  if (v5)
  {
    id v6 = v5;
    for (i = 0; i != v6; ++i)
      -[NSMutableArray addObject:](self->mChildResults, "addObject:", [a3 childPairAtIndex:i]);
  }
}

- (id)xmlAttributeValueForResult:(id)a3 attributeName:(const char *)a4
{
  if (!a3) {
    return 0;
  }
  id result = self->mChildAttributes;
  if (result)
  {
    id result = [result objectForKey:];
    if (result)
    {
      id v6 = result;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id result = [result countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (result)
      {
        id v7 = result;
        uint64_t v8 = *(void *)v12;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v12 != v8) {
              objc_enumerationMutation(v6);
            }
            v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
            if (xmlStrEqual((const xmlChar *)objc_msgSend(objc_msgSend(v10, "first"), "xmlString"), (const xmlChar *)a4))
            {
              return [v10 second];
            }
          }
          id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          id result = 0;
          if (v7) {
            continue;
          }
          break;
        }
      }
    }
  }
  return result;
}

- (void)setOverriddenStorage:(id)a3
{
  mStorage = self->mStorage;
  if (mStorage != a3)
  {

    self->mStorage = (TSWPStorage *)a3;
  }
}

- (void)addAttributes:(const void *)a3 forResult:(id)a4
{
  if (a4 && *((void *)a3 + 2))
  {
    if (!self->mChildAttributes) {
      self->mChildAttributes = (NSMutableDictionary *)objc_alloc_init((Class)TSUNoCopyDictionary);
    }
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a3 + 2)];
    id v7 = *(char **)a3;
    uint64_t v8 = (char *)a3 + 8;
    if (*(const void **)a3 != (char *)a3 + 8)
    {
      do
      {
        objc_super v9 = [[PFXString alloc] initWithXmlString:*((void *)v7 + 4)];
        id v10 = [objc_alloc((Class)TSUPair) initWithFirst:v9 second:*((void *)v7 + 5)];

        [v14 addObject:v10];
        long long v11 = (char *)*((void *)v7 + 1);
        if (v11)
        {
          do
          {
            long long v12 = v11;
            long long v11 = *(char **)v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            long long v12 = (char *)*((void *)v7 + 2);
            BOOL v13 = *(void *)v12 == (void)v7;
            id v7 = v12;
          }
          while (!v13);
        }
        id v7 = v12;
      }
      while (v12 != v8);
    }
    [(NSMutableDictionary *)self->mChildAttributes setObject:v14 forKey:a4];
  }
}

- (PFXHtmlEntryMediaState)parentEntryMediaState
{
  return self->mParentEntryMediaState;
}

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (TSWPStorage)originalStorage
{
  return self->mOriginalStorage;
}

- (void)setOriginalStorage:(id)a3
{
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  self->mStylesheet = (TSSStylesheet *)a3;
}

- (TSWPCharacterStyle)characterStyle
{
  return self->mCharacterStyle;
}

- (void)setCharacterStyle:(id)a3
{
}

- (TSWPParagraphStyle)paragraphStyle
{
  return self->mParagraphStyle;
}

- (void)setParagraphStyle:(id)a3
{
}

- (double)fontSize
{
  return self->mFontSize;
}

- (void)setFontSize:(double)a3
{
  self->mFontSize = a3;
}

- (double)blockWidth
{
  return self->mBlockWidth;
}

- (void)setBlockWidth:(double)a3
{
  self->mBlockWidth = a3;
}

- (void)setWhitespace:(int)a3
{
  self->mWhitespace = a3;
}

- (unsigned)currentBreakState
{
  return self->mNextBreak;
}

- (void)setCurrentBreakState:(unsigned __int16)a3
{
  self->mNextBreak = a3;
}

- (unint64_t)startCharIndex
{
  return self->mStartCharIndex;
}

- (void)setStartCharIndex:(unint64_t)a3
{
  self->mStartCharIndex = a3;
}

- (double)leftMargin
{
  return self->mLeftMargin;
}

- (void)setLeftMargin:(double)a3
{
  self->mLeftMargin = a3;
}

- (double)rightMargin
{
  return self->mRightMargin;
}

- (void)setRightMargin:(double)a3
{
  self->mRightMargin = a3;
}

- (double)marginBefore
{
  return self->mMarginBefore;
}

- (void)setMarginBefore:(double)a3
{
  self->mMarginBefore = a3;
}

- (double)marginAfter
{
  return self->mMarginAfter;
}

- (void)setMarginAfter:(double)a3
{
  self->mMarginAfter = a3;
}

- (double)leftPadding
{
  return self->mLeftPadding;
}

- (void)setLeftPadding:(double)a3
{
  self->mLeftPadding = a3;
}

- (double)rightPadding
{
  return self->mRightPadding;
}

- (void)setRightPadding:(double)a3
{
  self->mRightPadding = a3;
}

- (double)paddingBefore
{
  return self->mPaddingBefore;
}

- (void)setPaddingBefore:(double)a3
{
  self->mPaddingBefore = a3;
}

- (double)paddingAfter
{
  return self->mPaddingAfter;
}

- (void)setPaddingAfter:(double)a3
{
  self->mPaddingAfter = a3;
}

- (TSWPListStyle)listStyle
{
  return self->mListStyle;
}

- (void)setListStyle:(id)a3
{
}

- (NSString)altDesc
{
  return self->mAltDesc;
}

- (void)setAltDesc:(id)a3
{
}

- (NSURL)URL
{
  return self->mURL;
}

- (void)setURL:(id)a3
{
}

- (BOOL)processOrientation
{
  return self->mProcessOrientation;
}

- (void)setProcessOrientation:(BOOL)a3
{
  self->mProcessOrientation = a3;
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void)loadPropertiesIfNecessary
{
  if (!self->mPropertySet) {
    +[PFXHtmlStyle loadCssPropertiesForHtmlEntry:self->mHtmlStackEntry];
  }
}

- (void)setNextBreak:(int64_t)a3
{
  self->mNextBreak = a3;
}

@end
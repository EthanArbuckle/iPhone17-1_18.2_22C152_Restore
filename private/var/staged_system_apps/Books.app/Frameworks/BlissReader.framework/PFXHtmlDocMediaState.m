@interface PFXHtmlDocMediaState
- (BOOL)hasHints;
- (BOOL)inList;
- (BOOL)loadedDocumentSelectorsForEntry:(id)a3;
- (BOOL)orderedList;
- (NSMutableDictionary)drawableAttachmentCache;
- (PFSPageCache)pageCache;
- (PFSStyleCache)styleCache;
- (PFXHtmlDocMediaState)initWithStorage:(id)a3 readerState:(id)a4 defaultParagraphStyleIdentifier:(id)a5;
- (PFXHtmlReaderState)readerState;
- (TSPObjectContext)objectContext;
- (TSSStylesheet)stylesheet;
- (TSWPListStyle)defaultNoneListStyle;
- (TSWPParagraphStyle)defaultParagraphStyle;
- (TSWPStorage)bodyStorage;
- (double)listIndentForLevel:(int64_t)a3;
- (id).cxx_construct;
- (id)characterStyleForStyleSelector:(id)a3;
- (id)displayValueForStyleSelector:(id)a3;
- (id)hintsData;
- (id)nextHintShapeRef;
- (id)paragraphStyleForStyleSelector:(id)a3;
- (id)sourceDrawableInfoForIdentifier:(id)a3;
- (id)temporaryTableCellStorage;
- (int)whitespaceValueForStyleSelector:(id)a3;
- (int64_t)listLevel;
- (int64_t)listStart;
- (unint64_t)characterPositionForDrawableAnchorId:(id)a3;
- (unint64_t)lastHintLocation;
- (unint64_t)nextHintLocation;
- (vector<unsigned)pageStartIndices;
- (void)addPageStartIndex;
- (void)addStylesheetProperties:(id)a3;
- (void)addStylesheetProperties:(id)a3 forEntry:(id)a4;
- (void)cacheCharacterPosition:(unint64_t)a3 forDrawableAnchorId:(id)a4;
- (void)dealloc;
- (void)setCharacterStyle:(id)a3 forStyleSelector:(id)a4;
- (void)setDisplayValue:(BOOL)a3 forStyleSelector:(id)a4;
- (void)setListIndent:(double)a3 forLevel:(int64_t)a4;
- (void)setListStart:(int64_t)a3;
- (void)setParagraphStyle:(id)a3 forStyleSelector:(id)a4;
- (void)setSourceDrawableInfo:(id)a3 forIdentifier:(id)a4;
- (void)setWhitespaceValue:(int)a3 forStyleSelector:(id)a4;
- (void)startListOrdered:(BOOL)a3;
- (void)stopList;
@end

@implementation PFXHtmlDocMediaState

- (PFXHtmlDocMediaState)initWithStorage:(id)a3 readerState:(id)a4 defaultParagraphStyleIdentifier:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)PFXHtmlDocMediaState;
  v8 = [(PFXHtmlDocMediaState *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->mReaderState = (PFXHtmlReaderState *)a4;
    v8->mStyleCache = objc_alloc_init(PFSStyleCache);
    v9->mPageCache = objc_alloc_init(PFSPageCache);
    v9->mLoadedStylesheetEntries = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v9->mBodyStorage = (TSWPStorage *)a3;
    v10 = (TSSStylesheet *)[a3 stylesheet];
    v9->mStylesheet = v10;
    v9->mDefaultNoneListStyle = (TSWPListStyle *)[(TSSStylesheet *)v10 defaultListStyle];
    v9->mObjectContext = (TSPObjectContext *)[a3 context];
    if (a5) {
      v9->mDefaultParagraphStyle = (TSWPParagraphStyle *)[(TSSStylesheet *)v9->mStylesheet styleWithIdentifier:a5];
    }
    begin = (char *)v9->mListTextIndents.__begin_;
    uint64_t v13 = 0;
    sub_1FC1B8((uint64_t)&v9->mListTextIndents, begin, 9uLL, (char *)&v13);
    v9->mListLevel = -1;
    v9->mDrawableAttachmentCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9->mDrawableAnchorCache = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v9;
}

- (void)dealloc
{
  for (i = (id *)self->mCharacterStyleCache.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  for (j = (id *)self->mParagraphStyleCache.__table_.__p1_.__value_.__next_; j; j = (id *)*j)

  for (k = (id *)self->mDisplayValueCache.__table_.__p1_.__value_.__next_; k; k = (id *)*k)
  v6.receiver = self;
  v6.super_class = (Class)PFXHtmlDocMediaState;
  [(PFXHtmlDocMediaState *)&v6 dealloc];
}

- (id)temporaryTableCellStorage
{
  id result = self->mTemporaryTableCellStorage;
  if (!result)
  {
    id v4 = objc_alloc((Class)TSWPStorage);
    id v5 = +[THTemporaryObjectContext context];
    mStylesheet = self->mStylesheet;
    mDefaultParagraphStyle = self->mDefaultParagraphStyle;
    if (!mDefaultParagraphStyle) {
      mDefaultParagraphStyle = (TSWPParagraphStyle *)[(TSSStylesheet *)self->mStylesheet defaultParagraphStyle];
    }
    mDefaultNoneListStyle = self->mDefaultNoneListStyle;
    if (!mDefaultNoneListStyle) {
      mDefaultNoneListStyle = (TSWPListStyle *)[(TSSStylesheet *)self->mStylesheet defaultListStyle];
    }
    id result = [v4 initWithContext:v5 string:0 kind:3 stylesheet:mStylesheet paragraphStyle:mDefaultParagraphStyle listStyle:mDefaultNoneListStyle section:0 columnStyle:0];
    self->mTemporaryTableCellStorage = (TSWPStorage *)result;
  }
  return result;
}

- (void)addStylesheetProperties:(id)a3
{
}

- (void)addStylesheetProperties:(id)a3 forEntry:(id)a4
{
  [(NSMutableSet *)self->mLoadedStylesheetEntries addObject:a4];

  [(PFXHtmlDocMediaState *)self addStylesheetProperties:a3];
}

- (BOOL)loadedDocumentSelectorsForEntry:(id)a3
{
  return [(NSMutableSet *)self->mLoadedStylesheetEntries containsObject:a3];
}

- (int64_t)listLevel
{
  if (self->mListLevel <= 9) {
    return self->mListLevel;
  }
  else {
    return 8;
  }
}

- (double)listIndentForLevel:(int64_t)a3
{
  double result = 0.0;
  if ((a3 & 0x8000000000000000) == 0)
  {
    begin = self->mListTextIndents.__begin_;
    if (self->mListTextIndents.__end_ - begin > a3) {
      return begin[a3];
    }
  }
  return result;
}

- (void)setListIndent:(double)a3 forLevel:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    begin = self->mListTextIndents.__begin_;
    if (self->mListTextIndents.__end_ - begin > a4) {
      begin[a4] = a3;
    }
  }
}

- (void)startListOrdered:(BOOL)a3
{
  BOOL v3 = a3;
  ++self->mListLevel;
  self->mInList = 1;
  sub_1FCD9C(&self->mListOrdered.c.__map_.__first_, &v3);
}

- (void)stopList
{
  unint64_t value = self->mListOrdered.c.__size_.__value_;
  if (value)
  {
    self->mListOrdered.c.__size_.__value_ = value - 1;
    sub_1FD13C(&self->mListOrdered.c.__map_.__first_, 1);
  }
  int64_t mListLevel = self->mListLevel;
  self->int64_t mListLevel = mListLevel - 1;
  self->mInList = mListLevel > 0;
}

- (BOOL)orderedList
{
  unint64_t value = self->mListOrdered.c.__size_.__value_;
  return value
      && self->mInList
      && (*(BOOL **)((char *)self->mListOrdered.c.__map_.__begin_
                   + (((value + self->mListOrdered.c.__start_ - 1) >> 9) & 0x7FFFFFFFFFFFF8)))[(value
                                                                                                + self->mListOrdered.c.__start_
                                                                                                - 1) & 0xFFF];
}

- (void)addPageStartIndex
{
  id v3 = [(TSWPStorage *)self->mBodyStorage length];
  unint64_t v4 = (unint64_t)v3;
  end = self->mPageStartIndices.__end_;
  unint64_t value = self->mPageStartIndices.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->mPageStartIndices.__begin_;
    uint64_t v9 = end - begin;
    if ((unint64_t)(v9 + 1) >> 61) {
      sub_3D1D0();
    }
    unint64_t v10 = (char *)value - (char *)begin;
    unint64_t v11 = ((char *)value - (char *)begin) >> 2;
    if (v11 <= v9 + 1) {
      unint64_t v11 = v9 + 1;
    }
    if (v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_4374C((uint64_t)&self->mPageStartIndices.__end_cap_, v12);
      begin = self->mPageStartIndices.__begin_;
      end = self->mPageStartIndices.__end_;
    }
    else
    {
      uint64_t v13 = 0;
    }
    objc_super v14 = (unint64_t *)&v13[8 * v9];
    v15 = (unint64_t *)&v13[8 * v12];
    *objc_super v14 = v4;
    v7 = v14 + 1;
    while (end != begin)
    {
      unint64_t v16 = *--end;
      *--objc_super v14 = v16;
    }
    self->mPageStartIndices.__begin_ = v14;
    self->mPageStartIndices.__end_ = v7;
    self->mPageStartIndices.__end_cap_.__value_ = v15;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unint64_t *end = (unint64_t)v3;
    v7 = end + 1;
  }
  self->mPageStartIndices.__end_ = v7;
}

- (vector<unsigned)pageStartIndices
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)sub_1FD1AC(retstr, self->mPageStartIndices.__begin_, (uint64_t)self->mPageStartIndices.__end_, self->mPageStartIndices.__end_- self->mPageStartIndices.__begin_);
}

- (BOOL)hasHints
{
  return 0;
}

- (unint64_t)nextHintLocation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)nextHintShapeRef
{
  return 0;
}

- (id)hintsData
{
  return 0;
}

- (unint64_t)lastHintLocation
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)cacheCharacterPosition:(unint64_t)a3 forDrawableAnchorId:(id)a4
{
  mDrawableAnchorCache = self->mDrawableAnchorCache;
  objc_super v6 = +[NSNumber numberWithUnsignedInteger:a3];

  [(NSMutableDictionary *)mDrawableAnchorCache setObject:v6 forKey:a4];
}

- (unint64_t)characterPositionForDrawableAnchorId:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mDrawableAnchorCache objectForKey:a3];
  if (!v3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v3 unsignedIntegerValue];
}

- (id)displayValueForStyleSelector:(id)a3
{
  if (!a3) {
    return 0;
  }
  p_mDisplayValueCache = &self->mDisplayValueCache;
  id v5 = [a3 hash];
  id result = sub_1F8E90(p_mDisplayValueCache, (unint64_t *)&v5);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)setDisplayValue:(BOOL)a3 forStyleSelector:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    id v7 = [a4 hash];
    id v6 = [objc_alloc((Class)NSNumber) initWithBool:v4];
    v8 = &v7;
    sub_1FD26C((uint64_t)&self->mDisplayValueCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

- (int)whitespaceValueForStyleSelector:(id)a3
{
  if (!a3) {
    return 5;
  }
  p_mWhitespaceValueCache = &self->mWhitespaceValueCache;
  id v6 = [a3 hash];
  BOOL v4 = sub_1F8E90(p_mWhitespaceValueCache, (unint64_t *)&v6);
  if (v4) {
    return *((_DWORD *)v4 + 6);
  }
  else {
    return 5;
  }
}

- (void)setWhitespaceValue:(int)a3 forStyleSelector:(id)a4
{
  if (a4)
  {
    id v6 = [a4 hash];
    id v7 = &v6;
    *((_DWORD *)sub_1FD48C((uint64_t)&self->mWhitespaceValueCache, (unint64_t *)&v6, (uint64_t)&std::piecewise_construct, &v7)+ 6) = a3;
  }
}

- (id)sourceDrawableInfoForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  -[NSMutableDictionary objectForKey:](self->mSourceDrawableInfoForIdentifier, "objectForKey:");

  return (id)TSUProtocolCast();
}

- (void)setSourceDrawableInfo:(id)a3 forIdentifier:(id)a4
{
  if (a3 && a4 && [a4 length])
  {
    mSourceDrawableInfoForIdentifier = self->mSourceDrawableInfoForIdentifier;
    if (!mSourceDrawableInfoForIdentifier)
    {
      mSourceDrawableInfoForIdentifier = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->mSourceDrawableInfoForIdentifier = mSourceDrawableInfoForIdentifier;
    }
    [(NSMutableDictionary *)mSourceDrawableInfoForIdentifier setObject:a3 forKey:a4];
  }
}

- (PFXHtmlReaderState)readerState
{
  return self->mReaderState;
}

- (PFSStyleCache)styleCache
{
  return self->mStyleCache;
}

- (PFSPageCache)pageCache
{
  return self->mPageCache;
}

- (TSPObjectContext)objectContext
{
  return self->mObjectContext;
}

- (TSWPStorage)bodyStorage
{
  return self->mBodyStorage;
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (TSWPParagraphStyle)defaultParagraphStyle
{
  return self->mDefaultParagraphStyle;
}

- (TSWPListStyle)defaultNoneListStyle
{
  return self->mDefaultNoneListStyle;
}

- (int64_t)listStart
{
  return self->mListStart;
}

- (void)setListStart:(int64_t)a3
{
  self->mListStart = a3;
}

- (BOOL)inList
{
  return self->mInList;
}

- (NSMutableDictionary)drawableAttachmentCache
{
  return self->mDrawableAttachmentCache;
}

- (void).cxx_destruct
{
  begin = self->mPageStartIndices.__begin_;
  if (begin)
  {
    self->mPageStartIndices.__end_ = begin;
    operator delete(begin);
  }
  sub_1FCC2C(&self->mListOrdered.c.__map_.__first_);
  BOOL v4 = self->mListTextIndents.__begin_;
  if (v4)
  {
    self->mListTextIndents.__end_ = v4;
    operator delete(v4);
  }
  sub_1F94A8((uint64_t)&self->mWhitespaceValueCache);
  sub_1F94A8((uint64_t)&self->mDisplayValueCache);
  sub_1F94A8((uint64_t)&self->mParagraphStyleCache);

  sub_1F94A8((uint64_t)&self->mCharacterStyleCache);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 10) = 0u;
  *((_DWORD *)self + 44) = 1065353216;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  return self;
}

- (id)characterStyleForStyleSelector:(id)a3
{
  if (!a3) {
    return 0;
  }
  p_mCharacterStyleCache = &self->mCharacterStyleCache;
  id v5 = [a3 hash];
  id result = sub_1F8E90(p_mCharacterStyleCache, (unint64_t *)&v5);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)setCharacterStyle:(id)a3 forStyleSelector:(id)a4
{
  if (a4)
  {
    id v7 = [a4 hash];
    id v6 = a3;
    v8 = &v7;
    sub_1FD26C((uint64_t)&self->mCharacterStyleCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

- (id)paragraphStyleForStyleSelector:(id)a3
{
  if (!a3) {
    return 0;
  }
  p_mParagraphStyleCache = &self->mParagraphStyleCache;
  id v5 = [a3 hash];
  id result = sub_1F8E90(p_mParagraphStyleCache, (unint64_t *)&v5);
  if (result) {
    return (id)*((void *)result + 3);
  }
  return result;
}

- (void)setParagraphStyle:(id)a3 forStyleSelector:(id)a4
{
  if (a4)
  {
    id v7 = [a4 hash];
    id v6 = a3;
    v8 = &v7;
    sub_1FD26C((uint64_t)&self->mParagraphStyleCache, (unint64_t *)&v7, (uint64_t)&std::piecewise_construct, &v8)[3] = v6;
  }
}

@end
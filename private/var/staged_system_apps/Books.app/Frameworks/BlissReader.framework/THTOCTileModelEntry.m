@interface THTOCTileModelEntry
- (BOOL)includeInTOC;
- (NSString)displayPageNumber;
- (NSString)nodeGUID;
- (NSString)sectionIdentifier;
- (NSString)title;
- (THModelLink)modelLink;
- (THTOCTileModelEntry)init;
- (id)description;
- (id)displayPageNumberForPageIndex:(unint64_t)a3;
- (int)displayPageNumberFormat;
- (int64_t)displayPageNumberValue;
- (int64_t)indentLevel;
- (unint64_t)pageCount;
- (unint64_t)pageIndex;
- (void)dealloc;
- (void)setDisplayPageNumberFormat:(int)a3;
- (void)setDisplayPageNumberValue:(int64_t)a3;
- (void)setIncludeInTOC:(BOOL)a3;
- (void)setIndentLevel:(int64_t)a3;
- (void)setModelLink:(id)a3;
- (void)setNodeGUID:(id)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageIndex:(unint64_t)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation THTOCTileModelEntry

- (THTOCTileModelEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModelEntry;
  result = [(THTOCTileModelEntry *)&v3 init];
  if (result)
  {
    result->mPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    result->mDisplayPageNumberValue = 0x7FFFFFFFFFFFFFFFLL;
    result->mDisplayPageNumberFormat = 0;
  }
  return result;
}

- (void)dealloc
{
  [(THTOCTileModelEntry *)self setSectionIdentifier:0];
  [(THTOCTileModelEntry *)self setTitle:0];
  [(THTOCTileModelEntry *)self setNodeGUID:0];
  [(THTOCTileModelEntry *)self setModelLink:0];
  v3.receiver = self;
  v3.super_class = (Class)THTOCTileModelEntry;
  [(THTOCTileModelEntry *)&v3 dealloc];
}

- (id)displayPageNumberForPageIndex:(unint64_t)a3
{
  if (self->mDisplayPageNumberValue == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t)(self->mDisplayPageNumberValue + a3 - [(THTOCTileModelEntry *)self pageIndex]) < 1)
  {
    return 0;
  }

  return +[NSString stringForValue:withListNumberFormat:includeFormatting:](NSString, "stringForValue:withListNumberFormat:includeFormatting:");
}

- (NSString)displayPageNumber
{
  unint64_t v3 = [(THTOCTileModelEntry *)self pageIndex];

  return (NSString *)[(THTOCTileModelEntry *)self displayPageNumberForPageIndex:v3];
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(THTOCTileModelEntry *)self title];
  v6 = [(THTOCTileModelEntry *)self sectionIdentifier];
  v7 = +[NSNumber numberWithUnsignedInteger:[(THTOCTileModelEntry *)self pageIndex]];
  v8 = +[NSNumber numberWithUnsignedInteger:[(THTOCTileModelEntry *)self pageCount]];
  v9 = [(THTOCTileModelEntry *)self displayPageNumber];
  uint64_t v10 = [(THTOCTileModelEntry *)self displayPageNumberFormat];
  if ([(THTOCTileModelEntry *)self includeInTOC]) {
    CFStringRef v11 = @"YES";
  }
  else {
    CFStringRef v11 = @"NO";
  }
  return +[NSString stringWithFormat:@"<%@(%p) title=%@ section=%@ pageIndex=%@ pageCount=%@ displayPageNumber=%@ displayPageNumberFormat=%lu includeInToc=%@ modelLink=%@", v4, self, v5, v6, v7, v8, v9, v10, v11, [(THTOCTileModelEntry *)self modelLink]];
}

- (NSString)sectionIdentifier
{
  return self->mSectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSString)nodeGUID
{
  return self->mNodeGUID;
}

- (void)setNodeGUID:(id)a3
{
}

- (THModelLink)modelLink
{
  return self->mLink;
}

- (void)setModelLink:(id)a3
{
}

- (int64_t)indentLevel
{
  return self->mIndentLevel;
}

- (void)setIndentLevel:(int64_t)a3
{
  self->mIndentLevel = a3;
}

- (unint64_t)pageIndex
{
  return self->mPageIndex;
}

- (void)setPageIndex:(unint64_t)a3
{
  self->mPageIndex = a3;
}

- (unint64_t)pageCount
{
  return self->mPageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->mPageCount = a3;
}

- (int64_t)displayPageNumberValue
{
  return self->mDisplayPageNumberValue;
}

- (void)setDisplayPageNumberValue:(int64_t)a3
{
  self->mDisplayPageNumberValue = a3;
}

- (int)displayPageNumberFormat
{
  return self->mDisplayPageNumberFormat;
}

- (void)setDisplayPageNumberFormat:(int)a3
{
  self->mDisplayPageNumberFormat = a3;
}

- (BOOL)includeInTOC
{
  return self->mIncludeInTOC;
}

- (void)setIncludeInTOC:(BOOL)a3
{
  self->mIncludeInTOC = a3;
}

@end
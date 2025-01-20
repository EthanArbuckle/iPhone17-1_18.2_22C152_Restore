@interface THDisplayPageNumberMap
- (BOOL)assignedPageNumbers;
- (NSArray)displayPageNumberArray;
- (NSDictionary)absolutePageIndexArrayForDisplayPageNumberMap;
- (THDisplayPageNumberMap)init;
- (id)absolutePageIndexesForAltsOfAbsolutePageIndex:(unint64_t)a3;
- (id)absolutePageIndexesForDisplayPageNumber:(id)a3;
- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3;
- (id)preferredAbsolutePageIndexesForDisplayPageNumber:(id)a3;
- (unint64_t)absolutePageIndexForDisplayPageNumber:(id)a3;
- (void)buildDisplayPageMapsWithDocumentRoot:(id)a3;
- (void)clearDisplayPageMapsWithDocumentRoot:(id)a3;
- (void)dealloc;
- (void)setAbsolutePageIndexArrayForDisplayPageNumberMap:(id)a3;
- (void)setAssignedPageNumbers:(BOOL)a3;
- (void)setDisplayPageNumberArray:(id)a3;
@end

@implementation THDisplayPageNumberMap

- (THDisplayPageNumberMap)init
{
  v3.receiver = self;
  v3.super_class = (Class)THDisplayPageNumberMap;
  return [(THDisplayPageNumberMap *)&v3 init];
}

- (void)dealloc
{
  [(THDisplayPageNumberMap *)self setAbsolutePageIndexArrayForDisplayPageNumberMap:0];
  [(THDisplayPageNumberMap *)self setDisplayPageNumberArray:0];
  v3.receiver = self;
  v3.super_class = (Class)THDisplayPageNumberMap;
  [(THDisplayPageNumberMap *)&v3 dealloc];
}

- (void)clearDisplayPageMapsWithDocumentRoot:(id)a3
{
  if ([(THDisplayPageNumberMap *)self assignedPageNumbers])
  {
    [(THDisplayPageNumberMap *)self setAssignedPageNumbers:0];
    [(THDisplayPageNumberMap *)self setAbsolutePageIndexArrayForDisplayPageNumberMap:0];
    [(THDisplayPageNumberMap *)self setDisplayPageNumberArray:0];
  }
}

- (void)buildDisplayPageMapsWithDocumentRoot:(id)a3
{
  if (![(THDisplayPageNumberMap *)self assignedPageNumbers])
  {
    unint64_t v5 = (unint64_t)objc_msgSend(objc_msgSend(a3, "rootNode"), "pageCountForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(a3, "context")));
    if (v5 >> 6 <= 0xC34)
    {
      unint64_t v6 = v5;
      uint64_t v14 = 0;
      v15 = &v14;
      uint64_t v16 = 0x3052000000;
      v17 = sub_1223AC;
      v18 = sub_1223BC;
      id v19 = 0;
      id v19 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v5];
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x3052000000;
      v11 = sub_1223AC;
      v12 = sub_1223BC;
      v13 = 0;
      v13 = +[NSMutableArray arrayWithCapacity:v6];
      objc_opt_class();
      [a3 rootNode];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1223C8;
      v7[3] = &unk_459C10;
      v7[4] = &v14;
      v7[5] = &v8;
      [(id)TSUDynamicCast() enumerateSubtreeUsingBlock:v7];
      [(THDisplayPageNumberMap *)self setAbsolutePageIndexArrayForDisplayPageNumberMap:v15[5]];
      [(THDisplayPageNumberMap *)self setDisplayPageNumberArray:v9[5]];
      [(THDisplayPageNumberMap *)self setAssignedPageNumbers:1];
      _Block_object_dispose(&v8, 8);
      _Block_object_dispose(&v14, 8);
    }
  }
}

- (id)absolutePageIndexesForDisplayPageNumber:(id)a3
{
  v4 = [(THDisplayPageNumberMap *)self absolutePageIndexArrayForDisplayPageNumberMap];
  id v5 = [a3 lowercaseString];

  return [(NSDictionary *)v4 objectForKey:v5];
}

- (id)absolutePageIndexesForAltsOfAbsolutePageIndex:(unint64_t)a3
{
  int v3 = a3;
  if (![(THDisplayPageNumberMap *)self assignedPageNumbers]) {
    return 0;
  }
  id v5 = +[NSMutableSet set];
  uint64_t v6 = 0;
  uint64_t v7 = (v3 + 1);
  do
  {
    id v8 = +[NSString stringForValue:v7 withListNumberFormat:v6 includeFormatting:0];
    if (v8)
    {
      id v9 = [(THDisplayPageNumberMap *)self absolutePageIndexesForDisplayPageNumber:v8];
      if (v9) {
        [v5 addObjectsFromArray:v9];
      }
    }
    uint64_t v6 = (v6 + 1);
  }
  while (v6 != 14);
  if (!v5) {
    return 0;
  }

  return [v5 allObjects];
}

- (id)preferredAbsolutePageIndexesForDisplayPageNumber:(id)a3
{
  if (![(THDisplayPageNumberMap *)self assignedPageNumbers]) {
    return 0;
  }
  id v5 = [(THDisplayPageNumberMap *)self absolutePageIndexesForDisplayPageNumber:a3];
  if (v5)
  {
    uint64_t v6 = v5;
    if ([v5 count]) {
      return v6;
    }
  }
  int v7 = [a3 intValue];
  if (v7 < 1) {
    return 0;
  }

  return [(THDisplayPageNumberMap *)self absolutePageIndexesForAltsOfAbsolutePageIndex:v7 - 1];
}

- (unint64_t)absolutePageIndexForDisplayPageNumber:(id)a3
{
  if ([(THDisplayPageNumberMap *)self assignedPageNumbers]
    && (id v5 = -[THDisplayPageNumberMap preferredAbsolutePageIndexesForDisplayPageNumber:](self, "preferredAbsolutePageIndexesForDisplayPageNumber:", a3)) != 0&& (v6 = v5, [v5 count]))
  {
    return [v6 objectAtIndex:0].unsignedIntValue;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)displayPageNumberForAbsolutePageIndex:(unint64_t)a3
{
  unsigned int v5 = [(THDisplayPageNumberMap *)self assignedPageNumbers];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || !v5
    || [(NSArray *)[(THDisplayPageNumberMap *)self displayPageNumberArray] count] <= a3)
  {
    return 0;
  }
  uint64_t v6 = [(THDisplayPageNumberMap *)self displayPageNumberArray];

  return [(NSArray *)v6 objectAtIndex:a3];
}

- (NSDictionary)absolutePageIndexArrayForDisplayPageNumberMap
{
  return self->mAbsolutePageIndexArrayForDisplayPageNumberMap;
}

- (void)setAbsolutePageIndexArrayForDisplayPageNumberMap:(id)a3
{
}

- (NSArray)displayPageNumberArray
{
  return self->mDisplayPageNumberArray;
}

- (void)setDisplayPageNumberArray:(id)a3
{
}

- (BOOL)assignedPageNumbers
{
  return self->_assignedPageNumbers;
}

- (void)setAssignedPageNumbers:(BOOL)a3
{
  self->_assignedPageNumbers = a3;
}

@end
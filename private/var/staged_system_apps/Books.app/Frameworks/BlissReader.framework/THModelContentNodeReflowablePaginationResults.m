@interface THModelContentNodeReflowablePaginationResults
+ (BOOL)supportsSecureCoding;
- (NSMutableArray)pageHints;
- (NSMutableDictionary)storageUIDToPageIndex;
- (NSString)bodyStorageUID;
- (NSString)nodeGUID;
- (THModelContentNodeReflowablePaginationResults)init;
- (THModelContentNodeReflowablePaginationResults)initWithCoder:(id)a3;
- (THPresentationType)presentationType;
- (_NSRange)hintRangeForRelativePageIndex:(unint64_t)a3;
- (unint64_t)firstPageIndex;
- (unint64_t)firstPageIndexIntersectingRange:(_NSRange)a3;
- (unint64_t)pageCount;
- (unint64_t)relativePageIndexForStorageAnchor:(id)a3;
- (void)assignRelativePageIndex:(unint64_t)a3 toStorageUID:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBodyStorageUID:(id)a3;
- (void)setFirstPageIndex:(unint64_t)a3;
- (void)setNodeGUID:(id)a3;
- (void)setPageCount:(unint64_t)a3;
- (void)setPageHints:(id)a3;
- (void)setPresentationType:(id)a3;
- (void)setStorageUIDToPageIndex:(id)a3;
@end

@implementation THModelContentNodeReflowablePaginationResults

- (THModelContentNodeReflowablePaginationResults)init
{
  v5.receiver = self;
  v5.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  v2 = [(THModelContentNodeReflowablePaginationResults *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_firstPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v2->_storageUIDToPageIndex = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)dealloc
{
  self->_storageUIDToPageIndex = 0;
  self->_bodyStorageUID = 0;

  self->_pageHints = 0;
  self->_presentationType = 0;

  self->_nodeGUID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  [(THModelContentNodeReflowablePaginationResults *)&v3 dealloc];
}

- (unint64_t)firstPageIndexIntersectingRange:(_NSRange)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1230D0;
  v4[3] = &unk_459C30;
  _NSRange v5 = a3;
  return (unint64_t)[(NSMutableArray *)[(THModelContentNodeReflowablePaginationResults *)self pageHints] indexOfObjectPassingTest:v4];
}

- (unint64_t)relativePageIndexForStorageAnchor:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "storageUID"), "isEqualToString:", -[THModelContentNodeReflowablePaginationResults bodyStorageUID](self, "bodyStorageUID")))
  {
    id v6 = [a3 range];
    if (v5 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    return -[THModelContentNodeReflowablePaginationResults firstPageIndexIntersectingRange:](self, "firstPageIndexIntersectingRange:", v6, v7);
  }
  else if ([a3 storageUID] {
         && (id v9 = -[NSMutableDictionary objectForKey:](-[THModelContentNodeReflowablePaginationResults storageUIDToPageIndex](self, "storageUIDToPageIndex"), "objectForKey:", [a3 storageUID])) != 0)
  }
  {
    return (unint64_t)[v9 integerValue];
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)assignRelativePageIndex:(unint64_t)a3 toStorageUID:(id)a4
{
  id v6 = [(THModelContentNodeReflowablePaginationResults *)self storageUIDToPageIndex];
  uint64_t v7 = +[NSNumber numberWithInteger:a3];

  [(NSMutableDictionary *)v6 setValue:v7 forKey:a4];
}

- (_NSRange)hintRangeForRelativePageIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)[(THModelContentNodeReflowablePaginationResults *)self pageHints] count] <= a3)id v5 = 0; {
  else
  }
    id v5 = [(NSMutableArray *)[(THModelContentNodeReflowablePaginationResults *)self pageHints] objectAtIndex:a3];

  id v6 = [v5 range];
  result.length = v7;
  result.location = (NSUInteger)v6;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (THModelContentNodeReflowablePaginationResults)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)THModelContentNodeReflowablePaginationResults;
  v4 = [(THModelContentNodeReflowablePaginationResults *)&v10 init];
  if (v4)
  {
    v4->_nodeGUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"nodeGUID"), "copy");
    v4->_pageCount = (unint64_t)[a3 decodeIntegerForKey:@"pageCount"];
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    v4->_pageHints = (NSMutableArray *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0), @"pageHints"), "mutableCopy");
    v4->_presentationType = (THPresentationType *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"presentationType"];
    v4->_bodyStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"bodyStorageUID"), "copy");
    v4->_firstPageIndex = (unint64_t)[a3 decodeIntegerForKey:@"firstPageIndex"];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v4->_storageUIDToPageIndex = (NSMutableDictionary *)objc_msgSend(objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0), @"storageUIDToPageIndex"), "mutableCopy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:[self nodeGUID] forKey:@"nodeGUID"];
  [a3 encodeInteger:[self pageCount] forKey:@"pageCount"];
  [a3 encodeObject:[self pageHints] forKey:@"pageHints"];
  [a3 encodeObject:[self presentationType] forKey:@"presentationType"];
  [a3 encodeObject:[self bodyStorageUID] forKey:@"bodyStorageUID"];
  [a3 encodeInteger:[self firstPageIndex] forKey:@"firstPageIndex"];
  id v5 = [(NSMutableDictionary *)[(THModelContentNodeReflowablePaginationResults *)self storageUIDToPageIndex] copy];
  [a3 encodeObject:v5 forKey:@"storageUIDToPageIndex"];
}

- (unint64_t)firstPageIndex
{
  return self->_firstPageIndex;
}

- (void)setFirstPageIndex:(unint64_t)a3
{
  self->_firstPageIndex = a3;
}

- (NSString)nodeGUID
{
  return self->_nodeGUID;
}

- (void)setNodeGUID:(id)a3
{
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(unint64_t)a3
{
  self->_pageCount = a3;
}

- (NSMutableArray)pageHints
{
  return self->_pageHints;
}

- (void)setPageHints:(id)a3
{
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
}

- (NSString)bodyStorageUID
{
  return self->_bodyStorageUID;
}

- (void)setBodyStorageUID:(id)a3
{
}

- (NSMutableDictionary)storageUIDToPageIndex
{
  return self->_storageUIDToPageIndex;
}

- (void)setStorageUIDToPageIndex:(id)a3
{
}

@end
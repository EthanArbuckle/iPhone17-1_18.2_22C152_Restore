@interface THModelStorageAnchor
+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 pageLocation:(id)a4;
+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5;
+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5;
+ (THModelStorageAnchor)storageAnchorWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5;
- (NSString)storageUID;
- (THModelStorageAnchor)initWithContentNode:(id)a3 pageLocation:(id)a4;
- (THModelStorageAnchor)initWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5;
- (THModelStorageAnchor)initWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5;
- (THModelStorageAnchor)initWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5;
- (THWPStorage)storage;
- (_NSRange)range;
- (id)description;
- (unint64_t)absolutePageIndex;
- (unint64_t)nodeRelativePageIndex;
- (void)dealloc;
- (void)setAbsolutePageIndex:(unint64_t)a3;
- (void)setNodeRelativePageIndex:(unint64_t)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStorageUID:(id)a3;
@end

@implementation THModelStorageAnchor

- (THModelStorageAnchor)initWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)THModelStorageAnchor;
  v8 = [(THModelBoundAnchor *)&v11 initWithContentNode:a3];
  v9 = v8;
  if (v8)
  {
    [(THModelStorageAnchor *)v8 setStorageUID:a4];
    -[THModelStorageAnchor setRange:](v9, "setRange:", location, length);
    [(THModelStorageAnchor *)v9 setNodeRelativePageIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v9;
}

- (THModelStorageAnchor)initWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v11.receiver = self;
  v11.super_class = (Class)THModelStorageAnchor;
  v8 = [(THModelBoundAnchor *)&v11 initWithGlossaryEntry:a3];
  v9 = v8;
  if (v8)
  {
    [(THModelStorageAnchor *)v8 setStorageUID:a4];
    -[THModelStorageAnchor setRange:](v9, "setRange:", location, length);
    [(THModelStorageAnchor *)v9 setNodeRelativePageIndex:0x7FFFFFFFFFFFFFFFLL];
  }
  return v9;
}

- (THModelStorageAnchor)initWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = [a3 nodeUniqueIDForInfo:a4];
  if (v8)
  {
    id v9 = v8;
    id v10 = objc_alloc((Class)objc_opt_class());
    return (THModelStorageAnchor *)[v10 initWithContentNode:a3 storageUID:v9 range:location length];
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[THModelStorageAnchor initWithContentNode:storage:range:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THModelStorageAnchor.m"] lineNumber:45 description:@"invalid nil value for '%s'", "storageUID"];
    return 0;
  }
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  id v5 = [objc_alloc((Class)objc_opt_class()) initWithContentNode:a3 storage:a4 range:a5.location, a5.length];

  return (THModelStorageAnchor *)v5;
}

- (THModelStorageAnchor)initWithContentNode:(id)a3 pageLocation:(id)a4
{
  id v7 = [a4 storageUID];
  id v9 = [a4 range];

  return -[THModelStorageAnchor initWithContentNode:storageUID:range:](self, "initWithContentNode:storageUID:range:", a3, v7, v9, v8);
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 pageLocation:(id)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithContentNode:a3 pageLocation:a4];

  return (THModelStorageAnchor *)v4;
}

- (void)dealloc
{
  [(THModelStorageAnchor *)self setStorageUID:0];
  v3.receiver = self;
  v3.super_class = (Class)THModelStorageAnchor;
  [(THModelBoundAnchor *)&v3 dealloc];
}

+ (THModelStorageAnchor)storageAnchorWithContentNode:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  id v5 = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", a3, a4, a5.location, a5.length);

  return v5;
}

+ (THModelStorageAnchor)storageAnchorWithGlossaryEntry:(id)a3 storageUID:(id)a4 range:(_NSRange)a5
{
  id v5 = -[THModelStorageAnchor initWithGlossaryEntry:storageUID:range:]([THModelStorageAnchor alloc], "initWithGlossaryEntry:storageUID:range:", a3, a4, a5.location, a5.length);

  return v5;
}

- (void)setAbsolutePageIndex:(unint64_t)a3
{
  id v5 = [(THModelBoundAnchor *)self contentNode];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v5) {
    [(THModelNode *)[(THModelBoundAnchor *)self contentNode] relativePageIndexForAbsolutePageIndex:a3 forPresentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)[(THModelBoundAnchor *)self contentNode] context]]];
  }

  -[THModelStorageAnchor setNodeRelativePageIndex:](self, "setNodeRelativePageIndex:");
}

- (unint64_t)absolutePageIndex
{
  if (![(THModelBoundAnchor *)self contentNode]
    || [(THModelStorageAnchor *)self nodeRelativePageIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = [(THModelBoundAnchor *)self contentNode];
  unint64_t v5 = [(THModelStorageAnchor *)self nodeRelativePageIndex];
  id v6 = +[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)[(THModelBoundAnchor *)self contentNode] context]];

  return [(THModelNode *)v4 absolutePageIndexForRelativePageIndex:v5 forPresentationType:v6];
}

- (THWPStorage)storage
{
  objc_opt_class();
  [(THModelContentNode *)[(THModelBoundAnchor *)self contentNode] infoForNodeUniqueID:[(THModelStorageAnchor *)self storageUID] forPresentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)[(THModelBoundAnchor *)self contentNode] context]]];

  return (THWPStorage *)TSUDynamicCast();
}

- (id)description
{
  unint64_t v3 = [(THModelStorageAnchor *)self absolutePageIndex];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    CFStringRef v4 = @"?";
  }
  else {
    CFStringRef v4 = +[NSString stringWithFormat:@"%lu", v3];
  }
  if ([(THModelBoundAnchor *)self glossaryEntry]) {
    CFStringRef v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"glossary:'%@'; ",
  }
           [(THModelGlossaryEntry *)[(THModelBoundAnchor *)self glossaryEntry] normalizedTerm]);
  else {
    CFStringRef v5 = &stru_46D7E8;
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"anchor<%@pgi=%@; %@ @(%u,%u)>",
           v5,
           v4,
           self->mStorageUID,
           self->mRange.location,
           self->mRange.length);
}

- (NSString)storageUID
{
  return self->mStorageUID;
}

- (void)setStorageUID:(id)a3
{
}

- (_NSRange)range
{
  p_mRange = &self->mRange;
  NSUInteger location = self->mRange.location;
  NSUInteger length = p_mRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->mRange = a3;
}

- (unint64_t)nodeRelativePageIndex
{
  return self->mNodeRelativePageIndex;
}

- (void)setNodeRelativePageIndex:(unint64_t)a3
{
  self->mNodeRelativePageIndex = a3;
}

@end
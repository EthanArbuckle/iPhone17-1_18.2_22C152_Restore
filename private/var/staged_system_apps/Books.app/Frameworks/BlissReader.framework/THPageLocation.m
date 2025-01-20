@interface THPageLocation
+ (id)pageLocationWithAnnotation:(id)a3;
+ (id)pageLocationWithStorageAnchor:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)contentNodeGUID;
- (NSString)description;
- (NSString)storageUID;
- (THPageLocation)init;
- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3;
- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3 range:(_NSRange)a4 storageUID:(id)a5 contentNodeGUID:(id)a6;
- (THPageLocation)initWithDictionaryRepresentation:(id)a3;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)stringValue;
- (unint64_t)absolutePhysicalPageIndex;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3;
- (void)setContentNodeGUID:(id)a3;
- (void)setRange:(_NSRange)a3;
- (void)setStorageUID:(id)a3;
@end

@implementation THPageLocation

- (THPageLocation)init
{
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLocation init]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLocation.m") lineNumber:27 description:@"Initializing without specifying a page index"];

  return [(THPageLocation *)self initWithAbsolutePageIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3
{
  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](self, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", a3, NSInvalidRange[0], NSInvalidRange[1], 0, 0);
}

- (THPageLocation)initWithAbsolutePageIndex:(unint64_t)a3 range:(_NSRange)a4 storageUID:(id)a5 contentNodeGUID:(id)a6
{
  id length = (id)a4.length;
  id location = (id)a4.location;
  v14.receiver = self;
  v14.super_class = (Class)THPageLocation;
  v11 = [(THPageLocation *)&v14 init];
  if (v11)
  {
    if (a3 && a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (![a5 length]
        || (NSInvalidRange[0] == location ? (BOOL v12 = NSInvalidRange[1] == length) : (BOOL v12 = 0), v12))
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLocation.m") lineNumber:41 description:@"Required info missing."];
      }
    }
    [(THPageLocation *)v11 setAbsolutePhysicalPageIndex:a3];
    -[THPageLocation setRange:](v11, "setRange:", location, length);
    [(THPageLocation *)v11 setStorageUID:a5];
    [(THPageLocation *)v11 setContentNodeGUID:a6];
  }
  return v11;
}

+ (id)pageLocationWithAnnotation:(id)a3
{
  v4 = [THPageLocation alloc];
  id v5 = [a3 annotationAbsolutePhysicalPageIndex];
  id v6 = [a3 annotationStorageRange];
  v8 = -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v4, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v5, v6, v7, [a3 annotationStorageUID], [a3 annotationContentNodeID]);

  return v8;
}

+ (id)pageLocationWithStorageAnchor:(id)a3
{
  v4 = [THPageLocation alloc];
  id v5 = [a3 absolutePageIndex];
  id v6 = [a3 range];
  v8 = -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](v4, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v5, v6, v7, [a3 storageUID], objc_msgSend(objc_msgSend(a3, "contentNode"), "nodeGUID"));

  return v8;
}

- (void)dealloc
{
  [(THPageLocation *)self setStorageUID:0];
  [(THPageLocation *)self setContentNodeGUID:0];
  v3.receiver = self;
  v3.super_class = (Class)THPageLocation;
  [(THPageLocation *)&v3 dealloc];
}

- (NSString)description
{
  unint64_t v3 = [(THPageLocation *)self absolutePhysicalPageIndex];
  v4 = [(THPageLocation *)self storageUID];
  if ([(THPageLocation *)self range] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v5 = @"--";
  }
  else
  {
    v7.id location = (NSUInteger)[(THPageLocation *)self range];
    CFStringRef v5 = (const __CFString *)NSStringFromRange(v7);
  }
  return +[NSString stringWithFormat:@"<pg %lu (%@,%@) [%p]>", v3, v4, v5, self];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    uint64_t v21 = v4;
    uint64_t v22 = v3;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!objc_msgSend(objc_msgSend(a3, "storageUID"), "length")
        || ![(NSString *)[(THPageLocation *)self storageUID] length]
        || (v11 = -[NSString isEqualToString:](-[THPageLocation storageUID](self, "storageUID"), "isEqualToString:", [a3 storageUID]))&& (id v12 = -[THPageLocation range](self, "range"), v14 = v13, v16 = objc_msgSend(a3, "range"), LOBYTE(v11) = 0, v12 == v16)&& v14 == v15)
      {
        id v17 = [(THPageLocation *)self absolutePhysicalPageIndex];
        LOBYTE(v11) = v17 == [a3 absolutePhysicalPageIndex];
      }
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(THPageLocation *)self absolutePhysicalPageIndex];
  if ([(THPageLocation *)self storageUID])
  {
    NSUInteger v4 = [(NSString *)[(THPageLocation *)self storageUID] hash];
    v6.id location = (NSUInteger)[(THPageLocation *)self range];
    v3 &= v4 & [NSStringFromRange(v6) hash];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  unint64_t v5 = [(THPageLocation *)self absolutePhysicalPageIndex];
  id v6 = [(THPageLocation *)self range];
  uint64_t v8 = v7;
  v9 = [(THPageLocation *)self storageUID];
  v10 = [(THPageLocation *)self contentNodeGUID];

  return [v4 initWithAbsolutePageIndex:v5 range:v6 storageUID:v8 contentNodeGUID:v9];
}

- (THPageLocation)initWithDictionaryRepresentation:(id)a3
{
  objc_opt_class();
  [a3 objectForKey:@"pageIndex"];
  unint64_t v5 = (void *)TSUDynamicCast();
  if (v5) {
    uint64_t v6 = (uint64_t)[v5 unsignedIntegerValue];
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_opt_class();
  [a3 objectForKey:@"range"];
  uint64_t v7 = (NSString *)TSUDynamicCast();
  if (v7)
  {
    NSRange v8 = NSRangeFromString(v7);
    NSUInteger location = v8.location;
    NSUInteger length = v8.length;
  }
  else
  {
    NSUInteger length = 0;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_opt_class();
  [a3 objectForKey:@"storage"];
  uint64_t v11 = TSUDynamicCast();
  objc_opt_class();
  [a3 objectForKey:@"nodeGUID"];
  uint64_t v12 = TSUDynamicCast();

  return -[THPageLocation initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:](self, "initWithAbsolutePageIndex:range:storageUID:contentNodeGUID:", v6, location, length, v11, v12);
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  [v3 setObject:[NSNumber numberWithUnsignedInteger:self->_absolutePhysicalPageIndex] forKey:@"pageIndex"];
  [v3 setObject:NSStringFromRange(self->_range) forKey:@"range"];
  storageUID = self->_storageUID;
  if (storageUID) {
    [v3 setObject:storageUID forKey:@"storage"];
  }
  contentNodeGUID = self->_contentNodeGUID;
  if (contentNodeGUID) {
    [v3 setObject:contentNodeGUID forKeyedSubscript:@"nodeGUID"];
  }
  return v3;
}

- (id)stringValue
{
  unint64_t v3 = [(THPageLocation *)self absolutePhysicalPageIndex];
  id v4 = [(THPageLocation *)self storageUID];
  if ([(THPageLocation *)self range] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    CFStringRef v5 = @"--";
  }
  else
  {
    v7.NSUInteger location = (NSUInteger)[(THPageLocation *)self range];
    CFStringRef v5 = (const __CFString *)NSStringFromRange(v7);
  }
  return +[NSString stringWithFormat:@"<pg %lu (%@,%@) >", v3, v4, v5];
}

- (unint64_t)absolutePhysicalPageIndex
{
  return self->_absolutePhysicalPageIndex;
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3
{
  self->_absolutePhysicalPageIndex = a3;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)storageUID
{
  return self->_storageUID;
}

- (void)setStorageUID:(id)a3
{
}

- (NSString)contentNodeGUID
{
  return self->_contentNodeGUID;
}

- (void)setContentNodeGUID:(id)a3
{
}

@end
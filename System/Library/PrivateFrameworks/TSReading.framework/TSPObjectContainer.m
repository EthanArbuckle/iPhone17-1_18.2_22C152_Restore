@interface TSPObjectContainer
+ (int64_t)objectIdentifierForPackageIdentifier:(unsigned __int8)a3;
- (BOOL)shouldDelayArchiving;
- (TSPObjectContainer)initWithContext:(id)a3;
- (TSPObjectContainer)initWithContext:(id)a3 packageIdentifier:(unsigned __int8)a4;
- (id)packageLocator;
- (int64_t)tsp_identifier;
- (unsigned)delayedArchivingPriority;
- (void)prepareForComponentWriteWithDelayedObjects:(id)a3;
@end

@implementation TSPObjectContainer

- (TSPObjectContainer)initWithContext:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x263F7C7F0] currentHandler];
  v5 = [NSString stringWithUTF8String:"-[TSPObjectContainer initWithContext:]"];
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:25 description:@"Do not call method"];

  v7 = (void *)MEMORY[0x263EFF940];
  v8 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPObjectContainer initWithContext:]"];
  id v9 = [v7 exceptionWithName:*MEMORY[0x263EFF498] reason:v8 userInfo:0];

  objc_exception_throw(v9);
}

- (TSPObjectContainer)initWithContext:(id)a3 packageIdentifier:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (!v4)
  {
    v7 = [MEMORY[0x263F7C7F0] currentHandler];
    v8 = [NSString stringWithUTF8String:"-[TSPObjectContainer initWithContext:packageIdentifier:]"];
    id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm"];
    [v7 handleFailureInFunction:v8 file:v9 lineNumber:30 description:@"Unexpected package identifier."];
  }
  v13.receiver = self;
  v13.super_class = (Class)TSPObjectContainer;
  v10 = [(TSPObject *)&v13 initWithContext:v6];
  v11 = v10;
  if (v10) {
    v10->_packageIdentifier = v4;
  }

  return v11;
}

+ (int64_t)objectIdentifierForPackageIdentifier:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    id v3 = &UnsafePointer;
    return *v3;
  }
  if (a3 == 1)
  {
    id v3 = &UnsafePointer;
    return *v3;
  }
  return 0;
}

- (int64_t)tsp_identifier
{
  int64_t result = [(id)objc_opt_class() objectIdentifierForPackageIdentifier:self->_packageIdentifier];
  if (!result)
  {
    int v4 = [MEMORY[0x263F7C7F0] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[TSPObjectContainer tsp_identifier]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 100, @"Unexpected package identifier: %d", self->_packageIdentifier);

    v7.receiver = self;
    v7.super_class = (Class)TSPObjectContainer;
    return [(TSPObject *)&v7 tsp_identifier];
  }
  return result;
}

- (id)packageLocator
{
  return @"ObjectContainer";
}

- (BOOL)shouldDelayArchiving
{
  return 1;
}

- (unsigned)delayedArchivingPriority
{
  return -1;
}

- (void)prepareForComponentWriteWithDelayedObjects:(id)a3
{
  id v9 = a3;
  if (self->_childObjects)
  {
    int v4 = [MEMORY[0x263F7C7F0] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[TSPObjectContainer prepareForComponentWriteWithDelayedObjects:]"];
    id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContainer.mm"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 124, @"expected nil value for '%s'", "_childObjects");
  }
  objc_super v7 = (NSArray *)[v9 copy];
  childObjects = self->_childObjects;
  self->_childObjects = v7;
}

- (void).cxx_destruct
{
}

@end
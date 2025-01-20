@interface TSPObject
+ (BOOL)tsp_isTransientObjectIdentifier:(int64_t)a3;
- (BOOL)allowsDuplicatesOutsideOfDocumentPackage;
- (BOOL)allowsImplicitComponentOwnership;
- (BOOL)dirtiesDocumentPackage;
- (BOOL)isCommandObject;
- (BOOL)isComponentRoot;
- (BOOL)needsArchiving;
- (BOOL)shouldDelayArchiving;
- (BOOL)storeOutsideObjectArchive;
- (NSString)packageLocator;
- (TSPObject)componentRootObject;
- (TSPObject)init;
- (TSPObject)initWithContext:(id)a3;
- (TSPObjectContext)context;
- (TSPObjectDelegate)tsp_delegate;
- (TSPUnknownContent)tsp_unknownContent;
- (id)documentRoot;
- (id)initDocumentObjectWithContext:(id)a3;
- (int64_t)tsp_identifier;
- (int64_t)tsp_modifyObjectToken;
- (int64_t)tsp_unarchiverIdentifier;
- (unsigned)delayedArchivingPriority;
- (void)didFinishUnarchiving;
- (void)setTsp_delegate:(id)a3;
- (void)setTsp_identifier:(int64_t)a3;
- (void)setTsp_modifyObjectToken:(int64_t)a3;
@end

@implementation TSPObject

- (TSPObjectContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = [WeakRetained context];

  return (TSPObjectContext *)v3;
}

- (TSPObject)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSPObject;
  v5 = [(TSPObject *)&v9 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_modifyObjectToken = [v4 modifyObjectTokenForNewObject];
  }
  return v6;
}

- (TSPObject)init
{
  v2 = [MEMORY[0x263F7C7F0] currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSPObject init]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObject.mm"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:54 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPObject init]"];
  id v7 = [v5 exceptionWithName:*MEMORY[0x263EFF498] reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (id)initDocumentObjectWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(TSPObject *)self initWithContext:v4];
  if (v5) {
    [v4 setDocumentObject:v5];
  }

  return v5;
}

- (NSString)packageLocator
{
  return 0;
}

- (BOOL)isComponentRoot
{
  v3 = [(TSPObject *)self packageLocator];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = self->_identifier == 1;
  }

  return v4;
}

- (BOOL)storeOutsideObjectArchive
{
  return 0;
}

- (TSPObject)componentRootObject
{
  return 0;
}

- (BOOL)allowsImplicitComponentOwnership
{
  return 1;
}

- (BOOL)shouldDelayArchiving
{
  return 0;
}

- (unsigned)delayedArchivingPriority
{
  return 500;
}

- (BOOL)isCommandObject
{
  return 0;
}

- (BOOL)allowsDuplicatesOutsideOfDocumentPackage
{
  return 0;
}

- (BOOL)dirtiesDocumentPackage
{
  return 1;
}

- (void)didFinishUnarchiving
{
  self->_unarchiverIdentifier = 0;
}

- (int64_t)tsp_identifier
{
  int64_t result = self->_identifier;
  if (!result)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unint64_t v5 = [WeakRetained newObjectIdentifier];

    uint64_t v6 = 0;
    atomic_compare_exchange_strong(&self->_identifier, (unint64_t *)&v6, v5);
    return self->_identifier;
  }
  return result;
}

+ (BOOL)tsp_isTransientObjectIdentifier:(int64_t)a3
{
  return a3 == 2 || a3 == 52 || a3 == 51 || a3 == 61 || a3 == 62;
}

- (BOOL)needsArchiving
{
  return 0;
}

- (void)setTsp_identifier:(int64_t)a3
{
  self->_identifier = a3;
}

- (int64_t)tsp_unarchiverIdentifier
{
  return self->_unarchiverIdentifier;
}

- (TSPUnknownContent)tsp_unknownContent
{
  return self->_unknownContent;
}

- (int64_t)tsp_modifyObjectToken
{
  return self->_modifyObjectToken;
}

- (void)setTsp_modifyObjectToken:(int64_t)a3
{
  self->_modifyObjectToken = a3;
}

- (TSPObjectDelegate)tsp_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSPObjectDelegate *)WeakRetained;
}

- (void)setTsp_delegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_unknownContent, 0);
}

- (id)documentRoot
{
  v2 = [(TSPObject *)self context];

  return [(TSPObjectContext *)v2 documentRoot];
}

@end
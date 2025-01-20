@interface TSPLazyReference
+ (id)referenceForObject:(id)a3;
- (BOOL)discardStrongObjectIfPossible;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLazyReference:(id)a3;
- (BOOL)isWeak;
- (BOOL)referencesObject:(id)a3;
- (TSPComponent)component;
- (TSPLazyReference)init;
- (TSPLazyReference)initWithDelegate:(id)a3 identifier:(int64_t)a4 isWeak:(BOOL)a5 allowUnknownObject:(BOOL)a6;
- (TSPLazyReference)initWithTSPObject:(id)a3;
- (TSPLazyReferenceDelegate)delegate;
- (TSPObject)strongObject;
- (TSPObject)weakObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)object;
- (id)objectIfLoaded;
- (int64_t)identifier;
- (unint64_t)hash;
- (void)resetIdentifier;
- (void)setComponent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsWeak:(BOOL)a3;
- (void)setStrongObject:(id)a3;
@end

@implementation TSPLazyReference

+ (id)referenceForObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTSPObject:v4];

  return v5;
}

- (TSPLazyReference)init
{
  v2 = [MEMORY[0x263F7C7F0] currentHandler];
  v3 = [NSString stringWithUTF8String:"-[TSPLazyReference init]"];
  id v4 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm"];
  [v2 handleFailureInFunction:v3 file:v4 lineNumber:39 description:@"Do not call method"];

  v5 = (void *)MEMORY[0x263EFF940];
  v6 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[TSPLazyReference init]"];
  id v7 = [v5 exceptionWithName:*MEMORY[0x263EFF498] reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (TSPLazyReference)initWithDelegate:(id)a3 identifier:(int64_t)a4 isWeak:(BOOL)a5 allowUnknownObject:(BOOL)a6
{
  id v10 = a3;
  if (!v10)
  {
    v11 = [MEMORY[0x263F7C7F0] currentHandler];
    v12 = [NSString stringWithUTF8String:"-[TSPLazyReference initWithDelegate:identifier:isWeak:allowUnknownObject:]"];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 44, @"invalid nil value for '%s'", "delegate");
  }
  v17.receiver = self;
  v17.super_class = (Class)TSPLazyReference;
  v14 = [(TSPLazyReference *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v10);
    v15->_identifier = a4;
    v15->_isWeak = a5;
    v15->_allowUnknownObject = a6;
  }

  return v15;
}

- (TSPLazyReference)initWithTSPObject:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 context];
    uint64_t v8 = objc_msgSend(v6, "tsp_identifier");
    objc_opt_class();
    v9 = [(TSPLazyReference *)self initWithDelegate:v7 identifier:v8 isWeak:0 allowUnknownObject:objc_opt_isKindOfClass() & 1];

    if (v9)
    {
      objc_storeStrong((id *)&v9->_strongObject, a3);
      objc_storeWeak((id *)&v9->_weakObject, v6);
    }
    self = v9;
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)object
{
  strongObject = self->_strongObject;
  if (strongObject) {
    WeakRetained = strongObject;
  }
  else {
    WeakRetained = (TSPObject *)objc_loadWeakRetained((id *)&self->_weakObject);
  }

  return WeakRetained;
}

- (id)objectIfLoaded
{
  strongObject = self->_strongObject;
  if (strongObject)
  {
    WeakRetained = strongObject;
  }
  else
  {
    p_weakObject = &self->_weakObject;
    WeakRetained = (TSPObject *)objc_loadWeakRetained((id *)&self->_weakObject);
    if (!WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      WeakRetained = [v6 objectForIdentifier:self->_identifier];

      if (WeakRetained) {
        objc_storeWeak((id *)p_weakObject, WeakRetained);
      }
    }
  }

  return WeakRetained;
}

- (unint64_t)hash
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v5 = [(TSPLazyReference *)self isEqualToLazyReference:v4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSPLazyReference;
    unsigned __int8 v5 = [(TSPLazyReference *)&v8 isEqual:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isEqualToLazyReference:(id)a3
{
  int64_t identifier = self->_identifier;
  return identifier == [a3 identifier];
}

- (BOOL)referencesObject:(id)a3
{
  int64_t identifier = self->_identifier;
  return identifier == objc_msgSend(a3, "tsp_identifier");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v6 = [+[TSPLazyReference allocWithZone:a3] initWithDelegate:WeakRetained identifier:self->_identifier isWeak:self->_isWeak allowUnknownObject:self->_allowUnknownObject];
  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_component);
    objc_storeWeak((id *)&v6->_component, v7);

    objc_storeStrong((id *)&v6->_strongObject, self->_strongObject);
    id v8 = objc_loadWeakRetained((id *)&self->_weakObject);
    objc_storeWeak((id *)&v6->_weakObject, v8);

    if (objc_opt_respondsToSelector()) {
      [WeakRetained lazyReference:self didCreateCopy:v6];
    }
  }

  return v6;
}

- (TSPObject)weakObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakObject);

  return (TSPObject *)WeakRetained;
}

- (TSPObject)strongObject
{
  return self->_strongObject;
}

- (void)setStrongObject:(id)a3
{
  id obj = a3;
  if (!self->_allowUnknownObject)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (!self->_isWeak) {
        TSULogErrorInFunction();
      }

      id obj = 0;
    }
  }
  if (!self->_isWeak) {
    objc_storeStrong((id *)&self->_strongObject, obj);
  }
  objc_storeWeak((id *)&self->_weakObject, obj);
}

- (void)setIsWeak:(BOOL)a3
{
  self->_isWeak = a3;
}

- (BOOL)discardStrongObjectIfPossible
{
  return self->_strongObject == 0;
}

- (void)resetIdentifier
{
  v3 = [(TSPLazyReference *)self weakObject];
  id v7 = v3;
  if (v3)
  {
    self->_int64_t identifier = objc_msgSend(v3, "tsp_identifier");
  }
  else
  {
    id v4 = [MEMORY[0x263F7C7F0] currentHandler];
    unsigned __int8 v5 = [NSString stringWithUTF8String:"-[TSPLazyReference resetIdentifier]"];
    BOOL v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPLazyReference.mm"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:256 description:@"You should not reset the lazy reference's identifier when its object isn't loaded in memory."];
  }
}

- (id)debugDescription
{
  v3 = [(TSPLazyReference *)self weakObject];
  id v4 = NSString;
  if (v3)
  {
    v11.receiver = self;
    v11.super_class = (Class)TSPLazyReference;
    unsigned __int8 v5 = [(TSPLazyReference *)&v11 debugDescription];
    BOOL v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    objc_msgSend(v4, "stringWithFormat:", @"%@; object class: %@; identifier: %qu",
      v5,
      v7,
    id v8 = objc_msgSend(v3, "tsp_identifier"));
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSPLazyReference;
    unsigned __int8 v5 = [(TSPLazyReference *)&v10 debugDescription];
    objc_msgSend(v4, "stringWithFormat:", @"%@; unloaded object identifier: %qu",
      v5,
    id v8 = [(TSPLazyReference *)self identifier]);
  }

  return v8;
}

- (TSPLazyReferenceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TSPLazyReferenceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (TSPComponent)component
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_component);

  return (TSPComponent *)WeakRetained;
}

- (void)setComponent:(id)a3
{
}

- (BOOL)isWeak
{
  return self->_isWeak;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_component);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_weakObject);

  objc_storeStrong((id *)&self->_strongObject, 0);
}

@end
@interface PFXClassMapDelegatingReader
+ (Class)fallThroughClass;
+ (const)keyXmlAttributeName;
+ (void)delegateMap;
- (BOOL)mapStartElementWithState:(id)a3;
- (id)delegate;
- (void)dealloc;
@end

@implementation PFXClassMapDelegatingReader

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXClassMapDelegatingReader;
  [(PFXClassMapDelegatingReader *)&v3 dealloc];
}

+ (void)delegateMap
{
  return 0;
}

+ (const)keyXmlAttributeName
{
  return 0;
}

+ (Class)fallThroughClass
{
  return 0;
}

- (id)delegate
{
  return self->mDelegate;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  v5 = objc_opt_class();
  v11 = (const xmlChar *)objc_msgSend(objc_msgSend(a3, "currentXmlStackEntry"), "xmlValueForAttribute:", objc_msgSend(v5, "keyXmlAttributeName"));
  if (v11)
  {
    v6 = (char *)[v5 delegateMap];
    uint64_t v7 = sub_1EE660((uint64_t)v6, &v11);
    if (v6 + 8 != (char *)v7) {
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
    }
  }
  mDelegate = self->mDelegate;
  if (!mDelegate)
  {
    v9 = (objc_class *)[v5 fallThroughClass];
    if (v9)
    {
      mDelegate = (PFXElementReader *)objc_alloc_init(v9);
      self->mDelegate = mDelegate;
    }
    else
    {
      mDelegate = self->mDelegate;
    }
  }
  return [(PFXElementReader *)mDelegate mapStartElementWithState:a3];
}

@end
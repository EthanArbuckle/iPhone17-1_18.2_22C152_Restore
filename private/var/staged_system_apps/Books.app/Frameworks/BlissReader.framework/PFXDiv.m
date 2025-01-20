@interface PFXDiv
+ (Class)blockClass;
+ (void)delegateMap;
- (BOOL)mapStartElementWithState:(id)a3;
- (id)delegate;
- (void)dealloc;
@end

@implementation PFXDiv

- (void)dealloc
{
  mDelegate = (PFXDiv *)self->mDelegate;
  if (mDelegate != self) {

  }
  v4.receiver = self;
  v4.super_class = (Class)PFXDiv;
  [(PFXDiv *)&v4 dealloc];
}

- (id)delegate
{
  return self->mDelegate;
}

+ (void)delegateMap
{
  result = (void *)qword_5737B8;
  if (!qword_5737B8)
  {
    objc_sync_enter(a1);
    if (!qword_5737B8) {
      operator new();
    }
    objc_sync_exit(a1);
    return (void *)qword_5737B8;
  }
  return result;
}

+ (Class)blockClass
{
  return (Class)objc_opt_class();
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentHtmlStackEntry];
  v10 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
  if (v10)
  {
    v6 = (char *)[(id)objc_opt_class() delegateMap];
    uint64_t v7 = sub_1EE660((uint64_t)v6, &v10);
    if (v6 + 8 != (char *)v7) {
      self->mDelegate = (PFXElementReader *)objc_alloc_init(*(Class *)(v7 + 40));
    }
  }
  mDelegate = self->mDelegate;
  if (!mDelegate)
  {
    self->mDelegate = (PFXElementReader *)objc_alloc_init((Class)[(id)objc_opt_class() blockClass]);
    [a3 drawableReaderForCurrentMediaStateWithStackEntry:[v5 parentHtmlStackEntry]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 1;
    }
    mDelegate = self->mDelegate;
  }
  return [(PFXElementReader *)mDelegate mapStartElementWithState:a3];
}

@end
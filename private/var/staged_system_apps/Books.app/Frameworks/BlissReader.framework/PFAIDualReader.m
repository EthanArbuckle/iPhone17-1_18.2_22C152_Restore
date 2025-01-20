@interface PFAIDualReader
+ (Class)subreaderClass;
- (BOOL)mapStartElementWithState:(id)a3;
- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3;
- (PFAIDualReader)init;
- (id)currentSubreaderWithState:(id)a3;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIDualReader

+ (Class)subreaderClass
{
  return 0;
}

- (PFAIDualReader)init
{
  v5.receiver = self;
  v5.super_class = (Class)PFAIDualReader;
  v2 = [(PFAIDualReader *)&v5 init];
  if (v2)
  {
    v3 = (objc_class *)[(id)objc_opt_class() subreaderClass];
    v2->mFlowSubreader = (PFXElementReader *)objc_alloc_init(v3);
    v2->mPaginatedSubreader = (PFXElementReader *)objc_alloc_init(v3);
    *(_WORD *)&v2->mOverridden = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIDualReader;
  [(PFAIDualReader *)&v3 dealloc];
}

- (id)currentSubreaderWithState:(id)a3
{
  if ([a3 paginatedIsCurrent])
  {
    uint64_t v5 = 8;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  if ([a3 flowIsCurrent])
  {
    uint64_t v5 = 16;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  return 0;
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  if (![a3 setFlowAsCurrent])
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  unsigned int v6 = [(PFXElementReader *)self->mFlowSubreader mapStartElementWithState:a3];
  id v7 = [v5 parentEntry];
  if (v6 && [(PFAIDualReader *)self shouldImportInCurrentLayoutWithState:a3])
  {
    id v8 = [v5 flowState];
    LOBYTE(v6) = 1;
    uint64_t v9 = 1;
  }
  else
  {
    [v7 reader];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", 1);
      self->mOverridden = 1;
      goto LABEL_12;
    }
    objc_msgSend(objc_msgSend(v7, "parentEntry"), "reader");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v5 reader];
      objc_opt_class();
      unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
      v11 = (const xmlChar *)[v5 xmlValueForAttribute:PFXWidgetConstantDataWidgetObjectType[0]];
      BOOL v12 = (xmlStrEqual(v11, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]) != 0) & isKindOfClass;
      objc_msgSend(objc_msgSend(v5, "flowState"), "setProcessOrientation:", v12);
      self->mOverridden = v12;
      self->mGutterTitleShape = v12;
      goto LABEL_12;
    }
    id v8 = [v5 flowState];
    uint64_t v9 = 0;
  }
  [v8 setProcessOrientation:v9];
LABEL_12:
  if ([a3 setPaginatedAsCurrent])
  {
    unsigned int v13 = [(PFXElementReader *)self->mPaginatedSubreader mapStartElementWithState:a3];
    BOOL v14 = v13
       && [(PFAIDualReader *)self shouldImportInCurrentLayoutWithState:a3];
    objc_msgSend(objc_msgSend(v5, "paginatedState"), "setProcessOrientation:", v14);
    LOBYTE(v6) = v13 | v6;
  }
  return v6;
}

- (BOOL)shouldImportInCurrentLayoutWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  if ([a3 setFlowAsCurrent])
  {
    if (self->mOverridden)
    {
      if (!self->mGutterTitleShape) {
        goto LABEL_9;
      }
    }
    else if (!self->mGutterTitleShape)
    {
      [(PFXElementReader *)self->mFlowSubreader mapEndElementWithState:a3];
      goto LABEL_9;
    }
    id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentStackEntry"), "currentEntryOrientationState"), "storage");
    id v6 = [a3 ancestorEntryWithReaderClass:objc_opt_class()];
    objc_opt_class();
    [v6 reader];
    id v7 = (void *)TSUDynamicCast();
    if (v7) {
      [v7 setGutterTitleStorage:v5];
    }
  }
LABEL_9:
  if ([a3 setPaginatedAsCurrent])
  {
    mPaginatedSubreader = self->mPaginatedSubreader;
    [(PFXElementReader *)mPaginatedSubreader mapEndElementWithState:a3];
  }
}

@end
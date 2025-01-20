@interface PFXSvgDefsDocument
- (PFXSvgDefsDocument)initWithReaderState:(id)a3 entryPath:(id)a4 definitionMap:(id)a5;
- (id)definitionMap;
- (id)entryPath;
- (id)innermostElement;
- (id)readerState;
- (void)dealloc;
- (void)popElement;
- (void)pushElement:(id)a3;
@end

@implementation PFXSvgDefsDocument

- (PFXSvgDefsDocument)initWithReaderState:(id)a3 entryPath:(id)a4 definitionMap:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)PFXSvgDefsDocument;
  v8 = [(PFXSvgDefsDocument *)&v10 init];
  if (v8)
  {
    v8->mReaderState = (PFXHtmlReaderState *)a3;
    v8->mEntryPath = (NSString *)a4;
    v8->mDefinitionMap = (NSMutableDictionary *)a5;
    v8->mElementStack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXSvgDefsDocument;
  [(PFXSvgDefsDocument *)&v3 dealloc];
}

- (void)pushElement:(id)a3
{
}

- (void)popElement
{
}

- (id)innermostElement
{
  id result = [(NSMutableArray *)self->mElementStack count];
  if (result)
  {
    mElementStack = self->mElementStack;
    return [(NSMutableArray *)mElementStack lastObject];
  }
  return result;
}

- (id)definitionMap
{
  return self->mDefinitionMap;
}

- (id)entryPath
{
  return self->mEntryPath;
}

- (id)readerState
{
  return self->mReaderState;
}

@end
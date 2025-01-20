@interface THGlossaryController
- (THDocumentRoot)documentRoot;
- (THGlossaryController)initWithModel:(id)a3 documentRoot:(id)a4;
- (THModelGlossary)model;
- (id)alphabeticalTermIndex;
- (id)entryForPath:(id)a3;
- (void)dealloc;
@end

@implementation THGlossaryController

- (THGlossaryController)initWithModel:(id)a3 documentRoot:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THGlossaryController;
  result = [(THGlossaryController *)&v7 init];
  if (result)
  {
    result->mDocumentRoot = (THDocumentRoot *)a4;
    result->mModel = (THModelGlossary *)a3;
  }
  return result;
}

- (void)dealloc
{
  self->mAlphabeticalTermIndex = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryController;
  [(THGlossaryController *)&v3 dealloc];
}

- (id)alphabeticalTermIndex
{
  id result = self->mAlphabeticalTermIndex;
  if (!result)
  {
    id result = +[THGlossaryIndex alphabeticalIndexForGlossary:self->mModel withPrefix:0];
    self->mAlphabeticalTermIndex = (THGlossaryIndex *)result;
  }
  return result;
}

- (id)entryForPath:(id)a3
{
  return [(THModelGlossary *)self->mModel entryForPath:a3];
}

- (THModelGlossary)model
{
  return self->mModel;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

@end
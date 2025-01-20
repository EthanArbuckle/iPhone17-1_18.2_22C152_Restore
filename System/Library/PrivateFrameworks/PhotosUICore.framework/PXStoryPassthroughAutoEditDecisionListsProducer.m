@interface PXStoryPassthroughAutoEditDecisionListsProducer
- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3;
- (NSArray)autoEditDecisionLists;
- (PXStoryPassthroughAutoEditDecisionListsProducer)init;
- (PXStoryPassthroughAutoEditDecisionListsProducer)initWithAutoEditDecisionLists:(id)a3;
- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3;
- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4;
- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6;
- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5;
@end

@implementation PXStoryPassthroughAutoEditDecisionListsProducer

- (void).cxx_destruct
{
}

- (NSArray)autoEditDecisionLists
{
  return self->_autoEditDecisionLists;
}

- (id)diagnosticErrorsByComponentForHUDType:(int64_t)a3
{
  return 0;
}

- (id)diagnosticTextForHUDType:(int64_t)a3 displaySize:(CGSize)a4
{
  return &stru_1F00B0030;
}

- (BOOL)handlesDiagnosticTextForHUDType:(int64_t)a3
{
  return 0;
}

- (id)requestDefaultAutoEditDecisionListsWithColorGradeCategory:(id)a3 options:(unint64_t)a4 resultHandler:(id)a5
{
  id v7 = a5;
  v8 = [PXStoryProducerResult alloc];
  v9 = [(PXStoryPassthroughAutoEditDecisionListsProducer *)self autoEditDecisionLists];
  v10 = [(PXStoryProducerResult *)v8 initWithObject:v9];
  (*((void (**)(id, PXStoryProducerResult *))a5 + 2))(v7, v10);

  return 0;
}

- (id)requestAutoEditDecisionListsWithOptions:(unint64_t)a3 songs:(id)a4 colorGradeCategoriesBySong:(id)a5 resultHandler:(id)a6
{
  id v8 = a6;
  v9 = [PXStoryProducerResult alloc];
  v10 = [(PXStoryPassthroughAutoEditDecisionListsProducer *)self autoEditDecisionLists];
  v11 = [(PXStoryProducerResult *)v9 initWithObject:v10];
  (*((void (**)(id, PXStoryProducerResult *))a6 + 2))(v8, v11);

  return 0;
}

- (PXStoryPassthroughAutoEditDecisionListsProducer)initWithAutoEditDecisionLists:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryPassthroughAutoEditDecisionListsProducer;
  v5 = [(PXStoryPassthroughAutoEditDecisionListsProducer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    autoEditDecisionLists = v5->_autoEditDecisionLists;
    v5->_autoEditDecisionLists = (NSArray *)v6;
  }
  return v5;
}

- (PXStoryPassthroughAutoEditDecisionListsProducer)init
{
  return [(PXStoryPassthroughAutoEditDecisionListsProducer *)self initWithAutoEditDecisionLists:0];
}

@end
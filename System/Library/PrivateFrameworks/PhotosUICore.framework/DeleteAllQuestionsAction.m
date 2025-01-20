@interface DeleteAllQuestionsAction
@end

@implementation DeleteAllQuestionsAction

uint64_t ___DeleteAllQuestionsAction_block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F39258] deleteQuestions:*(void *)(a1 + 32)];
}

@end
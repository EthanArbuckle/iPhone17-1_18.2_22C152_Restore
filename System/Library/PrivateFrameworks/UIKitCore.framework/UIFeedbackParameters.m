@interface UIFeedbackParameters
@end

@implementation UIFeedbackParameters

void __42___UIFeedbackParameters_initWithFeedback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 objectForKeyedSubscript:@"defaultValue"];
  if (v5) {
    [*(id *)(a1 + 32) setValue:v5 forKey:v6];
  }
}

void __67___UIFeedbackParameters_initWithDictionaryRepresentation_feedback___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  if (v3) {
    [*(id *)(a1 + 40) setValue:v3 forKey:v4];
  }
}

void __33___UIFeedbackParameters_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 valueForKey:v7];
  v9 = [*(id *)(a1 + 40) valueForKey:v7];

  LOBYTE(v7) = [v8 isEqual:v9];
  if ((v7 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void __38___UIFeedbackParameters_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [v2 setValue:v5 forKey:v4];
}

void __35___UIFeedbackParameters_parameters__block_invoke()
{
  v0 = (void *)qword_1EB25C920;
  qword_1EB25C920 = (uint64_t)&unk_1ED3F77D0;
}

void __49___UIFeedbackParameters_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [v2 setObject:v5 forKey:v4];
}

@end
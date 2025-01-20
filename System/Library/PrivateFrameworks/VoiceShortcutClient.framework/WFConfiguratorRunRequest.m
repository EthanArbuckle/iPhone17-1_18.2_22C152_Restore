@interface WFConfiguratorRunRequest
- (WFConfiguratorRunRequest)initWithInputStrings:(id)a3 presentationMode:(unint64_t)a4;
@end

@implementation WFConfiguratorRunRequest

- (WFConfiguratorRunRequest)initWithInputStrings:(id)a3 presentationMode:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    v7 = objc_msgSend(v6, "if_compactMap:", &__block_literal_global_5198);
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v8 = (void *)getWFContentCollectionClass_softClass_5199;
    uint64_t v17 = getWFContentCollectionClass_softClass_5199;
    if (!getWFContentCollectionClass_softClass_5199)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getWFContentCollectionClass_block_invoke_5200;
      v13[3] = &unk_1E6079C28;
      v13[4] = &v14;
      __getWFContentCollectionClass_block_invoke_5200((uint64_t)v13);
      v8 = (void *)v15[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v14, 8);
    v10 = [v9 collectionWithItems:v7];
  }
  else
  {
    v10 = 0;
  }
  v11 = [(WFWorkflowRunRequest *)self initWithInput:v10 presentationMode:a4];

  return v11;
}

id __66__WFConfiguratorRunRequest_initWithInputStrings_presentationMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getWFContentItemClass_softClass;
  uint64_t v11 = getWFContentItemClass_softClass;
  if (!getWFContentItemClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getWFContentItemClass_block_invoke;
    v7[3] = &unk_1E6079C28;
    v7[4] = &v8;
    __getWFContentItemClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [v4 itemWithObject:v2];

  return v5;
}

@end
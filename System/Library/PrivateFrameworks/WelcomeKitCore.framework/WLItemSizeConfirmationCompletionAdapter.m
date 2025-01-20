@interface WLItemSizeConfirmationCompletionAdapter
- (WLItemSizeConfirmationCompletionAdapter)initWithUnconfirmedItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4 originalSegmentCompletion:(id)a5 originalCompletion:(id)a6;
- (id)completion;
- (id)segmentCompletion;
@end

@implementation WLItemSizeConfirmationCompletionAdapter

- (WLItemSizeConfirmationCompletionAdapter)initWithUnconfirmedItemSize:(unint64_t)a3 segmentSize:(unint64_t)a4 originalSegmentCompletion:(id)a5 originalCompletion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v31.receiver = self;
  v31.super_class = (Class)WLItemSizeConfirmationCompletionAdapter;
  v12 = [(WLItemSizeConfirmationCompletionAdapter *)&v31 init];
  if (v12)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke;
    v25[3] = &unk_26490C698;
    v27 = v30;
    unint64_t v28 = a3;
    unint64_t v29 = a4;
    id v13 = v10;
    id v26 = v13;
    uint64_t v14 = MEMORY[0x230F5E7D0](v25);
    id segmentCompletion = v12->_segmentCompletion;
    v12->_id segmentCompletion = (id)v14;

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke_2;
    v19[3] = &unk_26490C6C0;
    v22 = v30;
    unint64_t v23 = a3;
    unint64_t v24 = a4;
    id v20 = v13;
    id v21 = v11;
    uint64_t v16 = MEMORY[0x230F5E7D0](v19);
    id completion = v12->_completion;
    v12->_id completion = (id)v16;

    _Block_object_dispose(v30, 8);
  }

  return v12;
}

uint64_t __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 48);
  uint64_t v2 = *(void *)(*(void *)(result + 40) + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v1 > v3)
  {
    uint64_t v4 = result;
    if (*(void *)(result + 56) + v3 <= v1) {
      unint64_t v5 = *(void *)(result + 56);
    }
    else {
      unint64_t v5 = v1 - v3;
    }
    result = *(void *)(result + 32);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t, unint64_t))(result + 16))(result, v5);
      uint64_t v2 = *(void *)(*(void *)(v4 + 40) + 8);
      unint64_t v3 = *(void *)(v2 + 24);
    }
    *(void *)(v2 + 24) = v3 + v5;
  }
  return result;
}

uint64_t __128__WLItemSizeConfirmationCompletionAdapter_initWithUnconfirmedItemSize_segmentSize_originalSegmentCompletion_originalCompletion___block_invoke_2(void *a1, void *a2)
{
  id v12 = a2;
  if (!v12)
  {
    uint64_t v4 = a1[6];
    unint64_t v5 = a1[7];
    while (1)
    {
      unint64_t v6 = *(void *)(*(void *)(v4 + 8) + 24);
      if (v6 >= v5) {
        break;
      }
      unint64_t v7 = a1[8] + v6;
      unint64_t v8 = v5 - v6;
      if (v7 <= v5) {
        unint64_t v9 = a1[8];
      }
      else {
        unint64_t v9 = v8;
      }
      uint64_t v10 = a1[4];
      if (v10)
      {
        (*(void (**)(uint64_t, unint64_t))(v10 + 16))(v10, v9);
        uint64_t v4 = a1[6];
        unint64_t v5 = a1[7];
      }
      *(void *)(*(void *)(v4 + 8) + 24) += v9;
      uint64_t v4 = a1[6];
    }
  }
  uint64_t v3 = a1[5];
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v12);
  }
  return MEMORY[0x270F9A758]();
}

- (id)segmentCompletion
{
  return self->_segmentCompletion;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_segmentCompletion, 0);
}

@end
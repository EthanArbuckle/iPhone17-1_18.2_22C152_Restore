@interface WFObservableArrayResult
+ (id)getEmptyResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5;
+ (id)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6;
+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6;
+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 roundedIcon:(BOOL)a6 completionHandler:(id)a7;
- (NSArray)values;
- (WFDatabaseResultState)resultState;
- (WFObservableArrayResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValues:(id)a5 query:(id)a6 resultState:(id)a7;
- (WFResultQuery)query;
- (id)description;
- (void)handleChangeNotification:(id)a3;
@end

@implementation WFObservableArrayResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_resultState, 0);
  objc_storeStrong((id *)&self->_values, 0);
}

- (WFResultQuery)query
{
  return self->_query;
}

- (WFDatabaseResultState)resultState
{
  return self->_resultState;
}

- (NSArray)values
{
  return self->_values;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromClass([(WFObservableResult *)self valueType]);
  v7 = [(WFObservableArrayResult *)self values];
  uint64_t v8 = [v7 count];
  v9 = [(WFObservableArrayResult *)self query];
  v10 = [(WFObservableArrayResult *)self values];
  v11 = [v3 stringWithFormat:@"<%@: %p, valueType: %@, values count: %lu, query: %@, values: %@>", v5, self, v6, v8, v9, v10];

  return v11;
}

- (void)handleChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [(WFObservableResult *)self serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke;
  v7[3] = &unk_1E6079130;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) resultState];
  if (!v2
    || (v3 = (void *)v2,
        id v4 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) resultState],
        v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 appliesToResultState:v5],
        v5,
        v3,
        v4))
  {
    id v6 = +[VCVoiceShortcutClient standardClient];
    v7 = [*(id *)(a1 + 32) query];
    uint64_t v8 = [*(id *)(a1 + 32) valueType];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_2;
    v9[3] = &unk_1E6078890;
    v9[4] = *(void *)(a1 + 32);
    [v6 getResultsForQuery:v7 resultClass:v8 completion:v9];
  }
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) glyphSize];
  double v8 = v7;
  double v10 = v9;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_3;
  v13[3] = &unk_1E6078C40;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  +[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:](WFObservableResult, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v12, v13, v8, v10);
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_4;
  block[3] = &unk_1E6078C40;
  v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

void __52__WFObservableArrayResult_handleChangeNotification___block_invoke_4(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v2 = a1[5];
  id v18 = *((id *)a1[4] + 8);
  id v3 = v2;
  if (v18 == v3)
  {
  }
  else
  {
    if (v18) {
      BOOL v4 = v3 == 0;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
    }
    else
    {
      char v5 = [v18 isEqual:v3];

      if (v5) {
        return;
      }
    }
    uint64_t v6 = [a1[5] copy];
    double v7 = a1[4];
    double v8 = (void *)v7[8];
    v7[8] = v6;

    objc_storeStrong((id *)a1[4] + 9, a1[6]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v9 = [a1[4] observers];
    double v10 = [v9 allObjects];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v16 = [a1[4] observerNotificationQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __52__WFObservableArrayResult_handleChangeNotification___block_invoke_5;
          block[3] = &unk_1E6079130;
          id v17 = a1[4];
          block[4] = v15;
          void block[5] = v17;
          dispatch_async(v16, block);
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

uint64_t __52__WFObservableArrayResult_handleChangeNotification___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) observableResultDidChange:*(void *)(a1 + 40)];
}

- (WFObservableArrayResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValues:(id)a5 query:(id)a6 resultState:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)WFObservableArrayResult;
  v16 = -[WFObservableResult initWithValueType:glyphSize:](&v21, sel_initWithValueType_glyphSize_, a3, width, height);
  if (v16)
  {
    uint64_t v17 = [v13 copy];
    values = v16->_values;
    v16->_values = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_query, a6);
    objc_storeStrong((id *)&v16->_resultState, a7);
    v19 = v16;
  }

  return v16;
}

+ (id)getEmptyResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  double v9 = [WFObservableArrayResult alloc];
  double v10 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:](v9, "initWithValueType:glyphSize:initialValues:query:resultState:", a4, MEMORY[0x1E4F1CBF0], v8, 0, width, height);

  return v10;
}

+ (id)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  id v11 = a3;
  uint64_t v12 = +[VCVoiceShortcutClient standardClient];
  id v18 = 0;
  id v19 = 0;
  id v13 = [v12 getResultsForQuery:v11 resultClass:a4 resultState:&v19 error:&v18];
  id v14 = v19;
  id v15 = v18;

  if (v15)
  {
    v16 = 0;
    if (a6) {
      *a6 = v15;
    }
  }
  else
  {
    objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:", v13, width, height);
    v16 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:]([WFObservableArrayResult alloc], "initWithValueType:glyphSize:initialValues:query:resultState:", a4, v13, v11, v14, width, height);
  }

  return v16;
}

+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 roundedIcon:(BOOL)a6 completionHandler:(id)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v13 = a3;
  id v14 = a7;
  id v15 = +[VCVoiceShortcutClient standardClient];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke;
  v18[3] = &unk_1E6078868;
  id v20 = v14;
  id v21 = a1;
  CGFloat v22 = width;
  CGFloat v23 = height;
  BOOL v25 = a6;
  Class v24 = a4;
  id v19 = v13;
  id v16 = v13;
  id v17 = v14;
  [v15 getResultsForQuery:v16 resultClass:a4 completion:v18];
}

void __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = *(void **)(a1 + 48);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 80);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6078840;
    uint64_t v14 = *(void *)(a1 + 72);
    long long v15 = *(_OWORD *)(a1 + 56);
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v12 = v6;
    id v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:roundedIcon:synchronously:completion:", v10, v8, 0, v9, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __96__WFObservableArrayResult_getResultWithQuery_valueType_glyphSize_roundedIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = -[WFObservableArrayResult initWithValueType:glyphSize:initialValues:query:resultState:]([WFObservableArrayResult alloc], "initWithValueType:glyphSize:initialValues:query:resultState:", *(void *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 72), *(double *)(a1 + 80));
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (void)getResultWithQuery:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6
{
}

@end
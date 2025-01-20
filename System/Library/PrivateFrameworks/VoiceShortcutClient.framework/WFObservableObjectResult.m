@interface WFObservableObjectResult
+ (id)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6;
+ (void)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6;
- (WFDatabaseObjectDescriptor)descriptor;
- (WFDatabaseObjectDescriptor)value;
- (WFObservableObjectResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValue:(id)a5 descriptor:(id)a6;
- (id)description;
- (void)handleChangeNotification:(id)a3;
@end

@implementation WFObservableObjectResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (WFDatabaseObjectDescriptor)descriptor
{
  return self->_descriptor;
}

- (WFDatabaseObjectDescriptor)value
{
  return self->_value;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromClass([(WFObservableResult *)self valueType]);
  v7 = [(WFObservableObjectResult *)self value];
  v8 = [(WFObservableObjectResult *)self descriptor];
  v9 = [v3 stringWithFormat:@"<%@: %p, valueType: %@, value: %@, descriptor: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (void)handleChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 updatedDescriptors];
  v6 = [(WFObservableObjectResult *)self descriptor];
  if ([v5 containsObject:v6])
  {

LABEL_4:
    v10 = [(WFObservableResult *)self serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke;
    block[3] = &unk_1E6078C68;
    block[4] = self;
    dispatch_sync(v10, block);

    goto LABEL_5;
  }
  v7 = [v4 deletedDescriptors];
  v8 = [(WFObservableObjectResult *)self descriptor];
  int v9 = [v7 containsObject:v8];

  if (v9) {
    goto LABEL_4;
  }
LABEL_5:
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke(uint64_t a1)
{
  v2 = +[VCVoiceShortcutClient standardClient];
  v3 = [*(id *)(a1 + 32) descriptor];
  uint64_t v4 = [*(id *)(a1 + 32) valueType];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_2;
  v5[3] = &unk_1E6078908;
  v5[4] = *(void *)(a1 + 32);
  [v2 getValueForDescriptor:v3 resultClass:v4 completion:v5];
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (v5)
    {
      v14[0] = v5;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    [*(id *)(a1 + 32) glyphSize];
    double v9 = v8;
    double v11 = v10;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_3;
    v12[3] = &unk_1E6079130;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v5;
    +[WFObservableResult drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:](WFObservableResult, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v7, v12, v9, v11);
    if (v5) {
  }
    }
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) serialQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_4;
  v4[3] = &unk_1E6079130;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __53__WFObservableObjectResult_handleChangeNotification___block_invoke_4(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [*(id *)(a1 + 32) observers];
  v3 = [v2 allObjects];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * v7);
        double v9 = [*(id *)(a1 + 32) observerNotificationQueue];
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __53__WFObservableObjectResult_handleChangeNotification___block_invoke_5;
        v11[3] = &unk_1E6079130;
        uint64_t v10 = *(void *)(a1 + 32);
        v11[4] = v8;
        v11[5] = v10;
        dispatch_async(v9, v11);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

uint64_t __53__WFObservableObjectResult_handleChangeNotification___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) observableResultDidChange:*(void *)(a1 + 40)];
}

- (WFObservableObjectResult)initWithValueType:(Class)a3 glyphSize:(CGSize)a4 initialValue:(id)a5 descriptor:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFObservableObjectResult;
  long long v14 = -[WFObservableResult initWithValueType:glyphSize:](&v18, sel_initWithValueType_glyphSize_, a3, width, height);
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_value, a5);
    objc_storeStrong((id *)&v15->_descriptor, a6);
    v16 = v15;
  }

  return v15;
}

+ (id)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 error:(id *)a6
{
  double height = a5.height;
  double width = a5.width;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = +[VCVoiceShortcutClient standardClient];
  id v18 = 0;
  id v13 = [v12 getValueForDescriptor:v11 resultClass:a4 error:&v18];
  id v14 = v18;

  if (v13)
  {
    v19[0] = v13;
    long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
    objc_msgSend(a1, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:", v15, width, height);

    v16 = -[WFObservableObjectResult initWithValueType:glyphSize:initialValue:descriptor:]([WFObservableObjectResult alloc], "initWithValueType:glyphSize:initialValue:descriptor:", a4, v13, v11, width, height);
  }
  else
  {
    v16 = 0;
    if (a6) {
      *a6 = v14;
    }
  }

  return v16;
}

+ (void)getResultWithDescriptor:(id)a3 valueType:(Class)a4 glyphSize:(CGSize)a5 completionHandler:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a6;
  id v13 = +[VCVoiceShortcutClient standardClient];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke;
  v16[3] = &unk_1E60788E0;
  id v18 = v12;
  id v19 = a1;
  CGFloat v20 = width;
  CGFloat v21 = height;
  Class v22 = a4;
  id v17 = v11;
  id v14 = v11;
  id v15 = v12;
  [v13 getValueForDescriptor:v14 resultClass:a4 completion:v16];
}

void __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 48);
    v13[0] = v3;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke_2;
    v7[3] = &unk_1E60788B8;
    uint64_t v11 = *(void *)(a1 + 72);
    long long v12 = *(_OWORD *)(a1 + 56);
    id v8 = v4;
    id v9 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    objc_msgSend(v5, "drawGlyphsIntoWorkflowsIfNecessary:glyphSize:completion:", v6, v7, *(double *)(a1 + 56), *(double *)(a1 + 64));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __90__WFObservableObjectResult_getResultWithDescriptor_valueType_glyphSize_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = -[WFObservableObjectResult initWithValueType:glyphSize:initialValue:descriptor:]([WFObservableObjectResult alloc], "initWithValueType:glyphSize:initialValue:descriptor:", *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end
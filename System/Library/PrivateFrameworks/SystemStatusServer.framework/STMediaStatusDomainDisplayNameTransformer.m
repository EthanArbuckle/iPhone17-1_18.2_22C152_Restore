@interface STMediaStatusDomainDisplayNameTransformer
- (STMediaStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3;
- (id)transformedDataForData:(id)a3;
@end

@implementation STMediaStatusDomainDisplayNameTransformer

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 activityAttribution];
  v3 = [v2 attributedEntity];

  return v3;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 activityAttribution];
  v5 = [v4 attributedEntity];
  v6 = [*(id *)(a1 + 32) resolveEntity:v5];
  v7 = [v6 attributedEntity];
  v8 = [v6 activeEntity];
  v9 = (void *)[v4 copyReplacingAttributedEntity:v7 activeEntity:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FA93E0]);
  [v3 maximumHistoryAccessed];
  double v12 = v11;

  v13 = (void *)[v10 initWithActivityAttribution:v9 maximumHistoryAccessed:v12];
  return v13;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 activityAttribution];
  id v3 = [v2 attributedEntity];

  return v3;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 activityAttribution];
  v5 = [v4 attributedEntity];
  v6 = [*(id *)(a1 + 32) resolveEntity:v5];
  v7 = [v6 attributedEntity];
  v8 = [v6 activeEntity];
  v9 = (void *)[v4 copyReplacingAttributedEntity:v7 activeEntity:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FA93D0]);
  double v11 = [v3 cameraDescriptor];

  double v12 = (void *)[v10 initWithCameraDescriptor:v11 activityAttribution:v9];
  return v12;
}

- (id)transformedDataForData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  id v7 = v6;
  if (isKindOfClass)
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [v6 microphoneAttributions];
    id v10 = objc_msgSend(v9, "bs_map:", &__block_literal_global);
    [v8 addObjectsFromArray:v10];

    double v11 = [v6 mutedMicrophoneRecordingAttributions];
    double v12 = objc_msgSend(v11, "bs_map:", &__block_literal_global_4);
    [v8 addObjectsFromArray:v12];

    v13 = [v6 systemAudioRecordingAttributions];
    v14 = objc_msgSend(v13, "bs_map:", &__block_literal_global_6);
    [v8 addObjectsFromArray:v14];

    v15 = [v6 cameraAttributions];
    v16 = objc_msgSend(v15, "bs_map:", &__block_literal_global_9);
    [v8 addObjectsFromArray:v16];

    v17 = [v6 screenCaptureAttributions];
    v18 = objc_msgSend(v17, "bs_map:", &__block_literal_global_12);
    [v8 addObjectsFromArray:v18];

    if (self) {
      entityResolver = self->_entityResolver;
    }
    else {
      entityResolver = 0;
    }
    v20 = entityResolver;
    [(STAttributedEntityBatchResolving *)v20 resolveEntities:v8];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_6;
    v44[3] = &unk_1E6AD1FB0;
    v21 = v20;
    v45 = v21;
    v33 = objc_msgSend(v9, "bs_map:", v44);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v35 = v9;
    v42[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_7;
    v42[3] = &unk_1E6AD1FD8;
    v22 = v21;
    v43 = v22;
    v23 = objc_msgSend(v11, "bs_map:", v42);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_8;
    v40[3] = &unk_1E6AD1FD8;
    v24 = v22;
    v41 = v24;
    v25 = objc_msgSend(v13, "bs_map:", v40);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_9;
    v38[3] = &unk_1E6AD2000;
    v26 = v24;
    v39 = v26;
    objc_msgSend(v15, "bs_map:", v38);
    v27 = v34 = v11;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_10;
    v36[3] = &unk_1E6AD2028;
    v37 = v26;
    v31 = v26;
    objc_msgSend(v17, "bs_map:", v36);
    v28 = v32 = v13;
    v29 = v17;
    id v7 = objc_alloc_init(MEMORY[0x1E4FA9410]);
    [v7 setMicrophoneAttributions:v33];
    [v7 setMutedMicrophoneRecordingAttributions:v23];
    [v7 setSystemAudioRecordingAttributions:v25];
    [v7 setCameraAttributions:v27];
    [v7 setScreenCaptureAttributions:v28];
  }
  return v7;
}

- (STMediaStatusDomainDisplayNameTransformer)initWithEntityResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMediaStatusDomainDisplayNameTransformer;
  id v6 = [(STMediaStatusDomainDisplayNameTransformer *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_entityResolver, a3);
  }

  return v7;
}

uint64_t __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 attributedEntity];
}

uint64_t __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 attributedEntity];
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 activityAttribution];
  id v3 = [v2 attributedEntity];

  return v3;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attributedEntity];
  id v5 = [*(id *)(a1 + 32) resolveEntity:v4];
  id v6 = [v5 attributedEntity];
  id v7 = [v5 activeEntity];
  v8 = (void *)[v3 copyReplacingAttributedEntity:v6 activeEntity:v7];

  return v8;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attributedEntity];
  id v5 = [*(id *)(a1 + 32) resolveEntity:v4];
  id v6 = [v5 attributedEntity];
  id v7 = [v5 activeEntity];
  v8 = (void *)[v3 copyReplacingAttributedEntity:v6 activeEntity:v7];

  return v8;
}

id __68__STMediaStatusDomainDisplayNameTransformer_transformedDataForData___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = [a2 activityAttribution];
  id v4 = [v3 attributedEntity];

  id v5 = [*(id *)(a1 + 32) resolveEntity:v4];
  id v6 = objc_alloc(MEMORY[0x1E4FA9310]);
  id v7 = [v5 attributedEntity];
  v8 = [v5 activeEntity];
  objc_super v9 = (void *)[v6 initWithAttributedEntity:v7 activeEntity:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4FA93E8]) initWithActivityAttribution:v9];
  return v10;
}

- (void).cxx_destruct
{
}

@end
@interface WFItemProviderEntityRequestMetadata
+ (BOOL)supportsSecureCoding;
- (LNEntity)entity;
- (LNEntityMetadata)metadata;
- (WFItemProviderEntityRequestMetadata)initWithCoder:(id)a3;
- (WFItemProviderEntityRequestMetadata)initWithEntity:(id)a3 metadata:(id)a4;
- (id)registeredTypeIdentifiers;
- (void)encodeWithCoder:(id)a3;
- (void)fetchLinkMetadataWithCompletion:(id)a3;
@end

@implementation WFItemProviderEntityRequestMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

- (LNEntityMetadata)metadata
{
  return self->_metadata;
}

- (LNEntity)entity
{
  return self->_entity;
}

- (WFItemProviderEntityRequestMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metadata"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(WFItemProviderEntityRequestMetadata *)self initWithEntity:v5 metadata:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFItemProviderEntityRequestMetadata *)self entity];
  [v4 encodeObject:v5 forKey:@"entity"];

  id v6 = [(WFItemProviderEntityRequestMetadata *)self metadata];
  [v4 encodeObject:v6 forKey:@"metadata"];
}

- (id)registeredTypeIdentifiers
{
  v2 = [(WFItemProviderEntityRequestMetadata *)self metadata];
  v3 = [v2 transferableContentTypes];
  id v4 = [v3 exportableTypes];
  v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_6138);

  return v5;
}

uint64_t __64__WFItemProviderEntityRequestMetadata_registeredTypeIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 contentType];
}

- (void)fetchLinkMetadataWithCompletion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F72BC0];
  id v6 = [(WFItemProviderEntityRequestMetadata *)self metadata];
  BOOL v7 = [v5 policyWithEntityMetadata:v6];

  id v21 = 0;
  v8 = [v7 connectionWithError:&v21];
  id v9 = v21;
  if (v8)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F72C50]);
    v11 = [(WFItemProviderEntityRequestMetadata *)self entity];
    v12 = [v11 identifier];
    v22[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v14 = (void *)[v10 initWithEntityIdentifiers:v13];

    id v15 = objc_alloc(MEMORY[0x1E4F72D58]);
    v16 = [(WFItemProviderEntityRequestMetadata *)self metadata];
    v17 = (void *)[v15 initWithEntityMetadata:v16];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F72B88]) initWithQueryType:v14 target:v17 options:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke;
    v19[3] = &unk_1E6077EB8;
    id v20 = v4;
    [v8 performConfigurableQuery:v18 completionHandler:v19];
  }
  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0, v9);
  }
}

void __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    v3 = [a2 value];
    id v4 = [v3 value];

    v5 = [v4 firstObject];
    id v6 = [v5 displayRepresentation];

    id v7 = objc_alloc_init((Class)getLPLinkMetadataClass());
    v8 = [v6 title];
    id v9 = [v8 localizedStringForLocaleIdentifier:0];
    [v7 setTitle:v9];

    id v10 = [v6 subtitle];
    v11 = [v10 localizedStringForLocaleIdentifier:0];
    if (v11)
    {
      [v7 setSummary:v11];
    }
    else
    {
      v13 = [v6 descriptionText];
      v14 = [v13 localizedStringForLocaleIdentifier:0];
      [v7 setSummary:v14];
    }
    id v15 = [v6 image];
    v16 = [v15 inImage];

    if (v16)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke_2;
      v17[3] = &unk_1E6077E90;
      id v18 = v7;
      id v19 = *(id *)(a1 + 32);
      [v16 _retrieveImageDataWithReply:v17];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    v12 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v12();
  }
}

void __71__WFItemProviderEntityRequestMetadata_fetchLinkMetadataWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 _isSystem];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v8 = (void *)getUIImageClass_softClass;
  uint64_t v24 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __getUIImageClass_block_invoke;
    id v19 = &unk_1E6079C28;
    id v20 = &v21;
    __getUIImageClass_block_invoke((uint64_t)&v16);
    v8 = (void *)v22[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v21, 8);
  id v10 = v9;
  if (v7)
  {
    v11 = [v5 _name];
    [v10 systemImageNamed:v11];
  }
  else
  {
    v11 = [v5 _imageData];
    [v10 imageWithData:v11];
  v12 = };

  if (v12)
  {
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2050000000;
    v13 = (void *)getLPImageClass_softClass;
    uint64_t v24 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __getLPImageClass_block_invoke;
      id v19 = &unk_1E6079C28;
      id v20 = &v21;
      __getLPImageClass_block_invoke((uint64_t)&v16);
      v13 = (void *)v22[3];
    }
    v14 = v13;
    _Block_object_dispose(&v21, 8);
    id v15 = (void *)[[v14 alloc] initWithPlatformImage:v12];
    [*(id *)(a1 + 32) setImage:v15];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFItemProviderEntityRequestMetadata)initWithEntity:(id)a3 metadata:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFItemProviderRequestMetadata.m", 57, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFItemProviderRequestMetadata.m", 58, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFItemProviderEntityRequestMetadata;
  v11 = [(WFItemProviderEntityRequestMetadata *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entity, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
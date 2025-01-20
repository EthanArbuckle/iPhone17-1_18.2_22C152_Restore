@interface PBCoercionRegistry
@end

@implementation PBCoercionRegistry

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = +[_UIInterprocessKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  (*((void (**)(id, id, void, void))v5 + 2))(v5, v6, 0, 0);
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_2(uint64_t a1, uint64_t a2, UIImage *a3, void *a4)
{
  id v5 = a4;
  UIImagePNGRepresentation(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void, void))v5 + 2))(v5, v6, 0, 0);
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a4;
  _UIImageJPEGRepresentation(a3, 0, 0.8);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void, void))v5 + 2))(v5, v6, 0, 0);
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10 && v11)
  {
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
  }
  if (v10)
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:0];
    v14 = [v13 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v13 finishDecoding];
    if (v14)
    {
      v15 = 0;
    }
    else
    {
      v15 = PBCannotInstantiateObjectOfClassError();
      v14 = 0;
    }

    if (!a6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v15 = 0;
  v14 = 0;
  if (a6) {
LABEL_11:
  }
    *a6 = v15;
LABEL_12:

  return v14;
}

UIImage *__57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10 && v11)
  {
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
  }
  if (v10)
  {
    v13 = [[UIImage alloc] initWithData:v10];
    if (!a6) {
      goto LABEL_10;
    }
  }
  else
  {
    v13 = 0;
    if (!a6) {
      goto LABEL_10;
    }
  }
  if (!v13)
  {
    PBCannotInstantiateObjectOfClassError();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v13;
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_11;
  aBlock[3] = &unk_1E52FFEF8;
  id v7 = v2;
  id v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (*(void *)(a1 + 32) == *(void *)off_1E52D21C0)
  {
    v18 = [v8 string];
    v13 = [v18 dataUsingEncoding:4];

    id v14 = 0;
  }
  else
  {
    uint64_t v10 = [v8 length];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v20 = *(void *)off_1E52D1FC0;
    v21[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    id v19 = 0;
    v13 = objc_msgSend(v8, "dataFromRange:documentAttributes:error:", 0, v10, v12, &v19);
    id v14 = v19;

    if (v14)
    {
      v15 = [v14 domain];
      char v16 = [v15 isEqualToString:*MEMORY[0x1E4F88208]];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = PBCannotLoadRepresentationError();

        id v14 = (id)v17;
      }
    }
  }
  v9[2](v9, v13, 0, v14);
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(uint64_t a1, void *a2)
{
  id v2 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_13;
  aBlock[3] = &unk_1E52FFF40;
  id v7 = v2;
  id v3 = v2;
  v4 = _Block_copy(aBlock);

  return v4;
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_13(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (([*(id *)(a1 + 32) isEqualToString:*(void *)off_1E52D2078] & 1) == 0
    && ![*(id *)(a1 + 32) isEqualToString:*(void *)off_1E52D2448])
  {
    if (v11)
    {
      id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)off_1E52D1FC0;
      uint64_t v35 = v21;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      v30 = 0;
      v18 = (void *)[v20 initWithData:v11 options:v13 documentAttributes:0 error:&v30];
      v22 = v30;
    }
    else
    {
      if (!v12)
      {
LABEL_8:
        id v19 = 0;
        goto LABEL_18;
      }
      id v23 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v32 = *(void *)off_1E52D1FC0;
      uint64_t v33 = v24;
      id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v29 = 0;
      v18 = (void *)[v23 initWithURL:v12 options:v13 documentAttributes:0 error:&v29];
      v22 = v29;
    }
    id v19 = v22;
    goto LABEL_14;
  }
  id v13 = v11;
  if (!v13 && v12)
  {
    id v13 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v12];
  }
  if (!v13) {
    goto LABEL_8;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)off_1E52D2070;
  v36[0] = *(void *)off_1E52D1FC0;
  v36[1] = v16;
  v37[0] = v15;
  v37[1] = MEMORY[0x1E4F1CC28];
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  id v31 = 0;
  v18 = (void *)[v14 _initWithHTMLData:v13 options:v17 documentAttributes:0 error:&v31];
  id v19 = v31;

LABEL_14:
  if (v18) {
    goto LABEL_21;
  }
  if (v19)
  {
    v25 = [v19 domain];
    char v26 = [v25 isEqualToString:*MEMORY[0x1E4F88208]];

    if ((v26 & 1) == 0)
    {
      uint64_t v27 = PBCannotInstantiateObjectOfClassError();

      id v19 = (id)v27;
    }
  }
LABEL_18:
  if (a6)
  {
    id v19 = v19;
    v18 = 0;
    *a6 = v19;
  }
  else
  {
    v18 = 0;
  }
LABEL_21:

  return v18;
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_15;
  v12[3] = &unk_1E52FFF90;
  id v7 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v7;
  id v13 = v5;
  id v16 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  id v10 = _Block_copy(v12);

  return v10;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_15(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8 = a5;
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
  id v12 = a4;
  id v13 = a3;
  v11(v9, v10);
  id v14 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
  id v15 = PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 32));
  id v16 = PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 40));
  uint64_t v17 = objc_opt_class();
  id v25 = 0;
  v18 = ((void (**)(void, uint64_t, void *, id, id, id *))v14)[2](v14, v17, v15, v13, v12, &v25);

  id v19 = v25;
  id v20 = v19;
  if (v18)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    uint64_t v21 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v22 = PBUTIForNSAttributedStringDocumentType(*(void **)(a1 + 40));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_16;
    v23[3] = &unk_1E52FFF68;
    id v24 = v8;
    ((void (**)(void, void *, void *, void *))v21)[2](v21, v22, v18, v23);
  }
  else
  {
    if (!v19)
    {
      id v20 = PBCannotCoerceRepresentationOfTypeToRepresentationOfTypeError();
    }
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v20);
  }
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)MEMORY[0x1E4F881B8];
  id v10 = 0;
  id v7 = a4;
  id v8 = [v6 archivedDataFromObject:a3 requestedType:a2 outError:&v10];
  id v9 = v10;
  v7[2](v7, v8, 0, v9);
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 string];
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [MEMORY[0x1E4F881B8] objectFromArchivedData:a4 URL:a5 requestedClass:a2 typeIdentifier:a3 outError:a6];
}

id __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_20(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)off_1E52D2210;
  id v12 = *(void (**)(uint64_t, uint64_t))(v10 + 16);
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v12(v10, v11);
  id v16 = (void (**)(void, void, void, void, void, void))objc_claimAutoreleasedReturnValue();
  uint64_t v17 = ((void (**)(void, uint64_t, id, id, id, uint64_t))v16)[2](v16, a2, v15, v14, v13, a6);

  v18 = [v17 string];

  return v18;
}

void __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = (void *)MEMORY[0x1E4F881B8];
  id v10 = 0;
  id v7 = a4;
  id v8 = [v6 archivedDataFromObject:a3 requestedType:a2 outError:&v10];
  id v9 = v10;
  v7[2](v7, v8, 0, v9);
}

uint64_t __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [MEMORY[0x1E4F881B8] objectFromArchivedData:a4 URL:a5 requestedClass:a2 typeIdentifier:a3 outError:a6];
}

@end
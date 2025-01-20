@interface WFContentCollection
@end

@implementation WFContentCollection

void __91__WFContentCollection_QLPreviewControllerDataSource__previewController_previewItemAtIndex___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  v3 = v2;
  if (v2 && (v6 = v2, int v4 = [v2 conformsToProtocol:&unk_26E8DD0A8], v3 = v6, v4))
  {
    objc_msgSend(v6, "wf_refreshPreviewItemAtIndex:", *(void *)(a1 + 40));
  }
  else
  {

    if ([*(id *)(a1 + 32) currentPreviewItemIndex] == *(void *)(a1 + 40))
    {
      v5 = *(void **)(a1 + 32);
      [v5 refreshCurrentPreviewItem];
    }
  }
}

uint64_t __72__WFContentCollection_Previewing__previewProxyItemAtIndex_refreshBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOriginalItem:*(void *)(a1 + 40)];
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_setAssociatedObject(v5, &originalCollectionKey, *(id *)(a1 + 32), (void *)1);
  uint64_t v3 = [v5 numberOfItems];
  if (v3 != [*(id *)(a1 + 32) numberOfItems])
  {
    int v4 = [MEMORY[0x263F08690] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"WFContentCollection+Previewing.m" lineNumber:178 description:@"The Quick Look data source should not have a different number of items"];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_2;
  aBlock[3] = &unk_264C50BA8;
  id v6 = v4;
  id v38 = v6;
  id v7 = v5;
  id v39 = v7;
  v8 = _Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = [v6 preferredFileType];
      v12 = [MEMORY[0x263F852B8] typeFromFileExtension:@"md"];
      int v13 = [v11 conformsToType:v12];

      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        v33[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_4;
        v33[3] = &unk_264C50BD0;
        id v34 = v8;
        [v6 coerceToItemClass:v14 completionHandler:v33];
        id v10 = v34;
        goto LABEL_4;
      }
      v15 = [v6 preferredFileType];
      int v16 = [v15 conformsToUTType:*MEMORY[0x263F1DC68]];

      if (v16)
      {
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_5;
        v31[3] = &unk_264C50B10;
        id v32 = v8;
        v17 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
        [v6 getFileRepresentation:v31 forType:v17];

        id v10 = v32;
        goto LABEL_4;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [v6 preferredFileType];
        uint64_t v19 = *MEMORY[0x263F1DB00];
        int v20 = [v18 conformsToUTType:*MEMORY[0x263F1DB00]];

        if (v20)
        {
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_6;
          v28[3] = &unk_264C50BF8;
          id v29 = v6;
          id v30 = v8;
          v21 = [MEMORY[0x263F852B8] typeWithUTType:v19];
          [v29 getFileRepresentation:v28 forType:v21];

          id v10 = v29;
          goto LABEL_4;
        }
        v22 = [v6 preferredFileType];
        if ([v22 conformsToUTType:*MEMORY[0x263F1DAA8]])
        {

LABEL_16:
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7;
          v26[3] = &unk_264C50B10;
          id v27 = v8;
          v25 = objc_msgSend(MEMORY[0x263F852B8], "typeWithUTType:", *MEMORY[0x263F1DC70], v26[0], 3221225472, __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7, &unk_264C50B10);
          [v6 getFileRepresentation:v26 forType:v25];

          id v10 = v27;
          goto LABEL_4;
        }
        v23 = [v6 preferredFileType];
        int v24 = [v23 conformsToUTType:*MEMORY[0x263F1DD70]];

        if (v24) {
          goto LABEL_16;
        }
      }
      (*((void (**)(void *, id, void))v8 + 2))(v8, v6, 0);
      goto LABEL_5;
    }
  }
  uint64_t v9 = objc_opt_class();
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_3;
  v35[3] = &unk_264C50BD0;
  id v36 = v8;
  [v6 coerceToItemClass:v9 completionHandler:v35];
  id v10 = v36;
LABEL_4:

LABEL_5:
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = v15;
  uint64_t v9 = v7;
  if (!v15)
  {
    id v10 = (void *)MEMORY[0x263F33998];
    v11 = [v7 localizedDescription];
    v12 = v11;
    if (!v11)
    {
      int v13 = NSString;
      uint64_t v3 = WFLocalizedString(@"Quick Look failed to preview %@");
      id v4 = [*(id *)(a1 + 32) name];
      v12 = objc_msgSend(v13, "localizedStringWithFormat:", v3, v4);
    }
    uint64_t v14 = [v9 localizedFailureReason];
    id v16 = [v10 itemWithObject:v12 named:v14];

    if (!v11)
    {
    }
    id v8 = v16;
  }
  id v17 = v8;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v11 = [a2 firstObject];
  id v6 = [v11 name];
  id v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
  id v8 = [v7 fileExtension];
  uint64_t v9 = [v6 stringByAppendingPathExtension:v8];
  id v10 = (void *)[v11 copyWithName:v9];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x263F33960] itemWithFile:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F33960];
  uint64_t v4 = [a2 data];
  id v11 = [v3 normalizedHTMLDocumentFromHTMLData:v4];

  id v5 = (void *)MEMORY[0x263F33960];
  id v6 = (void *)MEMORY[0x263F33870];
  id v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DB00]];
  id v8 = [*(id *)(a1 + 32) name];
  uint64_t v9 = [v6 fileWithData:v11 ofType:v7 proposedFilename:v8];
  id v10 = [v5 itemWithFile:v9];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__WFContentCollection_Previewing__generatePreviewControllerDataSource___block_invoke_7(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = [MEMORY[0x263F337C8] itemWithFile:a2];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v3();
  }
}

@end
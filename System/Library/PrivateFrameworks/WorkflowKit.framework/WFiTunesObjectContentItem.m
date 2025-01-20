@interface WFiTunesObjectContentItem
+ (BOOL)canLowercaseTypeDescription;
+ (BOOL)parseiTunesURL:(id)a3 itemIdentifier:(id *)a4 countryCode:(id *)a5;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (BOOL)urlItem_canCoerceFromURL:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)propertyBuilders;
+ (id)urlItem_outputClasses;
+ (id)urlItem_sharingItemClassesByBundleIdentifier;
+ (void)urlItem_generateObjectRepresentations:(id)a3 fromURL:(id)a4 forClass:(Class)a5;
+ (void)urlItem_generateObjectRepresentations:(id)a3 fromiTunesURL:(id)a4 forClass:(Class)a5;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (WFiTunesObject)object;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)possibleArtworkURLs;
- (id)preferredFileType;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)getArtworkDataWithURLs:(id)a3 completionHandler:(id)a4;
- (void)getArtworkForSize:(CGSize)a3 completionHandler:(id)a4;
- (void)getPreferredArtworkURL:(id)a3;
@end

@implementation WFiTunesObjectContentItem

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  int v6 = [v4 conformsToType:v5];

  if (v6)
  {
    v7 = [(WFiTunesObjectContentItem *)self object];
    v8 = [v7 artworkURLs];
    unsigned __int8 isKindOfClass = [v8 count] != 0;
  }
  else
  {
    id v10 = v4;
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v11 = v10;
      }
      else {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
    id v12 = v11;

    v13 = [v12 string];

    LODWORD(v12) = [v13 isEqualToString:@"MPMediaItem"];
    if (!v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)WFiTunesObjectContentItem;
      unsigned __int8 isKindOfClass = [(WFiTunesObjectContentItem *)&v15 canGenerateRepresentationForType:v10];
      goto LABEL_12;
    }
    v7 = [(WFiTunesObjectContentItem *)self object];
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  }

LABEL_12:
  return isKindOfClass & 1;
}

- (id)preferredFileType
{
  return (id)[MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44470]];
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ((Class)objc_opt_class() == a3)
  {
    v24 = [(WFiTunesObjectContentItem *)self object];
    v25 = [v24 viewURL];

    if (v25)
    {
      v26 = (void *)MEMORY[0x1E4F5A9A0];
      v27 = [(WFiTunesObjectContentItem *)self name];
      v23 = [v26 object:v25 named:v27];
    }
    else
    {
      v23 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  v9 = NSStringFromClass(a3);
  int v10 = [@"MPMediaItem" isEqualToString:v9];

  if (!v10)
  {
    if ((Class)objc_opt_class() != a3)
    {
      v46.receiver = self;
      v46.super_class = (Class)WFiTunesObjectContentItem;
      v23 = [(WFiTunesObjectContentItem *)&v46 generateObjectRepresentationForClass:a3 options:v8 error:a5];
      goto LABEL_31;
    }
    v25 = [(WFiTunesObjectContentItem *)self object];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v25 artistName], (uint64_t v28 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v29 = (void *)v28;
      v30 = NSString;
      v31 = WFLocalizedString(@"%1$@ by %2$@");
      v32 = [v25 name];
      v33 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v32, v29);
    }
    else
    {
      v33 = [v25 name];
    }
    uint64_t v34 = [v33 length];
    v35 = [v25 viewURL];
    v36 = v35;
    if (v34)
    {
      if (v35)
      {
        v37 = NSString;
        v38 = WFLocalizedString(@"%1$@ (%2$@)");
        v39 = [v25 viewURL];
        v40 = [v39 absoluteString];
        v41 = objc_msgSend(v37, "localizedStringWithFormat:", v38, v33, v40);

LABEL_26:
        if ([v41 length])
        {
          v43 = (void *)MEMORY[0x1E4F5A9A0];
          v44 = [(WFiTunesObjectContentItem *)self name];
          v23 = [v43 object:v41 named:v44];
        }
        else
        {
          v23 = 0;
        }

        goto LABEL_30;
      }
      id v42 = v33;
    }
    else
    {
      id v42 = [v35 absoluteString];
    }
    v41 = v42;
    goto LABEL_26;
  }
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2050000000;
  v11 = (void *)getMPMediaPropertyPredicateClass_softClass_35937;
  uint64_t v55 = getMPMediaPropertyPredicateClass_softClass_35937;
  if (!getMPMediaPropertyPredicateClass_softClass_35937)
  {
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __getMPMediaPropertyPredicateClass_block_invoke_35938;
    v50 = &unk_1E6558B78;
    v51 = &v52;
    __getMPMediaPropertyPredicateClass_block_invoke_35938((uint64_t)&v47);
    v11 = (void *)v53[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v52, 8);
  v13 = [(WFiTunesObjectContentItem *)self object];
  v14 = [v13 identifier];
  objc_super v15 = [v12 predicateWithValue:v14 forProperty:@"storeItemAdamID"];

  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2050000000;
  v16 = (void *)getMPMediaQueryClass_softClass_35940;
  uint64_t v55 = getMPMediaQueryClass_softClass_35940;
  if (!getMPMediaQueryClass_softClass_35940)
  {
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __getMPMediaQueryClass_block_invoke_35941;
    v50 = &unk_1E6558B78;
    v51 = &v52;
    __getMPMediaQueryClass_block_invoke_35941((uint64_t)&v47);
    v16 = (void *)v53[3];
  }
  v17 = v16;
  _Block_object_dispose(&v52, 8);
  id v18 = [v17 alloc];
  v19 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  v20 = (void *)[v18 initWithFilterPredicates:v19];

  v21 = [v20 items];
  v22 = [v21 firstObject];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F5A9A0] object:v22];
  }
  else
  {
    v23 = 0;
  }

LABEL_31:
  return v23;
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 conformsToUTType:*MEMORY[0x1E4F44400]])
  {
    v11 = [(WFiTunesObjectContentItem *)self object];
    id v12 = [v11 artworkURLs];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v20[0] = 0;
      v20[1] = v20;
      v20[2] = 0x3032000000;
      v20[3] = __Block_byref_object_copy__35978;
      v20[4] = __Block_byref_object_dispose__35979;
      id v21 = 0;
      v14 = [(WFiTunesObjectContentItem *)self possibleArtworkURLs];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke;
      v19[3] = &unk_1E6552340;
      v19[4] = self;
      v19[5] = v20;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_3;
      v16[3] = &unk_1E6552368;
      id v17 = v8;
      id v18 = v20;
      objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v19, v16);

      _Block_object_dispose(v20, 8);
    }
    else
    {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFiTunesObjectContentItem;
    [(WFiTunesObjectContentItem *)&v15 generateFileRepresentation:v8 options:v9 forType:v10];
  }
}

void __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_2;
  v16[3] = &unk_1E6552318;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  id v19 = v9;
  uint64_t v20 = v11;
  id v17 = v8;
  uint64_t v18 = v12;
  uint64_t v21 = a5;
  id v13 = v8;
  id v14 = v9;
  objc_super v15 = [v10 downloadTaskWithURL:v13 completionHandler:v16];
  [v15 resume];
}

uint64_t __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

void __72__WFiTunesObjectContentItem_generateFileRepresentation_options_forType___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v23
    && (objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 200, 100),
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_msgSend(v9, "containsIndex:", objc_msgSend(v7, "statusCode")),
        v9,
        (v10 & 1) != 0))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB4718];
    uint64_t v12 = [v7 MIMEType];
    id v13 = [v11 typeFromMIMEType:v12];

    id v14 = [v13 typeDescription];

    if (!v14)
    {
      objc_super v15 = (void *)MEMORY[0x1E4FB4718];
      v16 = [*(id *)(a1 + 32) lastPathComponent];
      uint64_t v17 = [v15 typeFromFilename:v16];

      id v13 = (void *)v17;
    }
    uint64_t v18 = (void *)MEMORY[0x1E4F5A900];
    id v19 = [*(id *)(a1 + 40) name];
    uint64_t v20 = [v18 fileWithURL:v23 options:3 ofType:v13 proposedFilename:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    **(unsigned char **)(a1 + 64) = 1;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)getPreferredArtworkURL:(id)a3
{
  id v4 = a3;
  v5 = [(WFiTunesObjectContentItem *)self possibleArtworkURLs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__WFiTunesObjectContentItem_getPreferredArtworkURL___block_invoke;
  v7[3] = &unk_1E65522F0;
  id v8 = v4;
  id v6 = v4;
  [(WFiTunesObjectContentItem *)self getArtworkDataWithURLs:v5 completionHandler:v7];
}

uint64_t __52__WFiTunesObjectContentItem_getPreferredArtworkURL___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getArtworkForSize:(CGSize)a3 completionHandler:(id)a4
{
  double width = a3.width;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(WFiTunesObjectContentItem *)self object];
  id v8 = [v7 artworkURLs];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [v8 allKeys];
  char v10 = [v9 sortedArrayUsingSelector:sel_compare_];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v27 != v13) {
        objc_enumerationMutation(v10);
      }
      objc_super v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
      double v16 = (double)[v15 integerValue];
      uint64_t v17 = [MEMORY[0x1E4FB46B8] currentDevice];
      [v17 screenScale];
      double v19 = width * v18;

      if (v19 <= v16) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v20 = v15;

    if (v20)
    {
      uint64_t v21 = [v8 objectForKey:v20];
      if (v21)
      {
        v22 = v21;
        id v23 = WFPossibleArtworkURLsForArtworkURL(v21);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __65__WFiTunesObjectContentItem_getArtworkForSize_completionHandler___block_invoke;
        v24[3] = &unk_1E65522F0;
        id v25 = v6;
        [(WFiTunesObjectContentItem *)self getArtworkDataWithURLs:v23 completionHandler:v24];

        goto LABEL_14;
      }
    }
  }
  else
  {
LABEL_9:

    id v20 = 0;
  }
  (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
LABEL_14:
}

void __65__WFiTunesObjectContentItem_getArtworkForSize_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a3)
  {
    id v7 = (void *)MEMORY[0x1E4FB4770];
    id v8 = a5;
    id v10 = [v7 imageWithData:a3 scale:0 allowAnimated:1.0];
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void))(v5 + 16);
    id v10 = a5;
    v9(v5, 0);
  }
}

- (void)getArtworkDataWithURLs:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__35978;
  v18[4] = __Block_byref_object_dispose__35979;
  id v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__35978;
  void v16[4] = __Block_byref_object_dispose__35979;
  id v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__35978;
  v14[4] = __Block_byref_object_dispose__35979;
  id v15 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke;
  v13[3] = &unk_1E65522C8;
  v13[4] = v18;
  v13[5] = v16;
  v13[6] = v14;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_3;
  v8[3] = &unk_1E6552660;
  id v7 = v6;
  id v9 = v7;
  id v10 = v18;
  uint64_t v11 = v14;
  uint64_t v12 = v16;
  objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v13, v8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(v18, 8);
}

void __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F290E0], "wf_sharedSession");
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  double v16 = __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_2;
  id v17 = &unk_1E65522A0;
  id v18 = v8;
  id v19 = v9;
  long long v20 = *(_OWORD *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = a5;
  id v11 = v8;
  id v12 = v9;
  uint64_t v13 = [v10 dataTaskWithURL:v11 completionHandler:&v14];
  objc_msgSend(v13, "resume", v14, v15, v16, v17);
}

uint64_t __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, void, void, uint64_t))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), a3);
}

void __70__WFiTunesObjectContentItem_getArtworkDataWithURLs_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v12 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 200, 100);
  char v11 = objc_msgSend(v10, "containsIndex:", objc_msgSend(v8, "statusCode"));

  if (v11)
  {
    **(unsigned char **)(a1 + 72) = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)possibleArtworkURLs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(WFiTunesObjectContentItem *)self object];
  id v4 = [v3 artworkURLs];
  id v5 = [v4 allKeys];
  id v6 = [v5 sortedArrayUsingSelector:sel_compare_];
  id v7 = [v6 reverseObjectEnumerator];
  id v8 = [v7 allObjects];

  id v9 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        double v16 = [(WFiTunesObjectContentItem *)self object];
        id v17 = [v16 artworkURLs];
        id v18 = [v17 objectForKeyedSubscript:v15];

        if (v18)
        {
          id v19 = WFPossibleArtworkURLsForArtworkURL(v18);
          [v9 addObjectsFromArray:v19];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  return v9;
}

- (WFiTunesObject)object
{
  uint64_t v3 = objc_opt_class();
  return (WFiTunesObject *)[(WFiTunesObjectContentItem *)self objectForClass:v3];
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d iTunes products");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iTunes products", @"iTunes products");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"iTunes product", @"iTunes product");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F5AA90];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  id v3 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  id v5 = [MEMORY[0x1E4F5A9A8] typeWithClass:objc_opt_class()];
  id v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB4718] typeWithUTType:*MEMORY[0x1E4F44400]];
  char v6 = [v4 conformsToType:v5];

  if (v6) {
    goto LABEL_8;
  }
  id v7 = v4;
  if (v7)
  {
    objc_opt_class();
    id v8 = (objc_opt_isKindOfClass() & 1) != 0 ? v7 : 0;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  id v10 = [v9 string];

  LOBYTE(v9) = [v10 isEqualToString:@"MPMediaItem"];
  if (v9)
  {
LABEL_8:
    unsigned __int8 v11 = 1;
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___WFiTunesObjectContentItem;
    unsigned __int8 v11 = objc_msgSendSuper2(&v13, sel_supportedTypeMustBeDeterminedByInstance_, v7);
  }

  return v11;
}

+ (id)propertyBuilders
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() == a1)
  {
    id v3 = (void *)MEMORY[0x1E4F5A880];
    id v4 = WFLocalizedContentPropertyNameMarker(@"Store ID");
    id v5 = [v3 keyPath:@"object.identifier" name:v4 class:objc_opt_class()];
    v16[0] = v5;
    char v6 = (void *)MEMORY[0x1E4F5A880];
    id v7 = WFLocalizedContentPropertyNameMarker(@"Store URL");
    id v8 = [v6 keyPath:@"object.viewURL" name:v7 class:objc_opt_class()];
    v16[1] = v8;
    id v9 = (void *)MEMORY[0x1E4F5A880];
    id v10 = WFLocalizedContentPropertyNameMarker(@"Artwork");
    unsigned __int8 v11 = [v9 block:&__block_literal_global_36044 name:v10 class:objc_opt_class()];
    v16[2] = v11;
    uint64_t v12 = (void *)MEMORY[0x1E4F5A880];
    objc_super v13 = WFLocalizedContentPropertyNameMarker(@"Artwork URL");
    uint64_t v14 = [v12 block:&__block_literal_global_244_36046 name:v13 class:objc_opt_class()];
    v16[3] = v14;
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:4];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_4;
  v7[3] = &unk_1E6552278;
  id v8 = v5;
  id v6 = v5;
  [a2 getPreferredArtworkURL:v7];
}

uint64_t __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_2;
  v8[3] = &unk_1E6552250;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:objc_opt_class()];
}

uint64_t __45__WFiTunesObjectContentItem_propertyBuilders__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)urlItem_generateObjectRepresentations:(id)a3 fromiTunesURL:(id)a4 forClass:(Class)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v22 = 0;
  id v23 = 0;
  char v9 = [a1 parseiTunesURL:a4 itemIdentifier:&v23 countryCode:&v22];
  id v10 = v23;
  id v11 = v22;
  if (v9)
  {
    uint64_t v12 = objc_opt_new();
    id v24 = v10;
    objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromiTunesURL_forClass___block_invoke;
    v19[3] = &unk_1E6552208;
    Class v21 = a5;
    id v20 = v8;
    [v12 lookupMediaWithIdentifiers:v13 countryCode:v11 completion:v19];

    uint64_t v14 = v20;
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F289A0];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    uint64_t v14 = WFLocalizedString(@"Invalid iTunes URL");
    v26[0] = v14;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    id v18 = [v15 errorWithDomain:v16 code:-1000 userInfo:v17];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v18);
  }
}

void __90__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromiTunesURL_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a2 objectsMatchingClass:*(void *)(a1 + 40)];
  id v7 = [v6 firstObject];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    char v9 = [MEMORY[0x1E4F5A9A0] object:v7];
    v11[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v5);
  }
}

+ (void)urlItem_generateObjectRepresentations:(id)a3 fromURL:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 host];
  int v11 = [v10 hasSuffix:@"itunes.apple.com"];

  if (v11)
  {
    objc_msgSend(a1, "urlItem_generateObjectRepresentations:fromiTunesURL:forClass:", v8, v9, a5);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __84__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromURL_forClass___block_invoke;
    v12[3] = &unk_1E65521E0;
    id v14 = a1;
    id v13 = v8;
    Class v15 = a5;
    +[WFURLExpander expandURL:v9 completionHandler:v12];

    id v9 = v13;
  }
}

uint64_t __84__WFiTunesObjectContentItem_urlItem_generateObjectRepresentations_fromURL_forClass___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "urlItem_generateObjectRepresentations:fromiTunesURL:forClass:", *(void *)(a1 + 32), a2, *(void *)(a1 + 48));
}

+ (BOOL)urlItem_canCoerceFromURL:(id)a3
{
  id v4 = a3;
  id v5 = [v4 host];
  if (([v5 isEqualToString:@"appsto.re"] & 1) != 0
    || ([v5 isEqualToString:@"itun.es"] & 1) != 0)
  {
    char v6 = 1;
  }
  else if (([v5 hasSuffix:@"itunes.apple.com"] & 1) != 0 {
         || ([v5 hasSuffix:@"music.apple.com"] & 1) != 0
  }
         || ([v5 hasSuffix:@"books.apple.com"] & 1) != 0
         || ([v5 hasSuffix:@"podcasts.apple.com"] & 1) != 0
         || [v5 hasSuffix:@"apps.apple.com"])
  {
    char v6 = [a1 parseiTunesURL:v4 itemIdentifier:0 countryCode:0];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)parseiTunesURL:(id)a3 itemIdentifier:(id *)a4 countryCode:(id *)a5
{
  id v7 = a3;
  id v8 = objc_msgSend(v7, "dc_queryDictionary");
  id v9 = [v8 objectForKey:@"i"];

  if ([v9 integerValue])
  {
    id v10 = v9;
  }
  else
  {
    int v11 = [v7 lastPathComponent];
    if ([v11 hasPrefix:@"id"])
    {
      id v12 = [v11 substringFromIndex:2];
    }
    else
    {
      id v12 = v11;
    }
    id v10 = v12;
  }
  uint64_t v13 = [v10 integerValue];
  if (v13)
  {
    id v14 = [v7 pathComponents];
    if ((unint64_t)[v14 count] < 2)
    {
      uint64_t v16 = 0;
    }
    else
    {
      Class v15 = [v7 pathComponents];
      uint64_t v16 = [v15 objectAtIndex:1];
    }
    if ([v16 length] != 2)
    {

      uint64_t v16 = 0;
    }
    if (a4) {
      *a4 = v10;
    }
    if (a5) {
      *a5 = v16;
    }
  }
  return v13 != 0;
}

+ (id)urlItem_sharingItemClassesByBundleIdentifier
{
  v5[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.AppStore";
  v5[0] = objc_opt_class();
  v4[1] = @"com.apple.MobileStore";
  v5[1] = objc_opt_class();
  void v4[2] = @"com.apple.iBooks";
  v5[2] = objc_opt_class();
  v4[3] = @"com.apple.podcasts";
  v5[3] = objc_opt_class();
  v4[4] = @"com.apple.Music";
  v5[4] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:5];
  return v2;
}

+ (id)urlItem_outputClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "orderedSetWithObjects:", v3, objc_opt_class(), 0);
}

@end
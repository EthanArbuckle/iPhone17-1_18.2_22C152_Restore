@interface ICHashtagController
@end

@implementation ICHashtagController

void __101__ICHashtagController_App__createNewHashtagIfNecessary_textStorage_ignoreDelimiter_parentAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v11 = a2;
  v12 = [v11 stringByApplyingTransform:*MEMORY[0x263EFF5A0] reverse:0];
  v13 = objc_msgSend(NSString, "ic_hashtagCharacterString");
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v30;
      unint64_t v19 = a3 + a4;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v15);
          }
          unint64_t v21 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "range", (void)v29);
          if (v19 >= v21 && v19 - v21 < v22)
          {

            goto LABEL_21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
    }

    objc_msgSend(*(id *)(a1 + 40), "setEditedRange:", a3, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "length") + 1);
    if ([*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) length]
      && (objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "ic_isNumeric") & 1) == 0)
    {
      if (*(unsigned char *)(a1 + 80)) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = *(void *)(a1 + 48);
      }
      objc_msgSend(*(id *)(a1 + 40), "insertHashtagWithText:viaAutoComplete:delimiter:parentAttachment:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 0, v24, *(void *)(a1 + 56), (void)v29);
    }
LABEL_21:
    objc_msgSend(*(id *)(a1 + 40), "clearUnconfirmedHashtagInTextStorage:", *(void *)(a1 + 64), (void)v29);
    goto LABEL_22;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isValidElement:", objc_msgSend(v11, "characterAtIndex:", 0)) & 1) == 0
    && ![*(id *)(a1 + 40) isEmoji:v11])
  {
LABEL_22:
    *a7 = 1;
    goto LABEL_23;
  }
  v25 = [v11 stringByAppendingString:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v26 = [v25 mutableCopy];
  uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
  v28 = *(void **)(v27 + 40);
  *(void *)(v27 + 40) = v26;

LABEL_23:
}

uint64_t __36__ICHashtagController_App__isEmoji___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t result = CEMStringIsSingleEmoji();
  if (!result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a7 = 1;
  }
  return result;
}

uint64_t __67__ICHashtagController_App__rangeOfUnconfirmedHashtagInTextStorage___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    *(void *)(v5 + 32) = a3;
    *(void *)(v5 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

@end
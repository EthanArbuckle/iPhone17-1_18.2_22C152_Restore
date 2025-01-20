@interface ICMarkupUtilities
@end

@implementation ICMarkupUtilities

void __100__ICMarkupUtilities_UI__dataToEditForAttachment_includeMarkupModelData_embedMarkupModelDataInImage___block_invoke(uint64_t a1)
{
  id v20 = [*(id *)(a1 + 32) media];
  if ([v20 isPasswordProtected]) {
    [v20 decryptedData];
  }
  else {
  uint64_t v2 = [v20 data];
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = (int)[*(id *)(a1 + 32) orientation];
    if (([*(id *)(a1 + 32) shouldEmbedMarkupDataInMedia] & 1) != 0 || !*(unsigned char *)(a1 + 56))
    {
      v6 = 0;
    }
    else
    {
      v6 = [*(id *)(a1 + 32) markupModelData];
    }
    v7 = [*(id *)(a1 + 32) croppingQuad];
    if (v5 || [*(id *)(a1 + 32) imageFilterType] || v7)
    {
      v8 = (void *)MEMORY[0x1B3E9ED80]();
      v9 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithData:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      if (v7)
      {
        uint64_t v10 = [MEMORY[0x1E4F45E08] perspectiveCorrectedImageFromImage:v9 normalizedImageQuad:v7];

        v9 = (void *)v10;
      }
      v11 = objc_msgSend(MEMORY[0x1E4F45E08], "filteredImage:orientation:imageFilterType:", v9, 0, objc_msgSend(*(id *)(a1 + 32), "imageFilterType"));

      v12 = [MEMORY[0x1E4F45E08] imageWithRGBColorspaceFromImage:v11];

      if (v5)
      {
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_orientedImageFromImage:toOrientation:", v12, v5);

        v12 = (void *)v13;
      }
      uint64_t v14 = objc_msgSend(v12, "ic_JPEGData");
      uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v14;
    }
    if ([v6 length])
    {
      uint64_t v17 = [*(id *)(a1 + 48) imageDataWithMarkupModelData:v6 sourceImageData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) embedData:*(unsigned __int8 *)(a1 + 57)];
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
}

@end
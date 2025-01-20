@interface PKPhysicalCard
@end

@implementation PKPhysicalCard

void __46__PKPhysicalCard_PKUIUtilities__artworkImage___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F84780]), "initWithCGImage:scale:orientation:", objc_msgSend(v6, "CGImage"), 1, PKUIScreenScale());
    [v3 setFrontFaceImage:v4];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v6);
  }
}

void __66__PKPhysicalCard_PKUIUtilities___downloadImageFromURL_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_4:
    if (v7)
    {
      v11 = [MEMORY[0x1E4FB1818] imageWithData:v7 scale:PKUIScreenScale()];
      if (v11)
      {
LABEL_13:
        uint64_t v15 = *(void *)(a1 + 40);
        if (v15) {
          (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v11);
        }
        goto LABEL_20;
      }
      v12 = PKLogFacilityTypeGetObject();
    }
    else
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v19 = 138412546;
        uint64_t v20 = v13;
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Failed to download card image from %@ due to %@", (uint8_t *)&v19, 0x16u);
      }
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v19 = 138412290;
      uint64_t v20 = v14;
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Could not parse card image from %@", (uint8_t *)&v19, 0xCu);
    }

    v11 = 0;
    goto LABEL_13;
  }
  id v10 = v8;
  if ([v10 statusCode] == 200)
  {

    goto LABEL_4;
  }
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v19 = 138412546;
    uint64_t v20 = v17;
    __int16 v21 = 1024;
    LODWORD(v22) = [v10 statusCode];
    _os_log_impl(&dword_19F450000, v16, OS_LOG_TYPE_DEFAULT, "Could not download card image from %@ http status %d", (uint8_t *)&v19, 0x12u);
  }

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(uint64_t, void))(v18 + 16))(v18, 0);
  }

  v11 = 0;
LABEL_20:
}

@end
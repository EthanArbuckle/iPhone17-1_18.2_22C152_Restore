@interface TVMonogramAppleAccountImageGenerator
@end

@implementation TVMonogramAppleAccountImageGenerator

void __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isCancelled] & 1) == 0)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F25D08]);
    v3 = v2;
    if (v2)
    {
      [v2 setMonogramType:1];
      [v3 setPictureDiameter:*(double *)(a1 + 56)];
      id v4 = objc_alloc_init(MEMORY[0x263F25860]);
      v5 = (void *)[*(id *)(a1 + 32) copyQueryStringDictionaryWithUnescapedValues:1];
      v6 = [v5 objectForKeyedSubscript:@"firstName"];
      [v4 setFirstName:v6];

      v7 = [v5 objectForKeyedSubscript:@"lastName"];
      [v4 setLastName:v7];

      v8 = [v5 objectForKeyedSubscript:@"email"];
      [v4 setAppleID:v8];

      v9 = NSNumber;
      v10 = [v5 objectForKeyedSubscript:@"dsid"];
      v11 = objc_msgSend(v9, "numberWithLongLong:", objc_msgSend(v10, "longLongValue"));
      [v4 setPersonID:v11];

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2;
      v15[3] = &unk_264BA8EB8;
      long long v14 = *(_OWORD *)(a1 + 40);
      id v12 = (id)v14;
      long long v16 = v14;
      [v3 fetchProfilePictureForFamilyMember:v4 completion:v15];
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v4 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, id))(v13 + 16))(v13, 0, 0, 0, 0, v4);
    }
  }
}

void __126___TVMonogramAppleAccountImageGenerator_loadImageForURL_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isCancelled] & 1) == 0)
  {
    id v6 = v9;
    if ([v6 CGImage]) {
      v7 = -[TVImage initWithCGImageRef:preserveAlpha:]([TVImage alloc], "initWithCGImageRef:preserveAlpha:", [v6 CGImage], 1);
    }
    else {
      v7 = 0;
    }
    if (v7) {
      id v8 = 0;
    }
    else {
      id v8 = v5;
    }
    (*(void (**)(void, TVImage *, void, void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, 0, 0, 2, v8);
  }
}

@end
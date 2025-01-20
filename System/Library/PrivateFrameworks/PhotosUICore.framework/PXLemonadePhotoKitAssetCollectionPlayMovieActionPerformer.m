@interface PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer
+ ($4C472092DE67A143DAA215F616F8A186)canPerformReasoningOnAssetCollectionReference:(SEL)a3;
+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4;
+ (BOOL)canPerformOnPHPerson:(id)a3;
+ (id)reasoningStructDescriptionFor:(id *)a3;
@end

@implementation PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer

+ (id)reasoningStructDescriptionFor:(id *)a3
{
  v3 = @"YES";
  v4 = @"NO";
  if (a3->var5) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (a3->var6) {
    v4 = @"YES";
  }
  if (!a3->var7) {
    v3 = @"NO'";
  }
  return (id)[NSString stringWithFormat:@"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformerCanPerformReasoning {\ndecisioningVersion: %llu\n\nestimatedAssetCollectionSize: %llu,\n\npx_estimatedCuratedAssetCollectionSize: %llu,\n\nmemoryMinimumAssetCountPreset: %llu,\n\nmemoryMaximumAssetCountPreset: %llu,\n\nisAssetCountAcceptableForMemoryLensPlayback_px_estimatedCureatedAssetCountResult: %@,\nisAssetCountAcceptableForMemoryLensPlayback_estimatedAssetCountResult: %@,\n\nfinalCanPerformResult: %@\n}", *(_OWORD *)&a3->var0, *(_OWORD *)&a3->var2, a3->var4, v5, v4, v3];
}

+ (BOOL)canPerformOnPHPerson:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F38EB8];
  v11[0] = a3;
  v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:v11 count:1];
  v7 = [v3 fetchAssetsForPersons:v6 options:0];
  uint64_t v8 = [v7 count];

  BOOL v9 = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:v8];
  if (!v9) {
    NSLog(&cfstr_Pxlemonadephot_2.isa, v8);
  }
  return v9;
}

+ ($4C472092DE67A143DAA215F616F8A186)canPerformReasoningOnAssetCollectionReference:(SEL)a3
{
  id v16 = [a4 assetCollection];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v16, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a3, a2, @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m", 49, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a3, a2, @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m", 49, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v13 object file lineNumber description];
  }

LABEL_3:
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var1 = [v16 estimatedAssetCount];
  retstr->var2 = objc_msgSend(v16, "px_estimatedCuratedAssetsCount");
  v7 = +[PXLemonadeSettings sharedInstance];
  retstr->var3 = [v7 minimumNumberOfAssetsForPlaybackAsMemory];

  uint64_t v8 = +[PXLemonadeSettings sharedInstance];
  retstr->var4 = [(id)v8 maximumNumberOfAssetsForPlaybackAsMemory];

  LOBYTE(v8) = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryLensPlayback:", objc_msgSend(v16, "px_estimatedCuratedAssetsCount"));
  retstr->var5 = v8;
  BOOL v9 = +[PXMemoriesRelatedSettings isAssetCountAcceptableForMemoryLensPlayback:](PXMemoriesRelatedSettings, "isAssetCountAcceptableForMemoryLensPlayback:", [v16 estimatedAssetCount]);
  retstr->var6 = v9;
  retstr->var7 = v9 | v8;

  return result;
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v6 = a3;
  v7 = [v6 assetCollection];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v14);
    v15 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v11 handleFailureInMethod:a2, a1, @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m", 24, @"%@ should be an instance inheriting from %@, but it is %@", @"assetCollectionReference.assetCollection", v13, v15 object file lineNumber description];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    [v11 handleFailureInMethod:a2, a1, @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer.m", 24, @"%@ should be an instance inheriting from %@, but it is nil", @"assetCollectionReference.assetCollection", v13 object file lineNumber description];
  }

LABEL_3:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    [a1 canPerformReasoningOnAssetCollectionReference:v6];
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    BOOL v9 = [a1 reasoningStructDescriptionFor:v16];
    NSLog(&cfstr_Pxlemonadephot_1.isa, v9);

    BOOL v8 = 0;
  }

  return v8;
}

@end
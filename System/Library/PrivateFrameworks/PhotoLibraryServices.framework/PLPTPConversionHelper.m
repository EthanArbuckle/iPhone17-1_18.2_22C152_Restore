@interface PLPTPConversionHelper
+ (id)conversionRequestForAsset:(id)a3 sourceHints:(id)a4 withPeerCapabilites:(id)a5;
+ (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 withConversionManager:(id)a5 peerCapabilities:(id)a6;
@end

@implementation PLPTPConversionHelper

+ (id)conversionRequestForAsset:(id)a3 sourceHints:(id)a4 withPeerCapabilites:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 originalFilename];
  v11 = [v7 fullDirectoryPath];
  v34 = (void *)v10;
  uint64_t v12 = [v11 stringByAppendingPathComponent:v10];

  v33 = (void *)v12;
  v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];
  v14 = [v7 groupUUID];
  int v15 = [v8 isVideo];
  v16 = (void *)MEMORY[0x1E4F74900];
  if (!v15)
  {
    [v7 imagePixSize];
    v17 = objc_msgSend(v16, "imageSourceForFileURL:dimensions:", v13);
    goto LABEL_14;
  }
  v17 = [MEMORY[0x1E4F74900] videoSourceForFileURL:v13];
  if ([v8 isLivePhoto] && (objc_msgSend(v8, "isRender") & 1) == 0)
  {
    if ([v8 livePhotoImageIsHEIC])
    {
      v18 = v17;
      uint64_t v19 = 1;
      uint64_t v20 = 1752589105;
    }
    else
    {
      v18 = v17;
      uint64_t v19 = 0;
      uint64_t v20 = 1635148593;
    }
    [v18 markContainsVideoEligibleForTranscodingAsCheckedWithValue:v19 codec:v20];
  }
  int v21 = [v7 videoCodec];
  if (v21 == 1635148593)
  {
    v22 = v17;
    uint64_t v23 = 0;
    uint64_t v24 = 1635148593;
  }
  else
  {
    if (v21 != 1752589105) {
      goto LABEL_14;
    }
    v22 = v17;
    uint64_t v23 = 1;
    uint64_t v24 = 1752589105;
  }
  [v22 markContainsVideoEligibleForTranscodingAsCheckedWithValue:v23 codec:v24];
LABEL_14:
  [v17 markLivePhotoPairingIdentifierAsCheckedWithValue:v14];
  objc_msgSend(v17, "markIsHDRAsCheckedWithValue:", objc_msgSend(v7, "isHDR"));
  if ([v8 isVideo]) {
    int v25 = [v8 isLivePhoto] ^ 1;
  }
  else {
    int v25 = 0;
  }
  id v35 = 0;
  v26 = v9;
  v27 = [MEMORY[0x1E4F748F8] requestForSource:v17 destinationCapabilities:v9 error:&v35];
  id v28 = v35;
  if (v27)
  {
    [v27 setShouldPadOutputFileToEstimatedLength:1];
    [v27 setUseTransferBehaviorUserPreference:1];
    v29 = [v7 filename];
    [v27 setOutputFilename:v29];

    if (v25) {
      [v27 enableSinglePassVideoEncodingWithUpdateHandler:0];
    }
    id v30 = v27;
  }
  else
  {
    v31 = PLPTPGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v37 = v28;
      __int16 v38 = 2112;
      id v39 = v7;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "Unable to create conversion request: %@, asset: %@", buf, 0x16u);
    }
  }
  return v27;
}

+ (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 withConversionManager:(id)a5 peerCapabilities:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [a1 conversionRequestForAsset:v10 sourceHints:a4 withPeerCapabilites:a6];
  if (!v12
    || ([v11 preflightConversionRequest:v12],
        [v12 source],
        v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 containsProResVideoWithFormatEligibleForTranscoding],
        v13,
        (v14 & 1) != 0))
  {
    int v15 = 0;
    goto LABEL_24;
  }
  if ([v12 status] == 5)
  {
    v16 = PLPTPGetLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_22:
      int v15 = 0;
      goto LABEL_23;
    }
    v17 = [v12 error];
    *(_DWORD *)buf = 138412546;
    __int16 v38 = v17;
    __int16 v39 = 2112;
    id v40 = v10;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Unable to preflight conversion request: %@, asset: %@", buf, 0x16u);
LABEL_21:

    goto LABEL_22;
  }
  v18 = [v12 source];
  if ([v18 isVideo])
  {
    uint64_t v19 = [v12 source];
    uint64_t v20 = [v19 firstVideoTrackCodec];
  }
  else
  {
    uint64_t v20 = 0;
  }

  int v21 = (void *)MEMORY[0x1E4F8CDF8];
  v22 = [v12 source];
  uint64_t v23 = [v22 fileType];
  v16 = [v21 typeWithIdentifier:v23];

  uint64_t v24 = [v12 backwardsCompatibilityStatus];
  if (v24 == 2)
  {
    id v35 = [PLPTPConversionResult alloc];
    v36 = [v12 outputPathExtension];
    v26 = [v36 uppercaseString];
    uint64_t v27 = [v12 estimatedOutputFileLength];
    id v28 = [v12 source];
    if ([v28 isVideo]) {
      uint64_t v29 = 1635148593;
    }
    else {
      uint64_t v29 = 0;
    }
    id v30 = [v12 source];
    int v31 = [v30 isVideo];
    v32 = (void *)MEMORY[0x1E4F44490];
    if (!v31) {
      v32 = (void *)MEMORY[0x1E4F44410];
    }
    int v15 = [(PLPTPConversionResult *)v35 initWithRequiresConversion:1 pathExtension:v26 estimatedFileLength:v27 inputVideoCodec:v20 inputContentType:v16 outputVideoCodec:v29 outputContentType:*v32];

    goto LABEL_23;
  }
  uint64_t v25 = v24;
  if (v24 != 1)
  {
    v17 = PLPTPGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v33 = [v12 error];
      *(_DWORD *)buf = 134218498;
      __int16 v38 = v25;
      __int16 v39 = 2112;
      id v40 = v33;
      __int16 v41 = 2112;
      id v42 = v10;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unexpected backwards compatibility status %ld: %@, asset: %@", buf, 0x20u);
    }
    goto LABEL_21;
  }
  int v15 = [[PLPTPConversionResult alloc] initWithRequiresConversion:0 pathExtension:0 estimatedFileLength:0 inputVideoCodec:v20 inputContentType:v16 outputVideoCodec:v20 outputContentType:v16];
LABEL_23:

LABEL_24:
  return v15;
}

@end
@interface PFCameraMetadataSerialization
+ (id)deserializedMetadataFromCameraClientMetadata:(id)a3 error:(id *)a4;
+ (id)deserializedMetadataFromData:(id)a3 error:(id *)a4;
+ (id)deserializedMetadataFromPrivateClientMetadata:(id)a3 error:(id *)a4;
+ (id)serializedDataFromCameraClientMetadata:(id)a3 error:(id *)a4;
+ (id)serializedDataFromClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5 error:(id *)a6;
+ (id)serializedDataFromClientMetadata:(id)a3 error:(id *)a4;
@end

@implementation PFCameraMetadataSerialization

+ (id)serializedDataFromClientMetadata:(id)a3 contactIDsInProximity:(id)a4 sharedLibraryMode:(int64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [[PFCameraClientMetadata alloc] initWithPrivateClientMetadata:v11 contactIDsInProximity:v10 sharedLibraryMode:a5];

  v13 = [a1 serializedDataFromCameraClientMetadata:v12 error:a6];

  return v13;
}

+ (id)serializedDataFromCameraClientMetadata:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)serializedDataFromClientMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [[PFCameraClientMetadata alloc] initWithPrivateClientMetadata:v6 contactIDsInProximity:0 sharedLibraryMode:0];

  v8 = [a1 serializedDataFromCameraClientMetadata:v7 error:a4];

  return v8;
}

+ (id)deserializedMetadataFromCameraClientMetadata:(id)a3 error:(id *)a4
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v84 = a3;
  v88 = [v84 privateClientMetadata];
  v90 = [v88 inferenceAttachments];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id VNClassificationObservationClass = getVNClassificationObservationClass();
  uint64_t v139 = 0;
  v140 = &v139;
  uint64_t v141 = 0x2050000000;
  id v11 = (void *)getVNImageAestheticsObservationClass_softClass;
  uint64_t v142 = getVNImageAestheticsObservationClass_softClass;
  if (!getVNImageAestheticsObservationClass_softClass)
  {
    v138[0] = MEMORY[0x1E4F143A8];
    v138[1] = 3221225472;
    v138[2] = __getVNImageAestheticsObservationClass_block_invoke;
    v138[3] = &unk_1E5B2E0D8;
    v138[4] = &v139;
    __getVNImageAestheticsObservationClass_block_invoke((uint64_t)v138);
    id v11 = (void *)v140[3];
  }
  uint64_t v105 = v6;
  uint64_t v108 = v5;
  v12 = v4;
  id v13 = v11;
  _Block_object_dispose(&v139, 8);
  id VNSaliencyImageObservationClass = getVNSaliencyImageObservationClass();
  id VNSceneObservationClass = getVNSceneObservationClass();
  id VNObservationClass = getVNObservationClass();
  id VNRecognizedObjectObservationClass = getVNRecognizedObjectObservationClass();
  v85 = objc_msgSend(v12, "setWithObjects:", v108, v105, v7, v8, v9, VNClassificationObservationClass, v13, VNSaliencyImageObservationClass, VNSceneObservationClass, VNObservationClass, VNRecognizedObjectObservationClass, getVNFaceObservationClass(), 0);
  v83 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158C0]];
  if (v83 && !*a4)
  {
    v70 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v83);
  }
  else
  {
    v70 = 0;
  }
  v82 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158A0]];
  if (v82 && !*a4)
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v82);
  }
  else
  {
    v18 = 0;
  }
  v68 = v18;
  v72 = [v18 firstObject];
  v81 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158D0]];
  if (v81 && !*a4)
  {
    v71 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v81);
  }
  else
  {
    v71 = 0;
  }
  v80 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158A8]];
  if (v80 && !*a4)
  {
    v73 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v80);
  }
  else
  {
    v73 = 0;
  }
  v79 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F15880]];
  if (v79 && !*a4)
  {
    v76 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v79);
  }
  else
  {
    v76 = 0;
  }
  v78 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F15878]];
  if (v78 && !*a4)
  {
    v19 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v78);
  }
  else
  {
    v19 = 0;
  }
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __84__PFCameraMetadataSerialization_deserializedMetadataFromCameraClientMetadata_error___block_invoke;
  v134[3] = &unk_1E5B2E0B0;
  id v69 = v19;
  id v135 = v69;
  uint64_t v137 = 3737841669;
  id v74 = v20;
  id v136 = v74;
  [v76 enumerateObjectsUsingBlock:v134];
  v77 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158B0]];
  if (v77 && !*a4)
  {
    v75 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v77);
  }
  else
  {
    v75 = 0;
  }
  v21 = objc_opt_new();
  v22 = objc_opt_new();
  v23 = objc_opt_new();
  v24 = objc_opt_new();
  v109 = objc_opt_new();
  if (objc_opt_respondsToSelector())
  {
    obuint64_t j = [v88 detectedObjectInfo];
    if (obj)
    {
      long long v132 = 0u;
      long long v133 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      uint64_t v99 = [obj countByEnumeratingWithState:&v130 objects:v148 count:16];
      if (v99)
      {
        uint64_t v97 = *(void *)v131;
        uint64_t v95 = *MEMORY[0x1E4F52320];
        uint64_t v93 = *MEMORY[0x1E4F522F8];
        uint64_t v92 = *MEMORY[0x1E4F522F0];
        uint64_t v91 = *MEMORY[0x1E4F522D0];
        uint64_t v89 = *MEMORY[0x1E4F522E0];
        uint64_t v86 = *MEMORY[0x1E4F52318];
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v131 != v97)
            {
              uint64_t v26 = v25;
              objc_enumerationMutation(obj);
              uint64_t v25 = v26;
            }
            uint64_t v103 = v25;
            v27 = *(void **)(*((void *)&v130 + 1) + 8 * v25);
            v28 = [obj objectForKeyedSubscript:v27];
            v106 = [v28 objectForKeyedSubscript:v95];

            if ([v27 isEqualToString:v93])
            {
              long long v128 = 0u;
              long long v129 = 0u;
              long long v126 = 0u;
              long long v127 = 0u;
              id v29 = v106;
              uint64_t v30 = [v29 countByEnumeratingWithState:&v126 objects:v147 count:16];
              if (v30)
              {
                uint64_t v31 = *(void *)v127;
                do
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v127 != v31) {
                      objc_enumerationMutation(v29);
                    }
                    v33 = +[_PFCameraMetadataAVMetadataObject humanFaceObjectWithFigEmbeddedCaptureDeviceObjectDictionary:*(void *)(*((void *)&v126 + 1) + 8 * i)];
                    [v21 addObject:v33];
                  }
                  uint64_t v30 = [v29 countByEnumeratingWithState:&v126 objects:v147 count:16];
                }
                while (v30);
              }
            }
            else if ([v27 isEqualToString:v92])
            {
              long long v124 = 0u;
              long long v125 = 0u;
              long long v122 = 0u;
              long long v123 = 0u;
              id v34 = v106;
              uint64_t v35 = [v34 countByEnumeratingWithState:&v122 objects:v146 count:16];
              if (v35)
              {
                uint64_t v36 = *(void *)v123;
                do
                {
                  for (uint64_t j = 0; j != v35; ++j)
                  {
                    if (*(void *)v123 != v36) {
                      objc_enumerationMutation(v34);
                    }
                    v38 = +[_PFCameraMetadataAVMetadataObject humanBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:*(void *)(*((void *)&v122 + 1) + 8 * j)];
                    [v22 addObject:v38];
                  }
                  uint64_t v35 = [v34 countByEnumeratingWithState:&v122 objects:v146 count:16];
                }
                while (v35);
              }
            }
            else if ([v27 isEqualToString:v91])
            {
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              id v39 = v106;
              uint64_t v40 = [v39 countByEnumeratingWithState:&v118 objects:v145 count:16];
              if (v40)
              {
                uint64_t v41 = *(void *)v119;
                do
                {
                  for (uint64_t k = 0; k != v40; ++k)
                  {
                    if (*(void *)v119 != v41) {
                      objc_enumerationMutation(v39);
                    }
                    v43 = +[_PFCameraMetadataAVMetadataObject catBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:*(void *)(*((void *)&v118 + 1) + 8 * k)];
                    [v23 addObject:v43];
                  }
                  uint64_t v40 = [v39 countByEnumeratingWithState:&v118 objects:v145 count:16];
                }
                while (v40);
              }
            }
            else if ([v27 isEqualToString:v89])
            {
              long long v116 = 0u;
              long long v117 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              id v44 = v106;
              uint64_t v45 = [v44 countByEnumeratingWithState:&v114 objects:v144 count:16];
              if (v45)
              {
                uint64_t v46 = *(void *)v115;
                do
                {
                  for (uint64_t m = 0; m != v45; ++m)
                  {
                    if (*(void *)v115 != v46) {
                      objc_enumerationMutation(v44);
                    }
                    v48 = +[_PFCameraMetadataAVMetadataObject dogBodyObjectWithFigEmbeddedCaptureDeviceObjectDictionary:*(void *)(*((void *)&v114 + 1) + 8 * m)];
                    [v24 addObject:v48];
                  }
                  uint64_t v45 = [v44 countByEnumeratingWithState:&v114 objects:v144 count:16];
                }
                while (v45);
              }
            }
            else
            {
              if (![v27 isEqualToString:v86]) {
                goto LABEL_83;
              }
              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              id v49 = v106;
              uint64_t v50 = [v49 countByEnumeratingWithState:&v110 objects:v143 count:16];
              if (v50)
              {
                uint64_t v51 = *(void *)v111;
                do
                {
                  for (uint64_t n = 0; n != v50; ++n)
                  {
                    if (*(void *)v111 != v51) {
                      objc_enumerationMutation(v49);
                    }
                    v53 = +[_PFCameraMetadataAVMetadataObject salientObjectWithFigEmbeddedCaptureDeviceObjectDictionary:*(void *)(*((void *)&v110 + 1) + 8 * n)];
                    [v109 addObject:v53];
                  }
                  uint64_t v50 = [v49 countByEnumeratingWithState:&v110 objects:v143 count:16];
                }
                while (v50);
              }
            }

LABEL_83:
            uint64_t v25 = v103 + 1;
          }
          while (v103 + 1 != v99);
          uint64_t v99 = [obj countByEnumeratingWithState:&v130 objects:v148 count:16];
        }
        while (v99);
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v98 = [v88 spatialOverCaptureImageStitchingConfidenceScore];
  }
  else {
    uint64_t v98 = 0;
  }
  int v54 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v88 spatialOverCaptureImageHorizonLinePresent])
  {
    [v88 spatialOverCaptureImageHorizonLineAngleInDegrees];
    int v54 = v55;
    char v96 = 1;
  }
  else
  {
    char v96 = 0;
  }
  v100 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F15888]];
  v107 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158B8]];
  if (v107 && !*a4)
  {
    v56 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v107);
  }
  else
  {
    v56 = 0;
  }
  v57 = v56;
  id obja = [v56 firstObject];
  v104 = [v90 objectForKeyedSubscript:*MEMORY[0x1E4F158C8]];
  if (v104 && !*a4)
  {
    v58 = objc_msgSend(MEMORY[0x1E4F28DC0], "unarchivedObjectOfClasses:fromData:error:", v85, v104);
  }
  else
  {
    v58 = 0;
  }
  v59 = [v58 firstObject];
  v60 = [v84 contactIDsInProximity];
  uint64_t v61 = [v84 sharedLibraryMode];
  if (*a4)
  {
    v62 = 0;
  }
  else
  {
    uint64_t v63 = v61;
    v94 = [PFCameraMetadata alloc];
    v64 = [v88 captureFolderClientPath];
    LOBYTE(v67) = v96;
    LODWORD(v65) = v54;
    v62 = -[PFCameraMetadata initWithJunkImageClassificationObservations:imageAestheticsObservation:saliencyObservation:scenePrintObservation:detectedObjectsInfoHumanFaces:detectedObjectsInfoHumanBodies:detectedObjectsInfoCatBodies:detectedObjectsInfoDogBodies:detectedObjectsSalientObjects:smartCamInfo:stitchConfidence:horizonLinePresent:horizonLineAngleInDegrees:captureFolderPath:semanticDevelopmentGatingObservations:faceObservations:torsoprints:foodAndDrinkObservations:semanticEnhanceScene:contactIDsInProximity:sharedLibraryMode:](v94, "initWithJunkImageClassificationObservations:imageAestheticsObservation:saliencyObservation:scenePrintObservation:detectedObjectsInfoHumanFaces:detectedObjectsInfoHumanBodies:detectedObjectsInfoCatBodies:detectedObjectsInfoDogBodies:detectedObjectsSalientObjects:smartCamInfo:stitchConfidence:horizonLinePresent:horizonLineAngleInDegrees:captureFolderPath:semanticDevelopmentGatingObservations:faceObservations:torsoprints:foodAndDrinkObservations:semanticEnhanceScene:contactIDsInProximity:sharedLibraryMode:", v70, v72, obja, v59, v21, v22, v65, v23, v24, v109, v100, v98, v67,
            v64,
            v71,
            v73,
            v74,
            v75,
            0,
            v60,
            v63);
  }

  return v62;
}

void __84__PFCameraMetadataSerialization_deserializedMetadataFromCameraClientMetadata_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v5) {
    goto LABEL_8;
  }
  uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v8 = (void *)getVNFaceprintClass_softClass;
  uint64_t v29 = getVNFaceprintClass_softClass;
  if (!getVNFaceprintClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getVNFaceprintClass_block_invoke;
    v24 = &unk_1E5B2E0D8;
    uint64_t v25 = &v26;
    __getVNFaceprintClass_block_invoke((uint64_t)&v21);
    uint64_t v8 = (void *)v27[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v26, 8);
  id v10 = [v9 alloc];
  id v11 = v5;
  uint64_t v12 = [v11 bytes];
  unint64_t v13 = (unint64_t)[v11 length] >> 2;
  uint64_t v14 = [v11 length];
  [v7 floatValue];
  v15 = objc_msgSend(v10, "initWithRawData:elementCount:elementType:lengthInBytes:confidence:requestRevision:", v12, v13, 1, v14, *(void *)(a1 + 48));
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v16 = (void *)getVNFaceTorsoprintClass_softClass;
  uint64_t v29 = getVNFaceTorsoprintClass_softClass;
  if (!getVNFaceTorsoprintClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getVNFaceTorsoprintClass_block_invoke;
    v24 = &unk_1E5B2E0D8;
    uint64_t v25 = &v26;
    __getVNFaceTorsoprintClass_block_invoke((uint64_t)&v21);
    v16 = (void *)v27[3];
  }
  v17 = v16;
  _Block_object_dispose(&v26, 8);
  v18 = (void *)[[v17 alloc] initWithFaceprint:v15 torsoprint:0];

  if (!v18)
  {
LABEL_8:
    id v20 = *(void **)(a1 + 40);
    v18 = [MEMORY[0x1E4F1CA98] null];
    v19 = v20;
  }
  else
  {
    v19 = *(void **)(a1 + 40);
  }
  [v19 addObject:v18];
}

+ (id)deserializedMetadataFromPrivateClientMetadata:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [[PFCameraClientMetadata alloc] initWithPrivateClientMetadata:v6 contactIDsInProximity:0 sharedLibraryMode:0];

  uint64_t v8 = [a1 deserializedMetadataFromCameraClientMetadata:v7 error:a4];

  return v8;
}

+ (id)deserializedMetadataFromData:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v13 = 0;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
    uint64_t v8 = [(id)objc_opt_class() deserializedMetadataFromCameraClientMetadata:v6 error:a4];
    id v9 = v7;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "+[PFCameraMetadataSerialization deserializedMetadataFromData:error:]";
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s: Unable to deserialize camera metadata: %@. Attempting to deserialize legacy version.", buf, 0x16u);
  }
  id v12 = v7;
  id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v12];
  id v9 = v12;

  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "+[PFCameraMetadataSerialization deserializedMetadataFromData:error:]";
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s: Unable to deserialize legacy camera metadata: %@.", buf, 0x16u);
      if (a4) {
        goto LABEL_9;
      }
    }
    else if (a4)
    {
LABEL_9:
      uint64_t v8 = 0;
      *a4 = v9;
      goto LABEL_12;
    }
    uint64_t v8 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [(id)objc_opt_class() deserializedMetadataFromPrivateClientMetadata:v10 error:a4];
LABEL_12:

LABEL_13:

  return v8;
}

@end
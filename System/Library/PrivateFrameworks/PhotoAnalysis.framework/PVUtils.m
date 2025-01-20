@interface PVUtils
+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4;
+ (id)selectRepresentativeFromFaceDescriptors:(id)a3;
@end

@implementation PVUtils

+ (id)selectRepresentativeFromFaceDescriptors:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v32;
    *(void *)&long long v6 = 138412290;
    long long v25 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D26057A0]();
        uint64_t v12 = [v10 faceId];
        uint64_t v13 = [v10 faceprint];
        v14 = (void *)v13;
        if (v12 >= 1 && v13 != 0)
        {
          id v30 = 0;
          v16 = +[PVUtils faceprintFromFaceprintArchive:v13 error:&v30];
          id v17 = v30;
          if (v16)
          {
            id v18 = objc_alloc_init(MEMORY[0x1E4F457F8]);
            [v18 setFaceId:v12];
            [v18 setFaceTorsoprint:v16];
            v19 = [v16 faceprint];
            [v18 setFaceprint:v19];

            [v26 addObject:v18];
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            id v36 = v17;
            _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get VNFaceTorsoprint from faceprint data, error:%@", buf, 0xCu);
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v7);
  }

  if ([v26 count])
  {
    id v29 = 0;
    v20 = [MEMORY[0x1E4F45718] representativenessForFaces:v26 error:&v29];
    id v21 = v29;
    if (v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v21;
      _os_log_error_impl(&dword_1D21F2000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get representativenessForFaces. Error: %@", buf, 0xCu);
    }
    if (objc_msgSend(v20, "count", v25))
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __51__PVUtils_selectRepresentativeFromFaceDescriptors___block_invoke;
      v27[3] = &unk_1E6917440;
      id v28 = v20;
      v22 = [v4 sortedArrayUsingComparator:v27];
      v23 = [v22 lastObject];
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

uint64_t __51__PVUtils_selectRepresentativeFromFaceDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  long long v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(a2, "faceId"));
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];
  v10 = (void *)v9;
  if (v9) {
    v11 = (void *)v9;
  }
  else {
    v11 = &unk_1F291A4F8;
  }
  id v12 = v11;

  uint64_t v13 = *(void **)(a1 + 32);
  v14 = NSNumber;
  uint64_t v15 = [v7 faceId];

  v16 = [v14 numberWithInteger:v15];
  uint64_t v17 = [v13 objectForKeyedSubscript:v16];
  id v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = &unk_1F291A4F8;
  }
  id v20 = v19;

  uint64_t v21 = [v12 compare:v20];
  return v21;
}

+ (id)faceprintFromFaceprintArchive:(id)a3 error:(id *)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F45800];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithState:v6 error:a4];

  return v7;
}

@end
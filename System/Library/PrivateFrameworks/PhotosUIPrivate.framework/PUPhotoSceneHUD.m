@interface PUPhotoSceneHUD
- (NSURL)mdataURL;
- (PUPhotoSceneHUD)initWithPhoto:(id)a3;
- (PXHUDView)hudView;
- (void)update;
@end

@implementation PUPhotoSceneHUD

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdataURL, 0);
  objc_storeStrong((id *)&self->_hudView, 0);
}

- (NSURL)mdataURL
{
  return self->_mdataURL;
}

- (PXHUDView)hudView
{
  return self->_hudView;
}

- (void)update
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v3 = [(PUPhotoSceneHUD *)self hudView];
  v4 = [(PUPhotoSceneHUD *)self mdataURL];

  if (!v4)
  {
    v22 = @"Could not find MDATA file.";
LABEL_16:
    id v7 = objc_alloc_init(MEMORY[0x1E4F90288]);
    [v7 setTitle:v22];
    [v3 addVisualization:v7];
    goto LABEL_39;
  }
  v5 = (void *)MEMORY[0x1E4F1C9B8];
  v6 = [(PUPhotoSceneHUD *)self mdataURL];
  id v7 = [v5 dataWithContentsOfURL:v6 options:2 error:0];

  if (!v7)
  {
    v22 = @"Could not read MDATA file.";
    goto LABEL_16;
  }
  id v82 = 0;
  v8 = [MEMORY[0x1E4F8CBE0] deserializedMetadataFromData:v7 error:&v82];
  id v9 = v82;
  v10 = v9;
  if (!v8)
  {

    v22 = @"Could not deserialize MDATA.";
    goto LABEL_16;
  }
  v11 = [v8 semanticDevelopmentGatingObservations];
  v68 = v10;
  id v69 = v7;
  v66 = v11;
  v67 = v8;
  if ([v11 count])
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v79 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          id v18 = objc_alloc_init(MEMORY[0x1E4F90270]);
          v19 = [v17 identifier];
          [v18 setTitle:v19];

          v20 = NSNumber;
          [v17 confidence];
          v21 = objc_msgSend(v20, "numberWithFloat:");
          [v18 setValue:v21];

          [v3 addVisualization:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v14);
      id v7 = v69;
      v11 = v66;
      v8 = v67;
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F90288]);
    [v12 setTitle:@"No scene detected"];
    [v3 addVisualization:v12];
  }

  v23 = [v8 foodAndDrinkObservations];
  if ([v23 count])
  {
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v24 = v23;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v74 objects:v84 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      v65 = v23;
      uint64_t v27 = *(void *)v75;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v75 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v74 + 1) + 8 * j);
          id v30 = objc_alloc_init(MEMORY[0x1E4F90270]);
          v31 = [v29 labels];
          v32 = [v31 firstObject];
          v33 = [v32 identifier];
          [v30 setTitle:v33];

          v34 = NSString;
          [v29 boundingBox];
          uint64_t v36 = v35;
          [v29 boundingBox];
          uint64_t v38 = v37;
          [v29 boundingBox];
          uint64_t v40 = v39;
          [v29 boundingBox];
          uint64_t v42 = v41;
          [v29 confidence];
          v44 = [v34 stringWithFormat:@"(%.3f, %.3f, %.3f, %.3f) %.3f", v36, v38, v40, v42, v43];
          [v30 setValue:v44];

          [v3 addVisualization:v30];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v74 objects:v84 count:16];
      }
      while (v26);
      v10 = v68;
      id v7 = v69;
      v11 = v66;
      v8 = v67;
      v23 = v65;
    }
  }
  else
  {
    id v24 = objc_alloc_init(MEMORY[0x1E4F90288]);
    [v24 setTitle:@"No food/drink detected"];
    [v3 addVisualization:v24];
  }

  v45 = [v8 faceObservations];
  if ([v45 count])
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v46 = v45;
    uint64_t v47 = [v46 countByEnumeratingWithState:&v70 objects:v83 count:16];
    if (v47)
    {
      uint64_t v48 = v47;
      v64 = v45;
      uint64_t v49 = *(void *)v71;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v71 != v49) {
            objc_enumerationMutation(v46);
          }
          v51 = *(void **)(*((void *)&v70 + 1) + 8 * k);
          id v52 = objc_alloc_init(MEMORY[0x1E4F90270]);
          [v52 setTitle:@"Face"];
          v53 = NSString;
          [v51 boundingBox];
          uint64_t v55 = v54;
          [v51 boundingBox];
          uint64_t v57 = v56;
          [v51 boundingBox];
          uint64_t v59 = v58;
          [v51 boundingBox];
          uint64_t v61 = v60;
          [v51 confidence];
          v63 = [v53 stringWithFormat:@"(%.3f, %.3f, %.3f, %.3f) %.3f", v55, v57, v59, v61, v62];
          [v52 setValue:v63];

          [v3 addVisualization:v52];
        }
        uint64_t v48 = [v46 countByEnumeratingWithState:&v70 objects:v83 count:16];
      }
      while (v48);
      v10 = v68;
      id v7 = v69;
      v11 = v66;
      v8 = v67;
      v45 = v64;
    }
  }
  else
  {
    id v46 = objc_alloc_init(MEMORY[0x1E4F90288]);
    [v46 setTitle:@"No faces detected"];
    [v3 addVisualization:v46];
  }

LABEL_39:
}

- (PUPhotoSceneHUD)initWithPhoto:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PUPhotoSceneHUD;
  v5 = -[PUPhotoSceneHUD initWithFrame:](&v32, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v6 = objc_alloc_init(MEMORY[0x1E4F90280]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v6 layer];
  [v7 setBorderWidth:1.0];

  id v8 = [MEMORY[0x1E4FB1618] redColor];
  uint64_t v9 = [v8 CGColor];
  v10 = [v6 layer];
  [v10 setBorderColor:v9];

  [(PUPhotoSceneHUD *)v5 addSubview:v6];
  objc_storeStrong((id *)&v5->_hudView, v6);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v6;
    id v26 = v4;
    uint64_t v27 = v5;
    id v11 = v4;
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v24 = v11;
    uint64_t v13 = [v11 fileURLsForDiagnosticFiles];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = [v18 path];
          if ([v12 fileExistsAtPath:v19])
          {
            v20 = [v18 path];
            v21 = [v20 lowercaseString];
            int v22 = [v21 hasSuffix:@"mdata"];

            if (v22)
            {
              objc_storeStrong((id *)&v27->_mdataURL, v18);
              goto LABEL_13;
            }
          }
          else
          {
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }
LABEL_13:

    id v4 = v26;
    v5 = v27;
    id v6 = v25;
  }

  return v5;
}

@end
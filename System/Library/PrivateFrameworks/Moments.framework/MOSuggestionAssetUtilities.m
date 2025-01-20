@interface MOSuggestionAssetUtilities
+ (id)imageFromURL:(id)a3;
+ (id)unwrappeCombinedWorkoutObjectFrom:(id)a3;
+ (id)unwrappedContactPhotoFrom:(id)a3;
+ (id)unwrappedMediaItemFrom:(id)a3;
+ (id)unwrappedMotionActivityFrom:(id)a3;
+ (id)unwrappedStateOfMindFrom:(id)a3;
+ (id)unwrappedWorkoutObjectFrom:(id)a3;
@end

@implementation MOSuggestionAssetUtilities

+ (id)imageFromURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
    if (v4)
    {
      v5 = [MEMORY[0x1E4F42A80] imageWithData:v4];
      v6 = v5;
      if (v5)
      {
        v6 = v5;
        v7 = v6;
      }
      else
      {
        v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          +[MOSuggestionAssetUtilities imageFromURL:](v3);
        }

        v7 = 0;
      }
    }
    else
    {
      v6 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities imageFromURL:](v3);
      }
      v7 = 0;
    }
  }
  else
  {
    v4 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities imageFromURL:]();
    }
    v7 = 0;
  }

  return v7;
}

+ (id)unwrappedMotionActivityFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 constructedImage];
    if (v6)
    {
      v7 = [MOSuggestionAsset alloc];
      v8 = [v3 assetType];
      id v9 = [(MOSuggestionAsset *)v7 init:v6 type:v8 contentClassType:objc_opt_class()];

      v10 = [v3 identifier];
      [v9 addIdentifier:v10];

      v11 = [v3 metadata];
      [v9 addMetadata:v11];

      v12 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v5 debugDescription];
        int v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1D24AE000, v12, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:](v5);
      }
      id v9 = 0;
    }
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:]();
    }
    id v9 = 0;
  }

  return v9;
}

+ (id)unwrappedMediaItemFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  v5 = v4;
  if (v4 && ([v4 imageURL], v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = [v5 imageURL];
    v8 = +[MOSuggestionAssetUtilities imageFromURL:v7];

    if (v8)
    {
      v26 = [MOSuggestionAssetMediaItem alloc];
      id v9 = [v5 title];
      v10 = [v5 albumTitle];
      v11 = [v5 artistName];
      v12 = [v5 trackIdentifier];
      v13 = [v5 previewURL];
      uint64_t v14 = [v5 mediaType];
      int v15 = [v5 bgColor];
      v16 = -[MOSuggestionAssetMediaItem initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:](v26, "initTitle:albumTitle:artistName:albumArt:trackIdentifier:previewURL:mediaType:imageURL:bgColor:bgColorVariant:", v9, v10, v11, v8, v12, v13, v14, 0, v15, [v5 bgColorVariant]);

      uint64_t v17 = [MOSuggestionAsset alloc];
      v18 = [v3 assetType];
      id v19 = [(MOSuggestionAsset *)v17 init:v16 type:v18 contentClassType:objc_opt_class()];

      v20 = [v3 identifier];
      [v19 addIdentifier:v20];

      v21 = [v3 metadata];
      [v19 addMetadata:v21];

      v22 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v5 imageURL];
        v24 = [v23 debugDescription];
        *(_DWORD *)buf = 138412290;
        v28 = v24;
        _os_log_impl(&dword_1D24AE000, v22, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, mediaArtURL=%@", buf, 0xCu);
      }
    }
    else
    {
      v16 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:]();
      }
      id v19 = 0;
    }
  }
  else
  {
    v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:]();
    }
    id v19 = 0;
  }

  return v19;
}

+ (id)unwrappeCombinedWorkoutObjectFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  if (v4)
  {
    v5 = +[MOSuggestionAssetUtilities imageFromURL:v4];
    if (v5)
    {
      v6 = [MOSuggestionAsset alloc];
      v7 = [v3 assetType];
      id v8 = [(MOSuggestionAsset *)v6 init:v5 type:v7 contentClassType:objc_opt_class()];

      id v9 = [v3 identifier];
      [v8 addIdentifier:v9];

      v10 = [v3 metadata];
      [v8 addMetadata:v10];

      v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v4 debugDescription];
        int v14 = 138412290;
        int v15 = v12;
        _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappeCombinedWorkoutObjectFrom:](v4);
      }
      id v8 = 0;
    }
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:]();
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)unwrappedWorkoutObjectFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  v5 = [v4 route];

  if (v5)
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1D24AE000, v6, OS_LOG_TYPE_DEFAULT, "Route Only Pass Through", (uint8_t *)&v24, 2u);
    }

    id v7 = v3;
  }
  else if (v4 && ([v4 iconURL], id v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    id v9 = [v4 iconURL];
    v10 = +[MOSuggestionAssetUtilities imageFromURL:v9];

    if (v10)
    {
      v11 = [MOSuggestionAssetWorkout alloc];
      v12 = [v4 activityRings];
      v13 = [v4 route];
      int v14 = [(MOSuggestionAssetWorkout *)v11 init:v12 route:v13 icon:v10];

      int v15 = [MOSuggestionAsset alloc];
      uint64_t v16 = [v3 assetType];
      id v7 = [(MOSuggestionAsset *)v15 init:v14 type:v16 contentClassType:objc_opt_class()];

      uint64_t v17 = [v3 identifier];
      [v7 addIdentifier:v17];

      v18 = [v3 metadata];
      [v7 addMetadata:v18];

      id v19 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [v4 iconURL];
        v21 = [v20 debugDescription];
        int v24 = 138412290;
        v25 = v21;
        _os_log_impl(&dword_1D24AE000, v19, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, iconURL=%@", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      int v14 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappedMediaItemFrom:]();
      }
      id v7 = 0;
    }
  }
  else
  {
    v22 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedWorkoutObjectFrom:]();
    }

    id v7 = 0;
  }

  return v7;
}

+ (id)unwrappedContactPhotoFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  if (v4)
  {
    v5 = +[MOSuggestionAssetUtilities imageFromURL:v4];
    if (v5)
    {
      v6 = [MOSuggestionAsset alloc];
      id v7 = [v3 assetType];
      id v8 = [(MOSuggestionAsset *)v6 init:v5 type:v7 contentClassType:objc_opt_class()];

      id v9 = [v3 identifier];
      [v8 addIdentifier:v9];

      v10 = [v3 metadata];
      [v8 addMetadata:v10];

      v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [v4 debugDescription];
        int v14 = 138412290;
        int v15 = v12;
        _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, photoUrl=%@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v11 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappedContactPhotoFrom:](v4);
      }
      id v8 = 0;
    }
  }
  else
  {
    v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:]();
    }
    id v8 = 0;
  }

  return v8;
}

+ (id)unwrappedStateOfMindFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 content];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 constructedImage];
    if (v6)
    {
      id v7 = [MOSuggestionAsset alloc];
      id v8 = [v3 assetType];
      id v9 = [(MOSuggestionAsset *)v7 init:v6 type:v8 contentClassType:objc_opt_class()];

      v10 = [v3 identifier];
      [v9 addIdentifier:v10];

      v11 = [v3 metadata];
      [v9 addMetadata:v11];

      v12 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v5 debugDescription];
        int v15 = 138412290;
        uint64_t v16 = v13;
        _os_log_impl(&dword_1D24AE000, v12, OS_LOG_TYPE_DEFAULT, "Unwrapping successful, url=%@", (uint8_t *)&v15, 0xCu);
      }
    }
    else
    {
      v12 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[MOSuggestionAssetUtilities unwrappedStateOfMindFrom:](v5);
      }
      id v9 = 0;
    }
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MOSuggestionAssetUtilities unwrappedMotionActivityFrom:]();
    }
    id v9 = 0;
  }

  return v9;
}

+ (void)imageFromURL:.cold.1()
{
  v0 = [0 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v1, v2, "Unwrapping failed, URL nil, url=%@", v3, v4, v5, v6, v7);
}

+ (void)imageFromURL:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Unwrapping failed, URL data nil, url=%@", v4, v5, v6, v7, v8);
}

+ (void)imageFromURL:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Unwrapping failed, bad image data, url=%@", v4, v5, v6, v7, v8);
}

+ (void)unwrappedMotionActivityFrom:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Asset Image URL unexpectedly nil", v2, v3, v4, v5, v6);
}

+ (void)unwrappedMotionActivityFrom:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Failed to construct motion activity image, url=%@", v4, v5, v6, v7, v8);
}

+ (void)unwrappedMediaItemFrom:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "mediaItem or URL unexpectedly nil", v2, v3, v4, v5, v6);
}

+ (void)unwrappedMediaItemFrom:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "Unwrapping failed, bad image data", v2, v3, v4, v5, v6);
}

+ (void)unwrappeCombinedWorkoutObjectFrom:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Failed to construct combined workout glyph image, url=%@", v4, v5, v6, v7, v8);
}

+ (void)unwrappedWorkoutObjectFrom:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(&dword_1D24AE000, v0, v1, "workout or iconURL unexpectedly nil", v2, v3, v4, v5, v6);
}

+ (void)unwrappedContactPhotoFrom:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Failed to construct contact photo image, photoUrl=%@", v4, v5, v6, v7, v8);
}

+ (void)unwrappedStateOfMindFrom:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D24AE000, v2, v3, "Failed to construct state of mind image, url=%@", v4, v5, v6, v7, v8);
}

@end
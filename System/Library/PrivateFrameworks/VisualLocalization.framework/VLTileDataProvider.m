@interface VLTileDataProvider
- (BOOL)shouldCacheMetadata;
- (VLLocalizationDataProviderDelegate)delegate;
- (VLTileDataProvider)init;
- (VLTileDataProvider)initWithAuditToken:(id)a3 supportedFormatVersions:(id)a4;
- (id).cxx_construct;
- (id)fileURLForKey:(id *)a3 error:(id *)a4;
- (void)_commonInitWithTileLoader:(id)a3 auditToken:(id)a4 supportedFormatVersions:(id)a5;
- (void)_disburseMetadataTileForKey:(uint64_t)a3 tileData:(void *)a4 error:(void *)a5;
- (void)_fetchDataTile:(uint64_t)a3 originalKey:(_OWORD *)a4 additionalInfo:(uint64_t *)a5;
- (void)_fetchMetadataForCoordinate:(id *)a3 completionHandler:(id)a4;
- (void)_fetchMetadataForDataKey:(id *)a3 completionHandler:(id)a4;
- (void)_fetchMetadataTile:(uint64_t)a3 completionHandler:(void *)a4;
- (void)dealloc;
- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7;
- (void)setDelegate:(id)a3;
- (void)setShouldCacheMetadata:(BOOL)a3;
@end

@implementation VLTileDataProvider

- (void)determineAvailabilityForCoordinate:(id *)a3 horizontalAccuracy:(double)a4 purpose:(int64_t)a5 callbackQueue:(id)a6 callback:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  $F24F406B2B787EFB06265DBA3D28CBD5 v22 = *a3;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke;
  v16[3] = &unk_2643BA198;
  v16[4] = self;
  id v17 = v12;
  id v18 = v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 v19 = v22;
  double v20 = a4;
  int64_t v21 = a5;
  id v14 = v13;
  id v15 = v12;
  [(VLTileDataProvider *)self _fetchMetadataForCoordinate:&v22 completionHandler:v16];
}

- (void)_fetchMetadataForCoordinate:(id *)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (v7)
  {
    v8 = [MEMORY[0x263F41BD0] modernManager];
    v9 = [v8 activeTileGroup];
    v10 = [v9 activeTileSetForStyle:70 size:2 scale:0];

    if (v10)
    {
      uint64_t v11 = MEMORY[0x263F41670];
      uint64_t v12 = objc_msgSend(v10, "maximumZoomLevelInRect:", *MEMORY[0x263F41670], *(double *)(MEMORY[0x263F41670] + 8), *(double *)(MEMORY[0x263F41670] + 16), *(double *)(MEMORY[0x263F41670] + 24));
      GEOMapPointForCoordinate();
      double v13 = (double)(1 << v12) / *(double *)(v11 + 16);
      LODWORD(v4) = vcvtmd_u64_f64(v14 * v13);
      unsigned int v16 = vcvtmd_u64_f64(v15 * v13);
      char v31 = *MEMORY[0x263F416C0] & 0x7F;
      uint64_t v17 = *MEMORY[0x263F416B8] & 0x3F | (unint64_t)(v4 << 46) | ((self->_maxSupportedFormatVersion << 6) | (unint64_t)(v12 << 40)) & 0x3F0000007FC0;
      char v35 = 0;
      __int16 v34 = HIBYTE(v16) & 3;
      int v33 = (v16 << 8) | (v4 >> 18);
      uint64_t v32 = v17;
      if (qword_26AC37568 != -1) {
        dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      }
      id v18 = (id)_MergedGlobals_1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        $F24F406B2B787EFB06265DBA3D28CBD5 v19 = [NSString stringWithFormat:@"%+.8f, %+.8f", *(void *)&a3->var0, *(void *)&a3->var1];
        *(_DWORD *)buf = 138478595;
        v24 = v19;
        __int16 v25 = 1025;
        int v26 = v12 & 0x3F;
        __int16 v27 = 1025;
        int v28 = v4 & 0x3FFFFFF;
        __int16 v29 = 1025;
        int v30 = v16 & 0x3FFFFFF;
        _os_log_impl(&dword_21BAD2000, v18, OS_LOG_TYPE_DEBUG, "Coordinate %{private}@ maps to metadata tile %{private}i_%{private}i_%{private}i", buf, 0x1Eu);
      }
      [(VLTileDataProvider *)self _fetchMetadataTile:&v31 completionHandler:v7];
    }
    else
    {
      double v20 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __68__VLTileDataProvider__fetchMetadataForCoordinate_completionHandler___block_invoke;
      block[3] = &unk_2643B9FB8;
      id v22 = v7;
      dispatch_async(v20, block);
    }
  }
}

- (void)_fetchMetadataTile:(uint64_t)a3 completionHandler:(void *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  __int16 v34 = __Block_byref_object_copy_;
  char v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  v26[1] = (id)MEMORY[0x263EF8330];
  v26[2] = (id)3221225472;
  v26[3] = __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke;
  v26[4] = &unk_2643B9FE0;
  v26[5] = a1;
  int v28 = &v31;
  __int16 v29 = &v37;
  uint64_t v30 = a3;
  id v7 = v6;
  id v27 = v7;
  geo_isolate_sync();
  if (v32[5])
  {
    if (qword_26AC37568 == -1)
    {
      v8 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, v32[5], 0);
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      v8 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
    }
    uint64_t v9 = *(unsigned int *)(a3 + 9);
    unint64_t v10 = v9 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    unint64_t v11 = *(void *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v11 >> 40) & 0x3F;
    __int16 v42 = 1025;
    int v43 = ((v11 >> 46) | (v9 << 18)) & 0x3FFFFFF;
    __int16 v44 = 1025;
    int v45 = (v10 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_21BAD2000, v8, OS_LOG_TYPE_DEBUG, "Using cached metadata tile %{private}i_%{private}i_%{private}i", (uint8_t *)&buf, 0x14u);
    goto LABEL_5;
  }
  if (!*((unsigned char *)v38 + 24))
  {
    if (qword_26AC37568 == -1)
    {
      v23 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        objc_initWeak(&buf, a1);
        $F24F406B2B787EFB06265DBA3D28CBD5 v19 = (void *)a1[2];
        uint64_t v18 = a1[3];
        double v20 = dispatch_get_global_queue(21, 0);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke_16;
        v25[3] = &unk_2643BA008;
        objc_copyWeak(v26, &buf);
        [v19 loadKey:a3 priority:3221225469 forClient:v18 options:3 reason:4 callbackQ:v20 beginNetwork:0 callback:v25];

        objc_destroyWeak(v26);
        objc_destroyWeak(&buf);
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      v23 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
    }
    uint64_t v15 = *(unsigned int *)(a3 + 9);
    unint64_t v16 = v15 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    unint64_t v17 = *(void *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v17 >> 40) & 0x3F;
    __int16 v42 = 1025;
    int v43 = ((v17 >> 46) | (v15 << 18)) & 0x3FFFFFF;
    __int16 v44 = 1025;
    int v45 = (v16 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_21BAD2000, v23, OS_LOG_TYPE_INFO, "Loading metadata tile %{private}i_%{private}i_%{private}i from GeoServices...", (uint8_t *)&buf, 0x14u);
    goto LABEL_16;
  }
  if (qword_26AC37568 == -1)
  {
    int64_t v21 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v12 = *(unsigned int *)(a3 + 9);
    unint64_t v13 = v12 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    unint64_t v14 = *(void *)(a3 + 1);
    LODWORD(buf) = 67175169;
    HIDWORD(buf) = (v14 >> 40) & 0x3F;
    __int16 v42 = 1025;
    int v43 = ((v14 >> 46) | (v12 << 18)) & 0x3FFFFFF;
    __int16 v44 = 1025;
    int v45 = (v13 >> 8) & 0x3FFFFFF;
    _os_log_impl(&dword_21BAD2000, v21, OS_LOG_TYPE_DEBUG, "Metadata tile %{private}i_%{private}i_%{private}i is already loading", (uint8_t *)&buf, 0x14u);
    goto LABEL_6;
  }
  dispatch_once(&qword_26AC37568, &__block_literal_global_1);
  int64_t v21 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_11;
  }
LABEL_6:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
}

uint64_t __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 168) && (v3 = GEOTileKeyEquals(), uint64_t v2 = *(void *)(a1 + 32), v3))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v4 + 40) = *(id *)(v2 + 168);
  }
  else
  {
    v8 = [*(id *)(v2 + 144) objectForKey:*(void *)(a1 + 64)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v8 count] != 0;
    if (!v8)
    {
      v8 = [MEMORY[0x263EFF980] array];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "setObject:forKey:");
    }
    v5 = (void *)[*(id *)(a1 + 40) copy];
    id v6 = (void *)MEMORY[0x21D499960]();
    [v8 addObject:v6];
  }
  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
}

- (VLTileDataProvider)initWithAuditToken:(id)a3 supportedFormatVersions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VLTileDataProvider;
  v8 = [(VLTileDataProvider *)&v12 init];
  uint64_t v9 = v8;
  if (v8)
  {
    [(VLTileDataProvider *)v8 _commonInitWithTileLoader:0 auditToken:v6 supportedFormatVersions:v7];
    unint64_t v10 = v9;
  }

  return v9;
}

- (void)_commonInitWithTileLoader:(id)a3 auditToken:(id)a4 supportedFormatVersions:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_storeStrong((id *)&self->_auditToken, a4);
  if (v8)
  {
    unint64_t v11 = (GEOTileLoader *)v8;
  }
  else
  {
    unint64_t v11 = [MEMORY[0x263F41C40] modernLoader];
  }
  tileLoader = self->_tileLoader;
  self->_tileLoader = v11;

  GEOTileLoaderClientIdentifier();
  unint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  tileLoaderClientID = self->_tileLoaderClientID;
  self->_tileLoaderClientID = v13;

  [(GEOTileLoader *)self->_tileLoader openForClient:self->_tileLoaderClientID];
  uint64_t v15 = (NSArray *)[v10 copy];
  supportedFormatVersions = self->_supportedFormatVersions;
  self->_supportedFormatVersions = v15;

  self->_unsigned int maxSupportedFormatVersion = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v17 = self->_supportedFormatVersions;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unsigned int maxSupportedFormatVersion = self->_maxSupportedFormatVersion;
        if (maxSupportedFormatVersion > objc_msgSend(v22, "unsignedIntValue", (void)v28)) {
          unsigned int v21 = self->_maxSupportedFormatVersion;
        }
        else {
          unsigned int v21 = [v22 unsignedIntValue];
        }
        self->_unsigned int maxSupportedFormatVersion = v21;
      }
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v18);
  }

  v24 = (geo_isolater *)geo_isolater_create();
  isolation = self->_isolation;
  self->_isolation = v24;

  int v26 = (GEOTileKeyMap *)[objc_alloc(MEMORY[0x263F41C38]) initWithMapType:0];
  pendingMetadataTiles = self->_pendingMetadataTiles;
  self->_pendingMetadataTiles = v26;
}

void __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  v62 = v6;
  v63 = v7;
  v61 = v5;
  if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_2;
    block[3] = &unk_2643BA148;
    id v8 = *(NSObject **)(a1 + 40);
    id v75 = *(id *)(a1 + 48);
    id v74 = v6;
    dispatch_async(v8, block);

    id v9 = &v75;
    goto LABEL_89;
  }
  double v10 = *(double *)(a1 + 72);
  unint64_t v11 = (void *)*((void *)v7 + 23);
  double v12 = *(double *)(a1 + 80);
  id v13 = v5;
  id v69 = v11;
  double v65 = v12;
  if (v12 != 0.0 && [v13 purposeDenylistsCount])
  {
    unint64_t v14 = 0;
    do
    {
      if (v14 >= [v13 purposeDenylistsCount]) {
        goto LABEL_15;
      }
      uint64_t v15 = [v13 purposeDenylistAtIndex:v14] - 1;
      if (v15 < 3) {
        uint64_t v16 = v15 + 1;
      }
      else {
        uint64_t v16 = 0;
      }
      ++v14;
    }
    while (v16 != *(void *)&v12);
    if (qword_26AC37568 == -1)
    {
      unint64_t v17 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_14:
        char v60 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      unint64_t v17 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
    }
    *(_DWORD *)id buf = 134349056;
    double v83 = v12;
    _os_log_impl(&dword_21BAD2000, v17, OS_LOG_TYPE_INFO, "Metadata denylist contains purpose %{public}llu", buf, 0xCu);
    goto LABEL_14;
  }
LABEL_15:
  char v60 = 1;
LABEL_16:
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  [v13 tiles];
  uint64_t v68 = a1;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
  if (!v18) {
    goto LABEL_84;
  }
  uint64_t v66 = *(void *)v77;
  unsigned int v20 = *MEMORY[0x263F416B8];
  *(void *)&long long v19 = 134217984;
  long long v59 = v19;
  do
  {
    uint64_t v21 = 0;
    uint64_t v67 = v18;
    do
    {
      if (*(void *)v77 != v66) {
        objc_enumerationMutation(obj);
      }
      id v22 = *(void **)(*((void *)&v76 + 1) + 8 * v21);
      v23 = (void *)MEMORY[0x21D499780]();
      v24 = [v22 coord];
      GEOMapPointForCoordinate();
      double v26 = v25;
      double v28 = v27;
      char v29 = [v24 zoom];
      double v30 = (double)(1 << v29) / *(double *)(MEMORY[0x263F41670] + 16);
      if ([v24 x] != vcvtmd_u64_f64(v26 * v30)
        || [v24 y] != vcvtmd_u64_f64(v28 * v30))
      {
        int v37 = 0;
        goto LABEL_36;
      }
      if ([v22 precisionIndexsCount] != 1)
      {
        uint64_t v31 = [v22 precisionIndexsCount];
        if (v31 != [v22 buildIndexsCount]) {
          goto LABEL_94;
        }
      }
      for (unint64_t i = 0; ; ++i)
      {
        if (i >= objc_msgSend(v22, "buildIndexsCount", v59))
        {
          v38 = 0;
          id v39 = 0;
          goto LABEL_34;
        }
        unsigned int v33 = [v22 buildIndexAtIndex:i];
        if ([v13 buildsCount] <= (unint64_t)v33)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            goto LABEL_93;
          }
          *(_WORD *)v80 = 0;
          v57 = &_os_log_internal;
          j = "Assertion failed: buildIndex < metadata.buildsCount";
          goto LABEL_92;
        }
        __int16 v34 = objc_msgSend(v13, "buildAtIndex:");
        if ([v34 dataOutputVersion] <= v20)
        {
          char v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v34, "dataFormatVersion"));
          int v36 = [v69 containsObject:v35];

          if (v36) {
            break;
          }
        }
      }
      id v39 = v34;
      unsigned int v40 = [v22 precisionIndexAtIndex:i];
      if ([v13 precisionsCount] <= (unint64_t)v40)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
          goto LABEL_93;
        }
        *(_WORD *)v80 = 0;
        v57 = &_os_log_internal;
        for (j = "Assertion failed: precisionIndex < metadata.precisionsCount";
              ;
              j = "Assertion failed: tile.precisionIndexsCount == 1 || tile.precisionIndexsCount == tile.buildIndexsCount")
        {
LABEL_92:
          _os_log_fault_impl(&dword_21BAD2000, v57, OS_LOG_TYPE_FAULT, j, v80, 2u);
          do
          {
LABEL_93:
            __break(1u);
LABEL_94:
            ;
          }
          while (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT));
          *(_WORD *)v80 = 0;
          v57 = &_os_log_internal;
        }
      }
      v38 = objc_msgSend(v13, "precisionAtIndex:");

      if (!v39) {
        goto LABEL_34;
      }
      if (v65 == 0.0) {
        goto LABEL_61;
      }
      if (![v22 purposeDenylistsCount])
      {
        if ((v60 & 1) == 0)
        {
          if (qword_26AC37568 == -1)
          {
            uint64_t v47 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
              goto LABEL_34;
            }
          }
          else
          {
            dispatch_once(&qword_26AC37568, &__block_literal_global_1);
            uint64_t v47 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
              goto LABEL_34;
            }
          }
          *(_DWORD *)v80 = 134349056;
          double v81 = v65;
          int v45 = v47;
          uint64_t v46 = "Metadata tile denylist contains purpose %{public}llu, and data tile has no override denylist. This tile is not usable";
          goto LABEL_56;
        }
LABEL_61:
        if (v10 <= 0.0 || (*(void *)&v65 | 2) == 2 || (GEOConfigGetBOOL() & 1) != 0)
        {
          int v37 = 1;
          goto LABEL_35;
        }
        int v49 = uncertainty_limits;
        if (v10 > *(float *)&uncertainty_limits)
        {
          int v49 = dword_267C60C44;
          if (v10 > *(float *)&dword_267C60C44) {
            int v49 = dword_267C60C48;
          }
        }
        unint64_t v50 = 0;
        unsigned int v51 = *(float *)&v49;
        while (v50 < [v38 precisionsCount])
        {
          int v52 = [v38 precisionsAtIndex:v50++];
          int v37 = 1;
          if (v52 == v51) {
            goto LABEL_35;
          }
        }
        if (qword_26AC37568 == -1)
        {
          uint64_t v53 = _MergedGlobals_1;
          if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
            goto LABEL_34;
          }
        }
        else
        {
          dispatch_once(&qword_26AC37568, &__block_literal_global_1);
          uint64_t v53 = _MergedGlobals_1;
          if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
            goto LABEL_34;
          }
        }
        *(_DWORD *)v80 = v59;
        double v81 = v10;
        int v45 = v53;
        uint64_t v46 = "Metadata contains tile at this location, but only for lower-precision locations than the input (%.1f meter"
              "s). Considering VL to be unavailable at this location.";
LABEL_56:
        _os_log_impl(&dword_21BAD2000, v45, OS_LOG_TYPE_INFO, v46, v80, 0xCu);
        goto LABEL_34;
      }
      unint64_t v41 = 0;
      do
      {
        if (v41 >= [v22 purposeDenylistsCount])
        {
          if (v60) {
            goto LABEL_61;
          }
          if (qword_26AC37568 == -1)
          {
            v48 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
              goto LABEL_61;
            }
          }
          else
          {
            dispatch_once(&qword_26AC37568, &__block_literal_global_1);
            v48 = _MergedGlobals_1;
            if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
              goto LABEL_61;
            }
          }
          *(_DWORD *)v80 = 134349056;
          double v81 = v65;
          _os_log_impl(&dword_21BAD2000, v48, OS_LOG_TYPE_INFO, "Data tile denylist does not contain purpose %{public}llu, even though metadata tile does. The tile is usable", v80, 0xCu);
          goto LABEL_61;
        }
        uint64_t v42 = [v22 purposeDenylistAtIndex:v41] - 1;
        if (v42 < 3) {
          uint64_t v43 = v42 + 1;
        }
        else {
          uint64_t v43 = 0;
        }
        ++v41;
      }
      while (v43 != *(void *)&v65);
      if (qword_26AC37568 == -1)
      {
        uint64_t v44 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
          goto LABEL_34;
        }
        goto LABEL_51;
      }
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      uint64_t v44 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_51:
        *(_DWORD *)v80 = 134349056;
        double v81 = v65;
        int v45 = v44;
        uint64_t v46 = "Data tile denylist contains purpose %{public}llu";
        goto LABEL_56;
      }
LABEL_34:
      int v37 = 6;
LABEL_35:

LABEL_36:
      if (v37 != 6 && v37)
      {

        char v55 = 1;
        goto LABEL_88;
      }
      ++v21;
    }
    while (v21 != v67);
    uint64_t v18 = [obj countByEnumeratingWithState:&v76 objects:buf count:16];
  }
  while (v18);
LABEL_84:

  if (qword_26AC37568 == -1)
  {
    v54 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
      goto LABEL_86;
    }
  }
  else
  {
    dispatch_once(&qword_26AC37568, &__block_literal_global_1);
    v54 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
    {
LABEL_86:
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_21BAD2000, v54, OS_LOG_TYPE_INFO, "Location is not supported/available", v80, 2u);
    }
  }
  char v55 = 0;
LABEL_88:

  v70[0] = MEMORY[0x263EF8330];
  v70[1] = 3221225472;
  v70[2] = __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_3;
  v70[3] = &unk_2643BA170;
  id v9 = &v71;
  v56 = *(NSObject **)(v68 + 40);
  id v71 = *(id *)(v68 + 48);
  char v72 = v55;
  dispatch_async(v56, v70);
LABEL_89:
}

uint64_t __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = (char *)self + 48;
  *((void *)self + 7) = (char *)self + 48;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = (char *)self + 72;
  *((void *)self + 10) = (char *)self + 72;
  *((void *)self + 11) = 0;
  *((void *)self + 12) = (char *)self + 96;
  *((void *)self + 13) = (char *)self + 96;
  *((void *)self + 14) = 0;
  return self;
}

- (void)_disburseMetadataTileForKey:(uint64_t)a3 tileData:(void *)a4 error:(void *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  char v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  id v62 = 0;
  uint64_t v50 = MEMORY[0x263EF8330];
  uint64_t v51 = 3221225472;
  int v52 = __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke;
  uint64_t v53 = &unk_2643BA030;
  uint64_t v54 = a1;
  char v55 = &v57;
  uint64_t v56 = a3;
  geo_isolate_sync_data();
  if ([(id)v58[5] count])
  {
    if (v9)
    {
      if (qword_26AC37568 == -1)
      {
        double v10 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR)) {
          goto LABEL_6;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37568, &__block_literal_global_1);
        double v10 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
        {
LABEL_6:
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v14 = (id)v58[5];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v65 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v47;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v47 != v16) {
                  objc_enumerationMutation(v14);
                }
                (*(void (**)(void))(*(void *)(*((void *)&v46 + 1) + 8 * i) + 16))();
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v46 objects:v65 count:16];
            }
            while (v15);
          }
          goto LABEL_28;
        }
      }
      uint64_t v11 = *(unsigned int *)(a3 + 9);
      unint64_t v12 = v11 | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
      unint64_t v13 = *(void *)(a3 + 1);
      *(_DWORD *)id buf = 67175427;
      int v67 = (v13 >> 40) & 0x3F;
      __int16 v68 = 1025;
      int v69 = ((v13 >> 46) | (v11 << 18)) & 0x3FFFFFF;
      __int16 v70 = 1025;
      int v71 = (v12 >> 8) & 0x3FFFFFF;
      __int16 v72 = 2114;
      id v73 = v9;
      _os_log_impl(&dword_21BAD2000, v10, OS_LOG_TYPE_ERROR, "Failed to load metadata tile %{private}i_%{private}i_%{private}i: %{public}@", buf, 0x1Eu);
      goto LABEL_6;
    }
    id v14 = [v8 data];
    if (!v14)
    {
      uint64_t v18 = (void *)MEMORY[0x263EFF8F8];
      long long v19 = [v8 fileURL];
      id v45 = 0;
      id v14 = [v18 dataWithContentsOfURL:v19 options:0 error:&v45];
      id v20 = v45;

      if (!v14)
      {
        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v22 = (id)v58[5];
        uint64_t v27 = [v22 countByEnumeratingWithState:&v41 objects:v64 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v42 != v28) {
                objc_enumerationMutation(v22);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * j) + 16))();
            }
            uint64_t v27 = [v22 countByEnumeratingWithState:&v41 objects:v64 count:16];
          }
          while (v27);
        }
        id v14 = v20;
        goto LABEL_27;
      }
    }
    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F41CE8]) initWithData:v14];
    id v22 = v21;
    if (v21)
    {
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      int v36 = __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke_12;
      int v37 = &unk_2643B9F90;
      uint64_t v38 = a1;
      uint64_t v40 = a3;
      id v39 = v21;
      geo_isolate_sync_data();
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = (id)v58[5];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v23);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v30 + 1) + 8 * k) + 16))(*(void *)(*((void *)&v30 + 1) + 8 * k));
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v30 objects:v63 count:16];
      }
      while (v24);
    }

LABEL_27:
LABEL_28:
  }
  _Block_object_dispose(&v57, 8);
}

void __59__VLTileDataProvider__fetchMetadataTile_completionHandler___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = (id *)(a1 + 32);
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _disburseMetadataTileForKey:a2 tileData:v9 error:v8];
}

- (VLTileDataProvider)init
{
  result = (VLTileDataProvider *)[MEMORY[0x263EFF940] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (void)dealloc
{
  [(GEOTileLoader *)self->_tileLoader cancelAllForClient:self->_tileLoaderClientID];
  [(GEOTileLoader *)self->_tileLoader closeForClient:self->_tileLoaderClientID];
  v3.receiver = self;
  v3.super_class = (Class)VLTileDataProvider;
  [(VLTileDataProvider *)&v3 dealloc];
}

- (void)setShouldCacheMetadata:(BOOL)a3
{
}

void __45__VLTileDataProvider_setShouldCacheMetadata___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 176) = *(unsigned char *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 176))
  {
    uint64_t v2 = *(void **)(v1 + 168);
    *(void *)(v1 + 168) = 0;
  }
}

uint64_t __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) objectForKey:a1[6]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(void **)(a1[4] + 144);
  uint64_t v6 = a1[6];
  return [v5 removeObjectForKey:v6];
}

void __65__VLTileDataProvider__disburseMetadataTileForKey_tileData_error___block_invoke_12(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 176))
  {
    *(_OWORD *)(v1 + 152) = *(_OWORD *)*(void *)(a1 + 48);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), *(id *)(a1 + 40));
  }
}

void __68__VLTileDataProvider__fetchMetadataForCoordinate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  GEOErrorDomain();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend(v2, "errorWithDomain:code:userInfo:");
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (void)_fetchMetadataForDataKey:(id *)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    id v7 = [MEMORY[0x263F41BD0] modernManager];
    id v8 = [v7 activeTileGroup];
    id v9 = [v8 activeTileSetForStyle:70 size:2 scale:0];

    if (v9)
    {
      unsigned int maxSupportedFormatVersion = self->_maxSupportedFormatVersion;
      uint64_t v11 = objc_msgSend(v9, "maximumZoomLevelInRect:", *MEMORY[0x263F41670], *(double *)(MEMORY[0x263F41670] + 8), *(double *)(MEMORY[0x263F41670] + 16), *(double *)(MEMORY[0x263F41670] + 24));
      long double v12 = ldexp(1.0, (int)v11 - a3->var0);
      unint64_t v13 = (v12 * (double)a3->var1);
      long double v14 = v12 * (double)a3->var2;
      buf[0] = *MEMORY[0x263F416C0] & 0x7F;
      *(void *)&buf[1] = (*MEMORY[0x263F416B8] & 0x3F | (maxSupportedFormatVersion << 6) | (unint64_t)(v11 << 40)) & 0x3F0000007FFFLL | ((unint64_t)v13 << 46);
      *((void *)&v15 + 1) = (v13 >> 18) | ((unint64_t)(v14 & 0x3FFFFFF) << 8);
      *(void *)&long long v15 = v13 << 46;
      *(void *)&long long v34 = *(void *)buf;
      *((void *)&v34 + 1) = v15 >> 56;
      if (qword_26AC37568 == -1)
      {
        uint64_t v16 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
        {
LABEL_6:
          [(VLTileDataProvider *)self _fetchMetadataTile:&v34 completionHandler:v6];
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37568, &__block_literal_global_1);
        uint64_t v16 = _MergedGlobals_1;
        if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_6;
        }
      }
      int var0 = a3->var0;
      int var1 = a3->var1;
      int var2 = a3->var2;
      *(_DWORD *)id buf = 67175937;
      *(_DWORD *)&uint8_t buf[4] = var0;
      *(_WORD *)&buf[8] = 1025;
      int v25 = var1;
      __int16 v26 = 1025;
      int v27 = var2;
      __int16 v28 = 1025;
      int v29 = (*(void *)((char *)&v34 + 1) >> 40) & 0x3F;
      __int16 v30 = 1025;
      int v31 = ((*(void *)((char *)&v34 + 1) >> 46) | (*(_DWORD *)((char *)&v34 + 9) << 18)) & 0x3FFFFFF;
      __int16 v32 = 1025;
      int v33 = ((*(unsigned int *)((char *)&v34 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v34 + 13) | (HIBYTE(v34) << 16)) << 32)) >> 8) & 0x3FFFFFF;
      _os_log_impl(&dword_21BAD2000, v16, OS_LOG_TYPE_DEBUG, "Data key %{private}i_%{private}i_%{private}i maps to metadata tile %{private}i_%{private}i_%{private}i", buf, 0x26u);
      goto LABEL_6;
    }
    if (qword_26AC37568 == -1)
    {
      id v20 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:
        uint64_t v21 = dispatch_get_global_queue(21, 0);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __65__VLTileDataProvider__fetchMetadataForDataKey_completionHandler___block_invoke;
        block[3] = &unk_2643B9FB8;
        id v23 = v6;
        dispatch_async(v21, block);

        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      id v20 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
    }
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_21BAD2000, v20, OS_LOG_TYPE_DEBUG, "No matching tileset found for VL_METADATA. Cannot fetch metadata.", buf, 2u);
    goto LABEL_10;
  }
LABEL_12:
}

void __65__VLTileDataProvider__fetchMetadataForDataKey_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  GEOErrorDomain();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = objc_msgSend(v2, "errorWithDomain:code:userInfo:");
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v3);
}

- (id)fileURLForKey:(id *)a3 error:(id *)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v48 = 0;
  long long v49 = &v48;
  uint64_t v50 = 0x3032000000;
  uint64_t v51 = __Block_byref_object_copy_;
  int v52 = __Block_byref_object_dispose_;
  id v53 = 0;
  uint64_t v41 = MEMORY[0x263EF8330];
  uint64_t v42 = 3221225472;
  long long v43 = __42__VLTileDataProvider_fileURLForKey_error___block_invoke;
  long long v44 = &unk_2643BA030;
  long long v46 = &v48;
  long long v47 = a3;
  id v45 = self;
  geo_isolate_sync_data();
  if (v49[5])
  {
    if (qword_26AC37568 == -1)
    {
      id v7 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        long double v12 = [(id)v49[5] fileURL];
        goto LABEL_19;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      id v7 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
        goto LABEL_5;
      }
    }
    int var0 = a3->var0;
    int var1 = a3->var1;
    int var2 = a3->var2;
    int var3 = a3->var3;
    *(_DWORD *)id buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = var0;
    LOWORD(v59) = 1024;
    *(_DWORD *)((char *)&v59 + 2) = var1;
    HIWORD(v59) = 1024;
    *(_DWORD *)char v60 = var2;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = var3;
    _os_log_impl(&dword_21BAD2000, v7, OS_LOG_TYPE_INFO, "Returning cached track data: <z: %i, x: %i, y: %i, uncertainty: %i>", buf, 0x1Au);
    goto LABEL_5;
  }
  *(void *)id buf = 0;
  uint64_t v59 = buf;
  *(void *)char v60 = 0x2020000000;
  v60[8] = 0;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  location[1] = (id)MEMORY[0x263EF8330];
  location[2] = (id)3221225472;
  location[3] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_18;
  location[4] = &unk_2643BA058;
  location[5] = self;
  location[6] = buf;
  location[8] = &v33;
  location[9] = (id)a3;
  location[7] = &v37;
  geo_isolate_sync_data();
  if (*((unsigned char *)v38 + 24))
  {
    if (qword_26AC37568 == -1)
    {
      unint64_t v13 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      unint64_t v13 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:
        if (a4) {
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
    int v14 = a3->var0;
    int v15 = a3->var1;
    int v16 = a3->var2;
    int v17 = a3->var3;
    *(_DWORD *)uint64_t v54 = 67175425;
    *(_DWORD *)&v54[4] = v14;
    *(_WORD *)&v54[8] = 1025;
    *(_DWORD *)&v54[10] = v15;
    *(_WORD *)&v54[14] = 1025;
    int v55 = v16;
    __int16 v56 = 1025;
    int v57 = v17;
    _os_log_impl(&dword_21BAD2000, v13, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i has recently failed.", v54, 0x1Au);
    goto LABEL_10;
  }
  if (!*((unsigned char *)v34 + 24))
  {
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"VLLocalizationDataProviderErrorDomain" code:1 userInfo:0];
    }
    if (!v59[24])
    {
      *($A3B2E143E1A03423F9FC703C010436DC *)uint64_t v54 = *a3;
      objc_initWeak(location, self);
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_19;
      v29[3] = &unk_2643BA0D0;
      objc_copyWeak(&v30, location);
      long long v31 = *(_OWORD *)v54;
      [(VLTileDataProvider *)self _fetchMetadataForDataKey:a3 completionHandler:v29];
      objc_destroyWeak(&v30);
      objc_destroyWeak(location);
      goto LABEL_18;
    }
    if (qword_26AC37568 == -1)
    {
      uint64_t v24 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
    }
    else
    {
      dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      uint64_t v24 = _MergedGlobals_1;
      if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_18;
      }
    }
    int v25 = a3->var0;
    int v26 = a3->var1;
    int v27 = a3->var2;
    int v28 = a3->var3;
    *(_DWORD *)uint64_t v54 = 67175425;
    *(_DWORD *)&v54[4] = v25;
    *(_WORD *)&v54[8] = 1025;
    *(_DWORD *)&v54[10] = v26;
    *(_WORD *)&v54[14] = 1025;
    int v55 = v27;
    __int16 v56 = 1025;
    int v57 = v28;
    _os_log_impl(&dword_21BAD2000, v24, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i is already loading.", v54, 0x1Au);
    goto LABEL_18;
  }
  if (qword_26AC37568 == -1)
  {
    uint64_t v18 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  dispatch_once(&qword_26AC37568, &__block_literal_global_1);
  uint64_t v18 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
  {
LABEL_15:
    int v19 = a3->var0;
    int v20 = a3->var1;
    int v21 = a3->var2;
    int v22 = a3->var3;
    *(_DWORD *)uint64_t v54 = 67175425;
    *(_DWORD *)&v54[4] = v19;
    *(_WORD *)&v54[8] = 1025;
    *(_DWORD *)&v54[10] = v20;
    *(_WORD *)&v54[14] = 1025;
    int v55 = v21;
    __int16 v56 = 1025;
    int v57 = v22;
    _os_log_impl(&dword_21BAD2000, v18, OS_LOG_TYPE_DEBUG, "Tile %{private}i_%{private}i_%{private}i:%{private}i is not supported/available.", v54, 0x1Au);
  }
LABEL_16:
  if (a4)
  {
LABEL_17:
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"VLLocalizationDataProviderErrorDomain" code:2 userInfo:0];
  }
LABEL_18:
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(buf, 8);
  long double v12 = 0;
LABEL_19:
  _Block_object_dispose(&v48, 8);

  return v12;
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = (void *)v1[17];
  if (v2)
  {
    uint64_t v3 = (uint64_t *)a1[6];
    uint64_t v5 = v1[15];
    uint64_t v4 = v1[16];
    uint64_t v7 = *v3;
    uint64_t v6 = v3[1];
    if (v5 == v7 && v4 == v6) {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), v2);
    }
  }
}

__n128 __42__VLTileDataProvider_fileURLForKey_error___block_invoke_18(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = (void *)(v1 + 48);
  uint64_t v3 = *(void **)(v1 + 56);
  uint64_t v4 = (__n128 *)a1[8];
  if (v3 == v2)
  {
LABEL_7:
    uint64_t v3 = v2;
  }
  else
  {
    while (v3[2] != v4->n128_u64[0] || v3[3] != v4->n128_u64[1])
    {
      uint64_t v3 = (void *)v3[1];
      if (v3 == v2) {
        goto LABEL_7;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v3 != v2;
  uint64_t v6 = a1[4];
  uint64_t v7 = (void *)(v6 + 72);
  id v8 = *(void **)(v6 + 80);
  if (v8 == v7)
  {
LABEL_14:
    id v8 = v7;
  }
  else
  {
    while (v8[2] != v4->n128_u64[0] || v8[3] != v4->n128_u64[1])
    {
      id v8 = (void *)v8[1];
      if (v8 == v7) {
        goto LABEL_14;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8 != v7;
  uint64_t v10 = a1[4];
  uint64_t v11 = (void *)(v10 + 96);
  long double v12 = *(void **)(v10 + 104);
  if (v12 == v11)
  {
LABEL_21:
    long double v12 = v11;
  }
  else
  {
    while (v12[2] != v4->n128_u64[0] || v12[3] != v4->n128_u64[1])
    {
      long double v12 = (void *)v12[1];
      if (v12 == v11) {
        goto LABEL_21;
      }
    }
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v12 != v11;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24)
    && !*(unsigned char *)(*(void *)(a1[6] + 8) + 24)
    && !*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    int v14 = (void *)a1[4];
    int v15 = operator new(0x20uLL);
    __n128 result = *v4;
    v15[1] = *v4;
    uint64_t v17 = v14[6];
    v14 += 6;
    *(void *)int v15 = v17;
    *((void *)v15 + 1) = v14;
    *(void *)(v17 + 8) = v15;
    *int v14 = v15;
    ++v14[2];
  }
  return result;
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v59 = a2;
  id v62 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_79;
  }
  if (v62)
  {
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __42__VLTileDataProvider_fileURLForKey_error___block_invoke_2;
    v73[3] = &unk_2643BA080;
    v73[4] = WeakRetained;
    long long v74 = *(_OWORD *)(a1 + 40);
    geo_isolate_sync_data();
    goto LABEL_79;
  }
  int v57 = WeakRetained;
  id v7 = WeakRetained[23];
  id v8 = v73;
  id v9 = v59;
  id v68 = v7;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v10 = [v9 tiles];
  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v75 objects:&v85 count:16];
  char v60 = (_DWORD *)(a1 + 40);
  if (!v11) {
    goto LABEL_67;
  }
  unsigned int v58 = 0;
  __int8 v56 = *MEMORY[0x263F416B0] & 0x7F;
  uint64_t v65 = *(void *)v76;
  unsigned int v69 = *MEMORY[0x263F416B8];
  *((void *)&v12 + 1) = 0xF0E0D0C0B0A1918;
  *(void *)&long long v12 = 67175425;
  long long v55 = v12;
  do
  {
    uint64_t v64 = v11;
    for (uint64_t i = 0; i != v64; ++i)
    {
      if (*(void *)v76 != v65) {
        objc_enumerationMutation(obj);
      }
      int v14 = *(void **)(*((void *)&v75 + 1) + 8 * i);
      context = (void *)MEMORY[0x21D499780]();
      int v15 = [v14 coord];
      if ([v15 x] != *(_DWORD *)(a1 + 44)
        || [v15 y] != *(_DWORD *)(a1 + 48)
        || [v15 zoom] != *v60)
      {
        int v39 = 1;
        goto LABEL_55;
      }
      uint64_t v16 = [v14 precisionIndexsCount];
      if (v16 != [v14 buildIndexsCount]) {
        goto LABEL_84;
      }
      unint64_t v17 = 0;
      uint64_t v66 = 0;
      __int8 v61 = -1;
      while (v17 < objc_msgSend(v14, "buildIndexsCount", v55))
      {
        unsigned int v18 = [v14 buildIndexAtIndex:v17];
        if ([v9 buildsCount] <= (unint64_t)v18)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
            goto LABEL_83;
          }
          *(_WORD *)id buf = 0;
          id v53 = &_os_log_internal;
          for (uint64_t j = "Assertion failed: buildIndex < metadata.buildsCount";
                ;
                uint64_t j = "Assertion failed: tile.precisionIndexsCount == tile.buildIndexsCount")
          {
            _os_log_fault_impl(&dword_21BAD2000, v53, OS_LOG_TYPE_FAULT, j, buf, 2u);
            do
            {
LABEL_83:
              __break(1u);
LABEL_84:
              ;
            }
            while (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT));
            *(_WORD *)id buf = 0;
            id v53 = &_os_log_internal;
          }
        }
        int v19 = objc_msgSend(v9, "buildAtIndex:");
        if ([v19 dataOutputVersion] <= v69)
        {
          uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "dataFormatVersion"));
          char v25 = [v68 containsObject:v24];

          if (v25)
          {
            int v20 = objc_msgSend(v9, "precisionAtIndex:", objc_msgSend(v14, "precisionIndexAtIndex:", v17));
            unint64_t v26 = 0;
            unsigned int v27 = -1;
            while (v26 < [v20 precisionsCount])
            {
              unsigned int v28 = [v20 precisionsAtIndex:v26];
              if (v28 < v27 && v28 >= *(_DWORD *)(a1 + 52)) {
                unsigned int v27 = v28;
              }
              ++v26;
            }
            if (v27 == -1)
            {
              if (qword_26AC37568 != -1) {
                dispatch_once(&qword_26AC37568, &__block_literal_global_1);
              }
              long long v31 = (id)_MergedGlobals_1;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v33 = [v19 identifier];
                int v34 = *(_DWORD *)(a1 + 52);
                *(_DWORD *)id buf = 134283777;
                *(void *)double v81 = v33;
                *(_WORD *)&v81[8] = 1025;
                *(_DWORD *)v82 = v34;
                _os_log_impl(&dword_21BAD2000, v31, OS_LOG_TYPE_DEBUG, "Build %{private}llu does not support the requested precision (%{private}i) or higher", buf, 0x12u);
              }
              goto LABEL_42;
            }
            if (v27 >= 0x100)
            {
              if (qword_26AC37568 != -1) {
                dispatch_once(&qword_26AC37568, &__block_literal_global_1);
              }
              long long v31 = (id)_MergedGlobals_1;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                uint64_t v32 = [v19 identifier];
                *(_DWORD *)id buf = 134283777;
                *(void *)double v81 = v32;
                *(_WORD *)&v81[8] = 1025;
                *(_DWORD *)v82 = v27;
                _os_log_impl(&dword_21BAD2000, v31, OS_LOG_TYPE_ERROR, "Build %{private}llu's best available precision (%{private}i) is larger than UINT8_MAX, which is unsupported", buf, 0x12u);
              }
LABEL_42:

              goto LABEL_35;
            }
            if (!v66
              || (unsigned int v35 = [v19 dataFormatVersion],
                  v35 > [v66 dataFormatVersion])
              || (int v37 = [v19 dataFormatVersion],
                  v37 == [v66 dataFormatVersion])
              && (unsigned int v38 = [v19 dataOutputVersion],
                  v38 > [v66 dataOutputVersion]))
            {
              id v36 = v19;

              __int8 v61 = v27;
              uint64_t v66 = v36;
            }
          }
          else
          {
            if (qword_26AC37568 != -1) {
              dispatch_once(&qword_26AC37568, &__block_literal_global_1);
            }
            int v20 = (id)_MergedGlobals_1;
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v30 = [v19 identifier];
              *(_DWORD *)id buf = 134283521;
              *(void *)double v81 = v30;
              int v22 = v20;
              id v23 = "Build %{private}llu's data format version is not supported by this client";
              goto LABEL_34;
            }
          }
        }
        else
        {
          if (qword_26AC37568 != -1) {
            dispatch_once(&qword_26AC37568, &__block_literal_global_1);
          }
          int v20 = (id)_MergedGlobals_1;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v21 = [v19 identifier];
            *(_DWORD *)id buf = 134283521;
            *(void *)double v81 = v21;
            int v22 = v20;
            id v23 = "Build %{private}llu's data output version is not supported by this client";
LABEL_34:
            _os_log_impl(&dword_21BAD2000, v22, OS_LOG_TYPE_DEBUG, v23, buf, 0xCu);
          }
        }
LABEL_35:

        ++v17;
      }
      LOBYTE(v8) = v66 != 0;
      if (v66)
      {
        int v71 = [v66 routingKey];
        char v72 = v72 & 0xC0 | [v66 dataOutputVersion] & 0x3F;
        unsigned int v58 = [v66 dataFormatVersion];
        v40.i64[0] = [v66 identifier];
        v90.val[1] = vextq_s8(v40, v40, 0xFuLL);
        v90.val[1].i8[0] = v56;
        v90.val[1].i8[9] = v61;
        v41.i64[0] = *(_DWORD *)(a1 + 40) & 0x1F | (32 * (*(_DWORD *)(a1 + 44) & 0x1FFFFFu)) | ((unint64_t)(*(_DWORD *)(a1 + 48) & 0x1FFFFF) << 26);
        v90.val[0] = vextq_s8(v40, v41, 6uLL);
        int8x16_t v79 = vqtbl2q_s8(v90, (int8x16_t)xmmword_21BB7A670);
        goto LABEL_63;
      }
      if (qword_26AC37568 == -1)
      {
        uint64_t v42 = _MergedGlobals_1;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
      }
      else
      {
        dispatch_once(&qword_26AC37568, &__block_literal_global_1);
        uint64_t v42 = _MergedGlobals_1;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
        {
LABEL_62:
          int v43 = *(_DWORD *)(a1 + 40);
          int v44 = *(_DWORD *)(a1 + 44);
          int v45 = *(_DWORD *)(a1 + 48);
          int v46 = *(_DWORD *)(a1 + 52);
          *(_DWORD *)id buf = v55;
          *(_DWORD *)double v81 = v43;
          *(_WORD *)&v81[4] = 1025;
          *(_DWORD *)&v81[6] = v44;
          *(_WORD *)v82 = 1025;
          *(_DWORD *)&v82[2] = v45;
          __int16 v83 = 1025;
          int v84 = v46;
          _os_log_impl(&dword_21BAD2000, v42, OS_LOG_TYPE_ERROR, "Metadata tile does not contain supported build for tile %{private}i_%{private}i_%{private}i: %{private}i", buf, 0x1Au);
        }
      }
LABEL_63:

      int v39 = 0;
LABEL_55:

      if (!v39)
      {

        if ((v8 & 1) == 0) {
          goto LABEL_78;
        }
        uint64_t v85 = 0;
        v86 = &v85;
        uint64_t v87 = 0x2020000000;
        char v88 = 0;
        geo_isolate_sync();
        if (*((unsigned char *)v86 + 24))
        {
          id v51 = objc_loadWeakRetained(v57 + 1);
          [v51 dataProvider:v57 didChangeFormatVersion:v58];
        }
        if (qword_26AC37568 == -1)
        {
          int v52 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_76;
          }
        }
        else
        {
          dispatch_once(&qword_26AC37568, &__block_literal_global_1);
          int v52 = _MergedGlobals_1;
          if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_DEBUG))
          {
LABEL_76:
            LOWORD(v75) = 0;
            _os_log_impl(&dword_21BAD2000, v52, OS_LOG_TYPE_DEBUG, "Metadata supports requested data tile. Loading data tile.", (uint8_t *)&v75, 2u);
          }
        }
        uint64_t v6 = v57;
        objc_msgSend(v57, "_fetchDataTile:originalKey:additionalInfo:", &v79, v60, v70, v55);
        _Block_object_dispose(&v85, 8);
        goto LABEL_79;
      }
    }
    uint64_t v10 = obj;
    uint64_t v11 = [obj countByEnumeratingWithState:&v75 objects:&v85 count:16];
  }
  while (v11);
LABEL_67:

  if (qword_26AC37568 == -1)
  {
    long long v47 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
      goto LABEL_69;
    }
  }
  else
  {
    dispatch_once(&qword_26AC37568, &__block_literal_global_1);
    long long v47 = _MergedGlobals_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
    {
LABEL_69:
      int v48 = *(_DWORD *)(a1 + 40);
      int v49 = *(_DWORD *)(a1 + 44);
      int v50 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)id buf = 67109632;
      *(_DWORD *)double v81 = v48;
      *(_WORD *)&v81[4] = 1024;
      *(_DWORD *)&v81[6] = v49;
      *(_WORD *)v82 = 1024;
      *(_DWORD *)&v82[2] = v50;
      _os_log_impl(&dword_21BAD2000, v47, OS_LOG_TYPE_INFO, "Tile %i_%i_%i is not supported/available", buf, 0x14u);
    }
  }

LABEL_78:
  uint64_t v6 = v57;
  geo_isolate_sync_data();
LABEL_79:
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_2(uint64_t a1)
{
  std::list<VLLocalizationDataKey>::remove((void *)(*(void *)(a1 + 32) + 48), a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 80);
  uint64_t v5 = *(void *)(v2 + 88);
  *(void *)uint64_t v3 = v2 + 72;
  *((void *)v3 + 1) = v4;
  *uint64_t v4 = v3;
  *(void *)(v2 + 80) = v3;
  *(void *)(v2 + 88) = v5 + 1;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(v6 + 88);
  if (v7 >= 0x33)
  {
    do
    {
      id v8 = *(uint64_t **)(v6 + 72);
      uint64_t v9 = *v8;
      *(void *)(v9 + 8) = v8[1];
      *(void *)v8[1] = v9;
      *(void *)(v6 + 88) = v7 - 1;
      operator delete(v8);
      uint64_t v6 = *(void *)(a1 + 32);
      unint64_t v7 = *(void *)(v6 + 88);
    }
    while (v7 > 0x32);
  }
}

void __42__VLTileDataProvider_fileURLForKey_error___block_invoke_3(uint64_t a1)
{
  std::list<VLLocalizationDataKey>::remove((void *)(*(void *)(a1 + 32) + 48), a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 104);
  uint64_t v5 = *(void *)(v2 + 112);
  *(void *)uint64_t v3 = v2 + 96;
  *((void *)v3 + 1) = v4;
  *uint64_t v4 = v3;
  *(void *)(v2 + 104) = v3;
  *(void *)(v2 + 112) = v5 + 1;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(v6 + 112);
  if (v7 >= 0x33)
  {
    do
    {
      id v8 = *(uint64_t **)(v6 + 96);
      uint64_t v9 = *v8;
      *(void *)(v9 + 8) = v8[1];
      *(void *)v8[1] = v9;
      *(void *)(v6 + 112) = v7 - 1;
      operator delete(v8);
      uint64_t v6 = *(void *)(a1 + 32);
      unint64_t v7 = *(void *)(v6 + 112);
    }
    while (v7 > 0x32);
  }
}

uint64_t __42__VLTileDataProvider_fileURLForKey_error___block_invoke_4(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 48);
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1 != *(_DWORD *)(*(void *)(result + 32) + 196);
  *(_DWORD *)(*(void *)(result + 32) + 196) = v1;
  return result;
}

- (void)_fetchDataTile:(uint64_t)a3 originalKey:(_OWORD *)a4 additionalInfo:(uint64_t *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (qword_26AC37568 != -1)
  {
    dispatch_once(&qword_26AC37568, &__block_literal_global_1);
    uint64_t v9 = _MergedGlobals_1;
    if (!os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO)) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = _MergedGlobals_1;
  if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    unint64_t v10 = *(void *)(a3 + 4);
    int v11 = *(unsigned __int8 *)(a3 + 3);
    uint64_t v12 = *a5;
    int v13 = *((_DWORD *)a5 + 2);
    int v14 = (HIWORD(v10) | (*(_DWORD *)(a3 + 12) << 16)) & 0x3FFFFFF;
    *(_DWORD *)id buf = 67175937;
    *(_DWORD *)&uint8_t buf[4] = WORD1(v10) & 0x3F;
    *(_WORD *)&uint8_t buf[8] = 1025;
    *(_DWORD *)&unsigned char buf[10] = (v10 >> 22) & 0x3FFFFFF;
    *(_WORD *)&buf[14] = 1025;
    int v26 = v14;
    __int16 v27 = 1025;
    int v28 = v11;
    __int16 v29 = 2048;
    uint64_t v30 = v12;
    __int16 v31 = 1024;
    int v32 = v13;
    _os_log_impl(&dword_21BAD2000, v9, OS_LOG_TYPE_INFO, "Loading tile %{private}i_%{private}i_%{private}i:%{private}i [%llu:%i] from GeoServices...", buf, 0x2Au);
  }
LABEL_4:
  objc_initWeak(&location, a1);
  *(_OWORD *)id buf = *a4;
  uint64_t v16 = (void *)a1[2];
  uint64_t v15 = a1[3];
  qos_class_t v17 = qos_class_self();
  uint64_t v18 = a1[4];
  int v19 = dispatch_get_global_queue(21, 0);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke;
  v21[3] = &unk_2643BA120;
  objc_copyWeak(&v22, &location);
  long long v23 = *(_OWORD *)buf;
  LODWORD(v20) = v17;
  [v16 loadKey:a3 additionalInfo:a5 priority:3221225469 forClient:v15 options:3 reason:4 qos:v20 signpostID:0 auditToken:v18 callbackQ:v19 beginNetwork:0 callback:v21];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = v9;
    id v16 = v8;
    geo_isolate_sync_data();
    if (v11)
    {
      if (qword_26AC37568 != -1) {
        dispatch_once(&qword_26AC37568, &__block_literal_global_1);
      }
      uint64_t v12 = _MergedGlobals_1;
      if (os_log_type_enabled((os_log_t)_MergedGlobals_1, OS_LOG_TYPE_ERROR))
      {
        int v13 = *(_DWORD *)(a2 + 12);
        unint64_t v14 = *(void *)(a2 + 4);
        int v15 = *(unsigned __int8 *)(a2 + 3);
        *(_DWORD *)id buf = 67175683;
        unsigned int v18 = WORD1(v14) & 0x3F;
        __int16 v19 = 1025;
        int v20 = (v14 >> 22) & 0x3FFFFFF;
        __int16 v21 = 1025;
        int v22 = (HIWORD(v14) | (v13 << 16)) & 0x3FFFFFF;
        __int16 v23 = 1025;
        int v24 = v15;
        __int16 v25 = 2114;
        id v26 = v11;
        _os_log_impl(&dword_21BAD2000, v12, OS_LOG_TYPE_ERROR, "Tile failed to load: %{private}i_%{private}i_%{private}i:%{private}i: %{public}@", buf, 0x24u);
      }
      geo_isolate_sync_data();
    }
  }
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke_2(void *a1)
{
  uint64_t v2 = a1 + 7;
  std::list<VLLocalizationDataKey>::remove((void *)(a1[4] + 48), (uint64_t)(a1 + 7));
  if (!a1[5])
  {
    *(_OWORD *)(a1[4] + 120) = *v2;
    uint64_t v3 = (void *)a1[6];
    uint64_t v4 = (id *)(a1[4] + 136);
    objc_storeStrong(v4, v3);
  }
}

void __64__VLTileDataProvider__fetchDataTile_originalKey_additionalInfo___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = operator new(0x20uLL);
  v3[1] = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void **)(v2 + 80);
  uint64_t v5 = *(void *)(v2 + 88);
  *(void *)uint64_t v3 = v2 + 72;
  *((void *)v3 + 1) = v4;
  *uint64_t v4 = v3;
  *(void *)(v2 + 80) = v3;
  *(void *)(v2 + 88) = v5 + 1;
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = *(void *)(v6 + 88);
  if (v7 >= 0x33)
  {
    do
    {
      id v8 = *(uint64_t **)(v6 + 72);
      uint64_t v9 = *v8;
      *(void *)(v9 + 8) = v8[1];
      *(void *)v8[1] = v9;
      *(void *)(v6 + 88) = v7 - 1;
      operator delete(v8);
      uint64_t v6 = *(void *)(a1 + 32);
      unint64_t v7 = *(void *)(v6 + 88);
    }
    while (v7 > 0x32);
  }
}

uint64_t __107__VLTileDataProvider_determineAvailabilityForCoordinate_horizontalAccuracy_purpose_callbackQueue_callback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (VLLocalizationDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VLLocalizationDataProviderDelegate *)WeakRetained;
}

- (BOOL)shouldCacheMetadata
{
  return self->_shouldCacheMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedFormatVersions, 0);
  objc_storeStrong((id *)&self->_lastLoadedMetadata, 0);
  objc_storeStrong((id *)&self->_pendingMetadataTiles, 0);
  objc_storeStrong((id *)&self->_lastLoadedData, 0);
  if (self->_recentUnsupportedTiles.__size_alloc_.__value_)
  {
    prev = self->_recentUnsupportedTiles.__end_.__prev_;
    next = (VLTileDataProvider *)self->_recentUnsupportedTiles.__end_.__next_;
    Class isa = next->super.isa;
    *((void *)isa + 1) = prev[1];
    *(void *)prev[1] = isa;
    self->_recentUnsupportedTiles.__size_alloc_.__value_ = 0;
    if (next != (VLTileDataProvider *)&self->_recentUnsupportedTiles)
    {
      do
      {
        delegate = (VLTileDataProvider *)next->_delegate;
        operator delete(next);
        next = delegate;
      }
      while (delegate != (VLTileDataProvider *)&self->_recentUnsupportedTiles);
    }
  }
  if (self->_recentFailures.__size_alloc_.__value_)
  {
    id v8 = self->_recentFailures.__end_.__prev_;
    unint64_t v7 = (VLTileDataProvider *)self->_recentFailures.__end_.__next_;
    Class v9 = v7->super.isa;
    *((void *)v9 + 1) = v8[1];
    *(void *)v8[1] = v9;
    self->_recentFailures.__size_alloc_.__value_ = 0;
    if (v7 != (VLTileDataProvider *)&self->_recentFailures)
    {
      do
      {
        unint64_t v10 = (VLTileDataProvider *)v7->_delegate;
        operator delete(v7);
        unint64_t v7 = v10;
      }
      while (v10 != (VLTileDataProvider *)&self->_recentFailures);
    }
  }
  if (self->_loadingKeys.__size_alloc_.__value_)
  {
    uint64_t v12 = self->_loadingKeys.__end_.__prev_;
    id v11 = (VLTileDataProvider *)self->_loadingKeys.__end_.__next_;
    Class v13 = v11->super.isa;
    *((void *)v13 + 1) = v12[1];
    *(void *)v12[1] = v13;
    self->_loadingKeys.__size_alloc_.__value_ = 0;
    if (v11 != (VLTileDataProvider *)&self->_loadingKeys)
    {
      do
      {
        unint64_t v14 = (VLTileDataProvider *)v11->_delegate;
        operator delete(v11);
        id v11 = v14;
      }
      while (v14 != (VLTileDataProvider *)&self->_loadingKeys);
    }
  }
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_tileLoaderClientID, 0);
  objc_storeStrong((id *)&self->_tileLoader, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
@interface RSOfflineFloorPlanGenerator
- (RSOfflineFloorPlanGenerator)init;
- (void)clear;
- (void)generateFloorPlanWithInputPath:(id)a3 outputPath:(id)a4 debug:(BOOL)a5;
@end

@implementation RSOfflineFloorPlanGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_doorWindowPostProcessor, 0);
  objc_storeStrong((id *)&self->_removeOutsideObject, 0);
  objc_storeStrong((id *)&self->_openingHeightAlignment, 0);
  objc_storeStrong((id *)&self->_roomNodeGenerator, 0);
  objc_storeStrong((id *)&self->_floorEstimator, 0);
  objc_storeStrong((id *)&self->_heightEstimator, 0);
  objc_storeStrong((id *)&self->_onlineOfflineAssociation, 0);
  objc_storeStrong((id *)&self->_deduplicateOpeningOpenDoor, 0);
  objc_storeStrong((id *)&self->_structurePostprocess, 0);
  objc_storeStrong((id *)&self->_baywindowFPRemoval, 0);
  objc_storeStrong((id *)&self->_projector, 0);
  objc_storeStrong((id *)&self->_curvedWallDetector, 0);
  objc_storeStrong((id *)&self->_geometryEstimator, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_wallOpeningDetector, 0);

  objc_storeStrong((id *)&self->_doorWindowDetector, 0);
}

- (void)clear
{
  v19.receiver = self;
  v19.super_class = (Class)RSOfflineFloorPlanGenerator;
  [(RSFloorPlanGeneratorBase *)&v19 clear];
  accumulator = self->_accumulator;
  if (accumulator)
  {
    objc_msgSend_reset(accumulator->_worldpc, v3, v4);
    sub_25B4D4040((uint64_t)accumulator->_accMeta, v8, v9);
  }
  sub_25B400DC4((uint64_t)self->_geometryEstimator, v5, v6);
  projector = self->_projector;
  if (projector)
  {
    uint64_t image = (uint64_t)projector->_image;
    if (image) {
      sub_25B4FDD60(image);
    }
    uint64_t heightImage = (uint64_t)projector->_heightImage;
    if (heightImage) {
      sub_25B4FDD60(heightImage);
    }
    uint64_t cameraImage = (uint64_t)projector->_cameraImage;
    if (cameraImage) {
      sub_25B4FDD60(cameraImage);
    }
  }
  sub_25B4137C0((uint64_t *)self->_heightEstimator);
  sub_25B5A4ADC((uint64_t)self->_floorEstimator);
  sub_25B54EE18((uint64_t)self->_roomNodeGenerator, v14, v15);
  openingHeightAlignment = self->_openingHeightAlignment;
  if (openingHeightAlignment)
  {
    sub_25B4011C0((uint64_t)&openingHeightAlignment->_openingHeightAlignment._opening_fixed);
    openingHeightAlignment->_openingHeightAlignment._floor_v = 1.0;
  }
  objc_msgSend_removeAllObjects(self->_debugInfo, v16, v17);
}

- (RSOfflineFloorPlanGenerator)init
{
  uint64_t v111 = *MEMORY[0x263EF8340];
  v81.receiver = self;
  v81.super_class = (Class)RSOfflineFloorPlanGenerator;
  v2 = [(RSFloorPlanGeneratorBase *)&v81 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSDoorWindowOfflineDetector);
    doorWindowDetector = v2->_doorWindowDetector;
    v2->_doorWindowDetector = v3;

    double v5 = objc_alloc_init(RSOfflineProjection2DZNode);
    projector = v2->_projector;
    v2->_projector = v5;

    v7 = [RSWallOpeningOfflineDetector alloc];
    uint64_t v8 = sub_25B400D94((id *)&v2->_projector->super.isa);
    v79 = (void *)v8;
    if (v8 && *(void *)(v8 + 64) == 1) {
      uint64_t v9 = *(__CVBuffer **)(v8 + 8);
    }
    else {
      uint64_t v9 = 0;
    }
    if (v7)
    {
      v102.receiver = v7;
      v102.super_class = (Class)RSWallOpeningOfflineDetector;
      v10 = [(RSFloorPlanGeneratorBase *)&v102 init];
      if (v10)
      {
        v11 = (void *)MEMORY[0x263F086E0];
        v78 = v10;
        uint64_t v12 = objc_opt_class();
        v80 = objc_msgSend_bundleForClass_(v11, v13, v12);
        v76 = objc_msgSend_stringByAppendingPathComponent_(@"PrecompiledModels", v14, @"lcnn_floorplan_offline_model.bundle");
        sub_25B5C99C8(v76, 0, v80);
        id v77 = (id)objc_claimAutoreleasedReturnValue();
        v75 = v9;
        sub_25B403500(&__src, "0_weight.npy");
        sub_25B403500((void *)&v104 + 1, "1_weight.npy");
        sub_25B403500(v106, "2_weight.npy");
        sub_25B403500(v107, "0_bias.npy");
        sub_25B403500(v108, "1_bias.npy");
        sub_25B403500(v109, "2_bias.npy");
        v99 = 0;
        v100 = 0;
        v101 = 0;
        __p[0] = &v99;
        LOBYTE(__p[1]) = 0;
        v99 = (char *)operator new(0x90uLL);
        v100 = v99;
        v101 = v99 + 144;
        uint64_t v15 = 0;
        v100 = sub_25B4FF578((uint64_t)&v101, &__src, &v110, v99);
        while (1)
        {
          if (SHIBYTE(v109[v15 + 2]) < 0) {
            operator delete((void *)v109[v15]);
          }
          v15 -= 3;
          if (v15 == -18)
          {
            v96 = 0;
            v97 = 0;
            unint64_t v98 = 0;
            uint64_t v17 = v99;
            if (v100 != v99)
            {
              uint64_t v18 = 0;
              unint64_t v19 = 0;
              do
              {
                v20 = &v17[v18];
                if (v17[v18 + 23] < 0) {
                  v20 = *(char **)v20;
                }
                v21 = objc_msgSend_stringWithUTF8String_(NSString, v16, (uint64_t)v20);
                v23 = objc_msgSend_stringByAppendingString_(@"lcnn_floorplan_offline_fc2_", v22, (uint64_t)v21);
                v24 = sub_25B5C99C8(v23, 0, v80);

                id v25 = v24;
                v28 = (char *)objc_msgSend_UTF8String(v25, v26, v27);
                sub_25B403500(__p, v28);
                v29 = v97;
                if ((unint64_t)v97 >= v98)
                {
                  unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * ((v97 - v96) >> 3);
                  unint64_t v32 = v31 + 1;
                  if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
                    sub_25B3FBC4C();
                  }
                  if (0x5555555555555556 * ((uint64_t)(v98 - (void)v96) >> 3) > v32) {
                    unint64_t v32 = 0x5555555555555556 * ((uint64_t)(v98 - (void)v96) >> 3);
                  }
                  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v98 - (void)v96) >> 3) >= 0x555555555555555) {
                    unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
                  }
                  else {
                    unint64_t v33 = v32;
                  }
                  v105 = &v98;
                  if (v33) {
                    unint64_t v33 = (unint64_t)sub_25B413D74(v33);
                  }
                  else {
                    uint64_t v34 = 0;
                  }
                  unint64_t v35 = v33 + 24 * v31;
                  *(void *)&long long __src = v33;
                  *((void *)&__src + 1) = v35;
                  *((void *)&v104 + 1) = v33 + 24 * v34;
                  long long v36 = *(_OWORD *)__p;
                  *(void *)(v35 + 16) = v84;
                  *(_OWORD *)unint64_t v35 = v36;
                  __p[1] = 0;
                  uint64_t v84 = 0;
                  __p[0] = 0;
                  *(void *)&long long v104 = v35 + 24;
                  sub_25B4A2F38((uint64_t *)&v96, &__src);
                  v37 = v97;
                  sub_25B4A2FBC((uint64_t)&__src);
                  v97 = v37;
                  if (SHIBYTE(v84) < 0) {
                    operator delete(__p[0]);
                  }
                }
                else
                {
                  long long v30 = *(_OWORD *)__p;
                  *((void *)v97 + 2) = v84;
                  _OWORD *v29 = v30;
                  v97 = (char *)v29 + 24;
                }

                ++v19;
                uint64_t v17 = v99;
                v18 += 24;
              }
              while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v100 - v99) >> 3));
            }
            memset(v86, 0, sizeof(v86));
            v88[0] = 0;
            v88[1] = 0;
            v87 = v88;
            uint64_t v89 = 70;
            uint64_t v90 = 0x42C800003C23D70ALL;
            long long v92 = xmmword_25B5F1280;
            long long v93 = xmmword_25B5F1290;
            int v91 = 0;
            int v94 = 1008981770;
            char v95 = 1;
            v85[0] = 1;
            long long __src = xmmword_25B5F2418;
            long long v104 = unk_25B5F2428;
            sub_25B4FF638((char *)v86, (char *)&__src, (uint64_t)&v105, 4uLL);
            sub_25B4FF734((uint64_t *)&v87);
            uint64_t v89 = 70;
            uint64_t v90 = 0x42C800003A83126FLL;
            long long v92 = xmmword_25B5F1280;
            long long v93 = xmmword_25B5F1460;
            int v91 = 0;
            int v94 = 1008981770;
            char v95 = 0;
            sub_25B44B288((uint64_t)&__src);
            sub_25B4FF7A0((uint64_t)&__src, 0);
            sub_25B44B288((uint64_t)__p);
            sub_25B50066C((uint64_t)__p, 0);
            id v38 = v77;
            v41 = (char *)objc_msgSend_UTF8String(v38, v39, v40);
            sub_25B403500(v82, v41);
            sub_25B44CD00((uint64_t)&v78->super._inputSemanticsVersion, (const void **)v82, &v96, v75, (uint64_t)v85, (uint64_t)&__src, (uint64_t)__p);
          }
        }
      }
      v7 = (RSWallOpeningOfflineDetector *)0;
    }

    wallOpeningDetector = v2->_wallOpeningDetector;
    v2->_wallOpeningDetector = v7;

    if (!v2->_wallOpeningDetector)
    {
      v73 = 0;
      goto LABEL_36;
    }
    v43 = objc_alloc_init(RSOfflineKeyframeAccumulation);
    accumulator = v2->_accumulator;
    v2->_accumulator = v43;

    v45 = objc_alloc_init(RSOfflineGeometryCalculation);
    geometryEstimator = v2->_geometryEstimator;
    v2->_geometryEstimator = v45;

    v47 = objc_alloc_init(RSCurvedWallDetection);
    curvedWallDetector = v2->_curvedWallDetector;
    v2->_curvedWallDetector = v47;

    v49 = objc_alloc_init(RSBayWindowFPRemoval);
    baywindowFPRemoval = v2->_baywindowFPRemoval;
    v2->_baywindowFPRemoval = v49;

    v51 = objc_alloc_init(RSStructurePostProcess);
    structurePostprocess = v2->_structurePostprocess;
    v2->_structurePostprocess = v51;

    v53 = objc_alloc_init(RSDeduplicateOpeningOpenDoor);
    deduplicateOpeningOpenDoor = v2->_deduplicateOpeningOpenDoor;
    v2->_deduplicateOpeningOpenDoor = v53;

    v55 = objc_alloc_init(RSOnlineOfflineAssociation);
    onlineOfflineAssociation = v2->_onlineOfflineAssociation;
    v2->_onlineOfflineAssociation = v55;

    v57 = objc_alloc_init(RSNonUniformHeightEstimation);
    heightEstimator = v2->_heightEstimator;
    v2->_heightEstimator = v57;

    v59 = objc_alloc_init(RSFloorEstimation);
    floorEstimator = v2->_floorEstimator;
    v2->_floorEstimator = v59;

    v61 = objc_alloc_init(RSRoomTypeGenerator);
    roomNodeGenerator = v2->_roomNodeGenerator;
    v2->_roomNodeGenerator = v61;

    v63 = objc_alloc_init(RSOpeningHeightAlignment);
    openingHeightAlignment = v2->_openingHeightAlignment;
    v2->_openingHeightAlignment = v63;

    v65 = objc_alloc_init(RSOutsideObjectRemoval);
    removeOutsideObject = v2->_removeOutsideObject;
    v2->_removeOutsideObject = v65;

    v67 = objc_alloc_init(RSDoorWindowPostProcessor);
    doorWindowPostProcessor = v2->_doorWindowPostProcessor;
    v2->_doorWindowPostProcessor = v67;

    v2->_wallOpeningMergeEnabled = 1;
    v2->_openingReplaceOpendoorEnabled = 0;
    v2->_opendoorReplaceOpeningEnabled = 1;
    v2->_roomTypeEnabled = 1;
    uint64_t v71 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v69, v70);
    debugInfo = v2->_debugInfo;
    v2->_debugInfo = (NSMutableDictionary *)v71;

    v2->_enableOfflineDump = 0;
  }
  v73 = v2;
LABEL_36:

  return v73;
}

- (void)generateFloorPlanWithInputPath:(id)a3 outputPath:(id)a4 debug:(BOOL)a5
{
  BOOL v5 = a5;
  id v70 = a3;
  id v71 = a4;
  NSLog(&cfstr_InputPathOutpu.isa, v70, v71, v5);
  uint64_t v9 = objc_msgSend_dictionaryWithContentsOfFile_(NSDictionary, v8, (uint64_t)v70);
  self->_enableOfflineDump = v5;
  v69 = v9;
  v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"keyframes");
  uint64_t v12 = RSKeyframeSequenceFromDictionary(v11);
  BOOL v68 = v5;

  v65 = v12;
  v13 = objc_alloc_init(RSAsset);
  id v14 = v12;
  uint64_t v15 = v13;
  v66 = self;
  v16 = sub_25B4BDAD8((uint64_t)self, v14, v15);

  v67 = v14;
  unint64_t v19 = objc_msgSend_walls(v16, v17, v18);
  uint64_t v22 = objc_msgSend_count(v19, v20, v21);
  id v25 = objc_msgSend_openings(v16, v23, v24);
  uint64_t v28 = objc_msgSend_count(v25, v26, v27);
  unint64_t v31 = objc_msgSend_windows(v16, v29, v30);
  uint64_t v34 = objc_msgSend_count(v31, v32, v33);
  v37 = objc_msgSend_doors(v16, v35, v36);
  uint64_t v40 = objc_msgSend_count(v37, v38, v39);
  v43 = objc_msgSend_opendoors(v16, v41, v42);
  uint64_t v46 = objc_msgSend_count(v43, v44, v45);
  NSLog(&cfstr_OverallWallsLu.isa, v22, v28, v34, v40, v46, v65);

  if (objc_msgSend_hasSuffix_(v71, v47, @".plist"))
  {
    objc_msgSend_writeToPlist_(v16, v48, (uint64_t)v71);
  }
  else if (objc_msgSend_hasSuffix_(v71, v48, @".json"))
  {
    objc_msgSend_writeToJson_(v16, v51, (uint64_t)v71);
  }
  else
  {
    NSLog(&cfstr_OutputFormatNo.isa, v71);
  }
  if (v68)
  {
    v52 = objc_msgSend_stringByDeletingPathExtension(v71, v49, v50);
    v54 = objc_msgSend_stringByAppendingPathExtension_(v52, v53, @"obj");
    objc_msgSend_writeToObj_(v16, v55, (uint64_t)v54);

    v57 = sub_25B4BDA48(v66, v56);
    v58 = NSString;
    v61 = objc_msgSend_stringByDeletingPathExtension(v71, v59, v60);
    v63 = objc_msgSend_stringWithFormat_(v58, v62, @"%@_debug.plist", v61);
    objc_msgSend_writeToFile_atomically_(v57, v64, (uint64_t)v63, 1);
  }
}

@end
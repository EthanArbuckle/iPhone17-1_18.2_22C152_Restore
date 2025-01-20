@interface PFParallaxLayerStackArchiver
+ (BOOL)saveCompoundLayerStack:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6;
+ (id)loadCompoundLayerStackFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)initialize;
@end

@implementation PFParallaxLayerStackArchiver

+ (id)loadCompoundLayerStackFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v187[1] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 URLByAppendingPathComponent:@"Contents.json"];
  rect.origin.x = 0.0;
  v8 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v7 options:0 error:&rect];
  id v9 = *(id *)&rect.origin.x;
  if (v8)
  {
    v187[0] = v9;
    id v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:v187];
    id v11 = v187[0];

    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v10;
        id v12 = 0;
        id v9 = v11;
        v13 = v10;
        goto LABEL_9;
      }
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v185 = *MEMORY[0x1E4F28228];
      v20 = [NSString stringWithFormat:@"Invalid JSON contents"];
      *(void *)buf = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v185 count:1];
      id v12 = [v19 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v21];
    }
    else
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v185 = *MEMORY[0x1E4F28228];
      v17 = [NSString stringWithFormat:@"Failed to deserialize JSON data: %@", v11];
      *(void *)buf = v17;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v185 count:1];
      id v12 = [v16 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v18];

      id v10 = 0;
    }
    v13 = 0;
    id v9 = v11;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    *(void *)buf = *MEMORY[0x1E4F28228];
    id v10 = [NSString stringWithFormat:@"Failed to load data: %@", v9];
    v187[0] = v10;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v187 forKeys:buf count:1];
    id v12 = [v14 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v15];

    v13 = 0;
  }
LABEL_9:

  id v22 = v12;
  if (!v13)
  {
    if (!a5)
    {
      v32 = 0;
      goto LABEL_154;
    }
    v31 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v183 = *MEMORY[0x1E4F28228];
    v23 = [NSString stringWithFormat:@"Failed to read layer stack contents: %@", v22];
    v184 = v23;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
    [v31 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v25];
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_152;
  }
  v23 = [v13 objectForKeyedSubscript:@"version"];
  if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (a5)
    {
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v181 = *MEMORY[0x1E4F28228];
      v25 = [NSString stringWithFormat:@"Invalid version info: %@", v23];
      v182 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v182 forKeys:&v181 count:1];
      id v34 = [v35 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v26];
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v24 = [v23 unsignedIntegerValue];
    if (v24 < 0xB)
    {
      v25 = [v13 objectForKeyedSubscript:@"properties"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v24 < 6)
        {
          v26 = [v25 objectForKeyedSubscript:@"layout"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v125 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v26];
            if (v125)
            {
              v127 = 0;
              goto LABEL_49;
            }
            if (a5)
            {
              v42 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v165 = *MEMORY[0x1E4F28228];
              v127 = [NSString stringWithFormat:@"Couldn't decode portraitLayout: %@", v26];
              v166 = v127;
              v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
              v39 = [v42 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v38];
              goto LABEL_45;
            }
          }
          else if (a5)
          {
            v40 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v167 = *MEMORY[0x1E4F28228];
            v127 = [NSString stringWithFormat:@"Invalid portraitLayout dictionary: %@", v26];
            v168 = v127;
            v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
            v39 = [v40 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v38];
            goto LABEL_45;
          }
        }
        else
        {
          v26 = [v25 objectForKeyedSubscript:@"portraitLayout"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v125 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v26];
            if (v125)
            {
              v27 = [v25 objectForKeyedSubscript:@"landscapeLayout"];
              if (v27)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (a5)
                  {
                    v131 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v171 = *MEMORY[0x1E4F28228];
                    v28 = [NSString stringWithFormat:@"Invalid landscapeLayout dictionary: %@", v27];
                    v172 = v28;
                    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v172 forKeys:&v171 count:1];
                    v30 = [v131 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v29];
                    goto LABEL_128;
                  }
LABEL_129:

                  v32 = 0;
                  v127 = v26;
LABEL_149:
                  v26 = (void *)v125;
                  goto LABEL_150;
                }
                v127 = +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:v27];
                if (!v127)
                {
                  if (a5)
                  {
                    v130 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v169 = *MEMORY[0x1E4F28228];
                    v28 = [NSString stringWithFormat:@"Couldn't decode landscapeLayout: %@", v27];
                    v170 = v28;
                    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
                    v30 = [v130 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v29];
LABEL_128:
                    *a5 = v30;

                    goto LABEL_129;
                  }
                  goto LABEL_129;
                }
              }
              else
              {
                v127 = 0;
              }

LABEL_49:
              v118 = [v25 objectForKeyedSubscript:@"parallaxDisabled"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a5)
                {
                  v32 = 0;
LABEL_148:

                  goto LABEL_149;
                }
                v47 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v163 = *MEMORY[0x1E4F28228];
                id v116 = [NSString stringWithFormat:@"Invalid parallax flag: %@", v118];
                id v164 = v116;
                v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
                [v47 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v112];
                v32 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_147:
                goto LABEL_148;
              }
              unsigned int v109 = [v118 BOOLValue];
              double v43 = -1.0;
              unsigned int v107 = v109 ^ 1;
              if (v24 < 2)
              {
                unsigned int v105 = v109 ^ 1;
              }
              else
              {
                id v116 = [v25 objectForKeyedSubscript:@"depthEnabled"];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a5) {
                    goto LABEL_164;
                  }
                  v89 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v161 = *MEMORY[0x1E4F28228];
                  id v113 = [NSString stringWithFormat:@"Invalid depth flag: %@", v116];
                  id v162 = v113;
                  v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
                  *a5 = [v89 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v90];

                  goto LABEL_133;
                }
                unsigned int v105 = [v116 BOOLValue];

                if (v24 >= 3)
                {
                  id v116 = [v25 objectForKeyedSubscript:@"clockAreaLuminance"];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!a5) {
                      goto LABEL_164;
                    }
                    v98 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v159 = *MEMORY[0x1E4F28228];
                    id v113 = [NSString stringWithFormat:@"Invalid clockLuminanceValue: %@", v116];
                    id v160 = v113;
                    v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
                    *a5 = [v98 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v99];

                    goto LABEL_133;
                  }
                  [v116 doubleValue];
                  double v43 = v44;

                  if (v24 >= 5)
                  {
                    id v116 = [v25 objectForKeyedSubscript:@"settlingEffectEnabled"];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      unsigned int v106 = [v116 BOOLValue];

                      if (v127) {
                        BOOL v45 = v24 > 5;
                      }
                      else {
                        BOOL v45 = 0;
                      }
                      if (!v45)
                      {
                        BOOL v104 = v127 != 0;
                        goto LABEL_67;
                      }
                      id v116 = [v25 objectForKeyedSubscript:@"depthEnabled-landscape"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        unsigned int v107 = [v116 BOOLValue];

                        BOOL v46 = 1;
LABEL_66:
                        BOOL v104 = v46;
LABEL_67:
                        id v116 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        id v113 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        long long v136 = 0u;
                        long long v137 = 0u;
                        long long v134 = 0u;
                        long long v135 = 0u;
                        obj = [v13 objectForKeyedSubscript:@"layers"];
                        uint64_t v117 = [(PFParallaxLayerStack *)obj countByEnumeratingWithState:&v134 objects:v154 count:16];
                        if (v117)
                        {
                          uint64_t v115 = *(void *)v135;
                          uint64_t v108 = *MEMORY[0x1E4F28228];
                          do
                          {
                            uint64_t v48 = 0;
                            do
                            {
                              if (*(void *)v135 != v115)
                              {
                                uint64_t v49 = v48;
                                objc_enumerationMutation(obj);
                                uint64_t v48 = v49;
                              }
                              uint64_t v124 = v48;
                              v50 = *(void **)(*((void *)&v134 + 1) + 8 * v48);
                              v126 = [v50 objectForKeyedSubscript:@"identifier"];
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                              {
                                if (a5)
                                {
                                  v91 = (void *)MEMORY[0x1E4F28C58];
                                  uint64_t v152 = v108;
                                  v120 = [NSString stringWithFormat:@"Invalid layer identifier: %@", v126];
                                  v153 = v120;
                                  CFDictionaryRef dicta = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v153 forKeys:&v152 count:1];
                                  *a5 = [v91 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:dicta];

                                  goto LABEL_143;
                                }
LABEL_144:
                                v32 = 0;
                                goto LABEL_145;
                              }
                              if (LayerIDMatchesOptions(v126, a4))
                              {
                                v120 = [v50 objectForKeyedSubscript:@"filename"];
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (a5)
                                  {
                                    v92 = (void *)MEMORY[0x1E4F28C58];
                                    uint64_t v150 = v108;
                                    CFDictionaryRef dictb = [NSString stringWithFormat:@"Invalid filename: %@", v120];
                                    CFDictionaryRef v151 = dictb;
                                    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v151 forKeys:&v150 count:1];
                                    *a5 = [v92 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v93];
                                  }
                                  goto LABEL_143;
                                }
                                CFDictionaryRef dict = [v50 objectForKeyedSubscript:@"frame"];
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (a5)
                                  {
                                    v94 = (void *)MEMORY[0x1E4F28C58];
                                    uint64_t v148 = v108;
                                    v95 = [NSString stringWithFormat:@"Invalid frame info: %@", dict];
                                    v149 = v95;
                                    v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
                                    *a5 = [v94 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v96];
                                  }
LABEL_143:

                                  goto LABEL_144;
                                }
                                v119 = [v50 objectForKeyedSubscript:@"zPosition"];
                                objc_opt_class();
                                if (objc_opt_isKindOfClass())
                                {
                                  CGSize v51 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
                                  rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
                                  rect.size = v51;
                                  if (CGRectMakeWithDictionaryRepresentation(dict, &rect))
                                  {
                                    v111 = [v6 URLByAppendingPathComponent:v120];
                                    v52 = [v111 pathExtension];
                                    int v53 = [v52 isEqualToString:@"HEIC"];

                                    if (v53)
                                    {
                                      v187[0] = 0;
                                      v54 = (id)s_log;
                                      v55 = v54;
                                      os_signpost_id_t v56 = s_signpost;
                                      if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL
                                        && os_signpost_enabled(v54))
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_signpost_emit_with_name_impl(&dword_1A41FE000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PFParallaxLayer.read", (const char *)&unk_1A42E5DAB, buf, 2u);
                                      }

                                      id v132 = v22;
                                      BOOL v57 = ReadImageFromURL((uint64_t)v187, v111, (a4 >> 16) & 1, &v132);
                                      id v58 = v132;

                                      v59 = (id)s_log;
                                      v60 = v59;
                                      os_signpost_id_t v61 = s_signpost;
                                      if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL
                                        && os_signpost_enabled(v59))
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_signpost_emit_with_name_impl(&dword_1A41FE000, v60, OS_SIGNPOST_INTERVAL_END, v61, "PFParallaxLayer.read", (const char *)&unk_1A42E5DAB, buf, 2u);
                                      }

                                      if (v57)
                                      {
                                        v62 = [PFParallaxImageLayer alloc];
                                        id v63 = v187[0];
                                        [v119 doubleValue];
                                        v110 = -[PFParallaxImageLayer initWithImage:frame:zPosition:identifier:](v62, "initWithImage:frame:zPosition:identifier:", v63, v126, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v64);
                                        CVPixelBufferRelease((CVPixelBufferRef)v187[0]);
                                        goto LABEL_94;
                                      }
                                      if (a5)
                                      {
                                        v80 = (void *)MEMORY[0x1E4F28C58];
                                        uint64_t v142 = v108;
                                        v81 = [NSString stringWithFormat:@"Couldn't decode layer image: %@", v58];
                                        v143 = v81;
                                        v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
                                        *a5 = [v80 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v82];
                                      }
                                      v110 = 0;
LABEL_104:
                                      int v69 = 1;
                                      goto LABEL_107;
                                    }
                                    v70 = [v111 pathExtension];
                                    int v71 = [v70 isEqualToString:@"MOV"];

                                    if (v71)
                                    {
                                      v72 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v111];
                                      v73 = [PFParallaxVideoLayer alloc];
                                      [v119 doubleValue];
                                      v110 = -[PFParallaxVideoLayer initWithVideoData:frame:zPosition:identifier:](v73, "initWithVideoData:frame:zPosition:identifier:", v72, v126, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v74);

                                      id v58 = v22;
LABEL_94:
                                      if (v24 < 6)
                                      {
                                        [v116 addObject:v110];
                                      }
                                      else
                                      {
                                        v75 = [v111 lastPathComponent];
                                        int v76 = [v75 hasPrefix:@"landscape-"];

                                        if (v76) {
                                          goto LABEL_96;
                                        }
                                        v83 = [v111 lastPathComponent];
                                        int v84 = [v83 hasPrefix:@"portrait-"];

                                        if (!v84)
                                        {
                                          if (a5)
                                          {
                                            v85 = (void *)MEMORY[0x1E4F28C58];
                                            uint64_t v138 = v108;
                                            v86 = [NSString stringWithFormat:@"Invalid content file prefix: %@", v120];
                                            v139 = v86;
                                            v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
                                            *a5 = [v85 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v87];
                                          }
                                          goto LABEL_104;
                                        }
                                        [v116 addObject:v110];
                                        if (v24 > 6)
                                        {
                                          if ([(PFParallaxLayer *)v110 isBackfill]) {
                                            [v113 addObject:v110];
                                          }
                                          if (v24 >= 8 && [(PFParallaxLayer *)v110 isSettlingEffect]) {
LABEL_96:
                                          }
                                            [v113 addObject:v110];
                                        }
                                      }
                                      int v69 = 0;
LABEL_107:

                                      id v22 = v58;
LABEL_108:

                                      if (v69) {
                                        goto LABEL_144;
                                      }
                                      goto LABEL_109;
                                    }
                                    if (a5)
                                    {
                                      v77 = (void *)MEMORY[0x1E4F28C58];
                                      uint64_t v140 = v108;
                                      v78 = [NSString stringWithFormat:@"Invalid content file extension: %@", v120];
                                      v141 = v78;
                                      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
                                      *a5 = [v77 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v79];
                                    }
                                    v110 = 0;
LABEL_100:
                                    int v69 = 1;
                                    id v58 = v22;
                                    goto LABEL_107;
                                  }
                                  if (a5)
                                  {
                                    v68 = (void *)MEMORY[0x1E4F28C58];
                                    uint64_t v144 = v108;
                                    v111 = [NSString stringWithFormat:@"Invalid layer frame: %@", dict];
                                    v145 = v111;
                                    v110 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
                                    *a5 = [v68 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v110];
                                    goto LABEL_100;
                                  }
                                }
                                else if (a5)
                                {
                                  v65 = (void *)MEMORY[0x1E4F28C58];
                                  uint64_t v146 = v108;
                                  v66 = [NSString stringWithFormat:@"Invalid zPosition value: %@", v119];
                                  v147 = v66;
                                  v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
                                  *a5 = [v65 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v67];
                                }
                                int v69 = 1;
                                goto LABEL_108;
                              }
LABEL_109:

                              uint64_t v48 = v124 + 1;
                            }
                            while (v117 != v124 + 1);
                            uint64_t v88 = [(PFParallaxLayerStack *)obj countByEnumeratingWithState:&v134 objects:v154 count:16];
                            uint64_t v117 = v88;
                          }
                          while (v88);
                        }

                        obj = [[PFParallaxLayerStack alloc] initWithLayers:v116 layout:v125 depthEnabled:v105 parallaxDisabled:v109 clockAreaLuminance:v106 settlingEffectEnabled:v43];
                        if (v24 != 9) {
                          [(PFParallaxLayerStack *)obj markMayContainBakedHeadroom];
                        }
                        if (v104)
                        {
                          v126 = [[PFParallaxLayerStack alloc] initWithLayers:v113 layout:v127 depthEnabled:v107 parallaxDisabled:v109 clockAreaLuminance:v106 settlingEffectEnabled:v43];
                          if (v24 != 9) {
                            [(PFParallaxLayerStack *)v126 markMayContainBakedHeadroom];
                          }
                        }
                        else
                        {
                          v126 = 0;
                        }
                        v32 = [[PFWallpaperCompoundLayerStack alloc] initWithPortraitLayerStack:obj landscapeLayerStack:v126];
LABEL_145:

                        goto LABEL_146;
                      }
                      if (a5)
                      {
                        v102 = (void *)MEMORY[0x1E4F28C58];
                        uint64_t v155 = *MEMORY[0x1E4F28228];
                        id v113 = [NSString stringWithFormat:@"Invalid depth flag: %@", v116];
                        id v156 = v113;
                        v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
                        *a5 = [v102 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v103];

                        goto LABEL_133;
                      }
LABEL_164:
                      v32 = 0;
                      goto LABEL_147;
                    }
                    if (!a5) {
                      goto LABEL_164;
                    }
                    v100 = (void *)MEMORY[0x1E4F28C58];
                    uint64_t v157 = *MEMORY[0x1E4F28228];
                    id v113 = [NSString stringWithFormat:@"Invalid settlingEffect flag: %@", v116];
                    id v158 = v113;
                    v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
                    *a5 = [v100 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v101];

LABEL_133:
                    v32 = 0;
LABEL_146:

                    goto LABEL_147;
                  }
                }
              }
              unsigned int v106 = 0;
              BOOL v46 = v127 != 0;
              goto LABEL_66;
            }
            if (a5)
            {
              v41 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v173 = *MEMORY[0x1E4F28228];
              v127 = [NSString stringWithFormat:@"Couldn't decode portraitLayout: %@", v26];
              v174 = v127;
              v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v174 forKeys:&v173 count:1];
              v39 = [v41 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v38];
              goto LABEL_45;
            }
            goto LABEL_46;
          }
          if (a5)
          {
            v37 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v175 = *MEMORY[0x1E4F28228];
            v127 = [NSString stringWithFormat:@"Invalid portraitLayout dictionary: %@", v26];
            v176 = v127;
            v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
            v39 = [v37 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v38];
LABEL_45:
            *a5 = v39;

            v32 = 0;
LABEL_150:

            goto LABEL_151;
          }
        }
LABEL_46:
        v32 = 0;
        goto LABEL_151;
      }
      if (!a5)
      {
        v32 = 0;
LABEL_152:

        goto LABEL_153;
      }
      v36 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v177 = *MEMORY[0x1E4F28228];
      v26 = [NSString stringWithFormat:@"Invalid properties dictionary: %@", v25];
      v178 = v26;
      v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
      [v36 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v128];
      v32 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_151:
      goto LABEL_152;
    }
    if (a5)
    {
      v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v179 = *MEMORY[0x1E4F28228];
      v25 = [NSString stringWithFormat:@"Unsupported layer stack version: %@", v23];
      v180 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];
      id v34 = [v33 errorWithDomain:@"com.apple.PhotosFormats" code:7 userInfo:v26];
LABEL_28:
      v32 = 0;
      *a5 = v34;
      goto LABEL_151;
    }
  }
  v32 = 0;
LABEL_153:

LABEL_154:

  return v32;
}

+ (BOOL)saveCompoundLayerStack:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  v123[1] = *MEMORY[0x1E4F143B8];
  id v79 = a3;
  id v83 = a4;
  v78 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v105 = 0;
  char v8 = [v78 createDirectoryAtURL:v83 withIntermediateDirectories:0 attributes:0 error:&v105];
  id v9 = v105;
  if (v8)
  {
    id v10 = [v79 portraitLayerStack];
    id v11 = [v10 layers];
    uint64_t v100 = MEMORY[0x1E4F143A8];
    uint64_t v101 = 3221225472;
    v102 = __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke;
    v103 = &__block_descriptor_40_e25_B16__0__PFParallaxLayer_8l;
    unint64_t v104 = a5;
    id v12 = PFFilter();

    v13 = [v79 landscapeLayerStack];
    v14 = [v13 layers];
    uint64_t v95 = MEMORY[0x1E4F143A8];
    uint64_t v96 = 3221225472;
    v97 = __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke_2;
    v98 = &__block_descriptor_40_e25_B16__0__PFParallaxLayer_8l;
    unint64_t v99 = a5;
    v77 = PFFilter();

    v80 = [v12 arrayByAddingObjectsFromArray:v77];
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v80, "count"));
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id obj = v12;
    uint64_t v16 = [obj countByEnumeratingWithState:&v91 objects:v121 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v92;
LABEL_4:
      uint64_t v18 = 0;
      v19 = v9;
      while (1)
      {
        if (*(void *)v92 != v17) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v91 + 1) + 8 * v18);
        v21 = [v20 makeUniqueFileNameWithFileNames:v15 orientation:1];
        id v22 = [v83 URLByAppendingPathComponent:v21];
        id v90 = v19;
        LOBYTE(v20) = [v20 saveToURL:v22 error:&v90];
        id v9 = v90;

        if ((v20 & 1) == 0) {
          break;
        }
        [v15 addObject:v21];

        ++v18;
        v19 = v9;
        if (v16 == v18)
        {
          uint64_t v16 = [obj countByEnumeratingWithState:&v91 objects:v121 count:16];
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      if (a6)
      {
        os_signpost_id_t v56 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v119 = *MEMORY[0x1E4F28228];
        v75 = [NSString stringWithFormat:@"Failed to write layer contents: %@", v9];
        v120 = v75;
        int v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
        [v56 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v53];
        BOOL v54 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        id v81 = obj;
        goto LABEL_42;
      }
      BOOL v54 = 0;
      id v81 = obj;
      goto LABEL_43;
    }
LABEL_10:

    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v81 = v77;
    uint64_t v23 = [v81 countByEnumeratingWithState:&v86 objects:v118 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v87;
LABEL_12:
      uint64_t v25 = 0;
      v26 = v9;
      while (1)
      {
        if (*(void *)v87 != v24) {
          objc_enumerationMutation(v81);
        }
        v27 = *(void **)(*((void *)&v86 + 1) + 8 * v25);
        v21 = [v27 makeUniqueFileNameWithFileNames:v15 orientation:2];
        id v22 = [v83 URLByAppendingPathComponent:v21];
        id v85 = v26;
        LOBYTE(v27) = [v27 saveToURL:v22 error:&v85];
        id v9 = v85;

        if ((v27 & 1) == 0) {
          break;
        }
        [v15 addObject:v21];

        ++v25;
        v26 = v9;
        if (v23 == v25)
        {
          uint64_t v23 = [v81 countByEnumeratingWithState:&v86 objects:v118 count:16];
          if (v23) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
      if (a6)
      {
        BOOL v57 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v116 = *MEMORY[0x1E4F28228];
        v75 = [NSString stringWithFormat:@"Failed to write layer contents: %@", v9];
        uint64_t v117 = v75;
        int v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
        [v57 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v53];
        BOOL v54 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      }
      BOOL v54 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v80, "count"));
    id v81 = (id)objc_claimAutoreleasedReturnValue();
    if ([v80 count])
    {
      unint64_t v28 = 0;
      do
      {
        v29 = [v80 objectAtIndexedSubscript:v28];
        v30 = [v15 objectAtIndexedSubscript:v28];
        v115[0] = v30;
        v114[0] = @"filename";
        v114[1] = @"frame";
        [v29 frame];
        CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v124);
        v115[1] = DictionaryRepresentation;
        v114[2] = @"zPosition";
        v32 = NSNumber;
        [v29 zPosition];
        v33 = objc_msgSend(v32, "numberWithDouble:");
        v115[2] = v33;
        v114[3] = @"identifier";
        id v34 = [v29 identifier];
        v115[3] = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:4];
        [v81 addObject:v35];

        ++v28;
      }
      while (v28 < [v80 count]);
    }
    id v36 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v112[0] = @"portraitLayout";
    double v74 = [v79 portraitLayerStack];
    v72 = [v74 layout];
    int v71 = [v72 dictionaryRepresentation];
    v113[0] = v71;
    v112[1] = @"depthEnabled";
    v37 = NSNumber;
    v70 = [v79 portraitLayerStack];
    int v69 = objc_msgSend(v37, "numberWithBool:", objc_msgSend(v70, "depthEnabled"));
    v113[1] = v69;
    v112[2] = @"settlingEffectEnabled";
    v38 = NSNumber;
    v68 = [v79 portraitLayerStack];
    v67 = objc_msgSend(v38, "numberWithBool:", objc_msgSend(v68, "settlingEffectEnabled"));
    v113[2] = v67;
    v112[3] = @"parallaxDisabled";
    v39 = NSNumber;
    uint64_t v40 = [v79 portraitLayerStack];
    v41 = objc_msgSend(v39, "numberWithBool:", objc_msgSend((id)v40, "parallaxDisabled"));
    v113[3] = v41;
    v112[4] = @"clockAreaLuminance";
    v42 = NSNumber;
    double v43 = [v79 portraitLayerStack];
    [v43 clockAreaLuminance];
    double v44 = objc_msgSend(v42, "numberWithDouble:");
    v113[4] = v44;
    BOOL v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:5];
    v21 = (void *)[v36 initWithDictionary:v45];

    BOOL v46 = [v79 landscapeLayerStack];
    LOBYTE(v40) = v46 == 0;

    if ((v40 & 1) == 0)
    {
      v47 = [v79 landscapeLayerStack];
      uint64_t v48 = [v47 layout];
      uint64_t v49 = [v48 dictionaryRepresentation];
      [v21 setObject:v49 forKeyedSubscript:@"landscapeLayout"];

      v50 = NSNumber;
      CGSize v51 = [v79 landscapeLayerStack];
      v52 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "depthEnabled"));
      [v21 setObject:v52 forKeyedSubscript:@"depthEnabled-landscape"];
    }
    v110[0] = @"version";
    v110[1] = @"layers";
    v111[0] = &unk_1EF7CA4D8;
    v111[1] = v81;
    v110[2] = @"properties";
    v111[2] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:3];
    v75 = [v83 URLByAppendingPathComponent:@"Contents.json"];
    id v84 = v9;
    int v53 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v22 options:1 error:&v84];
    id v73 = v84;

    if (v53)
    {
      if ([v53 writeToURL:v75 atomically:1])
      {
        BOOL v54 = 1;
        goto LABEL_41;
      }
      if (a6)
      {
        os_signpost_id_t v61 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v106 = *MEMORY[0x1E4F28228];
        v62 = NSString;
        id v63 = [v75 path];
        double v64 = [v62 stringWithFormat:@"Failed to write layer stack contents to file: %@", v63];
        unsigned int v107 = v64;
        v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        *a6 = [v61 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v65];
      }
    }
    else
    {
      if (a6)
      {
        id v58 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v108 = *MEMORY[0x1E4F28228];
        v59 = [NSString stringWithFormat:@"Failed to serialize layer stack contents: %@", v73];
        unsigned int v109 = v59;
        v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        *a6 = [v58 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v60];
      }
      int v53 = 0;
    }
    BOOL v54 = 0;
LABEL_41:
    id v9 = v73;
LABEL_42:

    goto LABEL_43;
  }
  if (a6)
  {
    v55 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v122 = *MEMORY[0x1E4F28228];
    id obj = [NSString stringWithFormat:@"Failed to create layer stack directory: %@", v9];
    v123[0] = obj;
    v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:&v122 count:1];
    [v55 errorWithDomain:@"com.apple.PhotosFormats" code:8 userInfo:v77];
    BOOL v54 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  BOOL v54 = 0;
LABEL_45:

  return v54;
}

uint64_t __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  uint64_t v4 = LayerIDMatchesOptions(v3, *(void *)(a1 + 32));

  return v4;
}

uint64_t __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void *)(a1 + 32) & 0xFFFFFFFFFFFFFFBDLL;
  v3 = [a2 identifier];
  uint64_t v4 = LayerIDMatchesOptions(v3, v2);

  return v4;
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__PFParallaxLayerStackArchiver_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

os_signpost_id_t __42__PFParallaxLayerStackArchiver_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.photos.PhotosFormats", "layerStackArchiver");
  v3 = (void *)s_log;
  s_log = (uint64_t)v2;

  os_signpost_id_t result = os_signpost_id_make_with_pointer((os_log_t)s_log, *(const void **)(a1 + 32));
  s_signpost = result;
  return result;
}

@end
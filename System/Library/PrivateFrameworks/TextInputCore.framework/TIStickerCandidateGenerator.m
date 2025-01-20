@interface TIStickerCandidateGenerator
+ (TIStickerCandidateGenerator)sharedInstance;
- (CAContext)context;
- (CGImage)_scaledImageForStickerImage:(CGImage *)a3 cellHeight:(double)a4;
- (CGImage)getRetainedCachedStickerImageForIdentifier:(id)a3;
- (OS_dispatch_queue)backgroundOperationQueue;
- (TIStickerCandidateGenerator)init;
- (id)_ckAttributionInfoFromSticker:(id)a3;
- (id)_generateKeyboardCandidatesForStickers:(id)a3 withQuery:(id)a4 withRenderTraits:(id)a5;
- (id)generateStickerQueriesForText:(id)a3 tokenize:(BOOL)a4;
- (id)generateStickerQueriesForText:(id)a3 tokenize:(BOOL)a4 generativeEmojiSearchQueries:(BOOL)a5;
- (id)keyboardStickerWithIdentifier:(id)a3 roles:(id)a4;
- (id)stickersForStickerIdentifiers:(id)a3 roles:(id)a4;
- (void)_generateStickerCandidatesForGenerativeEmojiSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7;
- (void)_purgeStickerImageCache;
- (void)cacheStickerImage:(CGImage *)a3 forIdentifier:(id)a4;
- (void)clearCache;
- (void)createContext;
- (void)generateStickerCandidatesForSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7;
- (void)generateStickerCandidatesForTaxonomySearchableQueries:(id)a3 generativeEmojiSearchableQueries:(id)a4 withRenderTraits:(id)a5 shouldAppend:(BOOL)a6 language:(id)a7 completionHandler:(id)a8;
- (void)setBackgroundOperationQueue:(id)a3;
@end

@implementation TIStickerCandidateGenerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundOperationQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_stickerToThumbnailLock, 0);
  objc_storeStrong((id *)&self->_stickerToThumbnail, 0);
  objc_storeStrong((id *)&self->_negativeQueryStrings, 0);
  objc_storeStrong((id *)&self->_queryToUUID, 0);

  objc_storeStrong((id *)&self->_sceneTaxonomyGenerator, 0);
}

- (void)setBackgroundOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)backgroundOperationQueue
{
  return self->_backgroundOperationQueue;
}

- (CAContext)context
{
  return self->_context;
}

- (id)_generateKeyboardCandidatesForStickers:(id)a3 withQuery:(id)a4 withRenderTraits:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v49 = a4;
  id v46 = a5;
  id v48 = [MEMORY[0x1E4F1CA48] array];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v50 = *(void *)v56;
    v11 = (void *)MEMORY[0x1E4F14428];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        v14 = TIStickerCandidateGeneratorOSLogFacility();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v37 = NSString;
          v38 = [v13 identifier];
          v39 = [v37 stringWithFormat:@"%s Setting up candidate for sticker %@.", "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]", v38];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v39;
          _os_log_debug_impl(&dword_1E3F0E000, v14, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
        v15 = [v13 representations];
        v16 = [v15 firstObject];

        if (v16)
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v62 = 0x2020000000;
          v63 = 0;
          v17 = [v16 identifier];
          v18 = [(TIStickerCandidateGenerator *)self getRetainedCachedStickerImageForIdentifier:v17];

          v63 = v18;
          if (!*(void *)(*((void *)&buf + 1) + 24))
          {
            CFDataRef v19 = [v16 data];
            v20 = CGImageSourceCreateWithData(v19, 0);

            ImageAtIndex = CGImageSourceCreateImageAtIndex(v20, 0, 0);
            if (v20) {
              CFRelease(v20);
            }
            if (ImageAtIndex)
            {
              [v46 singleCellHeight];
              double v23 = v22;
              [v46 screenScale];
              v25 = [(TIStickerCandidateGenerator *)self _scaledImageForStickerImage:ImageAtIndex cellHeight:fmax(v23 * v24, 1.0)];
              *(void *)(*((void *)&buf + 1) + 24) = v25;
              v26 = [v16 identifier];
              [(TIStickerCandidateGenerator *)self cacheStickerImage:v25 forIdentifier:v26];

              CGImageRelease(ImageAtIndex);
            }
          }
          uint64_t v51 = 0;
          v52 = &v51;
          uint64_t v53 = 0x2020000000;
          int v54 = 0;
          TIDispatchSync();
          if (!*((_DWORD *)v52 + 6))
          {
            TIDispatchSync();

            if (!*((_DWORD *)v52 + 6))
            {
              CGImageRelease(*(CGImageRef *)(*((void *)&buf + 1) + 24));
              v43 = TIStickerCandidateGeneratorOSLogFacility();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v45 = objc_msgSend(NSString, "stringWithFormat:", @"%s SlotID is still 0 after recreating remote context", "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]");
                *(_DWORD *)v59 = 138412290;
                v60 = v45;
                _os_log_error_impl(&dword_1E3F0E000, v43, OS_LOG_TYPE_ERROR, "%@", v59, 0xCu);
              }
              _Block_object_dispose(&v51, 8);
              _Block_object_dispose(&buf, 8);

              goto LABEL_25;
            }
          }
          TIDispatchSync();

          v27 = +[TIKeyboardSecureTouchManager sharedInstance];
          [v27 registerSlotID:*((unsigned int *)v52 + 6)];

          CGImageRelease(*(CGImageRef *)(*((void *)&buf + 1) + 24));
          v28 = (void *)MEMORY[0x1E4FAE318];
          uint64_t v29 = *((unsigned int *)v52 + 6);
          v30 = [v13 identifier];
          v31 = [v28 secureCandidateWithCandidate:&stru_1F3F7A998 forInput:v49 slotID:v29 customInfoType:4096 stickerIdentifier:v30];

          v32 = +[TIAppAutofillManager sharedInstance];
          v33 = [v32 secureCandidateRenderer];
          v34 = [v13 identifier];
          id v35 = (id)[v33 updateCachedCandidate:v31 withStickerIdentifier:v34];

          [v48 addObject:v31];
          v36 = TIStickerCandidateGeneratorOSLogFacility();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            v40 = NSString;
            v41 = [v13 identifier];
            v42 = [v40 stringWithFormat:@"%s Submitting sticker %@.", "-[TIStickerCandidateGenerator _generateKeyboardCandidatesForStickers:withQuery:withRenderTraits:]", v41];
            *(_DWORD *)v59 = 138412290;
            v60 = v42;
            _os_log_debug_impl(&dword_1E3F0E000, v36, OS_LOG_TYPE_DEBUG, "%@", v59, 0xCu);
          }
          _Block_object_dispose(&v51, 8);
          _Block_object_dispose(&buf, 8);
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return v48;
}

void __97__TIStickerCandidateGenerator__generateKeyboardCandidatesForStickers_withQuery_withRenderTraits___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 createSlot];
}

void __97__TIStickerCandidateGenerator__generateKeyboardCandidatesForStickers_withQuery_withRenderTraits___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) createContext];
  id v2 = [*(id *)(a1 + 32) context];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 createSlot];
}

void __97__TIStickerCandidateGenerator__generateKeyboardCandidatesForStickers_withQuery_withRenderTraits___block_invoke_144(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) context];
  [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) forSlot:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (CGImage)_scaledImageForStickerImage:(CGImage *)a3 cellHeight:(double)a4
{
  double Width = (double)CGImageGetWidth(a3);
  CGFloat v7 = ceil(a4 * 0.5);
  CGFloat v8 = ceil(v7 / (double)CGImageGetHeight(a3) * Width);
  ColorSpace = CGImageGetColorSpace(a3);
  uint64_t v10 = CGBitmapContextCreate(0, (unint64_t)a4, (unint64_t)a4, 8uLL, 0, ColorSpace, 2u);
  CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
  v13.origin.x = floor((a4 - v8) * 0.5);
  v13.origin.y = floor((a4 - v7) * 0.5);
  v13.size.width = v8;
  v13.size.height = v7;
  CGContextDrawImage(v10, v13, a3);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

- (id)stickersForStickerIdentifiers:(id)a3 roles:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4FA8068];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  id v15 = 0;
  uint64_t v9 = [v8 stickersWithIdentifiers:v7 roles:v6 error:&v15];

  id v10 = v15;
  if (v10)
  {
    v11 = TIStickerCandidateGeneratorOSLogFacility();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v14 = [NSString stringWithFormat:@"%s Error returned from Stickers %@.", "-[TIStickerCandidateGenerator stickersForStickerIdentifiers:roles:]", v10];
      *(_DWORD *)long long buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_1E3F0E000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v12 = 0;
  }
  else
  {
    id v12 = v9;
  }

  return v12;
}

- (id)_ckAttributionInfoFromSticker:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    v4 = [v3 attributionInfo];
    v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
    id v6 = [v4 adamID];
    [v5 setObject:v6 forKeyedSubscript:@"adam-id"];

    id v7 = [v4 bundleIdentifier];
    [v5 setObject:v7 forKeyedSubscript:@"bundle-id"];

    id v8 = [v4 name];
    [v5 setObject:v8 forKeyedSubscript:@"name"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)keyboardStickerWithIdentifier:(id)a3 roles:(id)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v75[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
  uint64_t v9 = [(TIStickerCandidateGenerator *)self stickersForStickerIdentifiers:v8 roles:v7];

  if ([v9 count])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FA8068]);
    id v71 = 0;
    [v10 touchStickerWithIdentifier:v6 error:&v71];
    id v11 = v71;
    if (v11)
    {
      id v12 = TIStickerCandidateGeneratorOSLogFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v55 = [NSString stringWithFormat:@"%s Error returned from touching sticker with identifier %@: %@.", "-[TIStickerCandidateGenerator keyboardStickerWithIdentifier:roles:]", v6, v11];
        *(_DWORD *)long long buf = 138412290;
        v74 = v55;
        _os_log_error_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      CGRect v13 = 0;
    }
    else
    {
      long long v57 = self;
      id v58 = v10;
      v59 = v9;
      id v61 = v7;
      id v62 = v6;
      v14 = [v9 firstObject];
      v66 = [MEMORY[0x1E4F1CA48] array];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      v63 = v14;
      id obj = [v14 representations];
      uint64_t v15 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v68 != v17) {
              objc_enumerationMutation(obj);
            }
            CFDataRef v19 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            id v20 = objc_alloc(MEMORY[0x1E4FAE420]);
            v21 = [v19 data];
            double v22 = [v19 uti];
            double v23 = [v19 role];
            [v19 size];
            double v25 = v24;
            double v27 = v26;
            id v28 = [v19 effect];
            uint64_t v29 = [v28 description];
            char v30 = [v29 isEqualToString:@".none"];

            if (v30)
            {
              uint64_t v31 = 0;
            }
            else
            {
              v32 = [v28 description];
              char v33 = [v32 isEqualToString:@".stroke"];

              if (v33)
              {
                uint64_t v31 = 1;
              }
              else
              {
                v34 = [v28 description];
                char v35 = [v34 isEqualToString:@".comic"];

                if (v35)
                {
                  uint64_t v31 = 2;
                }
                else
                {
                  v36 = [v28 description];
                  char v37 = [v36 isEqualToString:@".puffy"];

                  if (v37)
                  {
                    uint64_t v31 = 3;
                  }
                  else
                  {
                    v38 = [v28 description];
                    int v39 = [v38 isEqualToString:@".iridescent"];

                    if (v39) {
                      uint64_t v31 = 4;
                    }
                    else {
                      uint64_t v31 = 0;
                    }
                  }
                }
              }
            }

            v40 = objc_msgSend(v20, "initWithData:uti:role:size:effect:", v21, v22, v23, v31, v25, v27);
            [v66 addObject:v40];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
        }
        while (v16);
      }

      if (objc_opt_respondsToSelector()) {
        uint64_t obja = [v63 performSelector:sel_effectType];
      }
      else {
        uint64_t obja = -1;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v41 = [v63 metadata];
      }
      else
      {
        uint64_t v41 = 0;
      }
      uint64_t v9 = v59;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v42 = [v63 searchText];
      }
      else
      {
        uint64_t v42 = 0;
      }
      if (objc_opt_respondsToSelector())
      {
        [v63 accessibilityName];
      }
      uint64_t v43 = [(TIStickerCandidateGenerator *)v57 _ckAttributionInfoFromSticker:v63];
      v44 = (void *)v43;
      v45 = (void *)MEMORY[0x1E4F1CC08];
      if (v43) {
        v45 = (void *)v43;
      }
      id v46 = v45;

      id v47 = objc_alloc(MEMORY[0x1E4FAE418]);
      id v48 = [v63 identifier];
      id v49 = [v63 name];
      uint64_t v50 = [v63 externalURI];
      uint64_t v51 = [v63 accessibilityName];
      v52 = [v63 accessibilityName];
      uint64_t v56 = v42;
      v60 = (void *)v42;
      uint64_t v53 = (void *)v41;
      CGRect v13 = (void *)[v47 initWithIdentifier:v48 representations:v66 effectType:obja name:v49 externalURI:v50 accessibilityLabel:v51 metadata:v41 attributionInfo:v46 searchText:v56 accessibilityName:v52];

      id v12 = v63;
      id v7 = v61;
      id v6 = v62;
      id v11 = 0;
      id v10 = v58;
    }
  }
  else
  {
    CGRect v13 = 0;
  }

  return v13;
}

- (id)generateStickerQueriesForText:(id)a3 tokenize:(BOOL)a4 generativeEmojiSearchQueries:(BOOL)a5
{
  return [(TISceneTaxonomyGenerator *)self->_sceneTaxonomyGenerator generateSearchableQueriesForText:a3 tokenize:a4 generativeEmojiSearchQueries:a5];
}

- (id)generateStickerQueriesForText:(id)a3 tokenize:(BOOL)a4
{
  return [(TIStickerCandidateGenerator *)self generateStickerQueriesForText:a3 tokenize:a4 generativeEmojiSearchQueries:0];
}

- (void)createContext
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1CFD0];
  uint64_t v4 = *MEMORY[0x1E4F39E68];
  v10[0] = *MEMORY[0x1E4F39E80];
  v10[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1CFC8];
  v11[0] = v3;
  v11[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4F39E78];
  v10[2] = *MEMORY[0x1E4F39E70];
  v10[3] = v6;
  v11[2] = v3;
  v11[3] = v3;
  v10[4] = *MEMORY[0x1E4F39E50];
  v11[4] = v3;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
  id v8 = [MEMORY[0x1E4F39B58] remoteContextWithOptions:v7];
  context = self->_context;
  self->_context = v8;
}

- (CGImage)getRetainedCachedStickerImageForIdentifier:(id)a3
{
  stickerToThumbnailLock = self->_stickerToThumbnailLock;
  id v5 = a3;
  [(NSLock *)stickerToThumbnailLock lock];
  uint64_t v6 = (CGImage *)[(NSMutableDictionary *)self->_stickerToThumbnail objectForKey:v5];

  if (v6) {
    CGImageRetain(v6);
  }
  [(NSLock *)self->_stickerToThumbnailLock unlock];
  return v6;
}

- (void)cacheStickerImage:(CGImage *)a3 forIdentifier:(id)a4
{
  stickerToThumbnailLock = self->_stickerToThumbnailLock;
  id v7 = a4;
  [(NSLock *)stickerToThumbnailLock lock];
  [(NSMutableDictionary *)self->_stickerToThumbnail setObject:a3 forKey:v7];

  id v8 = self->_stickerToThumbnailLock;

  [(NSLock *)v8 unlock];
}

- (void)_purgeStickerImageCache
{
  [(NSLock *)self->_stickerToThumbnailLock lock];
  [(NSMutableDictionary *)self->_stickerToThumbnail removeAllObjects];
  stickerToThumbnailLock = self->_stickerToThumbnailLock;

  [(NSLock *)stickerToThumbnailLock unlock];
}

- (void)clearCache
{
  [(NSCache *)self->_queryToUUID removeAllObjects];
  [(NSCache *)self->_negativeQueryStrings removeAllObjects];
  [(TIStickerCandidateGenerator *)self _purgeStickerImageCache];
  uint64_t v3 = +[TIKeyboardSecureTouchManager sharedInstance];
  [v3 clearRegistrations];

  context = self->_context;
  self->_context = 0;
}

- (void)_generateStickerCandidatesForGenerativeEmojiSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6E2C8C8;
  aBlock[4] = self;
  BOOL v96 = a5;
  id v48 = v12;
  id v94 = v48;
  id v15 = v14;
  id v95 = v15;
  id v16 = a3;
  uint64_t v51 = (void (**)(void *, void *, void))_Block_copy(aBlock);
  uint64_t v17 = [v16 reverseObjectEnumerator];

  uint64_t v18 = [v17 allObjects];

  id v47 = [MEMORY[0x1E4F23870] emptySuggestion];
  CFDataRef v19 = objc_msgSend(MEMORY[0x1E4F23898], "userQueryContextWithCurrentSuggestion:");
  id v49 = v13;
  [v19 setKeyboardLanguage:v13];
  [v19 setBundleIDs:&unk_1F3FA7820];
  [v19 setFetchAttributes:&unk_1F3FA7838];
  [v19 setMaxSuggestionCount:50];
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__13435;
  v91 = __Block_byref_object_dispose__13436;
  id v92 = 0;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__13435;
  v85 = __Block_byref_object_dispose__13436;
  id v86 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__13435;
  v79 = __Block_byref_object_dispose__13436;
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v70 = 0;
  id v71 = (os_unfair_lock_s *)&v70;
  uint64_t v72 = 0x2810000000;
  v73 = "";
  int v74 = 0;
  dispatch_group_t v50 = dispatch_group_create();
  if ([v18 count])
  {
    uint64_t v20 = 0;
    v45 = v19;
    id v46 = v15;
    while (1)
    {
      v21 = [v18 objectAtIndex:v20];
      if ((unint64_t)[v21 length] < 3) {
        goto LABEL_28;
      }
      unint64_t v22 = [(id)v88[5] length];
      if (v22 > [v21 length]) {
        goto LABEL_28;
      }
      if ([v21 isStopWord]) {
        break;
      }
      double v23 = [v21 normalizedQueryString];
      double v24 = [(NSCache *)self->_negativeQueryStrings objectForKey:v23];
      double v25 = [MEMORY[0x1E4F1CA98] null];

      if (v24 == v25)
      {

LABEL_28:
        goto LABEL_29;
      }
      uint64_t v26 = [(NSCache *)self->_queryToUUID objectForKey:v23];
      if (v26)
      {
        double v27 = (void *)v26;
        os_unfair_lock_lock(v71 + 8);
        id v28 = (void *)v88[5];
        v88[5] = (uint64_t)v21;
        id v29 = v21;

        [(id)v82[5] addObjectsFromArray:v27];
        os_unfair_lock_unlock(v71 + 8);

        goto LABEL_10;
      }
      char v30 = (void *)[v19 copy];
      id v31 = v23;
      if (_createFilterQueryForQueryString_onceToken != -1) {
        dispatch_once(&_createFilterQueryForQueryString_onceToken, &__block_literal_global_213_13439);
      }
      if (_createFilterQueryForQueryString___shouldUseTokenizedFilterQuery) {
        v32 = @"(searchText == \"%@\"cdwt) || (kMDItemPhotosSceneClassificationLabels == \"%@\"cwd || kMDItemPhotosSceneClassificationSynonyms == \"%@\"cwd)";
      }
      else {
        v32 = @"(searchText == \"%@\"cdw) || (kMDItemPhotosSceneClassificationLabels == \"%@\"cwd || kMDItemPhotosSceneClassificationSynonyms == \"%@\"cwd)";
      }
      char v33 = objc_msgSend(NSString, "stringWithFormat:", v32, v31, v31, v31);

      v99[0] = v33;
      v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
      [v30 setFilterQueries:v34];

      char v35 = (void *)[objc_alloc(MEMORY[0x1E4F23890]) initWithUserQueryString:v31 userQueryContext:v30];
      v68[0] = 0;
      v68[1] = v68;
      v68[2] = 0x3032000000;
      v68[3] = __Block_byref_object_copy__13435;
      v68[4] = __Block_byref_object_dispose__13436;
      id v69 = 0;
      v66[0] = 0;
      v66[1] = v66;
      v66[2] = 0x3032000000;
      v66[3] = __Block_byref_object_copy__13435;
      v66[4] = __Block_byref_object_dispose__13436;
      id v67 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_90;
      v59[3] = &unk_1E6E2C910;
      id v62 = v66;
      uint8_t v59[4] = self;
      id v36 = v31;
      id v60 = v36;
      v63 = &v70;
      id v37 = v21;
      id v61 = v37;
      v64 = &v87;
      uint64_t v65 = &v75;
      [v35 setFoundItemsHandler:v59];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2;
      v58[3] = &unk_1E6E2C938;
      v58[4] = v68;
      [v35 setFoundSuggestionsHandler:v58];
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3;
      v52[3] = &unk_1E6E2C960;
      long long v55 = &v75;
      v52[4] = self;
      id v38 = v36;
      id v53 = v38;
      uint64_t v56 = &v70;
      long long v57 = &v81;
      int v39 = v50;
      int v54 = v39;
      [v35 setCompletionHandler:v52];
      dispatch_group_enter(v39);
      [v35 start];
      dispatch_time_t v40 = dispatch_time(0, 200000000);
      if (dispatch_group_wait(v39, v40))
      {
        uint64_t v41 = TIStickerCandidateGeneratorOSLogFacility();
        id v15 = v46;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v43 = objc_msgSend(NSString, "stringWithFormat:", @"%s Genmoji: Timeout before genmoji search could finish.", "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]");
          *(_DWORD *)long long buf = 138412290;
          v98 = v43;
          _os_log_debug_impl(&dword_1E3F0E000, v41, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        (*((void (**)(id, void, void))v46 + 2))(v46, 0, 0);
        int v42 = 1;
      }
      else
      {
        id v15 = v46;
        if ([(id)v76[5] count])
        {
          os_unfair_lock_lock(v71 + 8);
          [(id)v76[5] removeAllObjects];
          os_unfair_lock_unlock(v71 + 8);
          int v42 = 0;
        }
        else
        {
          int v42 = 2;
        }
      }
      CFDataRef v19 = v45;

      _Block_object_dispose(v66, 8);
      _Block_object_dispose(v68, 8);

      if (v42)
      {
        if (v42 != 2) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
LABEL_11:
      if ([v18 count] <= (unint64_t)++v20) {
        goto LABEL_29;
      }
    }
    double v23 = v21;
LABEL_10:

    goto LABEL_11;
  }
LABEL_29:
  os_unfair_lock_lock(v71 + 8);
  v44 = (void *)[(id)v82[5] copy];
  v51[2](v51, v44, v88[5]);

  os_unfair_lock_unlock(v71 + 8);
LABEL_30:

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v75, 8);

  _Block_object_dispose(&v81, 8);
  _Block_object_dispose(&v87, 8);
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = *(void **)(*(void *)(a1 + 32) + 16);
    id v8 = [v6 normalizedQueryString];
    objc_msgSend(v7, "setObject:forKey:cost:", v5, v8, objc_msgSend(v5, "count"));

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v9 = &stru_1F3F7A998;
    }
    else
    {
      uint64_t v9 = [v6 queryString];
    }
    id v11 = *(void **)(a1 + 32);
    v18[0] = @"com.apple.stickers.role.keyboard";
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v13 = [v11 stickersForStickerIdentifiers:v5 roles:v12];

    id v14 = [*(id *)(a1 + 32) _generateKeyboardCandidatesForStickers:v13 withQuery:v9 withRenderTraits:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = TIStickerCandidateGeneratorOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Genmoji: No sticker suggestions have been received.", "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke");
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v4 = TIStickerCandidateGeneratorOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s Genmoji: CoreSpotlight returned %lu items.", "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke", objc_msgSend(v3, "count"));
      *(_DWORD *)long long buf = 138412290;
      double v23 = v15;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    id v16 = v3;
    id v5 = [v3 sortedArrayUsingComparator:&__block_literal_global_97];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) attributeSet];
          id v11 = [v10 attributeDictionary];
          id v12 = [v11 objectForKey:@"stickerIdentifier"];

          id v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v12];
          if (v13) {
            [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v13];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:*(void *)(a1 + 40) forKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    unint64_t v14 = [*(id *)(a1 + 48) length];
    if (v14 > [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) length])
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(a1 + 48));
      [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) addObjectsFromArray:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));

    id v3 = v16;
  }
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
}

void __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = TIStickerCandidateGeneratorOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v10 = [NSString stringWithFormat:@"%s Genmoji: Error returned from CoreSpotlight %@.", "-[TIStickerCandidateGenerator _generateStickerCandidatesForGenerativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_3", v3];
      *(_DWORD *)long long buf = 138412290;
      id v12 = v10;
      _os_log_error_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) mutableCopy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
    [v8 setObject:v9 forKey:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __150__TIStickerCandidateGenerator__generateStickerCandidatesForGenerativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 attributeSet];
  uint64_t v7 = [v6 lastUsedDate];
  uint64_t v8 = [v5 attributeSet];

  if (v7) {
    [v8 lastUsedDate];
  }
  else {
  uint64_t v9 = [v8 contentCreationDate];
  }

  id v10 = [v4 attributeSet];
  id v11 = [v10 lastUsedDate];
  id v12 = [v4 attributeSet];
  uint64_t v13 = v12;
  if (v11) {
    [v12 lastUsedDate];
  }
  else {
  unint64_t v14 = [v12 contentCreationDate];
  }

  [v9 timeIntervalSinceReferenceDate];
  double v16 = v15;
  [v14 timeIntervalSinceReferenceDate];
  if (v16 > v17) {
    uint64_t v18 = -1;
  }
  else {
    uint64_t v18 = v16 < v17;
  }

  return v18;
}

- (void)generateStickerCandidatesForTaxonomySearchableQueries:(id)a3 generativeEmojiSearchableQueries:(id)a4 withRenderTraits:(id)a5 shouldAppend:(BOOL)a6 language:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  if (TIGetShowStickersValue_onceToken != -1) {
    dispatch_once(&TIGetShowStickersValue_onceToken, &__block_literal_global_202);
  }
  uint64_t v18 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  long long v19 = [(id)v18 valueForPreferenceKey:@"ShowStickers"];

  LOBYTE(v18) = [v19 BOOLValue];
  if (v18)
  {
    long long v20 = TIStickerCandidateGeneratorOSLogFacility();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    unint64_t v22 = TIStickerCandidateGeneratorOSLogFacility();
    double v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Generate Stickers", (const char *)&unk_1E41704BE, buf, 2u);
    }

    *(void *)long long buf = 0;
    int v42 = buf;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__13435;
    v45 = __Block_byref_object_dispose__13436;
    id v46 = (void *)MEMORY[0x1E4F1CBF0];
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__13435;
    v39[4] = __Block_byref_object_dispose__13436;
    id v40 = 0;
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    id v36 = __Block_byref_object_copy__13435;
    id v37 = __Block_byref_object_dispose__13436;
    dispatch_group_t v38 = dispatch_group_create();
    if (_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl())
    {
      if (!v14)
      {
LABEL_16:
        id v28 = [(TIStickerCandidateGenerator *)self backgroundOperationQueue];
        id v29 = v17;
        id v24 = v17;
        TIDispatchAsync();

        _Block_object_dispose(&v33, 8);
        _Block_object_dispose(v39, 8);

        _Block_object_dispose(buf, 8);
        double v25 = v46;
        goto LABEL_17;
      }
    }
    else
    {
      char v26 = _os_feature_enabled_impl();
      if (!v14 || (v26 & 1) == 0) {
        goto LABEL_16;
      }
    }
    if ([v14 count])
    {
      dispatch_group_enter((dispatch_group_t)v34[5]);
      double v27 = [(TIStickerCandidateGenerator *)self backgroundOperationQueue];
      id v30 = v14;
      id v31 = v15;
      id v32 = v16;
      TIDispatchAsync();
    }
    goto LABEL_16;
  }
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  id v49 = __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke;
  dispatch_group_t v50 = &unk_1E6E2E3A8;
  id v51 = v17;
  id v24 = v17;
  TIDispatchAsync();
  double v25 = v51;
LABEL_17:
}

uint64_t __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_50(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2;
  v7[3] = &unk_1E6E2C7D8;
  long long v8 = *(_OWORD *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 80);
  return [v2 _generateStickerCandidatesForGenerativeEmojiSearchableQueries:v1 withRenderTraits:v4 shouldAppend:v3 language:v5 completionHandler:v7];
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  if (dispatch_group_wait(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2))
  {
    uint64_t v3 = TIStickerCandidateGeneratorOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s Top level completion handler timed out for stickers search", "-[TIStickerCandidateGenerator generateStickerCandidatesForTaxonomySearchableQueries:generativeEmojiSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:]_block_invoke_3");
      *(_DWORD *)long long buf = 138412290;
      id v32 = v14;
      _os_log_error_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    double v27 = __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_56;
    id v28 = &unk_1E6E2C828;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 56);
    id v29 = v4;
    uint64_t v30 = v5;
    TIDispatchAsync();
    id v6 = v29;
  }
  else if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "count"));
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_60;
    v16[3] = &unk_1E6E2C850;
    id v17 = v8;
    id v10 = v7;
    id v18 = v10;
    id v6 = v8;
    [v9 enumerateObjectsUsingBlock:v16];
    id v15 = *(id *)(a1 + 32);
    id v11 = v10;
    TIDispatchAsync();
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    os_signpost_id_t v21 = __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_57;
    unint64_t v22 = &unk_1E6E2C828;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 56);
    id v23 = v12;
    uint64_t v24 = v13;
    TIDispatchAsync();
    id v6 = v23;
  }
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_56(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = TIStickerCandidateGeneratorOSLogFacility();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Generate Stickers", (const char *)&unk_1E41704BE, v5, 2u);
  }
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_57(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = TIStickerCandidateGeneratorOSLogFacility();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Generate Stickers", (const char *)&unk_1E41704BE, v5, 2u);
  }
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_60(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 stickerIdentifier];
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    [*(id *)(a1 + 40) addObject:v4];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2_62(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  id v4 = TIStickerCandidateGeneratorOSLogFacility();
  uint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v5, OS_SIGNPOST_INTERVAL_END, v6, "Generate Stickers", (const char *)&unk_1E41704BE, v7, 2u);
  }
}

void __175__TIStickerCandidateGenerator_generateStickerCandidatesForTaxonomySearchableQueries_generativeEmojiSearchableQueries_withRenderTraits_shouldAppend_language_completionHandler___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(a1[5] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1[6] + 8) + 40));
}

- (void)generateStickerCandidatesForSearchableQueries:(id)a3 withRenderTraits:(id)a4 shouldAppend:(BOOL)a5 language:(id)a6 completionHandler:(id)a7
{
}

- (TIStickerCandidateGenerator)init
{
  v17.receiver = self;
  v17.super_class = (Class)TIStickerCandidateGenerator;
  uint64_t v2 = [(TIStickerCandidateGenerator *)&v17 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.TextInput.TIStickerCandidateGenerator.bgQueue", v3);
    backgroundOperationQueue = v2->_backgroundOperationQueue;
    v2->_backgroundOperationQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    queryToUUID = v2->_queryToUUID;
    v2->_queryToUUID = v6;

    [(NSCache *)v2->_queryToUUID setCountLimit:100];
    id v8 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    negativeQueryStrings = v2->_negativeQueryStrings;
    v2->_negativeQueryStrings = v8;

    [(NSCache *)v2->_negativeQueryStrings setCountLimit:100];
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    stickerToThumbnail = v2->_stickerToThumbnail;
    v2->_stickerToThumbnail = v10;

    id v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    stickerToThumbnailLock = v2->_stickerToThumbnailLock;
    v2->_stickerToThumbnailLock = v12;

    id v14 = objc_alloc_init(TISceneTaxonomyGenerator);
    sceneTaxonomyGenerator = v2->_sceneTaxonomyGenerator;
    v2->_sceneTaxonomyGenerator = v14;

    [(TIStickerCandidateGenerator *)v2 createContext];
  }
  return v2;
}

+ (TIStickerCandidateGenerator)sharedInstance
{
  if (sharedInstance_onceToken_13525 != -1) {
    dispatch_once(&sharedInstance_onceToken_13525, &__block_literal_global_13526);
  }
  uint64_t v2 = (void *)sharedInstance___stickerCandidateGenerator;

  return (TIStickerCandidateGenerator *)v2;
}

uint64_t __45__TIStickerCandidateGenerator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TIStickerCandidateGenerator);
  uint64_t v1 = sharedInstance___stickerCandidateGenerator;
  sharedInstance___stickerCandidateGenerator = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end
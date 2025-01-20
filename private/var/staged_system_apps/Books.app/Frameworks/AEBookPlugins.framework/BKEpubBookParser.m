@interface BKEpubBookParser
+ (BOOL)canParse:(id)a3;
+ (BOOL)isValidMimeType:(id)a3;
+ (BOOL)recomputeFixedLayoutDimensionsForBook:(id)a3;
+ (CGSize)_computeFixedLayoutDimensionsFrom:(id)a3 forBook:(id)a4;
+ (id)bookCachedDataPathForBookWithKey:(id)a3;
+ (id)bookExtraInfoCacheDirectory;
+ (id)cachedDataForBookDatabaseKey:(id)a3 cacheKey:(id)a4;
- (BOOL)isDifferentParserVersion:(id)a3;
- (BOOL)isLegalCompression:(id)a3;
- (BOOL)isLegalEncryption:(id)a3;
- (id)createBookExtraInfoCacheDirectoryIfNecessary;
- (id)mediaOverlayHrefForManifestInfo:(__CFDictionary *)a3 readable:(BKReadableFormat *)a4;
- (int)_fullParse;
- (int)_touchUpParse;
- (int)constructEntity:(id)a3 withNavPoint:(void *)a4 absoluteOrder:(int)a5 indentationLevel:(int)a6 withAnchorInfo:(id)a7 createdObjects:(id)a8;
- (int)parse;
- (int)parse:(BOOL)a3;
- (void)constructBKDocumentWithReadable:(BKReadableFormat *)a3 chapters:(id)a4 landmarks:(id)a5 physicalPages:(id)a6;
- (void)constructBKIdCfiMappingsWithEpub:(void *)a3;
- (void)constructBKLandmarkInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4;
- (void)constructBKNavigationInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4;
- (void)constructBKPhysicalPageWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4;
- (void)constructBKProtectionInfoWithReadable:(BKReadableFormat *)a3;
- (void)createEpubParser:(int)a3 errorCode:(int *)a4;
- (void)resetItunesMetadata;
- (void)setAppleDisplayOptionsFromParser:(BKReadableFormat *)a3;
- (void)setArtworkTemplateFromPlist:(id)a3;
- (void)setCoverWritingModeFromPlist:(id)a3;
- (void)setEndOfBookExperienceFromPlist:(id)a3;
- (void)setLanguageFromPlist:(id)a3;
- (void)setObeyPageBreaksFromPlist:(id)a3;
- (void)setPublisherInfoFromParser:(BKReadableFormat *)a3;
- (void)setScrollAxisModeFromPlist:(id)a3;
- (void)tryEmbeddedHrefForCoverArtHref:(id)a3;
@end

@implementation BKEpubBookParser

+ (BOOL)canParse:(id)a3
{
  v3 = (ITEpubFolder *)a3;
  int v4 = BookFormatByFilePath();
  if (!v4)
  {
    if (ITEpubFolder::isMimeCorrect(v3, 0, 0, v5)) {
      int v4 = 0;
    }
    else {
      int v4 = -1;
    }
  }
  BOOL v6 = v4 == 0;

  return v6;
}

- (void)createEpubParser:(int)a3 errorCode:(int *)a4
{
  unint64_t v5 = [(BKBookParser *)self book];
  [v5 bookBundlePath];

  BOOL v6 = +[BLLibrary defaultBookLibrary];
  v7 = [(BKBookParser *)self book];
  v8 = [v7 bookBundlePath];
  v9 = +[NSURL fileURLWithPath:v8];
  v10 = [v6 _perUserBookURLForBookURL:v9];
  v11 = [v10 path];
  id v12 = [v11 mutableCopy];

  if (([v12 hasSuffix:@"/"] & 1) == 0) {
    [v12 appendString:@"/"];
  }
  operator new();
}

- (int)_fullParse
{
  int v196 = 0;
  v3 = [(BKEpubBookParser *)self createEpubParser:0 errorCode:&v196];
  if (!v196)
  {
    v7 = [(BKBookParser *)self book];
    [v7 resetAsNewlyDownloaded];

    v8 = (void *)(*(uint64_t (**)(void *))(*v3 + 136))(v3);
    v9 = [(BKBookParser *)self book];
    v10 = [v9 bookBundlePath];
    v11 = [v8 stringByReplacingOccurrencesOfString:v10 withString:&stru_1DF0D8];
    id v12 = [(BKBookParser *)self book];
    [v12 setBookContentSubpath:v11];

    v13 = [(BKBookParser *)self book];
    v14 = [v13 bookAuthor];
    LODWORD(v9) = v14 == 0;

    if (!v9) {
      goto LABEL_23;
    }
    v15 = (const void *)v3[4];
    if (v15)
    {
      CFRetain(v15);
      v16 = (void *)v3[4];
    }
    else
    {
      v16 = 0;
    }
    id v17 = v16;
    v18 = [(BKBookParser *)self book];
    v19 = [v18 bookAuthor];
    if ([v19 length])
    {
      v20 = [(BKBookParser *)self book];
      v21 = [v20 bookAuthor];
      unsigned __int8 v22 = [v17 isEqualToString:v21];

      if (v22) {
        goto LABEL_18;
      }
      v18 = _ITEpubParsingLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [(BKBookParser *)self book];
        v24 = [v23 bookAuthor];
        *(_DWORD *)buf = 138544386;
        CFStringRef v198 = @"self.book.bookAuthor";
        __int16 v199 = 2160;
        uint64_t v200 = 1752392040;
        __int16 v201 = 2112;
        id v202 = v17;
        __int16 v203 = 2160;
        uint64_t v204 = 1752392040;
        __int16 v205 = 2112;
        v206 = v24;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
      }
    }
    else
    {
    }
LABEL_18:

    v25 = (const void *)v3[4];
    if (v25 && (CFRetain(v25), (v26 = (void *)v3[4]) != 0))
    {
      v27 = [(BKBookParser *)self book];
      [v27 setBookAuthor:v26];
    }
    else
    {
      v26 = [(BKBookParser *)self book];
      [v26 setBookAuthor:0];
    }

LABEL_23:
    v28 = [(BKBookParser *)self book];
    v29 = [v28 bookTitle];
    BOOL v30 = v29 == 0;

    if (!v30) {
      goto LABEL_38;
    }
    v31 = (const void *)v3[5];
    if (v31)
    {
      CFRetain(v31);
      v32 = (void *)v3[5];
    }
    else
    {
      v32 = 0;
    }
    id v33 = v32;
    v34 = [(BKBookParser *)self book];
    v35 = [v34 bookTitle];
    if ([v35 length])
    {
      v36 = [(BKBookParser *)self book];
      v37 = [v36 bookTitle];
      unsigned __int8 v38 = [v33 isEqualToString:v37];

      if (v38) {
        goto LABEL_33;
      }
      v34 = _ITEpubParsingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v39 = [(BKBookParser *)self book];
        v40 = [v39 bookTitle];
        *(_DWORD *)buf = 138544386;
        CFStringRef v198 = @"self.book.bookTitle";
        __int16 v199 = 2160;
        uint64_t v200 = 1752392040;
        __int16 v201 = 2112;
        id v202 = v33;
        __int16 v203 = 2160;
        uint64_t v204 = 1752392040;
        __int16 v205 = 2112;
        v206 = v40;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
      }
    }
    else
    {
    }
LABEL_33:

    v41 = (const void *)v3[5];
    if (v41 && (CFRetain(v41), (v42 = (void *)v3[5]) != 0))
    {
      v43 = [(BKBookParser *)self book];
      [v43 setBookTitle:v42];
    }
    else
    {
      v42 = [(BKBookParser *)self book];
      [v42 setBookTitle:0];
    }

LABEL_38:
    v44 = (const void *)v3[6];
    if (v44)
    {
      CFRetain(v44);
      v45 = (void *)v3[6];
    }
    else
    {
      v45 = 0;
    }
    id v46 = v45;
    v47 = [(BKBookParser *)self book];
    v48 = [v47 bookLanguage];
    if ([v48 length])
    {
      v49 = [(BKBookParser *)self book];
      v50 = [v49 bookLanguage];
      unsigned __int8 v51 = [v46 isEqualToString:v50];

      if (v51)
      {
LABEL_47:

        v54 = (const void *)v3[6];
        if (v54 && (CFRetain(v54), (v55 = (void *)v3[6]) != 0))
        {
          v56 = [(BKBookParser *)self book];
          [v56 setBookLanguage:v55];
        }
        else
        {
          v55 = [(BKBookParser *)self book];
          [v55 setBookLanguage:0];
        }

        v57 = (const void *)v3[7];
        if (v57)
        {
          CFRetain(v57);
          v58 = (void *)v3[7];
        }
        else
        {
          v58 = 0;
        }
        id v59 = v58;
        v60 = [(BKBookParser *)self book];
        v61 = [v60 genre];
        if ([v61 length])
        {
          v62 = [(BKBookParser *)self book];
          v63 = [v62 genre];
          unsigned __int8 v64 = [v59 isEqualToString:v63];

          if (v64)
          {
LABEL_60:

            v67 = (const void *)v3[7];
            if (v67 && (CFRetain(v67), (v68 = (void *)v3[7]) != 0))
            {
              v69 = [(BKBookParser *)self book];
              [v69 setGenre:v68];
            }
            else
            {
              v68 = [(BKBookParser *)self book];
              [v68 setGenre:0];
            }

            v70 = (const void *)v3[8];
            if (v70)
            {
              CFRetain(v70);
              v71 = (void *)v3[8];
            }
            else
            {
              v71 = 0;
            }
            id v72 = v71;
            v73 = [(BKBookParser *)self book];
            v74 = [v73 bookEpubId];
            if ([v74 length])
            {
              v75 = [(BKBookParser *)self book];
              v76 = [v75 bookEpubId];
              unsigned __int8 v77 = [v72 isEqualToString:v76];

              if (v77)
              {
LABEL_73:

                v80 = (const void *)v3[8];
                if (v80 && (CFRetain(v80), (v81 = (void *)v3[8]) != 0))
                {
                  v82 = [(BKBookParser *)self book];
                  [v82 setBookEpubId:v81];
                }
                else
                {
                  v81 = [(BKBookParser *)self book];
                  [v81 setBookEpubId:0];
                }

                v83 = (const void *)v3[9];
                if (v83)
                {
                  CFRetain(v83);
                  v84 = (void *)v3[9];
                }
                else
                {
                  v84 = 0;
                }
                id v85 = v84;
                v86 = [(BKBookParser *)self book];
                v87 = [v86 bookEpubIdWithUUIDScheme];
                if ([v87 length])
                {
                  v88 = [(BKBookParser *)self book];
                  v89 = [v88 bookEpubIdWithUUIDScheme];
                  unsigned __int8 v90 = [v85 isEqualToString:v89];

                  if (v90)
                  {
LABEL_86:

                    v93 = (const void *)v3[9];
                    if (v93 && (CFRetain(v93), (v94 = (void *)v3[9]) != 0))
                    {
                      v95 = [(BKBookParser *)self book];
                      [v95 setBookEpubIdWithUUIDScheme:v94];
                    }
                    else
                    {
                      v94 = [(BKBookParser *)self book];
                      [v94 setBookEpubIdWithUUIDScheme:0];
                    }

                    uint64_t v96 = ITEpubFolder::dcTermsModified((ITEpubFolder *)v3);
                    v97 = [(BKBookParser *)self book];
                    [v97 setDcTermsModified:v96];

                    uint64_t v98 = ITEpubFolder::readingDirection((ITEpubFolder *)v3);
                    v99 = [(BKBookParser *)self book];
                    [v99 setReadingDirection:v98];

                    uint64_t active = ITEpubFolder::mediaActiveClass((ITEpubFolder *)v3);
                    v101 = [(BKBookParser *)self book];
                    [v101 setMediaActiveClass:active];

                    uint64_t v102 = ITEpubFolder::pageProgressionDirection((ITEpubFolder *)v3);
                    if (v102) {
                      CFStringRef v103 = (const __CFString *)v102;
                    }
                    else {
                      CFStringRef v103 = @"default";
                    }
                    v104 = [(BKBookParser *)self book];
                    [v104 setPageProgressionDirection:v103];

                    uint64_t v105 = ITEpubFolder::dcTermsContributor((ITEpubFolder *)v3);
                    v106 = [(BKBookParser *)self book];
                    [v106 setDcTermsContributor:v105];

                    v107 = [(BKBookParser *)self book];
                    v108 = [v107 bookLanguage];
                    if (+[IMLanguageUtilities languageIsArabic:v108])
                    {
                      unsigned int v109 = 1;
                    }
                    else
                    {
                      v110 = [(BKBookParser *)self book];
                      v111 = [v110 bookLanguage];
                      unsigned int v109 = +[IMLanguageUtilities languageIsHebrew:v111];
                    }
                    v112 = [(BKBookParser *)self book];
                    v113 = [v112 pageProgressionDirection];
                    unsigned int v114 = [v113 isEqualToString:@"default"];

                    if ((v114 & v109) != 0)
                    {
                      v115 = [(BKBookParser *)self book];
                      [v115 setPageProgressionDirection:@"rtl"];
                    }
                    uint64_t v116 = ITEpubFolder::coverWritingMode((ITEpubFolder *)v3);
                    if (v116) {
                      CFStringRef v117 = (const __CFString *)v116;
                    }
                    else {
                      CFStringRef v117 = @"default";
                    }
                    v118 = [(BKBookParser *)self book];
                    [v118 setCoverWritingModeString:v117];

                    uint64_t v119 = ITEpubFolder::scrollDirection((ITEpubFolder *)v3);
                    if (v119) {
                      CFStringRef v120 = (const __CFString *)v119;
                    }
                    else {
                      CFStringRef v120 = @"default";
                    }
                    v121 = [(BKBookParser *)self book];
                    [v121 setScrollDirection:v120];

                    if (ITEpubFolder::ebpajGuideVersion((ITEpubFolder *)v3))
                    {
                      v122 = [(BKBookParser *)self book];
                      v123 = [v122 bookLanguage];
                      BOOL v124 = [v123 caseInsensitiveCompare:@"ja"] == 0;

                      if (v124) {
                        goto LABEL_109;
                      }
                      v125 = [(BKBookParser *)self book];
                      v126 = [v125 bookLanguage];
                      BOOL v127 = [v126 rangeOfString:@"ja" options:9] == 0;

                      if (v127)
                      {
                        v128 = [(BKBookParser *)self book];
                        v129 = [v128 bookLanguage];
                        unsigned int v130 = [v129 characterAtIndex:2];

                        if (v130 == 95 || v130 == 45)
                        {
LABEL_109:
                          v131 = [(BKBookParser *)self book];
                          [v131 setRespectImageSizeClass:@"gaiji"];

                          v132 = [(BKBookParser *)self book];
                          [v132 setRespectImageSizeClassIsPrefix:1];
                        }
                      }
                    }
                    [(BKEpubBookParser *)self setPublisherInfoFromParser:v3];
                    [(BKEpubBookParser *)self setAppleDisplayOptionsFromParser:v3];
                    [(BKEpubBookParser *)self resetItunesMetadata];
                    v133 = [(BKBookParser *)self book];
                    v134 = [v133 bookLanguage];
                    v135 = +[NSLocale canonicalLanguageIdentifierFromString:v134];
                    v136 = [(BKBookParser *)self book];
                    [v136 setBookLanguage:v135];

                    uint64_t v137 = ITEpubFolder::spineIndexInPackage((ITEpubFolder *)v3);
                    if ((v137 & 0x80000000) != 0)
                    {
                      v138 = 0;
                    }
                    else
                    {
                      v138 = +[NSNumber numberWithInt:v137];
                    }
                    v139 = [(BKBookParser *)self book];
                    [v139 setSpineIndexInPackage:v138];

                    if ((int)v137 >= 0) {
                    v140 = (const void *)(*(uint64_t (**)(void *))(*v3 + 96))(v3);
                    }
                    [(BKEpubBookParser *)self tryEmbeddedHrefForCoverArtHref:v140];
                    if (v140) {
                      CFRelease(v140);
                    }
                    v141 = [(BKBookParser *)self book];
                    [v141 setDateLastOpened:0];

                    v142 = (*(void (**)(void *))(*v3 + 152))(v3);
                    v143 = [(BKBookParser *)self book];
                    v144 = [v143 parserOPFPath];
                    if ([v144 length])
                    {
                      v145 = [(BKBookParser *)self book];
                      v146 = [v145 parserOPFPath];
                      unsigned __int8 v147 = [v142 isEqualToString:v146];

                      if (v147) {
                        goto LABEL_123;
                      }
                      v143 = _ITEpubParsingLog();
                      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
                      {
                        v148 = [(BKBookParser *)self book];
                        v149 = [v148 parserOPFPath];
                        *(_DWORD *)buf = 138544386;
                        CFStringRef v198 = @"self.book.parserOPFPath";
                        __int16 v199 = 2160;
                        uint64_t v200 = 1752392040;
                        __int16 v201 = 2112;
                        id v202 = v142;
                        __int16 v203 = 2160;
                        uint64_t v204 = 1752392040;
                        __int16 v205 = 2112;
                        v206 = v149;
                        _os_log_impl(&dword_0, v143, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
                      }
                    }
                    else
                    {
                    }
LABEL_123:

                    v150 = (void *)(*(uint64_t (**)(void *))(*v3 + 152))(v3);
                    [(BKBookParser *)self book];
                    if (v150) {
                      v151 = {;
                    }
                      [v151 setParserOPFPath:v150];
                    }
                    else {
                      v150 = {;
                    }
                      [v150 setParserOPFPath:0];
                    }

                    v152 = (*(void (**)(void *))(*v3 + 160))(v3);
                    v153 = [(BKBookParser *)self book];
                    v154 = [v153 parserNCXPath];
                    if ([v154 length])
                    {
                      v155 = [(BKBookParser *)self book];
                      v156 = [v155 parserNCXPath];
                      unsigned __int8 v157 = [v152 isEqualToString:v156];

                      if (v157) {
                        goto LABEL_132;
                      }
                      v153 = _ITEpubParsingLog();
                      if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
                      {
                        v158 = [(BKBookParser *)self book];
                        v159 = [v158 parserNCXPath];
                        *(_DWORD *)buf = 138544386;
                        CFStringRef v198 = @"self.book.parserNCXPath";
                        __int16 v199 = 2160;
                        uint64_t v200 = 1752392040;
                        __int16 v201 = 2112;
                        id v202 = v152;
                        __int16 v203 = 2160;
                        uint64_t v204 = 1752392040;
                        __int16 v205 = 2112;
                        v206 = v159;
                        _os_log_impl(&dword_0, v153, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
                      }
                    }
                    else
                    {
                    }
LABEL_132:

                    v160 = (void *)(*(uint64_t (**)(void *))(*v3 + 160))(v3);
                    [(BKBookParser *)self book];
                    if (v160) {
                      v161 = {;
                    }
                      [v161 setParserNCXPath:v160];
                    }
                    else {
                      v160 = {;
                    }
                      [v160 setParserNCXPath:0];
                    }

                    v162 = (*(void (**)(void *))(*v3 + 80))(v3);
                    v163 = [(BKBookParser *)self book];
                    v164 = [v163 firstDocumentHref];
                    if ([v164 length])
                    {
                      v165 = [(BKBookParser *)self book];
                      v166 = [v165 firstDocumentHref];
                      unsigned __int8 v167 = [v162 isEqualToString:v166];

                      if (v167) {
                        goto LABEL_141;
                      }
                      v163 = _ITEpubParsingLog();
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                      {
                        v168 = [(BKBookParser *)self book];
                        v169 = [v168 firstDocumentHref];
                        *(_DWORD *)buf = 138544386;
                        CFStringRef v198 = @"self.book.firstDocumentHref";
                        __int16 v199 = 2160;
                        uint64_t v200 = 1752392040;
                        __int16 v201 = 2112;
                        id v202 = v162;
                        __int16 v203 = 2160;
                        uint64_t v204 = 1752392040;
                        __int16 v205 = 2112;
                        v206 = v169;
                        _os_log_impl(&dword_0, v163, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
                      }
                    }
                    else
                    {
                    }
LABEL_141:

                    v170 = (void *)(*(uint64_t (**)(void *))(*v3 + 80))(v3);
                    [(BKBookParser *)self book];
                    if (v170) {
                      v171 = {;
                    }
                      [v171 setFirstDocumentHref:v170];
                    }
                    else {
                      v170 = {;
                    }
                      [v170 setFirstDocumentHref:0];
                    }

                    v172 = (*(void (**)(void *))(*v3 + 104))(v3);
                    v173 = [(BKBookParser *)self book];
                    v174 = [v173 tocPageHref];
                    if ([v174 length])
                    {
                      v175 = [(BKBookParser *)self book];
                      v176 = [v175 tocPageHref];
                      unsigned __int8 v177 = [v172 isEqualToString:v176];

                      if (v177)
                      {
LABEL_150:

                        v180 = (void *)(*(uint64_t (**)(void *))(*v3 + 104))(v3);
                        [(BKBookParser *)self book];
                        if (v180) {
                          v181 = {;
                        }
                          [v181 setTocPageHref:v180];
                        }
                        else {
                          v180 = {;
                        }
                          [v180 setTocPageHref:0];
                        }

                        v182 = objc_opt_new();
                        v183 = objc_opt_new();
                        v184 = objc_opt_new();
                        [(BKEpubBookParser *)self constructBKNavigationInfoWithReadable:v3 withAnchorInfo:v182];
                        [(BKEpubBookParser *)self constructBKLandmarkInfoWithReadable:v3 withAnchorInfo:v183];
                        [(BKEpubBookParser *)self constructBKPhysicalPageWithReadable:v3 withAnchorInfo:v184];
                        [(BKEpubBookParser *)self constructBKIdCfiMappingsWithEpub:v3];
                        [(BKEpubBookParser *)self constructBKDocumentWithReadable:v3 chapters:v182 landmarks:v183 physicalPages:v184];
                        [(BKEpubBookParser *)self constructBKProtectionInfoWithReadable:v3];

                        v185 = [(BKBookParser *)self book];
                        LODWORD(v183) = +[BKEpubBookParser recomputeFixedLayoutDimensionsForBook:v185];

                        if (v183)
                        {
                          int v196 = -998;
                          BOOL v6 = [(BKBookParser *)self book];
                          [v6 resetAsNewlyDownloaded];
                        }
                        else
                        {
                          BOOL v186 = !self->_illegalEncryptionAlgorithm;
                          v187 = [(BKBookParser *)self book];
                          BOOL v6 = v187;
                          if (v186) {
                            [v187 setParserVersion:@"BookEPUB Parser - 2024.09.26"];
                          }
                          else {
                            [v187 setParserVersion:@"BKEpubBookParser - IllegalEncryption - 10.04.2011"];
                          }
                        }
                        goto LABEL_158;
                      }
                      v173 = _ITEpubParsingLog();
                      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                      {
                        v178 = [(BKBookParser *)self book];
                        v179 = [v178 tocPageHref];
                        *(_DWORD *)buf = 138544386;
                        CFStringRef v198 = @"self.book.tocPageHref";
                        __int16 v199 = 2160;
                        uint64_t v200 = 1752392040;
                        __int16 v201 = 2112;
                        id v202 = v172;
                        __int16 v203 = 2160;
                        uint64_t v204 = 1752392040;
                        __int16 v205 = 2112;
                        v206 = v179;
                        _os_log_impl(&dword_0, v173, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
                      }
                    }
                    else
                    {
                    }
                    goto LABEL_150;
                  }
                  v86 = _ITEpubParsingLog();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                  {
                    v91 = [(BKBookParser *)self book];
                    v92 = [v91 bookEpubIdWithUUIDScheme];
                    *(_DWORD *)buf = 138544386;
                    CFStringRef v198 = @"self.book.bookEpubIdWithUUIDScheme";
                    __int16 v199 = 2160;
                    uint64_t v200 = 1752392040;
                    __int16 v201 = 2112;
                    id v202 = v85;
                    __int16 v203 = 2160;
                    uint64_t v204 = 1752392040;
                    __int16 v205 = 2112;
                    v206 = v92;
                    _os_log_impl(&dword_0, v86, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
                  }
                }
                else
                {
                }
                goto LABEL_86;
              }
              v73 = _ITEpubParsingLog();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                v78 = [(BKBookParser *)self book];
                v79 = [v78 bookEpubId];
                *(_DWORD *)buf = 138544386;
                CFStringRef v198 = @"self.book.bookEpubId";
                __int16 v199 = 2160;
                uint64_t v200 = 1752392040;
                __int16 v201 = 2112;
                id v202 = v72;
                __int16 v203 = 2160;
                uint64_t v204 = 1752392040;
                __int16 v205 = 2112;
                v206 = v79;
                _os_log_impl(&dword_0, v73, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
              }
            }
            else
            {
            }
            goto LABEL_73;
          }
          v60 = _ITEpubParsingLog();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v65 = [(BKBookParser *)self book];
            v66 = [v65 genre];
            *(_DWORD *)buf = 138544386;
            CFStringRef v198 = @"self.book.genre";
            __int16 v199 = 2160;
            uint64_t v200 = 1752392040;
            __int16 v201 = 2112;
            id v202 = v59;
            __int16 v203 = 2160;
            uint64_t v204 = 1752392040;
            __int16 v205 = 2112;
            v206 = v66;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
          }
        }
        else
        {
        }
        goto LABEL_60;
      }
      v47 = _ITEpubParsingLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v52 = [(BKBookParser *)self book];
        v53 = [v52 bookLanguage];
        *(_DWORD *)buf = 138544386;
        CFStringRef v198 = @"self.book.bookLanguage";
        __int16 v199 = 2160;
        uint64_t v200 = 1752392040;
        __int16 v201 = 2112;
        id v202 = v46;
        __int16 v203 = 2160;
        uint64_t v204 = 1752392040;
        __int16 v205 = 2112;
        v206 = v53;
        _os_log_impl(&dword_0, v47, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", buf, 0x34u);
      }
    }
    else
    {
    }
    goto LABEL_47;
  }
  int v4 = _ITEpubParsingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v198) = v196;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "createEpubParser error: %d", buf, 8u);
  }

  unint64_t v5 = BCIMLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    CFStringRef v198 = (const __CFString *)"-[BKEpubBookParser _fullParse]";
    __int16 v199 = 2080;
    uint64_t v200 = (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
    __int16 v201 = 1024;
    LODWORD(v202) = 145;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
  }

  BOOL v6 = BCIMLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v198) = v196;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"createEpubParser error: %d\"", buf, 8u);
  }
LABEL_158:

  ITRetain::release((ITRetain *)v3);
  int result = v196;
  if ((v196 + 42005) < 2 || v196 == -42597) {
    return -998;
  }
  if (!v196)
  {
    if (self->_illegalEncryptionAlgorithm)
    {
      v189 = _ITEpubParsingLog();
      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
      {
        v190 = [(BKBookParser *)self book];
        v191 = [v190 assetLogID];
        v192 = [(BKBookParser *)self book];
        v193 = [v192 bookBundlePath];
        v194 = [(BKBookParser *)self book];
        v195 = [v194 assetID];
        *(_DWORD *)buf = 138543874;
        CFStringRef v198 = v191;
        __int16 v199 = 2112;
        uint64_t v200 = (uint64_t)v193;
        __int16 v201 = 2112;
        id v202 = v195;
        _os_log_impl(&dword_0, v189, OS_LOG_TYPE_ERROR, "Illegal encryption for book %{public}@ %@:%@", buf, 0x20u);
      }
      return -999;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isDifferentParserVersion:(id)a3
{
  id v3 = a3;
  int v4 = [v3 parserVersion];
  if (v4)
  {
    unint64_t v5 = [v3 parserVersion];
    unsigned int v6 = [@"BookEPUB Parser - 2024.09.26" isEqualToString:v5] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (int)_touchUpParse
{
  id v3 = [(BKBookParser *)self book];
  unsigned int v4 = [(BKEpubBookParser *)self isDifferentParserVersion:v3];

  if (!v4) {
    return 0;
  }
  unint64_t v5 = [(BKBookParser *)self book];
  unsigned int v6 = [v5 parserVersion];
  if (v6)
  {
    v7 = [(BKBookParser *)self book];
    v8 = [v7 parserVersion];
    unsigned __int8 v9 = [@"BKEpubBookParser - IllegalEncryption - 10.04.2011" isEqualToString:v8];

    if (v9) {
      return -999;
    }
  }
  else
  {
  }

  return [(BKEpubBookParser *)self _fullParse];
}

- (int)parse:(BOOL)a3
{
  if (a3)
  {
    unsigned int v4 = _ITEpubParsingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = [(BKBookParser *)self book];
      unsigned int v6 = [v5 assetLogID];
      v7 = [(BKBookParser *)self book];
      v8 = [v7 bookBundlePath];
      unsigned __int8 v9 = [(BKBookParser *)self book];
      v10 = [v9 assetID];
      int v43 = 138543874;
      v44 = v6;
      __int16 v45 = 2112;
      id v46 = v8;
      __int16 v47 = 2112;
      v48 = v10;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Skipping all parsing for %{public}@ - %@:%@ -- Why would we do this?", (uint8_t *)&v43, 0x20u);
    }
    goto LABEL_28;
  }
  unsigned int v4 = [(BKBookParser *)self book];
  v11 = [(BKBookParser *)self book];
  id v12 = [v11 bookBundlePath];

  if (!v12)
  {
    v23 = _ITEpubParsingLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = [v4 databaseKey];
      v25 = [v4 bookAuthor];
      v26 = [v4 bookTitle];
      v27 = [v4 assetLogID];
      v28 = [v4 bookBundlePath];
      v29 = [v4 assetID];
      int v43 = 138413570;
      v44 = v24;
      __int16 v45 = 2112;
      id v46 = v25;
      __int16 v47 = 2112;
      v48 = v26;
      __int16 v49 = 2114;
      v50 = v27;
      __int16 v51 = 2112;
      v52 = v28;
      __int16 v53 = 2112;
      v54 = v29;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Parsing Not Possible -- No Bundle Path: [%@] {%@ - %@} - %{public}@ - %@:%@", (uint8_t *)&v43, 0x3Eu);
    }
    BOOL v30 = BCIMLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315650;
      v44 = "-[BKEpubBookParser parse:]";
      __int16 v45 = 2080;
      id v46 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      __int16 v47 = 1024;
      LODWORD(v48) = 368;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v43, 0x1Cu);
    }

    v21 = BCIMLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v31 = [v4 databaseKey];
      v32 = [v4 bookAuthor];
      id v33 = [v4 bookTitle];
      int v43 = 138412802;
      v44 = v31;
      __int16 v45 = 2112;
      id v46 = v32;
      __int16 v47 = 2112;
      v48 = v33;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "@\"Parsing Not Possible -- No Bundle Path: [%@] {%@ - %@}\"", (uint8_t *)&v43, 0x20u);
    }
    int v18 = -1000;
    goto LABEL_26;
  }
  if (![v4 wasParsed]) {
    goto LABEL_9;
  }
  v13 = [v4 isDirty];
  if (([v13 BOOLValue] & 1) != 0
    || ([v4 needsReparsing] & 1) != 0)
  {

LABEL_9:
    v14 = _ITEpubParsingLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = [v4 assetLogID];
      v16 = [v4 bookBundlePath];
      id v17 = [v4 assetID];
      int v43 = 138543874;
      v44 = v15;
      __int16 v45 = 2112;
      id v46 = v16;
      __int16 v47 = 2112;
      v48 = v17;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Performing full parse on %{public}@ - %@:%@", (uint8_t *)&v43, 0x20u);
    }
    int v18 = [(BKEpubBookParser *)self _fullParse];
    if (!v18)
    {
      v34 = +[NSDate date];
      [v4 setParseDate:v34];

      [v4 setIsDirty:&__kCFBooleanFalse];
LABEL_28:
      int v18 = 0;
      goto LABEL_29;
    }
    v19 = _ITEpubParsingLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v43 = 67109120;
      LODWORD(v44) = v18;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "Full parse failure: %d", (uint8_t *)&v43, 8u);
    }

    v20 = BCIMLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315650;
      v44 = "-[BKEpubBookParser parse:]";
      __int16 v45 = 2080;
      id v46 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      __int16 v47 = 1024;
      LODWORD(v48) = 347;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v43, 0x1Cu);
    }

    v21 = BCIMLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    int v43 = 67109120;
    LODWORD(v44) = v18;
    unsigned __int8 v22 = "@\"_fullParse: %d\"";
    goto LABEL_18;
  }
  int v36 = BEAlwaysFullParseEPUB();

  if (v36) {
    goto LABEL_9;
  }
  v37 = _ITEpubParsingLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v38 = [v4 assetLogID];
    v39 = [v4 bookBundlePath];
    v40 = [v4 assetID];
    int v43 = 138543874;
    v44 = v38;
    __int16 v45 = 2112;
    id v46 = v39;
    __int16 v47 = 2112;
    v48 = v40;
    _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "Performing touchup parse on %{public}@ - %@:%@", (uint8_t *)&v43, 0x20u);
  }
  int v18 = [(BKEpubBookParser *)self _touchUpParse];
  if (v18)
  {
    v41 = _ITEpubParsingLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      int v43 = 67109120;
      LODWORD(v44) = v18;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "Touch up parse failure: %d", (uint8_t *)&v43, 8u);
    }

    v42 = BCIMLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      int v43 = 136315650;
      v44 = "-[BKEpubBookParser parse:]";
      __int16 v45 = 2080;
      id v46 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      __int16 v47 = 1024;
      LODWORD(v48) = 360;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v43, 0x1Cu);
    }

    v21 = BCIMLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_26;
    }
    int v43 = 67109120;
    LODWORD(v44) = v18;
    unsigned __int8 v22 = "@\"_touchUpParse: %d\"";
LABEL_18:
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v43, 8u);
LABEL_26:
  }
LABEL_29:

  return v18;
}

- (int)parse
{
  return [(BKEpubBookParser *)self parse:0];
}

- (void)tryEmbeddedHrefForCoverArtHref:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    id v5 = v4;
    unsigned int v6 = [(BKBookParser *)self book];
    v7 = [v6 bookContentSubpath];
    id v8 = [v7 length];

    unsigned __int8 v9 = v5;
    if (v8)
    {
      v10 = [(BKBookParser *)self book];
      v11 = [v10 bookContentSubpath];
      unsigned __int8 v9 = [v11 stringByAppendingPathComponent:v5];
    }
    id v12 = [(BKBookParser *)self book];
    [v12 setEmbeddedArtHref:v9];

    v13 = [(BKBookParser *)self book];
    [v13 setEmbeddedArtHrefRejected:0];

    id v4 = v14;
  }
}

- (void)constructBKProtectionInfoWithReadable:(BKReadableFormat *)a3
{
  if (!a3) {
    return;
  }
  id v21 = [(BKBookParser *)self book];
  id v5 = [v21 sinfInfo];
  unsigned int v6 = [v5 allObjects];
  id v7 = [v6 count];

  if (v7)
  {
    id v22 = [(BKBookParser *)self book];
    id v8 = [(BKBookParser *)self book];
    unsigned __int8 v9 = [v8 sinfInfo];
    [v22 removeSinfInfo:v9];
  }
  if (self->_illegalEncryptionAlgorithm)
  {
    v10 = [(BKBookParser *)self book];
    v23 = [v10 managedObjectContext];

    v20 = +[BKProtectionInfo newEmptyProtectionInfo:v23];
    id v11 = [objc_alloc((Class)NSNumber) initWithInt:0xFFFFFFFFLL];
    [(__CFDictionary *)v20 setSinfNumber:v11];
    id v12 = [(BKBookParser *)self book];
    [v12 addSinfInfoObject:v20];
  }
  else
  {
    v23 = a3->var17;
    v20 = a3->var16;
    if (!v20) {
      goto LABEL_7;
    }
    v13 = [(BKBookParser *)self book];
    id v11 = [v13 managedObjectContext];

    id v12 = [(__CFDictionary *)v23 keyEnumerator];
    for (i = 0; ; i = v15)
    {
      v15 = [v12 nextObject];

      if (!v15) {
        break;
      }
      v16 = [(__CFDictionary *)v23 objectForKey:v15];
      id v17 = +[BKProtectionInfo newEmptyProtectionInfo:v11];
      id v18 = [objc_alloc((Class)NSNumber) initWithInt:[v15 intValue]];
      [v17 setSinfNumber:v18];
      [v17 setSinfBlob:v16];
      v19 = [(BKBookParser *)self book];
      [v19 addSinfInfoObject:v17];
    }
  }

LABEL_7:
}

- (BOOL)isLegalEncryption:(id)a3
{
  id v3 = (char *)a3;
  id v4 = v3;
  if (!v3
    || ([v3 rangeOfString:@".apple.com"], v5)
    || ([v4 rangeOfString:BEAdobeFontManglingAlgorithm], v6)
    || ([v4 rangeOfString:BEIDPFFontManglingAlgorithm], v7))
  {
    BOOL v8 = 1;
  }
  else
  {
    v10 = BCIMLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315650;
      v13 = "-[BKEpubBookParser isLegalEncryption:]";
      __int16 v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      __int16 v16 = 1024;
      int v17 = 462;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v12, 0x1Cu);
    }

    id v11 = BCIMLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "@\"***** Unrecognized Encryption Algorithm: %@\"", (uint8_t *)&v12, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isLegalCompression:(id)a3
{
  id v3 = (char *)a3;
  if ([v3 length] && (objc_msgSend(v3, "isEqualToString:", @"none") & 1) == 0)
  {
    uint64_t v5 = BCIMLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315650;
      unsigned __int8 v9 = "-[BKEpubBookParser isLegalCompression:]";
      __int16 v10 = 2080;
      id v11 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKEpubBookParser.mm";
      __int16 v12 = 1024;
      int v13 = 483;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v8, 0x1Cu);
    }

    uint64_t v6 = BCIMLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      unsigned __int8 v9 = v3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"***** Unrecognized Compression Algorithm: %@\"", (uint8_t *)&v8, 0xCu);
    }

    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)mediaOverlayHrefForManifestInfo:(__CFDictionary *)a3 readable:(BKReadableFormat *)a4
{
  Value = CFDictionaryGetValue(a3, @"media-overlay");
  if (Value
    && (CFDictionaryRef v6 = (const __CFDictionary *)(*((uint64_t (**)(BKReadableFormat *, const void *))a4->var0 + 6))(a4, Value)) != 0)
  {
    CFDictionaryRef v7 = v6;
    int v8 = CFDictionaryGetValue(v6, @"unescaped_href");
    unsigned __int8 v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 stringByRemovingPercentEncoding];
      id v11 = (void *)v10;
      if (v10) {
        __int16 v12 = (void *)v10;
      }
      else {
        __int16 v12 = v9;
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)constructBKDocumentWithReadable:(BKReadableFormat *)a3 chapters:(id)a4 landmarks:(id)a5 physicalPages:(id)a6
{
  id v56 = a4;
  id v55 = a5;
  id v54 = a6;
  v66 = a3;
  if (!a3) {
    goto LABEL_48;
  }
  uint64_t v10 = [(BKBookParser *)self book];
  v61 = [v10 managedObjectContext];

  LODWORD(v10) = (*((uint64_t (**)(BKReadableFormat *))a3->var0 + 4))(a3);
  v65 = a3->var16;
  id v60 = [objc_alloc((Class)NSNumber) initWithInt:0xFFFFFFFFLL];
  id v58 = [objc_alloc((Class)NSNumber) initWithBool:1];
  id v51 = [objc_alloc((Class)NSNumber) initWithBool:0];
  id v52 = [objc_alloc((Class)NSNumber) initWithBool:1];
  id v63 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v10];
  id v53 = objc_alloc_init((Class)NSMutableDictionary);
  __int16 v12 = [(BKBookParser *)self book];
  context = v11;
  id v59 = [v12 databaseKey];

  uint64_t v13 = (v10 - 1);
  while (v13 != -1)
  {
    CFDictionaryRef v14 = (const __CFDictionary *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v66->var0 + 5))(v66, v13);
    Value = (void *)CFDictionaryGetValue(v14, @"unescaped_href");
    if (v65)
    {
      __int16 v16 = [(__CFDictionary *)v65 objectForKey:Value];
      int v17 = v16;
      if (v16)
      {
        id v18 = [v16 objectForKey:@"encryptionAlgorithm"];
        v19 = [v17 objectForKey:@"compressionAlgorithm"];
        if (![(BKEpubBookParser *)self isLegalEncryption:v18]
          || ![(BKEpubBookParser *)self isLegalCompression:v19])
        {
          self->_BOOL illegalEncryptionAlgorithm = 1;
        }
      }
    }
    else
    {
      int v17 = 0;
    }
    if (self->_illegalEncryptionAlgorithm)
    {
      if (!v14) {
        goto LABEL_23;
      }
    }
    else
    {
      unsigned __int8 v64 = [(BKEpubBookParser *)self mediaOverlayHrefForManifestInfo:v14 readable:v66];
      id v20 = +[BKDocument newEmptyDocument:v61];
      uint64_t v21 = [Value stringByRemovingPercentEncoding];
      v62 = (void *)v21;
      if (v21) {
        id v22 = (void *)v21;
      }
      else {
        id v22 = Value;
      }
      [v20 setHref:v22];
      [v20 setMediaOverlayHref:v64];
      [v20 setMime:CFDictionaryGetValue(v14, @"media-type")];
      [v20 setManifestId:CFDictionaryGetValue(v14, @"id")];
      [v20 setFallbackId:CFDictionaryGetValue(v14, @"fallback")];
      [v20 setManifestProperties:CFDictionaryGetValue(v14, @"properties")];
      [v20 setDocumentOrdinal:v60];
      [v20 setBookDatabaseKey:v59];
      if (v17)
      {
        v57 = [v17 objectForKey:@"encryptionAlgorithm"];
        v23 = [v17 objectForKey:@"compressionAlgorithm"];
        v24 = [v17 objectForKey:@"fairplay-id"];
        if (v24)
        {
          id v25 = [objc_alloc((Class)NSNumber) initWithInt:[v24 intValue]];
          [v20 setSinfNumber:v25];
        }
        [v20 setCompressionAlgorithm:v23];
        [v20 setEncryptionAlgorithm:v57];
      }
      [v63 setObject:v20 forKey:Value];

      if (!v14) {
        goto LABEL_23;
      }
    }
    CFRelease(v14);
LABEL_23:
    BOOL illegalEncryptionAlgorithm = self->_illegalEncryptionAlgorithm;

    uint64_t v13 = (v13 - 1);
    if (illegalEncryptionAlgorithm) {
      break;
    }
  }

  v27 = &objc_release_x26_ptr;
  if (!self->_illegalEncryptionAlgorithm)
  {
    int v28 = (*((uint64_t (**)(BKReadableFormat *))v66->var0 + 7))(v66);
    if (v28)
    {
      uint64_t v29 = (v28 - 1);
      do
      {
        BOOL v30 = (void *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v66->var0 + 8))(v66, v29);
        if ([v30 length])
        {
          id v31 = [objc_alloc((Class)v27[484]) initWithInt:v29];
          v32 = [v63 objectForKey:v30];
          id v33 = [v32 documentOrdinal];
          id v34 = [v33 integerValue];

          if (v34 != (id)-1)
          {
            v35 = +[BKDocument documentKeyWithHref:v30 documentOrdinal:v31];
            int v36 = [v63 objectForKey:v35];

            if (!v36)
            {
              v37 = [v53 objectForKey:v30];
              if (!v37)
              {
                unsigned __int8 v38 = +[NSMutableArray array];
                [v53 setObject:v38 forKey:v30];
                v37 = v38;
                [v38 addObject:v30];
              }
              [v37 addObject:v35];
              id v39 = +[BKDocument newEmptyDocument:v61];
              [v39 copyPropertiesFrom:v32];
              v40 = +[NSNumber numberWithBool:0];
              [v39 setNonlinearElement:v40];

              [v63 setObject:v39 forKey:v35];
              v32 = v39;
              v27 = &objc_release_x26_ptr;
            }
          }
          if (v32)
          {
            [v32 setDocumentOrdinal:v31];
            CFBooleanRef v41 = (const __CFBoolean *)(*((uint64_t (**)(BKReadableFormat *, uint64_t))v66->var0 + 9))(v66, v29);
            CFBooleanRef v42 = v41;
            if (v41)
            {
              if (!CFBooleanGetValue(v41)) {
                [v32 setNonlinearElement:v52];
              }
              CFRelease(v42);
            }
            int v43 = [v56 objectForKey:v30];

            if (v43) {
              [v32 setHasTocElements:v58];
            }
            v44 = [v55 objectForKey:v30];

            if (v44) {
              [v32 setHasLandmarkElements:v58];
            }
            __int16 v45 = [v54 objectForKey:v30];

            if (v45) {
              [v32 setHasPhysicalElements:v58];
            }
          }

          BOOL v30 = 0;
        }

        uint64_t v29 = (v29 - 1);
      }
      while (v29 != -1);
    }
  }
  id v46 = [v53 allValues];
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_A41B0;
  v67[3] = &unk_1DCF98;
  id v47 = v63;
  id v68 = v47;
  id v48 = v51;
  id v69 = v48;
  id v49 = v58;
  id v70 = v49;
  [v46 enumerateObjectsUsingBlock:v67];

LABEL_48:
}

- (int)constructEntity:(id)a3 withNavPoint:(void *)a4 absoluteOrder:(int)a5 indentationLevel:(int)a6 withAnchorInfo:(id)a7 createdObjects:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  unsigned int v45 = a5;
  if (a5 < 0)
  {
    uint64_t v24 = 0;
    uint64_t v25 = 0;
  }
  else
  {
    __int16 v16 = [(BKBookParser *)self book];
    uint64_t v17 = [v16 managedObjectContext];

    v40 = (void *)v17;
    id v18 = +[NSEntityDescription insertNewObjectForEntityForName:v13 inManagedObjectContext:v17];
    v19 = ITNavPoint::contentFileIncludingHash((ITNavPoint *)a4);
    id v39 = *((id *)a4 + 11);
    unsigned __int8 v38 = +[NSURL URLWithString:](NSURL, "URLWithString:");
    int v43 = [v38 path];
    id v20 = [(BKBookParser *)self book];
    uint64_t v21 = [v20 basePlusContentPath];

    v37 = (void *)v21;
    id v22 = +[NSString pathRelativeToContentBase:v21 forRelativePath:v19 startingFromAbsoluteFolderPath:v43];

    CFBooleanRef v42 = v22;
    CFBooleanRef v41 = [v22 stringByRemovingPercentEncoding];
    if ([v41 length]) {
      [v18 setValue:v41 forKey:@"href"];
    }
    v44 = [v22 stringByRemovingURLFragment];
    if ([v44 length])
    {
      [v18 setValue:v44 forKey:@"baseHref"];
      v23 = +[NSNumber numberWithBool:1];
      [v14 setObject:v23 forKey:v44];
    }
    else
    {
      [v18 setValue:&stru_1DF0D8 forKey:@"baseHref"];
    }
    v26 = (__CFString *)*((id *)a4 + 10);
    if (![(__CFString *)v26 length])
    {

      v26 = &stru_1DF0D8;
    }
    [v18 setValue:v26 forKey:@"name"];
    v27 = (__CFString *)*((id *)a4 + 12);
    if (![(__CFString *)v27 length])
    {

      v27 = &stru_1DF0D8;
    }
    [v18 setValue:v27 forKey:@"htmlName"];
    int v28 = +[NSNumber numberWithInt:a6];
    [v18 setValue:v28 forKey:@"indentationLevel"];

    uint64_t v29 = +[NSNumber numberWithInt:v45];
    [v18 setValue:v29 forKey:@"absoluteOrder"];

    id v30 = *((id *)a4 + 7);
    if ([v30 length]) {
      [v18 setValue:v30 forKey:@"type"];
    }
    [v15 addObject:v18];
    uint64_t v24 = (a6 + 1);

    uint64_t v25 = v45 + 1;
  }
  uint64_t v31 = *((void *)a4 + 3) - *((void *)a4 + 2);
  if (v31)
  {
    uint64_t v32 = 0;
    unint64_t v33 = v31 >> 3;
    if (v33 <= 1) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = v33;
    }
    do
    {
      uint64_t v35 = ITNavPoint::childAtIndex((ITNavPoint *)a4);
      if (v35) {
        uint64_t v25 = [(BKEpubBookParser *)self constructEntity:v13 withNavPoint:v35 absoluteOrder:v25 indentationLevel:v24 withAnchorInfo:v14 createdObjects:v15];
      }
      ++v32;
    }
    while (v34 != v32);
  }

  return v25;
}

- (void)constructBKNavigationInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  id v10 = a4;
  if (a3)
  {
    var13 = a3->var13;
    if (var13)
    {
      int v8 = objc_opt_new();
      [(BKEpubBookParser *)self constructEntity:@"BKNavigationInfo" withNavPoint:var13 absoluteOrder:0xFFFFFFFFLL indentationLevel:0xFFFFFFFFLL withAnchorInfo:v10 createdObjects:v8];
      unsigned __int8 v9 = [(BKBookParser *)self book];
      [v9 addChapters:v8];
    }
  }
}

- (void)constructBKLandmarkInfoWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  id v10 = a4;
  if (a3)
  {
    var14 = a3->var14;
    if (var14)
    {
      int v8 = objc_opt_new();
      [(BKEpubBookParser *)self constructEntity:@"BKLandmarkInfo" withNavPoint:var14 absoluteOrder:0xFFFFFFFFLL indentationLevel:0xFFFFFFFFLL withAnchorInfo:v10 createdObjects:v8];
      unsigned __int8 v9 = [(BKBookParser *)self book];
      [v9 addLandmarks:v8];
    }
  }
}

- (void)constructBKPhysicalPageWithReadable:(BKReadableFormat *)a3 withAnchorInfo:(id)a4
{
  id v10 = a4;
  if (a3)
  {
    var15 = a3->var15;
    if (var15)
    {
      int v8 = objc_opt_new();
      [(BKEpubBookParser *)self constructEntity:@"BKPhysicalPage" withNavPoint:var15 absoluteOrder:0xFFFFFFFFLL indentationLevel:0xFFFFFFFFLL withAnchorInfo:v10 createdObjects:v8];
      unsigned __int8 v9 = [(BKBookParser *)self book];
      [v9 addPhysicalPages:v8];
    }
  }
}

+ (id)bookExtraInfoCacheDirectory
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 lastObject];

  BOOL v4 = [v3 stringByAppendingPathComponent:@"BookCachedData"];

  return v4;
}

- (id)createBookExtraInfoCacheDirectoryIfNecessary
{
  v2 = [(id)objc_opt_class() bookExtraInfoCacheDirectory];
  id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
  BOOL v4 = +[NSFileManager defaultManager];
  uint64_t v5 = [v3 relativePath];
  [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  return v2;
}

+ (id)bookCachedDataPathForBookWithKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 bookExtraInfoCacheDirectory];
  CFDictionaryRef v6 = [v4 stringByAppendingPathExtension:@"plist"];
  CFDictionaryRef v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (void)constructBKIdCfiMappingsWithEpub:(void *)a3
{
  uint64_t v4 = (*(uint64_t (**)(void *, SEL))(*(void *)a3 + 176))(a3, a2);
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    id v6 = [(BKEpubBookParser *)self createBookExtraInfoCacheDirectoryIfNecessary];
    CFDictionaryRef v7 = objc_opt_class();
    int v8 = [(BKBookParser *)self book];
    unsigned __int8 v9 = [v8 databaseKey];
    id v10 = [v7 bookCachedDataPathForBookWithKey:v9];

    CFStringRef v15 = @"tocCfiIdMap";
    __int16 v16 = v5;
    id v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v14 = 0;
    __int16 v12 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:200 options:0 error:&v14];
    id v13 = v14;
    if (v12) {
      [v12 writeToFile:v10 atomically:1];
    }
    CFRelease(v5);
  }
}

+ (id)cachedDataForBookDatabaseKey:(id)a3 cacheKey:(id)a4
{
  id v6 = a4;
  CFDictionaryRef v7 = [a1 bookCachedDataPathForBookWithKey:a3];
  int v8 = +[NSDictionary dictionaryWithContentsOfFile:v7];
  unsigned __int8 v9 = [v8 objectForKey:v6];

  return v9;
}

+ (CGSize)_computeFixedLayoutDimensionsFrom:(id)a3 forBook:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  if (v5)
  {
    unsigned __int8 v9 = [v5 sinfNumber];
    if (v9)
    {
      id v10 = [v5 sinfNumber];
      int v11 = [v10 intValue];

      if (v11 < 1)
      {
        unsigned __int8 v9 = 0;
      }
      else
      {
        __int16 v12 = [v5 sinfNumber];
        id v13 = +[NSPredicate predicateWithFormat:@"sinfNumber ==[n] %@", v12];

        id v14 = [v6 sinfInfo];
        CFStringRef v15 = [v14 filteredSetUsingPredicate:v13];

        if ([v15 count] == (char *)&dword_0 + 1)
        {
          unsigned __int8 v9 = [v15 anyObject];
        }
        else
        {
          __int16 v16 = [v6 bookBundlePath];
          +[NSException raise:@"NSIllegalState", @"Book sinf information appears invalid: %@", v16 format];

          unsigned __int8 v9 = 0;
        }
      }
    }
    uint64_t v17 = [v6 bookBundlePath];
    id v18 = [v6 bookContentSubpath];
    id v19 = [v18 length];

    if (v19)
    {
      id v20 = [v6 bookContentSubpath];
      uint64_t v21 = [v17 stringByAppendingPathComponent:v20];
    }
    else
    {
      uint64_t v21 = v17;
    }
    id v22 = [v5 href];
    v23 = [v21 stringByAppendingPathComponent:v22];

    char v38 = 0;
    uint64_t v25 = [v9 sinfBlob];
    id v37 = 0;
    v26 = +[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:v23 sinfData:v25 refetch:&v38 error:&v37];
    id v27 = v37;

    if (v26)
    {
      if ([(ITEpubFixedLayoutParser *)v26 length])
      {
        uint64_t v29 = ITEpubFixedLayoutParser::dimensionsFromData(v26, v28);
        int v30 = v29;
        if (v29 <= 0)
        {
          unint64_t v33 = _ITEpubParsingLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "Width read from decrypted data is 0 for fixed layout.", buf, 2u);
          }
        }
        else
        {
          double width = (double)SHIDWORD(v29);
        }
        if (v30 > 0)
        {
          double height = (double)v30;
LABEL_29:

          goto LABEL_30;
        }
        uint64_t v31 = _ITEpubParsingLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v32 = "Height read from decrypted data is 0 for fixed layout.";
          goto LABEL_27;
        }
LABEL_28:

        goto LABEL_29;
      }
      uint64_t v31 = _ITEpubParsingLog();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      uint64_t v32 = "Decrypted data length is 0. Cannot read fixed layout size from it.";
    }
    else
    {
      uint64_t v31 = _ITEpubParsingLog();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      uint64_t v32 = "Decrypted data is nil";
    }
LABEL_27:
    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_28;
  }
LABEL_30:

  double v34 = width;
  double v35 = height;
  result.double height = v35;
  result.double width = v34;
  return result;
}

+ (BOOL)recomputeFixedLayoutDimensionsForBook:(id)a3
{
  id v52 = a3;
  if ([v52 isFixedLayout])
  {
    if ((BEAlwaysFullParseEPUB() & 1) == 0)
    {
      id v3 = [v52 hasComputedFixedLayoutSize];
      if ([v3 BOOLValue])
      {
        uint64_t v4 = [v52 isDirty];
        unsigned int v5 = [v4 BOOLValue];

        if (!v5) {
          goto LABEL_45;
        }
      }
      else
      {
      }
    }
    id v6 = [v52 firstDocumentLocation];
    CFDictionaryRef v7 = [v52 documentContainingLocation:v6];
    [a1 _computeFixedLayoutDimensionsFrom:v7 forBook:v52];
    double v9 = v8;
    double v11 = v10;

    BOOL v12 = v9 == CGSizeZero.width;
    BOOL v13 = v11 == CGSizeZero.height;
    if (v12 && v13) {
      double v11 = 768.0;
    }
    long long v53 = 0u;
    long long v54 = 0u;
    if (v12 && v13) {
      double v9 = 1024.0;
    }
    long long v55 = 0uLL;
    long long v56 = 0uLL;
    id obj = [v52 sortedDocuments];
    id v14 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (!v14)
    {
      uint64_t v49 = 0;
      goto LABEL_44;
    }
    uint64_t v49 = 0;
    uint64_t v16 = *(void *)v54;
    *(void *)&long long v15 = 138412802;
    long long v48 = v15;
    while (1)
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v54 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v17);
        [a1 _computeFixedLayoutDimensionsFrom:v18 forBook:v52];
        double v21 = v19;
        double v22 = v20;
        if (v19 == CGSizeZero.width && v20 == CGSizeZero.height)
        {
          CFDataRef v28 = [v18 href];
          uint64_t v29 = [v52 tocPageHref];
          unsigned int v30 = [v28 isEqualToString:v29];

          if (v30)
          {
            uint64_t v31 = _ITEpubParsingLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v32 = [v18 href];
              v66.double width = v9;
              v66.double height = v11;
              unint64_t v33 = NSStringFromCGSize(v66);
              *(_DWORD *)buf = 138412546;
              id v58 = v32;
              __int16 v59 = 2112;
              id v60 = v33;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_ERROR, "Book document (%@) size computed from epub was 0, setting size to %@ and ignoring error because it's the TOC.", buf, 0x16u);
            }
          }
          else
          {
            double v34 = _ITEpubParsingLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              double v35 = [v18 href];
              v67.double width = v9;
              v67.double height = v11;
              int v36 = NSStringFromCGSize(v67);
              *(_DWORD *)buf = 138412546;
              id v58 = v35;
              __int16 v59 = 2112;
              id v60 = v36;
              _os_log_impl(&dword_0, v34, OS_LOG_TYPE_ERROR, "Book document (%@) size computed from epub was 0, setting size to %@ and marking book info as dirty.", buf, 0x16u);
            }
            ++v49;
          }
          double v22 = v11;
          double v21 = v9;
        }
        else
        {
          if (v20 == 0.0)
          {
            uint64_t v24 = _ITEpubParsingLog();
            double v22 = round(v11 * (v21 / v9));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [v18 href];
              v64.double width = v21;
              v64.double height = v22;
              NSStringFromCGSize(v64);
              id v26 = (id)objc_claimAutoreleasedReturnValue();
              v65.double width = v9;
              v65.double height = v11;
              id v27 = NSStringFromCGSize(v65);
              *(_DWORD *)buf = v48;
              id v58 = v25;
              __int16 v59 = 2114;
              id v60 = v26;
              __int16 v61 = 2114;
              v62 = v27;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "Book document (%@) height computed from epub was 0, using %{public}@ based on aspect ratio of previous size %{public}@.", buf, 0x20u);
            }
LABEL_23:

            goto LABEL_32;
          }
          if (v19 == 0.0)
          {
            uint64_t v24 = _ITEpubParsingLog();
            double v21 = round(v9 * (v22 / v11));
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              CFBooleanRef v42 = [v18 href];
              v69.double width = v21;
              v69.double height = v22;
              NSStringFromCGSize(v69);
              id v43 = (id)objc_claimAutoreleasedReturnValue();
              v70.double width = v9;
              v70.double height = v11;
              v44 = NSStringFromCGSize(v70);
              *(_DWORD *)buf = v48;
              id v58 = v42;
              __int16 v59 = 2114;
              id v60 = v43;
              __int16 v61 = 2114;
              v62 = v44;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "Book document (%@) width computed from epub was 0, using %{public}@ based on aspect ratio of previous size %{public}@.", buf, 0x20u);
            }
            goto LABEL_23;
          }
          double v11 = v20;
          double v9 = v19;
        }
LABEL_32:
        id v37 = _ITEpubParsingLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          char v38 = [v18 href];
          v68.double width = v21;
          v68.double height = v22;
          id v39 = NSStringFromCGSize(v68);
          *(_DWORD *)buf = 138412546;
          id v58 = v38;
          __int16 v59 = 2114;
          id v60 = v39;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Book document (%@) validated size: %{public}@", buf, 0x16u);
        }
        v40 = +[NSNumber numberWithDouble:v21];
        [v18 setFixedLayoutWidth:v40];

        CFBooleanRef v41 = +[NSNumber numberWithDouble:v22];
        [v18 setFixedLayoutHeight:v41];

        uint64_t v17 = (char *)v17 + 1;
      }
      while (v14 != v17);
      id v45 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      id v14 = v45;
      if (!v45)
      {
LABEL_44:

        id v46 = +[NSNumber numberWithBool:v49 == 0];
        [v52 setHasComputedFixedLayoutSize:v46];

        break;
      }
    }
  }
LABEL_45:

  return 0;
}

- (void)setPublisherInfoFromParser:(BKReadableFormat *)a3
{
  var10 = a3->var10;
  if (var10)
  {
    CFRetain(var10);
    id v6 = a3->var10;
  }
  else
  {
    id v6 = 0;
  }
  CFDictionaryRef v7 = v6;
  double v8 = [(BKBookParser *)self book];
  double v9 = [v8 publisherName];
  if ([v9 length])
  {
    double v10 = [(BKBookParser *)self book];
    double v11 = [v10 publisherName];
    unsigned __int8 v12 = [(__CFString *)v7 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      BOOL v13 = _ITEpubParsingLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [(BKBookParser *)self book];
        long long v15 = [v14 publisherName];
        int v57 = 138544386;
        CFStringRef v58 = @"self.book.publisherName";
        __int16 v59 = 2160;
        uint64_t v60 = 1752392040;
        __int16 v61 = 2112;
        v62 = v7;
        __int16 v63 = 2160;
        uint64_t v64 = 1752392040;
        __int16 v65 = 2112;
        CGSize v66 = v15;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", (uint8_t *)&v57, 0x34u);
      }
    }
  }
  else
  {
  }
  uint64_t v16 = a3->var10;
  if (v16 && (CFRetain(v16), (uint64_t v17 = a3->var10) != 0))
  {
    id v18 = [(BKBookParser *)self book];
    [v18 setPublisherName:v17];
  }
  else
  {
    uint64_t v17 = [(BKBookParser *)self book];
    [v17 setPublisherName:0];
  }

  var11 = a3->var11;
  if (var11)
  {
    CFRetain(var11);
    double v20 = a3->var11;
  }
  else
  {
    double v20 = 0;
  }
  double v21 = v20;
  double v22 = [(BKBookParser *)self book];
  v23 = [v22 publisherLocation];
  if (![v23 length])
  {

LABEL_22:
    goto LABEL_23;
  }
  uint64_t v24 = [(BKBookParser *)self book];
  uint64_t v25 = [v24 publisherLocation];
  unsigned __int8 v26 = [(__CFString *)v21 isEqualToString:v25];

  if ((v26 & 1) == 0)
  {
    double v22 = _ITEpubParsingLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [(BKBookParser *)self book];
      CFDataRef v28 = [v27 publisherLocation];
      int v57 = 138544386;
      CFStringRef v58 = @"self.book.publisherLocation";
      __int16 v59 = 2160;
      uint64_t v60 = 1752392040;
      __int16 v61 = 2112;
      v62 = v21;
      __int16 v63 = 2160;
      uint64_t v64 = 1752392040;
      __int16 v65 = 2112;
      CGSize v66 = v28;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", (uint8_t *)&v57, 0x34u);
    }
    goto LABEL_22;
  }
LABEL_23:

  uint64_t v29 = a3->var11;
  if (v29 && (CFRetain(v29), (unsigned int v30 = a3->var11) != 0))
  {
    uint64_t v31 = [(BKBookParser *)self book];
    [v31 setPublisherLocation:v30];
  }
  else
  {
    unsigned int v30 = [(BKBookParser *)self book];
    [v30 setPublisherLocation:0];
  }

  var12 = a3->var12;
  if (var12)
  {
    CFRetain(var12);
    unint64_t v33 = a3->var12;
  }
  else
  {
    unint64_t v33 = 0;
  }
  double v34 = v33;
  double v35 = [(BKBookParser *)self book];
  int v36 = [v35 publisherYear];
  if (![v36 length])
  {

LABEL_35:
    goto LABEL_36;
  }
  id v37 = [(BKBookParser *)self book];
  char v38 = [v37 publisherYear];
  unsigned __int8 v39 = [(__CFString *)v34 isEqualToString:v38];

  if ((v39 & 1) == 0)
  {
    double v35 = _ITEpubParsingLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v40 = [(BKBookParser *)self book];
      CFBooleanRef v41 = [v40 publisherYear];
      int v57 = 138544386;
      CFStringRef v58 = @"self.book.publisherYear";
      __int16 v59 = 2160;
      uint64_t v60 = 1752392040;
      __int16 v61 = 2112;
      v62 = v34;
      __int16 v63 = 2160;
      uint64_t v64 = 1752392040;
      __int16 v65 = 2112;
      CGSize v66 = v41;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "\"Parsed value for '%{public}@': '%{mask.hash}@' != current stored value: '%{mask.hash}@'\"", (uint8_t *)&v57, 0x34u);
    }
    goto LABEL_35;
  }
LABEL_36:

  CFBooleanRef v42 = a3->var12;
  if (v42 && (CFRetain(v42), (id v43 = a3->var12) != 0))
  {
    v44 = [(BKBookParser *)self book];
    [v44 setPublisherYear:v43];
  }
  else
  {
    id v43 = [(BKBookParser *)self book];
    [v43 setPublisherYear:0];
  }

  id v45 = [(BKBookParser *)self book];
  id v46 = [v45 publisherName];
  BOOL v47 = v46 == 0;

  if (v47)
  {
    long long v48 = [(BKBookParser *)self book];
    [v48 setPublisherName:&stru_1DF0D8];
  }
  uint64_t v49 = [(BKBookParser *)self book];
  v50 = [v49 publisherLocation];
  BOOL v51 = v50 == 0;

  if (v51)
  {
    id v52 = [(BKBookParser *)self book];
    [v52 setPublisherLocation:&stru_1DF0D8];
  }
  long long v53 = [(BKBookParser *)self book];
  long long v54 = [v53 publisherYear];
  BOOL v55 = v54 == 0;

  if (v55)
  {
    long long v56 = [(BKBookParser *)self book];
    [v56 setPublisherYear:&stru_1DF0D8];
  }
}

- (void)setAppleDisplayOptionsFromParser:(BKReadableFormat *)a3
{
  unsigned int v5 = [(BKBookParser *)self book];

  if (!v5) {
    return;
  }
  (*((void (**)(BKReadableFormat *))a3->var0 + 14))(a3);
  id v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_opt_class();
    id v6 = [v34 valueForKey:@"fixed-layout"];
    CFDictionaryRef v7 = BUDynamicCast();

    if ([v7 isEqualToString:@"true"])
    {
      double v8 = [(BKBookParser *)self book];
      [v8 setFixedLayout:1];
    }
    double v9 = [v34 valueForKey:@"interactive"];
    unsigned int v10 = [v9 isEqualToString:@"true"];

    if (v10)
    {
      double v11 = [(BKBookParser *)self book];
      [v11 setInteractive:1];
    }
    objc_opt_class();
    unsigned __int8 v12 = [v34 valueForKey:@"specified-fonts"];
    BOOL v13 = BUDynamicCast();

    if ([v13 isEqualToString:@"true"])
    {
      id v14 = [(BKBookParser *)self book];
      [v14 setHasBuiltInFonts:1];
    }
    objc_opt_class();
    long long v15 = [v34 valueForKey:@"binding"];
    uint64_t v16 = BUDynamicCast();

    if ([v16 isEqualToString:@"false"])
    {
      uint64_t v17 = [(BKBookParser *)self book];
      [v17 setHidesSpine:1];
    }
    objc_opt_class();
    id v18 = [v34 valueForKey:@"spread"];
    double v19 = BUDynamicCast();
    double v20 = [(BKBookParser *)self book];
    [v20 setFixedLayoutSpread:v19];

    objc_opt_class();
    double v21 = [v34 valueForKey:@"flow"];
    double v22 = BUDynamicCast();
    v23 = [(BKBookParser *)self book];
    [v23 setFixedLayoutFlow:v22];

    objc_opt_class();
    uint64_t v24 = [v34 valueForKey:@"open-to-spread"];
    uint64_t v25 = BUDynamicCast();

    if (v25)
    {
      if ([v25 isEqualToString:@"true"])
      {
        unsigned __int8 v26 = [(BKBookParser *)self book];
        [v26 setOpenToSpread:1];
      }
      else
      {
        unsigned __int8 v26 = [(BKBookParser *)self book];
        [v26 setOpenToSpread:0];
      }
    }
    else
    {
      unsigned __int8 v26 = [(BKBookParser *)self book];
      [v26 setOpenToSpread:0x7FFFFFFFFFFFFFFFLL];
    }

    objc_opt_class();
    id v27 = [v34 valueForKey:@"orientation-lock"];
    CFDataRef v28 = BUDynamicCast();

    if (!v28) {
      goto LABEL_23;
    }
    if ([v28 isEqualToString:@"portrait-only"])
    {
      uint64_t v29 = [(BKBookParser *)self book];
      [v29 setLandscapeProhibited:1];
    }
    else
    {
      if (![v28 isEqualToString:@"landscape-only"])
      {
LABEL_23:
        objc_opt_class();
        unsigned int v30 = [v34 valueForKey:@"respect-image-size-class"];
        uint64_t v31 = BUDynamicCast();

        if ([v31 length])
        {
          uint64_t v32 = [(BKBookParser *)self book];
          [v32 setRespectImageSizeClass:v31];

          unint64_t v33 = [(BKBookParser *)self book];
          [v33 setRespectImageSizeClassIsPrefix:0];
        }
        goto LABEL_26;
      }
      uint64_t v29 = [(BKBookParser *)self book];
      [v29 setPortraitProhibited:1];
    }

    goto LABEL_23;
  }
LABEL_26:
}

- (void)setObeyPageBreaksFromPlist:(id)a3
{
  id v6 = [a3 valueForKey:@"obeyPageBreaks"];
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    id v4 = [v6 BOOLValue];
  }
  else {
    id v4 = &dword_0 + 1;
  }
  unsigned int v5 = [(BKBookParser *)self book];
  [v5 setObeyPageBreaks:v4];
}

- (void)setArtworkTemplateFromPlist:(id)a3
{
  id v7 = [a3 valueForKey:@"artwork-template-name"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v7;
LABEL_5:
    unsigned int v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v7 stringValue];
    goto LABEL_5;
  }
  unsigned int v5 = 0;
LABEL_7:
  if ([v5 length])
  {
    id v6 = [(BKBookParser *)self book];
    [v6 setGenericCoverTemplate:v5];
  }
}

- (void)setLanguageFromPlist:(id)a3
{
  id v5 = +[IMLibraryPlist languageFromPlistEntry:a3];
  if (v5)
  {
    id v4 = [(BKBookParser *)self book];
    [v4 setBookLanguage:v5];
  }
}

- (void)setCoverWritingModeFromPlist:(id)a3
{
  uint64_t v4 = +[IMLibraryPlist coverWritingModeFromPlistEntry:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = (uint64_t)[(id)v4 imIsDefaultWritingMode];
    uint64_t v5 = v7;
    if ((v4 & 1) == 0)
    {
      id v6 = [(BKBookParser *)self book];
      [v6 setCoverWritingModeString:v7];

      uint64_t v5 = v7;
    }
  }

  _objc_release_x1(v4, v5);
}

- (void)setScrollAxisModeFromPlist:(id)a3
{
  id v5 = +[IMLibraryPlist scrollDirectionFromPlistEntry:a3];
  if (v5
    && (([v5 isEqualToString:@"horizontal"] & 1) != 0
     || [v5 isEqualToString:@"vertical"]))
  {
    uint64_t v4 = [(BKBookParser *)self book];
    [v4 setScrollDirection:v5];
  }
}

- (void)setEndOfBookExperienceFromPlist:(id)a3
{
  +[IMLibraryPlist endOfBookExperiencesFromItunesMetadataEntry:a3];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v22 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v25 = +[IMLibraryPlist experienceKindFromExperienceEntry:v4];
        if ([v25 isEqualToString:@"end-of-book"])
        {
          v23 = +[IMLibraryPlist experienceLocationFromExperienceEntry:v4];
          double v20 = +[IMLibraryPlist experienceLocationTypeFromExperienceEntry:v4];
          if ([v20 isEqualToString:@"cfi"])
          {
            id v5 = [(BKBookParser *)self book];
            [v5 setEndOfBookLocation:v23];

            id v6 = [(BKBookParser *)self book];
            [v6 setEndOfBookConfidence:&off_1E9728];

            uint64_t v7 = [(BKBookParser *)self book];
            [v7 setEndOfBookValidRange:0];
          }
          uint64_t v24 = +[IMLibraryPlist experienceVersionFromExperienceEntry:v4];
          double v8 = [(BKBookParser *)self book];
          [v8 setEndOfBookVersion:v24];

          double v9 = +[IMLibraryPlist experienceParamsFromExperienceEntry:v4];
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v10 = v9;
          id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v28;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v28 != v12) {
                  objc_enumerationMutation(v10);
                }
                id v14 = +[IMLibraryPlist experienceConfidenceFromExperienceParamEntry:*(void *)(*((void *)&v27 + 1) + 8 * (void)j)];
                long long v15 = v14;
                if (v14)
                {
                  [v14 floatValue];
                  if (*(float *)&v16 > 1.0) {
                    *(float *)&double v16 = 1.0;
                  }
                  if (*(float *)&v16 < 0.0) {
                    *(float *)&double v16 = 0.0;
                  }
                  uint64_t v17 = +[NSNumber numberWithFloat:v16];
                  id v18 = [(BKBookParser *)self book];
                  [v18 setEndOfBookConfidence:v17];
                }
              }
              id v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v11);
          }
        }
      }
      id v22 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v22);
  }
}

- (void)resetItunesMetadata
{
  id v3 = [(BKBookParser *)self book];
  uint64_t v4 = [v3 bookBundlePath];
  uint64_t v7 = [v4 stringByAppendingPathComponent:@"iTunesMetadata.plist"];

  if (v7)
  {
    id v6 = +[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:");
    if (v6)
    {
      [(BKEpubBookParser *)self setObeyPageBreaksFromPlist:v6];
      [(BKEpubBookParser *)self setArtworkTemplateFromPlist:v6];
      [(BKEpubBookParser *)self setLanguageFromPlist:v6];
      [(BKEpubBookParser *)self setCoverWritingModeFromPlist:v6];
      [(BKEpubBookParser *)self setScrollAxisModeFromPlist:v6];
      [(BKEpubBookParser *)self setEndOfBookExperienceFromPlist:v6];
    }
  }

  _objc_release_x2(v5);
}

+ (BOOL)isValidMimeType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (ITEpubFolder *)[v3 UTF8String];
  uint64_t v5 = (const char *)[v3 length];
  LOBYTE(v4) = ITEpubFolder::isMimetypeFileContentsValid(v4, v5, 0, 0, v6) != 0;

  return (char)v4;
}

@end
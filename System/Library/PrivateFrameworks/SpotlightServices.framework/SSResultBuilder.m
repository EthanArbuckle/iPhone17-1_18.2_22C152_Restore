@interface SSResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3;
+ (Class)resultBuilderClassForResult:(id)a3 preferAppVendedView:(BOOL)a4;
+ (id)bundleId;
+ (id)fetchAttributes;
+ (id)getCharacterIfWhitespaceAtIndex:(unint64_t)a3 ofString:(id)a4;
+ (id)resultBuilderForItem:(id)a3;
+ (id)resultBuilderWithResult:(id)a3;
+ (id)resultBuilderWithResult:(id)a3 preferAppVendedView:(BOOL)a4;
+ (id)richTextsFromStrings:(id)a3;
+ (id)stringForSFRichText:(id)a3;
+ (id)whiteSpaceCondensedStringForString:(id)a3;
+ (void)condenseWhiteSpaceForDescriptions:(id)a3;
+ (void)condenseWhiteSpaceForRichText:(id)a3;
+ (void)setDefaultSizeForThumbnail:(id)a3 isCompact:(BOOL)a4;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)buildPreventThumbnailImageScaling;
- (BOOL)buildSecondaryTitleIsDetached;
- (BOOL)hasTextContentMatch;
- (BOOL)isTopHit;
- (BOOL)supportsClearingBackendData;
- (NSArray)matchedStrings;
- (NSString)coreSpotlightId;
- (NSString)filePath;
- (NSString)relatedAppBundleIdentifier;
- (SFColor)backgroundColor;
- (SFSearchResult_SpotlightExtras)result;
- (SPSearchQueryContext)queryContext;
- (SSResultBuilder)initWithResult:(id)a3;
- (UTType)uniformType;
- (id)buildAction;
- (id)buildAppEntityAnnotation;
- (id)buildAppTopHitEntityCardSection;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildCompactCard;
- (id)buildCompactCardSection;
- (id)buildCompactCardSections;
- (id)buildDescriptions;
- (id)buildDetailedRowCardSection;
- (id)buildFootnote;
- (id)buildHighlightedMatchedTextWithTitle:(id)a3 headTruncation:(BOOL)a4;
- (id)buildHighlightedTextWithString:(id)a3 includeQuotes:(BOOL)a4;
- (id)buildHorizontallyScrollingCardSection;
- (id)buildInlineCard;
- (id)buildInlineCardSection;
- (id)buildInlineCardSections;
- (id)buildPreviewButtonItems;
- (id)buildPreviewCommand;
- (id)buildPunchouts;
- (id)buildResult;
- (id)buildSecondaryTitle;
- (id)buildSecondaryTitleImage;
- (id)buildThumbnail;
- (id)buildTitle;
- (id)buildTrailingBottomText;
- (id)buildTrailingMiddleText;
- (id)buildTrailingThumbnail;
- (id)buildTrailingTopText;
- (id)bundleIdentifierForAppIconBadgeImage;
- (id)resultAppBundleId;
- (unint64_t)numberOfLinesForDescriptions;
- (void)buildDefaultPropertiesForCardSection:(id)a3;
- (void)buildPunchouts;
- (void)setBackgroundColor:(id)a3;
- (void)setCoreSpotlightId:(id)a3;
- (void)setFilePath:(id)a3;
- (void)setHasTextContentMatch:(BOOL)a3;
- (void)setIsTopHit:(BOOL)a3;
- (void)setMatchedStrings:(id)a3;
- (void)setMaxLinesForDescriptions:(id)a3;
- (void)setQueryContext:(id)a3;
- (void)setRelatedAppBundleIdentifier:(id)a3;
- (void)setResult:(id)a3;
- (void)setUniformType:(id)a3;
@end

@implementation SSResultBuilder

+ (id)resultBuilderForItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleID];
  v5 = +[SSResultBuilder fetchAttributes];
  v6 = [v3 uniqueIdentifier];
  v7 = [v3 protection];
  v8 = [v3 attributeSet];
  v9 = [v8 attributeDictionary];
  v10 = (void *)[v9 mutableCopy];

  v11 = [v3 attributeSet];

  v12 = [v11 customAttributeDictionary];
  [v10 addEntriesFromDictionary:v12];

  v13 = [[SFSearchResult_SpotlightExtras alloc] initWithIdentifier:v6 bundleIdentifier:v4 protectionClass:v7 attributes:v10 type:2 completion:0];
  v14 = +[SSResultBuilder resultBuilderWithResult:v13];

  return v14;
}

+ (Class)resultBuilderClassForResult:(id)a3 preferAppVendedView:(BOOL)a4
{
  BOOL v4 = a4;
  v31[33] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v31[0] = objc_opt_class();
  v31[1] = objc_opt_class();
  v31[2] = objc_opt_class();
  v31[3] = objc_opt_class();
  v31[4] = objc_opt_class();
  v31[5] = objc_opt_class();
  v31[6] = objc_opt_class();
  v31[7] = objc_opt_class();
  v31[8] = objc_opt_class();
  v31[9] = objc_opt_class();
  v31[10] = objc_opt_class();
  v31[11] = objc_opt_class();
  v31[12] = objc_opt_class();
  v31[13] = objc_opt_class();
  v31[14] = objc_opt_class();
  v31[15] = objc_opt_class();
  v31[16] = objc_opt_class();
  v31[17] = objc_opt_class();
  v31[18] = objc_opt_class();
  v31[19] = objc_opt_class();
  v31[20] = objc_opt_class();
  v31[21] = objc_opt_class();
  v31[22] = objc_opt_class();
  v31[23] = objc_opt_class();
  v31[24] = objc_opt_class();
  v31[25] = objc_opt_class();
  v31[26] = objc_opt_class();
  v31[27] = objc_opt_class();
  v31[28] = objc_opt_class();
  v31[29] = objc_opt_class();
  v31[30] = objc_opt_class();
  v31[31] = objc_opt_class();
  v31[32] = objc_opt_class();
  [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:33];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      if (objc_msgSend(v11, "supportsResult:", v5, (void)v18))
      {
        if (v11 != objc_opt_class() || v4) {
          break;
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }

    if (v11) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  v11 = objc_opt_class();
LABEL_14:
  v12 = SSGeneralLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = [v5 contentType];
    v16 = (void *)v15;
    v17 = @"NO";
    *(_DWORD *)buf = 138478595;
    id v23 = v5;
    __int16 v24 = 2112;
    if (v4) {
      v17 = @"YES";
    }
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    v27 = v11;
    __int16 v28 = 2112;
    v29 = v17;
    _os_log_debug_impl(&dword_1BDB2A000, v12, OS_LOG_TYPE_DEBUG, "SSResultBuilder result: %{private}@ withContentType: %@ resolved to class: %@ preferringAppVendedView: %@", buf, 0x2Au);
  }
  v13 = v11;

  return v13;
}

+ (id)resultBuilderWithResult:(id)a3
{
  return (id)[a1 resultBuilderWithResult:a3 preferAppVendedView:1];
}

+ (id)resultBuilderWithResult:(id)a3 preferAppVendedView:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "resultBuilderClassForResult:preferAppVendedView:", v6, v4)), "initWithResult:", v6);

  return v7;
}

+ (id)fetchAttributes
{
  uint64_t v272 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F23578];
  v36[0] = *MEMORY[0x1E4F22A28];
  v36[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F23250];
  v36[2] = *MEMORY[0x1E4F23660];
  v36[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F232A0];
  v36[4] = *MEMORY[0x1E4F23260];
  v36[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F232F8];
  uint64_t v37 = *MEMORY[0x1E4F232E8];
  uint64_t v38 = v5;
  uint64_t v6 = *MEMORY[0x1E4F23340];
  uint64_t v39 = *MEMORY[0x1E4F23310];
  uint64_t v40 = v6;
  uint64_t v7 = *MEMORY[0x1E4F23218];
  uint64_t v41 = *MEMORY[0x1E4F23370];
  uint64_t v42 = v7;
  uint64_t v8 = *MEMORY[0x1E4F23220];
  uint64_t v43 = *MEMORY[0x1E4F23228];
  uint64_t v44 = v8;
  uint64_t v9 = *MEMORY[0x1E4F22A68];
  uint64_t v45 = *MEMORY[0x1E4F22A38];
  uint64_t v46 = v9;
  uint64_t v10 = *MEMORY[0x1E4F22AA8];
  uint64_t v47 = *MEMORY[0x1E4F22A78];
  uint64_t v48 = v10;
  uint64_t v11 = *MEMORY[0x1E4F22AC0];
  uint64_t v49 = *MEMORY[0x1E4F22AB0];
  uint64_t v50 = v11;
  uint64_t v12 = *MEMORY[0x1E4F22AC8];
  uint64_t v51 = *MEMORY[0x1E4F22AA0];
  uint64_t v52 = v12;
  uint64_t v13 = *MEMORY[0x1E4F22AD0];
  uint64_t v53 = *MEMORY[0x1E4F22AB8];
  uint64_t v54 = v13;
  uint64_t v14 = *MEMORY[0x1E4F22AE0];
  uint64_t v55 = *MEMORY[0x1E4F22AD8];
  uint64_t v56 = v14;
  uint64_t v15 = *MEMORY[0x1E4F22AF0];
  uint64_t v57 = *MEMORY[0x1E4F22AE8];
  uint64_t v58 = v15;
  uint64_t v16 = *MEMORY[0x1E4F22B10];
  uint64_t v59 = *MEMORY[0x1E4F22B00];
  uint64_t v60 = v16;
  uint64_t v17 = *MEMORY[0x1E4F22B30];
  uint64_t v61 = *MEMORY[0x1E4F22B18];
  uint64_t v62 = v17;
  uint64_t v18 = *MEMORY[0x1E4F22B70];
  uint64_t v63 = *MEMORY[0x1E4F22B40];
  uint64_t v64 = v18;
  uint64_t v19 = *MEMORY[0x1E4F22C10];
  uint64_t v65 = *MEMORY[0x1E4F22C00];
  uint64_t v66 = v19;
  uint64_t v20 = *MEMORY[0x1E4F22C38];
  uint64_t v67 = *MEMORY[0x1E4F22C28];
  uint64_t v68 = v20;
  uint64_t v21 = *MEMORY[0x1E4F22C48];
  uint64_t v69 = *MEMORY[0x1E4F22F30];
  uint64_t v70 = v21;
  uint64_t v22 = *MEMORY[0x1E4F22C68];
  uint64_t v71 = *MEMORY[0x1E4F22C60];
  uint64_t v72 = v22;
  uint64_t v23 = *MEMORY[0x1E4F22C78];
  uint64_t v73 = *MEMORY[0x1E4F22C70];
  uint64_t v74 = v23;
  uint64_t v24 = *MEMORY[0x1E4F22CD0];
  v75 = @"SSAttributeDefinitions";
  uint64_t v76 = v24;
  uint64_t v25 = *MEMORY[0x1E4F22D30];
  uint64_t v77 = *MEMORY[0x1E4F22CE8];
  uint64_t v78 = v25;
  uint64_t v26 = *MEMORY[0x1E4F22D58];
  uint64_t v79 = *MEMORY[0x1E4F22D38];
  uint64_t v80 = v26;
  uint64_t v27 = *MEMORY[0x1E4F22FB0];
  uint64_t v81 = *MEMORY[0x1E4F22F38];
  uint64_t v82 = v27;
  uint64_t v28 = *MEMORY[0x1E4F22FB8];
  uint64_t v83 = *MEMORY[0x1E4F22FA8];
  uint64_t v84 = v28;
  uint64_t v29 = *MEMORY[0x1E4F23020];
  uint64_t v85 = *MEMORY[0x1E4F22FD0];
  uint64_t v86 = v29;
  uint64_t v30 = *MEMORY[0x1E4F23060];
  v87 = @"SSAttributeCalculatorInput";
  uint64_t v88 = v30;
  uint64_t v89 = *MEMORY[0x1E4F23078];
  v90 = @"SSAttributeIsCalculation";
  uint64_t v31 = *MEMORY[0x1E4F230D0];
  v91 = @"SSAttributeIsCurrencyConversion";
  uint64_t v92 = v31;
  uint64_t v32 = *MEMORY[0x1E4F230F8];
  uint64_t v93 = *MEMORY[0x1E4F230F0];
  uint64_t v94 = v32;
  uint64_t v95 = *MEMORY[0x1E4F23128];
  uint64_t v96 = *MEMORY[0x1E4F23130];
  uint64_t v97 = *MEMORY[0x1E4F23160];
  uint64_t v98 = *MEMORY[0x1E4F23188];
  v99 = @"SSAttributeCalculatorOutput";
  uint64_t v100 = *MEMORY[0x1E4F23758];
  uint64_t v101 = *MEMORY[0x1E4F23200];
  uint64_t v102 = *MEMORY[0x1E4F23230];
  uint64_t v103 = *MEMORY[0x1E4F22D48];
  uint64_t v104 = *MEMORY[0x1E4F23408];
  uint64_t v105 = *MEMORY[0x1E4F23448];
  uint64_t v106 = *MEMORY[0x1E4F234B0];
  uint64_t v107 = *MEMORY[0x1E4F234A0];
  uint64_t v108 = *MEMORY[0x1E4F234A8];
  uint64_t v109 = *MEMORY[0x1E4F234D8];
  uint64_t v110 = *MEMORY[0x1E4F234D0];
  uint64_t v111 = *MEMORY[0x1E4F23528];
  uint64_t v112 = *MEMORY[0x1E4F23508];
  uint64_t v113 = *MEMORY[0x1E4F23530];
  uint64_t v114 = *MEMORY[0x1E4F23548];
  uint64_t v115 = *MEMORY[0x1E4F23560];
  uint64_t v116 = *MEMORY[0x1E4F23568];
  uint64_t v117 = *MEMORY[0x1E4F23538];
  uint64_t v118 = *MEMORY[0x1E4F23510];
  uint64_t v119 = *MEMORY[0x1E4F23558];
  uint64_t v120 = *MEMORY[0x1E4F23520];
  uint64_t v121 = *MEMORY[0x1E4F22B08];
  uint64_t v122 = *MEMORY[0x1E4F233C8];
  uint64_t v123 = *MEMORY[0x1E4F23598];
  uint64_t v124 = *MEMORY[0x1E4F235A0];
  uint64_t v125 = *MEMORY[0x1E4F235A8];
  uint64_t v126 = *MEMORY[0x1E4F235C0];
  uint64_t v33 = *MEMORY[0x1E4F235E8];
  v128 = @"SSAttributeTopMatchedStrings";
  uint64_t v129 = *MEMORY[0x1E4F23630];
  uint64_t v130 = *MEMORY[0x1E4F23638];
  uint64_t v131 = *MEMORY[0x1E4F23640];
  uint64_t v132 = *MEMORY[0x1E4F23648];
  uint64_t v133 = *MEMORY[0x1E4F22CB8];
  uint64_t v134 = *MEMORY[0x1E4F23658];
  uint64_t v135 = *MEMORY[0x1E4F23670];
  uint64_t v136 = *MEMORY[0x1E4F236A0];
  uint64_t v137 = *MEMORY[0x1E4F236A8];
  uint64_t v127 = v33;
  uint64_t v138 = *MEMORY[0x1E4F22FE8];
  uint64_t v139 = *MEMORY[0x1E4F230D8];
  uint64_t v140 = *MEMORY[0x1E4F22FD8];
  uint64_t v141 = v33;
  uint64_t v142 = *MEMORY[0x1E4F235E0];
  uint64_t v143 = *MEMORY[0x1E4F23688];
  uint64_t v144 = *MEMORY[0x1E4F22D28];
  uint64_t v145 = *MEMORY[0x1E4F22A50];
  uint64_t v146 = *MEMORY[0x1E4F22BE8];
  uint64_t v147 = *MEMORY[0x1E4F22C90];
  uint64_t v148 = *MEMORY[0x1E4F22C98];
  uint64_t v149 = *MEMORY[0x1E4F22B58];
  uint64_t v150 = v81;
  uint64_t v151 = *MEMORY[0x1E4F22FC8];
  uint64_t v152 = *MEMORY[0x1E4F22FE0];
  uint64_t v153 = *MEMORY[0x1E4F23068];
  uint64_t v154 = v37;
  uint64_t v155 = *MEMORY[0x1E4F233C0];
  uint64_t v156 = *MEMORY[0x1E4F233E0];
  uint64_t v157 = *MEMORY[0x1E4F23498];
  uint64_t v158 = v108;
  uint64_t v159 = v156;
  uint64_t v160 = v123;
  uint64_t v161 = *MEMORY[0x1E4F235B8];
  uint64_t v162 = v156;
  uint64_t v163 = *MEMORY[0x1E4F235F8];
  uint64_t v164 = *MEMORY[0x1E4F23150];
  uint64_t v165 = *MEMORY[0x1E4F23070];
  uint64_t v166 = *MEMORY[0x1E4F231F0];
  uint64_t v167 = *MEMORY[0x1E4F231F8];
  uint64_t v168 = *MEMORY[0x1E4F23760];
  uint64_t v169 = *MEMORY[0x1E4F23738];
  uint64_t v170 = *MEMORY[0x1E4F23730];
  uint64_t v171 = *MEMORY[0x1E4F23768];
  uint64_t v172 = *MEMORY[0x1E4F22F20];
  uint64_t v173 = *MEMORY[0x1E4F22E50];
  uint64_t v174 = *MEMORY[0x1E4F22E58];
  uint64_t v175 = *MEMORY[0x1E4F22E00];
  uint64_t v176 = *MEMORY[0x1E4F22DE8];
  uint64_t v177 = *MEMORY[0x1E4F22DF0];
  uint64_t v178 = *MEMORY[0x1E4F22DF8];
  uint64_t v179 = *MEMORY[0x1E4F22DD8];
  uint64_t v180 = *MEMORY[0x1E4F22E48];
  uint64_t v181 = *MEMORY[0x1E4F22DA8];
  uint64_t v182 = *MEMORY[0x1E4F22DC0];
  uint64_t v183 = *MEMORY[0x1E4F22E18];
  uint64_t v184 = *MEMORY[0x1E4F22E30];
  uint64_t v185 = *MEMORY[0x1E4F22E08];
  uint64_t v186 = *MEMORY[0x1E4F22DD0];
  uint64_t v187 = *MEMORY[0x1E4F22E40];
  uint64_t v188 = *MEMORY[0x1E4F22DA0];
  uint64_t v189 = *MEMORY[0x1E4F22DB8];
  uint64_t v190 = *MEMORY[0x1E4F22DC8];
  uint64_t v191 = *MEMORY[0x1E4F22DB0];
  uint64_t v192 = *MEMORY[0x1E4F22E10];
  uint64_t v193 = *MEMORY[0x1E4F22E28];
  uint64_t v194 = *MEMORY[0x1E4F22E38];
  uint64_t v195 = *MEMORY[0x1E4F22E20];
  uint64_t v196 = *MEMORY[0x1E4F22E88];
  uint64_t v197 = *MEMORY[0x1E4F22E98];
  uint64_t v198 = *MEMORY[0x1E4F22E90];
  uint64_t v199 = *MEMORY[0x1E4F22E68];
  uint64_t v200 = *MEMORY[0x1E4F22E78];
  uint64_t v201 = *MEMORY[0x1E4F22E80];
  uint64_t v202 = *MEMORY[0x1E4F22ED0];
  uint64_t v203 = *MEMORY[0x1E4F23138];
  uint64_t v204 = *MEMORY[0x1E4F22A88];
  uint64_t v205 = *MEMORY[0x1E4F22A90];
  uint64_t v206 = *MEMORY[0x1E4F22EA0];
  uint64_t v207 = *MEMORY[0x1E4F22F40];
  uint64_t v208 = *MEMORY[0x1E4F22EE8];
  uint64_t v209 = *MEMORY[0x1E4F22D78];
  uint64_t v210 = *MEMORY[0x1E4F22EE0];
  uint64_t v211 = *MEMORY[0x1E4F22EC8];
  uint64_t v212 = *MEMORY[0x1E4F22EA8];
  uint64_t v213 = *MEMORY[0x1E4F22EF8];
  uint64_t v214 = *MEMORY[0x1E4F22EF0];
  uint64_t v215 = *MEMORY[0x1E4F22D90];
  uint64_t v216 = *MEMORY[0x1E4F22D88];
  uint64_t v217 = *MEMORY[0x1E4F22F08];
  uint64_t v218 = *MEMORY[0x1E4F22F10];
  uint64_t v219 = *MEMORY[0x1E4F22F58];
  uint64_t v220 = *MEMORY[0x1E4F22F78];
  uint64_t v221 = *MEMORY[0x1E4F22F60];
  uint64_t v222 = *MEMORY[0x1E4F22F80];
  uint64_t v223 = *MEMORY[0x1E4F22F88];
  uint64_t v224 = *MEMORY[0x1E4F22F48];
  uint64_t v225 = *MEMORY[0x1E4F22F68];
  uint64_t v226 = *MEMORY[0x1E4F22F70];
  uint64_t v227 = *MEMORY[0x1E4F22F90];
  uint64_t v228 = *MEMORY[0x1E4F22F50];
  uint64_t v229 = *MEMORY[0x1E4F22BD0];
  uint64_t v230 = *MEMORY[0x1E4F22BD8];
  uint64_t v231 = *MEMORY[0x1E4F22B80];
  uint64_t v232 = *MEMORY[0x1E4F22C20];
  uint64_t v233 = *MEMORY[0x1E4F23118];
  uint64_t v234 = *MEMORY[0x1E4F23110];
  uint64_t v235 = *MEMORY[0x1E4F235B0];
  uint64_t v236 = *MEMORY[0x1E4F22D60];
  uint64_t v237 = *MEMORY[0x1E4F23650];
  uint64_t v238 = *MEMORY[0x1E4F237B0];
  uint64_t v239 = *MEMORY[0x1E4F22CD8];
  uint64_t v240 = *MEMORY[0x1E4F22DE0];
  uint64_t v241 = *MEMORY[0x1E4F22EB8];
  uint64_t v242 = *MEMORY[0x1E4F22D80];
  uint64_t v243 = *MEMORY[0x1E4F22ED8];
  uint64_t v244 = *MEMORY[0x1E4F22EB0];
  uint64_t v245 = *MEMORY[0x1E4F22EC0];
  uint64_t v246 = *MEMORY[0x1E4F22F18];
  uint64_t v247 = *MEMORY[0x1E4F22F28];
  uint64_t v248 = *MEMORY[0x1E4F22F00];
  uint64_t v249 = *MEMORY[0x1E4F22D98];
  uint64_t v250 = *MEMORY[0x1E4F23120];
  uint64_t v251 = *MEMORY[0x1E4F22B48];
  uint64_t v252 = *MEMORY[0x1E4F22A58];
  uint64_t v253 = *MEMORY[0x1E4F22B60];
  uint64_t v254 = *MEMORY[0x1E4F22BC0];
  uint64_t v255 = *MEMORY[0x1E4F22BE0];
  uint64_t v256 = *MEMORY[0x1E4F22BB8];
  uint64_t v257 = *MEMORY[0x1E4F22BA0];
  uint64_t v258 = *MEMORY[0x1E4F22BA8];
  uint64_t v259 = *MEMORY[0x1E4F22B98];
  uint64_t v260 = *MEMORY[0x1E4F22BB0];
  uint64_t v261 = *MEMORY[0x1E4F22BC8];
  uint64_t v262 = *MEMORY[0x1E4F22B90];
  uint64_t v263 = *MEMORY[0x1E4F22B88];
  uint64_t v264 = *MEMORY[0x1E4F22C88];
  uint64_t v265 = *MEMORY[0x1E4F22C80];
  uint64_t v266 = *MEMORY[0x1E4F22CA8];
  uint64_t v267 = *MEMORY[0x1E4F22D70];
  uint64_t v268 = *MEMORY[0x1E4F23388];
  uint64_t v269 = *MEMORY[0x1E4F23668];
  uint64_t v270 = *MEMORY[0x1E4F234B8];
  uint64_t v271 = *MEMORY[0x1E4F23108];
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:241];
  return v34;
}

+ (BOOL)supportsResult:(id)a3
{
  uint64_t v4 = [a3 sectionBundleIdentifier];
  uint64_t v5 = [a1 bundleId];
  char v6 = [v4 isEqual:v5];

  return v6;
}

+ (id)bundleId
{
  return 0;
}

+ (BOOL)isCoreSpotlightResult
{
  return 0;
}

+ (id)richTextsFromStrings:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F9A378], "textWithString:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3
{
  BOOL v3 = a3;
  if (isMacOS())
  {
    double v4 = 20.0;
    if (v3) {
      goto LABEL_7;
    }
    BOOL v5 = SSSnippetModernizationEnabled() == 0;
    double v4 = 48.0;
    double v6 = 32.0;
  }
  else
  {
    BOOL v5 = !v3;
    double v4 = 60.0;
    double v6 = 29.0;
  }
  if (!v5) {
    double v4 = v6;
  }
LABEL_7:
  double v7 = v4;
  result.height = v7;
  result.width = v4;
  return result;
}

+ (void)setDefaultSizeForThumbnail:(id)a3 isCompact:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  [v8 size];
  if (v7 == 0.0 && v6 == 0.0)
  {
    [a1 defaultThumbnailSizeIsCompact:v4];
    objc_msgSend(v8, "setSize:");
  }
}

+ (id)getCharacterIfWhitespaceAtIndex:(unint64_t)a3 ofString:(id)a4
{
  uint64_t v4 = [a4 characterAtIndex:a3];
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v5 characterIsMember:v4])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%C", v4);
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = &stru_1F1824018;
  }

  return v6;
}

+ (id)whiteSpaceCondensedStringForString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    double v6 = [v4 componentsSeparatedByCharactersInSet:v5];
    double v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_41];
    id v8 = [v6 filteredArrayUsingPredicate:v7];

    uint64_t v9 = [a1 getCharacterIfWhitespaceAtIndex:0 ofString:v4];
    uint64_t v10 = objc_msgSend(a1, "getCharacterIfWhitespaceAtIndex:ofString:", objc_msgSend(v4, "length") - 1, v4);
    uint64_t v11 = NSString;
    long long v12 = [v8 componentsJoinedByString:@" "];
    id v13 = [v11 stringWithFormat:@"%@%@%@", v9, v12, v10];
  }
  else
  {
    id v13 = v4;
  }

  return v13;
}

BOOL __54__SSResultBuilder_whiteSpaceCondensedStringForString___block_invoke(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

+ (void)condenseWhiteSpaceForRichText:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 formattedTextPieces];

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v5 = objc_msgSend(v3, "formattedTextPieces", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = objc_opt_class();
          long long v12 = [v10 text];
          id v13 = [v11 whiteSpaceCondensedStringForString:v12];
          [v10 setText:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
    goto LABEL_12;
  }
  long long v14 = [v3 text];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    BOOL v5 = [v3 text];
    uint64_t v17 = [v16 whiteSpaceCondensedStringForString:v5];
    [v3 setText:v17];

LABEL_12:
  }
}

+ (void)condenseWhiteSpaceForDescriptions:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 condenseWhiteSpaceForRichText:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (SSResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SSResultBuilder;
  uint64_t v5 = [(SSResultBuilder *)&v30 init];
  if (!v5) {
    goto LABEL_26;
  }
  int v6 = isMacOS();
  uint64_t v7 = (__CFString *)*MEMORY[0x1E4F237B0];
  if (!v6) {
    uint64_t v7 = @"SSAttributeTopMatchedStrings";
  }
  uint64_t v8 = v7;
  long long v9 = [v4 valueForAttribute:v8 withType:objc_opt_class()];
  [(SSResultBuilder *)v5 setResult:v4];
  long long v10 = [v9 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v11 = v9;
  }
  else {
    long long v11 = 0;
  }
  [(SSResultBuilder *)v5 setMatchedStrings:v11];

  if ([(id)objc_opt_class() isCoreSpotlightResult])
  {
    long long v12 = [v4 valueForAttribute:*MEMORY[0x1E4F22F38] withType:objc_opt_class()];
    [(SSResultBuilder *)v5 setCoreSpotlightId:v12];
  }
  else
  {
    [(SSResultBuilder *)v5 setCoreSpotlightId:0];
  }
  if ([v4 hasTextContentMatch])
  {
    [(SSResultBuilder *)v5 setHasTextContentMatch:1];
  }
  else
  {
    id v13 = [v4 valueForAttribute:*MEMORY[0x1E4F237A8] withType:objc_opt_class()];
    -[SSResultBuilder setHasTextContentMatch:](v5, "setHasTextContentMatch:", [v13 BOOLValue]);
  }
  uint64_t v14 = [(SSResultBuilder *)v5 result];
  uint64_t v15 = [v14 relatedAppIdentifier];
  if (v15)
  {
    [(SSResultBuilder *)v5 setRelatedAppBundleIdentifier:v15];
  }
  else
  {
    uint64_t v16 = [v4 valueForAttribute:*MEMORY[0x1E4F234D0] withType:objc_opt_class()];
    [(SSResultBuilder *)v5 setRelatedAppBundleIdentifier:v16];
  }
  uint64_t v17 = [(SSResultBuilder *)v5 result];
  long long v18 = [v17 contentType];

  if (v18)
  {
    long long v19 = (void *)MEMORY[0x1E4F442D8];
    long long v20 = [(SSResultBuilder *)v5 result];
    long long v21 = [v20 contentType];
    uint64_t v22 = [v19 typeWithIdentifier:v21];
    [(SSResultBuilder *)v5 setUniformType:v22];
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v23 = [(SSResultBuilder *)v5 uniformType];
    if (v23)
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v24 = [v4 sectionBundleIdentifier];
    int v25 = [v24 isEqualToString:@"com.apple.spotlight.events"];

    if (v25)
    {
      uint64_t v23 = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.spotlight.events"];
      [(SSResultBuilder *)v5 setUniformType:v23];
      goto LABEL_22;
    }
  }
LABEL_23:
  uint64_t v26 = [v4 valueForAttribute:*MEMORY[0x1E4F22B38] withType:objc_opt_class()];
  int v27 = [v26 unsignedIntValue];

  if (v27)
  {
    uint64_t v28 = objc_opt_new();
    [v28 setBlueComponent:(double)v27 / 255.0];
    [v28 setGreenComponent:(double)BYTE1(v27) / 255.0];
    [v28 setRedComponent:(double)BYTE2(v27) / 255.0];
    [(SSResultBuilder *)v5 setBackgroundColor:v28];
  }
LABEL_26:

  return v5;
}

- (unint64_t)numberOfLinesForDescriptions
{
  if (isMacOS()) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)setMaxLinesForDescriptions:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v10 = [v9 maxLines];
        if (!v10) {
          uint64_t v10 = [(SSResultBuilder *)self numberOfLinesForDescriptions];
        }
        [v9 setMaxLines:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)resultAppBundleId
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  id v3 = [v2 applicationBundleIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() bundleId];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)buildResult
{
  id v3 = [(SSResultBuilder *)self buildPreviewButtonItems];
  id v4 = [(SSResultBuilder *)self buildAppEntityAnnotation];
  id v5 = [(SSResultBuilder *)self result];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  uint64_t v8 = v7;

  long long v9 = [(SSResultBuilder *)self buildCompactCard];
  [v8 setCompactCard:v9];

  uint64_t v10 = [(SSResultBuilder *)self buildInlineCard];
  [v8 setInlineCard:v10];

  long long v11 = [v8 inlineCard];
  long long v12 = [v11 cardSections];
  long long v13 = [v12 firstObject];
  [v13 setPreviewButtonItems:v3];

  long long v14 = [v8 compactCard];
  uint64_t v15 = [v14 cardSections];
  uint64_t v16 = [v15 firstObject];
  [v16 setPreviewButtonItems:v3];

  uint64_t v17 = [v8 inlineCard];
  long long v18 = [v17 cardSections];
  long long v19 = [v18 firstObject];
  [v19 setAppEntityAnnotation:v4];

  long long v20 = [v8 compactCard];
  long long v21 = [v20 cardSections];
  uint64_t v22 = [v21 firstObject];
  [v22 setAppEntityAnnotation:v4];

  return v8;
}

- (id)buildCompactCard
{
  uint64_t v2 = [(SSResultBuilder *)self buildCompactCardSections];
  if (v2)
  {
    id v3 = objc_opt_new();
    [v3 setCardSections:v2];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)buildInlineCard
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(SSResultBuilder *)self buildInlineCardSections];
  if (v3)
  {
    id v4 = objc_opt_new();
    [v4 setCardSections:v3];
    if ([(SSResultBuilder *)self isTopHit]) {
      char v5 = SSSnippetModernizationEnabled();
    }
    else {
      char v5 = 0;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (v5) {
            [(SSResultBuilder *)self buildBackgroundColor];
          }
          else {
          long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "backgroundColor", (void)v14);
          }
          objc_msgSend(v11, "setBackgroundColor:", v12, (void)v14);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)buildCompactCardSections
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSResultBuilder *)self buildCompactCardSection];
  id v4 = [v3 descriptions];
  [(SSResultBuilder *)self setMaxLinesForDescriptions:v4];

  char v5 = objc_opt_class();
  id v6 = [v3 descriptions];
  [v5 condenseWhiteSpaceForDescriptions:v6];

  uint64_t v7 = [v3 thumbnail];
  uint64_t v8 = [v7 badgingImage];

  uint64_t v9 = [v3 thumbnail];
  [v9 setBadgingImage:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 setThumbnail:v8];
  }
  if (v3)
  {
    v12[0] = v3;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)buildInlineCardSections
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSResultBuilder *)self buildInlineCardSection];
  id v4 = [v3 descriptions];
  [(SSResultBuilder *)self setMaxLinesForDescriptions:v4];

  char v5 = objc_opt_class();
  id v6 = [v3 descriptions];
  [v5 condenseWhiteSpaceForDescriptions:v6];

  if (v3)
  {
    v9[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)buildCompactCardSection
{
  uint64_t v2 = [(SSResultBuilder *)self buildDetailedRowCardSection];
  [v2 setShouldUseCompactDisplay:1];
  id v3 = objc_opt_class();
  id v4 = [v2 thumbnail];
  [v3 setDefaultSizeForThumbnail:v4 isCompact:1];

  return v2;
}

- (id)buildInlineCardSection
{
  uint64_t v2 = [(SSResultBuilder *)self buildDetailedRowCardSection];
  id v3 = objc_opt_class();
  id v4 = [v2 thumbnail];
  [v3 setDefaultSizeForThumbnail:v4 isCompact:0];

  return v2;
}

- (id)buildHorizontallyScrollingCardSection
{
  id v3 = [(SSResultBuilder *)self subclassBuildHorizontallyScrollingCardSection];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_class();
    char v5 = [v3 thumbnail];
    [v4 setDefaultSizeForThumbnail:v5 isCompact:0];
  }
  [(SSResultBuilder *)self buildDefaultPropertiesForCardSection:v3];
  return v3;
}

- (id)buildAppTopHitEntityCardSection
{
  id v3 = objc_opt_new();
  id v4 = [(SSResultBuilder *)self buildTitle];
  [v3 setTitle:v4];

  char v5 = [v3 title];
  [v5 setMaxLines:2];

  id v6 = [(SSResultBuilder *)self buildThumbnail];
  [v3 setThumbnail:v6];

  uint64_t v7 = [v3 thumbnail];
  [v7 setBadgingImage:0];

  uint64_t v8 = [(SSResultBuilder *)self buildFootnote];
  [v3 setFootnote:v8];

  uint64_t v9 = [v3 footnote];
  [v9 setMaxLines:1];

  uint64_t v10 = [(SSResultBuilder *)self buildCommand];
  [v3 setCommand:v10];

  [v3 setUseAppIconMetrics:1];
  long long v11 = [(SSResultBuilder *)self buildAppEntityAnnotation];
  [v3 setAppEntityAnnotation:v11];

  return v3;
}

- (void)buildDefaultPropertiesForCardSection:(id)a3
{
  id v8 = a3;
  id v4 = [v8 command];
  if (v4)
  {
    [v8 setCommand:v4];
  }
  else
  {
    char v5 = [(SSResultBuilder *)self buildCommand];
    [v8 setCommand:v5];
  }
  id v6 = [v8 previewCommand];
  if (v6)
  {
    [v8 setPreviewCommand:v6];
  }
  else
  {
    uint64_t v7 = [(SSResultBuilder *)self buildPreviewCommand];
    [v8 setPreviewCommand:v7];
  }
}

- (id)buildDetailedRowCardSection
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = objc_opt_new();
  char v5 = [(SSResultBuilder *)self buildPunchouts];
  [v4 setPunchoutOptions:v5];

  id v6 = [(SSResultBuilder *)self buildThumbnail];
  [v4 setThumbnail:v6];

  int v7 = SSSnippetModernizationEnabled();
  if (v7)
  {
    uint64_t v2 = [v4 thumbnail];
    id v8 = [(SSResultBuilder *)self buildBadgingImageWithThumbnail:v2];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v4 thumbnail];
  [v9 setBadgingImage:v8];

  if (v7)
  {
  }
  uint64_t v10 = [(SSResultBuilder *)self buildTrailingThumbnail];
  [v4 setTrailingThumbnail:v10];

  long long v11 = [(SSResultBuilder *)self buildTitle];
  [v4 setTitle:v11];

  long long v12 = [(SSResultBuilder *)self buildSecondaryTitle];
  [v4 setSecondaryTitle:v12];

  long long v13 = [v4 secondaryTitle];
  unint64_t v14 = [v13 maxLines];
  if (v14 <= 1) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  long long v16 = [v4 secondaryTitle];
  [v16 setMaxLines:v15];

  long long v17 = [(SSResultBuilder *)self buildSecondaryTitleImage];
  [v4 setSecondaryTitleImage:v17];

  objc_msgSend(v4, "setIsSecondaryTitleDetached:", -[SSResultBuilder buildSecondaryTitleIsDetached](self, "buildSecondaryTitleIsDetached"));
  uint64_t v58 = self;
  long long v18 = [(SSResultBuilder *)self buildDescriptions];
  uint64_t v59 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v60 objects:v64 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v61 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v9 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        uint64_t v24 = [v9 text];
        int v25 = [v4 title];
        uint64_t v26 = [v25 text];
        char v27 = [v24 isEqualToString:v26];

        if ((v27 & 1) == 0) {
          [v59 addObject:v9];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v60 objects:v64 count:16];
    }
    while (v21);
  }

  if ([v59 count]) {
    uint64_t v28 = v59;
  }
  else {
    uint64_t v28 = 0;
  }
  [v4 setDescriptions:v28];
  uint64_t v29 = [v4 title];
  uint64_t v30 = [v29 maxLines];
  if (v30)
  {
    uint64_t v31 = v30;
    int v32 = 0;
  }
  else if (SSSnippetModernizationEnabled())
  {
    uint64_t v9 = [v4 descriptions];
    int v32 = 1;
    if (v9) {
      uint64_t v31 = 1;
    }
    else {
      uint64_t v31 = 2;
    }
  }
  else
  {
    int v32 = 0;
    uint64_t v31 = 2;
  }
  uint64_t v33 = [v4 title];
  [v33 setMaxLines:v31];

  if (v32) {
  v34 = [(SSResultBuilder *)v58 buildFootnote];
  }
  [v4 setFootnote:v34];

  v35 = [v4 footnote];
  uint64_t v36 = [v35 maxLines];
  if (v36) {
    uint64_t v37 = v36;
  }
  else {
    uint64_t v37 = 2;
  }
  uint64_t v38 = [v4 footnote];
  [v38 setMaxLines:v37];

  uint64_t v39 = [(SSResultBuilder *)v58 buildTrailingTopText];
  [v4 setTrailingTopText:v39];

  uint64_t v40 = [v4 trailingTopText];
  unint64_t v41 = [v40 maxLines];
  if (v41 <= 1) {
    uint64_t v42 = 1;
  }
  else {
    uint64_t v42 = v41;
  }
  uint64_t v43 = [v4 trailingTopText];
  [v43 setMaxLines:v42];

  uint64_t v44 = [(SSResultBuilder *)v58 buildTrailingMiddleText];
  [v4 setTrailingMiddleText:v44];

  uint64_t v45 = [v4 trailingMiddleText];
  unint64_t v46 = [v45 maxLines];
  if (v46 <= 1) {
    uint64_t v47 = 1;
  }
  else {
    uint64_t v47 = v46;
  }
  uint64_t v48 = [v4 trailingMiddleText];
  [v48 setMaxLines:v47];

  uint64_t v49 = [(SSResultBuilder *)v58 buildTrailingBottomText];
  [v4 setTrailingBottomText:v49];

  uint64_t v50 = [v4 trailingBottomText];
  unint64_t v51 = [v50 maxLines];
  if (v51 <= 1) {
    uint64_t v52 = 1;
  }
  else {
    uint64_t v52 = v51;
  }
  uint64_t v53 = [v4 trailingBottomText];
  [v53 setMaxLines:v52];

  uint64_t v54 = [(SSResultBuilder *)v58 buildAction];
  [v4 setAction:v54];

  uint64_t v55 = [(SSResultBuilder *)v58 buildButtonItems];
  [v4 setButtonItems:v55];

  objc_msgSend(v4, "setPreventThumbnailImageScaling:", -[SSResultBuilder buildPreventThumbnailImageScaling](v58, "buildPreventThumbnailImageScaling"));
  objc_msgSend(v4, "setButtonItemsAreTrailing:", -[SSResultBuilder buildButtonItemsAreTrailing](v58, "buildButtonItemsAreTrailing"));
  uint64_t v56 = [v4 descriptions];
  [(SSResultBuilder *)v58 setMaxLinesForDescriptions:v56];

  [(SSResultBuilder *)v58 buildDefaultPropertiesForCardSection:v4];
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4 = a3;
  char v5 = [(SSResultBuilder *)self bundleIdentifierForAppIconBadgeImage];
  id v6 = v5;
  if (!v5
    || ([v5 isEqualToString:@"com.apple.MobileAddressBook"] & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v4 bundleIdentifier],
        int v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:v6],
        v7,
        (v8 & 1) != 0))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = objc_opt_new();
    [v9 setBundleIdentifier:v6];
  }

  return v9;
}

- (id)bundleIdentifierForAppIconBadgeImage
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  id v3 = [v2 applicationBundleIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(id)objc_opt_class() bundleId];
  }
  id v6 = v5;

  return v6;
}

- (id)buildPreviewButtonItems
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  id v4 = [(SSResultBuilder *)self result];
  id v5 = [v4 applicationBundleIdentifier];

  id v6 = [(SSResultBuilder *)self result];
  char v27 = [v6 applicationBundleIdentifier];

  int v7 = [(SSResultBuilder *)self coreSpotlightId];
  char v8 = [(SSResultBuilder *)self result];
  uint64_t v9 = [v8 valueForAttribute:*MEMORY[0x1E4F22A28] withType:objc_opt_class()];

  if ([v9 count])
  {
    uint64_t v10 = objc_opt_new();
    [v10 setActionItemTypes:v9];
    [v10 setApplicationBundleIdentifier:v5];
    [v10 setCoreSpotlightIdentifier:v7];
    [v3 addObject:v10];
  }
  long long v11 = [(SSResultBuilder *)self result];
  long long v12 = [v11 itemProviderDataTypes];

  long long v13 = [(SSResultBuilder *)self result];
  unint64_t v14 = [v13 itemProviderFileTypes];

  uint64_t v15 = [(SSResultBuilder *)self result];
  long long v16 = [v15 valueForAttribute:*MEMORY[0x1E4F23578] withType:objc_opt_class()];

  v29[0] = @"com.apple.mobilemail";
  v29[1] = @"com.apple.mobilenotes";
  long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  char v18 = [v17 containsObject:v5];

  if (v12 || v14 || v16)
  {
    if ((v18 & 1) != 0 || SSSectionIsSyndicatedPhotos(v27))
    {
      id v19 = objc_opt_new();
      uint64_t v20 = objc_opt_new();
      [v20 setApplicationBundleIdentifier:v5];
      [v20 setCoreSpotlightIdentifier:v7];
      [v20 setDataProviderTypeIdentifiers:v12];
      [v20 setFileProviderTypeIdentifiers:v14];
      if (!v14 && v16)
      {
        uint64_t v28 = v16;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
        [v20 setFileProviderTypeIdentifiers:v21];
      }
      [v19 setCopyableItem:v20];
      uint64_t v22 = objc_opt_new();
      [v22 setCommand:v19];
      [v3 addObject:v22];
    }
    if (v16)
    {
      uint64_t v23 = objc_opt_new();
      uint64_t v24 = objc_opt_new();
      [v24 setShareProviderTypeIdentifier:v16];
      [v24 setApplicationBundleIdentifier:v5];
      [v24 setCoreSpotlightIdentifier:v7];
      [v24 setShareProviderTypeIdentifier:v16];
      [v23 setShareItem:v24];
      int v25 = objc_opt_new();
      [v25 setCommand:v23];
      [v3 addObject:v25];
    }
  }

  return v3;
}

- (id)buildPunchouts
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(SSResultBuilder *)self result];
  id v4 = [v3 valueForAttribute:*MEMORY[0x1E4F23408] withType:objc_opt_class()];
  id v5 = [v3 valueForAttribute:*MEMORY[0x1E4F22B40] withType:objc_opt_class()];
  uint64_t v6 = [v5 BOOLValue];

  uint64_t v7 = [v3 valueForAttribute:*MEMORY[0x1E4F22C70] withType:objc_opt_class()];
  char v8 = (void *)v7;
  if (!v4 && (v6 & 1) == 0 && !v7) {
    goto LABEL_12;
  }
  uint64_t v9 = objc_opt_new();
  [v9 setLabel:v4];
  [v9 setIsRunnableInBackground:v6];
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v8];
    long long v11 = (void *)v10;
    if (v10)
    {
      v16[0] = v10;
      long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      [v9 setUrls:v12];
    }
    else
    {
      long long v12 = SSGeneralLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        [(SSResultBuilder *)(uint64_t)self buildPunchouts];
      }
    }
  }
  if (v9)
  {
    uint64_t v15 = v9;
    long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  }
  else
  {
LABEL_12:
    long long v13 = 0;
  }

  return v13;
}

- (id)buildThumbnail
{
  id v3 = [(SSResultBuilder *)self result];
  uint64_t v4 = [v3 valueForAttribute:*MEMORY[0x1E4F23638] withType:objc_opt_class()];
  id v5 = [v3 valueForAttribute:*MEMORY[0x1E4F23630] withType:objc_opt_class()];
  uint64_t v6 = [v3 valueForAttribute:*MEMORY[0x1E4F23620] withType:objc_opt_class()];
  uint64_t v7 = [v3 valueForAttribute:*MEMORY[0x1E4F23628] withType:objc_opt_class()];
  uint64_t v8 = [v3 valueForAttribute:*MEMORY[0x1E4F23640] withType:objc_opt_class()];
  uint64_t v9 = [v3 urlValueForAttribute:*MEMORY[0x1E4F23648]];
  uint64_t v37 = [v3 urlValueForAttribute:*MEMORY[0x1E4F22CB8]];
  v35 = [v3 thumbnail];
  uint64_t v10 = [v3 applicationBundleIdentifier];
  long long v11 = v10;
  uint64_t v36 = (void *)v8;
  uint64_t v38 = (void *)v4;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(id)objc_opt_class() bundleId];
  }
  *((void *)&v39 + 1) = v12;

  *(void *)&long long v39 = [(SSResultBuilder *)self relatedAppBundleIdentifier];
  long long v13 = [(SSResultBuilder *)self result];
  unint64_t v14 = [v13 applicationBundleIdentifier];
  uint64_t v15 = v9;
  if ([v14 isEqualToString:@"com.apple.mobilecal"])
  {
    long long v16 = [(SSResultBuilder *)self result];
    [v16 userActivityRequiredString];
    uint64_t v17 = v7;
    uint64_t v18 = v6;
    v20 = id v19 = v5;
    int v21 = [v20 containsString:@"com.apple.calendarUIKit.userActivity.tomorrow"];

    id v5 = v19;
    uint64_t v6 = v18;
    uint64_t v7 = v17;

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F99F10]);
      uint64_t v23 = +[SSDateFormatManager tomorrow];
      id v24 = (id)[v22 initWithDate:v23];

      int v25 = v36;
      uint64_t v26 = v38;
LABEL_10:
      uint64_t v29 = (void *)v37;
LABEL_16:
      uint64_t v30 = v35;
LABEL_17:
      uint64_t v31 = (void *)v39;
      goto LABEL_18;
    }
  }
  else
  {
  }
  uint64_t v26 = v38;
  if (v38)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F9A510]);
    uint64_t v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v38 isDirectory:0];
    id v24 = (id)[v27 initWithURL:v28];

    int v25 = v36;
    goto LABEL_10;
  }
  uint64_t v29 = (void *)v37;
  if (v15 | v37)
  {
    id v24 = (id)[objc_alloc(MEMORY[0x1E4F9A510]) initWithURL:v15];
    [v24 setDarkUrlValue:v37];
LABEL_15:
    int v25 = v36;
    goto LABEL_16;
  }
  if (v5)
  {
    id v24 = [MEMORY[0x1E4F9A128] imageWithData:v5];
    goto LABEL_15;
  }
  uint64_t v30 = v35;
  int v25 = v36;
  if (v7 | v6)
  {
    id v24 = (id)objc_opt_new();
    [v24 setContentType:v7];
    uint64_t v33 = v24;
    uint64_t v34 = v6;
LABEL_23:
    [v33 setBundleIdentifier:v34];
    goto LABEL_17;
  }
  if (v36)
  {
    id v24 = (id)objc_opt_new();
    [v24 setIsTemplate:1];
    [v24 setSymbolName:v36];
    [v24 setPunchThroughBackground:1];
    goto LABEL_17;
  }
  if (v35)
  {
    id v24 = v35;
    goto LABEL_17;
  }
  uint64_t v31 = (void *)v39;
  if (v39 != 0)
  {
    uint64_t v33 = objc_opt_new();
    id v24 = v33;
    if ((void)v39) {
      uint64_t v34 = v39;
    }
    else {
      uint64_t v34 = *((void *)&v39 + 1);
    }
    goto LABEL_23;
  }
  id v24 = 0;
LABEL_18:

  return v24;
}

- (id)buildTrailingThumbnail
{
  return 0;
}

- (id)buildTitle
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  id v3 = [v2 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
  uint64_t v4 = [v2 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
  id v5 = [v2 valueForAttribute:*MEMORY[0x1E4F235C0] withType:objc_opt_class()];
  uint64_t v6 = [v2 title];
  uint64_t v7 = [v6 text];

  if ([v3 length])
  {
    id v8 = v3;
    goto LABEL_7;
  }
  if ([v4 length])
  {
    id v8 = v4;
    goto LABEL_7;
  }
  if ([v5 length])
  {
    id v8 = v5;
LABEL_7:
    id v9 = v8;
    if (v8)
    {
LABEL_8:
      uint64_t v10 = [MEMORY[0x1E4F9A378] textWithString:v9];
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v7)
  {
    id v9 = v7;
    goto LABEL_8;
  }
  long long v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v11 localizedStringForKey:@"NO_TITLE" value:&stru_1F1824018 table:@"SpotlightServices"];

  if (v9) {
    goto LABEL_8;
  }
LABEL_12:
  uint64_t v10 = 0;
LABEL_13:

  return v10;
}

- (id)buildSecondaryTitle
{
  id v3 = [(SSResultBuilder *)self result];
  uint64_t v4 = [v3 secondaryTitle];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F9A0E0];
    uint64_t v6 = [(SSResultBuilder *)self result];
    uint64_t v7 = [v6 secondaryTitle];
    id v8 = [v5 textWithString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)buildSecondaryTitleIsDetached
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  char v3 = [v2 isSecondaryTitleDetached];

  return v3;
}

- (id)buildSecondaryTitleImage
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  char v3 = [v2 secondaryTitleImage];

  return v3;
}

- (id)buildDescriptions
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  char v3 = [v2 valueForAttribute:*MEMORY[0x1E4F23598] withType:objc_opt_class()];
  uint64_t v4 = [v2 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
  id v5 = [v2 descriptions];
  uint64_t v6 = objc_opt_new();
  if (v4) {
    uint64_t v7 = v4;
  }
  else {
    uint64_t v7 = v3;
  }
  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F9A378], "textWithString:");
    [v6 addObject:v8];
  }
  else if ([v5 count])
  {
    [v6 addObjectsFromArray:v5];
  }
  if ([v6 count]) {
    id v9 = v6;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)buildFootnote
{
  char v3 = [(SSResultBuilder *)self result];
  uint64_t v4 = [v3 footnote];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F9A378];
    uint64_t v6 = [(SSResultBuilder *)self result];
    uint64_t v7 = [v6 footnote];
    id v8 = [v5 textWithString:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)buildTrailingTopText
{
  return 0;
}

- (id)buildTrailingMiddleText
{
  return 0;
}

- (id)buildTrailingBottomText
{
  return 0;
}

- (id)buildAction
{
  uint64_t v2 = [(SSResultBuilder *)self result];
  char v3 = [v2 sectionBundleIdentifier];
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [v2 contentTypeTree];
  uint64_t v6 = [v4 setWithArray:v5];

  uint64_t v7 = [(id)*MEMORY[0x1E4F44338] identifier];
  uint64_t v33 = v6;
  if ([v6 containsObject:v7])
  {
    int v8 = 1;
  }
  else
  {
    id v9 = objc_msgSend((id)*MEMORY[0x1E4F44478], "identifier", v6);
    int v8 = [v6 containsObject:v9];
  }
  if ([v3 isEqual:@"com.apple.Music"]) {
    int v10 = 1;
  }
  else {
    int v10 = [v3 isEqual:@"com.apple.TV"];
  }
  uint64_t v34 = v3;
  uint64_t v11 = [v2 valueForAttribute:*MEMORY[0x1E4F23670] withType:objc_opt_class()];
  id v12 = (void *)v11;
  if ((v8 & v10) != 0) {
    long long v13 = (void *)v11;
  }
  else {
    long long v13 = 0;
  }
  id v14 = v13;
  uint64_t v15 = v14;
  if (v14) {
    char v16 = [v14 hasPrefix:@"x-media-library://"] ^ 1;
  }
  else {
    char v16 = 1;
  }
  uint64_t v17 = [v2 valueForAttribute:*MEMORY[0x1E4F23230] withType:objc_opt_class()];
  uint64_t v18 = [v17 firstObject];

  id v19 = [v2 valueForAttribute:*MEMORY[0x1E4F235D8] withType:objc_opt_class()];
  int v20 = [v19 BOOLValue];

  int v21 = [v2 valueForAttribute:*MEMORY[0x1E4F230F8] withType:objc_opt_class()];
  id v22 = [v2 valueForAttribute:*MEMORY[0x1E4F23130] withType:objc_opt_class()];
  uint64_t v23 = [v2 valueForAttribute:*MEMORY[0x1E4F235D0] withType:objc_opt_class()];
  int v24 = [v23 BOOLValue];

  int v25 = [v2 action];
  if (![v15 length] || (v16 & 1) != 0)
  {
    if (objc_msgSend(v18, "length", v33)) {
      int v28 = v20;
    }
    else {
      int v28 = 0;
    }
    if (v28 == 1)
    {
      id v26 = (id)objc_opt_new();
      [v26 setPhoneNumber:v18];
    }
    else
    {
      id v26 = 0;
    }
    id v27 = v34;
    if (v21 && v22 && ((v24 ^ 1) & 1) == 0)
    {
      uint64_t v29 = objc_opt_new();
      [v21 floatValue];
      [v29 setLat:v30];
      [v22 floatValue];
      [v29 setLng:v31];
      if (!v26) {
        id v26 = (id)objc_opt_new();
      }
      [v26 setLocation:v29];
    }
  }
  else
  {
    id v26 = (id)objc_opt_new();
    [v26 setLocalMediaIdentifier:v15];
    id v27 = v34;
  }
  if (!v26 && v25) {
    id v26 = v25;
  }

  return v26;
}

- (id)buildHighlightedMatchedTextWithTitle:(id)a3 headTruncation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SSResultBuilder *)self queryContext];
  int v8 = [v7 searchString];
  id v9 = (void *)[v8 length];

  if (v9)
  {
    int v10 = [(SSResultBuilder *)self queryContext];
    uint64_t v11 = [v10 evaluator];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [(SSResultBuilder *)self matchedStrings];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = getHighlightedRichText(*(void **)(*((void *)&v19 + 1) + 8 * i), v11, v6, v4);
          if (v17)
          {
            id v9 = (void *)v17;
            goto LABEL_12;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    id v9 = 0;
LABEL_12:
  }
  return v9;
}

- (id)buildHighlightedTextWithString:(id)a3 includeQuotes:(BOOL)a4
{
  BOOL v4 = a4;
  v41[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SSResultBuilder *)self queryContext];
  int v8 = [v7 searchString];
  uint64_t v9 = [v8 precomposedStringWithCompatibilityMapping];
  int v10 = (void *)v9;
  uint64_t v11 = &stru_1F1824018;
  if (v9) {
    uint64_t v11 = (__CFString *)v9;
  }
  id v12 = v11;

  uint64_t v13 = [(SSResultBuilder *)self matchedStrings];
  if ([v13 containsObject:v6])
  {
    int v14 = 1;
  }
  else
  {
    uint64_t v15 = [v6 precomposedStringWithCompatibilityMapping];
    int v14 = [v15 localizedStandardContainsString:v12];
  }
  char v16 = (void *)MEMORY[0x1E4F9A378];
  if (v4)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v19 = [v18 localizedStringForKey:@"QUOTED_TRANSCRIPT_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    long long v20 = objc_msgSend(v17, "stringWithFormat:", v19, v6);
    long long v21 = [v16 textWithString:v20];

    if (!v14) {
      goto LABEL_16;
    }
  }
  else
  {
    long long v21 = [MEMORY[0x1E4F9A378] textWithString:v6];
    if (!v14) {
      goto LABEL_16;
    }
  }
  if ((unint64_t)[(__CFString *)v12 length] >= 4)
  {
    long long v22 = [(SSResultBuilder *)self queryContext];
    uint64_t v23 = [v22 evaluator];

    uint64_t v24 = getHighlightedRichText(v6, v23, 0, 1);
    int v25 = [v24 formattedTextPieces];
    uint64_t v26 = [v25 count];

    if (v26)
    {
      id v27 = v24;

      if (v4)
      {
        int v28 = (void *)MEMORY[0x1E4F9A0E0];
        uint64_t v40 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v39 = [v40 localizedStringForKey:@"OPEN_QUOTE" value:&stru_1F1824018 table:@"SpotlightServices"];
        uint64_t v38 = [v28 textWithString:v39];
        v41[0] = v38;
        uint64_t v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
        uint64_t v36 = [v27 formattedTextPieces];
        uint64_t v29 = [v37 arrayByAddingObjectsFromArray:v36];
        float v30 = (void *)MEMORY[0x1E4F9A0E0];
        float v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        int v32 = [v31 localizedStringForKey:@"CLOSED_QUOTE" value:&stru_1F1824018 table:@"SpotlightServices"];
        uint64_t v33 = [v30 textWithString:v32];
        uint64_t v34 = [v29 arrayByAddingObject:v33];
        [v27 setFormattedTextPieces:v34];
      }
    }
    else
    {
      id v27 = v21;
    }

    long long v21 = v27;
  }
LABEL_16:

  return v21;
}

- (id)buildButtonItems
{
  return 0;
}

- (id)buildPreviewCommand
{
  return 0;
}

- (id)buildCommand
{
  char v3 = [(SSResultBuilder *)self result];
  BOOL v4 = [v3 valueForAttribute:*MEMORY[0x1E4F23528] withType:objc_opt_class()];

  id v5 = [(SSResultBuilder *)self result];
  id v6 = [v5 valueForAttribute:*MEMORY[0x1E4F236A0] withType:objc_opt_class()];

  if (v4)
  {
    uint64_t v7 = objc_opt_new();
    [v7 setIntentMessageData:v4];
    [v7 setIsRunnableWorkflow:1];
    int v8 = [(SSResultBuilder *)self result];
    uint64_t v9 = [v8 valueForAttribute:*MEMORY[0x1E4F23510] withType:objc_opt_class()];
    [v7 setCommandDetail:v9];

    int v10 = [(SSResultBuilder *)self result];
    uint64_t v11 = [v10 valueForAttribute:*MEMORY[0x1E4F23520] withType:objc_opt_class()];
    [v7 setBiomeStreamIdentifier:v11];
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  id v12 = [(SSResultBuilder *)self result];
  uint64_t v13 = [v12 contentType];
  int v14 = [v13 isEqualToString:@"com.apple.siri.interaction"];

  if (v14)
  {
    uint64_t v7 = objc_opt_new();
    int v10 = [(SSResultBuilder *)self result];
    uint64_t v11 = [v10 valueForAttribute:*MEMORY[0x1E4F22F38] withType:objc_opt_class()];
    [v7 setVoiceShortcutIdentifier:v11];
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    [v7 setUserActivityRequiredString:v6];
    int v10 = [(SSResultBuilder *)self result];
    uint64_t v11 = [v10 applicationBundleIdentifier];
    [v7 setApplicationBundleIdentifier:v11];
    goto LABEL_7;
  }
  uint64_t v16 = [(SSResultBuilder *)self relatedAppBundleIdentifier];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    uint64_t v18 = [(SSResultBuilder *)self resultAppBundleId];
    if ([v18 isEqualToString:@"com.apple.Preferences"])
    {
      int v19 = isMacOS();

      if (!v19) {
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v7 = objc_opt_new();
    int v28 = [(SSResultBuilder *)self result];
    uint64_t v29 = [v28 identifier];
    [v7 setCoreSpotlightIdentifier:v29];

    uint64_t v27 = [(SSResultBuilder *)self relatedAppBundleIdentifier];
    goto LABEL_21;
  }
LABEL_15:
  uint64_t v20 = [(SSResultBuilder *)self coreSpotlightId];
  if (v20)
  {
    long long v21 = (void *)v20;
    uint64_t v22 = [(SSResultBuilder *)self resultAppBundleId];
    if (v22)
    {
      uint64_t v23 = (void *)v22;
      uint64_t v24 = [(SSResultBuilder *)self resultAppBundleId];
      char v25 = [v24 isEqualToString:@"com.apple.CalendarUI"];

      if ((v25 & 1) == 0)
      {
        uint64_t v7 = objc_opt_new();
        uint64_t v26 = [(SSResultBuilder *)self coreSpotlightId];
        [v7 setCoreSpotlightIdentifier:v26];

        uint64_t v27 = [(SSResultBuilder *)self resultAppBundleId];
LABEL_21:
        int v10 = (void *)v27;
        [v7 setApplicationBundleIdentifier:v27];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  uint64_t v7 = [(SSResultBuilder *)self filePath];

  if (v7)
  {
    float v30 = (void *)MEMORY[0x1E4F9A2F8];
    float v31 = (void *)MEMORY[0x1E4F1CB10];
    int v32 = [(SSResultBuilder *)self filePath];
    uint64_t v33 = [v31 fileURLWithPath:v32];
    int v10 = [v30 punchoutWithURL:v33];

    uint64_t v7 = objc_opt_new();
    [v7 setPunchout:v10];
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

- (BOOL)buildPreventThumbnailImageScaling
{
  return 0;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 0;
}

- (id)buildAppEntityAnnotation
{
  char v3 = [(SSResultBuilder *)self result];
  BOOL v4 = [v3 valueForAttribute:*MEMORY[0x1E4F22A90] withType:objc_opt_class()];

  id v5 = [(SSResultBuilder *)self result];
  id v6 = [v5 valueForAttribute:*MEMORY[0x1E4F22A88] withType:objc_opt_class()];

  if ([v4 length] && objc_msgSend(v6, "length"))
  {
    uint64_t v7 = objc_opt_new();
    [v7 setTypeIdentifer:v4];
    [v7 setEntityIdentifer:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)supportsClearingBackendData
{
  char v3 = [(SSResultBuilder *)self queryContext];
  if (v3)
  {
    BOOL v4 = [(SSResultBuilder *)self queryContext];
    char v5 = [v4 retainBackendData];

    char v6 = v5 ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (id)stringForSFRichText:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 text];
  char v5 = (void *)[v4 mutableCopy];

  if ([v5 length])
  {
    char v6 = v5;
  }
  else
  {
    char v6 = objc_opt_new();

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = objc_msgSend(v3, "formattedTextPieces", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v13 = [v12 text];
          if ([v13 length])
          {
            int v14 = [v12 text];
            [v6 appendString:v14];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  return v6;
}

- (BOOL)isTopHit
{
  return self->_isTopHit;
}

- (void)setIsTopHit:(BOOL)a3
{
  self->_isTopHit = a3;
}

- (SPSearchQueryContext)queryContext
{
  return self->_queryContext;
}

- (void)setQueryContext:(id)a3
{
}

- (SFSearchResult_SpotlightExtras)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (NSString)coreSpotlightId
{
  return self->_coreSpotlightId;
}

- (void)setCoreSpotlightId:(id)a3
{
}

- (NSArray)matchedStrings
{
  return self->_matchedStrings;
}

- (void)setMatchedStrings:(id)a3
{
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (BOOL)hasTextContentMatch
{
  return self->_hasTextContentMatch;
}

- (void)setHasTextContentMatch:(BOOL)a3
{
  self->_hasTextContentMatch = a3;
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)relatedAppBundleIdentifier
{
  return self->_relatedAppBundleIdentifier;
}

- (void)setRelatedAppBundleIdentifier:(id)a3
{
}

- (UTType)uniformType
{
  return self->_uniformType;
}

- (void)setUniformType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformType, 0);
  objc_storeStrong((id *)&self->_relatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_matchedStrings, 0);
  objc_storeStrong((id *)&self->_coreSpotlightId, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queryContext, 0);
}

- (void)buildPunchouts
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_1BDB2A000, a3, OS_LOG_TYPE_FAULT, "URLString present but invalid in %@: %@", (uint8_t *)&v5, 0x16u);
}

@end
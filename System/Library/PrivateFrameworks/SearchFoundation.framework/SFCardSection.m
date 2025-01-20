@interface SFCardSection
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeHidden;
- (BOOL)forceEnable3DTouch;
- (BOOL)hasBottomPadding;
- (BOOL)hasCanBeHidden;
- (BOOL)hasHasBottomPadding;
- (BOOL)hasHasTopPadding;
- (BOOL)hasSeparatorStyle;
- (BOOL)hasTopPadding;
- (BOOL)hideDivider;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHideInAmbientMode;
- (BOOL)shouldShowInSmartDialog;
- (NSArray)commands;
- (NSArray)embeddedCards;
- (NSArray)leadingSwipeButtonItems;
- (NSArray)parameterKeyPaths;
- (NSArray)previewButtonItems;
- (NSArray)punchoutOptions;
- (NSArray)referencedCommands;
- (NSArray)sectionsWithCards;
- (NSArray)trailingSwipeButtonItems;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)cardSectionDetail;
- (NSString)cardSectionId;
- (NSString)commandDetail;
- (NSString)emphasisSubjectId;
- (NSString)previewButtonItemsTitle;
- (NSString)punchoutPickerDismissText;
- (NSString)punchoutPickerTitle;
- (NSString)resultIdentifier;
- (NSString)type;
- (SFAppEntityAnnotation)appEntityAnnotation;
- (SFCard)nextCard;
- (SFCardSection)init;
- (SFCardSection)initWithCoder:(id)a3;
- (SFCardSection)initWithProtobuf:(id)a3;
- (SFColor)backgroundColor;
- (SFCommand)command;
- (SFCommand)previewCommand;
- (SFCommand)secondaryCommand;
- (SFUserReportRequest)userReportRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (int)increasedContrastMode;
- (int)requiredLevelOfDetail;
- (int)separatorStyle;
- (unint64_t)hash;
- (void)addCardsFromButtonsTo:(id)a3;
- (void)addCardsFromCommandsTo:(id)a3;
- (void)addCardsFromEmbeddedSectionsTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAppEntityAnnotation:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanBeHidden:(BOOL)a3;
- (void)setCardSectionDetail:(id)a3;
- (void)setCardSectionId:(id)a3;
- (void)setCommand:(id)a3;
- (void)setCommandDetail:(id)a3;
- (void)setCommands:(id)a3;
- (void)setEmphasisSubjectId:(id)a3;
- (void)setForceEnable3DTouch:(BOOL)a3;
- (void)setHasBottomPadding:(BOOL)a3;
- (void)setHasTopPadding:(BOOL)a3;
- (void)setIncreasedContrastMode:(int)a3;
- (void)setLeadingSwipeButtonItems:(id)a3;
- (void)setNextCard:(id)a3;
- (void)setParameterKeyPaths:(id)a3;
- (void)setPreviewButtonItems:(id)a3;
- (void)setPreviewButtonItemsTitle:(id)a3;
- (void)setPreviewCommand:(id)a3;
- (void)setPunchoutOptions:(id)a3;
- (void)setPunchoutPickerDismissText:(id)a3;
- (void)setPunchoutPickerTitle:(id)a3;
- (void)setReferencedCommands:(id)a3;
- (void)setRequiredLevelOfDetail:(int)a3;
- (void)setResultIdentifier:(id)a3;
- (void)setSecondaryCommand:(id)a3;
- (void)setSeparatorStyle:(int)a3;
- (void)setShouldHideInAmbientMode:(BOOL)a3;
- (void)setShouldShowInSmartDialog:(BOOL)a3;
- (void)setTrailingSwipeButtonItems:(id)a3;
- (void)setType:(id)a3;
- (void)setUserReportRequest:(id)a3;
@end

@implementation SFCardSection

- (SFCardSection)initWithProtobuf:(id)a3
{
  uint64_t v815 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(SFNullCardSection);
  v5 = [v3 value];
  v6 = [v5 appLinkCardSection];

  if (v6)
  {
    v7 = [SFAppLinkCardSection alloc];
    v8 = [v3 value];
    v9 = [v8 appLinkCardSection];
    uint64_t v10 = [(SFAppLinkCardSection *)v7 initWithProtobuf:v9];

    v4 = (SFNullCardSection *)v10;
  }
  v11 = [v3 value];
  v12 = [v11 descriptionCardSection];

  if (v12)
  {
    v13 = [SFDescriptionCardSection alloc];
    v14 = [v3 value];
    v15 = [v14 descriptionCardSection];
    uint64_t v16 = [(SFDescriptionCardSection *)v13 initWithProtobuf:v15];

    v4 = (SFNullCardSection *)v16;
  }
  v17 = [v3 value];
  v18 = [v17 keyValueDataCardSection];

  if (v18)
  {
    v19 = [SFKeyValueDataCardSection alloc];
    v20 = [v3 value];
    v21 = [v20 keyValueDataCardSection];
    uint64_t v22 = [(SFKeyValueDataCardSection *)v19 initWithProtobuf:v21];

    v4 = (SFNullCardSection *)v22;
  }
  v23 = [v3 value];
  v24 = [v23 mapCardSection];

  if (v24)
  {
    v25 = [SFMapCardSection alloc];
    v26 = [v3 value];
    v27 = [v26 mapCardSection];
    uint64_t v28 = [(SFMapCardSection *)v25 initWithProtobuf:v27];

    v4 = (SFNullCardSection *)v28;
  }
  v29 = [v3 value];
  v30 = [v29 mediaInfoCardSection];

  if (v30)
  {
    v31 = [SFMediaInfoCardSection alloc];
    v32 = [v3 value];
    v33 = [v32 mediaInfoCardSection];
    uint64_t v34 = [(SFMediaInfoCardSection *)v31 initWithProtobuf:v33];

    v4 = (SFNullCardSection *)v34;
  }
  v35 = [v3 value];
  v36 = [v35 mediaPlayerCardSection];

  if (v36)
  {
    v37 = [SFMediaPlayerCardSection alloc];
    v38 = [v3 value];
    v39 = [v38 mediaPlayerCardSection];
    uint64_t v40 = [(SFMediaPlayerCardSection *)v37 initWithProtobuf:v39];

    v4 = (SFNullCardSection *)v40;
  }
  v41 = [v3 value];
  v42 = [v41 nowPlayingCardSection];

  if (v42)
  {
    v43 = [SFNowPlayingCardSection alloc];
    v44 = [v3 value];
    v45 = [v44 nowPlayingCardSection];
    uint64_t v46 = [(SFNowPlayingCardSection *)v43 initWithProtobuf:v45];

    v4 = (SFNullCardSection *)v46;
  }
  v47 = [v3 value];
  v48 = [v47 richTitleCardSection];

  if (v48)
  {
    v49 = [SFRichTitleCardSection alloc];
    v50 = [v3 value];
    v51 = [v50 richTitleCardSection];
    uint64_t v52 = [(SFRichTitleCardSection *)v49 initWithProtobuf:v51];

    v4 = (SFNullCardSection *)v52;
  }
  v53 = [v3 value];
  v54 = [v53 rowCardSection];

  if (v54)
  {
    v55 = [SFRowCardSection alloc];
    v56 = [v3 value];
    v57 = [v56 rowCardSection];
    uint64_t v58 = [(SFRowCardSection *)v55 initWithProtobuf:v57];

    v4 = (SFNullCardSection *)v58;
  }
  v59 = [v3 value];
  v60 = [v59 scoreboardCardSection];

  if (v60)
  {
    v61 = [SFScoreboardCardSection alloc];
    v62 = [v3 value];
    v63 = [v62 scoreboardCardSection];
    uint64_t v64 = [(SFScoreboardCardSection *)v61 initWithProtobuf:v63];

    v4 = (SFNullCardSection *)v64;
  }
  v65 = [v3 value];
  v66 = [v65 socialMediaPostCardSection];

  if (v66)
  {
    v67 = [SFSocialMediaPostCardSection alloc];
    v68 = [v3 value];
    v69 = [v68 socialMediaPostCardSection];
    uint64_t v70 = [(SFSocialMediaPostCardSection *)v67 initWithProtobuf:v69];

    v4 = (SFNullCardSection *)v70;
  }
  v71 = [v3 value];
  v72 = [v71 stockChartCardSection];

  if (v72)
  {
    v73 = [SFStockChartCardSection alloc];
    v74 = [v3 value];
    v75 = [v74 stockChartCardSection];
    uint64_t v76 = [(SFStockChartCardSection *)v73 initWithProtobuf:v75];

    v4 = (SFNullCardSection *)v76;
  }
  v77 = [v3 value];
  v78 = [v77 tableHeaderRowCardSection];

  if (v78)
  {
    v79 = [SFTableHeaderRowCardSection alloc];
    v80 = [v3 value];
    v81 = [v80 tableHeaderRowCardSection];
    uint64_t v82 = [(SFTableHeaderRowCardSection *)v79 initWithProtobuf:v81];

    v4 = (SFNullCardSection *)v82;
  }
  v83 = [v3 value];
  v84 = [v83 tableRowCardSection];

  if (v84)
  {
    v85 = [SFTableRowCardSection alloc];
    v86 = [v3 value];
    v87 = [v86 tableRowCardSection];
    uint64_t v88 = [(SFTableRowCardSection *)v85 initWithProtobuf:v87];

    v4 = (SFNullCardSection *)v88;
  }
  v89 = [v3 value];
  v90 = [v89 textColumnsCardSection];

  if (v90)
  {
    v91 = [SFTextColumnsCardSection alloc];
    v92 = [v3 value];
    v93 = [v92 textColumnsCardSection];
    uint64_t v94 = [(SFTextColumnsCardSection *)v91 initWithProtobuf:v93];

    v4 = (SFNullCardSection *)v94;
  }
  v95 = [v3 value];
  v96 = [v95 titleCardSection];

  if (v96)
  {
    v97 = [SFTitleCardSection alloc];
    v98 = [v3 value];
    v99 = [v98 titleCardSection];
    uint64_t v100 = [(SFTitleCardSection *)v97 initWithProtobuf:v99];

    v4 = (SFNullCardSection *)v100;
  }
  v101 = [v3 value];
  v102 = [v101 trackListCardSection];

  if (v102)
  {
    v103 = [SFTrackListCardSection alloc];
    v104 = [v3 value];
    v105 = [v104 trackListCardSection];
    uint64_t v106 = [(SFTrackListCardSection *)v103 initWithProtobuf:v105];

    v4 = (SFNullCardSection *)v106;
  }
  v107 = [v3 value];
  v108 = [v107 audioPlaybackCardSection];

  if (v108)
  {
    v109 = [SFAudioPlaybackCardSection alloc];
    v110 = [v3 value];
    v111 = [v110 audioPlaybackCardSection];
    uint64_t v112 = [(SFAudioPlaybackCardSection *)v109 initWithProtobuf:v111];

    v4 = (SFNullCardSection *)v112;
  }
  v113 = [v3 value];
  v114 = [v113 flightCardSection];

  if (v114)
  {
    v115 = [SFFlightCardSection alloc];
    v116 = [v3 value];
    v117 = [v116 flightCardSection];
    uint64_t v118 = [(SFFlightCardSection *)v115 initWithProtobuf:v117];

    v4 = (SFNullCardSection *)v118;
  }
  v119 = [v3 value];
  v120 = [v119 activityIndicatorCardSection];

  if (v120)
  {
    v121 = [SFActivityIndicatorCardSection alloc];
    v122 = [v3 value];
    v123 = [v122 activityIndicatorCardSection];
    uint64_t v124 = [(SFActivityIndicatorCardSection *)v121 initWithProtobuf:v123];

    v4 = (SFNullCardSection *)v124;
  }
  v125 = [v3 value];
  v126 = [v125 webCardSection];

  if (v126)
  {
    v127 = [SFWebCardSection alloc];
    v128 = [v3 value];
    v129 = [v128 webCardSection];
    uint64_t v130 = [(SFWebCardSection *)v127 initWithProtobuf:v129];

    v4 = (SFNullCardSection *)v130;
  }
  v131 = [v3 value];
  v132 = [v131 messageCardSection];

  if (v132)
  {
    v133 = [SFMessageCardSection alloc];
    v134 = [v3 value];
    v135 = [v134 messageCardSection];
    uint64_t v136 = [(SFMessageCardSection *)v133 initWithProtobuf:v135];

    v4 = (SFNullCardSection *)v136;
  }
  v137 = [v3 value];
  v138 = [v137 detailedRowCardSection];

  if (v138)
  {
    v139 = [SFDetailedRowCardSection alloc];
    v140 = [v3 value];
    v141 = [v140 detailedRowCardSection];
    uint64_t v142 = [(SFDetailedRowCardSection *)v139 initWithProtobuf:v141];

    v4 = (SFNullCardSection *)v142;
  }
  v143 = [v3 value];
  v144 = [v143 imagesCardSection];

  if (v144)
  {
    v145 = [SFImagesCardSection alloc];
    v146 = [v3 value];
    v147 = [v146 imagesCardSection];
    uint64_t v148 = [(SFImagesCardSection *)v145 initWithProtobuf:v147];

    v4 = (SFNullCardSection *)v148;
  }
  v149 = [v3 value];
  v150 = [v149 suggestionCardSection];

  if (v150)
  {
    v151 = [SFSuggestionCardSection alloc];
    v152 = [v3 value];
    v153 = [v152 suggestionCardSection];
    uint64_t v154 = [(SFSuggestionCardSection *)v151 initWithProtobuf:v153];

    v4 = (SFNullCardSection *)v154;
  }
  v155 = [v3 value];
  v156 = [v155 selectableGridCardSection];

  if (v156)
  {
    v157 = [SFSelectableGridCardSection alloc];
    v158 = [v3 value];
    v159 = [v158 selectableGridCardSection];
    uint64_t v160 = [(SFSelectableGridCardSection *)v157 initWithProtobuf:v159];

    v4 = (SFNullCardSection *)v160;
  }
  v161 = [v3 value];
  v162 = [v161 sectionHeaderCardSection];

  if (v162)
  {
    v163 = [SFSectionHeaderCardSection alloc];
    v164 = [v3 value];
    v165 = [v164 sectionHeaderCardSection];
    uint64_t v166 = [(SFSectionHeaderCardSection *)v163 initWithProtobuf:v165];

    v4 = (SFNullCardSection *)v166;
  }
  v167 = [v3 value];
  v168 = [v167 metaInfoCardSection];

  if (v168)
  {
    v169 = [SFMetaInfoCardSection alloc];
    v170 = [v3 value];
    v171 = [v170 metaInfoCardSection];
    uint64_t v172 = [(SFMetaInfoCardSection *)v169 initWithProtobuf:v171];

    v4 = (SFNullCardSection *)v172;
  }
  v173 = [v3 value];
  v174 = [v173 watchListCardSection];

  if (v174)
  {
    v175 = [SFWatchListCardSection alloc];
    v176 = [v3 value];
    v177 = [v176 watchListCardSection];
    uint64_t v178 = [(SFWatchListCardSection *)v175 initWithProtobuf:v177];

    v4 = (SFNullCardSection *)v178;
  }
  v179 = [v3 value];
  v180 = [v179 mapsDetailedRowCardSection];

  if (v180)
  {
    v181 = [SFMapsDetailedRowCardSection alloc];
    v182 = [v3 value];
    v183 = [v182 mapsDetailedRowCardSection];
    uint64_t v184 = [(SFMapsDetailedRowCardSection *)v181 initWithProtobuf:v183];

    v4 = (SFNullCardSection *)v184;
  }
  v185 = [v3 value];
  v186 = [v185 buttonCardSection];

  if (v186)
  {
    v187 = [SFButtonCardSection alloc];
    v188 = [v3 value];
    v189 = [v188 buttonCardSection];
    uint64_t v190 = [(SFButtonCardSection *)v187 initWithProtobuf:v189];

    v4 = (SFNullCardSection *)v190;
  }
  v191 = [v3 value];
  v192 = [v191 horizontalButtonCardSection];

  if (v192)
  {
    v193 = [SFHorizontalButtonCardSection alloc];
    v194 = [v3 value];
    v195 = [v194 horizontalButtonCardSection];
    uint64_t v196 = [(SFHorizontalButtonCardSection *)v193 initWithProtobuf:v195];

    v4 = (SFNullCardSection *)v196;
  }
  v197 = [v3 value];
  v198 = [v197 verticalLayoutCardSection];

  if (v198)
  {
    v199 = [SFVerticalLayoutCardSection alloc];
    v200 = [v3 value];
    v201 = [v200 verticalLayoutCardSection];
    uint64_t v202 = [(SFVerticalLayoutCardSection *)v199 initWithProtobuf:v201];

    v4 = (SFNullCardSection *)v202;
  }
  v203 = [v3 value];
  v204 = [v203 productCardSection];

  if (v204)
  {
    v205 = [SFProductCardSection alloc];
    v206 = [v3 value];
    v207 = [v206 productCardSection];
    uint64_t v208 = [(SFProductCardSection *)v205 initWithProtobuf:v207];

    v4 = (SFNullCardSection *)v208;
  }
  v209 = [v3 value];
  v210 = [v209 horizontalScrollCardSection];

  if (v210)
  {
    v211 = [SFHorizontalScrollCardSection alloc];
    v212 = [v3 value];
    v213 = [v212 horizontalScrollCardSection];
    uint64_t v214 = [(SFHorizontalScrollCardSection *)v211 initWithProtobuf:v213];

    v4 = (SFNullCardSection *)v214;
  }
  v215 = [v3 value];
  v216 = [v215 mediaRemoteControlCardSection];

  if (v216)
  {
    v217 = [SFMediaRemoteControlCardSection alloc];
    v218 = [v3 value];
    v219 = [v218 mediaRemoteControlCardSection];
    uint64_t v220 = [(SFMediaRemoteControlCardSection *)v217 initWithProtobuf:v219];

    v4 = (SFNullCardSection *)v220;
  }
  v221 = [v3 value];
  v222 = [v221 mapPlaceCardSection];

  if (v222)
  {
    v223 = [SFMapPlaceCardSection alloc];
    v224 = [v3 value];
    v225 = [v224 mapPlaceCardSection];
    uint64_t v226 = [(SFMapPlaceCardSection *)v223 initWithProtobuf:v225];

    v4 = (SFNullCardSection *)v226;
  }
  v227 = [v3 value];
  v228 = [v227 compactRowCardSection];

  if (v228)
  {
    v229 = [SFCompactRowCardSection alloc];
    v230 = [v3 value];
    v231 = [v230 compactRowCardSection];
    uint64_t v232 = [(SFCompactRowCardSection *)v229 initWithProtobuf:v231];

    v4 = (SFNullCardSection *)v232;
  }
  v233 = [v3 value];
  v234 = [v233 worldMapCardSection];

  if (v234)
  {
    v235 = [SFWorldMapCardSection alloc];
    v236 = [v3 value];
    v237 = [v236 worldMapCardSection];
    uint64_t v238 = [(SFWorldMapCardSection *)v235 initWithProtobuf:v237];

    v4 = (SFNullCardSection *)v238;
  }
  v239 = [v3 value];
  v240 = [v239 attributionFooterCardSection];

  if (v240)
  {
    v241 = [SFAttributionFooterCardSection alloc];
    v242 = [v3 value];
    v243 = [v242 attributionFooterCardSection];
    uint64_t v244 = [(SFAttributionFooterCardSection *)v241 initWithProtobuf:v243];

    v4 = (SFNullCardSection *)v244;
  }
  v245 = [v3 value];
  v246 = [v245 gridCardSection];

  if (v246)
  {
    v247 = [SFGridCardSection alloc];
    v248 = [v3 value];
    v249 = [v248 gridCardSection];
    uint64_t v250 = [(SFGridCardSection *)v247 initWithProtobuf:v249];

    v4 = (SFNullCardSection *)v250;
  }
  v251 = [v3 value];
  v252 = [v251 personHeaderCardSection];

  if (v252)
  {
    v253 = [SFPersonHeaderCardSection alloc];
    v254 = [v3 value];
    v255 = [v254 personHeaderCardSection];
    uint64_t v256 = [(SFPersonHeaderCardSection *)v253 initWithProtobuf:v255];

    v4 = (SFNullCardSection *)v256;
  }
  v257 = [v3 value];
  v258 = [v257 colorBarCardSection];

  if (v258)
  {
    v259 = [SFColorBarCardSection alloc];
    v260 = [v3 value];
    v261 = [v260 colorBarCardSection];
    uint64_t v262 = [(SFColorBarCardSection *)v259 initWithProtobuf:v261];

    v4 = (SFNullCardSection *)v262;
  }
  v263 = [v3 value];
  v264 = [v263 splitCardSection];

  if (v264)
  {
    v265 = [SFSplitCardSection alloc];
    v266 = [v3 value];
    v267 = [v266 splitCardSection];
    uint64_t v268 = [(SFSplitCardSection *)v265 initWithProtobuf:v267];

    v4 = (SFNullCardSection *)v268;
  }
  v269 = [v3 value];
  v270 = [v269 linkPresentationCardSection];

  if (v270)
  {
    v271 = [SFLinkPresentationCardSection alloc];
    v272 = [v3 value];
    v273 = [v272 linkPresentationCardSection];
    uint64_t v274 = [(SFLinkPresentationCardSection *)v271 initWithProtobuf:v273];

    v4 = (SFNullCardSection *)v274;
  }
  v275 = [v3 value];
  v276 = [v275 findMyCardSection];

  if (v276)
  {
    v277 = [SFFindMyCardSection alloc];
    v278 = [v3 value];
    v279 = [v278 findMyCardSection];
    uint64_t v280 = [(SFFindMyCardSection *)v277 initWithProtobuf:v279];

    v4 = (SFNullCardSection *)v280;
  }
  v281 = [v3 value];
  v282 = [v281 heroCardSection];

  if (v282)
  {
    v283 = [SFHeroCardSection alloc];
    v284 = [v3 value];
    v285 = [v284 heroCardSection];
    uint64_t v286 = [(SFHeroCardSection *)v283 initWithProtobuf:v285];

    v4 = (SFNullCardSection *)v286;
  }
  v287 = [v3 value];
  v288 = [v287 newsCardSection];

  if (v288)
  {
    v289 = [SFNewsCardSection alloc];
    v290 = [v3 value];
    v291 = [v290 newsCardSection];
    uint64_t v292 = [(SFNewsCardSection *)v289 initWithProtobuf:v291];

    v4 = (SFNullCardSection *)v292;
  }
  v293 = [v3 value];
  v294 = [v293 miniCardSection];

  if (v294)
  {
    v295 = [SFMiniCardSection alloc];
    v296 = [v3 value];
    v297 = [v296 miniCardSection];
    uint64_t v298 = [(SFMiniCardSection *)v295 initWithProtobuf:v297];

    v4 = (SFNullCardSection *)v298;
  }
  v299 = [v3 value];
  v300 = [v299 infoCardSection];

  if (v300)
  {
    v301 = [SFInfoCardSection alloc];
    v302 = [v3 value];
    v303 = [v302 infoCardSection];
    uint64_t v304 = [(SFInfoCardSection *)v301 initWithProtobuf:v303];

    v4 = (SFNullCardSection *)v304;
  }
  v305 = [v3 value];
  v306 = [v305 collectionCardSection];

  if (v306)
  {
    v307 = [SFCollectionCardSection alloc];
    v308 = [v3 value];
    v309 = [v308 collectionCardSection];
    uint64_t v310 = [(SFCollectionCardSection *)v307 initWithProtobuf:v309];

    v4 = (SFNullCardSection *)v310;
  }
  v311 = [v3 value];
  v312 = [v311 combinedCardSection];

  if (v312)
  {
    v313 = [SFCombinedCardSection alloc];
    v314 = [v3 value];
    v315 = [v314 combinedCardSection];
    uint64_t v316 = [(SFCombinedCardSection *)v313 initWithProtobuf:v315];

    v4 = (SFNullCardSection *)v316;
  }
  v317 = [v3 value];
  v318 = [v317 responseWrapperCardSection];

  if (v318)
  {
    v319 = [SFResponseWrapperCardSection alloc];
    v320 = [v3 value];
    v321 = [v320 responseWrapperCardSection];
    uint64_t v322 = [(SFResponseWrapperCardSection *)v319 initWithProtobuf:v321];

    v4 = (SFNullCardSection *)v322;
  }
  v323 = [v3 value];
  v324 = [v323 listenToCardSection];

  if (v324)
  {
    v325 = [SFListenToCardSection alloc];
    v326 = [v3 value];
    v327 = [v326 listenToCardSection];
    uint64_t v328 = [(SFListenToCardSection *)v325 initWithProtobuf:v327];

    v4 = (SFNullCardSection *)v328;
  }
  v329 = [v3 value];
  v330 = [v329 watchNowCardSection];

  if (v330)
  {
    v331 = [SFWatchNowCardSection alloc];
    v332 = [v3 value];
    v333 = [v332 watchNowCardSection];
    uint64_t v334 = [(SFWatchNowCardSection *)v331 initWithProtobuf:v333];

    v4 = (SFNullCardSection *)v334;
  }
  v335 = [v3 value];
  v336 = [v335 strokeAnimationCardSection];

  if (v336)
  {
    v337 = [SFStrokeAnimationCardSection alloc];
    v338 = [v3 value];
    v339 = [v338 strokeAnimationCardSection];
    uint64_t v340 = [(SFStrokeAnimationCardSection *)v337 initWithProtobuf:v339];

    v4 = (SFNullCardSection *)v340;
  }
  v341 = [v3 value];
  v342 = [v341 buttonListCardSection];

  if (v342)
  {
    v343 = [SFButtonListCardSection alloc];
    v344 = [v3 value];
    v345 = [v344 buttonListCardSection];
    uint64_t v346 = [(SFButtonListCardSection *)v343 initWithProtobuf:v345];

    v4 = (SFNullCardSection *)v346;
  }
  v347 = [v3 value];
  v348 = [v347 commandRowCardSection];

  if (v348)
  {
    v349 = [SFCommandRowCardSection alloc];
    v350 = [v3 value];
    v351 = [v350 commandRowCardSection];
    uint64_t v352 = [(SFCommandRowCardSection *)v349 initWithProtobuf:v351];

    v4 = (SFNullCardSection *)v352;
  }
  v353 = [v3 value];
  v354 = [v353 leadingTrailingCardSection];

  if (v354)
  {
    v355 = [SFLeadingTrailingCardSection alloc];
    v356 = [v3 value];
    v357 = [v356 leadingTrailingCardSection];
    uint64_t v358 = [(SFLeadingTrailingCardSection *)v355 initWithProtobuf:v357];

    v4 = (SFNullCardSection *)v358;
  }
  v359 = [v3 value];
  v360 = [v359 heroTitleCardSection];

  if (v360)
  {
    v361 = [SFHeroTitleCardSection alloc];
    v362 = [v3 value];
    v363 = [v362 heroTitleCardSection];
    uint64_t v364 = [(SFHeroTitleCardSection *)v361 initWithProtobuf:v363];

    v4 = (SFNullCardSection *)v364;
  }
  v365 = [v3 value];
  v366 = [v365 archiveViewCardSection];

  if (v366)
  {
    v367 = [SFArchiveViewCardSection alloc];
    v368 = [v3 value];
    v369 = [v368 archiveViewCardSection];
    uint64_t v370 = [(SFArchiveViewCardSection *)v367 initWithProtobuf:v369];

    v4 = (SFNullCardSection *)v370;
  }
  v371 = [v3 value];
  v372 = [v371 appIconCardSection];

  if (v372)
  {
    v373 = [SFAppIconCardSection alloc];
    v374 = [v3 value];
    v375 = [v374 appIconCardSection];
    uint64_t v376 = [(SFAppIconCardSection *)v373 initWithProtobuf:v375];

    v4 = (SFNullCardSection *)v376;
  }
  v377 = [v3 value];
  v378 = [v377 largeTitleDetailedRowCardSection];

  if (v378)
  {
    v379 = [SFLargeTitleDetailedRowCardSection alloc];
    v380 = [v3 value];
    v381 = [v380 largeTitleDetailedRowCardSection];
    uint64_t v382 = [(SFLargeTitleDetailedRowCardSection *)v379 initWithProtobuf:v381];

    v4 = (SFNullCardSection *)v382;
  }
  v383 = [v3 value];
  v384 = [v383 safariTableOfContentsCardSection];

  if (v384)
  {
    v385 = [SFSafariTableOfContentsCardSection alloc];
    v386 = [v3 value];
    v387 = [v386 safariTableOfContentsCardSection];
    uint64_t v388 = [(SFSafariTableOfContentsCardSection *)v385 initWithProtobuf:v387];

    v4 = (SFNullCardSection *)v388;
  }
  v389 = [v3 value];
  v390 = [v389 rfSummaryItemShortNumberCardSection];

  if (v390)
  {
    v391 = [RFSummaryItemShortNumberCardSection alloc];
    v392 = [v3 value];
    v393 = [v392 rfSummaryItemShortNumberCardSection];
    uint64_t v394 = [(RFSummaryItemShortNumberCardSection *)v391 initWithProtobuf:v393];

    v4 = (SFNullCardSection *)v394;
  }
  v395 = [v3 value];
  v396 = [v395 rfSummaryItemTextCardSection];

  if (v396)
  {
    v397 = [RFSummaryItemTextCardSection alloc];
    v398 = [v3 value];
    v399 = [v398 rfSummaryItemTextCardSection];
    uint64_t v400 = [(RFSummaryItemTextCardSection *)v397 initWithProtobuf:v399];

    v4 = (SFNullCardSection *)v400;
  }
  v401 = [v3 value];
  v402 = [v401 rfSummaryItemStandardCardSection];

  if (v402)
  {
    v403 = [RFSummaryItemStandardCardSection alloc];
    v404 = [v3 value];
    v405 = [v404 rfSummaryItemStandardCardSection];
    uint64_t v406 = [(RFSummaryItemStandardCardSection *)v403 initWithProtobuf:v405];

    v4 = (SFNullCardSection *)v406;
  }
  v407 = [v3 value];
  v408 = [v407 rfFactItemShortNumberCardSection];

  if (v408)
  {
    v409 = [RFFactItemShortNumberCardSection alloc];
    v410 = [v3 value];
    v411 = [v410 rfFactItemShortNumberCardSection];
    uint64_t v412 = [(RFFactItemShortNumberCardSection *)v409 initWithProtobuf:v411];

    v4 = (SFNullCardSection *)v412;
  }
  v413 = [v3 value];
  v414 = [v413 rfFactItemStandardCardSection];

  if (v414)
  {
    v415 = [RFFactItemStandardCardSection alloc];
    v416 = [v3 value];
    v417 = [v416 rfFactItemStandardCardSection];
    uint64_t v418 = [(RFFactItemStandardCardSection *)v415 initWithProtobuf:v417];

    v4 = (SFNullCardSection *)v418;
  }
  v419 = [v3 value];
  v420 = [v419 rfLongItemStandardCardSection];

  if (v420)
  {
    v421 = [RFLongItemStandardCardSection alloc];
    v422 = [v3 value];
    v423 = [v422 rfLongItemStandardCardSection];
    uint64_t v424 = [(RFLongItemStandardCardSection *)v421 initWithProtobuf:v423];

    v4 = (SFNullCardSection *)v424;
  }
  v425 = [v3 value];
  v426 = [v425 rfPrimaryHeaderRichCardSection];

  if (v426)
  {
    v427 = [RFPrimaryHeaderRichCardSection alloc];
    v428 = [v3 value];
    v429 = [v428 rfPrimaryHeaderRichCardSection];
    uint64_t v430 = [(RFPrimaryHeaderRichCardSection *)v427 initWithProtobuf:v429];

    v4 = (SFNullCardSection *)v430;
  }
  v431 = [v3 value];
  v432 = [v431 rfPrimaryHeaderStandardCardSection];

  if (v432)
  {
    v433 = [RFPrimaryHeaderStandardCardSection alloc];
    v434 = [v3 value];
    v435 = [v434 rfPrimaryHeaderStandardCardSection];
    uint64_t v436 = [(RFPrimaryHeaderStandardCardSection *)v433 initWithProtobuf:v435];

    v4 = (SFNullCardSection *)v436;
  }
  v437 = [v3 value];
  v438 = [v437 rfReferenceFootnoteCardSection];

  if (v438)
  {
    v439 = [RFReferenceFootnoteCardSection alloc];
    v440 = [v3 value];
    v441 = [v440 rfReferenceFootnoteCardSection];
    uint64_t v442 = [(RFReferenceFootnoteCardSection *)v439 initWithProtobuf:v441];

    v4 = (SFNullCardSection *)v442;
  }
  v443 = [v3 value];
  v444 = [v443 rfReferenceRichCardSection];

  if (v444)
  {
    v445 = [RFReferenceRichCardSection alloc];
    v446 = [v3 value];
    v447 = [v446 rfReferenceRichCardSection];
    uint64_t v448 = [(RFReferenceRichCardSection *)v445 initWithProtobuf:v447];

    v4 = (SFNullCardSection *)v448;
  }
  v449 = [v3 value];
  v450 = [v449 rfSimpleItemRichCardSection];

  if (v450)
  {
    v451 = [RFSimpleItemRichCardSection alloc];
    v452 = [v3 value];
    v453 = [v452 rfSimpleItemRichCardSection];
    uint64_t v454 = [(RFSimpleItemRichCardSection *)v451 initWithProtobuf:v453];

    v4 = (SFNullCardSection *)v454;
  }
  v455 = [v3 value];
  v456 = [v455 rfSimpleItemStandardCardSection];

  if (v456)
  {
    v457 = [RFSimpleItemStandardCardSection alloc];
    v458 = [v3 value];
    v459 = [v458 rfSimpleItemStandardCardSection];
    uint64_t v460 = [(RFSimpleItemStandardCardSection *)v457 initWithProtobuf:v459];

    v4 = (SFNullCardSection *)v460;
  }
  v461 = [v3 value];
  v462 = [v461 rfSummaryItemAlignedTextCardSection];

  if (v462)
  {
    v463 = [RFSummaryItemAlignedTextCardSection alloc];
    v464 = [v3 value];
    v465 = [v464 rfSummaryItemAlignedTextCardSection];
    uint64_t v466 = [(RFSummaryItemAlignedTextCardSection *)v463 initWithProtobuf:v465];

    v4 = (SFNullCardSection *)v466;
  }
  v467 = [v3 value];
  v468 = [v467 rfExpandableStandardCardSection];

  if (v468)
  {
    v469 = [RFExpandableStandardCardSection alloc];
    v470 = [v3 value];
    v471 = [v470 rfExpandableStandardCardSection];
    uint64_t v472 = [(RFExpandableStandardCardSection *)v469 initWithProtobuf:v471];

    v4 = (SFNullCardSection *)v472;
  }
  v473 = [v3 value];
  v474 = [v473 rfFactItemButtonCardSection];

  if (v474)
  {
    v475 = [RFFactItemButtonCardSection alloc];
    v476 = [v3 value];
    v477 = [v476 rfFactItemButtonCardSection];
    uint64_t v478 = [(RFFactItemButtonCardSection *)v475 initWithProtobuf:v477];

    v4 = (SFNullCardSection *)v478;
  }
  v479 = [v3 value];
  v480 = [v479 rfFactItemHeroNumberCardSection];

  if (v480)
  {
    v481 = [RFFactItemHeroNumberCardSection alloc];
    v482 = [v3 value];
    v483 = [v482 rfFactItemHeroNumberCardSection];
    uint64_t v484 = [(RFFactItemHeroNumberCardSection *)v481 initWithProtobuf:v483];

    v4 = (SFNullCardSection *)v484;
  }
  v485 = [v3 value];
  v486 = [v485 rfPrimaryHeaderMarqueeCardSection];

  if (v486)
  {
    v487 = [RFPrimaryHeaderMarqueeCardSection alloc];
    v488 = [v3 value];
    v489 = [v488 rfPrimaryHeaderMarqueeCardSection];
    uint64_t v490 = [(RFPrimaryHeaderMarqueeCardSection *)v487 initWithProtobuf:v489];

    v4 = (SFNullCardSection *)v490;
  }
  v491 = [v3 value];
  v492 = [v491 rfSummaryItemDetailedTextCardSection];

  if (v492)
  {
    v493 = [RFSummaryItemDetailedTextCardSection alloc];
    v494 = [v3 value];
    v495 = [v494 rfSummaryItemDetailedTextCardSection];
    uint64_t v496 = [(RFSummaryItemDetailedTextCardSection *)v493 initWithProtobuf:v495];

    v4 = (SFNullCardSection *)v496;
  }
  v497 = [v3 value];
  v498 = [v497 rfSimpleItemPlayerCardSection];

  if (v498)
  {
    v499 = [RFSimpleItemPlayerCardSection alloc];
    v500 = [v3 value];
    v501 = [v500 rfSimpleItemPlayerCardSection];
    uint64_t v502 = [(RFSimpleItemPlayerCardSection *)v499 initWithProtobuf:v501];

    v4 = (SFNullCardSection *)v502;
  }
  v503 = [v3 value];
  v504 = [v503 rfSummaryItemPairCardSection];

  if (v504)
  {
    v505 = [RFSummaryItemPairCardSection alloc];
    v506 = [v3 value];
    v507 = [v506 rfSummaryItemPairCardSection];
    uint64_t v508 = [(RFSummaryItemPairCardSection *)v505 initWithProtobuf:v507];

    v4 = (SFNullCardSection *)v508;
  }
  v509 = [v3 value];
  v510 = [v509 rfSummaryItemPairNumberCardSection];

  if (v510)
  {
    v511 = [RFSummaryItemPairNumberCardSection alloc];
    v512 = [v3 value];
    v513 = [v512 rfSummaryItemPairNumberCardSection];
    uint64_t v514 = [(RFSummaryItemPairNumberCardSection *)v511 initWithProtobuf:v513];

    v4 = (SFNullCardSection *)v514;
  }
  v515 = [v3 value];
  v516 = [v515 rfFactItemShortHeroNumberCardSection];

  if (v516)
  {
    v517 = [RFFactItemShortHeroNumberCardSection alloc];
    v518 = [v3 value];
    v519 = [v518 rfFactItemShortHeroNumberCardSection];
    uint64_t v520 = [(RFFactItemShortHeroNumberCardSection *)v517 initWithProtobuf:v519];

    v4 = (SFNullCardSection *)v520;
  }
  v521 = [v3 value];
  v522 = [v521 rfFactItemDetailedNumberCardSection];

  if (v522)
  {
    v523 = [RFFactItemDetailedNumberCardSection alloc];
    v524 = [v3 value];
    v525 = [v524 rfFactItemDetailedNumberCardSection];
    uint64_t v526 = [(RFFactItemDetailedNumberCardSection *)v523 initWithProtobuf:v525];

    v4 = (SFNullCardSection *)v526;
  }
  v527 = [v3 value];
  v528 = [v527 rfFactItemHeroButtonCardSection];

  if (v528)
  {
    v529 = [RFFactItemHeroButtonCardSection alloc];
    v530 = [v3 value];
    v531 = [v530 rfFactItemHeroButtonCardSection];
    uint64_t v532 = [(RFFactItemHeroButtonCardSection *)v529 initWithProtobuf:v531];

    v4 = (SFNullCardSection *)v532;
  }
  v533 = [v3 value];
  v534 = [v533 rfFactItemImageRightCardSection];

  if (v534)
  {
    v535 = [RFFactItemImageRightCardSection alloc];
    v536 = [v3 value];
    v537 = [v536 rfFactItemImageRightCardSection];
    uint64_t v538 = [(RFFactItemImageRightCardSection *)v535 initWithProtobuf:v537];

    v4 = (SFNullCardSection *)v538;
  }
  v539 = [v3 value];
  v540 = [v539 rfSummaryItemSwitchV2CardSection];

  if (v540)
  {
    v541 = [RFSummaryItemSwitchV2CardSection alloc];
    v542 = [v3 value];
    v543 = [v542 rfSummaryItemSwitchV2CardSection];
    uint64_t v544 = [(RFSummaryItemSwitchV2CardSection *)v541 initWithProtobuf:v543];

    v4 = (SFNullCardSection *)v544;
  }
  v545 = [v3 value];
  v546 = [v545 rfTableHeaderCardSection];

  if (v546)
  {
    v547 = [RFTableHeaderCardSection alloc];
    v548 = [v3 value];
    v549 = [v548 rfTableHeaderCardSection];
    uint64_t v550 = [(RFTableHeaderCardSection *)v547 initWithProtobuf:v549];

    v4 = (SFNullCardSection *)v550;
  }
  v551 = [v3 value];
  v552 = [v551 rfTableRowCardSection];

  if (v552)
  {
    v553 = [RFTableRowCardSection alloc];
    v554 = [v3 value];
    v555 = [v554 rfTableRowCardSection];
    uint64_t v556 = [(RFTableRowCardSection *)v553 initWithProtobuf:v555];

    v4 = (SFNullCardSection *)v556;
  }
  v557 = [v3 value];
  v558 = [v557 rfSimpleItemVisualElementCardSection];

  if (v558)
  {
    v559 = [RFSimpleItemVisualElementCardSection alloc];
    v560 = [v3 value];
    v561 = [v560 rfSimpleItemVisualElementCardSection];
    uint64_t v562 = [(RFSimpleItemVisualElementCardSection *)v559 initWithProtobuf:v561];

    v4 = (SFNullCardSection *)v562;
  }
  v563 = [v3 value];
  v564 = [v563 rfSummaryItemPlayerCardSection];

  if (v564)
  {
    v565 = [RFSummaryItemPlayerCardSection alloc];
    v566 = [v3 value];
    v567 = [v566 rfSummaryItemPlayerCardSection];
    uint64_t v568 = [(RFSummaryItemPlayerCardSection *)v565 initWithProtobuf:v567];

    v4 = (SFNullCardSection *)v568;
  }
  v569 = [v3 value];
  v570 = [v569 rfSummaryItemImageRightCardSection];

  if (v570)
  {
    v571 = [RFSummaryItemImageRightCardSection alloc];
    v572 = [v3 value];
    v573 = [v572 rfSummaryItemImageRightCardSection];
    uint64_t v574 = [(RFSummaryItemImageRightCardSection *)v571 initWithProtobuf:v573];

    v4 = (SFNullCardSection *)v574;
  }
  v575 = [v3 value];
  v576 = [v575 rfSummaryItemButtonCardSection];

  if (v576)
  {
    v577 = [RFSummaryItemButtonCardSection alloc];
    v578 = [v3 value];
    v579 = [v578 rfSummaryItemButtonCardSection];
    uint64_t v580 = [(RFSummaryItemButtonCardSection *)v577 initWithProtobuf:v579];

    v4 = (SFNullCardSection *)v580;
  }
  v581 = [v3 value];
  v582 = [v581 rfSimpleItemReverseRichCardSection];

  if (v582)
  {
    v583 = [RFSimpleItemReverseRichCardSection alloc];
    v584 = [v3 value];
    v585 = [v584 rfSimpleItemReverseRichCardSection];
    uint64_t v586 = [(RFSimpleItemReverseRichCardSection *)v583 initWithProtobuf:v585];

    v4 = (SFNullCardSection *)v586;
  }
  v587 = [v3 value];
  v588 = [v587 rfSimpleItemRichSearchResultCardSection];

  if (v588)
  {
    v589 = [RFSimpleItemRichSearchResultCardSection alloc];
    v590 = [v3 value];
    v591 = [v590 rfSimpleItemRichSearchResultCardSection];
    uint64_t v592 = [(RFSimpleItemRichSearchResultCardSection *)v589 initWithProtobuf:v591];

    v4 = (SFNullCardSection *)v592;
  }
  v593 = [v3 value];
  v594 = [v593 rfPrimaryHeaderStackedImageCardSection];

  if (v594)
  {
    v595 = [RFPrimaryHeaderStackedImageCardSection alloc];
    v596 = [v3 value];
    v597 = [v596 rfPrimaryHeaderStackedImageCardSection];
    uint64_t v598 = [(RFPrimaryHeaderStackedImageCardSection *)v595 initWithProtobuf:v597];

    v4 = (SFNullCardSection *)v598;
  }
  v599 = [v3 value];
  v600 = [v599 rfReferenceItemLogoCardSection];

  if (v600)
  {
    v601 = [RFReferenceItemLogoCardSection alloc];
    v602 = [v3 value];
    v603 = [v602 rfReferenceItemLogoCardSection];
    uint64_t v604 = [(RFReferenceItemLogoCardSection *)v601 initWithProtobuf:v603];

    v4 = (SFNullCardSection *)v604;
  }
  v605 = [v3 value];
  v606 = [v605 rfReferenceItemButtonCardSection];

  if (v606)
  {
    v607 = [RFReferenceItemButtonCardSection alloc];
    v608 = [v3 value];
    v609 = [v608 rfReferenceItemButtonCardSection];
    uint64_t v610 = [(RFReferenceItemButtonCardSection *)v607 initWithProtobuf:v609];

    v4 = (SFNullCardSection *)v610;
  }
  v611 = [v3 value];
  v612 = [v611 rfButtonCardSection];

  if (v612)
  {
    v613 = [RFButtonCardSection alloc];
    v614 = [v3 value];
    v615 = [v614 rfButtonCardSection];
    uint64_t v616 = [(RFButtonCardSection *)v613 initWithProtobuf:v615];

    v4 = (SFNullCardSection *)v616;
  }
  v617 = [v3 value];
  v618 = [v617 rfBinaryButtonCardSection];

  if (v618)
  {
    v619 = [RFBinaryButtonCardSection alloc];
    v620 = [v3 value];
    v621 = [v620 rfBinaryButtonCardSection];
    uint64_t v622 = [(RFBinaryButtonCardSection *)v619 initWithProtobuf:v621];

    v4 = (SFNullCardSection *)v622;
  }
  v623 = [v3 value];
  v624 = [v623 rfReferenceCenteredCardSection];

  if (v624)
  {
    v625 = [RFReferenceCenteredCardSection alloc];
    v626 = [v3 value];
    v627 = [v626 rfReferenceCenteredCardSection];
    uint64_t v628 = [(RFReferenceCenteredCardSection *)v625 initWithProtobuf:v627];

    v4 = (SFNullCardSection *)v628;
  }
  v629 = [v3 value];
  v630 = [v629 rfSecondaryHeaderStandardCardSection];

  if (v630)
  {
    v631 = [RFSecondaryHeaderStandardCardSection alloc];
    v632 = [v3 value];
    v633 = [v632 rfSecondaryHeaderStandardCardSection];
    uint64_t v634 = [(RFSecondaryHeaderStandardCardSection *)v631 initWithProtobuf:v633];

    v4 = (SFNullCardSection *)v634;
  }
  v635 = [v3 value];
  v636 = [v635 rfSecondaryHeaderEmphasizedCardSection];

  if (v636)
  {
    v637 = [RFSecondaryHeaderEmphasizedCardSection alloc];
    v638 = [v3 value];
    v639 = [v638 rfSecondaryHeaderEmphasizedCardSection];
    uint64_t v640 = [(RFSecondaryHeaderEmphasizedCardSection *)v637 initWithProtobuf:v639];

    v4 = (SFNullCardSection *)v640;
  }
  v641 = [v3 value];
  v642 = [v641 rfMapCardSection];

  if (v642)
  {
    v643 = [RFMapCardSection alloc];
    v644 = [v3 value];
    v645 = [v644 rfMapCardSection];
    uint64_t v646 = [(RFMapCardSection *)v643 initWithProtobuf:v645];

    v4 = (SFNullCardSection *)v646;
  }
  v647 = [v3 value];
  v648 = [v647 rfReferenceStandardCardSection];

  if (v648)
  {
    v649 = [RFReferenceStandardCardSection alloc];
    v650 = [v3 value];
    v651 = [v650 rfReferenceStandardCardSection];
    uint64_t v652 = [(RFReferenceStandardCardSection *)v649 initWithProtobuf:v651];

    v4 = (SFNullCardSection *)v652;
  }
  v653 = [v3 value];
  v654 = [v653 rfMultiButtonCardSection];

  if (v654)
  {
    v655 = [RFMultiButtonCardSection alloc];
    v656 = [v3 value];
    v657 = [v656 rfMultiButtonCardSection];
    uint64_t v658 = [(RFMultiButtonCardSection *)v655 initWithProtobuf:v657];

    v4 = (SFNullCardSection *)v658;
  }
  v659 = [v3 value];
  v660 = [v659 rfDisambiguationTitleCardSection];

  if (v660)
  {
    v661 = [RFDisambiguationTitleCardSection alloc];
    v662 = [v3 value];
    v663 = [v662 rfDisambiguationTitleCardSection];
    uint64_t v664 = [(RFDisambiguationTitleCardSection *)v661 initWithProtobuf:v663];

    v4 = (SFNullCardSection *)v664;
  }
  v665 = [v3 nextCard];

  if (v665)
  {
    v666 = [SFCard alloc];
    v667 = [v3 nextCard];
    v668 = [(SFCard *)v666 initWithProtobuf:v667];
    [(SFCardSection *)v4 setNextCard:v668];
  }
  v669 = [v3 commands];
  uint64_t v670 = [v669 count];

  if (v670)
  {
    v671 = [v3 commands];
    if (v671)
    {
      id v672 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v672 = 0;
    }

    long long v806 = 0u;
    long long v807 = 0u;
    long long v804 = 0u;
    long long v805 = 0u;
    v673 = [v3 commands];
    uint64_t v674 = [v673 countByEnumeratingWithState:&v804 objects:v814 count:16];
    if (v674)
    {
      uint64_t v675 = v674;
      uint64_t v676 = *(void *)v805;
      do
      {
        for (uint64_t i = 0; i != v675; ++i)
        {
          if (*(void *)v805 != v676) {
            objc_enumerationMutation(v673);
          }
          v678 = [[SFAbstractCommand alloc] initWithProtobuf:*(void *)(*((void *)&v804 + 1) + 8 * i)];
          if (v678) {
            [v672 addObject:v678];
          }
        }
        uint64_t v675 = [v673 countByEnumeratingWithState:&v804 objects:v814 count:16];
      }
      while (v675);
    }

    [(SFCardSection *)v4 setCommands:v672];
  }
  v679 = [v3 parameterKeyPaths];
  uint64_t v680 = [v679 count];

  if (v680)
  {
    v681 = [v3 parameterKeyPaths];
    if (v681)
    {
      id v682 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v682 = 0;
    }

    long long v802 = 0u;
    long long v803 = 0u;
    long long v800 = 0u;
    long long v801 = 0u;
    v683 = [v3 parameterKeyPaths];
    uint64_t v684 = [v683 countByEnumeratingWithState:&v800 objects:v813 count:16];
    if (v684)
    {
      uint64_t v685 = v684;
      uint64_t v686 = *(void *)v801;
      do
      {
        for (uint64_t j = 0; j != v685; ++j)
        {
          if (*(void *)v801 != v686) {
            objc_enumerationMutation(v683);
          }
          id v688 = *(id *)(*((void *)&v800 + 1) + 8 * j);
          if (v688) {
            [v682 addObject:v688];
          }
        }
        uint64_t v685 = [v683 countByEnumeratingWithState:&v800 objects:v813 count:16];
      }
      while (v685);
    }

    [(SFCardSection *)v4 setParameterKeyPaths:v682];
  }
  v689 = [v3 cardSectionId];

  if (v689)
  {
    v690 = [v3 cardSectionId];
    [(SFCardSection *)v4 setCardSectionId:v690];
  }
  v691 = [v3 resultIdentifier];

  if (v691)
  {
    v692 = [v3 resultIdentifier];
    [(SFCardSection *)v4 setResultIdentifier:v692];
  }
  v693 = [v3 userReportRequest];

  if (v693)
  {
    v694 = [SFUserReportRequest alloc];
    v695 = [v3 userReportRequest];
    v696 = [(SFUserReportRequest *)v694 initWithProtobuf:v695];
    [(SFCardSection *)v4 setUserReportRequest:v696];
  }
  v697 = [v3 command];

  if (v697)
  {
    v698 = [SFCommand alloc];
    v699 = [v3 command];
    v700 = [(SFCommand *)v698 initWithProtobuf:v699];
    [(SFCardSection *)v4 setCommand:v700];
  }
  v701 = [v3 previewCommand];

  if (v701)
  {
    v702 = [SFCommand alloc];
    v703 = [v3 previewCommand];
    v704 = [(SFCommand *)v702 initWithProtobuf:v703];
    [(SFCardSection *)v4 setPreviewCommand:v704];
  }
  v705 = [v3 previewButtonItems];
  uint64_t v706 = [v705 count];

  if (v706)
  {
    v707 = [v3 previewButtonItems];
    if (v707)
    {
      id v708 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v708 = 0;
    }

    long long v798 = 0u;
    long long v799 = 0u;
    long long v796 = 0u;
    long long v797 = 0u;
    v709 = [v3 previewButtonItems];
    uint64_t v710 = [v709 countByEnumeratingWithState:&v796 objects:v812 count:16];
    if (v710)
    {
      uint64_t v711 = v710;
      uint64_t v712 = *(void *)v797;
      do
      {
        for (uint64_t k = 0; k != v711; ++k)
        {
          if (*(void *)v797 != v712) {
            objc_enumerationMutation(v709);
          }
          v714 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v796 + 1) + 8 * k)];
          if (v714) {
            [v708 addObject:v714];
          }
        }
        uint64_t v711 = [v709 countByEnumeratingWithState:&v796 objects:v812 count:16];
      }
      while (v711);
    }

    [(SFCardSection *)v4 setPreviewButtonItems:v708];
  }
  v715 = [v3 cardSectionDetail];

  if (v715)
  {
    v716 = [v3 cardSectionDetail];
    [(SFCardSection *)v4 setCardSectionDetail:v716];
  }
  v717 = [v3 previewButtonItemsTitle];

  if (v717)
  {
    v718 = [v3 previewButtonItemsTitle];
    [(SFCardSection *)v4 setPreviewButtonItemsTitle:v718];
  }
  v719 = [v3 backgroundColor];

  if (v719)
  {
    v720 = [SFColor alloc];
    v721 = [v3 backgroundColor];
    v722 = [(SFColor *)v720 initWithProtobuf:v721];
    [(SFCardSection *)v4 setBackgroundColor:v722];
  }
  if ([v3 shouldHideInAmbientMode]) {
    -[SFCardSection setShouldHideInAmbientMode:](v4, "setShouldHideInAmbientMode:", [v3 shouldHideInAmbientMode]);
  }
  v723 = [v3 leadingSwipeButtonItems];
  uint64_t v724 = [v723 count];

  if (v724)
  {
    v725 = [v3 leadingSwipeButtonItems];
    if (v725)
    {
      id v726 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v726 = 0;
    }

    long long v794 = 0u;
    long long v795 = 0u;
    long long v792 = 0u;
    long long v793 = 0u;
    v727 = [v3 leadingSwipeButtonItems];
    uint64_t v728 = [v727 countByEnumeratingWithState:&v792 objects:v811 count:16];
    if (v728)
    {
      uint64_t v729 = v728;
      uint64_t v730 = *(void *)v793;
      do
      {
        for (uint64_t m = 0; m != v729; ++m)
        {
          if (*(void *)v793 != v730) {
            objc_enumerationMutation(v727);
          }
          v732 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v792 + 1) + 8 * m)];
          if (v732) {
            [v726 addObject:v732];
          }
        }
        uint64_t v729 = [v727 countByEnumeratingWithState:&v792 objects:v811 count:16];
      }
      while (v729);
    }

    [(SFCardSection *)v4 setLeadingSwipeButtonItems:v726];
  }
  v733 = [v3 trailingSwipeButtonItems];
  uint64_t v734 = [v733 count];

  if (v734)
  {
    v735 = [v3 trailingSwipeButtonItems];
    if (v735)
    {
      id v736 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v736 = 0;
    }

    long long v790 = 0u;
    long long v791 = 0u;
    long long v788 = 0u;
    long long v789 = 0u;
    v737 = [v3 trailingSwipeButtonItems];
    uint64_t v738 = [v737 countByEnumeratingWithState:&v788 objects:v810 count:16];
    if (v738)
    {
      uint64_t v739 = v738;
      uint64_t v740 = *(void *)v789;
      do
      {
        for (uint64_t n = 0; n != v739; ++n)
        {
          if (*(void *)v789 != v740) {
            objc_enumerationMutation(v737);
          }
          v742 = [[SFButtonItem alloc] initWithProtobuf:*(void *)(*((void *)&v788 + 1) + 8 * n)];
          if (v742) {
            [v736 addObject:v742];
          }
        }
        uint64_t v739 = [v737 countByEnumeratingWithState:&v788 objects:v810 count:16];
      }
      while (v739);
    }

    [(SFCardSection *)v4 setTrailingSwipeButtonItems:v736];
  }
  v743 = [v3 punchoutOptions];
  uint64_t v744 = [v743 count];

  if (v744)
  {
    v745 = [v3 punchoutOptions];
    if (v745)
    {
      id v746 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v746 = 0;
    }

    long long v786 = 0u;
    long long v787 = 0u;
    long long v784 = 0u;
    long long v785 = 0u;
    v747 = [v3 punchoutOptions];
    uint64_t v748 = [v747 countByEnumeratingWithState:&v784 objects:v809 count:16];
    if (v748)
    {
      uint64_t v749 = v748;
      uint64_t v750 = *(void *)v785;
      do
      {
        for (iuint64_t i = 0; ii != v749; ++ii)
        {
          if (*(void *)v785 != v750) {
            objc_enumerationMutation(v747);
          }
          v752 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v784 + 1) + 8 * ii)];
          if (v752) {
            [v746 addObject:v752];
          }
        }
        uint64_t v749 = [v747 countByEnumeratingWithState:&v784 objects:v809 count:16];
      }
      while (v749);
    }

    [(SFCardSection *)v4 setPunchoutOptions:v746];
  }
  v753 = [v3 punchoutPickerTitle];

  if (v753)
  {
    v754 = [v3 punchoutPickerTitle];
    [(SFCardSection *)v4 setPunchoutPickerTitle:v754];
  }
  v755 = [v3 punchoutPickerDismissText];

  if (v755)
  {
    v756 = [v3 punchoutPickerDismissText];
    [(SFCardSection *)v4 setPunchoutPickerDismissText:v756];
  }
  if ([v3 canBeHidden]) {
    -[SFCardSection setCanBeHidden:](v4, "setCanBeHidden:", [v3 canBeHidden]);
  }
  if ([v3 hasTopPadding]) {
    -[SFCardSection setHasTopPadding:](v4, "setHasTopPadding:", [v3 hasTopPadding]);
  }
  if ([v3 hasBottomPadding]) {
    -[SFCardSection setHasBottomPadding:](v4, "setHasBottomPadding:", [v3 hasBottomPadding]);
  }
  if ([v3 separatorStyle]) {
    -[SFCardSection setSeparatorStyle:](v4, "setSeparatorStyle:", [v3 separatorStyle]);
  }
  v757 = [v3 referencedCommands];
  uint64_t v758 = [v757 count];

  if (v758)
  {
    v759 = [v3 referencedCommands];
    if (v759)
    {
      id v760 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else
    {
      id v760 = 0;
    }

    long long v782 = 0u;
    long long v783 = 0u;
    long long v780 = 0u;
    long long v781 = 0u;
    v761 = [v3 referencedCommands];
    uint64_t v762 = [v761 countByEnumeratingWithState:&v780 objects:v808 count:16];
    if (v762)
    {
      uint64_t v763 = v762;
      uint64_t v764 = *(void *)v781;
      do
      {
        for (juint64_t j = 0; jj != v763; ++jj)
        {
          if (*(void *)v781 != v764) {
            objc_enumerationMutation(v761);
          }
          v766 = [[SFCommand alloc] initWithProtobuf:*(void *)(*((void *)&v780 + 1) + 8 * jj)];
          if (v766) {
            [v760 addObject:v766];
          }
        }
        uint64_t v763 = [v761 countByEnumeratingWithState:&v780 objects:v808 count:16];
      }
      while (v763);
    }

    [(SFCardSection *)v4 setReferencedCommands:v760];
  }
  if ([v3 forceEnable3DTouch]) {
    -[SFCardSection setForceEnable3DTouch:](v4, "setForceEnable3DTouch:", [v3 forceEnable3DTouch]);
  }
  if ([v3 shouldShowInSmartDialog]) {
    -[SFCardSection setShouldShowInSmartDialog:](v4, "setShouldShowInSmartDialog:", [v3 shouldShowInSmartDialog]);
  }
  v767 = [v3 appEntityAnnotation];

  if (v767)
  {
    v768 = [SFAppEntityAnnotation alloc];
    v769 = [v3 appEntityAnnotation];
    v770 = [(SFAppEntityAnnotation *)v768 initWithProtobuf:v769];
    [(SFCardSection *)v4 setAppEntityAnnotation:v770];
  }
  v771 = [v3 emphasisSubjectId];

  if (v771)
  {
    v772 = [v3 emphasisSubjectId];
    [(SFCardSection *)v4 setEmphasisSubjectId:v772];
  }
  if ([v3 increasedContrastMode]) {
    -[SFCardSection setIncreasedContrastMode:](v4, "setIncreasedContrastMode:", [v3 increasedContrastMode]);
  }
  v773 = [v3 secondaryCommand];

  if (v773)
  {
    v774 = [SFCommand alloc];
    v775 = [v3 secondaryCommand];
    v776 = [(SFCommand *)v774 initWithProtobuf:v775];
    [(SFCardSection *)v4 setSecondaryCommand:v776];
  }
  if ([v3 requiredLevelOfDetail]) {
    -[SFCardSection setRequiredLevelOfDetail:](v4, "setRequiredLevelOfDetail:", [v3 requiredLevelOfDetail]);
  }
  v777 = v4;

  return v777;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryCommand, 0);
  objc_storeStrong((id *)&self->_emphasisSubjectId, 0);
  objc_storeStrong((id *)&self->_appEntityAnnotation, 0);
  objc_storeStrong((id *)&self->_referencedCommands, 0);
  objc_storeStrong((id *)&self->_trailingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_leadingSwipeButtonItems, 0);
  objc_storeStrong((id *)&self->_previewButtonItemsTitle, 0);
  objc_storeStrong((id *)&self->_cardSectionDetail, 0);
  objc_storeStrong((id *)&self->_commandDetail, 0);
  objc_storeStrong((id *)&self->_previewButtonItems, 0);
  objc_storeStrong((id *)&self->_previewCommand, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_userReportRequest, 0);
  objc_storeStrong((id *)&self->_resultIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_cardSectionId, 0);
  objc_storeStrong((id *)&self->_parameterKeyPaths, 0);
  objc_storeStrong((id *)&self->_punchoutPickerDismissText, 0);
  objc_storeStrong((id *)&self->_punchoutOptions, 0);
  objc_storeStrong((id *)&self->_punchoutPickerTitle, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_nextCard, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setRequiredLevelOfDetail:(int)a3
{
  self->_requiredLevelOfDetail = a3;
}

- (int)requiredLevelOfDetail
{
  return self->_requiredLevelOfDetail;
}

- (void)setSecondaryCommand:(id)a3
{
}

- (SFCommand)secondaryCommand
{
  return self->_secondaryCommand;
}

- (void)setIncreasedContrastMode:(int)a3
{
  self->_increasedContrastMode = a3;
}

- (int)increasedContrastMode
{
  return self->_increasedContrastMode;
}

- (void)setEmphasisSubjectId:(id)a3
{
}

- (NSString)emphasisSubjectId
{
  return self->_emphasisSubjectId;
}

- (void)setAppEntityAnnotation:(id)a3
{
}

- (SFAppEntityAnnotation)appEntityAnnotation
{
  return self->_appEntityAnnotation;
}

- (void)setShouldShowInSmartDialog:(BOOL)a3
{
  self->_shouldShowInSmartDialog = a3;
}

- (BOOL)shouldShowInSmartDialog
{
  return self->_shouldShowInSmartDialog;
}

- (void)setForceEnable3DTouch:(BOOL)a3
{
  self->_forceEnable3DTouch = a3;
}

- (BOOL)forceEnable3DTouch
{
  return self->_forceEnable3DTouch;
}

- (void)setReferencedCommands:(id)a3
{
}

- (NSArray)referencedCommands
{
  return self->_referencedCommands;
}

- (void)setTrailingSwipeButtonItems:(id)a3
{
}

- (NSArray)trailingSwipeButtonItems
{
  return self->_trailingSwipeButtonItems;
}

- (void)setLeadingSwipeButtonItems:(id)a3
{
}

- (NSArray)leadingSwipeButtonItems
{
  return self->_leadingSwipeButtonItems;
}

- (void)setShouldHideInAmbientMode:(BOOL)a3
{
  self->_shouldHideInAmbientMode = a3;
}

- (BOOL)shouldHideInAmbientMode
{
  return self->_shouldHideInAmbientMode;
}

- (void)setPreviewButtonItemsTitle:(id)a3
{
}

- (NSString)previewButtonItemsTitle
{
  return self->_previewButtonItemsTitle;
}

- (void)setCardSectionDetail:(id)a3
{
}

- (NSString)cardSectionDetail
{
  return self->_cardSectionDetail;
}

- (void)setCommandDetail:(id)a3
{
}

- (NSString)commandDetail
{
  return self->_commandDetail;
}

- (void)setPreviewButtonItems:(id)a3
{
}

- (NSArray)previewButtonItems
{
  return self->_previewButtonItems;
}

- (void)setPreviewCommand:(id)a3
{
}

- (SFCommand)previewCommand
{
  return self->_previewCommand;
}

- (void)setCommand:(id)a3
{
}

- (SFCommand)command
{
  return self->_command;
}

- (void)setUserReportRequest:(id)a3
{
}

- (SFUserReportRequest)userReportRequest
{
  return self->_userReportRequest;
}

- (void)setResultIdentifier:(id)a3
{
}

- (NSString)resultIdentifier
{
  return self->_resultIdentifier;
}

- (void)setBackgroundColor:(id)a3
{
}

- (SFColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setCardSectionId:(id)a3
{
}

- (NSString)cardSectionId
{
  return self->_cardSectionId;
}

- (void)setParameterKeyPaths:(id)a3
{
}

- (NSArray)parameterKeyPaths
{
  return self->_parameterKeyPaths;
}

- (int)separatorStyle
{
  return self->_separatorStyle;
}

- (BOOL)hasTopPadding
{
  return self->_hasTopPadding;
}

- (BOOL)canBeHidden
{
  return self->_canBeHidden;
}

- (void)setPunchoutPickerDismissText:(id)a3
{
}

- (NSString)punchoutPickerDismissText
{
  return self->_punchoutPickerDismissText;
}

- (void)setPunchoutOptions:(id)a3
{
}

- (NSArray)punchoutOptions
{
  return self->_punchoutOptions;
}

- (void)setPunchoutPickerTitle:(id)a3
{
}

- (NSString)punchoutPickerTitle
{
  return self->_punchoutPickerTitle;
}

- (void)setCommands:(id)a3
{
}

- (NSArray)commands
{
  return self->_commands;
}

- (BOOL)hasBottomPadding
{
  return self->_hasBottomPadding;
}

- (void)setNextCard:(id)a3
{
}

- (SFCard)nextCard
{
  return self->_nextCard;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)sectionsWithCards
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)addCardsFromEmbeddedSectionsTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(SFCardSection *)self sectionsWithCards];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) embeddedCards];
        [v4 addObjectsFromArray:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)addCardsFromButtonsTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(SFCardSection *)self previewButtonItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = [v10 command];
          long long v12 = [v11 embeddedCards];
          [v4 addObjectsFromArray:v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)addCardsFromCommandsTo:(id)a3
{
  id v4 = a3;
  v5 = [(SFCardSection *)self previewCommand];
  uint64_t v6 = [v5 embeddedCards];
  [v4 addObjectsFromArray:v6];

  id v8 = [(SFCardSection *)self command];
  uint64_t v7 = [v8 embeddedCards];
  [v4 addObjectsFromArray:v7];
}

- (NSArray)embeddedCards
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  id v4 = [(SFCardSection *)self nextCard];

  if (v4)
  {
    v5 = [(SFCardSection *)self nextCard];
    [v3 addObject:v5];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(SFCardSection *)self nextCard];
    uint64_t v7 = [v6 cardSections];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) embeddedCards];
          [v3 addObjectsFromArray:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  [(SFCardSection *)self addCardsFromCommandsTo:v3];
  [(SFCardSection *)self addCardsFromButtonsTo:v3];
  [(SFCardSection *)self addCardsFromEmbeddedSectionsTo:v3];
  return (NSArray *)v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_punchoutOptions hash];
  NSUInteger v4 = [(NSString *)self->_punchoutPickerTitle hash] ^ v3;
  NSUInteger v5 = v4 ^ [(NSString *)self->_punchoutPickerDismissText hash] ^ self->_canBeHidden;
  unint64_t v6 = self->_hasTopPadding ^ (unint64_t)self->_hasBottomPadding;
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_type hash] ^ self->_separatorStyle;
  unint64_t v8 = [(SFCard *)self->_nextCard hash];
  uint64_t v9 = v8 ^ [(NSArray *)self->_commands hash];
  uint64_t v10 = v9 ^ [(NSArray *)self->_parameterKeyPaths hash];
  NSUInteger v11 = v7 ^ v10 ^ [(NSString *)self->_cardSectionId hash];
  NSUInteger v12 = [(NSString *)self->_resultIdentifier hash];
  unint64_t v13 = v12 ^ [(SFColor *)self->_backgroundColor hash];
  unint64_t v14 = v13 ^ [(SFCommand *)self->_command hash];
  unint64_t v15 = v14 ^ [(SFCommand *)self->_previewCommand hash];
  uint64_t v16 = v11 ^ v15 ^ [(NSArray *)self->_previewButtonItems hash];
  NSUInteger v17 = [(NSString *)self->_commandDetail hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_cardSectionDetail hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_previewButtonItemsTitle hash] ^ self->_shouldHideInAmbientMode;
  uint64_t v20 = v19 ^ [(NSArray *)self->_leadingSwipeButtonItems hash];
  uint64_t v21 = v16 ^ v20 ^ [(NSArray *)self->_trailingSwipeButtonItems hash];
  unint64_t v22 = self->_forceEnable3DTouch ^ (unint64_t)self->_shouldShowInSmartDialog;
  unint64_t v23 = v22 ^ [(SFAppEntityAnnotation *)self->_appEntityAnnotation hash];
  return v21 ^ v23 ^ [(NSString *)self->_emphasisSubjectId hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (SFCardSection *)a3;
  if (self == v4)
  {
    BOOL v27 = 1;
  }
  else
  {
    if ([(SFCardSection *)v4 isMemberOfClass:objc_opt_class()])
    {
      NSUInteger v5 = v4;
      punchoutOptions = self->_punchoutOptions;
      if ((punchoutOptions != 0) != (v5->_punchoutOptions == 0)
        && (!punchoutOptions || -[NSArray isEqual:](punchoutOptions, "isEqual:")))
      {
        punchoutPickerTitle = self->_punchoutPickerTitle;
        if ((punchoutPickerTitle != 0) != (v5->_punchoutPickerTitle == 0)
          && (!punchoutPickerTitle || -[NSString isEqual:](punchoutPickerTitle, "isEqual:")))
        {
          punchoutPickerDismissText = self->_punchoutPickerDismissText;
          if ((punchoutPickerDismissText != 0) != (v5->_punchoutPickerDismissText == 0)
            && (!punchoutPickerDismissText || -[NSString isEqual:](punchoutPickerDismissText, "isEqual:"))
            && self->_canBeHidden == v5->_canBeHidden
            && self->_hasTopPadding == v5->_hasTopPadding
            && self->_hasBottomPadding == v5->_hasBottomPadding)
          {
            type = self->_type;
            if ((type != 0) != (v5->_type == 0)
              && (!type || -[NSString isEqual:](type, "isEqual:"))
              && self->_separatorStyle == v5->_separatorStyle)
            {
              nextCard = self->_nextCard;
              if ((nextCard != 0) != (v5->_nextCard == 0)
                && (!nextCard || -[SFCard isEqual:](nextCard, "isEqual:")))
              {
                commands = self->_commands;
                if ((commands != 0) != (v5->_commands == 0)
                  && (!commands || -[NSArray isEqual:](commands, "isEqual:")))
                {
                  parameterKeyPaths = self->_parameterKeyPaths;
                  if ((parameterKeyPaths != 0) != (v5->_parameterKeyPaths == 0)
                    && (!parameterKeyPaths || -[NSArray isEqual:](parameterKeyPaths, "isEqual:")))
                  {
                    cardSectionId = self->_cardSectionId;
                    if ((cardSectionId != 0) != (v5->_cardSectionId == 0)
                      && (!cardSectionId || -[NSString isEqual:](cardSectionId, "isEqual:")))
                    {
                      resultIdentifier = self->_resultIdentifier;
                      if ((resultIdentifier != 0) != (v5->_resultIdentifier == 0)
                        && (!resultIdentifier || -[NSString isEqual:](resultIdentifier, "isEqual:")))
                      {
                        backgroundColor = self->_backgroundColor;
                        if ((backgroundColor != 0) != (v5->_backgroundColor == 0)
                          && (!backgroundColor || -[SFColor isEqual:](backgroundColor, "isEqual:")))
                        {
                          command = self->_command;
                          if ((command != 0) != (v5->_command == 0)
                            && (!command || -[SFCommand isEqual:](command, "isEqual:")))
                          {
                            previewCommand = self->_previewCommand;
                            if ((previewCommand != 0) != (v5->_previewCommand == 0)
                              && (!previewCommand || -[SFCommand isEqual:](previewCommand, "isEqual:")))
                            {
                              previewButtonItems = self->_previewButtonItems;
                              if ((previewButtonItems != 0) != (v5->_previewButtonItems == 0)
                                && (!previewButtonItems
                                 || -[NSArray isEqual:](previewButtonItems, "isEqual:")))
                              {
                                commandDetail = self->_commandDetail;
                                if ((commandDetail != 0) != (v5->_commandDetail == 0)
                                  && (!commandDetail || -[NSString isEqual:](commandDetail, "isEqual:")))
                                {
                                  cardSectionDetail = self->_cardSectionDetail;
                                  if ((cardSectionDetail != 0) != (v5->_cardSectionDetail == 0)
                                    && (!cardSectionDetail
                                     || -[NSString isEqual:](cardSectionDetail, "isEqual:")))
                                  {
                                    previewButtonItemsTitle = self->_previewButtonItemsTitle;
                                    if ((previewButtonItemsTitle != 0) != (v5->_previewButtonItemsTitle == 0)
                                      && (!previewButtonItemsTitle
                                       || -[NSString isEqual:](previewButtonItemsTitle, "isEqual:"))
                                      && self->_shouldHideInAmbientMode == v5->_shouldHideInAmbientMode
                                      && self->_leadingSwipeButtonItems == v5->_leadingSwipeButtonItems
                                      && self->_trailingSwipeButtonItems == v5->_trailingSwipeButtonItems
                                      && self->_forceEnable3DTouch == v5->_forceEnable3DTouch
                                      && self->_shouldShowInSmartDialog == v5->_shouldShowInSmartDialog)
                                    {
                                      appEntityAnnotatiouint64_t n = self->_appEntityAnnotation;
                                      if ((appEntityAnnotation != 0) != (v5->_appEntityAnnotation == 0)
                                        && (!appEntityAnnotation
                                         || -[SFAppEntityAnnotation isEqual:](appEntityAnnotation, "isEqual:")))
                                      {
                                        emphasisSubjectId = self->_emphasisSubjectId;
                                        if ((emphasisSubjectId != 0) != (v5->_emphasisSubjectId == 0)
                                          && (!emphasisSubjectId
                                           || -[NSString isEqual:](emphasisSubjectId, "isEqual:"))
                                          && self->_increasedContrastMode == v5->_increasedContrastMode)
                                        {
                                          int requiredLevelOfDetail = self->_requiredLevelOfDetail;
                                          if (requiredLevelOfDetail == v5->_requiredLevelOfDetail)
                                          {
                                            secondaryCommand = self->_secondaryCommand;
                                            if ((secondaryCommand != 0) != (v5->_secondaryCommand == 0))
                                            {
                                              if (!secondaryCommand)
                                              {
                                                int v26 = self->_requiredLevelOfDetail;
                                                goto LABEL_78;
                                              }
                                              if (-[SFCommand isEqual:](secondaryCommand, "isEqual:"))
                                              {
                                                int v26 = self->_requiredLevelOfDetail;
                                                int requiredLevelOfDetail = v5->_requiredLevelOfDetail;
LABEL_78:
                                                BOOL v27 = v26 == requiredLevelOfDetail;
                                                goto LABEL_75;
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      BOOL v27 = 0;
LABEL_75:

      goto LABEL_76;
    }
    BOOL v27 = 0;
  }
LABEL_76:

  return v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFColor *)self->_backgroundColor copy];
  unint64_t v6 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v5;

  *(unsigned char *)(v4 + 13) = self->_canBeHidden;
  uint64_t v7 = [(NSString *)self->_cardSectionDetail copy];
  unint64_t v8 = *(void **)(v4 + 152);
  *(void *)(v4 + 152) = v7;

  uint64_t v9 = [(NSString *)self->_cardSectionId copy];
  uint64_t v10 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v9;

  uint64_t v11 = [(SFCommand *)self->_command copy];
  NSUInteger v12 = *(void **)(v4 + 120);
  *(void *)(v4 + 120) = v11;

  uint64_t v13 = [(NSString *)self->_commandDetail copy];
  unint64_t v14 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v13;

  *(unsigned char *)(v4 + 12) = self->_hasBottomPadding;
  *(unsigned char *)(v4 + 14) = self->_hasTopPadding;
  *(unsigned char *)(v4 + 15) = self->_hideDivider;
  objc_storeStrong((id *)(v4 + 168), self->_leadingSwipeButtonItems);
  uint64_t v15 = [(SFCard *)self->_nextCard copy];
  uint64_t v16 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v15;

  uint64_t v17 = [(NSArray *)self->_previewButtonItems copy];
  NSUInteger v18 = *(void **)(v4 + 136);
  *(void *)(v4 + 136) = v17;

  uint64_t v19 = [(NSString *)self->_previewButtonItemsTitle copy];
  uint64_t v20 = *(void **)(v4 + 160);
  *(void *)(v4 + 160) = v19;

  uint64_t v21 = [(SFCommand *)self->_previewCommand copy];
  unint64_t v22 = *(void **)(v4 + 128);
  *(void *)(v4 + 128) = v21;

  uint64_t v23 = [(NSArray *)self->_punchoutOptions copy];
  v24 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v23;

  uint64_t v25 = [(NSString *)self->_punchoutPickerDismissText copy];
  int v26 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = v25;

  uint64_t v27 = [(NSString *)self->_punchoutPickerTitle copy];
  uint64_t v28 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v27;

  uint64_t v29 = [(NSString *)self->_resultIdentifier copy];
  v30 = *(void **)(v4 + 104);
  *(void *)(v4 + 104) = v29;

  *(_DWORD *)(v4 + 20) = self->_separatorStyle;
  *(unsigned char *)(v4 + 16) = self->_shouldHideInAmbientMode;
  objc_storeStrong((id *)(v4 + 176), self->_trailingSwipeButtonItems);
  uint64_t v31 = [(NSArray *)self->_referencedCommands copy];
  v32 = *(void **)(v4 + 184);
  *(void *)(v4 + 184) = v31;

  uint64_t v33 = [(NSString *)self->_type copy];
  uint64_t v34 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v33;

  *(unsigned char *)(v4 + 17) = self->_forceEnable3DTouch;
  *(unsigned char *)(v4 + 18) = self->_shouldShowInSmartDialog;
  uint64_t v35 = [(SFAppEntityAnnotation *)self->_appEntityAnnotation copy];
  v36 = *(void **)(v4 + 192);
  *(void *)(v4 + 192) = v35;

  uint64_t v37 = [(NSString *)self->_emphasisSubjectId copy];
  v38 = *(void **)(v4 + 200);
  *(void *)(v4 + 200) = v37;

  *(_DWORD *)(v4 + 24) = self->_increasedContrastMode;
  uint64_t v39 = [(SFCommand *)self->_secondaryCommand copy];
  uint64_t v40 = *(void **)(v4 + 208);
  *(void *)(v4 + 208) = v39;

  *(_DWORD *)(v4 + 28) = self->_requiredLevelOfDetail;
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v6 = [[_SFPBCardSection alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCardSection *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];

  [v4 encodeObject:self->_commandDetail forKey:@"_commandDetail"];
  [v4 encodeObject:self->_type forKey:@"_type"];
}

- (SFCardSection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];
  unint64_t v6 = [[_SFPBCardSection alloc] initWithData:v5];
  uint64_t v7 = [(SFCardSection *)self initWithProtobuf:v6];

  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_commandDetail"];
    commandDetail = v7->_commandDetail;
    v7->_commandDetail = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
    type = v7->_type;
    v7->_type = (NSString *)v10;
  }
  return v7;
}

- (BOOL)hideDivider
{
  return [(SFCardSection *)self separatorStyle] == 1;
}

- (SFCardSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFCardSection;
  v2 = [(SFCardSection *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    cardSectionId = v2->_cardSectionId;
    v2->_cardSectionId = (NSString *)v4;
  }
  return v2;
}

- (BOOL)hasSeparatorStyle
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSeparatorStyle:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_separatorStyle = a3;
}

- (BOOL)hasHasBottomPadding
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasBottomPadding:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hasBottomPadding = a3;
}

- (BOOL)hasHasTopPadding
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTopPadding:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasTopPadding = a3;
}

- (BOOL)hasCanBeHidden
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCanBeHidden:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_canBeHiddeuint64_t n = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)jsonData
{
  v2 = [(SFCardSection *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(SFCardSection *)self punchoutOptions];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    objc_super v7 = [(SFCardSection *)self punchoutOptions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          NSUInteger v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"punchoutOptions"];
  }
  return (NSDictionary *)v3;
}

@end
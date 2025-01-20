@interface VUIMediaTagsViewHelper
- (BOOL)_isValidNumber:(id)a3;
- (VUIMediaTagsViewHelper)initWithContentMetadata:(id)a3 additionalMetadata:(id)a4;
- (VUIMediaTagsViewHelper)initWithVUIMediaEntity:(id)a3;
- (VUIMediaTagsViewHelper)initWithVUIMediaItem:(id)a3;
- (id)_commonSenseString:(id)a3;
- (id)_durationDescriptionFromDuration:(id)a3;
- (id)_releaseDateDescriptionFromDate:(id)a3;
- (id)tagsViewDictionary;
- (void)_mediaBagdesWithVUIMediaEntity:(id)a3;
- (void)addSeperatorKey:(id)a3;
@end

@implementation VUIMediaTagsViewHelper

- (VUIMediaTagsViewHelper)initWithContentMetadata:(id)a3 additionalMetadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v174.receiver = self;
  v174.super_class = (Class)VUIMediaTagsViewHelper;
  v8 = [(VUIMediaTagsViewHelper *)&v174 init];

  if (!v8) {
    goto LABEL_128;
  }
  uint64_t v9 = objc_opt_new();
  tagsViewDictionary = v8->_tagsViewDictionary;
  v8->_tagsViewDictionary = (NSMutableDictionary *)v9;

  uint64_t v11 = objc_opt_new();
  dateComponentFormatter = v8->_dateComponentFormatter;
  v8->_dateComponentFormatter = (NSDateComponentsFormatter *)v11;

  [(NSDateComponentsFormatter *)v8->_dateComponentFormatter setUnitsStyle:2];
  [(NSDateComponentsFormatter *)v8->_dateComponentFormatter setAllowedUnits:96];
  uint64_t v13 = objc_opt_new();
  tomatoPercentFormatter = v8->_tomatoPercentFormatter;
  v8->_tomatoPercentFormatter = (NSNumberFormatter *)v13;

  [(NSNumberFormatter *)v8->_tomatoPercentFormatter setNumberStyle:3];
  [(NSNumberFormatter *)v8->_tomatoPercentFormatter setMultiplier:&unk_1F3F3C398];
  v15 = [v6 title];
  uint64_t v16 = [v15 length];

  if (v16)
  {
    v17 = [v6 title];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v17 forKeyedSubscript:VUIMediaTagKeyTitle];
  }
  v18 = [v6 subtitle];
  uint64_t v19 = [v18 length];

  if (v19)
  {
    v20 = [v6 subtitle];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v20 forKeyedSubscript:VUIMediaTagKeySubtitle];
  }
  v21 = [v6 mediaDescription];
  uint64_t v22 = [v21 length];

  if (v22)
  {
    v23 = [v6 mediaDescription];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v23 forKeyedSubscript:VUIMediaTagKeyDescription];
  }
  v24 = [v6 formattedReleaseDate];

  if (v24)
  {
    v25 = [v6 formattedReleaseDate];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v25 forKeyedSubscript:VUIMediaTagKeyReleasedDate];
  }
  else
  {
    v26 = [v6 releasedDate];

    if (!v26) {
      goto LABEL_13;
    }
    v25 = [v6 releasedDate];
    v27 = [(VUIMediaTagsViewHelper *)v8 _releaseDateDescriptionFromDate:v25];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v27 forKeyedSubscript:VUIMediaTagKeyReleasedDate];
  }
LABEL_13:
  v28 = [v6 duration];

  if (v28)
  {
    v29 = [v6 duration];
    v30 = [(VUIMediaTagsViewHelper *)v8 _durationDescriptionFromDuration:v29];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v30 forKeyedSubscript:VUIMediaTagKeyDuration];
  }
  v31 = [v6 genre];
  uint64_t v32 = [v31 length];

  if (v32)
  {
    v33 = [v6 genre];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v33 forKeyedSubscript:VUIMediaTagKeyGenre];
  }
  v34 = [v6 hasClosedCaptions];
  int v35 = [v34 BOOLValue];

  if (v35)
  {
    v36 = +[VUILocalizationManager sharedInstance];
    v37 = [v36 localizedStringForKey:@"TV.Accessibility.CC"];
    v38 = +[VUIMediaTagsImageHelper imageWithName:@"cc" flatten:1 accessibilityDescription:v37];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v38 forKeyedSubscript:VUIMediaTagKeyClosedCaptionImage];
  }
  v39 = [v6 hasADLocales];
  int v40 = [v39 BOOLValue];

  if (v40)
  {
    v41 = +[VUILocalizationManager sharedInstance];
    v42 = [v41 localizedStringForKey:@"TV.Accessibility.AD"];
    v43 = +[VUIMediaTagsImageHelper imageWithName:@"metadata-ad" flatten:1 accessibilityDescription:v42];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v43 forKeyedSubscript:VUIMediaTagKeyADLocalesImage];
  }
  v44 = [v6 hasSDHLocales];
  int v45 = [v44 BOOLValue];

  if (v45)
  {
    v46 = +[VUILocalizationManager sharedInstance];
    v47 = [v46 localizedStringForKey:@"TV.Accessibility.SDH"];
    v48 = +[VUIMediaTagsImageHelper imageWithName:@"metadata-sdh" flatten:1 accessibilityDescription:v47];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v48 forKeyedSubscript:VUIMediaTagKeySDHLocalesImage];
  }
  v49 = [v6 tomatoPercentage];
  BOOL v50 = [(VUIMediaTagsViewHelper *)v8 _isValidNumber:v49];

  if (v50)
  {
    v51 = v8->_tomatoPercentFormatter;
    v52 = [v6 tomatoPercentage];
    v53 = [(NSNumberFormatter *)v51 stringFromNumber:v52];

    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v53 forKeyedSubscript:VUIMediaTagKeyTomatoPercentage];
  }
  v54 = [v6 commonSenseRecommendedAge];
  BOOL v55 = [(VUIMediaTagsViewHelper *)v8 _isValidNumber:v54];

  if (v55)
  {
    v56 = [v6 commonSenseRecommendedAge];
    v57 = [(VUIMediaTagsViewHelper *)v8 _commonSenseString:v56];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v57 forKeyedSubscript:VUIMediaTagKeyCommonSenseRating];

    v58 = +[VUILocalizationManager sharedInstance];
    v59 = [v58 localizedStringForKey:@"ACCESSIBILITY_COMMON_SENSE"];
    v60 = +[VUIMediaTagsImageHelper imageWithName:@"cs_badge_white" flatten:0 accessibilityDescription:v59];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v60 forKeyedSubscript:VUIMediaTagKeyCommonSenseImage];

    v61 = +[VUILocalizationManager sharedInstance];
    v62 = [v61 localizedStringForKey:@"ACCESSIBILITY_COMMON_SENSE"];
    v63 = +[VUIMediaTagsImageHelper imageWithName:@"cs_badge_black" flatten:0 accessibilityDescription:v62];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v63 forKeyedSubscript:VUIMediaTagKeyCommonSenseDarkImage];
  }
  v64 = [v6 ratingAuxiliaryName];
  if ([v64 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v64 forKeyedSubscript:VUIMediaTagKeyContentRatingAuxiliaryName];
  }
  v162 = v64;
  v65 = [v6 ratingName];
  v166 = [v6 ratingSystem];
  if ([v166 length] && objc_msgSend(v65, "length"))
  {
    v66 = [v6 ratingValue];
    v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB3C60]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v166, v65, objc_msgSend(v66, "unsignedIntegerValue"), 0);
    v68 = [MEMORY[0x1E4FB3C68] sharedInstance];
    v69 = [v68 badgeForContentRating:v67 drawUnknownRatingBadge:1];

    if (v69) {
      [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v69 forKeyedSubscript:VUIMediaTagKeyRatingImage];
    }
  }
  uint64_t v70 = [v6 tomatoFreshness];
  v71 = +[VUILocalizationManager sharedInstance];
  v72 = [v71 localizedStringForKey:@"TV.Accessibility.TomatoRating"];
  v73 = +[VUIMediaTagsImageHelper imageWithName:@"RTLargeRotten" flatten:0 accessibilityDescription:v72];

  if (v70 == 2)
  {
    v74 = +[VUILocalizationManager sharedInstance];
    v75 = [v74 localizedStringForKey:@"TV.Accessibility.TomatoRating"];
    v76 = @"RTLargeCertified";
    goto LABEL_38;
  }
  if (v70 == 1)
  {
    v74 = +[VUILocalizationManager sharedInstance];
    v75 = [v74 localizedStringForKey:@"TV.Accessibility.TomatoRating"];
    v76 = @"RTLargeFresh";
LABEL_38:
    uint64_t v77 = +[VUIMediaTagsImageHelper imageWithName:v76 flatten:0 accessibilityDescription:v75];

    v78 = (void *)v77;
    goto LABEL_40;
  }
  v78 = v73;
LABEL_40:
  v160 = v78;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:");
  v79 = [v6 videoDynamicRange];
  if (![(VUIMediaTagsViewHelper *)v8 _isValidNumber:v79]) {
    goto LABEL_49;
  }
  uint64_t v80 = [v79 integerValue];
  switch(v80)
  {
    case 2:
      v81 = +[VUILocalizationManager sharedInstance];
      v82 = [v81 localizedStringForKey:@"ACCESSIBILITY_HDR"];
      v83 = @"hdr";
      break;
    case 4:
      v81 = +[VUIMediaTagsImageHelper imageWithName:@"hdr10+" flatten:1 accessibilityDescription:0];
      [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v81 forKeyedSubscript:VUIMediaTagKeyVideoDynamicRangeImage];
      goto LABEL_48;
    case 3:
      v81 = +[VUILocalizationManager sharedInstance];
      v82 = [v81 localizedStringForKey:@"ACCESSIBILITY_DOLBY_VISION"];
      v83 = @"dolby-vision";
      break;
    default:
      goto LABEL_49;
  }
  v84 = +[VUIMediaTagsImageHelper imageWithName:v83 flatten:1 accessibilityDescription:v82];
  [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v84 forKeyedSubscript:VUIMediaTagKeyVideoDynamicRangeImage];

LABEL_48:
LABEL_49:
  v172 = [v6 videoResolutionClass];
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:"))
  {
    uint64_t v85 = [v172 integerValue];
    if (v85 == 2)
    {
      v86 = +[VUILocalizationManager sharedInstance];
      v87 = [v86 localizedStringForKey:@"TV.Accessibility.HD"];
      v88 = @"hd";
      goto LABEL_54;
    }
    if (v85 == 3)
    {
      v86 = +[VUILocalizationManager sharedInstance];
      v87 = [v86 localizedStringForKey:@"ACCESSIBILITY_4K"];
      v88 = @"4k";
LABEL_54:
      v89 = +[VUIMediaTagsImageHelper imageWithName:v88 flatten:1 accessibilityDescription:v87];
      [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v89 forKeyedSubscript:VUIMediaTagKeyVideoResolutionImage];
    }
  }
  v171 = [v6 has3D];
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && [v171 BOOLValue])
  {
    v90 = +[VUIMediaTagsImageHelper imageWithName:@"tv.visionpro.3d" flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v90 forKeyedSubscript:VUIMediaTagKey3DImage];
  }
  v170 = [v6 hasImmersive];
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && [v170 BOOLValue])
  {
    v91 = +[VUIMediaTagsImageHelper imageWithName:@"immersive.badge.fill" flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v91 forKeyedSubscript:VUIMediaTagKeyImmersiveImage];
  }
  v92 = [v6 immersiveText];
  if ([v92 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v92 forKeyedSubscript:VUIMediaTagKeyImmersiveText];
  }
  v169 = [v6 hasHighMotion];
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && [v169 BOOLValue])
  {
    v93 = +[VUIMediaTagsImageHelper imageWithName:@"high.motion.badge" flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v93 forKeyedSubscript:VUIMediaTagKeyHighMotionImage];
  }
  v94 = [v6 highMotionText];
  if ([v94 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v94 forKeyedSubscript:VUIMediaTagKeyHighMotionText];
  }
  v168 = [v6 hasDolbyAtmos];
  v157 = v94;
  v158 = v92;
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && [v168 BOOLValue])
  {
    v95 = +[VUILocalizationManager sharedInstance];
    v96 = [v95 localizedStringForKey:@"ACCESSIBILITY_DOLBY_ATMOS"];
    v97 = +[VUIMediaTagsImageHelper imageWithName:@"dolby-atmos" flatten:1 accessibilityDescription:v96];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v97 forKeyedSubscript:VUIMediaTagKeyDolbyAtmosImage];
  }
  uint64_t v98 = [v6 rentalExpiration];
  if (v98) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v98 forKeyedSubscript:VUIMediaTagKeyRentalExpiration];
  }
  v156 = (void *)v98;
  v99 = objc_msgSend(v7, "vui_stringForKey:", @"comingSoonText");
  if ([v99 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v99 forKeyedSubscript:VUIMediaTagKeyComingSoonText];
  }
  v155 = v99;
  v100 = objc_msgSend(v7, "vui_stringForKey:", @"availabilityText");
  v101 = objc_msgSend(v7, "vui_attrStringForKey:", @"availabilityText");
  if ([v100 length] || objc_msgSend(v101, "length"))
  {
    if ([v100 length]) {
      v102 = v100;
    }
    else {
      v102 = v101;
    }
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v102 forKeyedSubscript:VUIMediaTagKeyAvailabilityText];
  }
  [(VUIMediaTagsViewHelper *)v8 addSeperatorKey:@"·"];
  v103 = objc_msgSend(v7, "vui_stringForKey:", @"availabilityImage");
  v152 = v103;
  if ([v103 length])
  {
    v104 = +[VUIMediaTagsImageHelper imageWithName:v103 flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v104 forKeyedSubscript:VUIMediaTagKeyAvailabilityImage];
  }
  v105 = v7;
  v106 = objc_msgSend(v7, "vui_stringForKey:", @"episodeNumberTitleAbbreviated");
  if ([v106 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v106 forKeyedSubscript:VUIMediaTagKeyEpisodeNumberTitle];
  }
  v151 = v106;
  if ([v6 isSharedWatchEnabled]
    && objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", @"isGroupWatchActivityEligible", 0))
  {
    v107 = +[VUIMediaTagsImageHelper imageWithName:@"shareplay" flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v107 forKeyedSubscript:VUIMediaTagKeyGroupActivityImage];
  }
  uint64_t v108 = [v6 episodeNumber];
  v109 = [v6 seasonNumber];
  v173 = [v6 numberOfSeasons];
  uint64_t v110 = [v6 seasonTitle];
  v167 = (void *)v108;
  v164 = (void *)v110;
  v165 = v109;
  v161 = v65;
  v159 = v79;
  v153 = v101;
  v154 = v100;
  if (v108 && v109)
  {
    v111 = +[VUILocalizationManager sharedInstance];
    v112 = [v111 localizedStringForKey:@"TV.SeasonEpisode.Abbreviated"];
    v113 = objc_msgSend(v109, "vui_languageAwareDescription");
    v114 = [v112 stringByReplacingOccurrencesOfString:@"@@seasonNumber@@" withString:v113];
    v115 = objc_msgSend(v167, "vui_languageAwareDescription");
    [v114 stringByReplacingOccurrencesOfString:@"@@episodeNumber@@" withString:v115];
    v117 = v116 = v105;
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v117 forKeyedSubscript:VUIMediaTagKeySeasonEpisode];

    v105 = v116;
  }
  else if (v110)
  {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v110 forKeyedSubscript:VUIMediaTagKeySeasonEpisode];
  }
  if (v173)
  {
    v118 = NSString;
    v119 = +[VUILocalizationManager sharedInstance];
    v120 = [v119 localizedStringForKey:@"TV.SeasonsCount"];
    v121 = objc_msgSend(v118, "stringWithValidatedFormat:validFormatSpecifiers:error:", v120, @"%d", 0, objc_msgSend(v173, "intValue"));
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v121 forKeyedSubscript:VUIMediaTagKeySeasonCount];
LABEL_97:

    goto LABEL_98;
  }
  if (v165)
  {
    v119 = +[VUILocalizationManager sharedInstance];
    v120 = [v119 localizedStringForKey:@"TV.SeasonsOrdinalCount"];
    v121 = objc_msgSend(v165, "vui_languageAwareDescription");
    v122 = [v120 stringByReplacingOccurrencesOfString:@"@@seasonNumber@@" withString:v121];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v122 forKeyedSubscript:VUIMediaTagKeySeasonCount];

    goto LABEL_97;
  }
LABEL_98:
  uint64_t v123 = [v6 channelName];
  if (v123) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v123 forKeyedSubscript:VUIMediaTagKeyChannel];
  }
  if ([v6 isFederated])
  {
    v124 = +[VUIMediaTagsImageHelper imageWithName:@"arrow.up.forward.square.fill" flatten:1 accessibilityDescription:0];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v124 forKeyedSubscript:VUIMediaTagKeyFederated];
  }
  uint64_t v125 = [v6 leagueShortName];
  if (v125) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v125 forKeyedSubscript:VUIMediaTagKeyLeagueShortName];
  }
  uint64_t v126 = [v6 gameStartTime];
  if (v126) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v126 forKeyedSubscript:VUIMediaTagKeyGameStartTime];
  }
  uint64_t v127 = [v6 gameVenue];
  if (v127) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v127 forKeyedSubscript:VUIMediaTagKeyGameVenue];
  }
  v148 = (void *)v126;
  uint64_t v128 = [v6 liveTextBadge];
  if (v128) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v128 forKeyedSubscript:VUIMediaTagKeyLiveTextBadge];
  }
  v146 = (void *)v128;
  v149 = (void *)v125;
  v129 = [v6 timeTextBadge];
  if (v129) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v129 forKeyedSubscript:VUIMediaTagKeyTimeTextBadge];
  }
  v150 = (void *)v123;
  v130 = [v6 versionCount];
  if ([v130 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v130 forKeyedSubscript:VUIMediaTagKeyVersionCount];
  }
  v131 = [v6 teamAbbreviation];
  if ([v131 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v131 forKeyedSubscript:VUIMediaTagKeyTeamAbbreviation];
  }
  v132 = [v6 shootoutsText];
  if ([v132 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v132 forKeyedSubscript:VUIMediaTagKeyShootoutsText];
  }
  v147 = (void *)v127;
  v133 = [v6 contentUnavailabilityText];
  v134 = v133;
  if (v133 && [v133 length]) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v134 forKeyedSubscript:VUIMediaTagKeyContentUnavailabilityText];
  }
  v163 = v105;
  v135 = [v105 objectForKey:@"BrandLinkbutton"];
  if (v135) {
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v135 forKeyedSubscript:VUIMediaTagKeyBrandLinkButton];
  }
  v136 = [v6 isBlackedOut];
  int v137 = [v136 BOOLValue];

  if (v137)
  {
    v138 = +[VUILocalizationManager sharedInstance];
    v139 = [v138 localizedStringForKey:@"TV.Blackout"];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v139 forKeyedSubscript:VUIMediaTagKeyIsBlackedOut];
  }
  v140 = [v6 isUpgradeEligible];
  int v141 = [v140 BOOLValue];

  if (v141)
  {
    v142 = +[VUILocalizationManager sharedInstance];
    v143 = [v142 localizedStringForKey:@"TV.UpgradeToWatch"];
    [(NSMutableDictionary *)v8->_tagsViewDictionary setObject:v143 forKeyedSubscript:VUIMediaTagKeyUpgradeText];
  }
  id v7 = v163;
LABEL_128:
  v144 = v8;

  return v144;
}

- (VUIMediaTagsViewHelper)initWithVUIMediaItem:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIMediaTagsViewHelper;
  v5 = [(VUIMediaTagsViewHelper *)&v14 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tagsViewDictionary = v5->_tagsViewDictionary;
    v5->_tagsViewDictionary = v6;

    v8 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
    uint64_t v9 = [v4 duration];
    v10 = [v8 transformedValue:v9];

    uint64_t v11 = [v4 releaseDate];
    v12 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v11 dateStyle:3 timeStyle:0];
    [(NSMutableDictionary *)v5->_tagsViewDictionary setObject:v10 forKeyedSubscript:VUIMediaTagKeyDuration];
    [(NSMutableDictionary *)v5->_tagsViewDictionary setObject:v12 forKeyedSubscript:VUIMediaTagKeyReleasedDate];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(VUIMediaTagsViewHelper *)v5 _mediaBagdesWithVUIMediaEntity:v4];
    }
  }
  return v5;
}

- (VUIMediaTagsViewHelper)initWithVUIMediaEntity:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIMediaTagsViewHelper;
  v5 = [(VUIMediaTagsViewHelper *)&v24 init];
  if (v5)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tagsViewDictionary = v5->_tagsViewDictionary;
    v5->_tagsViewDictionary = v6;

    v8 = [v4 type];
    uint64_t v9 = +[VUIMediaEntityType movie];
    v10 = v8;
    if (v8 != (void *)v9)
    {
      uint64_t v11 = (void *)v9;
      v12 = [v4 type];
      uint64_t v13 = +[VUIMediaEntityType movieRental];
      if (v12 != (void *)v13)
      {
        objc_super v14 = (void *)v13;
        v15 = [v4 type];
        uint64_t v16 = +[VUIMediaEntityType homeVideo];

        if (v15 != v16)
        {
LABEL_9:
          v20 = [v4 releaseYear];
          v21 = [v20 stringValue];

          [(NSMutableDictionary *)v5->_tagsViewDictionary setObject:v21 forKeyedSubscript:VUIMediaTagKeyReleasedDate];
          uint64_t v22 = [v4 genreTitle];
          [(NSMutableDictionary *)v5->_tagsViewDictionary setObject:v22 forKeyedSubscript:VUIMediaTagKeyGenre];

          [(VUIMediaTagsViewHelper *)v5 _mediaBagdesWithVUIMediaEntity:v4];
          goto LABEL_10;
        }
LABEL_8:
        v17 = [MEMORY[0x1E4F29248] valueTransformerForName:*MEMORY[0x1E4FB3DF0]];
        v18 = [v4 duration];
        uint64_t v19 = [v17 transformedValue:v18];

        [(NSMutableDictionary *)v5->_tagsViewDictionary setObject:v19 forKeyedSubscript:VUIMediaTagKeyDuration];
        goto LABEL_9;
      }

      v10 = v11;
    }

    goto LABEL_8;
  }
LABEL_10:

  return v5;
}

- (id)tagsViewDictionary
{
  v2 = (void *)[(NSMutableDictionary *)self->_tagsViewDictionary copy];
  return v2;
}

- (void)addSeperatorKey:(id)a3
{
}

- (BOOL)_isValidNumber:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [MEMORY[0x1E4F28C28] notANumber];
    int v5 = [v3 isEqualToNumber:v4] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)_releaseDateDescriptionFromDate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (_releaseDateDescriptionFromDate__onceToken != -1) {
      dispatch_once(&_releaseDateDescriptionFromDate__onceToken, &__block_literal_global_5);
    }
    id v4 = [(id)_releaseDateDescriptionFromDate__dateFormatter stringFromDate:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __58__VUIMediaTagsViewHelper__releaseDateDescriptionFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_releaseDateDescriptionFromDate__dateFormatter;
  _releaseDateDescriptionFromDate__dateFormatter = (uint64_t)v0;

  v2 = (void *)_releaseDateDescriptionFromDate__dateFormatter;
  return [v2 setLocalizedDateFormatFromTemplate:@"y"];
}

- (id)_durationDescriptionFromDuration:(id)a3
{
  if (a3)
  {
    [a3 doubleValue];
    double v5 = v4;
    if (v4 >= 600.0) {
      uint64_t v6 = 96;
    }
    else {
      uint64_t v6 = 192;
    }
    [(NSDateComponentsFormatter *)self->_dateComponentFormatter setAllowedUnits:v6];
    id v7 = [(NSDateComponentsFormatter *)self->_dateComponentFormatter stringFromTimeInterval:v5];
    v8 = [v7 stringByReplacingOccurrencesOfString:@"," withString:&stru_1F3E921E0];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_mediaBagdesWithVUIMediaEntity:(id)a3
{
  id v43 = a3;
  double v4 = [v43 HLSResolution];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v43 resolution];
  }
  id v7 = v6;

  v8 = [v43 HLSColorCapability];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v43 colorCapability];
  }
  uint64_t v11 = v10;

  v12 = [v43 HLSAudioCapability];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [v43 audioCapability];
  }
  objc_super v14 = v13;

  uint64_t v15 = [v7 unsignedIntegerValue];
  char v16 = [v11 unsignedIntegerValue];
  char v17 = [v14 unsignedIntegerValue];
  if ((unint64_t)(v15 - 1) > 1)
  {
    if (v15 != 3) {
      goto LABEL_15;
    }
    v18 = +[VUILocalizationManager sharedInstance];
    uint64_t v19 = [v18 localizedStringForKey:@"ACCESSIBILITY_4K"];
    v20 = @"4k";
  }
  else
  {
    v18 = +[VUILocalizationManager sharedInstance];
    uint64_t v19 = [v18 localizedStringForKey:@"TV.Accessibility.CC"];
    v20 = @"hd";
  }
  v21 = +[VUIMediaTagsImageHelper imageWithName:v20 flatten:1 accessibilityDescription:v19];
  [(NSMutableDictionary *)self->_tagsViewDictionary setObject:v21 forKeyedSubscript:VUIMediaTagKeyVideoResolutionImage];

LABEL_15:
  int IsHDRCapable = SSDeviceIsHDRCapable();
  v23 = v43;
  if (!IsHDRCapable) {
    goto LABEL_21;
  }
  if ((v16 & 2) != 0)
  {
    objc_super v24 = +[VUILocalizationManager sharedInstance];
    v25 = [v24 localizedStringForKey:@"ACCESSIBILITY_DOLBY_VISION"];
    v26 = @"dolby-vision";
  }
  else
  {
    if ((v16 & 1) == 0) {
      goto LABEL_21;
    }
    objc_super v24 = +[VUILocalizationManager sharedInstance];
    v25 = [v24 localizedStringForKey:@"ACCESSIBILITY_HDR"];
    v26 = @"hdr";
  }
  v27 = +[VUIMediaTagsImageHelper imageWithName:v26 flatten:1 accessibilityDescription:v25];
  [(NSMutableDictionary *)self->_tagsViewDictionary setObject:v27 forKeyedSubscript:VUIMediaTagKeyVideoDynamicRangeImage];

  v23 = v43;
LABEL_21:
  v28 = [v23 contentRating];
  v29 = [MEMORY[0x1E4FB3C68] sharedInstance];
  v30 = [v29 badgeForContentRating:v28 drawUnknownRatingBadge:1];

  if (v30) {
    [(NSMutableDictionary *)self->_tagsViewDictionary setObject:v30 forKeyedSubscript:VUIMediaTagKeyRatingImage];
  }
  if (v17)
  {
    v31 = +[VUILocalizationManager sharedInstance];
    uint64_t v32 = [v31 localizedStringForKey:@"ACCESSIBILITY_DOLBY_ATMOS"];
    v33 = +[VUIMediaTagsImageHelper imageWithName:@"dolby-atmos" flatten:1 accessibilityDescription:v32];
    [(NSMutableDictionary *)self->_tagsViewDictionary setObject:v33 forKeyedSubscript:VUIMediaTagKeyDolbyAtmosImage];
  }
  v34 = [v43 type];
  uint64_t v35 = +[VUIMediaEntityType movie];
  if (v34 == (void *)v35)
  {
  }
  else
  {
    v36 = (void *)v35;
    v37 = [v43 type];
    v38 = +[VUIMediaEntityType homeVideo];

    if (v37 != v38) {
      goto LABEL_31;
    }
  }
  v39 = [v43 extrasURL];
  int v40 = [v39 absoluteString];
  uint64_t v41 = [v40 length];

  if (v41)
  {
    v42 = +[VUIMediaTagsImageHelper imageWithName:@"itunes-extras-badge" flatten:0 accessibilityDescription:0];
    [(NSMutableDictionary *)self->_tagsViewDictionary setObject:v42 forKeyedSubscript:VUIMediaTagKeyItunesExtras];
  }
LABEL_31:
}

- (id)_commonSenseString:(id)a3
{
  uint64_t v3 = [a3 unsignedIntValue];
  double v4 = NSString;
  double v5 = +[VUILocalizationManager sharedInstance];
  id v6 = [v5 localizedStringForKey:@"TV.CommonSense.AgeRating"];
  id v7 = objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, @"%u", 0, v3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tomatoPercentFormatter, 0);
  objc_storeStrong((id *)&self->_dateComponentFormatter, 0);
  objc_storeStrong((id *)&self->_tagsViewDictionary, 0);
}

@end
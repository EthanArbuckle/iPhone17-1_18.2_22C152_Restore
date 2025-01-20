@interface VUIMediaTagsViewLayout
- (BOOL)alignBadgeVertically;
- (BOOL)centerAlign;
- (BOOL)isGroupActivityTagEnabled;
- (BOOL)isWrappingAllowed;
- (BOOL)orphanAvoidance;
- (NSArray)groupedKeys;
- (NSShadow)shadow;
- (NSString)compositingFilter;
- (UIColor)backgroundColor;
- (UIColor)badgeTintColor;
- (UIColor)highContrastBadgeTintColor;
- (UIColor)highlightColor;
- (UIEdgeInsets)badgeMargin;
- (UIEdgeInsets)commonSenseMargin;
- (UIEdgeInsets)groupMargin;
- (UIEdgeInsets)highMotionMargin;
- (UIEdgeInsets)immersiveMargin;
- (UIEdgeInsets)margin;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)textBadgeMargin;
- (UIEdgeInsets)tomatoMeterMargin;
- (VUIMediaTagsViewLayout)init;
- (VUIMediaTagsViewLayout)initWithType:(unint64_t)a3;
- (VUITextBadgeLayout)liveTextBadgeLayout;
- (VUITextBadgeLayout)timeTextBadgeLayout;
- (VUITextLayout)highMotionTextLayout;
- (VUITextLayout)immersiveTextLayout;
- (VUITextLayout)rentalExpirationTextLayout;
- (VUITextLayout)textLayout;
- (double)badgeMaxHeight;
- (double)maxWidth;
- (unint64_t)badgeMaxContentSizeCategory;
- (unint64_t)type;
- (void)setAlignBadgeVertically:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBadgeMargin:(UIEdgeInsets)a3;
- (void)setBadgeMaxContentSizeCategory:(unint64_t)a3;
- (void)setBadgeMaxHeight:(double)a3;
- (void)setBadgeTintColor:(id)a3;
- (void)setCenterAlign:(BOOL)a3;
- (void)setCompositingFilter:(id)a3;
- (void)setGroupMargin:(UIEdgeInsets)a3;
- (void)setHighContrastBadgeTintColor:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setLiveTextBadgeLayout:(id)a3;
- (void)setMargin:(UIEdgeInsets)a3;
- (void)setMaxWidth:(double)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setShadow:(id)a3;
- (void)setTextBadgeMargin:(UIEdgeInsets)a3;
- (void)setTimeTextBadgeLayout:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateHighMotionFontSize;
@end

@implementation VUIMediaTagsViewLayout

- (VUIMediaTagsViewLayout)initWithType:(unint64_t)a3
{
  v175[2] = *MEMORY[0x1E4F143B8];
  v105.receiver = self;
  v105.super_class = (Class)VUIMediaTagsViewLayout;
  v4 = [(VUIMediaTagsViewLayout *)&v105 init];
  v5 = v4;
  if (v4)
  {
    *((void *)v4 + 27) = 0;
    v6 = v4 + 216;
    *((void *)v4 + 2) = a3;
    *((void *)v4 + 28) = 0;
    *((void *)v4 + 29) = 0;
    *((void *)v4 + 30) = 0x4004000000000000;
    v4[12] = 0;
    *((void *)v4 + 13) = 0;
    *((void *)v4 + 15) = 0;
    v4[10] = 1;
    v7 = objc_opt_new();
    unint64_t v8 = 0x1E4FB1000uLL;
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_opacityColorWithType:", 1);
    v10 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v9;

    switch(a3)
    {
      case 0uLL:
        [v7 setColorWithOpacityType:0];
        [v7 setTextStyle:16];
        [v7 setFontWeight:10];
        [v7 setNumberOfLines:1];
        [v7 setAlignment:1];
        objc_msgSend(v7, "setMargin:", 0.0, 0.0, 0.0, 10.0);
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_opacityColorWithType:", 0);
        v17 = (void *)*((void *)v5 + 16);
        *((void *)v5 + 16) = v16;

        long long v18 = xmmword_1E38FD9F0;
        double v19 = 2.0;
        double v20 = 22.0;
        double v21 = 2.0;
        goto LABEL_8;
      case 1uLL:
        v5[11] = 1;
        v22 = (void *)MEMORY[0x1E4FB1618];
        v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
        double v21 = 1.0;
        v24 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
        v25 = objc_msgSend(v22, "vui_dynamicColorWithLightColor:darkColor:", v23, v24);
        [v7 setColor:v25];

        [v7 setTextStyle:15];
        objc_msgSend(v7, "setMargin:", 4.0, 0.0, 4.0, 8.0);
        void *v6 = 0;
        *((void *)v5 + 28) = 0;
        *(_OWORD *)(v5 + 232) = xmmword_1E38FDA10;
        [v7 setNumberOfLines:1];
        [v7 setAlignment:1];
        long long v18 = xmmword_1E38FD9D0;
        double v19 = 6.0;
        double v20 = 13.0;
LABEL_8:
        *((double *)v5 + 14) = v20;
        *((double *)v5 + 47) = v19;
        *((_OWORD *)v5 + 24) = v18;
        *((void *)v5 + 50) = v18;
        *((void *)v5 + 32) = 0;
        *((void *)v5 + 33) = 0;
        *((void *)v5 + 31) = 0;
        *((double *)v5 + 34) = v21;
        *((void *)v5 + 36) = 0;
        *((void *)v5 + 37) = 0;
        *((void *)v5 + 35) = 0;
        *((double *)v5 + 38) = v21;
        v175[0] = VUIMediaTagKeyCommonSenseImage;
        v175[1] = VUIMediaTagKeyCommonSenseRating;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
        v174[0] = VUIMediaTagKeyTomatoFreshnessImage;
        v174[1] = VUIMediaTagKeyTomatoPercentage;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:2];
        v173[0] = VUIMediaTagKeyRatingImage;
        v173[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v173[2] = VUIMediaTagKeyVideoResolutionImage;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:3];
        v172[0] = VUIMediaTagKey3DImage;
        v172[1] = VUIMediaTagKeyImmersiveImage;
        v172[2] = VUIMediaTagKeyImmersiveText;
        v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:3];
        v171[0] = VUIMediaTagKeyVideoDynamicRangeImage;
        v171[1] = VUIMediaTagKeyDolbyAtmosImage;
        v171[2] = VUIMediaTagKeyClosedCaptionImage;
        v171[3] = VUIMediaTagKeySDHLocalesImage;
        v171[4] = VUIMediaTagKeyADLocalesImage;
        v171[5] = VUIMediaTagKeyHighMotionImage;
        v171[6] = VUIMediaTagKeyHighMotionText;
        v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:7];
        v170[0] = v12;
        v170[1] = v11;
        v170[2] = v26;
        v170[3] = v27;
        v170[4] = v28;
        uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:5];
        v30 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v29;

        unint64_t v8 = 0x1E4FB1000uLL;
        goto LABEL_32;
      case 2uLL:
        [v7 setTextStyle:15];
        [v7 setFontWeight:10];
        v31 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        [v7 setColor:v31];

        void *v6 = 0;
        *((void *)v5 + 28) = 0;
        *(_OWORD *)(v5 + 232) = xmmword_1E38FDA00;
        objc_msgSend(v7, "setMargin:", 4.0, 0.0, 4.0, 3.0);
        [v7 setNumberOfLines:1];
        [v7 setAlignment:1];
        *((void *)v5 + 14) = 0x402A000000000000;
        v163[0] = VUIMediaTagKeyEpisodeNumberTitle;
        v163[1] = VUIMediaTagKeySeparator;
        v163[2] = VUIMediaTagKeyGenre;
        v163[3] = VUIMediaTagKeySeparator;
        v163[4] = VUIMediaTagKeyReleasedDate;
        v163[5] = VUIMediaTagKeySeparator;
        v163[6] = VUIMediaTagKeyComingSoonText;
        v163[7] = VUIMediaTagKeySeparator;
        v163[8] = VUIMediaTagKeyContentUnavailabilityText;
        v163[9] = VUIMediaTagKeySeparator;
        v163[10] = VUIMediaTagKeyRentalExpiration;
        v163[11] = VUIMediaTagKeySeparator;
        v163[12] = VUIMediaTagKeyDuration;
        v163[13] = VUIMediaTagKeySeparator;
        v163[14] = VUIMediaTagKeyAvailabilityText;
        v163[15] = VUIMediaTagKeyAvailabilityImage;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v163 count:16];
        v162 = VUIMediaTagKeyGroupActivityImage;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v162 count:1];
        v161 = VUIMediaTagKeyBrandLinkButton;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v161 count:1];
        v160[0] = v11;
        v160[1] = v12;
        v160[2] = v13;
        unint64_t v8 = 0x1E4FB1000uLL;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v160 count:3];
        v33 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v32;

        v5[12] = 1;
        goto LABEL_23;
      case 4uLL:
        [v7 setTextStyle:17];
        objc_msgSend(v7, "setMargin:", 42.0, 0.0, 23.0, 10.0);
        *((void *)v5 + 14) = 0x4036000000000000;
        *((void *)v5 + 47) = 0;
        *((_OWORD *)v5 + 24) = xmmword_1E38FD9F0;
        *((void *)v5 + 50) = 0x4024000000000000;
        objc_msgSend(v5, "setMargin:", 0.0, 0.0, 50.0, 0.0);
        [v7 setColorWithOpacityType:1];
        [v7 setNumberOfLines:1];
        [v7 setAlignment:1];
        objc_storeStrong((id *)v5 + 3, v7);
        v42 = [MEMORY[0x1E4FB1618] clearColor];
        [v5 setBackgroundColor:v42];

        v5[11] = 1;
LABEL_16:
        v159[0] = VUIMediaTagKeyDuration;
        v159[1] = VUIMediaTagKeySeparator;
        v159[2] = VUIMediaTagKeyReleasedDate;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v159 count:3];
        v158[0] = VUIMediaTagKeyRatingImage;
        v158[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v158[2] = VUIMediaTagKeyVideoDynamicRangeImage;
        v158[3] = VUIMediaTagKeyVideoResolutionImage;
        v158[4] = VUIMediaTagKeyClosedCaptionImage;
        v158[5] = VUIMediaTagKeySDHLocalesImage;
        v158[6] = VUIMediaTagKeyADLocalesImage;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:7];
        v157[0] = v11;
        v157[1] = v12;
        v43 = (void *)MEMORY[0x1E4F1C978];
        v44 = v157;
        goto LABEL_31;
      case 5uLL:
        *((void *)v5 + 23) = 0x4018000000000000;
        *((_OWORD *)v5 + 12) = 0u;
        *((_OWORD *)v5 + 13) = 0u;
        *((_OWORD *)v5 + 14) = 0u;
        *((void *)v5 + 30) = 0;
        *((_WORD *)v5 + 5) = 257;
        [v7 setTextStyle:16];
        objc_msgSend(v7, "setMargin:", 2.0, 0.0, 2.0, 4.0);
        v45 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        [v7 setColor:v45];

        uint64_t v46 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        v47 = (void *)*((void *)v5 + 16);
        *((void *)v5 + 16) = v46;

        [v7 setNumberOfLines:1];
        *((void *)v5 + 14) = 0x4026000000000000;
        *((void *)v5 + 47) = 0x4000000000000000;
        *((_OWORD *)v5 + 24) = xmmword_1E38FD9E0;
        *((void *)v5 + 50) = 0x4010000000000000;
LABEL_18:
        v169[0] = VUIMediaTagKeyVideoResolutionImage;
        v169[1] = VUIMediaTagKey3DImage;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];
        v168[0] = VUIMediaTagKeyImmersiveImage;
        v168[1] = VUIMediaTagKeyImmersiveText;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v168 count:2];
        v167[0] = VUIMediaTagKeyVideoDynamicRangeImage;
        v167[1] = VUIMediaTagKeyDolbyAtmosImage;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v167 count:2];
        v166[0] = VUIMediaTagKeyClosedCaptionImage;
        v166[1] = VUIMediaTagKeySDHLocalesImage;
        v166[2] = VUIMediaTagKeyADLocalesImage;
        v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:3];
        v165[0] = VUIMediaTagKeySeparator;
        v165[1] = VUIMediaTagKeyVersionCount;
        v165[2] = VUIMediaTagKeySeparator;
        v165[3] = VUIMediaTagKeySubtitle;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v165 count:4];
        v164[0] = v11;
        v164[1] = v12;
        v164[2] = v13;
        v164[3] = v37;
        v164[4] = v48;
        uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v164 count:5];
        v50 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v49;

        unint64_t v8 = 0x1E4FB1000uLL;
        goto LABEL_19;
      case 6uLL:
        uint64_t v51 = [MEMORY[0x1E4FB1618] systemGrayColor];
        v52 = (void *)*((void *)v5 + 16);
        *((void *)v5 + 16) = v51;

        *((void *)v5 + 14) = 0x4024000000000000;
        *((void *)v5 + 47) = 0;
        *((void *)v5 + 48) = 0;
        *((void *)v5 + 49) = 0;
        *((void *)v5 + 50) = 0x4010000000000000;
LABEL_21:
        v112[0] = VUIMediaTagKeyVideoResolutionImage;
        v112[1] = VUIMediaTagKeyVideoDynamicRangeImage;
        v112[2] = VUIMediaTagKeyRatingImage;
        v112[3] = VUIMediaTagKeyDolbyAtmosImage;
        v112[4] = VUIMediaTagKeySDHLocalesImage;
        v112[5] = VUIMediaTagKeyADLocalesImage;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:6];
        v111[0] = VUIMediaTagKeyImmersiveImage;
        v111[1] = VUIMediaTagKeyImmersiveText;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v111 count:2];
        v110 = VUIMediaTagKey3DImage;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
        v109[0] = v11;
        v109[1] = v12;
        v109[2] = v13;
        v14 = (void *)MEMORY[0x1E4F1C978];
        v15 = v109;
        goto LABEL_22;
      case 7uLL:
        uint64_t v55 = [MEMORY[0x1E4FB1618] systemGrayColor];
        v56 = (void *)*((void *)v5 + 16);
        *((void *)v5 + 16) = v55;

        *((void *)v5 + 14) = 0x4028000000000000;
        *((void *)v5 + 47) = 0x4018000000000000;
        *((_OWORD *)v5 + 24) = xmmword_1E38FD9D0;
        *((void *)v5 + 50) = 0x4020000000000000;
LABEL_25:
        v154[0] = VUIMediaTagKeyRatingImage;
        v154[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v154[2] = VUIMediaTagKeyVideoResolutionImage;
        v154[3] = VUIMediaTagKeyVideoDynamicRangeImage;
        v154[4] = VUIMediaTagKeyDolbyAtmosImage;
        v154[5] = VUIMediaTagKeyItunesExtras;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:6];
        v153 = v11;
        v57 = (void *)MEMORY[0x1E4F1C978];
        v58 = &v153;
        goto LABEL_28;
      case 8uLL:
        [v7 setTextStyle:21];
        [v7 setFontWeight:0];
        [v7 setNumberOfLines:1];
        v59 = [MEMORY[0x1E4FB1618] systemGrayColor];
        [v7 setColor:v59];

        objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
LABEL_27:
        v156[0] = VUIMediaTagKeyGenre;
        v156[1] = VUIMediaTagKeySeparator;
        v156[2] = VUIMediaTagKeyReleasedDate;
        v156[3] = VUIMediaTagKeyDuration;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:4];
        v155 = v11;
        v57 = (void *)MEMORY[0x1E4F1C978];
        v58 = &v155;
LABEL_28:
        uint64_t v60 = [v57 arrayWithObjects:v58 count:1];
        v12 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v60;
        goto LABEL_32;
      case 9uLL:
      case 0xAuLL:
      case 0x12uLL:
LABEL_3:
        v149[0] = VUIMediaTagKeyGenre;
        v149[1] = VUIMediaTagKeySeparator;
        v149[2] = VUIMediaTagKeyReleasedDate;
        v149[3] = VUIMediaTagKeySeparator;
        v149[4] = VUIMediaTagKeyDuration;
        v149[5] = VUIMediaTagKeySeparator;
        v149[6] = VUIMediaTagKeySubtitle;
        v149[7] = VUIMediaTagKeySeparator;
        v149[8] = VUIMediaTagKeyLeagueShortName;
        v149[9] = VUIMediaTagKeySeparator;
        v149[10] = VUIMediaTagKeyGameStartTime;
        v149[11] = VUIMediaTagKeyUpgradeText;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:12];
        v148[0] = VUIMediaTagKey3DImage;
        v148[1] = VUIMediaTagKeySeparator;
        v148[2] = VUIMediaTagKeyIsBlackedOut;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:3];
        if (a3 == 18)
        {
          v147[0] = VUIMediaTagKeySeparator;
          v147[1] = VUIMediaTagKeyImmersiveImage;
          v147[2] = VUIMediaTagKeyImmersiveText;
          v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v147 count:3];
          v146[0] = v11;
          v146[1] = v12;
          v146[2] = v13;
          v14 = (void *)MEMORY[0x1E4F1C978];
          v15 = v146;
        }
        else
        {
          v145[0] = VUIMediaTagKeyImmersiveImage;
          v145[1] = VUIMediaTagKeyImmersiveText;
          v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:2];
          v144[0] = v11;
          v144[1] = v13;
          v144[2] = v12;
          v14 = (void *)MEMORY[0x1E4F1C978];
          v15 = v144;
        }
LABEL_22:
        uint64_t v53 = [v14 arrayWithObjects:v15 count:3];
        v54 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v53;

        goto LABEL_23;
      case 0xBuLL:
        void *v6 = 0;
        *((void *)v5 + 28) = 0;
        *((void *)v5 + 29) = 0;
        *((void *)v5 + 30) = 0x4010000000000000;
        uint64_t v61 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        v62 = (void *)*((void *)v5 + 16);
        *((void *)v5 + 16) = v61;

        v63 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
        [v7 setColor:v63];

        [v7 setTextStyle:15];
        *((_WORD *)v5 + 4) = 257;
        objc_msgSend(v7, "setMargin:", 0.0, 4.0, 4.0, 4.0);
        [v7 setNumberOfLines:1];
        [v7 setAlignment:1];
        *((void *)v5 + 14) = 0x4028000000000000;
        v5[11] = 1;
LABEL_30:
        v152[0] = VUIMediaTagKeyGenre;
        v152[1] = VUIMediaTagKeySeparator;
        v152[2] = VUIMediaTagKeyReleasedDate;
        v152[3] = VUIMediaTagKeySeparator;
        v152[4] = VUIMediaTagKeyDuration;
        v152[5] = VUIMediaTagKeySeparator;
        v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v152 count:6];
        v151[0] = VUIMediaTagKeyRatingImage;
        v151[1] = VUIMediaTagKeyContentRatingAuxiliaryName;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v151 count:2];
        v150[0] = v11;
        v150[1] = v12;
        v43 = (void *)MEMORY[0x1E4F1C978];
        v44 = v150;
LABEL_31:
        uint64_t v64 = [v43 arrayWithObjects:v44 count:2];
        v65 = (void *)*((void *)v5 + 11);
        *((void *)v5 + 11) = v64;

        goto LABEL_32;
      default:
        if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
        {
          v34 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
          [v7 setColor:v34];

          [v7 setNumberOfLines:2];
          [v7 setAlignment:1];
          objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
          void *v6 = 0;
          *((void *)v5 + 28) = 0;
          *((void *)v5 + 29) = 0;
          *((void *)v5 + 30) = 0x4014000000000000;
          *((void *)v5 + 51) = 0;
          *((void *)v5 + 52) = 0;
          *((void *)v5 + 53) = 0;
          *((void *)v5 + 54) = 0x401C000000000000;
          *((void *)v5 + 14) = 0x4028000000000000;
          [v7 setTextStyle:15];
          [v7 setFontWeight:10];
          uint64_t v35 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
          v36 = (void *)*((void *)v5 + 16);
          *((void *)v5 + 16) = v35;

          v5[11] = 1;
          *(_WORD *)(v5 + 9) = 257;
          if (a3 == 12)
          {
LABEL_41:
            v143[0] = VUIMediaTagKeyLiveTextBadge;
            v143[1] = VUIMediaTagKeyTimeTextBadge;
            v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:2];
            v142[0] = VUIMediaTagKeyLeagueShortName;
            v142[1] = VUIMediaTagKeySeparator;
            v142[2] = VUIMediaTagKeyGenre;
            v142[3] = VUIMediaTagKeySeparator;
            v142[4] = VUIMediaTagKeyTeamAbbreviation;
            v142[5] = VUIMediaTagKeySeparator;
            v142[6] = VUIMediaTagKeyDuration;
            v142[7] = VUIMediaTagKeySeparator;
            v142[8] = VUIMediaTagKeySeasonCount;
            v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:9];
            v141[0] = VUIMediaTagKeyTitle;
            v141[1] = VUIMediaTagKeySeparator;
            v141[2] = VUIMediaTagKeyShootoutsText;
            v141[3] = VUIMediaTagKeySeparator;
            v141[4] = VUIMediaTagKeyGameStartTime;
            v141[5] = VUIMediaTagKeySeparator;
            v141[6] = VUIMediaTagKeyChannel;
            v141[7] = VUIMediaTagKeySeparator;
            v141[8] = VUIMediaTagKeyIsBlackedOut;
            v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v141 count:9];
            v140 = VUIMediaTagKeyRatingImage;
            v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v140 count:1];
            v139[0] = VUIMediaTagKeyImmersiveImage;
            v139[1] = VUIMediaTagKeyImmersiveText;
            v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:2];
            v138 = VUIMediaTagKey3DImage;
            v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v138 count:1];
            v137[0] = v11;
            v137[1] = v12;
            v137[2] = v37;
            v137[3] = v88;
            v137[4] = v89;
            v137[5] = v13;
            uint64_t v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:6];
            v91 = (void *)*((void *)v5 + 11);
            *((void *)v5 + 11) = v90;

            unint64_t v8 = 0x1E4FB1000;
          }
          else
          {
            if (a3 != 13) {
              goto LABEL_33;
            }
LABEL_13:
            v136[0] = VUIMediaTagKeyLiveTextBadge;
            v136[1] = VUIMediaTagKeyTimeTextBadge;
            v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
            v135[0] = VUIMediaTagKeyLeagueShortName;
            v135[1] = VUIMediaTagKeySeparator;
            v135[2] = VUIMediaTagKeyGenre;
            v135[3] = VUIMediaTagKeySeparator;
            v135[4] = VUIMediaTagKeyTeamAbbreviation;
            v135[5] = VUIMediaTagKeySeparator;
            v135[6] = VUIMediaTagKeyDuration;
            v135[7] = VUIMediaTagKeySeparator;
            v135[8] = VUIMediaTagKeySeasonCount;
            v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:9];
            v134[0] = VUIMediaTagKeyTitle;
            v134[1] = VUIMediaTagKeySeparator;
            v134[2] = VUIMediaTagKeyShootoutsText;
            v134[3] = VUIMediaTagKeySeparator;
            v134[4] = VUIMediaTagKeyGameStartTime;
            v134[5] = VUIMediaTagKeySeparator;
            v134[6] = VUIMediaTagKeyChannel;
            v134[7] = VUIMediaTagKeySeparator;
            v134[8] = VUIMediaTagKeyImmersiveImage;
            v134[9] = VUIMediaTagKeyImmersiveText;
            v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:10];
            v133 = VUIMediaTagKeyRatingImage;
            v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v133 count:1];
            v132[0] = v11;
            v132[1] = v12;
            v132[2] = v37;
            v132[3] = v13;
            v38 = (void *)MEMORY[0x1E4F1C978];
            unint64_t v8 = 0x1E4FB1000uLL;
            v39 = v132;
LABEL_14:
            uint64_t v40 = [v38 arrayWithObjects:v39 count:4];
            v41 = (void *)*((void *)v5 + 11);
            *((void *)v5 + 11) = v40;
          }
LABEL_19:

LABEL_23:
LABEL_32:
        }
        else
        {
          switch(a3)
          {
            case 3uLL:
              v85 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              [v7 setColor:v85];

              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 5.0, 0.0, 5.0);
              void *v6 = 0;
              *((void *)v5 + 28) = 0;
              *((void *)v5 + 29) = 0;
              *((void *)v5 + 30) = 0x4014000000000000;
              *((void *)v5 + 14) = 0x4028000000000000;
              [v7 setTextStyle:15];
              [v7 setFontWeight:10];
              [v7 setNumberOfLines:2];
              uint64_t v86 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              v87 = (void *)*((void *)v5 + 16);
              *((void *)v5 + 16) = v86;

              v5[11] = 1;
              *(_WORD *)(v5 + 9) = 257;
              v131[0] = VUIMediaTagKeyGenre;
              v131[1] = VUIMediaTagKeySeparator;
              v131[2] = VUIMediaTagKeyDuration;
              v131[3] = VUIMediaTagKeySeparator;
              v131[4] = VUIMediaTagKeySeasonCount;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:5];
              v130[0] = VUIMediaTagKeyChannel;
              v130[1] = VUIMediaTagKeySeparator;
              v130[2] = VUIMediaTagKeyGameVenue;
              v130[3] = VUIMediaTagKeySeparator;
              v130[4] = VUIMediaTagKeyGameStartTime;
              v130[5] = VUIMediaTagKeySeparator;
              v130[6] = VUIMediaTagKeyImmersiveImage;
              v130[7] = VUIMediaTagKeyImmersiveText;
              v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:8];
              v129 = VUIMediaTagKeyGroupActivityImage;
              v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
              v128 = VUIMediaTagKeyRatingImage;
              v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
              v127[0] = v13;
              v127[1] = v11;
              v127[2] = v37;
              v127[3] = v12;
              v38 = (void *)MEMORY[0x1E4F1C978];
              unint64_t v8 = 0x1E4FB1000uLL;
              v39 = v127;
              goto LABEL_14;
            case 4uLL:
              goto LABEL_16;
            case 5uLL:
              goto LABEL_18;
            case 6uLL:
              goto LABEL_21;
            case 7uLL:
              goto LABEL_25;
            case 8uLL:
              goto LABEL_27;
            case 9uLL:
            case 0xAuLL:
            case 0x12uLL:
              goto LABEL_3;
            case 0xBuLL:
              goto LABEL_30;
            case 0xCuLL:
              goto LABEL_41;
            case 0xDuLL:
              goto LABEL_13;
            case 0xEuLL:
              v92 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
              [v7 setColor:v92];

              [v7 setTextStyle:16];
              [v7 setFontWeight:5];
              [v7 setNumberOfLines:0];
              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 10.0, 0.0);
              void *v6 = 0;
              *((void *)v5 + 28) = 0;
              *((void *)v5 + 29) = 0;
              *((void *)v5 + 30) = 0x4014000000000000;
              *((void *)v5 + 14) = 0x4036000000000000;
              uint64_t v93 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
              v94 = (void *)*((void *)v5 + 16);
              *((void *)v5 + 16) = v93;

              v5[11] = 1;
              *(_WORD *)(v5 + 9) = 257;
              v126[0] = VUIMediaTagKeySeasonEpisode;
              v126[1] = VUIMediaTagKeyGenre;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:2];
              v125 = VUIMediaTagKeySeparator;
              v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
              v124[0] = VUIMediaTagKeyRatingImage;
              v124[1] = VUIMediaTagKeyTitle;
              v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:2];
              v123[0] = v11;
              v123[1] = v12;
              v123[2] = v13;
              v14 = (void *)MEMORY[0x1E4F1C978];
              v15 = v123;
              goto LABEL_22;
            case 0xFuLL:
              v95 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              [v7 setColor:v95];

              [v7 setTextStyle:16];
              [v7 setFontWeight:5];
              [v7 setNumberOfLines:0];
              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 6.0, 0.0);
              void *v6 = 0;
              *((void *)v5 + 28) = 0;
              *((void *)v5 + 29) = 0;
              *((void *)v5 + 30) = 0x4014000000000000;
              *((void *)v5 + 51) = 0;
              *((void *)v5 + 52) = 0;
              *((void *)v5 + 53) = 0;
              *((void *)v5 + 54) = 0x4014000000000000;
              *((void *)v5 + 14) = 0x403A000000000000;
              uint64_t v96 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              v97 = (void *)*((void *)v5 + 16);
              *((void *)v5 + 16) = v96;

              *(_WORD *)(v5 + 9) = 257;
              v5[11] = 1;
              *((void *)v5 + 47) = 0x3FF0000000000000;
              *((void *)v5 + 48) = 0;
              *((void *)v5 + 49) = 0;
              *((void *)v5 + 50) = 0;
              v122 = VUIMediaTagKeyGenre;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
              v121 = VUIMediaTagKeyRatingImage;
              v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
              v120 = VUIMediaTagKeySeparator;
              v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
              v119[0] = v11;
              v119[1] = v13;
              v119[2] = v12;
              v14 = (void *)MEMORY[0x1E4F1C978];
              v15 = v119;
              goto LABEL_22;
            case 0x10uLL:
              v98 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryTextColor");
              [v7 setColor:v98];

              [v7 setTextStyle:13];
              [v7 setFontWeight:5];
              [v7 setNumberOfLines:0];
              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 6.0, 0.0);
              void *v6 = 0;
              *((void *)v5 + 28) = 0;
              *((void *)v5 + 29) = 0;
              *((void *)v5 + 30) = 0x4014000000000000;
              *(_WORD *)(v5 + 9) = 257;
              v116 = VUIMediaTagKeySeasonEpisode;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
              v115 = VUIMediaTagKeySeparator;
              v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
              v114 = VUIMediaTagKeyTitle;
              v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
              v113[0] = v11;
              v113[1] = v12;
              v113[2] = v13;
              v14 = (void *)MEMORY[0x1E4F1C978];
              v15 = v113;
              goto LABEL_22;
            case 0x11uLL:
              v99 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              [v7 setColor:v99];

              [v7 setTextStyle:16];
              [v7 setFontWeight:5];
              [v7 setNumberOfLines:0];
              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 5.0, 6.0, 5.0);
              *(_OWORD *)v6 = 0u;
              *(_OWORD *)(v5 + 232) = 0u;
              *((void *)v5 + 14) = 0x403A000000000000;
              uint64_t v100 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              v101 = (void *)*((void *)v5 + 16);
              *((void *)v5 + 16) = v100;

              *(_WORD *)(v5 + 9) = 257;
              v5[11] = 1;
              *((void *)v5 + 47) = 0x3FF0000000000000;
              *((void *)v5 + 48) = 0;
              *((void *)v5 + 49) = 0;
              *((void *)v5 + 50) = 0;
              v117[0] = VUIMediaTagKeyGenre;
              v117[1] = VUIMediaTagKeySeparator;
              v117[2] = VUIMediaTagKeyRatingImage;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:3];
              v118 = v11;
              v57 = (void *)MEMORY[0x1E4F1C978];
              v58 = &v118;
              goto LABEL_28;
            case 0x13uLL:
              v102 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              [v7 setColor:v102];

              [v7 setTextStyle:15];
              [v7 setFontWeight:10];
              [v7 setNumberOfLines:2];
              [v7 setAlignment:1];
              objc_msgSend(v7, "setMargin:", 0.0, 0.0, 0.0, 8.0);
              uint64_t v103 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryTextColor");
              v104 = (void *)*((void *)v5 + 16);
              *((void *)v5 + 16) = v103;

              *((void *)v5 + 14) = 0x402A000000000000;
              v5[9] = 1;
              v5[11] = 1;
              v108[0] = VUIMediaTagKeyGenre;
              v108[1] = VUIMediaTagKeySeparator;
              v108[2] = VUIMediaTagKeyDuration;
              v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:3];
              v107 = VUIMediaTagKeyRatingImage;
              v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
              v106[0] = v11;
              v106[1] = v12;
              v43 = (void *)MEMORY[0x1E4F1C978];
              v44 = v106;
              goto LABEL_31;
            default:
              break;
          }
        }
LABEL_33:
        objc_storeStrong((id *)v5 + 3, v7);
        uint64_t v66 = [v7 copy];
        v67 = (void *)*((void *)v5 + 6);
        *((void *)v5 + 6) = v66;

        v68 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3F3C770, &unk_1F3F3C788, &unk_1F3F3C7A0, 0);
        if (a3
          && ([MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3],
              v69 = objc_claimAutoreleasedReturnValue(),
              int v70 = [v68 containsObject:v69],
              v69,
              v70))
        {
          objc_storeStrong((id *)v5 + 7, v7);
        }
        else
        {
          uint64_t v71 = objc_opt_new();
          v72 = (void *)*((void *)v5 + 7);
          *((void *)v5 + 7) = v71;

          [*((id *)v5 + 7) setTextStyle:17];
          [*((id *)v5 + 7) setFontWeight:5];
          [*((id *)v5 + 7) setNumberOfLines:1];
          v73 = (void *)*((void *)v5 + 7);
          v74 = objc_msgSend(*(id *)(v8 + 1560), "vui_opacityColorWithType:", 1);
          [v73 setColor:v74];

          objc_msgSend(*((id *)v5 + 7), "setPadding:", 0.5, 0.0, 0.0, 0.0);
          v75 = (void *)*((void *)v5 + 7);
          LODWORD(v76) = -0.5;
          v77 = [MEMORY[0x1E4F28ED0] numberWithFloat:v76];
          [v75 setLetterSpacing:v77];

          [*((id *)v5 + 7) setTextTransform:2];
        }
        *((void *)v5 + 39) = 0;
        *((void *)v5 + 40) = 0;
        *((void *)v5 + 41) = 0;
        *((void *)v5 + 42) = 0x4010000000000000;
        uint64_t v78 = objc_opt_new();
        v79 = (void *)*((void *)v5 + 8);
        *((void *)v5 + 8) = v78;

        [*((id *)v5 + 8) setNumberOfLines:2];
        v80 = (void *)*((void *)v5 + 8);
        v81 = [*((id *)v5 + 3) color];
        [v80 setColor:v81];

        v82 = (void *)*((void *)v5 + 8);
        v83 = [*((id *)v5 + 3) darkColor];
        [v82 setDarkColor:v83];

        [*((id *)v5 + 8) setFontWeight:6];
        [v5 updateHighMotionFontSize];
        *((void *)v5 + 43) = 0;
        *((void *)v5 + 44) = 0;
        *((void *)v5 + 45) = 0;
        *((void *)v5 + 46) = 0x4010000000000000;

        break;
    }
  }
  return (VUIMediaTagsViewLayout *)v5;
}

- (void)updateHighMotionFontSize
{
  [MEMORY[0x1E4FB3C70] scaleContentSizeValue:0 forTraitCollection:8.0];
  highMotionTextLayout = self->_highMotionTextLayout;
  -[VUITextLayout setFontSize:](highMotionTextLayout, "setFontSize:");
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setMargin:(UIEdgeInsets)a3
{
  self->_margin = a3;
}

- (VUIMediaTagsViewLayout)init
{
  return [(VUIMediaTagsViewLayout *)self initWithType:0];
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (VUITextBadgeLayout)liveTextBadgeLayout
{
  return self->_liveTextBadgeLayout;
}

- (void)setLiveTextBadgeLayout:(id)a3
{
}

- (VUITextBadgeLayout)timeTextBadgeLayout
{
  return self->_timeTextBadgeLayout;
}

- (void)setTimeTextBadgeLayout:(id)a3
{
}

- (VUITextLayout)rentalExpirationTextLayout
{
  return self->_rentalExpirationTextLayout;
}

- (VUITextLayout)immersiveTextLayout
{
  return self->_immersiveTextLayout;
}

- (VUITextLayout)highMotionTextLayout
{
  return self->_highMotionTextLayout;
}

- (UIEdgeInsets)margin
{
  double top = self->_margin.top;
  double left = self->_margin.left;
  double bottom = self->_margin.bottom;
  double right = self->_margin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSShadow)shadow
{
  return self->_shadow;
}

- (void)setShadow:(id)a3
{
}

- (NSArray)groupedKeys
{
  return self->_groupedKeys;
}

- (UIEdgeInsets)groupMargin
{
  double top = self->_groupMargin.top;
  double left = self->_groupMargin.left;
  double bottom = self->_groupMargin.bottom;
  double right = self->_groupMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setGroupMargin:(UIEdgeInsets)a3
{
  self->_groupMargin = a3;
}

- (UIEdgeInsets)commonSenseMargin
{
  double top = self->_commonSenseMargin.top;
  double left = self->_commonSenseMargin.left;
  double bottom = self->_commonSenseMargin.bottom;
  double right = self->_commonSenseMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)tomatoMeterMargin
{
  double top = self->_tomatoMeterMargin.top;
  double left = self->_tomatoMeterMargin.left;
  double bottom = self->_tomatoMeterMargin.bottom;
  double right = self->_tomatoMeterMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)immersiveMargin
{
  double top = self->_immersiveMargin.top;
  double left = self->_immersiveMargin.left;
  double bottom = self->_immersiveMargin.bottom;
  double right = self->_immersiveMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)highMotionMargin
{
  double top = self->_highMotionMargin.top;
  double left = self->_highMotionMargin.left;
  double bottom = self->_highMotionMargin.bottom;
  double right = self->_highMotionMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)compositingFilter
{
  return self->_compositingFilter;
}

- (void)setCompositingFilter:(id)a3
{
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (BOOL)orphanAvoidance
{
  return self->_orphanAvoidance;
}

- (BOOL)centerAlign
{
  return self->_centerAlign;
}

- (void)setCenterAlign:(BOOL)a3
{
  self->_centerAlign = a3;
}

- (BOOL)isWrappingAllowed
{
  return self->_wrappingAllowed;
}

- (BOOL)alignBadgeVertically
{
  return self->_alignBadgeVertically;
}

- (void)setAlignBadgeVertically:(BOOL)a3
{
  self->_alignBadgeVertically = a3;
}

- (double)badgeMaxHeight
{
  return self->_badgeMaxHeight;
}

- (void)setBadgeMaxHeight:(double)a3
{
  self->_badgeMaxHeight = a3;
}

- (unint64_t)badgeMaxContentSizeCategory
{
  return self->_badgeMaxContentSizeCategory;
}

- (void)setBadgeMaxContentSizeCategory:(unint64_t)a3
{
  self->_badgeMaxContentSizeCategory = a3;
}

- (UIEdgeInsets)badgeMargin
{
  double top = self->_badgeMargin.top;
  double left = self->_badgeMargin.left;
  double bottom = self->_badgeMargin.bottom;
  double right = self->_badgeMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setBadgeMargin:(UIEdgeInsets)a3
{
  self->_badgeMargin = a3;
}

- (UIColor)badgeTintColor
{
  return self->_badgeTintColor;
}

- (void)setBadgeTintColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (UIColor)highContrastBadgeTintColor
{
  return self->_highContrastBadgeTintColor;
}

- (void)setHighContrastBadgeTintColor:(id)a3
{
}

- (UIEdgeInsets)textBadgeMargin
{
  double top = self->_textBadgeMargin.top;
  double left = self->_textBadgeMargin.left;
  double bottom = self->_textBadgeMargin.bottom;
  double right = self->_textBadgeMargin.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextBadgeMargin:(UIEdgeInsets)a3
{
  self->_textBadgeMargin = a3;
}

- (BOOL)isGroupActivityTagEnabled
{
  return self->_groupActivityTagEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highContrastBadgeTintColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_badgeTintColor, 0);
  objc_storeStrong((id *)&self->_compositingFilter, 0);
  objc_storeStrong((id *)&self->_groupedKeys, 0);
  objc_storeStrong((id *)&self->_shadow, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_highMotionTextLayout, 0);
  objc_storeStrong((id *)&self->_immersiveTextLayout, 0);
  objc_storeStrong((id *)&self->_rentalExpirationTextLayout, 0);
  objc_storeStrong((id *)&self->_timeTextBadgeLayout, 0);
  objc_storeStrong((id *)&self->_liveTextBadgeLayout, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

@end
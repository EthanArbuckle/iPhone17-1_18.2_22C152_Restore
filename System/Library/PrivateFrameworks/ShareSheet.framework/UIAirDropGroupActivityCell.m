@interface UIAirDropGroupActivityCell
- (BOOL)didInstallSubviews;
- (BOOL)isDisabled;
- (BOOL)isGroup;
- (BOOL)isLongPressable;
- (BOOL)isPulsing;
- (BOOL)isSquareImage;
- (BOOL)stateBeingRestored;
- (NSArray)largeTextConstraints;
- (NSArray)regularConstraints;
- (NSArray)subtitleLabelVisibleConstraintsArray;
- (NSMutableArray)allConstraints;
- (NSString)displayName;
- (NSString)formattedDisplayName;
- (NSString)subtitle;
- (NSUUID)identifier;
- (SHSheetContentLayoutSpec)layoutSpec;
- (UIAirDropNode)node;
- (UIColor)subtitleTextColor;
- (UIImage)image;
- (UIImage)transportImage;
- (UIImageView)imageView;
- (UIImageView)transportImageView;
- (UILabel)subtitleLabel;
- (UILabel)textLabel;
- (UILabel)titleLabel;
- (UIView)imageSlotView;
- (UIView)placeholderTitleView;
- (UIView)subtitleSlotView;
- (UIView)textSlotView;
- (UIView)titleSlotView;
- (UIView)transportSlotView;
- (UIVisualEffectView)vibrantSubtitleView;
- (UIVisualEffectView)vibrantTitleView;
- (_UIAirDropProgressView)circleProgressView;
- (double)circleWidth;
- (double)progress;
- (double)transportIconWidth;
- (id)_createLabelForSingleLine:(BOOL)a3;
- (id)_labelFont;
- (id)_placeholderStringForSingleLine:(BOOL)a3;
- (id)createTargetedPreview;
- (unsigned)imageSlotID;
- (unsigned)subtitleSlotID;
- (unsigned)textSlotID;
- (unsigned)transportSlotID;
- (void)_configureImageViewForPlaceholder:(BOOL)a3;
- (void)_configurePlaceholderViews;
- (void)_didCompleteAirDropProgress:(double)a3 animated:(BOOL)a4;
- (void)_installSubviewsIfNeeded;
- (void)_invalidateDisplayName;
- (void)_invalidateSubtitle;
- (void)_setLayoutSpec:(id)a3;
- (void)_updateConstraints;
- (void)_updateDarkening;
- (void)_updateFormattedDisplayName;
- (void)_updateImageView;
- (void)_updateProgress:(double)a3 animated:(BOOL)a4;
- (void)_updateSubtitleView;
- (void)_updateTextView;
- (void)_updateTitleView;
- (void)_updateTransportView;
- (void)configureLayoutIfNeeded:(id)a3;
- (void)prepareForReuse;
- (void)setAllConstraints:(id)a3;
- (void)setCircleProgressView:(id)a3;
- (void)setDidInstallSubviews:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setFormattedDisplayName:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSlotID:(unsigned int)a3;
- (void)setImageSlotView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setIsGroup:(BOOL)a3;
- (void)setIsPulsing:(BOOL)a3;
- (void)setLargeTextConstraints:(id)a3;
- (void)setLayoutSpec:(id)a3;
- (void)setLongPressable:(BOOL)a3;
- (void)setNode:(id)a3;
- (void)setPlaceholderTitleView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)setRegularConstraints:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSquareImage:(BOOL)a3;
- (void)setStateBeingRestored:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleLabelVisibleConstraintsArray:(id)a3;
- (void)setSubtitleSlotID:(unsigned int)a3;
- (void)setSubtitleSlotView:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setTextSlotID:(unsigned int)a3;
- (void)setTextSlotView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSlotView:(id)a3;
- (void)setTransportIconHidden:(BOOL)a3 animated:(BOOL)a4 useDelay:(BOOL)a5;
- (void)setTransportImage:(id)a3;
- (void)setTransportImageView:(id)a3;
- (void)setTransportSlotID:(unsigned int)a3;
- (void)setTransportSlotView:(id)a3;
- (void)setVibrantSubtitleView:(id)a3;
- (void)setVibrantTitleView:(id)a3;
- (void)setupConstraints;
- (void)startPulsing;
- (void)stopPulsing;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIAirDropGroupActivityCell

- (void)_installSubviewsIfNeeded
{
  if (![(UIAirDropGroupActivityCell *)self didInstallSubviews])
  {
    [(UIAirDropGroupActivityCell *)self setDidInstallSubviews:1];
    id v134 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    v3 = [MEMORY[0x1E4FB1EA0] effectForBlurEffect:v134 style:0];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v3];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIAirDropGroupActivityCell *)self setVibrantTitleView:v4];
    v5 = [(UIAirDropGroupActivityCell *)self contentView];
    v6 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
    [v5 addSubview:v6];

    id v7 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setPlaceholderTitleView:v7];

    v8 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    v9 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
    [v9 setAlpha:0.0];

    v10 = [(UIAirDropGroupActivityCell *)self traitCollection];
    v11 = SHSheetUISpecPlaceholderColor([v10 userInterfaceStyle]);
    v12 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
    [v12 setBackgroundColor:v11];

    v13 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
    v14 = [v13 layer];
    [v14 setCornerRadius:2.0];

    v15 = [(UIAirDropGroupActivityCell *)self contentView];
    v16 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
    [v15 addSubview:v16];

    v17 = [(UIAirDropGroupActivityCell *)self _createLabelForSingleLine:0];
    [(UIAirDropGroupActivityCell *)self setTextLabel:v17];

    v18 = [(UIAirDropGroupActivityCell *)self textLabel];
    [v18 setAlpha:0.0];

    v19 = [(UIAirDropGroupActivityCell *)self contentView];
    v20 = [(UIAirDropGroupActivityCell *)self textLabel];
    [v19 addSubview:v20];

    v21 = [(UIAirDropGroupActivityCell *)self _createLabelForSingleLine:1];
    [(UIAirDropGroupActivityCell *)self setTitleLabel:v21];

    v22 = [(UIAirDropGroupActivityCell *)self titleLabel];
    [v22 setAlpha:0.0];

    v23 = [(UIAirDropGroupActivityCell *)self contentView];
    v24 = [(UIAirDropGroupActivityCell *)self titleLabel];
    [v23 addSubview:v24];

    v25 = [(UIAirDropGroupActivityCell *)self _createLabelForSingleLine:1];
    [(UIAirDropGroupActivityCell *)self setSubtitleLabel:v25];

    v26 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
    [v26 setAlpha:0.0];

    id SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
    v28 = [MEMORY[0x1E4FB16C8] currentDevice];
    v29 = objc_msgSend(SFUIShareSheetActivityCellSpecClass, "subtitleLabelColorForIdiom:", objc_msgSend(v28, "userInterfaceIdiom"));
    v30 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
    [v30 setTextColor:v29];

    v31 = [(UIAirDropGroupActivityCell *)self contentView];
    v32 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
    [v31 addSubview:v32];

    id v33 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setTextSlotView:v33];

    v34 = [(UIAirDropGroupActivityCell *)self textSlotView];
    [v34 setAlpha:0.0];

    v35 = [(UIAirDropGroupActivityCell *)self textSlotView];
    [v35 setTranslatesAutoresizingMaskIntoConstraints:0];

    v36 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
    v37 = [v36 contentView];
    v38 = [(UIAirDropGroupActivityCell *)self textSlotView];
    [v37 addSubview:v38];

    id v39 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setTitleSlotView:v39];

    v40 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    [v40 setAlpha:0.0];

    v41 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    [v41 setTranslatesAutoresizingMaskIntoConstraints:0];

    v42 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
    v43 = [v42 contentView];
    v44 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    [v43 addSubview:v44];

    id v45 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setSubtitleSlotView:v45];

    v46 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    [v46 setAlpha:0.0];

    v47 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];

    v48 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
    v49 = [v48 contentView];
    v50 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    [v49 addSubview:v50];

    id v51 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(UIAirDropGroupActivityCell *)self setImageView:v51];

    v52 = [(UIAirDropGroupActivityCell *)self imageView];
    [v52 setTranslatesAutoresizingMaskIntoConstraints:0];

    v53 = [(UIAirDropGroupActivityCell *)self imageView];
    [v53 setClipsToBounds:1];

    [(UIAirDropGroupActivityCell *)self circleWidth];
    double v55 = v54 * 0.5;
    v56 = [(UIAirDropGroupActivityCell *)self imageView];
    v57 = [v56 layer];
    [v57 setCornerRadius:v55];

    double v58 = *MEMORY[0x1E4F1DB30];
    double v59 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v60 = [(UIAirDropGroupActivityCell *)self imageView];
    v61 = [v60 layer];
    objc_msgSend(v61, "setShadowOffset:", v58, v59);

    v62 = [(UIAirDropGroupActivityCell *)self imageView];
    v63 = [v62 layer];
    [v63 setShadowRadius:10.0];

    v64 = [(UIAirDropGroupActivityCell *)self imageView];
    v65 = [v64 layer];
    [v65 setShadowPathIsBounds:1];

    v66 = [(UIAirDropGroupActivityCell *)self contentView];
    v67 = [(UIAirDropGroupActivityCell *)self imageView];
    [v66 addSubview:v67];

    id v68 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setImageSlotView:v68];

    v69 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    [v69 setTranslatesAutoresizingMaskIntoConstraints:0];

    v70 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    [v70 setAlpha:0.0];

    id v71 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v72 = [v71 CGColor];
    v73 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v74 = [v73 layer];
    [v74 setShadowColor:v72];

    v75 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v76 = [v75 layer];
    LODWORD(v77) = 1032805417;
    [v76 setShadowOpacity:v77];

    v78 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v79 = [v78 layer];
    objc_msgSend(v79, "setShadowOffset:", v58, v59);

    v80 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v81 = [v80 layer];
    [v81 setShadowRadius:10.0];

    v82 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v83 = [v82 layer];
    [v83 setShadowPathIsBounds:1];

    v84 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v85 = [v84 layer];
    [v85 size];
    double v87 = v86 * 0.5;
    v88 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v89 = [v88 layer];
    [v89 setCornerRadius:v87];

    v90 = [(UIAirDropGroupActivityCell *)self contentView];
    v91 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    [v90 addSubview:v91];

    v92 = [_UIAirDropProgressView alloc];
    v93 = -[_UIAirDropProgressView initWithFrame:](v92, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(_UIAirDropProgressView *)v93 setProgressLineWidth:2.0];
    [(_UIAirDropProgressView *)v93 setShowProgressTray:1];
    [(_UIAirDropProgressView *)v93 setAlpha:1.0];
    v94 = [MEMORY[0x1E4FB1618] clearColor];
    [(_UIAirDropProgressView *)v93 setBackgroundColor:v94];

    [(_UIAirDropProgressView *)v93 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIAirDropGroupActivityCell *)self setCircleProgressView:v93];
    v95 = [(UIAirDropGroupActivityCell *)self contentView];
    [v95 addSubview:v93];

    id v96 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(UIAirDropGroupActivityCell *)self setTransportImageView:v96];

    v97 = [(UIAirDropGroupActivityCell *)self transportImageView];
    [v97 setAlpha:0.0];

    v98 = [(UIAirDropGroupActivityCell *)self transportImageView];
    [v98 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v99 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v100 = [v99 CGColor];
    v101 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v102 = [v101 layer];
    [v102 setShadowColor:v100];

    v103 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v104 = [v103 layer];
    LODWORD(v105) = 1032805417;
    [v104 setShadowOpacity:v105];

    v106 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v107 = [v106 layer];
    objc_msgSend(v107, "setShadowOffset:", v58, v59);

    v108 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v109 = [v108 layer];
    [v109 setShadowRadius:5.0];

    v110 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v111 = [v110 layer];
    [v111 setShadowPathIsBounds:1];

    v112 = [(UIAirDropGroupActivityCell *)self contentView];
    v113 = [(UIAirDropGroupActivityCell *)self transportImageView];
    v114 = [(UIAirDropGroupActivityCell *)self circleProgressView];
    [v112 insertSubview:v113 above:v114];

    id v115 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIAirDropGroupActivityCell *)self setTransportSlotView:v115];

    v116 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    [v116 setAlpha:0.0];

    v117 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    [v117 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v118 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v119 = [v118 CGColor];
    v120 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v121 = [v120 layer];
    [v121 setShadowColor:v119];

    v122 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v123 = [v122 layer];
    LODWORD(v124) = 1032805417;
    [v123 setShadowOpacity:v124];

    v125 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v126 = [v125 layer];
    objc_msgSend(v126, "setShadowOffset:", v58, v59);

    v127 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v128 = [v127 layer];
    [v128 setShadowRadius:5.0];

    v129 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v130 = [v129 layer];
    [v130 setShadowPathIsBounds:1];

    v131 = [(UIAirDropGroupActivityCell *)self contentView];
    v132 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    v133 = [(UIAirDropGroupActivityCell *)self circleProgressView];
    [v131 insertSubview:v132 above:v133];

    [(UIAirDropGroupActivityCell *)self _configurePlaceholderViews];
    [(UIAirDropGroupActivityCell *)self setupConstraints];
  }
}

- (void)_setLayoutSpec:(id)a3
{
  id v4 = a3;
  [(UIAirDropGroupActivityCell *)self setLayoutSpec:v4];
  uint64_t v5 = [v4 deviceClass];
  v6 = &regularHeight5_8Rounded;
  id v7 = &regularHeight;
  if (v5 == 10) {
    id v7 = &visionLarge;
  }
  if (v5 == 9) {
    id v7 = &visionCompact;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    id v7 = &compactHeight;
  }
  if (v5 != 3) {
    v6 = v7;
  }
  layout = (uint64_t)v6;
  [v4 peopleIconWidth];
  double v9 = v8;

  self->_circleWidth = v9;
  [getSFUIShareSheetActivityCellSpecClass() transportIconWidth];
  self->_transportIconWidth = v10;
}

- (void)configureLayoutIfNeeded:(id)a3
{
  id v12 = a3;
  id v4 = [(UIAirDropGroupActivityCell *)self layoutSpec];

  [(UIAirDropGroupActivityCell *)self _setLayoutSpec:v12];
  if ([(UIAirDropGroupActivityCell *)self didInstallSubviews])
  {
    uint64_t v5 = v12;
    if (v4 == v12) {
      goto LABEL_6;
    }
    v6 = (void *)MEMORY[0x1E4F28DC8];
    id v7 = [(UIAirDropGroupActivityCell *)self allConstraints];
    [v6 deactivateConstraints:v7];

    [(UIAirDropGroupActivityCell *)self circleWidth];
    double v9 = v8 * 0.5;
    double v10 = [(UIAirDropGroupActivityCell *)self imageView];
    v11 = [v10 layer];
    [v11 setCornerRadius:v9];

    [(UIAirDropGroupActivityCell *)self setupConstraints];
  }
  else
  {
    [(UIAirDropGroupActivityCell *)self _installSubviewsIfNeeded];
  }
  uint64_t v5 = v12;
LABEL_6:
}

- (void)setupConstraints
{
  v316[36] = *MEMORY[0x1E4F143B8];
  v3 = [(UIAirDropGroupActivityCell *)self circleProgressView];
  v313 = [(UIAirDropGroupActivityCell *)self contentView];
  [(UIAirDropGroupActivityCell *)self circleWidth];
  double v5 = v4;
  v6 = (void *)MEMORY[0x1E4F1CA48];
  v311 = [(UIAirDropGroupActivityCell *)self imageView];
  v308 = [v311 widthAnchor];
  v305 = [v308 constraintEqualToConstant:v5];
  v316[0] = v305;
  v302 = [(UIAirDropGroupActivityCell *)self imageView];
  v299 = [v302 heightAnchor];
  v296 = [v299 constraintEqualToConstant:v5];
  v316[1] = v296;
  v293 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v290 = [v293 widthAnchor];
  v287 = [v290 constraintEqualToConstant:v5];
  v316[2] = v287;
  v284 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v281 = [v284 heightAnchor];
  v278 = [v281 constraintEqualToConstant:v5];
  v316[3] = v278;
  v275 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
  v269 = [v275 centerXAnchor];
  v272 = [(UIAirDropGroupActivityCell *)self textLabel];
  v266 = [v272 centerXAnchor];
  v263 = [v269 constraintEqualToAnchor:v266];
  v316[4] = v263;
  v260 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
  v254 = [v260 centerYAnchor];
  v257 = [(UIAirDropGroupActivityCell *)self textLabel];
  v251 = [v257 centerYAnchor];
  v248 = [v254 constraintEqualToAnchor:v251];
  v316[5] = v248;
  v245 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
  v239 = [v245 heightAnchor];
  v242 = [(UIAirDropGroupActivityCell *)self textLabel];
  v236 = [v242 heightAnchor];
  v233 = [v239 constraintEqualToAnchor:v236];
  v316[6] = v233;
  v230 = [(UIAirDropGroupActivityCell *)self vibrantTitleView];
  v224 = [v230 widthAnchor];
  v227 = [(UIAirDropGroupActivityCell *)self textLabel];
  v221 = [v227 widthAnchor];
  v218 = [v224 constraintEqualToAnchor:v221];
  v316[7] = v218;
  v212 = [v3 widthAnchor];
  v215 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v209 = [v215 widthAnchor];
  v206 = [v212 constraintEqualToAnchor:v209 constant:10.0];
  v316[8] = v206;
  v200 = [v3 heightAnchor];
  v203 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v197 = [v203 heightAnchor];
  v194 = [v200 constraintEqualToAnchor:v197 constant:10.0];
  v316[9] = v194;
  v188 = [v3 centerXAnchor];
  v191 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v185 = [v191 centerXAnchor];
  v182 = [v188 constraintEqualToAnchor:v185];
  v316[10] = v182;
  v312 = v3;
  v176 = [v3 centerYAnchor];
  v179 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v173 = [v179 centerYAnchor];
  v170 = [v176 constraintEqualToAnchor:v173];
  v316[11] = v170;
  v167 = [(UIAirDropGroupActivityCell *)self textSlotView];
  v161 = [v167 centerXAnchor];
  v164 = [(UIAirDropGroupActivityCell *)self textLabel];
  v158 = [v164 centerXAnchor];
  v155 = [v161 constraintEqualToAnchor:v158];
  v316[12] = v155;
  v152 = [(UIAirDropGroupActivityCell *)self textSlotView];
  v148 = [v152 centerYAnchor];
  v150 = [(UIAirDropGroupActivityCell *)self textLabel];
  v146 = [v150 centerYAnchor];
  v144 = [v148 constraintEqualToAnchor:v146];
  v316[13] = v144;
  v142 = [(UIAirDropGroupActivityCell *)self textSlotView];
  v138 = [v142 heightAnchor];
  v140 = [(UIAirDropGroupActivityCell *)self textLabel];
  v136 = [v140 heightAnchor];
  id v134 = [v138 constraintEqualToAnchor:v136];
  v316[14] = v134;
  v132 = [(UIAirDropGroupActivityCell *)self textSlotView];
  v128 = [v132 widthAnchor];
  v130 = [(UIAirDropGroupActivityCell *)self textLabel];
  v126 = [v130 widthAnchor];
  double v124 = [v128 constraintEqualToAnchor:v126];
  v316[15] = v124;
  v122 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  id v118 = [v122 centerXAnchor];
  v120 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v117 = [v120 centerXAnchor];
  v116 = [v118 constraintEqualToAnchor:v117];
  v316[16] = v116;
  id v115 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  v113 = [v115 centerYAnchor];
  v114 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v112 = [v114 centerYAnchor];
  v111 = [v113 constraintEqualToAnchor:v112];
  v316[17] = v111;
  v110 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  v108 = [v110 heightAnchor];
  v109 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v107 = [v109 heightAnchor];
  v106 = [v108 constraintEqualToAnchor:v107];
  v316[18] = v106;
  double v105 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  v103 = [v105 widthAnchor];
  v104 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v102 = [v104 widthAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v316[19] = v101;
  uint64_t v100 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
  v98 = [v100 centerXAnchor];
  id v99 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v97 = [v99 centerXAnchor];
  id v96 = [v98 constraintEqualToAnchor:v97];
  v316[20] = v96;
  v95 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
  v93 = [v95 centerYAnchor];
  v94 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v92 = [v94 centerYAnchor];
  v91 = [v93 constraintEqualToAnchor:v92];
  v316[21] = v91;
  v90 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
  v88 = [v90 heightAnchor];
  v89 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  double v87 = [v89 heightAnchor];
  double v86 = [v88 constraintEqualToAnchor:v87];
  v316[22] = v86;
  v85 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
  v83 = [v85 widthAnchor];
  v84 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v82 = [v84 widthAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v316[23] = v81;
  v80 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v78 = [v80 trailingAnchor];
  v79 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  double v77 = [v79 trailingAnchor];
  v76 = [v78 constraintEqualToAnchor:v77 constant:2.0];
  v316[24] = v76;
  v75 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v73 = [v75 bottomAnchor];
  v74 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  uint64_t v72 = [v74 bottomAnchor];
  id v71 = [v73 constraintEqualToAnchor:v72 constant:2.0];
  v316[25] = v71;
  v70 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v69 = [v70 widthAnchor];
  [(UIAirDropGroupActivityCell *)self transportIconWidth];
  id v68 = objc_msgSend(v69, "constraintEqualToConstant:");
  v316[26] = v68;
  v67 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  v66 = [v67 heightAnchor];
  [(UIAirDropGroupActivityCell *)self transportIconWidth];
  v65 = objc_msgSend(v66, "constraintEqualToConstant:");
  v316[27] = v65;
  v64 = [(UIAirDropGroupActivityCell *)self transportImageView];
  v62 = [v64 trailingAnchor];
  v63 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v61 = [v63 trailingAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:2.0];
  v316[28] = v60;
  double v59 = [(UIAirDropGroupActivityCell *)self transportImageView];
  v57 = [v59 bottomAnchor];
  double v58 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v56 = [v58 bottomAnchor];
  double v55 = [v57 constraintEqualToAnchor:v56 constant:2.0];
  v316[29] = v55;
  double v54 = [(UIAirDropGroupActivityCell *)self transportImageView];
  v53 = [v54 widthAnchor];
  [(UIAirDropGroupActivityCell *)self transportIconWidth];
  v52 = objc_msgSend(v53, "constraintEqualToConstant:");
  v316[30] = v52;
  id v51 = [(UIAirDropGroupActivityCell *)self transportImageView];
  v50 = [v51 heightAnchor];
  [(UIAirDropGroupActivityCell *)self transportIconWidth];
  v49 = objc_msgSend(v50, "constraintEqualToConstant:");
  v316[31] = v49;
  v48 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  v46 = [v48 centerXAnchor];
  v47 = [(UIAirDropGroupActivityCell *)self titleLabel];
  id v45 = [v47 centerXAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v316[32] = v44;
  v43 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  v41 = [v43 centerYAnchor];
  v42 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v40 = [v42 centerYAnchor];
  id v7 = [v41 constraintEqualToAnchor:v40];
  v316[33] = v7;
  double v8 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  double v9 = [v8 widthAnchor];
  double v10 = [v9 constraintEqualToConstant:58.0];
  v316[34] = v10;
  v11 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  id v12 = [v11 heightAnchor];
  v13 = [v12 constraintEqualToConstant:9.0];
  v316[35] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v316 count:36];
  v15 = [v6 arrayWithArray:v14];
  [(UIAirDropGroupActivityCell *)self setAllConstraints:v15];

  v16 = [(UIAirDropGroupActivityCell *)self traitCollection];
  v17 = [v16 preferredContentSizeCategory];
  LODWORD(v311) = UIContentSizeCategoryIsAccessibilityCategory(v17);

  v309 = [(UIAirDropGroupActivityCell *)self imageView];
  v306 = [v309 centerYAnchor];
  v303 = [v313 centerYAnchor];
  v300 = [v306 constraintEqualToAnchor:v303];
  v315[0] = v300;
  v297 = [(UIAirDropGroupActivityCell *)self imageView];
  v294 = [v297 leadingAnchor];
  v291 = [v313 leadingAnchor];
  v288 = [v294 constraintEqualToAnchor:v291 constant:0.0];
  v315[1] = v288;
  v285 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v282 = [v285 centerYAnchor];
  v279 = [v313 centerYAnchor];
  v276 = [v282 constraintEqualToAnchor:v279];
  v315[2] = v276;
  v273 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v270 = [v273 leadingAnchor];
  v267 = [v313 leadingAnchor];
  v264 = [v270 constraintEqualToAnchor:v267 constant:0.0];
  v315[3] = v264;
  v261 = [(UIAirDropGroupActivityCell *)self textLabel];
  v258 = [v261 topAnchor];
  v255 = [v313 topAnchor];
  v252 = [v258 constraintGreaterThanOrEqualToAnchor:v255 constant:8.0];
  v315[4] = v252;
  v246 = [v313 bottomAnchor];
  v249 = [(UIAirDropGroupActivityCell *)self textLabel];
  v243 = [v249 bottomAnchor];
  v240 = [v246 constraintGreaterThanOrEqualToAnchor:v243 constant:8.0];
  v315[5] = v240;
  v237 = [(UIAirDropGroupActivityCell *)self textLabel];
  v234 = [v237 trailingAnchor];
  v231 = [v313 trailingAnchor];
  v228 = [v234 constraintEqualToAnchor:v231];
  v315[6] = v228;
  v225 = [(UIAirDropGroupActivityCell *)self textLabel];
  v219 = [v225 leadingAnchor];
  v222 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v216 = [v222 trailingAnchor];
  v213 = [v219 constraintEqualToAnchor:v216 constant:13.0];
  v315[7] = v213;
  v210 = [(UIAirDropGroupActivityCell *)self textLabel];
  v204 = [v210 centerYAnchor];
  v207 = [(UIAirDropGroupActivityCell *)self imageView];
  v201 = [v207 centerYAnchor];
  v198 = [v204 constraintEqualToAnchor:v201];
  v315[8] = v198;
  v195 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v189 = [v195 topAnchor];
  v192 = [(UIAirDropGroupActivityCell *)self textLabel];
  v186 = [v192 topAnchor];
  v183 = [v189 constraintEqualToAnchor:v186];
  v315[9] = v183;
  v180 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v174 = [v180 bottomAnchor];
  v177 = [(UIAirDropGroupActivityCell *)self textLabel];
  v171 = [v177 centerYAnchor];
  v168 = [v174 constraintEqualToAnchor:v171];
  v315[10] = v168;
  v165 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v159 = [v165 leadingAnchor];
  v162 = [(UIAirDropGroupActivityCell *)self textLabel];
  v156 = [v162 leadingAnchor];
  v153 = [v159 constraintEqualToAnchor:v156];
  v315[11] = v153;
  v151 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v147 = [v151 trailingAnchor];
  v149 = [(UIAirDropGroupActivityCell *)self textLabel];
  v145 = [v149 trailingAnchor];
  v143 = [v147 constraintEqualToAnchor:v145];
  v315[12] = v143;
  v141 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v137 = [v141 topAnchor];
  v139 = [(UIAirDropGroupActivityCell *)self textLabel];
  v135 = [v139 centerYAnchor];
  v133 = [v137 constraintEqualToAnchor:v135];
  v315[13] = v133;
  v131 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v127 = [v131 bottomAnchor];
  v129 = [(UIAirDropGroupActivityCell *)self textLabel];
  v125 = [v129 bottomAnchor];
  v123 = [v127 constraintEqualToAnchor:v125];
  v315[14] = v123;
  v121 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  uint64_t v119 = [v121 leadingAnchor];
  v18 = [(UIAirDropGroupActivityCell *)self textLabel];
  v19 = [v18 leadingAnchor];
  v20 = [v119 constraintEqualToAnchor:v19];
  v315[15] = v20;
  v21 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v22 = [v21 trailingAnchor];
  v23 = [(UIAirDropGroupActivityCell *)self textLabel];
  v24 = [v23 trailingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v315[16] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v315 count:17];
  [(UIAirDropGroupActivityCell *)self setLargeTextConstraints:v26];

  v310 = [(UIAirDropGroupActivityCell *)self imageView];
  v307 = [v310 topAnchor];
  v304 = [v313 topAnchor];
  v301 = [v307 constraintEqualToAnchor:v304 constant:*(double *)layout];
  v314[0] = v301;
  v298 = [(UIAirDropGroupActivityCell *)self imageView];
  v295 = [v298 centerXAnchor];
  v292 = [v313 centerXAnchor];
  v289 = [v295 constraintEqualToAnchor:v292];
  v314[1] = v289;
  v286 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v280 = [v286 topAnchor];
  v283 = [(UIAirDropGroupActivityCell *)self imageView];
  v277 = [v283 topAnchor];
  v274 = [v280 constraintEqualToAnchor:v277];
  v314[2] = v274;
  v271 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v265 = [v271 centerXAnchor];
  v268 = [(UIAirDropGroupActivityCell *)self imageView];
  v262 = [v268 centerXAnchor];
  v259 = [v265 constraintEqualToAnchor:v262];
  v314[3] = v259;
  v256 = [(UIAirDropGroupActivityCell *)self textLabel];
  v250 = [v256 topAnchor];
  v253 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v247 = [v253 bottomAnchor];
  v244 = [v250 constraintEqualToAnchor:v247 constant:*(double *)(layout + 8)];
  v314[4] = v244;
  v241 = [(UIAirDropGroupActivityCell *)self textLabel];
  v238 = [v241 bottomAnchor];
  v235 = [v313 bottomAnchor];
  v232 = [v238 constraintLessThanOrEqualToAnchor:v235 constant:*(double *)(layout + 16)];
  v314[5] = v232;
  v229 = [(UIAirDropGroupActivityCell *)self textLabel];
  v226 = [v229 widthAnchor];
  v223 = [v313 widthAnchor];
  v220 = [v226 constraintEqualToAnchor:v223 constant:*(double *)(layout + 24)];
  v314[6] = v220;
  v217 = [(UIAirDropGroupActivityCell *)self textLabel];
  v214 = [v217 centerXAnchor];
  v211 = [v313 centerXAnchor];
  v208 = [v214 constraintEqualToAnchor:v211];
  v314[7] = v208;
  v205 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v199 = [v205 topAnchor];
  v202 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  v196 = [v202 bottomAnchor];
  v193 = [v199 constraintEqualToAnchor:v196 constant:*(double *)(layout + 8)];
  v314[8] = v193;
  v190 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v187 = [v190 widthAnchor];
  v184 = [v313 widthAnchor];
  v181 = [v187 constraintEqualToAnchor:v184 constant:*(double *)(layout + 24)];
  v314[9] = v181;
  v178 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v175 = [v178 centerXAnchor];
  v172 = [v313 centerXAnchor];
  v169 = [v175 constraintEqualToAnchor:v172];
  v314[10] = v169;
  v166 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v160 = [v166 topAnchor];
  v163 = [(UIAirDropGroupActivityCell *)self titleLabel];
  v157 = [v163 bottomAnchor];
  v154 = [v160 constraintEqualToAnchor:v157];
  v314[11] = v154;
  v27 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v28 = [v27 widthAnchor];
  v29 = [v313 widthAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:*(double *)(layout + 24)];
  v314[12] = v30;
  v31 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  v32 = [v31 centerXAnchor];
  id v33 = [v313 centerXAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  v314[13] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v314 count:14];
  [(UIAirDropGroupActivityCell *)self setRegularConstraints:v35];

  v36 = [(UIAirDropGroupActivityCell *)self allConstraints];
  if (v311) {
    [(UIAirDropGroupActivityCell *)self largeTextConstraints];
  }
  else {
  v37 = [(UIAirDropGroupActivityCell *)self regularConstraints];
  }
  [v36 addObjectsFromArray:v37];

  v38 = (void *)MEMORY[0x1E4F28DC8];
  id v39 = [(UIAirDropGroupActivityCell *)self allConstraints];
  [v38 activateConstraints:v39];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIAirDropGroupActivityCell;
  id v4 = a3;
  [(UIAirDropGroupActivityCell *)&v8 traitCollectionDidChange:v4];
  double v5 = [(UIAirDropGroupActivityCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(UIAirDropGroupActivityCell *)self _updateConstraints];
  }
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  self->_progress = a3;
  id location = 0;
  objc_initWeak(&location, self);
  v6 = (void *)*MEMORY[0x1E4FB2608];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__UIAirDropGroupActivityCell_setProgress_animated___block_invoke;
  v7[3] = &unk_1E5A21970;
  objc_copyWeak(v8, &location);
  v8[1] = *(id *)&a3;
  BOOL v9 = a4;
  [v6 _performBlockAfterCATransactionCommits:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __51__UIAirDropGroupActivityCell_setProgress_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgress:*(unsigned __int8 *)(a1 + 48) animated:*(double *)(a1 + 40)];
}

- (void)_updateProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = [(UIAirDropGroupActivityCell *)self stateBeingRestored];
  id location = 0;
  objc_initWeak(&location, self);
  objc_super v8 = [(UIAirDropGroupActivityCell *)self circleProgressView];
  uint64_t v9 = v4 & ~v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__UIAirDropGroupActivityCell__updateProgress_animated___block_invoke;
  v10[3] = &unk_1E5A21970;
  objc_copyWeak(v11, &location);
  v11[1] = *(id *)&a3;
  char v12 = v9;
  [v8 setProgress:v9 animated:v10 completion:a3];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __55__UIAirDropGroupActivityCell__updateProgress_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didCompleteAirDropProgress:*(unsigned __int8 *)(a1 + 48) animated:*(double *)(a1 + 40)];
}

- (void)_didCompleteAirDropProgress:(double)a3 animated:(BOOL)a4
{
  if (a3 >= 1.0 || a3 == 0.0)
  {
    if (a4)
    {
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      id v11[2] = __67__UIAirDropGroupActivityCell__didCompleteAirDropProgress_animated___block_invoke;
      v11[3] = &unk_1E5A21998;
      objc_copyWeak(&v12, &location);
      [v9 animateWithDuration:v11 animations:0.5];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      return;
    }
    int v7 = [(UIAirDropGroupActivityCell *)self circleProgressView];
    id v10 = v7;
    goto LABEL_8;
  }
  [(UIAirDropGroupActivityCell *)self progress];
  double v6 = v5;
  int v7 = [(UIAirDropGroupActivityCell *)self circleProgressView];
  id v10 = v7;
  if (v6 <= 0.0)
  {
LABEL_8:
    double v8 = 0.0;
    goto LABEL_9;
  }
  double v8 = 1.0;
LABEL_9:
  [v7 setAlpha:v8];
}

void __67__UIAirDropGroupActivityCell__didCompleteAirDropProgress_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained circleProgressView];
  [v1 setAlpha:0.0];
}

- (void)startPulsing
{
  if (![(UIAirDropGroupActivityCell *)self isPulsing])
  {
    [(UIAirDropGroupActivityCell *)self setIsPulsing:1];
    v3 = [(UIAirDropGroupActivityCell *)self subtitle];
    if ([v3 length]) {
      [(UIAirDropGroupActivityCell *)self subtitleLabel];
    }
    else {
    BOOL v4 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    }

    [v4 setAlpha:1.0];
    double v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__UIAirDropGroupActivityCell_startPulsing__block_invoke;
    v7[3] = &unk_1E5A21900;
    id v8 = v4;
    id v6 = v4;
    [v5 animateWithDuration:24 delay:v7 options:0 animations:0.75 completion:0.0];
  }
}

uint64_t __42__UIAirDropGroupActivityCell_startPulsing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.2];
}

- (void)stopPulsing
{
  if ([(UIAirDropGroupActivityCell *)self isPulsing])
  {
    [(UIAirDropGroupActivityCell *)self setIsPulsing:0];
    v3 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
    [v3 _removeAllAnimations:1];

    BOOL v4 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
    [v4 alpha];
    double v6 = v5;

    if (v6 > 0.0)
    {
      int v7 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
      [v7 setAlpha:1.0];
    }
    id v8 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    uint64_t v9 = [v8 layer];
    [v9 removeAllAnimations];

    id v10 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    [v10 alpha];
    double v12 = v11;

    if (v12 > 0.0)
    {
      id v13 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
      [v13 setAlpha:1.0];
    }
  }
}

- (id)createTargetedPreview
{
  if ([(UIAirDropGroupActivityCell *)self imageSlotID]) {
    [(UIAirDropGroupActivityCell *)self imageSlotView];
  }
  else {
  v3 = [(UIAirDropGroupActivityCell *)self imageView];
  }
  [v3 frame];
  BOOL v4 = [MEMORY[0x1E4FB14C0] bezierPathWithRoundedRect:0.0 cornerRadius:0.0];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v5 setVisiblePath:v4];
  double v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v3 parameters:v5];

  return v6;
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)UIAirDropGroupActivityCell;
  [(UIAirDropGroupActivityCell *)&v7 prepareForReuse];
  [(UIAirDropGroupActivityCell *)self setDisplayName:0];
  [(UIAirDropGroupActivityCell *)self setTextSlotID:0];
  [(UIAirDropGroupActivityCell *)self setSubtitle:0];
  [(UIAirDropGroupActivityCell *)self setSubtitleSlotID:0];
  [(UIAirDropGroupActivityCell *)self setImage:0];
  [(UIAirDropGroupActivityCell *)self setImageSlotID:0];
  [(UIAirDropGroupActivityCell *)self setTransportImage:0];
  [(UIAirDropGroupActivityCell *)self setTransportSlotID:0];
  [(UIAirDropGroupActivityCell *)self setSquareImage:0];
  [(UIAirDropGroupActivityCell *)self setDisabled:0];
  [(UIAirDropGroupActivityCell *)self setIsGroup:0];
  [(UIAirDropGroupActivityCell *)self _configurePlaceholderViews];
  id SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
  BOOL v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = objc_msgSend(SFUIShareSheetActivityCellSpecClass, "subtitleLabelColorForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  double v6 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v6 setTextColor:v5];

  [(UIAirDropGroupActivityCell *)self stopPulsing];
}

- (id)_placeholderStringForSingleLine:(BOOL)a3
{
  if (a3)
  {
    BOOL v4 = @"Apple";
  }
  else
  {
    double v6 = [(UIAirDropGroupActivityCell *)self traitCollection];
    objc_super v7 = [v6 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    uint64_t v9 = @"Apple\nInc";
    if (IsAccessibilityCategory) {
      uint64_t v9 = @"Apple\nInc\n";
    }
    BOOL v4 = v9;
  }
  return v4;
}

- (id)_labelFont
{
  v2 = (void *)MEMORY[0x1E4FB1798];
  id SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
  BOOL v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  id v5 = objc_msgSend(SFUIShareSheetActivityCellSpecClass, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  double v6 = [v2 preferredFontForTextStyle:v5];

  return v6;
}

- (id)_createLabelForSingleLine:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = -[UIAirDropGroupActivityCell _placeholderStringForSingleLine:](self, "_placeholderStringForSingleLine:");
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  objc_super v7 = [(UIAirDropGroupActivityCell *)self _labelFont];
  [v6 setFont:v7];

  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v8];

  [v6 setTextAlignment:1];
  if (v3) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 3;
  }
  [v6 setNumberOfLines:v9];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v6 setText:v5];
  [v6 setAlpha:0.0];

  return v6;
}

- (void)_updateConstraints
{
  id v14 = [(UIAirDropGroupActivityCell *)self _labelFont];
  BOOL v3 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v3 setFont:v14];

  BOOL v4 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v4 setFont:v14];

  id v5 = [(UIAirDropGroupActivityCell *)self textLabel];
  [v5 setFont:v14];

  [(UIAirDropGroupActivityCell *)self _invalidateDisplayName];
  id v6 = [(UIAirDropGroupActivityCell *)self traitCollection];
  objc_super v7 = [v6 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  uint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
  if (IsAccessibilityCategory)
  {
    id v10 = [(UIAirDropGroupActivityCell *)self regularConstraints];
    [v9 deactivateConstraints:v10];

    double v11 = (void *)MEMORY[0x1E4F28DC8];
    [(UIAirDropGroupActivityCell *)self largeTextConstraints];
  }
  else
  {
    double v12 = [(UIAirDropGroupActivityCell *)self largeTextConstraints];
    [v9 deactivateConstraints:v12];

    double v11 = (void *)MEMORY[0x1E4F28DC8];
    [(UIAirDropGroupActivityCell *)self regularConstraints];
  id v13 = };
  [v11 activateConstraints:v13];

  [(UIAirDropGroupActivityCell *)self setNeedsLayout];
}

- (void)_updateFormattedDisplayName
{
  v34[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIAirDropGroupActivityCell *)self displayName];
  BOOL v4 = [(UIAirDropGroupActivityCell *)self textLabel];
  id v5 = [(UIAirDropGroupActivityCell *)self displayName];
  id v6 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  objc_super v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  id v8 = [(UIAirDropGroupActivityCell *)self traitCollection];
  uint64_t v9 = [v8 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

  double v11 = [(UIAirDropGroupActivityCell *)self subtitle];
  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = [(UIAirDropGroupActivityCell *)self isGroup];
  }

  if (!IsAccessibilityCategory)
  {
    char v13 = [v7 count] != 2 || v12;
    if (v13)
    {
      id v14 = [(UIAirDropGroupActivityCell *)self displayName];
      uint64_t v15 = SFNonBreakingStringFromDeviceName();

      BOOL v3 = (void *)v15;
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4FB1378]);
      [v16 setLineBreakMode:0];
      [v16 setHyphenationFactor:0.0];
      [v16 setLineBreakStrategy:0xFFFFLL];
      [v16 setAlignment:1];
      v33[0] = *MEMORY[0x1E4FB12B8];
      v17 = [v4 textColor];
      v34[0] = v17;
      v33[1] = *MEMORY[0x1E4FB12B0];
      v18 = [v4 font];
      v34[1] = v18;
      v33[2] = *MEMORY[0x1E4FB12D0];
      v19 = (void *)[v16 copy];
      v34[2] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];

      v21 = [v7 firstObject];
      v22 = [v7 lastObject];
      if ([v21 length] && objc_msgSend(v22, "length"))
      {
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21 attributes:v20];
        [v4 frame];
        v32 = v23;
        objc_msgSend(v23, "boundingRectWithSize:options:context:", 35, 0, v24, v25);
        CGRect v36 = CGRectIntegral(v35);
        double height = v36.size.height;
        v27 = objc_msgSend(v4, "font", v36.origin.x, v36.origin.y, v36.size.width);
        [v27 lineHeight];
        *(float *)&double v28 = v28;
        LODWORD(v23) = llroundf(*(float *)&v28);

        float v29 = height;
        if ((int)llroundf(v29) / (int)v23 == 1)
        {
          uint64_t v30 = [NSString stringWithFormat:@"%@\n%@", v21, v22];

          BOOL v3 = (void *)v30;
        }
      }
    }
  }
  formattedDisplayName = self->_formattedDisplayName;
  self->_formattedDisplayName = (NSString *)v3;
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  displayName = self->_displayName;
  id v10 = (NSString *)v4;
  id v6 = displayName;
  if (v6 == v10)
  {

    goto LABEL_8;
  }
  if ((v10 == 0) == (v6 != 0))
  {

    goto LABEL_7;
  }
  char v7 = [(NSString *)v10 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = (NSString *)[(NSString *)v10 copy];
    uint64_t v9 = self->_displayName;
    self->_displayName = v8;

    [(UIAirDropGroupActivityCell *)self _invalidateDisplayName];
  }
LABEL_8:
}

- (void)setTextSlotID:(unsigned int)a3
{
  if (self->_textSlotID != a3)
  {
    self->_textSlotID = a3;
    [(UIAirDropGroupActivityCell *)self _invalidateDisplayName];
  }
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  subtitle = self->_subtitle;
  id v10 = (NSString *)v4;
  id v6 = subtitle;
  if (v6 == v10)
  {

    goto LABEL_8;
  }
  if ((v10 == 0) == (v6 != 0))
  {

    goto LABEL_7;
  }
  char v7 = [(NSString *)v10 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_7:
    id v8 = (NSString *)[(NSString *)v10 copy];
    uint64_t v9 = self->_subtitle;
    self->_subtitle = v8;

    [(UIAirDropGroupActivityCell *)self _invalidateSubtitle];
  }
LABEL_8:
}

- (void)setSubtitleSlotID:(unsigned int)a3
{
  if (self->_subtitleSlotID != a3)
  {
    self->_subtitleSlotID = a3;
    [(UIAirDropGroupActivityCell *)self _invalidateSubtitle];
  }
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(UIAirDropGroupActivityCell *)self _updateImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    [(UIAirDropGroupActivityCell *)self _updateImageView];
  }
}

- (void)setTransportImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_transportImage = &self->_transportImage;
  if (self->_transportImage != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_transportImage, a3);
    p_transportImage = (UIImage **)[(UIAirDropGroupActivityCell *)self _updateTransportView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_transportImage, v5);
}

- (void)setTransportSlotID:(unsigned int)a3
{
  if (self->_transportSlotID != a3)
  {
    self->_transportSlotID = a3;
    [(UIAirDropGroupActivityCell *)self _updateTransportView];
  }
}

- (void)setSquareImage:(BOOL)a3
{
  if (self->_squareImage != a3)
  {
    BOOL v4 = a3;
    self->_squareImage = a3;
    if (a3)
    {
      BOOL v3 = [(UIAirDropGroupActivityCell *)self imageSlotView];
      [v3 bounds];
      double v6 = CGRectGetWidth(v12) * 0.5;
    }
    else
    {
      double v6 = 0.0;
    }
    char v7 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    id v8 = [v7 layer];
    [v8 setCornerRadius:v6];

    if (v4) {
    id v10 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    }
    uint64_t v9 = [v10 layer];
    [v9 setMasksToBounds:v4];
  }
}

- (void)setDisabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_disabled != a3)
  {
    BOOL v3 = a3;
    self->_disabled = a3;
    id v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(UIAirDropGroupActivityCell *)self identifier];
      char v7 = (void *)v6;
      id v8 = "no";
      if (v3) {
        id v8 = "yes";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      CGRect v12 = v8;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Updating People Cell with identifier:%@ to disabled:%s", (uint8_t *)&v9, 0x16u);
    }
    [(UIAirDropGroupActivityCell *)self _updateDarkening];
  }
}

- (void)setSubtitleTextColor:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (!v5)
  {
    id SFUIShareSheetActivityCellSpecClass = getSFUIShareSheetActivityCellSpecClass();
    BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    objc_msgSend(SFUIShareSheetActivityCellSpecClass, "subtitleLabelColorForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  char v7 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v7 setTextColor:v5];

  id v8 = v9;
  if (!v9)
  {

    id v8 = 0;
  }
}

- (void)setIsGroup:(BOOL)a3
{
  if (self->_isGroup != a3)
  {
    self->_isGroup = a3;
    [(UIAirDropGroupActivityCell *)self _invalidateDisplayName];
  }
}

- (void)_invalidateDisplayName
{
  [(UIAirDropGroupActivityCell *)self _updateFormattedDisplayName];
  BOOL v3 = [(UIAirDropGroupActivityCell *)self subtitle];
  if ([v3 length])
  {

LABEL_4:
    [(UIAirDropGroupActivityCell *)self _updateTitleView];
    return;
  }
  unsigned int v4 = [(UIAirDropGroupActivityCell *)self subtitleSlotID];

  if (v4) {
    goto LABEL_4;
  }
  [(UIAirDropGroupActivityCell *)self _updateTextView];
}

- (void)_invalidateSubtitle
{
  [(UIAirDropGroupActivityCell *)self _invalidateDisplayName];
  [(UIAirDropGroupActivityCell *)self _updateSubtitleView];
}

- (void)_configurePlaceholderViews
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  [v3 setAlpha:1.0];

  [(UIAirDropGroupActivityCell *)self _configureImageViewForPlaceholder:1];
}

- (void)_configureImageViewForPlaceholder:(BOOL)a3
{
  BOOL v4 = a3;
  if (a3)
  {
    double v6 = 1.0;
  }
  else
  {
    BOOL v3 = [(UIAirDropGroupActivityCell *)self imageView];
    [v3 alpha];
    double v6 = v7;
  }
  id v8 = [(UIAirDropGroupActivityCell *)self imageView];
  [v8 setAlpha:v6];

  if (v4)
  {
    id v9 = [(UIAirDropGroupActivityCell *)self imageView];
    uint64_t v10 = [v9 layer];
    [v10 setShadowOpacity:0.0];

    __int16 v11 = [(UIAirDropGroupActivityCell *)self traitCollection];
    SHSheetUISpecPlaceholderColor([v11 userInterfaceStyle]);
  }
  else
  {

    __int16 v11 = [(UIAirDropGroupActivityCell *)self imageView];
    CGRect v12 = [v11 layer];
    LODWORD(v13) = 1032805417;
    [v12 setShadowOpacity:v13];

    [MEMORY[0x1E4FB1618] clearColor];
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [(UIAirDropGroupActivityCell *)self imageView];
  [v14 setBackgroundColor:v15];

  if (v4)
  {

    id v15 = v11;
  }
}

- (void)_updateTextView
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  [v3 setAlpha:0.0];

  id v37 = [(UIAirDropGroupActivityCell *)self formattedDisplayName];
  uint64_t v4 = [v37 length];
  id v5 = v37;
  if (!v4)
  {
    id v5 = [(UIAirDropGroupActivityCell *)self _placeholderStringForSingleLine:0];
  }
  double v6 = [(UIAirDropGroupActivityCell *)self textLabel];
  [v6 setText:v5];

  if (v4)
  {
    double v7 = 1.0;
  }
  else
  {

    double v7 = 0.0;
  }
  id v8 = [(UIAirDropGroupActivityCell *)self textLabel];
  [v8 setAlpha:v7];

  unsigned int v9 = [(UIAirDropGroupActivityCell *)self textSlotID];
  if (v9)
  {
    uint64_t v10 = [(UIAirDropGroupActivityCell *)self traitCollection];
    uint64_t v11 = [v10 layoutDirection];

    CGRect v12 = [(UIAirDropGroupActivityCell *)self traitCollection];
    double v13 = [v12 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    id v15 = (id *)MEMORY[0x1E4F3A3E8];
    if (v11 != 1) {
      id v15 = (id *)MEMORY[0x1E4F3A3C8];
    }
    id v16 = (void *)MEMORY[0x1E4F39B58];
    id v17 = *v15;
    v18 = objc_msgSend(v16, "objectForSlot:", -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID"));
    v19 = [(UIAirDropGroupActivityCell *)self textSlotView];
    [v19 setAlpha:1.0];

    double v20 = _ShareSheetDeviceScreenScale();
    v21 = [(UIAirDropGroupActivityCell *)self textSlotView];
    v22 = [v21 layer];
    [v22 setContentsScale:v20];

    double v23 = _ShareSheetDeviceScreenScale();
    double v24 = [(UIAirDropGroupActivityCell *)self textSlotView];
    double v25 = [v24 layer];
    [v25 setRasterizationScale:v23];

    if (IsAccessibilityCategory) {
      id v26 = v17;
    }
    else {
      id v26 = (id)*MEMORY[0x1E4F3A3A8];
    }
    v27 = [(UIAirDropGroupActivityCell *)self textSlotView];
    double v28 = [v27 layer];
    [v28 setContentsGravity:v26];

    float v29 = [(UIAirDropGroupActivityCell *)self textSlotView];
    uint64_t v30 = [v29 layer];
    [v30 setContents:v18];
  }
  else
  {
    v18 = [(UIAirDropGroupActivityCell *)self textSlotView];
    float v29 = [v18 layer];
    [v29 setContents:0];
  }

  if (v9) {
    double v31 = 1.0;
  }
  else {
    double v31 = 0.0;
  }
  v32 = [(UIAirDropGroupActivityCell *)self textSlotView];
  [v32 setAlpha:v31];

  if (v4 || v9)
  {
    id v33 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    [v33 setAlpha:0.0];

    v34 = [(UIAirDropGroupActivityCell *)self titleLabel];
    [v34 setAlpha:0.0];

    CGRect v35 = [(UIAirDropGroupActivityCell *)self _placeholderStringForSingleLine:1];
    CGRect v36 = [(UIAirDropGroupActivityCell *)self titleLabel];
    [v36 setText:v35];
  }
}

- (void)_updateTitleView
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  [v3 setAlpha:0.0];

  id v40 = [(UIAirDropGroupActivityCell *)self formattedDisplayName];
  uint64_t v4 = [v40 length];
  id v5 = v40;
  if (!v4)
  {
    id v5 = [(UIAirDropGroupActivityCell *)self _placeholderStringForSingleLine:1];
  }
  double v6 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v6 setText:v5];

  if (v4)
  {
    double v7 = 1.0;
  }
  else
  {

    double v7 = 0.0;
  }
  id v8 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v8 setAlpha:v7];

  if ([(UIAirDropGroupActivityCell *)self isGroup]) {
    double v9 = 0.8;
  }
  else {
    double v9 = 0.0;
  }
  uint64_t v10 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v10 setMinimumScaleFactor:v9];

  BOOL v11 = [(UIAirDropGroupActivityCell *)self isGroup];
  CGRect v12 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v12 setAdjustsFontSizeToFitWidth:v11];

  unsigned int v13 = [(UIAirDropGroupActivityCell *)self textSlotID];
  if (v13)
  {
    id v14 = [(UIAirDropGroupActivityCell *)self traitCollection];
    uint64_t v15 = [v14 layoutDirection];

    id v16 = [(UIAirDropGroupActivityCell *)self traitCollection];
    id v17 = [v16 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v17);

    v19 = (id *)MEMORY[0x1E4F3A3E8];
    if (v15 != 1) {
      v19 = (id *)MEMORY[0x1E4F3A3C8];
    }
    double v20 = (void *)MEMORY[0x1E4F39B58];
    id v21 = *v19;
    v22 = objc_msgSend(v20, "objectForSlot:", -[UIAirDropGroupActivityCell textSlotID](self, "textSlotID"));
    double v23 = _ShareSheetDeviceScreenScale();
    double v24 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    double v25 = [v24 layer];
    [v25 setContentsScale:v23];

    double v26 = _ShareSheetDeviceScreenScale();
    v27 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    double v28 = [v27 layer];
    [v28 setRasterizationScale:v26];

    if (IsAccessibilityCategory) {
      id v29 = v21;
    }
    else {
      id v29 = (id)*MEMORY[0x1E4F3A3A8];
    }
    uint64_t v30 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    double v31 = [v30 layer];
    [v31 setContentsGravity:v29];

    v32 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    id v33 = [v32 layer];
    [v33 setContents:v22];
  }
  else
  {
    v22 = [(UIAirDropGroupActivityCell *)self titleSlotView];
    v32 = [v22 layer];
    [v32 setContents:0];
  }

  if (v13) {
    double v34 = 1.0;
  }
  else {
    double v34 = 0.0;
  }
  CGRect v35 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  [v35 setAlpha:v34];

  if (v4 || v13)
  {
    CGRect v36 = [(UIAirDropGroupActivityCell *)self textSlotView];
    [v36 setAlpha:0.0];

    id v37 = [(UIAirDropGroupActivityCell *)self textLabel];
    [v37 setAlpha:0.0];

    v38 = [(UIAirDropGroupActivityCell *)self _placeholderStringForSingleLine:0];
    id v39 = [(UIAirDropGroupActivityCell *)self textLabel];
    [v39 setText:v38];
  }
}

- (void)_updateSubtitleView
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self placeholderTitleView];
  [v3 setAlpha:0.0];

  id v32 = [(UIAirDropGroupActivityCell *)self subtitle];
  uint64_t v4 = [v32 length];
  id v5 = v32;
  if (!v4)
  {
    id v5 = [(UIAirDropGroupActivityCell *)self _placeholderStringForSingleLine:1];
  }
  double v6 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v6 setText:v5];

  if (v4)
  {
    double v7 = 1.0;
  }
  else
  {

    double v7 = 0.0;
  }
  id v8 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v8 setAlpha:v7];

  unsigned int v9 = [(UIAirDropGroupActivityCell *)self subtitleSlotID];
  if (v9)
  {
    uint64_t v10 = [(UIAirDropGroupActivityCell *)self traitCollection];
    uint64_t v11 = [v10 layoutDirection];

    CGRect v12 = [(UIAirDropGroupActivityCell *)self traitCollection];
    unsigned int v13 = [v12 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    uint64_t v15 = (id *)MEMORY[0x1E4F3A3B8];
    if (v11 != 1) {
      uint64_t v15 = (id *)MEMORY[0x1E4F3A3B0];
    }
    id v16 = (void *)MEMORY[0x1E4F39B58];
    id v17 = *v15;
    v18 = objc_msgSend(v16, "objectForSlot:", -[UIAirDropGroupActivityCell subtitleSlotID](self, "subtitleSlotID"));
    double v19 = _ShareSheetDeviceScreenScale();
    double v20 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    id v21 = [v20 layer];
    [v21 setContentsScale:v19];

    double v22 = _ShareSheetDeviceScreenScale();
    double v23 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    double v24 = [v23 layer];
    [v24 setRasterizationScale:v22];

    if (IsAccessibilityCategory) {
      id v25 = v17;
    }
    else {
      id v25 = (id)*MEMORY[0x1E4F3A3A8];
    }
    double v26 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    v27 = [v26 layer];
    [v27 setContentsGravity:v25];

    double v28 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    id v29 = [v28 layer];
    [v29 setContents:v18];
  }
  else
  {
    v18 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
    double v28 = [v18 layer];
    [v28 setContents:0];
  }

  if (v9) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  double v31 = [(UIAirDropGroupActivityCell *)self subtitleSlotView];
  [v31 setAlpha:v30];
}

- (void)_updateImageView
{
  [(UIAirDropGroupActivityCell *)self _configureImageViewForPlaceholder:0];
  BOOL v3 = [(UIAirDropGroupActivityCell *)self image];

  uint64_t v4 = [(UIAirDropGroupActivityCell *)self image];
  id v5 = [(UIAirDropGroupActivityCell *)self imageView];
  [v5 setImage:v4];

  double v6 = 0.0;
  if (v3) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  id v8 = [(UIAirDropGroupActivityCell *)self imageView];
  [v8 setAlpha:v7];

  unsigned int v9 = [(UIAirDropGroupActivityCell *)self imageSlotID];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIAirDropGroupActivityCell imageSlotID](self, "imageSlotID"));
    uint64_t v11 = *MEMORY[0x1E4F3A3D0];
    CGRect v12 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    unsigned int v13 = [v12 layer];
    [v13 setContentsGravity:v11];

    id v14 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    uint64_t v15 = [v14 layer];
    [v15 setContents:v10];

    BOOL v16 = [(UIAirDropGroupActivityCell *)self isSquareImage];
    if (v16)
    {
      uint64_t v15 = [(UIAirDropGroupActivityCell *)self imageSlotView];
      [v15 bounds];
      double v6 = CGRectGetWidth(v25) * 0.5;
    }
    id v17 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    v18 = [v17 layer];
    [v18 setCornerRadius:v6];

    if (v16) {
    BOOL v19 = [(UIAirDropGroupActivityCell *)self isSquareImage];
    }
    double v20 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    id v21 = [v20 layer];
    [v21 setMasksToBounds:v19];
  }
  else
  {
    uint64_t v10 = [(UIAirDropGroupActivityCell *)self imageSlotView];
    double v20 = [v10 layer];
    [v20 setContents:0];
  }

  if (v9) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.0;
  }
  id v23 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  [v23 setAlpha:v22];
}

- (void)_updateTransportView
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self transportImage];

  uint64_t v4 = [(UIAirDropGroupActivityCell *)self transportImage];
  id v5 = [(UIAirDropGroupActivityCell *)self transportImageView];
  [v5 setImage:v4];

  if (v3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  double v7 = [(UIAirDropGroupActivityCell *)self transportImageView];
  [v7 setAlpha:v6];

  unsigned int v8 = [(UIAirDropGroupActivityCell *)self transportSlotID];
  if (v8)
  {
    unsigned int v9 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIAirDropGroupActivityCell transportSlotID](self, "transportSlotID"));
    uint64_t v10 = *MEMORY[0x1E4F3A3D0];
    uint64_t v11 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    CGRect v12 = [v11 layer];
    [v12 setContentsGravity:v10];

    unsigned int v13 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    id v14 = [v13 layer];
    [v14 setContents:v9];
  }
  else
  {
    unsigned int v9 = [(UIAirDropGroupActivityCell *)self transportSlotView];
    unsigned int v13 = [v9 layer];
    [v13 setContents:0];
  }

  if (v8) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  id v16 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  [v16 setAlpha:v15];
}

- (void)_updateDarkening
{
  BOOL v3 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  uint64_t v4 = [v3 layer];
  id v29 = [v4 contents];

  id v5 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  double v6 = [v5 layer];
  double v7 = [v6 contents];

  unsigned int v8 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  unsigned int v9 = [v8 layer];
  uint64_t v10 = [v9 contents];

  uint64_t v11 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  CGRect v12 = [v11 layer];
  [v12 setContents:v29];

  unsigned int v13 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  id v14 = [v13 layer];
  [v14 setContents:v7];

  id v15 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  id v16 = [v15 layer];
  [v16 setContents:v10];

  if (([(UIAirDropGroupActivityCell *)self isHighlighted] & 1) != 0
    || [(UIAirDropGroupActivityCell *)self isDisabled])
  {
    id v15 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v17 = [v15 CGColor];
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
    uint64_t v17 = 0;
  }
  BOOL v19 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  double v20 = [v19 layer];
  [v20 setContentsMultiplyColor:v17];

  if (v18) {
  if (([(UIAirDropGroupActivityCell *)self isHighlighted] & 1) != 0
  }
    || [(UIAirDropGroupActivityCell *)self isDisabled])
  {
    id v15 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v21 = [v15 CGColor];
    int v22 = 1;
  }
  else
  {
    int v22 = 0;
    uint64_t v21 = 0;
  }
  id v23 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  double v24 = [v23 layer];
  [v24 setContentsMultiplyColor:v21];

  if (v22) {
  uint64_t v25 = [(UIAirDropGroupActivityCell *)self isDisabled] ^ 1;
  }
  double v26 = [(UIAirDropGroupActivityCell *)self textLabel];
  [v26 setEnabled:v25];

  v27 = [(UIAirDropGroupActivityCell *)self titleLabel];
  [v27 setEnabled:v25];

  double v28 = [(UIAirDropGroupActivityCell *)self subtitleLabel];
  [v28 setEnabled:v25];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIAirDropGroupActivityCell *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIAirDropGroupActivityCell;
    [(UIAirDropGroupActivityCell *)&v5 setHighlighted:v3];
    [(UIAirDropGroupActivityCell *)self _updateDarkening];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  double v6 = [v5 layer];
  double v7 = [v6 contents];

  unsigned int v8 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  unsigned int v9 = [v8 layer];
  uint64_t v10 = [v9 contents];

  uint64_t v11 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  CGRect v12 = [v11 layer];
  unsigned int v13 = [v12 contents];

  v20.receiver = self;
  v20.super_class = (Class)UIAirDropGroupActivityCell;
  [(UIAirDropGroupActivityCell *)&v20 setSelected:v3];
  id v14 = [(UIAirDropGroupActivityCell *)self imageSlotView];
  id v15 = [v14 layer];
  [v15 setContents:v7];

  id v16 = [(UIAirDropGroupActivityCell *)self titleSlotView];
  uint64_t v17 = [v16 layer];
  [v17 setContents:v10];

  int v18 = [(UIAirDropGroupActivityCell *)self transportSlotView];
  BOOL v19 = [v18 layer];
  [v19 setContents:v13];
}

- (void)setTransportIconHidden:(BOOL)a3 animated:(BOOL)a4 useDelay:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v8 = !a3;
  if ([(UIAirDropGroupActivityCell *)self transportSlotID]) {
    [(UIAirDropGroupActivityCell *)self transportSlotView];
  }
  else {
  unsigned int v9 = [(UIAirDropGroupActivityCell *)self transportImageView];
  }
  uint64_t v10 = v9;
  if (v6)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
    if (v5)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke;
      v20[3] = &unk_1E5A219C0;
      id v21 = v9;
      BOOL v22 = v8;
      [v11 animateWithDuration:196608 delay:v20 options:0 animations:0.200000003 completion:0.6];
      CGRect v12 = v21;
    }
    else
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke_2;
      v17[3] = &unk_1E5A219C0;
      id v18 = v9;
      BOOL v19 = v8;
      [v11 animateWithDuration:v17 animations:0.200000003];
      CGRect v12 = v18;
    }
  }
  else
  {
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v15.c = v13;
    *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformScale(&v16, &v15, (double)v8, (double)v8);
    CGAffineTransform v14 = v16;
    [v10 setTransform:&v14];
  }
}

uint64_t __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke(uint64_t a1)
{
  CGFloat v2 = (double)*(uint64_t *)(a1 + 40);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  uint64_t v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  return [v4 setTransform:&v6];
}

uint64_t __71__UIAirDropGroupActivityCell_setTransportIconHidden_animated_useDelay___block_invoke_2(uint64_t a1)
{
  CGFloat v2 = (double)*(uint64_t *)(a1 + 40);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v7.c = v3;
  *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformScale(&v8, &v7, v2, v2);
  uint64_t v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  return [v4 setTransform:&v6];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIAirDropNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (unsigned)textSlotID
{
  return self->_textSlotID;
}

- (unsigned)subtitleSlotID
{
  return self->_subtitleSlotID;
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIImage)image
{
  return self->_image;
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (UIImage)transportImage
{
  return self->_transportImage;
}

- (unsigned)transportSlotID
{
  return self->_transportSlotID;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_stateBeingRestored = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isSquareImage
{
  return self->_squareImage;
}

- (BOOL)isLongPressable
{
  return self->_longPressable;
}

- (void)setLongPressable:(BOOL)a3
{
  self->_longPressable = a3;
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (BOOL)didInstallSubviews
{
  return self->_didInstallSubviews;
}

- (void)setDidInstallSubviews:(BOOL)a3
{
  self->_didInstallSubviews = a3;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutSpec);
  return (SHSheetContentLayoutSpec *)WeakRetained;
}

- (void)setLayoutSpec:(id)a3
{
}

- (UIVisualEffectView)vibrantTitleView
{
  return self->_vibrantTitleView;
}

- (void)setVibrantTitleView:(id)a3
{
}

- (UIVisualEffectView)vibrantSubtitleView
{
  return self->_vibrantSubtitleView;
}

- (void)setVibrantSubtitleView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void)setImageSlotView:(id)a3
{
}

- (UIImageView)transportImageView
{
  return self->_transportImageView;
}

- (void)setTransportImageView:(id)a3
{
}

- (UIView)transportSlotView
{
  return self->_transportSlotView;
}

- (void)setTransportSlotView:(id)a3
{
}

- (UIView)placeholderTitleView
{
  return self->_placeholderTitleView;
}

- (void)setPlaceholderTitleView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIView)textSlotView
{
  return self->_textSlotView;
}

- (void)setTextSlotView:(id)a3
{
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
}

- (UIView)subtitleSlotView
{
  return self->_subtitleSlotView;
}

- (void)setSubtitleSlotView:(id)a3
{
}

- (NSArray)subtitleLabelVisibleConstraintsArray
{
  return self->_subtitleLabelVisibleConstraintsArray;
}

- (void)setSubtitleLabelVisibleConstraintsArray:(id)a3
{
}

- (_UIAirDropProgressView)circleProgressView
{
  return self->_circleProgressView;
}

- (void)setCircleProgressView:(id)a3
{
}

- (NSMutableArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
}

- (double)circleWidth
{
  return self->_circleWidth;
}

- (double)transportIconWidth
{
  return self->_transportIconWidth;
}

- (NSString)formattedDisplayName
{
  return self->_formattedDisplayName;
}

- (void)setFormattedDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedDisplayName, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_subtitleLabelVisibleConstraintsArray, 0);
  objc_storeStrong((id *)&self->_subtitleSlotView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_textSlotView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_placeholderTitleView, 0);
  objc_storeStrong((id *)&self->_transportSlotView, 0);
  objc_storeStrong((id *)&self->_transportImageView, 0);
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrantSubtitleView, 0);
  objc_storeStrong((id *)&self->_vibrantTitleView, 0);
  objc_destroyWeak((id *)&self->_layoutSpec);
  objc_storeStrong((id *)&self->_transportImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
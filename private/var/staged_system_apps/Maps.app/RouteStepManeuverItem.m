@interface RouteStepManeuverItem
- (BOOL)isMissedStep;
- (GEOComposedRouteStep)step;
- (GuidanceManeuverArtwork)maneuverArtwork;
- (MNGuidanceSignInfo)guidanceSignInfo;
- (NSAttributedString)primaryText;
- (NSAttributedString)secondaryText;
- (NSAttributedString)tertiaryText;
- (RouteStepManeuverItem)initWithRouteStep:(id)a3 cellClass:(Class)a4 state:(unint64_t)a5 metrics:(id)a6 context:(int64_t)a7 route:(id)a8 scale:(double)a9 isMissedStep:(BOOL)a10;
- (UIColor)backgroundColor;
- (UIImage)exitSignImage;
- (UIImage)shieldImage;
- (id)_combinedTertiaryTextForStepWithChargingStation:(id)a3 font:(id)a4 color:(id)a5;
- (id)_evaluatedStringForInstructionString:(id)a3;
- (id)_instructionVariables;
- (id)_listInstructionForStep:(id)a3;
- (id)_listInstructionStringForStep:(id)a3;
- (id)_signInstructionForStep:(id)a3;
- (id)_signInstructionStringForStep:(id)a3;
- (id)description;
- (id)distanceToManeuver;
- (id)laneGuidanceInfo;
- (void)_computeContent;
- (void)reset;
- (void)setStep:(id)a3;
@end

@implementation RouteStepManeuverItem

- (RouteStepManeuverItem)initWithRouteStep:(id)a3 cellClass:(Class)a4 state:(unint64_t)a5 metrics:(id)a6 context:(int64_t)a7 route:(id)a8 scale:(double)a9 isMissedStep:(BOOL)a10
{
  id v18 = a3;
  id v19 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RouteStepManeuverItem;
  v20 = [(RouteStepItem *)&v23 initWithCellClass:a4 state:a5 metrics:v19 context:a7 route:a8 scale:a9];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_step, a3);
    v21->_isMissedStep = a10;
    [v19 imageAreaWidth];
    -[RouteStepItem setHairlineLeadingInset:](v21, "setHairlineLeadingInset:");
    [v19 textTrailingMargin];
    -[RouteStepItem setHairlineTrailingInset:](v21, "setHairlineTrailingInset:");
  }

  return v21;
}

- (void)reset
{
  self->_computedContent = 0;
}

- (NSAttributedString)primaryText
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  primaryText = self->_primaryText;

  return primaryText;
}

- (NSAttributedString)secondaryText
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  secondaryText = self->_secondaryText;

  return secondaryText;
}

- (NSAttributedString)tertiaryText
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  tertiaryText = self->_tertiaryText;

  return tertiaryText;
}

- (UIImage)shieldImage
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  shieldImage = self->_shieldImage;

  return shieldImage;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  maneuverArtwork = self->_maneuverArtwork;

  return maneuverArtwork;
}

- (UIColor)backgroundColor
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  backgroundColor = self->_backgroundColor;

  return backgroundColor;
}

- (UIImage)exitSignImage
{
  if (!self->_computedContent) {
    [(RouteStepManeuverItem *)self _computeContent];
  }
  exitSignImage = self->_exitSignImage;

  return exitSignImage;
}

- (MNGuidanceSignInfo)guidanceSignInfo
{
  v3 = [(RouteStepItem *)self userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(RouteStepItem *)self userInfo];
  }
  else
  {
    v4 = 0;
  }

  return (MNGuidanceSignInfo *)v4;
}

- (id)laneGuidanceInfo
{
  v3 = [(RouteStepItem *)self userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(RouteStepItem *)self userInfo];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)distanceToManeuver
{
  v3 = [(RouteStepItem *)self userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(RouteStepItem *)self userInfo];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_computeContent
{
  v2 = self;
  self->_computedContent = 1;
  primaryText = self->_primaryText;
  p_primaryText = (id *)&self->_primaryText;
  self->_primaryText = 0;

  secondaryText = v2->_secondaryText;
  p_secondaryText = (id *)&v2->_secondaryText;
  v2->_secondaryText = 0;

  v282 = v2;
  v5 = [(RouteStepManeuverItem *)v2 step];
  v270 = [v5 geoStep];
  v264 = [v270 roadDescriptions];
  v265 = [v5 chargingStationInfo];
  v6 = v2;
  LODWORD(v2) = [(RouteStepItem *)v2 state] == 0;
  v7 = [(RouteStepItem *)v6 metrics];
  v8 = v7;
  if (v2) {
    [v7 primaryTextDisabledTextColor];
  }
  else {
  id v273 = [v7 primaryTextActiveTextColor];
  }

  v9 = [(RouteStepItem *)v282 metrics];
  unsigned int v10 = [v9 primaryTextFontIsFixedSize];

  v11 = [(RouteStepItem *)v282 metrics];
  v12 = v11;
  if (v10)
  {
    [v11 primaryTextFontSize];
    double v14 = v13;
    v15 = [(RouteStepItem *)v282 metrics];
    [v15 primaryTextFontWeight];
    v272 = +[UIFont systemFontOfSize:v14 weight:v16];
  }
  else
  {
    v15 = [v11 primaryTextFontStyle];
    v17 = [(RouteStepItem *)v282 metrics];
    [v17 primaryTextFontWeight];
    double v19 = v18;
    v20 = [(RouteStepItem *)v282 traitCollection];
    v272 = +[UIFont _maps_fontWithTextStyle:v15 weight:v20 compatibleWithTraitCollection:v19];
  }
  BOOL v21 = [(RouteStepItem *)v282 state] == 0;
  v22 = [(RouteStepItem *)v282 metrics];
  objc_super v23 = v22;
  if (v21) {
    [v22 secondaryTextDisabledTextColor];
  }
  else {
  id v268 = [v22 secondaryTextActiveTextColor];
  }

  v24 = [(RouteStepItem *)v282 metrics];
  unsigned int v25 = [v24 secondaryTextFontIsFixedSize];

  v26 = [(RouteStepItem *)v282 metrics];
  v27 = v26;
  if (v25)
  {
    [v26 secondaryTextFontSize];
    double v29 = v28;
    v30 = [(RouteStepItem *)v282 metrics];
    [v30 secondaryTextFontWeight];
    v267 = +[UIFont systemFontOfSize:v29 weight:v31];
  }
  else
  {
    v30 = [v26 secondaryTextFontStyle];
    v32 = [(RouteStepItem *)v282 metrics];
    [v32 secondaryTextFontWeight];
    double v34 = v33;
    v35 = [(RouteStepItem *)v282 traitCollection];
    v267 = +[UIFont _maps_fontWithTextStyle:v30 weight:v35 compatibleWithTraitCollection:v34];
  }
  v279 = [(RouteStepManeuverItem *)v282 guidanceSignInfo];
  v277 = [(RouteStepManeuverItem *)v282 laneGuidanceInfo];
  v263 = [(RouteStepManeuverItem *)v282 distanceToManeuver];
  if ([v5 isStartOrResumeStep])
  {
    unsigned int v36 = 1;
  }
  else
  {
    v37 = [v279 primarySign];
    unsigned int v36 = [v37 isStaticText];
  }
  v301[0] = _NSConcreteStackBlock;
  v301[1] = 3221225472;
  v301[2] = sub_1009D7104;
  v301[3] = &unk_1013136C8;
  id v276 = v5;
  id v302 = v276;
  v303 = v282;
  char v304 = v36;
  v266 = objc_retainBlock(v301);
  if (v277)
  {
    v38 = [v277 primaryStrings];
    BOOL v39 = [v38 count] == 0;

    if (v39)
    {
      id v52 = objc_alloc((Class)MKServerFormattedStringParameters);
      id v53 = [v277 distanceDetailLevel];
      v54 = [v277 variableOverrides];
      id v41 = [v52 initWithInstructionsDistanceDetailLevel:v53 variableOverrides:v54];

      v55 = [v277 titles];
      v42 = [v55 firstObject];

      id v43 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v42 parameters:v41];
    }
    else
    {
      id v40 = objc_alloc((Class)MKServerFormattedString);
      id v41 = [v277 primaryStrings];
      v42 = [v41 firstObject];
      id v43 = [v40 initWithComposedString:v42];
    }
    v56 = v43;

    v320[0] = NSForegroundColorAttributeName;
    v320[1] = NSFontAttributeName;
    v321[0] = v273;
    v321[1] = v272;
    v320[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v321[2] = &off_1013A9F58;
    v57 = +[NSDictionary dictionaryWithObjects:v321 forKeys:v320 count:3];
    v58 = [v56 multiPartAttributedStringWithAttributes:v57];
    uint64_t v59 = [v58 attributedString];
    id v60 = *p_primaryText;
    id *p_primaryText = (id)v59;

    if ([*p_primaryText length])
    {
      v269 = 0;
    }
    else
    {
      v269 = ((void (*)(void *, void))v266[2])(v266, 0);
    }
  }
  else if (v279)
  {
    v44 = [v279 primarySign];
    v45 = v44;
    if (v36)
    {
      v46 = [v44 secondaryStrings];
      BOOL v47 = [v46 count] == 0;

      if (v47)
      {
        id v86 = objc_alloc((Class)MKServerFormattedStringParameters);
        id v87 = [v45 distanceDetailLevel];
        v88 = [v45 variableOverrides];
        id v49 = [v86 initWithInstructionsDistanceDetailLevel:v87 variableOverrides:v88];

        v89 = [v45 details];
        v50 = [v89 firstObject];

        id v51 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v50 parameters:v49];
      }
      else
      {
        id v48 = objc_alloc((Class)MKServerFormattedString);
        id v49 = [v45 secondaryStrings];
        v50 = [v49 firstObject];
        id v51 = [v48 initWithComposedString:v50];
      }
      v90 = v51;

      v318[0] = NSForegroundColorAttributeName;
      v318[1] = NSFontAttributeName;
      v319[0] = v273;
      v319[1] = v272;
      v318[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v319[2] = &off_1013A9F58;
      v91 = +[NSDictionary dictionaryWithObjects:v319 forKeys:v318 count:3];
      v92 = [v90 multiPartAttributedStringWithAttributes:v91];
      uint64_t v93 = [v92 attributedString];
      id v94 = *p_primaryText;
      id *p_primaryText = (id)v93;

      if ([*p_primaryText length])
      {
        v269 = 0;
        goto LABEL_80;
      }
    }
    else
    {
      v79 = [v44 primaryStrings];
      BOOL v80 = [v79 count] == 0;

      if (v80)
      {
        id v95 = objc_alloc((Class)MKServerFormattedStringParameters);
        id v96 = [v45 distanceDetailLevel];
        v97 = [v45 variableOverrides];
        id v82 = [v95 initWithInstructionsDistanceDetailLevel:v96 variableOverrides:v97];

        v98 = [v45 titles];
        v83 = [v98 firstObject];

        id v84 = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v83 parameters:v82];
      }
      else
      {
        id v81 = objc_alloc((Class)MKServerFormattedString);
        id v82 = [v45 primaryStrings];
        v83 = [v82 firstObject];
        id v84 = [v81 initWithComposedString:v83];
      }
      v99 = v84;

      v316[0] = NSForegroundColorAttributeName;
      v316[1] = NSFontAttributeName;
      v317[0] = v273;
      v317[1] = v272;
      v316[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v317[2] = &off_1013A9F58;
      v100 = +[NSDictionary dictionaryWithObjects:v317 forKeys:v316 count:3];
      v101 = [v99 multiPartAttributedStringWithAttributes:v100];
      uint64_t v102 = [v101 attributedString];
      id v103 = *p_primaryText;
      id *p_primaryText = (id)v102;

      if ([*p_primaryText length])
      {
        v269 = 0;
        v77 = v279;
        goto LABEL_55;
      }
    }
    v269 = ((void (*)(void *, void))v266[2])(v266, 0);
  }
  else
  {
    v269 = ((void (*)(void))v266[2])();
  }
  if (v269)
  {
    id v61 = objc_alloc((Class)NSAttributedString);
    v314[0] = NSFontAttributeName;
    v62 = [(RouteStepItem *)v282 metrics];
    unsigned int v63 = [v62 shouldFlipPrimaryAndSecondaryText];
    v64 = v272;
    if (v63) {
      v64 = v267;
    }
    v315[0] = v64;
    v314[1] = NSForegroundColorAttributeName;
    v65 = [(RouteStepItem *)v282 metrics];
    unsigned int v66 = [v65 shouldFlipPrimaryAndSecondaryText];
    id v67 = v273;
    if (v66) {
      id v67 = v268;
    }
    v315[1] = v67;
    v68 = +[NSDictionary dictionaryWithObjects:v315 forKeys:v314 count:2];
    id v69 = [v61 initWithString:v269 attributes:v68];

    v70 = [(RouteStepItem *)v282 metrics];
    unsigned int v71 = [v70 shouldFlipPrimaryAndSecondaryText];

    if (v71) {
      v72 = p_secondaryText;
    }
    else {
      v72 = p_primaryText;
    }
    objc_storeStrong(v72, v69);
  }
  if ((v36 & 1) == 0)
  {
    if (v277)
    {
      v73 = [v277 secondaryStrings];
      BOOL v74 = [v73 count] == 0;

      if (!v74)
      {
        v75 = [v277 secondaryStrings];
        uint64_t v76 = [v75 firstObject];

LABEL_57:
        v283 = 0;
        uint64_t v78 = 0;
        goto LABEL_61;
      }
      v85 = [v277 instructions];
      uint64_t v78 = [v85 firstObject];

      v283 = [v277 variableOverrides];
      goto LABEL_60;
    }
    v77 = v279;
    if (!v279)
    {
      if ((id)[(RouteStepItem *)v282 context] == (id)1)
      {
        uint64_t v76 = [(RouteStepManeuverItem *)v282 _signInstructionStringForStep:v276];
        if (!v76)
        {
          uint64_t v78 = [(RouteStepManeuverItem *)v282 _signInstructionForStep:v276];
          v283 = [(RouteStepManeuverItem *)v282 _instructionVariables];
          goto LABEL_60;
        }
LABEL_69:
        v283 = 0;
        goto LABEL_70;
      }
      BOOL v114 = (id)[(RouteStepItem *)v282 context] == (id)2;
      uint64_t v115 = [(RouteStepManeuverItem *)v282 _listInstructionStringForStep:v276];
      uint64_t v76 = v115;
      if (v114)
      {
        if (v115) {
          goto LABEL_69;
        }
      }
      else if (v115)
      {
        goto LABEL_69;
      }
      uint64_t v78 = [(RouteStepManeuverItem *)v282 _listInstructionForStep:v276];
      v283 = [(RouteStepManeuverItem *)v282 _instructionVariables];
      goto LABEL_60;
    }
LABEL_55:
    v104 = [v77 primarySign];
    v105 = [v104 secondaryStrings];
    BOOL v106 = [v105 count] == 0;

    v107 = [v279 primarySign];
    v108 = v107;
    if (!v106)
    {
      v109 = [v107 secondaryStrings];
      uint64_t v76 = [v109 firstObject];

      goto LABEL_57;
    }
    v110 = [v107 details];
    uint64_t v78 = [v110 firstObject];

    v111 = [v279 primarySign];
    v283 = [v111 variableOverrides];

LABEL_60:
    uint64_t v76 = 0;
LABEL_61:
    if (!(v78 | v76))
    {
      uint64_t v78 = 0;
LABEL_79:

      goto LABEL_80;
    }
    if (v78)
    {
      id v112 = objc_alloc((Class)MKServerFormattedStringParameters);
      MKFormattedStringOptionsMakeDefault();
      id v113 = [v112 initWithOptions:v300 variableOverrides:v283];
      id obj = [objc_alloc((Class)MKServerFormattedString) initWithGeoServerString:v78 parameters:v113];

LABEL_71:
      v312[0] = NSFontAttributeName;
      v116 = [(RouteStepItem *)v282 metrics];
      unsigned int v117 = [v116 shouldFlipPrimaryAndSecondaryText];
      v118 = v272;
      if (!v117) {
        v118 = v267;
      }
      v313[0] = v118;
      v312[1] = NSForegroundColorAttributeName;
      v119 = [(RouteStepItem *)v282 metrics];
      unsigned int v120 = [v119 shouldFlipPrimaryAndSecondaryText];
      id v121 = v273;
      if (!v120) {
        id v121 = v268;
      }
      v313[1] = v121;
      v312[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v122 = [(RouteStepItem *)v282 metrics];
      v123 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v122 shieldArtworkSize]);
      v313[2] = v123;
      v124 = +[NSDictionary dictionaryWithObjects:v313 forKeys:v312 count:3];
      v125 = [obj multiPartAttributedStringWithAttributes:v124];
      v126 = [v125 attributedString];

      v127 = [(RouteStepItem *)v282 metrics];
      LODWORD(v124) = [v127 shouldFlipPrimaryAndSecondaryText];

      if (v124) {
        v128 = p_primaryText;
      }
      else {
        v128 = p_secondaryText;
      }
      objc_storeStrong(v128, v126);

      goto LABEL_79;
    }
LABEL_70:
    id obj = [objc_alloc((Class)MKServerFormattedString) initWithComposedString:v76];
    uint64_t v78 = 0;
    goto LABEL_71;
  }
LABEL_80:
  tertiaryText = v282->_tertiaryText;
  location = (id *)&v282->_tertiaryText;
  v282->_tertiaryText = 0;

  v130 = [(RouteStepItem *)v282 metrics];
  unsigned int v131 = [v130 tertiaryTextFontIsFixedSize];

  v132 = [(RouteStepItem *)v282 metrics];
  v133 = v132;
  if (v131)
  {
    [v132 tertiaryTextFontSize];
    double v135 = v134;
    v136 = [(RouteStepItem *)v282 metrics];
    [v136 tertiaryTextFontWeight];
    v271 = +[UIFont systemFontOfSize:v135 weight:v137];
  }
  else
  {
    v136 = [v132 tertiaryTextFontStyle];
    v138 = [(RouteStepItem *)v282 metrics];
    [v138 tertiaryTextFontWeight];
    double v140 = v139;
    v141 = [(RouteStepItem *)v282 traitCollection];
    v271 = +[UIFont _maps_fontWithTextStyle:v136 weight:v141 compatibleWithTraitCollection:v140];
  }
  BOOL v142 = [(RouteStepItem *)v282 state] == 0;
  v143 = [(RouteStepItem *)v282 metrics];
  id v144 = v143;
  if (v142) {
    [v143 tertiaryTextDisabledTextColor];
  }
  else {
  id v284 = [v143 tertiaryTextActiveTextColor];
  }

  if (v282->_isMissedStep)
  {
    id v145 = objc_alloc_init((Class)NSTextAttachment);
    v146 = [(RouteStepItem *)v282 traitCollection];
    v147 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" compatibleWithTraitCollection:v146];
    v148 = +[UIColor systemYellowColor];
    v149 = [v147 imageWithTintColor:v148];

    [v271 capHeight];
    double v151 = v150;
    [v149 size];
    double v153 = v152;
    [v149 size];
    double v155 = v154;
    [v149 size];
    [v145 setBounds:0.0, (v151 - v153) * 0.5, v155, v156];
    [v145 setImage:v149];
    v157 = +[NSAttributedString attributedStringWithAttachment:v145];
    id v158 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v157];
    id v159 = objc_alloc((Class)NSAttributedString);
    v160 = +[NSBundle mainBundle];
    v161 = [v160 localizedStringForKey:@"[Directions] unbreakable space" value:@"localized string not found" table:0];
    id v162 = [v159 initWithString:v161];

    [v158 appendAttributedString:v162];
    v163 = +[NSBundle mainBundle];
    id v144 = [v163 localizedStringForKey:@"[Directions] missed step description" value:@"localized string not found" table:0];

    id v164 = objc_alloc((Class)NSAttributedString);
    v310[0] = NSFontAttributeName;
    v310[1] = NSForegroundColorAttributeName;
    v311[0] = v271;
    v311[1] = v284;
    v165 = +[NSDictionary dictionaryWithObjects:v311 forKeys:v310 count:2];
    id v166 = [v164 initWithString:v144 attributes:v165];

    [v158 appendAttributedString:v166];
    id v167 = [v158 copy];
    id v168 = *location;
    id *location = v167;
  }
  else if (v265)
  {
    uint64_t v169 = [(RouteStepManeuverItem *)v282 _combinedTertiaryTextForStepWithChargingStation:v276 font:v271 color:v284];
    id v145 = *location;
    id *location = (id)v169;
  }
  else
  {
    if (![v264 count]) {
      goto LABEL_106;
    }
    if (qword_1016103B8 != -1) {
      dispatch_once(&qword_1016103B8, &stru_1013136E8);
    }
    id v145 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_101324E70 attributes:0];
    long long v298 = 0u;
    long long v299 = 0u;
    long long v296 = 0u;
    long long v297 = 0u;
    id obja = v264;
    id v170 = [obja countByEnumeratingWithState:&v296 objects:v309 count:16];
    if (v170)
    {
      uint64_t v171 = *(void *)v297;
      do
      {
        for (i = 0; i != v170; i = (char *)i + 1)
        {
          if (*(void *)v297 != v171) {
            objc_enumerationMutation(obja);
          }
          v173 = *(void **)(*((void *)&v296 + 1) + 8 * i);
          if ([v145 length]) {
            [v145 appendAttributedString:qword_1016103C0];
          }
          id v174 = objc_alloc((Class)MKServerFormattedString);
          id v175 = objc_alloc((Class)GEOComposedString);
          v176 = [v173 formattedDescription];
          id v177 = [v175 initWithGeoFormattedString:v176];
          id v178 = [v174 initWithComposedString:v177];

          NSAttributedStringKey v307 = NSForegroundColorAttributeName;
          uint64_t v179 = [v173 accentColor];
          v180 = (void *)v179;
          uint64_t v181 = (uint64_t)v284;
          if (v179) {
            uint64_t v181 = v179;
          }
          uint64_t v308 = v181;
          v182 = +[NSDictionary dictionaryWithObjects:&v308 forKeys:&v307 count:1];
          v183 = [v178 multiPartAttributedStringWithAttributes:v182];
          v184 = [v183 attributedString];
          [v145 appendAttributedString:v184];
        }
        id v170 = [obja countByEnumeratingWithState:&v296 objects:v309 count:16];
      }
      while (v170);
    }

    NSAttributedStringKey v305 = NSFontAttributeName;
    v306 = v271;
    id v144 = +[NSDictionary dictionaryWithObjects:&v306 forKeys:&v305 count:1];
    [v145 addAttributes:v144 range:NSMakeRange(0, [v145 length])];

    objc_storeStrong(location, v145);
  }

LABEL_106:
  shieldImage = v282->_shieldImage;
  v282->_shieldImage = 0;

  if ([v276 isEVChargerStep])
  {
    id v144 = +[GEOFeatureStyleAttributes evChargerStyleAttributes];
    v186 = [(RouteStepItem *)v282 metrics];
    id v187 = [v186 iconSize];
    [(RouteStepItem *)v282 scale];
    uint64_t v188 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v144, v187, 0);
    v189 = v282->_shieldImage;
    v282->_shieldImage = (UIImage *)v188;
  }
  else if ((id)[(RouteStepItem *)v282 context] != (id)1 {
         && ([v270 maneuverType] == 12
  }
          || [v270 maneuverIsHighwayExit]))
  {
    uint64_t v292 = 0;
    v293 = &v292;
    uint64_t v294 = 0x2020000000;
    int v295 = 0;
    uint64_t v286 = 0;
    v287 = &v286;
    uint64_t v288 = 0x3032000000;
    v289 = sub_100104204;
    v290 = sub_100104980;
    id v291 = 0;
    v285[0] = _NSConcreteStackBlock;
    v285[1] = 3221225472;
    v285[2] = sub_1009D72C4;
    v285[3] = &unk_1012EA528;
    v285[4] = &v292;
    v285[5] = &v286;
    [v270 shieldInfo:v285];
    if (*((_DWORD *)v293 + 6))
    {
      v190 = objc_opt_new();
      [v190 setText:v287[5]];
      v191 = +[VKIconManager sharedManager];
      uint64_t v192 = *((unsigned int *)v293 + 6);
      uint64_t v193 = v287[5];
      [(RouteStepItem *)v282 scale];
      double v195 = v194;
      v196 = [(RouteStepItem *)v282 metrics];
      id v197 = [v196 shieldArtworkSize];
      *(float *)&double v198 = v195;
      id v144 = [v191 imageForDataID:v192 text:v193 contentScale:v197 sizeGroup:v190 modifiers:v198];

      id v199 = [v144 image];
      [v144 contentScale];
      uint64_t v201 = +[UIImage imageWithCGImage:v199 scale:0 orientation:v200];
      v202 = v282->_shieldImage;
      v282->_shieldImage = (UIImage *)v201;
    }
    _Block_object_dispose(&v286, 8);

    _Block_object_dispose(&v292, 8);
  }
  maneuverArtwork = v282->_maneuverArtwork;
  v282->_maneuverArtwork = 0;

  if (v279)
  {
    v204 = [v279 primarySign];
    v205 = [v204 junction];
    id v144 = [v205 drivingSide];
    if ([v205 numElements]) {
      id v206 = [objc_alloc((Class)MKJunction) initWithJunction:v205];
    }
    else {
      id v206 = 0;
    }
    v207 = [GuidanceManeuverArtwork alloc];
    id v208 = [v205 maneuverType];
    v209 = [v204 artworkOverride];
    v210 = [(GuidanceManeuverArtwork *)v207 initWithManeuver:v208 junction:v206 drivingSide:v144 artworkDataSource:v209];
    v211 = v282->_maneuverArtwork;
    v282->_maneuverArtwork = v210;
  }
  v212 = v282;
  if (!v282->_shieldImage && !v282->_maneuverArtwork)
  {
    v213 = [v276 junction];
    if (v213)
    {
      id v214 = objc_alloc((Class)MKJunction);
      v215 = [v276 junction];
      id v144 = [v214 initWithJunction:v215];
    }
    else
    {
      id v144 = 0;
    }

    id v216 = [v276 drivingSide];
    v217 = [GuidanceManeuverArtwork alloc];
    id v218 = [v276 maneuverType];
    v219 = [v276 artworkOverride];
    v220 = [(GuidanceManeuverArtwork *)v217 initWithManeuver:v218 junction:v144 drivingSide:v216 artworkDataSource:v219];
    v221 = v282->_maneuverArtwork;
    v282->_maneuverArtwork = v220;

    v212 = v282;
  }
  if (v212->_isMissedStep)
  {
    id v144 = +[UIColor systemYellowColor];
    uint64_t v222 = [v144 colorWithAlphaComponent:0.150000006];
    backgroundColor = v282->_backgroundColor;
    v282->_backgroundColor = (UIColor *)v222;
LABEL_131:

    goto LABEL_132;
  }
  id v224 = [(RouteStepItem *)v212 state];
  if (v224 == (id)2)
  {
    id v144 = [(RouteStepItem *)v282 metrics];
    backgroundColor = [v144 highlightColor];
  }
  else
  {
    backgroundColor = 0;
  }
  objc_storeStrong((id *)&v282->_backgroundColor, backgroundColor);
  if (v224 == (id)2) {
    goto LABEL_131;
  }
LABEL_132:
  exitSignImage = v282->_exitSignImage;
  v282->_exitSignImage = 0;

  if (v279)
  {
    v226 = [v279 primarySign];
    id v227 = [v226 shieldID];
    v228 = [v226 shieldStringID];
    v229 = [v226 shieldText];
    if (!v227 && !v228) {
      goto LABEL_147;
    }
    [(RouteStepItem *)v282 scale];
    double v231 = v230;
    v232 = objc_opt_new();
    [v232 setText:v229];
    v233 = +[VKIconManager sharedManager];
    [(RouteStepItem *)v282 scale];
    double v235 = v234;
    v236 = [(RouteStepItem *)v282 metrics];
    id v237 = [v236 exitSignSize];
    *(float *)&double v238 = v235;
    if (v227)
    {
      v239 = [v233 imageForDataID:v227 text:v229 contentScale:v237 sizeGroup:v232 modifiers:v238];

      id v240 = v229;
    }
    else
    {
      v239 = [v233 imageForName:v228 contentScale:v237 sizeGroup:v232 modifiers:v238];

      v254 = +[NSBundle mainBundle];
      id v240 = [v254 localizedStringForKey:@"[Directions] Exit AX" value:@"localized string not found" table:0];
    }
    if (v239)
    {
      uint64_t v255 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v239 image], 0, v231);
      v256 = v282->_exitSignImage;
      v282->_exitSignImage = (UIImage *)v255;

      [(UIImage *)v282->_exitSignImage setAccessibilityLabel:v240];
    }

LABEL_146:
LABEL_147:

LABEL_148:
    goto LABEL_149;
  }
  v241 = [v276 representativeSignGuidanceEvent];
  v226 = [v241 signGuidance];

  if (v226)
  {
    v228 = [v226 shieldName];
    if (![v228 hasShield] || !objc_msgSend(v228, "hasShieldType")) {
      goto LABEL_148;
    }
    [(RouteStepItem *)v282 scale];
    double v243 = v242;
    v229 = [v228 shield];
    v232 = objc_opt_new();
    [v232 setText:v229];
    v244 = +[VKIconManager sharedManager];
    id v245 = [v228 shieldType];
    v246 = [v228 shield];
    [(RouteStepItem *)v282 scale];
    double v248 = v247;
    v249 = [(RouteStepItem *)v282 metrics];
    id v250 = [v249 exitSignSize];
    *(float *)&double v251 = v248;
    v239 = [v244 imageForDataID:v245 text:v246 contentScale:v250 sizeGroup:v232 modifiers:v251];

    if (v239)
    {
      uint64_t v252 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v239 image], 0, v243);
      v253 = v282->_exitSignImage;
      v282->_exitSignImage = (UIImage *)v252;

      [(UIImage *)v282->_exitSignImage setAccessibilityLabel:v229];
    }
    goto LABEL_146;
  }
LABEL_149:

  uint64_t v257 = [*p_primaryText _maps_attributedStringWithExcessiveHeightCharacterSupport:1.2];
  id v258 = *p_primaryText;
  id *p_primaryText = (id)v257;

  uint64_t v259 = [*p_secondaryText _maps_attributedStringWithExcessiveHeightCharacterSupport:1.2];
  id v260 = *p_secondaryText;
  id *p_secondaryText = (id)v259;

  uint64_t v261 = [*location _maps_attributedStringWithExcessiveHeightCharacterSupport:1.2];
  id v262 = *location;
  id *location = (id)v261;
}

- (id)_combinedTertiaryTextForStepWithChargingStation:(id)a3 font:(id)a4 color:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = [v7 chargingStationInfo];
  if (!v10)
  {
    v45 = sub_1005762E4();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v54 = "-[RouteStepManeuverItem _combinedTertiaryTextForStepWithChargingStation:font:color:]";
      __int16 v55 = 2080;
      v56 = "RouteStepManeuverItem.m";
      __int16 v57 = 1024;
      int v58 = 509;
      __int16 v59 = 2080;
      id v60 = "chargingStationInfo";
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v46 = sub_1005762E4();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        BOOL v47 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v54 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v50 = [v7 attributedChargeStringForWaypointType:1 font:v8 textColor:v9 includeDaysAgo:0];
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"Directions_Driving_EV_charge_to" value:@"localized string not found" table:0];
  [v10 batteryPercentageAfterCharging];
  id v48 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, (uint64_t)v13);

  double v14 = objc_opt_new();
  v15 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill"];
  [v8 pointSize];
  double v16 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 0);
  v17 = [v15 imageWithConfiguration:v16];

  double v18 = [v17 imageWithRenderingMode:2];
  double v19 = [v18 _flatImageWithColor:v9];
  v20 = [v19 imageWithRenderingMode:1];

  [v14 setImage:v20];
  [v8 capHeight];
  double v22 = v21;
  [v20 size];
  double v24 = (v22 - v23) * 0.5;
  [v20 size];
  double v26 = v25;
  [v20 size];
  [v14 setBounds:0.0, v24, v26, v27];
  id v49 = v7;
  double v28 = +[NSAttributedString attributedStringWithAttachment:v14];
  id v29 = [v28 mutableCopy];

  id v30 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v29 appendAttributedString:v30];

  id v31 = [objc_alloc((Class)NSAttributedString) initWithString:v48];
  [v29 appendAttributedString:v31];

  v32 = +[NSBundle mainBundle];
  double v33 = [v32 localizedStringForKey:@"[Directions] road descriptions separator" value:@"localized string not found" table:0];

  id v34 = [objc_alloc((Class)NSAttributedString) initWithString:v33];
  [v29 appendAttributedString:v34];

  [v10 chargingTime];
  unsigned int v36 = +[NSString _navigation_stringWithSeconds:v35 abbreviated:1];
  id v37 = [objc_alloc((Class)NSAttributedString) initWithString:v36];
  [v29 appendAttributedString:v37];

  v38 = [v29 string];
  id v39 = [v38 length];

  v51[0] = NSFontAttributeName;
  v51[1] = NSForegroundColorAttributeName;
  v52[0] = v8;
  v52[1] = v9;
  id v40 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
  [v29 addAttributes:v40 range:0];

  id v41 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v50];
  id v42 = [objc_alloc((Class)NSAttributedString) initWithString:@"\n"];
  [v41 appendAttributedString:v42];

  [v41 appendAttributedString:v29];
  id v43 = [v41 copy];

  return v43;
}

- (id)_listInstructionForStep:(id)a3
{
  v3 = [a3 geoStep];
  v4 = [v3 instructionsForListView];
  v5 = [v4 firstObject];

  return v5;
}

- (id)_listInstructionStringForStep:(id)a3
{
  v4 = [a3 instructionStringsForListView];
  v5 = [v4 firstObject];
  v6 = [(RouteStepManeuverItem *)self _evaluatedStringForInstructionString:v5];

  return v6;
}

- (id)_signInstructionForStep:(id)a3
{
  id v4 = a3;
  v5 = [v4 representativeSignGuidanceEvent];
  v6 = [v5 signGuidance];

  id v7 = [v6 signDetails];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = [v6 signDetails];
    unsigned int v10 = [v9 firstObject];
  }
  else
  {
    v11 = sub_10000AF10();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Missing sign guidance for step: %@", (uint8_t *)&v13, 0xCu);
    }

    unsigned int v10 = [(RouteStepManeuverItem *)self _listInstructionForStep:v4];
  }

  return v10;
}

- (id)_signInstructionStringForStep:(id)a3
{
  id v4 = a3;
  v5 = [v4 representativeSignGuidanceEvent];
  v6 = [v5 signGuidance];

  id v7 = [v6 signDetails];
  id v8 = [v7 count];

  if (v8)
  {
    id v9 = objc_alloc((Class)GEOComposedString);
    unsigned int v10 = [v6 signDetails];
    v11 = [v10 firstObject];
    id v12 = [v9 initWithGeoFormattedString:v11];

    int v13 = [(RouteStepManeuverItem *)self _evaluatedStringForInstructionString:v12];
  }
  else
  {
    id v14 = sub_10000AF10();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Missing sign guidance for step: %@", (uint8_t *)&v16, 0xCu);
    }

    int v13 = [(RouteStepManeuverItem *)self _listInstructionStringForStep:v4];
  }

  return v13;
}

- (id)_instructionVariables
{
  v3 = objc_opt_new();
  id v4 = [(RouteStepItem *)self route];
  v5 = [(RouteStepManeuverItem *)self step];
  id v6 = [v4 legIndexForStepIndex:[v5 stepIndex]];

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v7 = sub_10000AF10();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    id v8 = [(RouteStepManeuverItem *)self step];
    int v17 = 138412290;
    double v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get leg index for step: %@", (uint8_t *)&v17, 0xCu);
  }
  else
  {
    id v9 = [(RouteStepItem *)self route];
    unsigned int v10 = [v9 legs];
    id v7 = [v10 objectAtIndexedSubscript:v6];

    v11 = [v7 destination];
    id v12 = [v11 navDisplayAddress];
    [v3 setObject:v12 forKeyedSubscript:@"{Address}"];

    int v13 = [v7 destination];
    id v14 = [v13 navDisplayNameWithSpecialContacts:0];
    [v3 setObject:v14 forKeyedSubscript:@"{Name}"];

    id v8 = [(RouteStepManeuverItem *)self step];
    v15 = [v8 maneuverRoadOrExitName];
    [v3 setObject:v15 forKeyedSubscript:@"{Road}"];
  }
LABEL_6:

  return v3;
}

- (id)_evaluatedStringForInstructionString:(id)a3
{
  id v4 = a3;
  v5 = [(RouteStepItem *)self route];
  id v6 = [(RouteStepManeuverItem *)self step];
  id v7 = [v5 legIndexForStepIndex:[v6 stepIndex]];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = sub_10000AF10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [(RouteStepManeuverItem *)self step];
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get leg index for step: %@", buf, 0xCu);
    }
    id v10 = v4;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1009D7FEC;
    v13[3] = &unk_101313710;
    v13[4] = self;
    v13[5] = v7;
    v11 = [v4 optionsWithArgumentHandler:v13];
    id v10 = [v4 composedStringWithOptions:v11];
  }

  return v10;
}

- (id)description
{
  if (self->_computedContent)
  {
    uint64_t v3 = objc_opt_class();
    id v4 = [(RouteStepManeuverItem *)self primaryText];
    v5 = [v4 string];
    id v6 = [(RouteStepManeuverItem *)self secondaryText];
    id v7 = [v6 string];
    id v8 = [(RouteStepManeuverItem *)self tertiaryText];
    id v9 = [v8 string];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; primaryText = %@; secondaryText = %@; tertiaryText = %@>",
      v3,
      self,
      v5,
      v7,
    id v10 = v9);
  }
  else
  {
    v11 = [(RouteStepManeuverItem *)self step];
    id v4 = [v11 contentsForContext:[self context]];

    uint64_t v12 = objc_opt_class();
    v5 = [v4 stringForDistance:-1.0];
    id v6 = [v4 instruction];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; primaryText = %@; secondaryText = %@; tertiaryText = (unknown)>",
      v12,
      self,
      v5,
    id v10 = v6);
  }

  return v10;
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
}

- (BOOL)isMissedStep
{
  return self->_isMissedStep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_exitSignImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);

  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
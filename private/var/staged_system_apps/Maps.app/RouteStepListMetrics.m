@interface RouteStepListMetrics
+ (id)navSignMetrics;
+ (id)navigationMetrics;
+ (id)rapMetrics;
+ (id)routePlanningMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryArrowMetrics;
- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryJunctionArrowMetrics;
- (BOOL)primaryTextFontIsFixedSize;
- (BOOL)secondaryTextFontIsFixedSize;
- (BOOL)shouldFlipPrimaryAndSecondaryText;
- (BOOL)tertiaryTextFontIsFixedSize;
- (BOOL)useMarkerFallback;
- (NSString)primaryTextFontStyle;
- (NSString)secondaryTextFontStyle;
- (NSString)tertiaryTextFontStyle;
- (UIColor)arrowAccentColor;
- (UIColor)arrowColor;
- (UIColor)displayedAsSecondaryTextColor;
- (UIColor)hairlineColor;
- (UIColor)highlightColor;
- (UIColor)primaryTextActiveTextColor;
- (UIColor)primaryTextDisabledTextColor;
- (UIColor)secondaryTextActiveTextColor;
- (UIColor)secondaryTextDisabledTextColor;
- (UIColor)tertiaryTextActiveTextColor;
- (UIColor)tertiaryTextDisabledTextColor;
- (double)displayedAsSecondaryFontPointSize;
- (double)displayedAsSecondaryFontWeight;
- (double)exitSignPadding;
- (double)imageAreaWidth;
- (double)imageBottomMargin;
- (double)imageTopMargin;
- (double)primaryTextFontSize;
- (double)primaryTextFontWeight;
- (double)primaryTextTopMargin;
- (double)primaryTextTrailingMargin;
- (double)secondaryTextFontSize;
- (double)secondaryTextFontWeight;
- (double)secondaryTextTopMargin;
- (double)stepImageHeight;
- (double)stepImageWidth;
- (double)tertiaryTextFontSize;
- (double)tertiaryTextFontWeight;
- (double)tertiaryTextTopMargin;
- (double)textBottomMargin;
- (double)textTrailingMargin;
- (double)waypointImageHeight;
- (double)waypointImageWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)exitSignSize;
- (int64_t)shieldArtworkSize;
- (unint64_t)iconSize;
@end

@implementation RouteStepListMetrics

+ (id)routePlanningMetrics
{
  if (qword_101610C68 != -1) {
    dispatch_once(&qword_101610C68, &stru_10131C988);
  }
  v2 = (void *)qword_101610C60;

  return v2;
}

+ (id)navigationMetrics
{
  if (qword_101610C78 != -1) {
    dispatch_once(&qword_101610C78, &stru_10131C9A8);
  }
  v2 = (void *)qword_101610C70;

  return v2;
}

+ (id)navSignMetrics
{
  if (qword_101610C88 != -1) {
    dispatch_once(&qword_101610C88, &stru_10131C9C8);
  }
  v2 = (void *)qword_101610C80;

  return v2;
}

+ (id)rapMetrics
{
  if (qword_101610C98 != -1) {
    dispatch_once(&qword_101610C98, &stru_10131C9E8);
  }
  v2 = (void *)qword_101610C90;

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((void *)v4 + 2) = *(void *)&self->_primaryTextTopMargin;
  *((void *)v4 + 3) = *(void *)&self->_primaryTextTrailingMargin;
  objc_storeStrong((id *)v4 + 4, self->_primaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 5, self->_primaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 6, self->_primaryTextFontStyle);
  *((void *)v4 + 8) = *(void *)&self->_primaryTextFontWeight;
  *((void *)v4 + 9) = *(void *)&self->_secondaryTextTopMargin;
  objc_storeStrong((id *)v4 + 10, self->_secondaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 11, self->_secondaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 12, self->_secondaryTextFontStyle);
  *((void *)v4 + 14) = *(void *)&self->_secondaryTextFontWeight;
  *((void *)v4 + 15) = *(void *)&self->_tertiaryTextTopMargin;
  objc_storeStrong((id *)v4 + 16, self->_tertiaryTextActiveTextColor);
  objc_storeStrong((id *)v4 + 17, self->_tertiaryTextDisabledTextColor);
  objc_storeStrong((id *)v4 + 18, self->_tertiaryTextFontStyle);
  *((void *)v4 + 20) = *(void *)&self->_tertiaryTextFontWeight;
  objc_storeStrong((id *)v4 + 24, self->_highlightColor);
  *((void *)v4 + 25) = *(void *)&self->_textTrailingMargin;
  *((void *)v4 + 26) = *(void *)&self->_textBottomMargin;
  *((void *)v4 + 27) = *(void *)&self->_imageAreaWidth;
  *((void *)v4 + 28) = *(void *)&self->_imageTopMargin;
  *((void *)v4 + 29) = *(void *)&self->_imageBottomMargin;
  *((void *)v4 + 30) = *(void *)&self->_waypointImageWidth;
  *((void *)v4 + 31) = *(void *)&self->_waypointImageHeight;
  *((void *)v4 + 32) = *(void *)&self->_stepImageWidth;
  *((void *)v4 + 33) = *(void *)&self->_stepImageHeight;
  *((void *)v4 + 34) = self->_shieldArtworkSize;
  *((void *)v4 + 35) = self->_iconSize;
  memcpy(v4 + 328, &self->_arrowMetrics, 0x1F0uLL);
  memcpy(v4 + 824, &self->_junctionArrowMetrics, 0x1F0uLL);
  memcpy(v4 + 1320, &self->_secondaryArrowMetrics, 0x1F0uLL);
  memcpy(v4 + 1816, &self->_secondaryJunctionArrowMetrics, 0x1F0uLL);
  v4[11] = self->_useMarkerFallback;
  objc_storeStrong((id *)v4 + 40, self->_hairlineColor);
  v4[12] = self->_shouldFlipPrimaryAndSecondaryText;
  return v4;
}

- (double)primaryTextTopMargin
{
  return self->_primaryTextTopMargin;
}

- (double)primaryTextTrailingMargin
{
  return self->_primaryTextTrailingMargin;
}

- (UIColor)primaryTextActiveTextColor
{
  return self->_primaryTextActiveTextColor;
}

- (UIColor)primaryTextDisabledTextColor
{
  return self->_primaryTextDisabledTextColor;
}

- (BOOL)primaryTextFontIsFixedSize
{
  return self->_primaryTextFontIsFixedSize;
}

- (NSString)primaryTextFontStyle
{
  return self->_primaryTextFontStyle;
}

- (double)primaryTextFontSize
{
  return self->_primaryTextFontSize;
}

- (double)primaryTextFontWeight
{
  return self->_primaryTextFontWeight;
}

- (double)secondaryTextTopMargin
{
  return self->_secondaryTextTopMargin;
}

- (UIColor)secondaryTextActiveTextColor
{
  return self->_secondaryTextActiveTextColor;
}

- (UIColor)secondaryTextDisabledTextColor
{
  return self->_secondaryTextDisabledTextColor;
}

- (BOOL)secondaryTextFontIsFixedSize
{
  return self->_secondaryTextFontIsFixedSize;
}

- (NSString)secondaryTextFontStyle
{
  return self->_secondaryTextFontStyle;
}

- (double)secondaryTextFontSize
{
  return self->_secondaryTextFontSize;
}

- (double)secondaryTextFontWeight
{
  return self->_secondaryTextFontWeight;
}

- (double)tertiaryTextTopMargin
{
  return self->_tertiaryTextTopMargin;
}

- (UIColor)tertiaryTextActiveTextColor
{
  return self->_tertiaryTextActiveTextColor;
}

- (UIColor)tertiaryTextDisabledTextColor
{
  return self->_tertiaryTextDisabledTextColor;
}

- (BOOL)tertiaryTextFontIsFixedSize
{
  return self->_tertiaryTextFontIsFixedSize;
}

- (NSString)tertiaryTextFontStyle
{
  return self->_tertiaryTextFontStyle;
}

- (double)tertiaryTextFontSize
{
  return self->_tertiaryTextFontSize;
}

- (double)tertiaryTextFontWeight
{
  return self->_tertiaryTextFontWeight;
}

- (UIColor)displayedAsSecondaryTextColor
{
  return self->_displayedAsSecondaryTextColor;
}

- (double)displayedAsSecondaryFontPointSize
{
  return self->_displayedAsSecondaryFontPointSize;
}

- (double)displayedAsSecondaryFontWeight
{
  return self->_displayedAsSecondaryFontWeight;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (double)textTrailingMargin
{
  return self->_textTrailingMargin;
}

- (double)textBottomMargin
{
  return self->_textBottomMargin;
}

- (double)imageAreaWidth
{
  return self->_imageAreaWidth;
}

- (double)imageTopMargin
{
  return self->_imageTopMargin;
}

- (double)imageBottomMargin
{
  return self->_imageBottomMargin;
}

- (double)waypointImageWidth
{
  return self->_waypointImageWidth;
}

- (double)waypointImageHeight
{
  return self->_waypointImageHeight;
}

- (double)stepImageWidth
{
  return self->_stepImageWidth;
}

- (double)stepImageHeight
{
  return self->_stepImageHeight;
}

- (int64_t)shieldArtworkSize
{
  return self->_shieldArtworkSize;
}

- (unint64_t)iconSize
{
  return self->_iconSize;
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)arrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_arrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)junctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_junctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_secondaryArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- ($84D9B426F26CE1F36C5948DD9DEACC84)secondaryJunctionArrowMetrics
{
  return ($84D9B426F26CE1F36C5948DD9DEACC84 *)memcpy(retstr, &self->_secondaryJunctionArrowMetrics, sizeof($84D9B426F26CE1F36C5948DD9DEACC84));
}

- (UIColor)arrowColor
{
  return self->_arrowColor;
}

- (UIColor)arrowAccentColor
{
  return self->_arrowAccentColor;
}

- (BOOL)useMarkerFallback
{
  return self->_useMarkerFallback;
}

- (double)exitSignPadding
{
  return self->_exitSignPadding;
}

- (int64_t)exitSignSize
{
  return self->_exitSignSize;
}

- (UIColor)hairlineColor
{
  return self->_hairlineColor;
}

- (BOOL)shouldFlipPrimaryAndSecondaryText
{
  return self->_shouldFlipPrimaryAndSecondaryText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hairlineColor, 0);
  objc_storeStrong((id *)&self->_arrowAccentColor, 0);
  objc_storeStrong((id *)&self->_arrowColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_displayedAsSecondaryTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_tertiaryTextDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_tertiaryTextActiveTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_secondaryTextDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextActiveTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextFontStyle, 0);
  objc_storeStrong((id *)&self->_primaryTextDisabledTextColor, 0);

  objc_storeStrong((id *)&self->_primaryTextActiveTextColor, 0);
}

@end
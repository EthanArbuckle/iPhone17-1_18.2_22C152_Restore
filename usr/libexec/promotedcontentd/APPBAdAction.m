@interface APPBAdAction
+ (Class)allowedExternalDomainsType;
+ (Class)parametersType;
+ (Class)storyboardSizesType;
- (BOOL)adManagesPurchaseFlow;
- (BOOL)allowSelfDismissal;
- (BOOL)hasActionURL;
- (BOOL)hasActionWebArchiveURL;
- (BOOL)hasAdManagesPurchaseFlow;
- (BOOL)hasAdamIdentifier;
- (BOOL)hasAllowSelfDismissal;
- (BOOL)hasAppStoreViewTemplate;
- (BOOL)hasAutoDismissInterval;
- (BOOL)hasBackgroundColor;
- (BOOL)hasCancelButtonForPurchaseDialog;
- (BOOL)hasCancelLabelForExitDialog;
- (BOOL)hasConfirmedClickTimeInterval;
- (BOOL)hasContinueLabelForExitDialog;
- (BOOL)hasLetterboxStoryboardColor;
- (BOOL)hasLoadNewImpressionOnActionComplete;
- (BOOL)hasMessageForExitDialog;
- (BOOL)hasMessageForPurchaseDialog;
- (BOOL)hasOkButtonForPurchaseDialog;
- (BOOL)hasPrefersToOpenInstalledApp;
- (BOOL)hasScrolling;
- (BOOL)hasStoryboardPresentationOrientations;
- (BOOL)hasStoryboardSupportedOrientations;
- (BOOL)hasSuppressesPermissionToExitDialog;
- (BOOL)hasTitleForExitDialog;
- (BOOL)hasTitleForPurchaseDialog;
- (BOOL)hasTransitionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadNewImpressionOnActionComplete;
- (BOOL)prefersToOpenInstalledApp;
- (BOOL)readFrom:(id)a3;
- (BOOL)scrolling;
- (BOOL)suppressesPermissionToExitDialog;
- (NSMutableArray)allowedExternalDomains;
- (NSMutableArray)parameters;
- (NSMutableArray)storyboardSizes;
- (NSString)actionURL;
- (NSString)actionWebArchiveURL;
- (NSString)cancelButtonForPurchaseDialog;
- (NSString)cancelLabelForExitDialog;
- (NSString)continueLabelForExitDialog;
- (NSString)identifier;
- (NSString)messageForExitDialog;
- (NSString)messageForPurchaseDialog;
- (NSString)okButtonForPurchaseDialog;
- (NSString)titleForExitDialog;
- (NSString)titleForPurchaseDialog;
- (double)autoDismissInterval;
- (float)confirmedClickTimeInterval;
- (id)actionAsString:(int)a3;
- (id)allowedExternalDomainsAtIndex:(unint64_t)a3;
- (id)appStoreViewTemplateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parametersAtIndex:(unint64_t)a3;
- (id)storyboardPresentationOrientationsAsString:(int)a3;
- (id)storyboardSizesAtIndex:(unint64_t)a3;
- (id)storyboardSupportedOrientationsAsString:(int)a3;
- (id)transitionTypeAsString:(int)a3;
- (int)StringAsAction:(id)a3;
- (int)StringAsAppStoreViewTemplate:(id)a3;
- (int)StringAsStoryboardPresentationOrientations:(id)a3;
- (int)StringAsStoryboardSupportedOrientations:(id)a3;
- (int)StringAsTransitionType:(id)a3;
- (int)action;
- (int)appStoreViewTemplate;
- (int)storyboardPresentationOrientations;
- (int)storyboardSupportedOrientations;
- (int)transitionType;
- (unint64_t)adamIdentifier;
- (unint64_t)allowedExternalDomainsCount;
- (unint64_t)hash;
- (unint64_t)parametersCount;
- (unint64_t)storyboardSizesCount;
- (unsigned)backgroundColor;
- (unsigned)letterboxStoryboardColor;
- (void)addAllowedExternalDomains:(id)a3;
- (void)addParameters:(id)a3;
- (void)addStoryboardSizes:(id)a3;
- (void)clearAllowedExternalDomains;
- (void)clearParameters;
- (void)clearStoryboardSizes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAction:(int)a3;
- (void)setActionURL:(id)a3;
- (void)setActionWebArchiveURL:(id)a3;
- (void)setAdManagesPurchaseFlow:(BOOL)a3;
- (void)setAdamIdentifier:(unint64_t)a3;
- (void)setAllowSelfDismissal:(BOOL)a3;
- (void)setAllowedExternalDomains:(id)a3;
- (void)setAppStoreViewTemplate:(int)a3;
- (void)setAutoDismissInterval:(double)a3;
- (void)setBackgroundColor:(unsigned int)a3;
- (void)setCancelButtonForPurchaseDialog:(id)a3;
- (void)setCancelLabelForExitDialog:(id)a3;
- (void)setConfirmedClickTimeInterval:(float)a3;
- (void)setContinueLabelForExitDialog:(id)a3;
- (void)setHasAdManagesPurchaseFlow:(BOOL)a3;
- (void)setHasAdamIdentifier:(BOOL)a3;
- (void)setHasAllowSelfDismissal:(BOOL)a3;
- (void)setHasAppStoreViewTemplate:(BOOL)a3;
- (void)setHasAutoDismissInterval:(BOOL)a3;
- (void)setHasBackgroundColor:(BOOL)a3;
- (void)setHasConfirmedClickTimeInterval:(BOOL)a3;
- (void)setHasLetterboxStoryboardColor:(BOOL)a3;
- (void)setHasLoadNewImpressionOnActionComplete:(BOOL)a3;
- (void)setHasPrefersToOpenInstalledApp:(BOOL)a3;
- (void)setHasScrolling:(BOOL)a3;
- (void)setHasStoryboardPresentationOrientations:(BOOL)a3;
- (void)setHasStoryboardSupportedOrientations:(BOOL)a3;
- (void)setHasSuppressesPermissionToExitDialog:(BOOL)a3;
- (void)setHasTransitionType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLetterboxStoryboardColor:(unsigned int)a3;
- (void)setLoadNewImpressionOnActionComplete:(BOOL)a3;
- (void)setMessageForExitDialog:(id)a3;
- (void)setMessageForPurchaseDialog:(id)a3;
- (void)setOkButtonForPurchaseDialog:(id)a3;
- (void)setParameters:(id)a3;
- (void)setPrefersToOpenInstalledApp:(BOOL)a3;
- (void)setScrolling:(BOOL)a3;
- (void)setStoryboardPresentationOrientations:(int)a3;
- (void)setStoryboardSizes:(id)a3;
- (void)setStoryboardSupportedOrientations:(int)a3;
- (void)setSuppressesPermissionToExitDialog:(BOOL)a3;
- (void)setTitleForExitDialog:(id)a3;
- (void)setTitleForPurchaseDialog:(id)a3;
- (void)setTransitionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdAction

- (id)actionAsString:(int)a3
{
  if a3 < 0xE && ((0x3D07u >> a3))
  {
    v3 = *(&off_100235A88 + a3);
  }
  else
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }

  return v3;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Web"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Storyboard"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"iTunesStore"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"WebView"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"App"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"MRAID"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"WebVideo"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasActionWebArchiveURL
{
  return self->_actionWebArchiveURL != 0;
}

- (void)setPrefersToOpenInstalledApp:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_prefersToOpenInstalledApp = a3;
}

- (void)setHasPrefersToOpenInstalledApp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasPrefersToOpenInstalledApp
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)clearParameters
{
}

- (void)addParameters:(id)a3
{
  id v4 = a3;
  parameters = self->_parameters;
  id v8 = v4;
  if (!parameters)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_parameters;
    self->_parameters = v6;

    id v4 = v8;
    parameters = self->_parameters;
  }
  [(NSMutableArray *)parameters addObject:v4];
}

- (unint64_t)parametersCount
{
  return (unint64_t)[(NSMutableArray *)self->_parameters count];
}

- (id)parametersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_parameters objectAtIndex:a3];
}

+ (Class)parametersType
{
  return (Class)objc_opt_class();
}

- (int)transitionType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_transitionType;
  }
  else {
    return 1;
  }
}

- (void)setTransitionType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_transitionType = a3;
}

- (void)setHasTransitionType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTransitionType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)transitionTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    id v4 = @"Slide";
  }
  else if (a3 == 2)
  {
    id v4 = @"Fade";
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  return v4;
}

- (int)StringAsTransitionType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Slide"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Fade"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (void)setSuppressesPermissionToExitDialog:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_suppressesPermissionToExitDialog = a3;
}

- (void)setHasSuppressesPermissionToExitDialog:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasSuppressesPermissionToExitDialog
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasTitleForExitDialog
{
  return self->_titleForExitDialog != 0;
}

- (BOOL)hasMessageForExitDialog
{
  return self->_messageForExitDialog != 0;
}

- (BOOL)hasCancelLabelForExitDialog
{
  return self->_cancelLabelForExitDialog != 0;
}

- (BOOL)hasContinueLabelForExitDialog
{
  return self->_continueLabelForExitDialog != 0;
}

- (void)setConfirmedClickTimeInterval:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_confirmedClickTimeInterval = a3;
}

- (void)setHasConfirmedClickTimeInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasConfirmedClickTimeInterval
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setLoadNewImpressionOnActionComplete:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_loadNewImpressionOnActionComplete = a3;
}

- (void)setHasLoadNewImpressionOnActionComplete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLoadNewImpressionOnActionComplete
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBackgroundColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_backgroundColor = a3;
}

- (void)setHasBackgroundColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBackgroundColor
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setScrolling:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_scrolling = a3;
}

- (void)setHasScrolling:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasScrolling
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)clearStoryboardSizes
{
}

- (void)addStoryboardSizes:(id)a3
{
  id v4 = a3;
  storyboardSizes = self->_storyboardSizes;
  id v8 = v4;
  if (!storyboardSizes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_storyboardSizes;
    self->_storyboardSizes = v6;

    id v4 = v8;
    storyboardSizes = self->_storyboardSizes;
  }
  [(NSMutableArray *)storyboardSizes addObject:v4];
}

- (unint64_t)storyboardSizesCount
{
  return (unint64_t)[(NSMutableArray *)self->_storyboardSizes count];
}

- (id)storyboardSizesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_storyboardSizes objectAtIndex:a3];
}

+ (Class)storyboardSizesType
{
  return (Class)objc_opt_class();
}

- (void)setLetterboxStoryboardColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_letterboxStoryboardColor = a3;
}

- (void)setHasLetterboxStoryboardColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLetterboxStoryboardColor
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)storyboardPresentationOrientations
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_storyboardPresentationOrientations;
  }
  else {
    return 0;
  }
}

- (void)setStoryboardPresentationOrientations:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_storyboardPresentationOrientations = a3;
}

- (void)setHasStoryboardPresentationOrientations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasStoryboardPresentationOrientations
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)storyboardPresentationOrientationsAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235AF8 + a3);
  }

  return v3;
}

- (int)StringAsStoryboardPresentationOrientations:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Landscape"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Any"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)storyboardSupportedOrientations
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_storyboardSupportedOrientations;
  }
  else {
    return 0;
  }
}

- (void)setStoryboardSupportedOrientations:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_storyboardSupportedOrientations = a3;
}

- (void)setHasStoryboardSupportedOrientations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStoryboardSupportedOrientations
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)storyboardSupportedOrientationsAsString:(int)a3
{
  if (a3 >= 3)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235AF8 + a3);
  }

  return v3;
}

- (int)StringAsStoryboardSupportedOrientations:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Portrait"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Landscape"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Any"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAllowSelfDismissal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_allowSelfDismissal = a3;
}

- (void)setHasAllowSelfDismissal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasAllowSelfDismissal
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (double)autoDismissInterval
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_autoDismissInterval;
  }
  else {
    return 600.0;
  }
}

- (void)setAutoDismissInterval:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_autoDismissInterval = a3;
}

- (void)setHasAutoDismissInterval:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAutoDismissInterval
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearAllowedExternalDomains
{
}

- (void)addAllowedExternalDomains:(id)a3
{
  id v4 = a3;
  allowedExternalDomains = self->_allowedExternalDomains;
  id v8 = v4;
  if (!allowedExternalDomains)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_allowedExternalDomains;
    self->_allowedExternalDomains = v6;

    id v4 = v8;
    allowedExternalDomains = self->_allowedExternalDomains;
  }
  [(NSMutableArray *)allowedExternalDomains addObject:v4];
}

- (unint64_t)allowedExternalDomainsCount
{
  return (unint64_t)[(NSMutableArray *)self->_allowedExternalDomains count];
}

- (id)allowedExternalDomainsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_allowedExternalDomains objectAtIndex:a3];
}

+ (Class)allowedExternalDomainsType
{
  return (Class)objc_opt_class();
}

- (void)setAdManagesPurchaseFlow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_adManagesPurchaseFlow = a3;
}

- (void)setHasAdManagesPurchaseFlow:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasAdManagesPurchaseFlow
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasTitleForPurchaseDialog
{
  return self->_titleForPurchaseDialog != 0;
}

- (BOOL)hasMessageForPurchaseDialog
{
  return self->_messageForPurchaseDialog != 0;
}

- (BOOL)hasCancelButtonForPurchaseDialog
{
  return self->_cancelButtonForPurchaseDialog != 0;
}

- (BOOL)hasOkButtonForPurchaseDialog
{
  return self->_okButtonForPurchaseDialog != 0;
}

- (void)setAdamIdentifier:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adamIdentifier = a3;
}

- (void)setHasAdamIdentifier:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdamIdentifier
{
  return *(_WORD *)&self->_has & 1;
}

- (int)appStoreViewTemplate
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_appStoreViewTemplate;
  }
  else {
    return 4780;
  }
}

- (void)setAppStoreViewTemplate:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appStoreViewTemplate = a3;
}

- (void)setHasAppStoreViewTemplate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppStoreViewTemplate
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)appStoreViewTemplateAsString:(int)a3
{
  if ((a3 - 4780) >= 0xB)
  {
    __int16 v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    __int16 v3 = *(&off_100235B10 + a3 - 4780);
  }

  return v3;
}

- (int)StringAsAppStoreViewTemplate:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Text"])
  {
    int v4 = 4780;
  }
  else if ([v3 isEqualToString:@"IPhonePortraitVideoImageImage"])
  {
    int v4 = 4781;
  }
  else if ([v3 isEqualToString:@"IPhonePortraitImageImageImage"])
  {
    int v4 = 4782;
  }
  else if ([v3 isEqualToString:@"IPhoneLandscapeVideo"])
  {
    int v4 = 4783;
  }
  else if ([v3 isEqualToString:@"IPhoneLandscapeImage"])
  {
    int v4 = 4784;
  }
  else if ([v3 isEqualToString:@"IPadImage"])
  {
    int v4 = 4785;
  }
  else if ([v3 isEqualToString:@"IPadVideo"])
  {
    int v4 = 4786;
  }
  else if ([v3 isEqualToString:@"PortraitMaterial"])
  {
    int v4 = 4787;
  }
  else if ([v3 isEqualToString:@"LandscapeMaterial"])
  {
    int v4 = 4788;
  }
  else if ([v3 isEqualToString:@"PortraitGrid"])
  {
    int v4 = 4789;
  }
  else if ([v3 isEqualToString:@"LandscapeGrid"])
  {
    int v4 = 4790;
  }
  else
  {
    int v4 = 4780;
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdAction;
  id v3 = [(APPBAdAction *)&v7 description];
  int v4 = [(APPBAdAction *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  uint64_t action = self->_action;
  if action < 0xE && ((0x3D07u >> action))
  {
    objc_super v7 = *(&off_100235A88 + action);
  }
  else
  {
    objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_action];
  }
  [v4 setObject:v7 forKey:@"action"];

  actionURL = self->_actionURL;
  if (actionURL) {
    [v4 setObject:actionURL forKey:@"actionURL"];
  }
  actionWebArchiveURL = self->_actionWebArchiveURL;
  if (actionWebArchiveURL) {
    [v4 setObject:actionWebArchiveURL forKey:@"actionWebArchiveURL"];
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_prefersToOpenInstalledApp];
    [v4 setObject:v10 forKey:@"prefersToOpenInstalledApp"];
  }
  if ([(NSMutableArray *)self->_parameters count])
  {
    id v12 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_parameters, "count")];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v13 = self->_parameters;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v64;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v64 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = [*(id *)(*((void *)&v63 + 1) + 8 * i) dictionaryRepresentation];
          [v12 addObject:v18];
        }
        id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v63 objects:v68 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKey:@"parameters"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    int transitionType = self->_transitionType;
    if (transitionType == 1)
    {
      v21 = @"Slide";
    }
    else if (transitionType == 2)
    {
      v21 = @"Fade";
    }
    else
    {
      v21 = +[NSString stringWithFormat:@"(unknown: %i)", self->_transitionType];
    }
    [v4 setObject:v21 forKey:@"transitionType"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x4000) != 0)
  {
    v22 = +[NSNumber numberWithBool:self->_suppressesPermissionToExitDialog];
    [v4 setObject:v22 forKey:@"suppressesPermissionToExitDialog"];
  }
  titleForExitDialog = self->_titleForExitDialog;
  if (titleForExitDialog) {
    [v4 setObject:titleForExitDialog forKey:@"titleForExitDialog"];
  }
  messageForExitDialog = self->_messageForExitDialog;
  if (messageForExitDialog) {
    [v4 setObject:messageForExitDialog forKey:@"messageForExitDialog"];
  }
  cancelLabelForExitDialog = self->_cancelLabelForExitDialog;
  if (cancelLabelForExitDialog) {
    [v4 setObject:cancelLabelForExitDialog forKey:@"cancelLabelForExitDialog"];
  }
  continueLabelForExitDialog = self->_continueLabelForExitDialog;
  if (continueLabelForExitDialog) {
    [v4 setObject:continueLabelForExitDialog forKey:@"continueLabelForExitDialog"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x10) != 0)
  {
    *(float *)&double v11 = self->_confirmedClickTimeInterval;
    v48 = +[NSNumber numberWithFloat:v11];
    [v4 setObject:v48 forKey:@"confirmedClickTimeInterval"];

    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x800) == 0)
    {
LABEL_41:
      if ((v27 & 8) == 0) {
        goto LABEL_42;
      }
      goto LABEL_78;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_41;
  }
  v49 = +[NSNumber numberWithBool:self->_loadNewImpressionOnActionComplete];
  [v4 setObject:v49 forKey:@"loadNewImpressionOnActionComplete"];

  __int16 v27 = (__int16)self->_has;
  if ((v27 & 8) == 0)
  {
LABEL_42:
    if ((v27 & 0x2000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_78:
  v50 = +[NSNumber numberWithUnsignedInt:self->_backgroundColor];
  [v4 setObject:v50 forKey:@"backgroundColor"];

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_43:
    v28 = +[NSNumber numberWithBool:self->_scrolling];
    [v4 setObject:v28 forKey:@"scrolling"];
  }
LABEL_44:
  if ([(NSMutableArray *)self->_storyboardSizes count])
  {
    id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_storyboardSizes, "count")];
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v30 = self->_storyboardSizes;
    id v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v67 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v60;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v60 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = [*(id *)(*((void *)&v59 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v29 addObject:v35];
        }
        id v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v32);
    }

    [v4 setObject:v29 forKey:@"storyboardSizes"];
  }
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x20) != 0)
  {
    v51 = +[NSNumber numberWithUnsignedInt:self->_letterboxStoryboardColor];
    [v4 setObject:v51 forKey:@"letterboxStoryboardColor"];

    __int16 v36 = (__int16)self->_has;
    if ((v36 & 0x40) == 0)
    {
LABEL_55:
      if ((v36 & 0x80) == 0) {
        goto LABEL_56;
      }
      goto LABEL_88;
    }
  }
  else if ((v36 & 0x40) == 0)
  {
    goto LABEL_55;
  }
  uint64_t storyboardPresentationOrientations = self->_storyboardPresentationOrientations;
  if (storyboardPresentationOrientations >= 3)
  {
    v53 = +[NSString stringWithFormat:@"(unknown: %i)", self->_storyboardPresentationOrientations];
  }
  else
  {
    v53 = *(&off_100235AF8 + storyboardPresentationOrientations);
  }
  [v4 setObject:v53 forKey:@"storyboardPresentationOrientations"];

  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x80) == 0)
  {
LABEL_56:
    if ((v36 & 0x400) == 0) {
      goto LABEL_57;
    }
    goto LABEL_92;
  }
LABEL_88:
  uint64_t storyboardSupportedOrientations = self->_storyboardSupportedOrientations;
  if (storyboardSupportedOrientations >= 3)
  {
    v57 = +[NSString stringWithFormat:@"(unknown: %i)", self->_storyboardSupportedOrientations];
  }
  else
  {
    v57 = *(&off_100235AF8 + storyboardSupportedOrientations);
  }
  [v4 setObject:v57 forKey:@"storyboardSupportedOrientations"];

  __int16 v36 = (__int16)self->_has;
  if ((v36 & 0x400) == 0)
  {
LABEL_57:
    if ((v36 & 2) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_92:
  v58 = +[NSNumber numberWithBool:self->_allowSelfDismissal];
  [v4 setObject:v58 forKey:@"allowSelfDismissal"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_58:
    v37 = +[NSNumber numberWithDouble:self->_autoDismissInterval];
    [v4 setObject:v37 forKey:@"autoDismissInterval"];
  }
LABEL_59:
  allowedExternalDomains = self->_allowedExternalDomains;
  if (allowedExternalDomains) {
    [v4 setObject:allowedExternalDomains forKey:@"allowedExternalDomains"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v39 = +[NSNumber numberWithBool:self->_adManagesPurchaseFlow];
    [v4 setObject:v39 forKey:@"adManagesPurchaseFlow"];
  }
  titleForPurchaseDialog = self->_titleForPurchaseDialog;
  if (titleForPurchaseDialog) {
    [v4 setObject:titleForPurchaseDialog forKey:@"titleForPurchaseDialog"];
  }
  messageForPurchaseDialog = self->_messageForPurchaseDialog;
  if (messageForPurchaseDialog) {
    [v4 setObject:messageForPurchaseDialog forKey:@"messageForPurchaseDialog"];
  }
  cancelButtonForPurchaseDialog = self->_cancelButtonForPurchaseDialog;
  if (cancelButtonForPurchaseDialog) {
    [v4 setObject:cancelButtonForPurchaseDialog forKey:@"cancelButtonForPurchaseDialog"];
  }
  okButtonForPurchaseDialog = self->_okButtonForPurchaseDialog;
  if (okButtonForPurchaseDialog) {
    [v4 setObject:okButtonForPurchaseDialog forKey:@"okButtonForPurchaseDialog"];
  }
  __int16 v44 = (__int16)self->_has;
  if (v44)
  {
    v45 = +[NSNumber numberWithUnsignedLongLong:self->_adamIdentifier];
    [v4 setObject:v45 forKey:@"adamIdentifier"];

    __int16 v44 = (__int16)self->_has;
  }
  if ((v44 & 4) != 0)
  {
    int v46 = self->_appStoreViewTemplate - 4780;
    if (v46 >= 0xB)
    {
      v47 = +[NSString stringWithFormat:@"(unknown: %i)", self->_appStoreViewTemplate];
    }
    else
    {
      v47 = *(&off_100235B10 + v46);
    }
    [v4 setObject:v47 forKey:@"appStoreViewTemplate"];
  }
  id v54 = v4;

  return v54;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_identifier) {
    sub_10019A684();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt32Field();
  if (self->_actionURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionWebArchiveURL) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v6 = self->_parameters;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x4000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_titleForExitDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForExitDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_cancelLabelForExitDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_continueLabelForExitDialog) {
    PBDataWriterWriteStringField();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x800) == 0)
    {
LABEL_29:
      if ((v12 & 8) == 0) {
        goto LABEL_30;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_30:
    if ((v12 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_69:
  PBDataWriterWriteFixed32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_31:
  }
    PBDataWriterWriteBOOLField();
LABEL_32:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = self->_storyboardSizes;
  id v14 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
      }
      id v15 = (char *)[(NSMutableArray *)v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v15);
  }

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
  {
    PBDataWriterWriteFixed32Field();
    __int16 v18 = (__int16)self->_has;
    if ((v18 & 0x40) == 0)
    {
LABEL_41:
      if ((v18 & 0x80) == 0) {
        goto LABEL_42;
      }
      goto LABEL_73;
    }
  }
  else if ((v18 & 0x40) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteInt32Field();
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x80) == 0)
  {
LABEL_42:
    if ((v18 & 0x400) == 0) {
      goto LABEL_43;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x400) == 0)
  {
LABEL_43:
    if ((v18 & 2) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_44:
  }
    PBDataWriterWriteDoubleField();
LABEL_45:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = self->_allowedExternalDomains;
  v20 = (char *)[(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
      }
      v21 = (char *)[(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_titleForPurchaseDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_messageForPurchaseDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_cancelButtonForPurchaseDialog) {
    PBDataWriterWriteStringField();
  }
  if (self->_okButtonForPurchaseDialog) {
    PBDataWriterWriteStringField();
  }
  __int16 v24 = (__int16)self->_has;
  if (v24)
  {
    PBDataWriterWriteFixed64Field();
    __int16 v24 = (__int16)self->_has;
  }
  if ((v24 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v23 = a3;
  [v23 setIdentifier:self->_identifier];
  id v4 = v23;
  *((_DWORD *)v23 + 6) = self->_action;
  if (self->_actionURL)
  {
    [v23 setActionURL:];
    id v4 = v23;
  }
  if (self->_actionWebArchiveURL)
  {
    [v23 setActionWebArchiveURL:];
    id v4 = v23;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    v4[191] = self->_prefersToOpenInstalledApp;
    *((_WORD *)v4 + 98) |= 0x1000u;
  }
  if ([(APPBAdAction *)self parametersCount])
  {
    [v23 clearParameters];
    unint64_t v5 = [(APPBAdAction *)self parametersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(APPBAdAction *)self parametersAtIndex:i];
        [v23 addParameters:v8];
      }
    }
  }
  __int16 has = (__int16)self->_has;
  v10 = v23;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v23 + 46) = self->_transitionType;
    *((_WORD *)v23 + 98) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x4000) != 0)
  {
    *((unsigned char *)v23 + 193) = self->_suppressesPermissionToExitDialog;
    *((_WORD *)v23 + 98) |= 0x4000u;
  }
  if (self->_titleForExitDialog)
  {
    [v23 setTitleForExitDialog:];
    v10 = v23;
  }
  if (self->_messageForExitDialog)
  {
    [v23 setMessageForExitDialog:];
    v10 = v23;
  }
  if (self->_cancelLabelForExitDialog)
  {
    [v23 setCancelLabelForExitDialog];
    v10 = v23;
  }
  if (self->_continueLabelForExitDialog)
  {
    [v23 setContinueLabelForExitDialog:];
    v10 = v23;
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) != 0)
  {
    v10[20] = LODWORD(self->_confirmedClickTimeInterval);
    *((_WORD *)v10 + 98) |= 0x10u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x800) == 0)
    {
LABEL_25:
      if ((v11 & 8) == 0) {
        goto LABEL_26;
      }
LABEL_61:
      v10[15] = self->_backgroundColor;
      *((_WORD *)v10 + 98) |= 8u;
      if ((*(_WORD *)&self->_has & 0x2000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_25;
  }
  *((unsigned char *)v10 + 190) = self->_loadNewImpressionOnActionComplete;
  *((_WORD *)v10 + 98) |= 0x800u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) != 0) {
    goto LABEL_61;
  }
LABEL_26:
  if ((v11 & 0x2000) != 0)
  {
LABEL_27:
    *((unsigned char *)v10 + 192) = self->_scrolling;
    *((_WORD *)v10 + 98) |= 0x2000u;
  }
LABEL_28:
  if ([(APPBAdAction *)self storyboardSizesCount])
  {
    [v23 clearStoryboardSizes];
    unint64_t v12 = [(APPBAdAction *)self storyboardSizesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        id v15 = [(APPBAdAction *)self storyboardSizesAtIndex:j];
        [v23 addStoryboardSizes:v15];
      }
    }
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x20) != 0)
  {
    *((_DWORD *)v23 + 26) = self->_letterboxStoryboardColor;
    *((_WORD *)v23 + 98) |= 0x20u;
    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x40) == 0)
    {
LABEL_34:
      if ((v16 & 0x80) == 0) {
        goto LABEL_35;
      }
      goto LABEL_65;
    }
  }
  else if ((v16 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  *((_DWORD *)v23 + 36) = self->_storyboardPresentationOrientations;
  *((_WORD *)v23 + 98) |= 0x40u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x80) == 0)
  {
LABEL_35:
    if ((v16 & 0x400) == 0) {
      goto LABEL_36;
    }
LABEL_66:
    *((unsigned char *)v23 + 189) = self->_allowSelfDismissal;
    *((_WORD *)v23 + 98) |= 0x400u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
LABEL_65:
  *((_DWORD *)v23 + 40) = self->_storyboardSupportedOrientations;
  *((_WORD *)v23 + 98) |= 0x80u;
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x400) != 0) {
    goto LABEL_66;
  }
LABEL_36:
  if ((v16 & 2) != 0)
  {
LABEL_37:
    *((void *)v23 + 2) = *(void *)&self->_autoDismissInterval;
    *((_WORD *)v23 + 98) |= 2u;
  }
LABEL_38:
  if ([(APPBAdAction *)self allowedExternalDomainsCount])
  {
    [v23 clearAllowedExternalDomains];
    unint64_t v17 = [(APPBAdAction *)self allowedExternalDomainsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t k = 0; k != v18; ++k)
      {
        v20 = [(APPBAdAction *)self allowedExternalDomainsAtIndex:k];
        [v23 addAllowedExternalDomains:v20];
      }
    }
  }
  v21 = v23;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((unsigned char *)v23 + 188) = self->_adManagesPurchaseFlow;
    *((_WORD *)v23 + 98) |= 0x200u;
  }
  if (self->_titleForPurchaseDialog)
  {
    [v23 setTitleForPurchaseDialog:];
    v21 = v23;
  }
  if (self->_messageForPurchaseDialog)
  {
    [v23 setMessageForPurchaseDialog:];
    v21 = v23;
  }
  if (self->_cancelButtonForPurchaseDialog)
  {
    [v23 setCancelButtonForPurchaseDialog:];
    v21 = v23;
  }
  if (self->_okButtonForPurchaseDialog)
  {
    [v23 setOkButtonForPurchaseDialog:];
    v21 = v23;
  }
  __int16 v22 = (__int16)self->_has;
  if (v22)
  {
    v21[1] = self->_adamIdentifier;
    *((_WORD *)v21 + 98) |= 1u;
    __int16 v22 = (__int16)self->_has;
  }
  if ((v22 & 4) != 0)
  {
    *((_DWORD *)v21 + 14) = self->_appStoreViewTemplate;
    *((_WORD *)v21 + 98) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[12];
  v5[12] = v6;

  *((_DWORD *)v5 + 6) = self->_action;
  id v8 = [(NSString *)self->_actionURL copyWithZone:a3];
  uint64_t v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_actionWebArchiveURL copyWithZone:a3];
  __int16 v11 = (void *)v5[5];
  v5[5] = v10;

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *((unsigned char *)v5 + 191) = self->_prefersToOpenInstalledApp;
    *((_WORD *)v5 + 98) |= 0x1000u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  unint64_t v12 = self->_parameters;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = [*(id *)(*((void *)&v59 + 1) + 8 * i) copyWithZone:a3];
        [v5 addParameters:v17];
      }
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
    }
    while (v14);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 46) = self->_transitionType;
    *((_WORD *)v5 + 98) |= 0x100u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x4000) != 0)
  {
    *((unsigned char *)v5 + 193) = self->_suppressesPermissionToExitDialog;
    *((_WORD *)v5 + 98) |= 0x4000u;
  }
  id v19 = [(NSString *)self->_titleForExitDialog copyWithZone:a3];
  v20 = (void *)v5[21];
  v5[21] = v19;

  id v21 = [(NSString *)self->_messageForExitDialog copyWithZone:a3];
  __int16 v22 = (void *)v5[14];
  v5[14] = v21;

  id v23 = [(NSString *)self->_cancelLabelForExitDialog copyWithZone:a3];
  __int16 v24 = (void *)v5[9];
  v5[9] = v23;

  id v25 = [(NSString *)self->_continueLabelForExitDialog copyWithZone:a3];
  long long v26 = (void *)v5[11];
  v5[11] = v25;

  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x10) != 0)
  {
    *((_DWORD *)v5 + 20) = LODWORD(self->_confirmedClickTimeInterval);
    *((_WORD *)v5 + 98) |= 0x10u;
    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x800) == 0)
    {
LABEL_16:
      if ((v27 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_16;
  }
  *((unsigned char *)v5 + 190) = self->_loadNewImpressionOnActionComplete;
  *((_WORD *)v5 + 98) |= 0x800u;
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 8) == 0)
  {
LABEL_17:
    if ((v27 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_48:
  *((_DWORD *)v5 + 15) = self->_backgroundColor;
  *((_WORD *)v5 + 98) |= 8u;
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
LABEL_18:
    *((unsigned char *)v5 + 192) = self->_scrolling;
    *((_WORD *)v5 + 98) |= 0x2000u;
  }
LABEL_19:
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v28 = self->_storyboardSizes;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v30; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        id v33 = [*(id *)(*((void *)&v55 + 1) + 8 * (void)j) copyWithZone:a3];
        [v5 addStoryboardSizes:v33];
      }
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v30);
  }

  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 26) = self->_letterboxStoryboardColor;
    *((_WORD *)v5 + 98) |= 0x20u;
    __int16 v34 = (__int16)self->_has;
    if ((v34 & 0x40) == 0)
    {
LABEL_28:
      if ((v34 & 0x80) == 0) {
        goto LABEL_29;
      }
      goto LABEL_52;
    }
  }
  else if ((v34 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v5 + 36) = self->_storyboardPresentationOrientations;
  *((_WORD *)v5 + 98) |= 0x40u;
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x80) == 0)
  {
LABEL_29:
    if ((v34 & 0x400) == 0) {
      goto LABEL_30;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v5 + 40) = self->_storyboardSupportedOrientations;
  *((_WORD *)v5 + 98) |= 0x80u;
  __int16 v34 = (__int16)self->_has;
  if ((v34 & 0x400) == 0)
  {
LABEL_30:
    if ((v34 & 2) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_53:
  *((unsigned char *)v5 + 189) = self->_allowSelfDismissal;
  *((_WORD *)v5 + 98) |= 0x400u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_31:
    v5[2] = *(void *)&self->_autoDismissInterval;
    *((_WORD *)v5 + 98) |= 2u;
  }
LABEL_32:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v35 = self->_allowedExternalDomains;
  id v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v37; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(v35);
        }
        id v40 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)k) copyWithZone:a3];
        [v5 addAllowedExternalDomains:v40];
      }
      id v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v37);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((unsigned char *)v5 + 188) = self->_adManagesPurchaseFlow;
    *((_WORD *)v5 + 98) |= 0x200u;
  }
  id v41 = -[NSString copyWithZone:](self->_titleForPurchaseDialog, "copyWithZone:", a3, (void)v51);
  v42 = (void *)v5[22];
  v5[22] = v41;

  id v43 = [(NSString *)self->_messageForPurchaseDialog copyWithZone:a3];
  __int16 v44 = (void *)v5[15];
  v5[15] = v43;

  id v45 = [(NSString *)self->_cancelButtonForPurchaseDialog copyWithZone:a3];
  int v46 = (void *)v5[8];
  v5[8] = v45;

  id v47 = [(NSString *)self->_okButtonForPurchaseDialog copyWithZone:a3];
  v48 = (void *)v5[16];
  v5[16] = v47;

  __int16 v49 = (__int16)self->_has;
  if (v49)
  {
    v5[1] = self->_adamIdentifier;
    *((_WORD *)v5 + 98) |= 1u;
    __int16 v49 = (__int16)self->_has;
  }
  if ((v49 & 4) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_appStoreViewTemplate;
    *((_WORD *)v5 + 98) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_127;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_127;
    }
  }
  if (self->_action != *((_DWORD *)v4 + 6)) {
    goto LABEL_127;
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:")) {
      goto LABEL_127;
    }
  }
  actionWebArchiveURL = self->_actionWebArchiveURL;
  if ((unint64_t)actionWebArchiveURL | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](actionWebArchiveURL, "isEqual:")) {
      goto LABEL_127;
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x1000) == 0) {
      goto LABEL_127;
    }
    if (self->_prefersToOpenInstalledApp)
    {
      if (!*((unsigned char *)v4 + 191)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 191))
    {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    goto LABEL_127;
  }
  parameters = self->_parameters;
  if ((unint64_t)parameters | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](parameters, "isEqual:")) {
      goto LABEL_127;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x100) == 0 || self->_transitionType != *((_DWORD *)v4 + 46)) {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x100) != 0)
  {
    goto LABEL_127;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x4000) == 0) {
      goto LABEL_127;
    }
    if (self->_suppressesPermissionToExitDialog)
    {
      if (!*((unsigned char *)v4 + 193)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 193))
    {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x4000) != 0)
  {
    goto LABEL_127;
  }
  titleForExitDialog = self->_titleForExitDialog;
  if ((unint64_t)titleForExitDialog | *((void *)v4 + 21)
    && !-[NSString isEqual:](titleForExitDialog, "isEqual:"))
  {
    goto LABEL_127;
  }
  messageForExitDialog = self->_messageForExitDialog;
  if ((unint64_t)messageForExitDialog | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](messageForExitDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  cancelLabelForExitDialog = self->_cancelLabelForExitDialog;
  if ((unint64_t)cancelLabelForExitDialog | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](cancelLabelForExitDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  continueLabelForExitDialog = self->_continueLabelForExitDialog;
  if ((unint64_t)continueLabelForExitDialog | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](continueLabelForExitDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 98);
  if ((v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_confirmedClickTimeInterval != *((float *)v4 + 20)) {
      goto LABEL_127;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x800) == 0) {
      goto LABEL_127;
    }
    if (self->_loadNewImpressionOnActionComplete)
    {
      if (!*((unsigned char *)v4 + 190)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 190))
    {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) != 0)
  {
    goto LABEL_127;
  }
  if ((v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_backgroundColor != *((_DWORD *)v4 + 15)) {
      goto LABEL_127;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_127;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x2000) == 0) {
      goto LABEL_127;
    }
    if (self->_scrolling)
    {
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 192))
    {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
    goto LABEL_127;
  }
  storyboardSizes = self->_storyboardSizes;
  if ((unint64_t)storyboardSizes | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](storyboardSizes, "isEqual:")) {
      goto LABEL_127;
    }
    __int16 v14 = (__int16)self->_has;
  }
  __int16 v17 = *((_WORD *)v4 + 98);
  if ((v14 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_letterboxStoryboardColor != *((_DWORD *)v4 + 26)) {
      goto LABEL_127;
    }
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_127;
  }
  if ((v14 & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_storyboardPresentationOrientations != *((_DWORD *)v4 + 36)) {
      goto LABEL_127;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_127;
  }
  if ((v14 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_storyboardSupportedOrientations != *((_DWORD *)v4 + 40)) {
      goto LABEL_127;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_127;
  }
  if ((v14 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x400) == 0) {
      goto LABEL_127;
    }
    if (self->_allowSelfDismissal)
    {
      if (!*((unsigned char *)v4 + 189)) {
        goto LABEL_127;
      }
    }
    else if (*((unsigned char *)v4 + 189))
    {
      goto LABEL_127;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x400) != 0)
  {
    goto LABEL_127;
  }
  if ((v14 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_autoDismissInterval != *((double *)v4 + 2)) {
      goto LABEL_127;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_127;
  }
  allowedExternalDomains = self->_allowedExternalDomains;
  if ((unint64_t)allowedExternalDomains | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](allowedExternalDomains, "isEqual:")) {
      goto LABEL_127;
    }
    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 98) & 0x200) != 0)
    {
      if (self->_adManagesPurchaseFlow)
      {
        if (!*((unsigned char *)v4 + 188)) {
          goto LABEL_127;
        }
        goto LABEL_109;
      }
      if (!*((unsigned char *)v4 + 188)) {
        goto LABEL_109;
      }
    }
LABEL_127:
    BOOL v25 = 0;
    goto LABEL_128;
  }
  if ((*((_WORD *)v4 + 98) & 0x200) != 0) {
    goto LABEL_127;
  }
LABEL_109:
  titleForPurchaseDialog = self->_titleForPurchaseDialog;
  if ((unint64_t)titleForPurchaseDialog | *((void *)v4 + 22)
    && !-[NSString isEqual:](titleForPurchaseDialog, "isEqual:"))
  {
    goto LABEL_127;
  }
  messageForPurchaseDialog = self->_messageForPurchaseDialog;
  if ((unint64_t)messageForPurchaseDialog | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](messageForPurchaseDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  cancelButtonForPurchaseDialog = self->_cancelButtonForPurchaseDialog;
  if ((unint64_t)cancelButtonForPurchaseDialog | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](cancelButtonForPurchaseDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  okButtonForPurchaseDialog = self->_okButtonForPurchaseDialog;
  if ((unint64_t)okButtonForPurchaseDialog | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](okButtonForPurchaseDialog, "isEqual:")) {
      goto LABEL_127;
    }
  }
  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 98);
  if (v23)
  {
    if ((v24 & 1) == 0 || self->_adamIdentifier != *((void *)v4 + 1)) {
      goto LABEL_127;
    }
  }
  else if (v24)
  {
    goto LABEL_127;
  }
  if ((v23 & 4) != 0)
  {
    if ((v24 & 4) == 0 || self->_appStoreViewTemplate != *((_DWORD *)v4 + 14)) {
      goto LABEL_127;
    }
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = (v24 & 4) == 0;
  }
LABEL_128:

  return v25;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  uint64_t action = self->_action;
  NSUInteger v46 = v3;
  NSUInteger v44 = [(NSString *)self->_actionURL hash];
  NSUInteger v43 = [(NSString *)self->_actionWebArchiveURL hash];
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    uint64_t v42 = 2654435761 * self->_prefersToOpenInstalledApp;
  }
  else {
    uint64_t v42 = 0;
  }
  unint64_t v41 = (unint64_t)[(NSMutableArray *)self->_parameters hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v40 = 2654435761 * self->_transitionType;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0)
    {
LABEL_6:
      uint64_t v39 = 2654435761 * self->_suppressesPermissionToExitDialog;
      goto LABEL_9;
    }
  }
  uint64_t v39 = 0;
LABEL_9:
  NSUInteger v38 = [(NSString *)self->_titleForExitDialog hash];
  NSUInteger v37 = [(NSString *)self->_messageForExitDialog hash];
  NSUInteger v36 = [(NSString *)self->_cancelLabelForExitDialog hash];
  NSUInteger v35 = [(NSString *)self->_continueLabelForExitDialog hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    float confirmedClickTimeInterval = self->_confirmedClickTimeInterval;
    float v7 = -confirmedClickTimeInterval;
    if (confirmedClickTimeInterval >= 0.0) {
      float v7 = self->_confirmedClickTimeInterval;
    }
    float v8 = floorf(v7 + 0.5);
    float v9 = (float)(v7 - v8) * 1.8447e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 0x800) != 0)
  {
    uint64_t v33 = 2654435761 * self->_loadNewImpressionOnActionComplete;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((has & 8) != 0)
    {
LABEL_19:
      uint64_t v32 = 2654435761 * self->_backgroundColor;
      goto LABEL_22;
    }
  }
  uint64_t v32 = 0;
LABEL_22:
  unint64_t v34 = v5;
  if ((has & 0x2000) != 0) {
    uint64_t v31 = 2654435761 * self->_scrolling;
  }
  else {
    uint64_t v31 = 0;
  }
  unint64_t v30 = (unint64_t)[(NSMutableArray *)self->_storyboardSizes hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    uint64_t v29 = 2654435761 * self->_letterboxStoryboardColor;
    if ((v10 & 0x40) != 0)
    {
LABEL_27:
      uint64_t v28 = 2654435761 * self->_storyboardPresentationOrientations;
      if ((v10 & 0x80) != 0) {
        goto LABEL_28;
      }
      goto LABEL_36;
    }
  }
  else
  {
    uint64_t v29 = 0;
    if ((v10 & 0x40) != 0) {
      goto LABEL_27;
    }
  }
  uint64_t v28 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_28:
    uint64_t v27 = 2654435761 * self->_storyboardSupportedOrientations;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_29;
    }
LABEL_37:
    uint64_t v11 = 0;
    if ((v10 & 2) != 0) {
      goto LABEL_30;
    }
LABEL_38:
    unint64_t v16 = 0;
    goto LABEL_41;
  }
LABEL_36:
  uint64_t v27 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_37;
  }
LABEL_29:
  uint64_t v11 = 2654435761 * self->_allowSelfDismissal;
  if ((v10 & 2) == 0) {
    goto LABEL_38;
  }
LABEL_30:
  double autoDismissInterval = self->_autoDismissInterval;
  double v13 = -autoDismissInterval;
  if (autoDismissInterval >= 0.0) {
    double v13 = self->_autoDismissInterval;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
LABEL_41:
  unint64_t v17 = (unint64_t)[(NSMutableArray *)self->_allowedExternalDomains hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v18 = 2654435761 * self->_adManagesPurchaseFlow;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_titleForPurchaseDialog hash];
  NSUInteger v20 = [(NSString *)self->_messageForPurchaseDialog hash];
  NSUInteger v21 = [(NSString *)self->_cancelButtonForPurchaseDialog hash];
  NSUInteger v22 = [(NSString *)self->_okButtonForPurchaseDialog hash];
  __int16 v23 = (__int16)self->_has;
  if (v23)
  {
    unint64_t v24 = 2654435761u * self->_adamIdentifier;
    if ((v23 & 4) != 0) {
      goto LABEL_46;
    }
LABEL_48:
    uint64_t v25 = 0;
    return (2654435761 * action) ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
  }
  unint64_t v24 = 0;
  if ((v23 & 4) == 0) {
    goto LABEL_48;
  }
LABEL_46:
  uint64_t v25 = 2654435761 * self->_appStoreViewTemplate;
  return (2654435761 * action) ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v11 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 12)) {
    -[APPBAdAction setIdentifier:](self, "setIdentifier:");
  }
  self->_uint64_t action = *((_DWORD *)v4 + 6);
  if (*((void *)v4 + 4)) {
    -[APPBAdAction setActionURL:](self, "setActionURL:");
  }
  if (*((void *)v4 + 5)) {
    -[APPBAdAction setActionWebArchiveURL:](self, "setActionWebArchiveURL:");
  }
  if ((*((_WORD *)v4 + 98) & 0x1000) != 0)
  {
    self->_prefersToOpenInstalledApp = *((unsigned char *)v4 + 191);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = *((id *)v4 + 17);
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        [(APPBAdAction *)self addParameters:*(void *)(*((void *)&v32 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 98);
  if ((v10 & 0x100) != 0)
  {
    self->_int transitionType = *((_DWORD *)v4 + 46);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v10 = *((_WORD *)v4 + 98);
  }
  if ((v10 & 0x4000) != 0)
  {
    self->_suppressesPermissionToExitDialog = *((unsigned char *)v4 + 193);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 21)) {
    -[APPBAdAction setTitleForExitDialog:](self, "setTitleForExitDialog:");
  }
  if (*((void *)v4 + 14)) {
    -[APPBAdAction setMessageForExitDialog:](self, "setMessageForExitDialog:");
  }
  if (*((void *)v4 + 9)) {
    -[APPBAdAction setCancelLabelForExitDialog:](self, "setCancelLabelForExitDialog:");
  }
  if (*((void *)v4 + 11)) {
    -[APPBAdAction setContinueLabelForExitDialog:](self, "setContinueLabelForExitDialog:");
  }
  __int16 v11 = *((_WORD *)v4 + 98);
  if ((v11 & 0x10) != 0)
  {
    self->_float confirmedClickTimeInterval = *((float *)v4 + 20);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v11 = *((_WORD *)v4 + 98);
    if ((v11 & 0x800) == 0)
    {
LABEL_30:
      if ((v11 & 8) == 0) {
        goto LABEL_31;
      }
      goto LABEL_70;
    }
  }
  else if ((*((_WORD *)v4 + 98) & 0x800) == 0)
  {
    goto LABEL_30;
  }
  self->_loadNewImpressionOnActionComplete = *((unsigned char *)v4 + 190);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v11 = *((_WORD *)v4 + 98);
  if ((v11 & 8) == 0)
  {
LABEL_31:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_70:
  self->_backgroundColor = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 98) & 0x2000) != 0)
  {
LABEL_32:
    self->_scrolling = *((unsigned char *)v4 + 192);
    *(_WORD *)&self->_has |= 0x2000u;
  }
LABEL_33:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v12 = *((id *)v4 + 19);
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        [(APPBAdAction *)self addStoryboardSizes:*(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
      }
      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v14);
  }

  __int16 v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x20) != 0)
  {
    self->_letterboxStoryboardColor = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v17 = *((_WORD *)v4 + 98);
    if ((v17 & 0x40) == 0)
    {
LABEL_42:
      if ((v17 & 0x80) == 0) {
        goto LABEL_43;
      }
      goto LABEL_74;
    }
  }
  else if ((v17 & 0x40) == 0)
  {
    goto LABEL_42;
  }
  self->_uint64_t storyboardPresentationOrientations = *((_DWORD *)v4 + 36);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x80) == 0)
  {
LABEL_43:
    if ((v17 & 0x400) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_uint64_t storyboardSupportedOrientations = *((_DWORD *)v4 + 40);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v17 = *((_WORD *)v4 + 98);
  if ((v17 & 0x400) == 0)
  {
LABEL_44:
    if ((v17 & 2) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_75:
  self->_allowSelfDismissal = *((unsigned char *)v4 + 189);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)v4 + 98) & 2) != 0)
  {
LABEL_45:
    self->_double autoDismissInterval = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_46:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = *((id *)v4 + 6);
  id v19 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v25;
    do
    {
      for (uint64_t k = 0; k != v20; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        -[APPBAdAction addAllowedExternalDomains:](self, "addAllowedExternalDomains:", *(void *)(*((void *)&v24 + 1) + 8 * (void)k), (void)v24);
      }
      id v20 = [v18 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v20);
  }

  if ((*((_WORD *)v4 + 98) & 0x200) != 0)
  {
    self->_adManagesPurchaseFlow = *((unsigned char *)v4 + 188);
    *(_WORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v4 + 22)) {
    -[APPBAdAction setTitleForPurchaseDialog:](self, "setTitleForPurchaseDialog:");
  }
  if (*((void *)v4 + 15)) {
    -[APPBAdAction setMessageForPurchaseDialog:](self, "setMessageForPurchaseDialog:");
  }
  if (*((void *)v4 + 8)) {
    -[APPBAdAction setCancelButtonForPurchaseDialog:](self, "setCancelButtonForPurchaseDialog:");
  }
  if (*((void *)v4 + 16)) {
    -[APPBAdAction setOkButtonForPurchaseDialog:](self, "setOkButtonForPurchaseDialog:");
  }
  __int16 v23 = *((_WORD *)v4 + 98);
  if (v23)
  {
    self->_adamIdentifier = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v23 = *((_WORD *)v4 + 98);
  }
  if ((v23 & 4) != 0)
  {
    self->_appStoreViewTemplate = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 4u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)action
{
  return self->_action;
}

- (void)setAction:(int)a3
{
  self->_uint64_t action = a3;
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)actionWebArchiveURL
{
  return self->_actionWebArchiveURL;
}

- (void)setActionWebArchiveURL:(id)a3
{
}

- (BOOL)prefersToOpenInstalledApp
{
  return self->_prefersToOpenInstalledApp;
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (BOOL)suppressesPermissionToExitDialog
{
  return self->_suppressesPermissionToExitDialog;
}

- (NSString)titleForExitDialog
{
  return self->_titleForExitDialog;
}

- (void)setTitleForExitDialog:(id)a3
{
}

- (NSString)messageForExitDialog
{
  return self->_messageForExitDialog;
}

- (void)setMessageForExitDialog:(id)a3
{
}

- (NSString)cancelLabelForExitDialog
{
  return self->_cancelLabelForExitDialog;
}

- (void)setCancelLabelForExitDialog:(id)a3
{
}

- (NSString)continueLabelForExitDialog
{
  return self->_continueLabelForExitDialog;
}

- (void)setContinueLabelForExitDialog:(id)a3
{
}

- (float)confirmedClickTimeInterval
{
  return self->_confirmedClickTimeInterval;
}

- (BOOL)loadNewImpressionOnActionComplete
{
  return self->_loadNewImpressionOnActionComplete;
}

- (unsigned)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)scrolling
{
  return self->_scrolling;
}

- (NSMutableArray)storyboardSizes
{
  return self->_storyboardSizes;
}

- (void)setStoryboardSizes:(id)a3
{
}

- (unsigned)letterboxStoryboardColor
{
  return self->_letterboxStoryboardColor;
}

- (BOOL)allowSelfDismissal
{
  return self->_allowSelfDismissal;
}

- (NSMutableArray)allowedExternalDomains
{
  return self->_allowedExternalDomains;
}

- (void)setAllowedExternalDomains:(id)a3
{
}

- (BOOL)adManagesPurchaseFlow
{
  return self->_adManagesPurchaseFlow;
}

- (NSString)titleForPurchaseDialog
{
  return self->_titleForPurchaseDialog;
}

- (void)setTitleForPurchaseDialog:(id)a3
{
}

- (NSString)messageForPurchaseDialog
{
  return self->_messageForPurchaseDialog;
}

- (void)setMessageForPurchaseDialog:(id)a3
{
}

- (NSString)cancelButtonForPurchaseDialog
{
  return self->_cancelButtonForPurchaseDialog;
}

- (void)setCancelButtonForPurchaseDialog:(id)a3
{
}

- (NSString)okButtonForPurchaseDialog
{
  return self->_okButtonForPurchaseDialog;
}

- (void)setOkButtonForPurchaseDialog:(id)a3
{
}

- (unint64_t)adamIdentifier
{
  return self->_adamIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_titleForExitDialog, 0);
  objc_storeStrong((id *)&self->_storyboardSizes, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_okButtonForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_messageForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_messageForExitDialog, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_continueLabelForExitDialog, 0);
  objc_storeStrong((id *)&self->_cancelLabelForExitDialog, 0);
  objc_storeStrong((id *)&self->_cancelButtonForPurchaseDialog, 0);
  objc_storeStrong((id *)&self->_allowedExternalDomains, 0);
  objc_storeStrong((id *)&self->_actionWebArchiveURL, 0);

  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
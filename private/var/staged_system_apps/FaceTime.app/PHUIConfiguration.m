@interface PHUIConfiguration
+ (BOOL)canAutoRotateInCallUIForFaceTime;
+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio;
+ (BOOL)canRotateInCallUIOverlayForFaceTime;
+ (BOOL)preferShorterStrings;
+ (BOOL)shouldUseExplicitLayoutDimensions;
+ (BOOL)shouldUseFullScreenPeoplePicker;
+ (BOOL)shouldUseSOSTightSpacing;
+ (double)ambientAudioRoutesButtonSize;
+ (double)ambientAudioRoutesInset;
+ (double)ambientAudioRoutesSymbolInset;
+ (double)ambientHorizontalPadding;
+ (double)ambientInCallControlSize;
+ (double)ambientInCallControlSpacing;
+ (double)ambientVerticalPadding;
+ (double)distanceBetweenEndButtonAndKeyPadLastRow;
+ (double)inCallControlButtonSizeRatio;
+ (double)inCallControlButtonVerticalSpacingRatio;
+ (double)inComingCallAndInCallControlsBottomPaddingRatio;
+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio;
+ (double)pipPartialHomeOffset;
+ (double)pipRadius;
+ (double)pipWallInset;
+ (double)pipWidth;
+ (double)yOffsetForDialerLCDView;
+ (double)yOffsetForDialerLCDViewForDxDevices;
+ (double)yOffsetForParticipantsView;
+ (double)yParticipantsViewAdjustmentForKeypad;
+ (unint64_t)ambientHorizontalSizeClass;
+ (unint64_t)ambientVerticalSizeClass;
+ (unint64_t)contentViewSizeForFaceTime;
+ (unint64_t)handsetDialerSize;
+ (unint64_t)handsetDialerSpacing;
+ (unint64_t)inCallBottomBarAssetSize;
+ (unint64_t)inCallBottomBarLowerOffset;
+ (unint64_t)inCallBottomBarMaxTitleSize;
+ (unint64_t)inCallBottomBarSpacing;
+ (unint64_t)inCallControlAlignment;
+ (unint64_t)inCallControlSize;
+ (unint64_t)inCallControlSpacing;
+ (unint64_t)inCallFaceTimeOverlayUISize;
+ (unint64_t)inCallSlideToAnswerSize;
+ (unint64_t)pipStatusBarPadding;
+ (unint64_t)screenSize;
+ (unint64_t)tableViewCellVerticalSpacing;
+ (unint64_t)voicemailLayoutSpacing;
@end

@implementation PHUIConfiguration

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (unint64_t)screenSize
{
  if (qword_1000BC070 != -1) {
    dispatch_once(&qword_1000BC070, &stru_1000A2298);
  }
  return qword_1000BC068;
}

+ (unint64_t)inCallControlAlignment
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031610;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC078 != -1) {
    dispatch_once(&qword_1000BC078, block);
  }
  return qword_1000BA040;
}

+ (unint64_t)inCallControlSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000316E4;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC088 != -1) {
    dispatch_once(&qword_1000BC088, block);
  }
  return qword_1000BC080;
}

+ (unint64_t)inCallBottomBarSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000317B4;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC098 != -1) {
    dispatch_once(&qword_1000BC098, block);
  }
  return qword_1000BC090;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031884;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0A8 != -1) {
    dispatch_once(&qword_1000BC0A8, block);
  }
  return qword_1000BC0A0;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031964;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0B8 != -1) {
    dispatch_once(&qword_1000BC0B8, block);
  }
  if (byte_1000BC0B0) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (unint64_t)inCallControlSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031A20;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0C0 != -1) {
    dispatch_once(&qword_1000BC0C0, block);
  }
  return qword_1000BA048;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031B00;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0D0 != -1) {
    dispatch_once(&qword_1000BC0D0, block);
  }
  if (byte_1000BC0C8) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)inCallBottomBarAssetSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031BD4;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0E0 != -1) {
    dispatch_once(&qword_1000BC0E0, block);
  }
  if (byte_1000BC0D8) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (double)ambientInCallControlSize
{
  unint64_t v2 = +[PHUIConfiguration screenSize] - 10;
  if (v2 < 6) {
    return dbl_10007D880[v2];
  }
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing] == (id)6) {
    return 104.0;
  }
  unint64_t v4 = +[PHUIConfiguration inCallBottomBarSpacing];
  double result = 90.0;
  if (v4 == 3) {
    return 104.0;
  }
  return result;
}

+ (unint64_t)ambientVerticalSizeClass
{
  unint64_t v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v6;
  }
  else {
    double v7 = v4;
  }
  return (int)v7 > 375;
}

+ (unint64_t)ambientHorizontalSizeClass
{
  unint64_t v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 >= v6) {
    double v7 = v4;
  }
  else {
    double v7 = v6;
  }
  return (int)v7 > 667;
}

+ (double)ambientVerticalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 37.0;
  if (v2 == 1) {
    return 44.0;
  }
  return result;
}

+ (double)ambientHorizontalPadding
{
  unint64_t v2 = +[PHUIConfiguration ambientHorizontalSizeClass];
  double result = 40.0;
  if (v2 == 1) {
    return 6.0;
  }
  return result;
}

+ (double)ambientInCallControlSpacing
{
  return 24.0;
}

+ (double)ambientAudioRoutesInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 16.0;
  if (v2 == 1) {
    return 26.0;
  }
  return result;
}

+ (double)ambientAudioRoutesButtonSize
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 40.0;
  if (v2 == 1) {
    return 54.0;
  }
  return result;
}

+ (double)ambientAudioRoutesSymbolInset
{
  unint64_t v2 = +[PHUIConfiguration ambientVerticalSizeClass];
  double result = 6.0;
  if (v2 == 1) {
    return 3.0;
  }
  return result;
}

+ (unint64_t)handsetDialerSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031EE0;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0F0 != -1) {
    dispatch_once(&qword_1000BC0F0, block);
  }
  return qword_1000BC0E8;
}

+ (unint64_t)handsetDialerSize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100031FB0;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC0F8 != -1) {
    dispatch_once(&qword_1000BC0F8, block);
  }
  return qword_1000BA050;
}

+ (double)yOffsetForDialerLCDView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032084;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC108 != -1) {
    dispatch_once(&qword_1000BC108, block);
  }
  return *(double *)&qword_1000BC100;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  double result = 0.0;
  if (v2 - 10 <= 5) {
    return dbl_10007D9E0[v2 - 10];
  }
  return result;
}

+ (double)yOffsetForParticipantsView
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000321BC;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC118 != -1) {
    dispatch_once(&qword_1000BC118, block);
  }
  return *(double *)&qword_1000BC110;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_1000BC128 != -1) {
    dispatch_once(&qword_1000BC128, &stru_1000A22B8);
  }
  return *(double *)&qword_1000BC120;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  unint64_t v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == (id)1;

  return v3;
}

+ (BOOL)canRotateInCallUIOverlayForFaceTime
{
  return 0;
}

+ (unint64_t)contentViewSizeForFaceTime
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032358;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC138 != -1) {
    dispatch_once(&qword_1000BC138, block);
  }
  return qword_1000BC130;
}

+ (double)pipWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032420;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC140 != -1) {
    dispatch_once(&qword_1000BC140, block);
  }
  return *(double *)&qword_1000BA058;
}

+ (double)pipWallInset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000324F4;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC148 != -1) {
    dispatch_once(&qword_1000BC148, block);
  }
  return *(double *)&qword_1000BA060;
}

+ (double)pipPartialHomeOffset
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000325C4;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC158 != -1) {
    dispatch_once(&qword_1000BC158, block);
  }
  return *(double *)&qword_1000BC150;
}

+ (double)pipRadius
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003268C;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC168 != -1) {
    dispatch_once(&qword_1000BC168, block);
  }
  return *(double *)&qword_1000BC160;
}

+ (unint64_t)pipStatusBarPadding
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032754;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC170 != -1) {
    dispatch_once(&qword_1000BC170, block);
  }
  return (unint64_t)*(double *)&qword_1000BA068;
}

+ (BOOL)shouldUseFullScreenPeoplePicker
{
  unint64_t v2 = (unint64_t)[a1 screenSize];
  return (v2 > 8) | (0x73u >> v2) & 1;
}

+ (unint64_t)inCallFaceTimeOverlayUISize
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032860;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC180 != -1) {
    dispatch_once(&qword_1000BC180, block);
  }
  if (byte_1000BC178) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032934;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC190 != -1) {
    dispatch_once(&qword_1000BC190, block);
  }
  if (byte_1000BC188) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (unint64_t)voicemailLayoutSpacing
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000329FC;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC1A0 != -1) {
    dispatch_once(&qword_1000BC1A0, block);
  }
  if (byte_1000BC198) {
    return 3;
  }
  else {
    return 2;
  }
}

+ (BOOL)preferShorterStrings
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032AB8;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC1B0 != -1) {
    dispatch_once(&qword_1000BC1B0, block);
  }
  return byte_1000BC1A8;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize] - 10 < (char *)6;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_1000BC1C0 != -1) {
    dispatch_once(&qword_1000BC1C0, &stru_1000A22D8);
  }
  return byte_1000BC1B8;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_10007D650[[a1 screenSize] == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_10007D660[[a1 screenSize] == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_10007D670[[a1 screenSize] == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  if ([a1 screenSize] == (id)1) {
    return 0.02998;
  }
  BOOL v3 = objc_opt_class();

  _[v3 inCallControlButtonVerticalSpacingRatio];
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

@end
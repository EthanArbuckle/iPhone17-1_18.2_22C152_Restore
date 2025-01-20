@interface SBPIPContentViewLayoutMetrics
+ (double)minimumLandscapePadding;
+ (double)unstashedPeripheryPadding;
+ (id)pegasusDefaultMetrics;
+ (id)pegasusDefaultMicroPIPMetrics;
+ (id)pegasusMetricsForContentType:(int64_t)a3;
+ (id)pegasusQNBacklinkMetrics;
+ (id)pegasusScreenSharingMetrics;
+ (id)pegasusVideoCallMetrics;
+ (id)systemNotesMetricsForPresentationMode:(int64_t)a3;
+ (void)microPIPLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5;
+ (void)videoCallLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5;
+ (void)videoContentLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5;
- (BOOL)prefersDefaultPosition;
- (CGSize)minimumStashedTabSize;
- (NSString)contentTypeIdentifier;
- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9;
- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9 prefersDefaultPosition:(BOOL)a10;
- (SBPIPContentViewLayoutMetricsSizePolicy)sizePolicy;
- (double)defaultCornerRadius;
- (double)padding;
- (double)paddingWhileStashed;
- (unint64_t)defaultPosition;
@end

@implementation SBPIPContentViewLayoutMetrics

+ (void)videoContentLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  SBHScreenTypeForCurrentDevice();
  char IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__SBPIPContentViewLayoutMetrics_Pegasus__videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v10 = IsMoreSpace;
  if (videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
LABEL_4:
  if (a4) {
    *a4 = (id) videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  }
  if (a5) {
    *a5 = (id) videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  }
}

void __125__SBPIPContentViewLayoutMetrics_Pegasus__videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28);
    }
    double v8 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
    if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_31_0);
    }
    double v9 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
    if (_SBPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_33);
    }
    uint64_t v10 = [(SBPIPContentViewLayoutSizePreferences *)v7 initWithLongSideMinimumSize:v8 longSideDefaultSize:v9 longSideMaximumSize:*(double *)&_SBPortraitScreenWidthMinusPadding___size shortSideMinimumSize:96.0];
    v11 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
    videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v10;

    v12 = [SBPIPContentViewLayoutSizePreferences alloc];
    if (_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_35);
    }
    uint64_t v13 = _SBFiveEighthsPortraitScreenWidthMinusPadding___size;
    if (_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_37_0);
    }
    uint64_t v14 = _SBSevenEighthsPortraitScreenWidthMinusPadding___size;
    if (_SBPortraitScreenWidthMinusPadding_onceToken != -1) {
      dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_33);
    }
    double v15 = *(double *)&_SBPortraitScreenWidthMinusPadding___size;
    double v16 = 96.0;
    v17 = v12;
    double v18 = *(double *)&v13;
    double v19 = *(double *)&v14;
    goto LABEL_30;
  }
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_29;
    }
LABEL_19:
    int v20 = __sb__runningInSpringBoard();
    char v21 = v20;
    if (v20)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v1 = [MEMORY[0x1E4F42D90] mainScreen];
      [v1 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v23 = v22;
    double v24 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
    if ((v21 & 1) == 0) {

    }
    if ((v6 & 1) == 0) {
    if (v23 >= v24)
    }
    {
      double v25 = dbl_1D8FD08F0[*(unsigned char *)(a1 + 32) == 0];
      v26 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:280.0 longSideDefaultSize:400.0 longSideMaximumSize:v25 shortSideMinimumSize:136.0];
      v27 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
      videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v26;

      v28 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:400.0 longSideDefaultSize:467.0 longSideMaximumSize:v25 shortSideMinimumSize:136.0];
      v29 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
      videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v28;

      v30 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:220.0 longSideDefaultSize:335.0 longSideMaximumSize:v25 shortSideMinimumSize:136.0];
      goto LABEL_31;
    }
    goto LABEL_29;
  }
  uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
  if ([(id)v4 userInterfaceIdiom] == 1) {
    goto LABEL_19;
  }

LABEL_29:
  double v31 = dbl_1D8FD08E0[*(unsigned char *)(a1 + 32) == 0];
  v32 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:220.0 longSideDefaultSize:335.0 longSideMaximumSize:v31 shortSideMinimumSize:136.0];
  v33 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v32;

  v17 = [SBPIPContentViewLayoutSizePreferences alloc];
  double v19 = 400.0;
  double v18 = 335.0;
  double v15 = v31;
  double v16 = 136.0;
LABEL_30:
  uint64_t v34 = [(SBPIPContentViewLayoutSizePreferences *)v17 initWithLongSideMinimumSize:v18 longSideDefaultSize:v19 longSideMaximumSize:v15 shortSideMinimumSize:v16];
  v35 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = v34;

  v30 = (SBPIPContentViewLayoutSizePreferences *)(id)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
LABEL_31:
  v36 = (void *)videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  videoContentLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref = (uint64_t)v30;
}

+ (void)videoCallLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  SBHScreenTypeForCurrentDevice();
  char IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __122__SBPIPContentViewLayoutMetrics_Pegasus__videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v10 = IsMoreSpace;
  if (videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
LABEL_4:
  if (a4) {
    *a4 = (id) videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  }
  if (a5) {
    *a5 = (id) videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  }
}

void __122__SBPIPContentViewLayoutMetrics_Pegasus__videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    int v5 = __sb__runningInSpringBoard();
    char v6 = v5;
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(id)v4 userInterfaceIdiom] != 1)
      {

        goto LABEL_38;
      }
    }
    int v25 = __sb__runningInSpringBoard();
    char v26 = v25;
    if (v25)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v1 = [MEMORY[0x1E4F42D90] mainScreen];
      [v1 _referenceBounds];
    }
    BSSizeRoundForScale();
    double v28 = v27;
    double v29 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
    if ((v26 & 1) == 0) {

    }
    if ((v6 & 1) == 0) {
    if (v28 >= v29)
    }
    {
      if (*(unsigned char *)(a1 + 32)) {
        double v30 = 464.0;
      }
      else {
        double v30 = 400.0;
      }
      double v31 = dbl_1D8FD0900[*(unsigned char *)(a1 + 32) == 0];
      *(double *)&uint64_t v32 = 220.0;
      v33 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:220.0 longSideDefaultSize:280.0 longSideMaximumSize:dbl_1D8FD08E0[*(unsigned char *)(a1 + 32) == 0] shortSideMinimumSize:136.0];
      uint64_t v34 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
      videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v33;

      v35 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:220.0 longSideDefaultSize:280.0 longSideMaximumSize:v30 shortSideMinimumSize:136.0];
      v36 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
      videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v35;

      double v22 = [SBPIPContentViewLayoutSizePreferences alloc];
      double v23 = 160.0;
      goto LABEL_42;
    }
LABEL_38:
    if (*(unsigned char *)(a1 + 32)) {
      double v37 = 464.0;
    }
    else {
      double v37 = 400.0;
    }
    double v38 = dbl_1D8FD0900[*(unsigned char *)(a1 + 32) == 0];
    double v31 = dbl_1D8FD0910[*(unsigned char *)(a1 + 32) == 0];
    *(double *)&uint64_t v32 = 160.0;
    v39 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:160.0 longSideDefaultSize:220.0 longSideMaximumSize:v37 shortSideMinimumSize:136.0];
    v40 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
    videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = (uint64_t)v39;

    v41 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:160.0 longSideDefaultSize:220.0 longSideMaximumSize:v38 shortSideMinimumSize:136.0];
    v42 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
    videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = (uint64_t)v41;

    double v22 = [SBPIPContentViewLayoutSizePreferences alloc];
    double v23 = 160.0;
LABEL_42:
    double v24 = *(double *)&v32;
    double v20 = v31;
    double v21 = 136.0;
    goto LABEL_43;
  }
  v7 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28);
  }
  double v8 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBFiveEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_35);
  }
  double v9 = *(double *)&_SBFiveEighthsPortraitScreenWidthMinusPadding___size;
  if (_SBPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_33);
  }
  uint64_t v10 = [(SBPIPContentViewLayoutSizePreferences *)v7 initWithLongSideMinimumSize:v8 longSideDefaultSize:v9 longSideMaximumSize:*(double *)&_SBPortraitScreenWidthMinusPadding___size shortSideMinimumSize:96.0];
  v11 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v10;

  v12 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28);
  }
  double v13 = *(double *)&_SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_31_0);
  }
  double v14 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
  if (_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBSevenEighthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_37_0);
  }
  uint64_t v15 = [(SBPIPContentViewLayoutSizePreferences *)v12 initWithLongSideMinimumSize:v13 longSideDefaultSize:v14 longSideMaximumSize:*(double *)&_SBSevenEighthsPortraitScreenWidthMinusPadding___size shortSideMinimumSize:96.0];
  double v16 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____portraitPIPSizePref = v15;

  v17 = [SBPIPContentViewLayoutSizePreferences alloc];
  if (_SBSeventeenFiftiethsScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBSeventeenFiftiethsScreenWidthMinusPadding_onceToken, &__block_literal_global_39_0);
  }
  uint64_t v18 = _SBSeventeenFiftiethsScreenWidthMinusPadding___size;
  if (_SBHalfPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBHalfPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_28);
  }
  uint64_t v19 = _SBHalfPortraitScreenWidthMinusPadding___size;
  if (_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken != -1) {
    dispatch_once(&_SBThreeFourthsPortraitScreenWidthMinusPadding_onceToken, &__block_literal_global_31_0);
  }
  double v20 = *(double *)&_SBThreeFourthsPortraitScreenWidthMinusPadding___size;
  double v21 = 96.0;
  double v22 = v17;
  double v23 = *(double *)&v18;
  double v24 = *(double *)&v19;
LABEL_43:
  uint64_t v43 = [(SBPIPContentViewLayoutSizePreferences *)v22 initWithLongSideMinimumSize:v23 longSideDefaultSize:v24 longSideMaximumSize:v20 shortSideMinimumSize:v21];
  v44 = (void *)videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref;
  videoCallLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____squarePIPSizePref = v43;
}

+ (void)microPIPLandscapeSizePreferences:(id *)a3 portraitSizePreferences:(id *)a4 squareSizePreferences:(id *)a5
{
  SBHScreenTypeForCurrentDevice();
  char IsMoreSpace = SBHScreenTypeIsMoreSpace();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__SBPIPContentViewLayoutMetrics_Pegasus__microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  char v10 = IsMoreSpace;
  if (microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences__onceToken, block);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
LABEL_4:
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
}

void __121__SBPIPContentViewLayoutMetrics_Pegasus__microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences___block_invoke(uint64_t a1)
{
  v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    double v8 = 66.0;
    goto LABEL_21;
  }
  int v5 = __sb__runningInSpringBoard();
  char v6 = v5;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v4 userInterfaceIdiom] != 1)
    {

      goto LABEL_17;
    }
  }
  int v9 = __sb__runningInSpringBoard();
  char v10 = v9;
  if (v9)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v1 = [MEMORY[0x1E4F42D90] mainScreen];
    [v1 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v12 = v11;
  double v13 = *(double *)(MEMORY[0x1E4FA6E50] + 264);
  if ((v10 & 1) == 0) {

  }
  if ((v6 & 1) == 0) {
  if (v12 >= v13)
  }
  {
    v7 = [SBPIPContentViewLayoutSizePreferences alloc];
    BOOL v14 = *(unsigned char *)(a1 + 32) == 0;
    double v15 = 102.0;
    double v16 = 88.0;
    goto LABEL_18;
  }
LABEL_17:
  v7 = [SBPIPContentViewLayoutSizePreferences alloc];
  BOOL v14 = *(unsigned char *)(a1 + 32) == 0;
  double v15 = 84.0;
  double v16 = 72.0;
LABEL_18:
  if (v14) {
    double v8 = v16;
  }
  else {
    double v8 = v15;
  }
LABEL_21:
  uint64_t v17 = [(SBPIPContentViewLayoutSizePreferences *)v7 initWithLongSideMinimumSize:44.0 longSideDefaultSize:44.0 longSideMaximumSize:v8 shortSideMinimumSize:0.0];
  uint64_t v18 = (void *)microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref;
  microPIPLandscapeSizePreferences_portraitSizePreferences_squareSizePreferences____landscapePIPSizePref = v17;
}

+ (id)pegasusDefaultMetrics
{
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  [a1 videoContentLandscapeSizePreferences:&v12 portraitSizePreferences:&v11 squareSizePreferences:&v10];
  id v2 = v12;
  id v3 = v11;
  id v4 = v10;
  int v5 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v2 portrait:v3 square:v4];

  char v6 = [SBPIPContentViewLayoutMetrics alloc];
  double v7 = _SBPIPContentViewPaddingWhileStashed(0);
  double v8 = [(SBPIPContentViewLayoutMetrics *)v6 initWithContentTypeIdentifier:@"VideoContent", v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0 padding paddingWhileStashed minimumStashedTabSize defaultCornerRadius sizePolicy defaultPosition];

  return v8;
}

+ (id)pegasusVideoCallMetrics
{
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  [a1 videoCallLandscapeSizePreferences:&v12 portraitSizePreferences:&v11 squareSizePreferences:&v10];
  id v2 = v12;
  id v3 = v11;
  id v4 = v10;
  int v5 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v2 portrait:v3 square:v4];

  char v6 = [SBPIPContentViewLayoutMetrics alloc];
  double v7 = _SBPIPContentViewPaddingWhileStashed(0);
  double v8 = [(SBPIPContentViewLayoutMetrics *)v6 initWithContentTypeIdentifier:@"VideoCall", v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0 padding paddingWhileStashed minimumStashedTabSize defaultCornerRadius sizePolicy defaultPosition];

  return v8;
}

+ (id)pegasusScreenSharingMetrics
{
  id v11 = 0;
  id v12 = 0;
  id v10 = 0;
  [a1 screenSharingLandscapeSizePreferences:&v12 portraitSizePreferences:&v11 squareSizePreferences:&v10];
  id v2 = v12;
  id v3 = v11;
  id v4 = v10;
  int v5 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v2 portrait:v3 square:v4];

  char v6 = [SBPIPContentViewLayoutMetrics alloc];
  double v7 = _SBPIPContentViewPaddingWhileStashed(0);
  double v8 = [(SBPIPContentViewLayoutMetrics *)v6 initWithContentTypeIdentifier:@"ScreenSharing", v5, 3, v7, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0 padding paddingWhileStashed minimumStashedTabSize defaultCornerRadius sizePolicy defaultPosition];

  return v8;
}

+ (id)pegasusDefaultMicroPIPMetrics
{
  id v10 = 0;
  id v11 = 0;
  id v9 = 0;
  [a1 microPIPLandscapeSizePreferences:&v11 portraitSizePreferences:&v10 squareSizePreferences:&v9];
  id v2 = v11;
  id v3 = v10;
  id v4 = v9;
  int v5 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v2 portrait:v3 square:v4];

  char v6 = [SBPIPContentViewLayoutMetrics alloc];
  double v7 = [(SBPIPContentViewLayoutMetrics *)v6 initWithContentTypeIdentifier:@"MicroPIP", v5, 3, 0.0, 0.0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), 0.0 padding paddingWhileStashed minimumStashedTabSize defaultCornerRadius sizePolicy defaultPosition];

  return v7;
}

+ (id)pegasusQNBacklinkMetrics
{
  id v2 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:112.0 longSideDefaultSize:112.0 longSideMaximumSize:112.0 shortSideMinimumSize:112.0];
  id v3 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v2 portrait:v2 square:v2];

  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  int v5 = [SBPIPContentViewLayoutMetrics alloc];
  double v6 = _SBPIPContentViewPaddingWhileStashed(0);
  double v7 = [(SBPIPContentViewLayoutMetrics *)v5 initWithContentTypeIdentifier:@"QNBacklink", v3, v4, 1, v6, _SBPIPContentViewPaddingWhileStashed(1), 24.0, 96.0, 0.0 padding paddingWhileStashed minimumStashedTabSize defaultCornerRadius sizePolicy defaultPosition prefersDefaultPosition];

  return v7;
}

+ (id)pegasusMetricsForContentType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      objc_msgSend(a1, "pegasusDefaultMetrics", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(a1, "pegasusVideoCallMetrics", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      objc_msgSend(a1, "pegasusScreenSharingMetrics", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6:
      objc_msgSend(a1, "pegasusQNBacklinkMetrics", v3);
      a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:
      break;
    default:
      break;
  }
  return a1;
}

- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9 prefersDefaultPosition:(BOOL)a10
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v19 = a3;
  id v20 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBPIPContentViewLayoutMetrics;
  double v21 = [(SBPIPContentViewLayoutMetrics *)&v25 init];
  if (v21)
  {
    uint64_t v22 = [v19 copy];
    contentTypeIdentifier = v21->_contentTypeIdentifier;
    v21->_contentTypeIdentifier = (NSString *)v22;

    v21->_padding = a4;
    v21->_paddingWhileStashed = a5;
    v21->_minimumStashedTabSize.CGFloat width = width;
    v21->_minimumStashedTabSize.CGFloat height = height;
    v21->_defaultCornerRadius = a7;
    objc_storeStrong((id *)&v21->_sizePolicy, a8);
    v21->_defaultPosition = a9;
    v21->_prefersDefaultPosition = a10;
  }

  return v21;
}

- (SBPIPContentViewLayoutMetrics)initWithContentTypeIdentifier:(id)a3 padding:(double)a4 paddingWhileStashed:(double)a5 minimumStashedTabSize:(CGSize)a6 defaultCornerRadius:(double)a7 sizePolicy:(id)a8 defaultPosition:(unint64_t)a9
{
  return -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:](self, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:prefersDefaultPosition:", a3, a8, a9, 0, a4, a5, a6.width, a6.height, a7);
}

+ (double)minimumLandscapePadding
{
  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || (double v2 = 0.0, SBFEffectiveDeviceClass() == 1))
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        return 16.0;
      }
      else {
        return 0.0;
      }
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    double v2 = 0.0;
    if (![v3 userInterfaceIdiom])
    {
      if (SBFEffectiveHomeButtonType() == 2) {
        double v2 = 16.0;
      }
      else {
        double v2 = 0.0;
      }
    }
  }
  return v2;
}

+ (double)unstashedPeripheryPadding
{
  return 4.0;
}

- (NSString)contentTypeIdentifier
{
  return self->_contentTypeIdentifier;
}

- (double)padding
{
  return self->_padding;
}

- (double)paddingWhileStashed
{
  return self->_paddingWhileStashed;
}

- (CGSize)minimumStashedTabSize
{
  double width = self->_minimumStashedTabSize.width;
  double height = self->_minimumStashedTabSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (SBPIPContentViewLayoutMetricsSizePolicy)sizePolicy
{
  return self->_sizePolicy;
}

- (unint64_t)defaultPosition
{
  return self->_defaultPosition;
}

- (BOOL)prefersDefaultPosition
{
  return self->_prefersDefaultPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizePolicy, 0);
  objc_storeStrong((id *)&self->_contentTypeIdentifier, 0);
}

+ (id)systemNotesMetricsForPresentationMode:(int64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = @"SystemNotes-Thumbnail";
    double v5 = 121.0;
    double v4 = 121.0;
  }
  else if (a3)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    id v9 = SBSSystemNotesPresentationModeDescription();
    [v8 handleFailureInMethod:a2, a1, @"SBPIPContentViewLayoutMetrics+SystemNotes.m", 73, @"invalid presentationMode %@ received", v9 object file lineNumber description];

    uint64_t v3 = 0;
    double v5 = 0.0;
    double v4 = 0.0;
  }
  else
  {
    uint64_t v3 = @"SystemNotes-Window";
    double v4 = 560.0;
    double v5 = 455.0;
  }
  double v10 = SBSystemNotesMaximumWindowSize();
  double v11 = SBSystemNotesMaximumWindowSize();
  if (v10 < v12) {
    double v10 = v12;
  }
  double v13 = +[SBPIPContentViewLayoutMetrics pegasusDefaultMetrics];
  BOOL v14 = [[SBPIPContentViewLayoutSizePreferences alloc] initWithLongSideMinimumSize:v4 longSideDefaultSize:v5 longSideMaximumSize:v10 shortSideMinimumSize:v5];
  double v15 = [[SBPIPContentViewLayoutMetricsSizePolicy alloc] initWithSizePreferencesForLandscape:v14 portrait:0 square:0];
  double v16 = [SBPIPContentViewLayoutMetrics alloc];
  [v13 padding];
  double v18 = v17;
  [v13 paddingWhileStashed];
  double v20 = v19;
  [v13 minimumStashedTabSize];
  double v22 = v21;
  double v24 = v23;
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = 2;
  }
  char v26 = -[SBPIPContentViewLayoutMetrics initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:](v16, "initWithContentTypeIdentifier:padding:paddingWhileStashed:minimumStashedTabSize:defaultCornerRadius:sizePolicy:defaultPosition:", v3, v15, v25, v18, v20, v22, v24, 34.0);

  return v26;
}

@end
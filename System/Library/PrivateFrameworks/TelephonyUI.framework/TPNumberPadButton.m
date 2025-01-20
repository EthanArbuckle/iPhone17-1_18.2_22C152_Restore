@interface TPNumberPadButton
+ (BOOL)isCarPlay;
+ (BOOL)usesButtonColorMatrixFilters;
+ (BOOL)usesButtonSaturationFilters;
+ (BOOL)usesEmergencyCallButtonColorMatrixFilters;
+ (BOOL)usesTelephonyGlyphsWhereAvailable;
+ (CGRect)circleBounds;
+ (CGSize)defaultSize;
+ (UIEdgeInsets)paddingOutsideRing;
+ (double)highlightedCircleViewAlpha;
+ (double)horizontalPadding;
+ (double)outerCircleDiameter;
+ (double)unhighlightedCircleViewAlpha;
+ (double)verticalPadding;
+ (id)disabledImageForCharacter:(int64_t)a3;
+ (id)imageForCharacter:(int64_t)a3;
+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4;
+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4 whiteVersion:(BOOL)a5;
+ (id)localizedLettersForCharacter:(int64_t)a3;
+ (id)scriptKey;
+ (void)loadNumberPadKeyPrototypeView;
+ (void)resetLocale;
+ (void)resetLocaleIfNeeded;
- (CALayer)glyphLayer;
- (CALayer)highlightedGlyphLayer;
- (TPRevealingRingView)revealingRingView;
- (UIColor)buttonColor;
- (UIColor)color;
- (UIColor)highlightedButtonColor;
- (UIView)circleView;
- (UIVisualEffectView)backDropVisualEffectView;
- (id)defaultColor;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initForCharacter:(int64_t)a3;
- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4;
- (int64_t)character;
- (void)highlightCircleView:(BOOL)a3 animated:(BOOL)a4;
- (void)reloadImagesForCurrentCharacter;
- (void)setBackDropVisualEffectView:(id)a3;
- (void)setCharacter:(int64_t)a3;
- (void)setCircleView:(id)a3;
- (void)setColor:(id)a3;
- (void)setGlyphLayer:(id)a3;
- (void)setGreyedOut:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlightedGlyphLayer:(id)a3;
- (void)updateBackgroundMaterial:(id)a3;
@end

@implementation TPNumberPadButton

+ (id)localizedLettersForCharacter:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"А Б В Г";
      }
      if (!uiLanguage) {
        return @"ب ت ة ث";
      }
      if (uiLanguage == 5) {
        return @"А Ә Б В Г";
      }
      if (uiLanguage != 2) {
        goto LABEL_25;
      }
      return @"ד ה ו";
    case 2:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"Д Е Ж З";
      }
LABEL_25:
      if (!v3) {
        return @"ا ء";
      }
      if (v3 == 5) {
        return @"Ғ Д Е Ж З";
      }
      if (v3 != 2) {
        goto LABEL_29;
      }
      return @"א ב ג";
    case 3:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"И Й К Л";
      }
LABEL_29:
      if (!v3) {
        return @"س ش ص ض";
      }
      if (v3 == 5) {
        return @"И Й К Қ Л";
      }
      if (v3 != 2) {
        goto LABEL_33;
      }
      return @"מ נ";
    case 4:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"М Н О П";
      }
LABEL_33:
      if (!v3) {
        return @"د ذ ر ز";
      }
      if (v3 == 5) {
        return @"М Н Ң О Ө";
      }
      if (v3 != 2) {
        goto LABEL_37;
      }
      return @"י כ ל";
    case 5:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"Р С Т У";
      }
LABEL_37:
      if (!v3) {
        return @"ج ح خ";
      }
      if (v3 == 5) {
        return @"П Р С Т У";
      }
      if (v3 != 2) {
        goto LABEL_41;
      }
      return @"ז ח ט";
    case 6:
      unint64_t v3 = uiLanguage;
      if ((unint64_t)(uiLanguage - 3) < 2) {
        return @"Ф Х Ц Ч";
      }
LABEL_41:
      if (!v3) {
        return @"ن ه و ي";
      }
      if (v3 == 5) {
        return @"Ұ Ү Ф Х Ц";
      }
      if (v3 != 2) {
        goto LABEL_16;
      }
      return @"ר ש ת";
    case 7:
      unint64_t v3 = uiLanguage;
LABEL_16:
      if (v3 >= 6 || ((0x3Du >> v3) & 1) == 0) {
        goto LABEL_18;
      }
      v5 = off_1E647C438;
      goto LABEL_46;
    case 8:
      unint64_t v3 = uiLanguage;
LABEL_18:
      if (v3 >= 6) {
        goto LABEL_20;
      }
      v5 = off_1E647C468;
LABEL_46:
      id result = v5[v3];
      break;
    default:
LABEL_20:
      id result = &stru_1F1E807C8;
      break;
  }
  return result;
}

+ (CGSize)defaultSize
{
  [(id)objc_opt_class() outerCircleDiameter];
  double v3 = v2;
  [(id)objc_opt_class() horizontalPadding];
  double v5 = v3 + v4 * 2.0;
  [(id)objc_opt_class() outerCircleDiameter];
  double v7 = v6;
  [(id)objc_opt_class() verticalPadding];
  double v9 = v7 + v8 * 2.0;
  double v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

+ (CGRect)circleBounds
{
  [(id)objc_opt_class() defaultSize];
  double v3 = v2;
  [(id)objc_opt_class() outerCircleDiameter];
  double v5 = (v3 - v4) * 0.5;
  [(id)objc_opt_class() defaultSize];
  double v7 = v6;
  [(id)objc_opt_class() outerCircleDiameter];
  double v9 = (v7 - v8) * 0.5;
  [(id)objc_opt_class() outerCircleDiameter];
  double v11 = v10;
  [(id)objc_opt_class() outerCircleDiameter];
  double v13 = v12;
  double v14 = v5;
  double v15 = v9;
  double v16 = v11;
  result.size.height = v13;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (double)outerCircleDiameter
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v3 = [v2 screenSizeCategory];

  switch(v3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
    case 7:
    case 8:
    case 9:
    case 11:
      double result = 75.0;
      break;
    case 3:
      double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      int v6 = [v5 isUserInterfaceIdiomPad];

      double result = 85.0;
      if (v6) {
        double result = 83.3000031;
      }
      break;
    case 5:
      double result = 78.0;
      break;
    case 6:
      double result = 85.0;
      break;
    case 10:
      double result = 88.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (UIEdgeInsets)paddingOutsideRing
{
  [(id)objc_opt_class() verticalPadding];
  double v3 = v2;
  [(id)objc_opt_class() horizontalPadding];
  double v5 = v4;
  [(id)objc_opt_class() verticalPadding];
  double v7 = v6;
  [(id)objc_opt_class() horizontalPadding];
  double v9 = v8;
  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  result.right = v9;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

+ (id)imageForCharacter:(int64_t)a3
{
  return 0;
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4
{
  return 0;
}

+ (BOOL)usesTelephonyGlyphsWhereAvailable
{
  return 0;
}

+ (BOOL)usesButtonSaturationFilters
{
  return 1;
}

+ (BOOL)usesButtonColorMatrixFilters
{
  return 0;
}

+ (BOOL)usesEmergencyCallButtonColorMatrixFilters
{
  return 0;
}

+ (BOOL)isCarPlay
{
  return 0;
}

+ (id)imageForCharacter:(int64_t)a3 highlighted:(BOOL)a4 whiteVersion:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  +[TPNumberPadButton loadNumberPadKeyPrototypeView];
  +[TPNumberPadButton resetLocaleIfNeeded];
  int64_t v40 = a3;
  switch(a3)
  {
    case 0:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89870];
      unsigned int v41 = 0;
      goto LABEL_18;
    case 1:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89888];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"A B C";
      break;
    case 2:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E898A0];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"D E F";
      break;
    case 3:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E898B8];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"G H I";
      break;
    case 4:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E898D0];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"J K L";
      break;
    case 5:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E898E8];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"M N O";
      break;
    case 6:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89900];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"P Q R S";
      break;
    case 7:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89918];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"T U V";
      break;
    case 8:
      id v9 = a1;
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89930];
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = @"W X Y Z";
      break;
    case 9:
      id v9 = a1;
      double v10 = @"*";
      goto LABEL_17;
    case 10:
      double v10 = [(id)numberFormatter stringFromNumber:&unk_1F1E89858];
      id v9 = a1;
      int v12 = [a1 usesTelephonyGlyphsWhereAvailable];
      int v43 = 0;
      unsigned int v41 = v12 ^ 1;
      if (v12) {
        double v11 = @"+";
      }
      else {
        double v11 = &stru_1F1E807C8;
      }
      break;
    case 11:
      id v9 = a1;
      double v10 = @"#";
LABEL_17:
      unsigned int v41 = 1;
LABEL_18:
      int v43 = 1;
      double v11 = &stru_1F1E807C8;
      break;
    default:
      id v9 = a1;
      unsigned int v41 = 0;
      int v43 = 1;
      double v11 = &stru_1F1E807C8;
      double v10 = &stru_1F1E807C8;
      break;
  }
  double v13 = NSString;
  double v14 = +[TPNumberPadButton scriptKey];
  if (v6) {
    double v15 = @"hi";
  }
  else {
    double v15 = &stru_1F1E807C8;
  }
  BOOL v42 = v5;
  if (v5) {
    double v16 = @"white";
  }
  else {
    double v16 = @"mask";
  }
  if ([v9 usesBoldAssets]) {
    v17 = @"-bold";
  }
  else {
    v17 = &stru_1F1E807C8;
  }
  int v18 = [v9 isCarPlay];
  v19 = @"-carplay";
  if (!v18) {
    v19 = &stru_1F1E807C8;
  }
  v38 = v17;
  v20 = v11;
  v21 = [v13 stringWithFormat:@"%@-%@-%@-%@-%@%@%@.png", v14, v10, v11, v15, v16, v38, v19];

  v22 = +[TPFileStorageManager sharedInstance];
  v23 = [v22 imageWithName:v21];

  if (v23)
  {
    id v24 = v23;
  }
  else
  {
    BOOL v39 = v6;
    v25 = [v9 localizedLettersForCharacter:1];
    uint64_t v26 = v43 & ([v25 isEqualToString:&stru_1F1E807C8] ^ 1);

    if (v26 == 1)
    {
      uint64_t v27 = [v9 localizedLettersForCharacter:v40];
      v28 = v20;
    }
    else
    {
      v28 = 0;
      uint64_t v27 = (uint64_t)v20;
    }
    objc_sync_enter(@"lock");
    v20 = (void *)v27;
    [(id)numberPadKeyPrototypeView setDigit:v10 primaryLetters:v27 secondaryLetters:v28];
    v29 = (void *)numberPadKeyPrototypeView;
    uint64_t v30 = uiLanguage;
    [(id)objc_opt_class() defaultSize];
    double v32 = v31;
    uint64_t v33 = [v9 isCarPlay];
    v34 = [MEMORY[0x1E4FB1BA8] mainScreen];
    objc_msgSend(v29, "setFontStylesForHighlightState:language:showLocalizedLetters:shouldCenterDigit:fontColor:circleDiameter:isCarPlay:screenSizeCategory:", v39, v30, v26, v41, v42, v33, v32, objc_msgSend(v34, "screenSizeCategory"));

    [(id)numberPadKeyPrototypeView doLayoutNow];
    *(void *)&v45.width = prototypeViewSideDimension;
    *(void *)&v45.height = prototypeViewSideDimension;
    UIGraphicsBeginImageContextWithOptions(v45, 0, 0.0);
    v35 = [(id)numberPadKeyPrototypeView layer];
    [v35 renderInContext:UIGraphicsGetCurrentContext()];

    UIGraphicsGetImageFromCurrentImageContext();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v36 = +[TPFileStorageManager sharedInstance];
    [v36 saveImage:v24 withName:v21];

    objc_sync_exit(@"lock");
  }

  return v24;
}

+ (void)loadNumberPadKeyPrototypeView
{
  if (loadNumberPadKeyPrototypeView_onceToken != -1) {
    dispatch_once(&loadNumberPadKeyPrototypeView_onceToken, &__block_literal_global_7);
  }
}

void __50__TPNumberPadButton_loadNumberPadKeyPrototypeView__block_invoke()
{
  v0 = [TPNumberPadKey alloc];
  uint64_t v1 = -[TPNumberPadKey initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v2 = (void *)numberPadKeyPrototypeView;
  numberPadKeyPrototypeView = v1;

  if (numberPadKeyPrototypeView)
  {
    objc_msgSend((id)numberPadKeyPrototypeView, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C70], *(double *)(MEMORY[0x1E4FB2C70] + 8));
    prototypeViewSideDimension = v3;
    uint64_t v4 = objc_opt_new();
    BOOL v5 = (void *)numberFormatter;
    numberFormatter = v4;

    +[TPNumberPadButton resetLocale];
  }
  else
  {
    BOOL v6 = (void *)numberFormatter;
    numberFormatter = 0;
  }
}

+ (void)resetLocaleIfNeeded
{
  if (numberFormatter)
  {
    double v2 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v3 = [(id)numberFormatter locale];

    if (v2 != v3)
    {
      +[TPNumberPadButton resetLocale];
    }
  }
}

+ (id)scriptKey
{
  if ((unint64_t)uiLanguage > 5) {
    return @"other";
  }
  else {
    return off_1E647C498[uiLanguage];
  }
}

+ (void)resetLocale
{
  double v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  [(id)numberFormatter setLocale:v2];

  TPNumberPadKeyResetLocale();
  uint64_t v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v6 = [v3 firstObject];

  if ([v6 hasPrefix:@"ar"])
  {
    uint64_t v4 = 0;
  }
  else if ([v6 hasPrefix:@"bg"])
  {
    uint64_t v4 = 4;
  }
  else if ([v6 hasPrefix:@"he"])
  {
    uint64_t v4 = 2;
  }
  else if ([v6 hasPrefix:@"kk"])
  {
    uint64_t v4 = 5;
  }
  else if ([v6 hasPrefix:@"ru"])
  {
    uint64_t v4 = 3;
  }
  else
  {
    int v5 = [v6 hasPrefix:@"en"];
    uint64_t v4 = 6;
    if (v5) {
      uint64_t v4 = 1;
    }
  }
  uiLanguage = v4;
}

+ (double)verticalPadding
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v3 = [v2 screenSizeCategory];

  switch(v3)
  {
    case 1:
    case 8:
    case 9:
      double result = 4.5;
      break;
    case 2:
      int v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      char v6 = [v5 isUserInterfaceIdiomPad];

      double result = 5.5;
      if ((v6 & 1) == 0) {
        goto LABEL_6;
      }
      break;
    case 3:
    case 6:
LABEL_6:
      double result = 7.5;
      break;
    case 4:
    case 7:
    case 11:
      double result = 8.0;
      break;
    case 5:
      double result = 9.0;
      break;
    case 10:
      double result = 10.0;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (double)horizontalPadding
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v3 = [v2 screenSizeCategory];

  switch(v3)
  {
    case 1:
    case 8:
    case 9:
      double v4 = 10.0;
      break;
    case 2:
      double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
      if ([v7 isUserInterfaceIdiomPad]) {
        double v4 = 10.0;
      }
      else {
        double v4 = 14.0;
      }

      break;
    case 3:
    case 6:
      int v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
      int v6 = [v5 isUserInterfaceIdiomPad];

      if (v6) {
        double v4 = 13.6000004;
      }
      else {
        double v4 = 15.0;
      }
      break;
    case 4:
      double v4 = 13.6000004;
      break;
    case 5:
    case 10:
      double v4 = 12.0;
      break;
    case 7:
    case 11:
      double v4 = 13.5;
      break;
    default:
      double v4 = 0.0;
      break;
  }
  return v4;
}

+ (double)unhighlightedCircleViewAlpha
{
  return 0.200000003;
}

+ (double)highlightedCircleViewAlpha
{
  return 0.349999994;
}

- (UIColor)highlightedButtonColor
{
  return 0;
}

+ (id)disabledImageForCharacter:(int64_t)a3
{
  uint64_t v3 = [(id)objc_opt_class() imageForCharacter:a3 highlighted:0 whiteVersion:0];
  double v4 = [MEMORY[0x1E4FB1618] systemGrayColor];
  int v5 = [v3 _flatImageWithColor:v4];

  return v5;
}

- (id)initForCharacter:(int64_t)a3
{
  return [(TPNumberPadButton *)self initForCharacter:a3 style:0];
}

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  v55[1] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() defaultSize];
  v52.receiver = self;
  v52.super_class = (Class)TPNumberPadButton;
  double v8 = -[TPNumberPadButton initWithFrame:](&v52, sel_initWithFrame_, 0.0, 0.0, v6, v7);
  p_isa = (id *)&v8->super.super.super.super.isa;
  if (v8)
  {
    [(TPNumberPadButton *)v8 setCharacter:a3];
    if (a3 == 13)
    {
      double v10 = [p_isa defaultColor];
      [p_isa setBackgroundColor:v10];

      return p_isa;
    }
    id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(id)objc_opt_class() circleBounds];
    uint64_t v12 = objc_msgSend(v11, "initWithFrame:");
    id v13 = p_isa[61];
    p_isa[61] = (id)v12;

    [p_isa[61] frame];
    double v15 = v14 * 0.5;
    double v16 = [p_isa[61] layer];
    [v16 setCornerRadius:v15];

    v17 = [p_isa buttonColor];
    [p_isa setColor:v17];

    [(id)objc_opt_class() unhighlightedCircleViewAlpha];
    double v19 = v18;
    v20 = [p_isa circleView];
    [v20 setAlpha:v19];

    LODWORD(v20) = [(id)objc_opt_class() usesButtonColorMatrixFilters];
    v21 = objc_opt_class();
    if (v20)
    {
      if ([v21 usesEmergencyCallButtonColorMatrixFilters])
      {
        uint64_t v22 = 0x3FC0C49CBF6F5C29;
        uint64_t v23 = 0x3F2A3D71BE8E5604;
        int v24 = 1046495625;
        int v25 = -1111457006;
        int v26 = 1068054348;
      }
      else
      {
        uint64_t v22 = 0x3FA1CAC1BEB74BC7;
        uint64_t v23 = 0x3F7126E9BDD91687;
        int v24 = 0;
        int v25 = -1122798404;
        int v26 = 1066980606;
      }
      v41[0] = v26;
      v41[1] = v22;
      v41[2] = v25;
      v41[3] = 0;
      v41[4] = v24;
      uint64_t v42 = v23;
      int v43 = v25;
      int v44 = 0;
      int v45 = v24;
      int v46 = v23;
      uint64_t v47 = v22;
      int v48 = 0;
      int v49 = v24;
      long long v50 = xmmword_1C2F730F0;
      int v51 = 0;
      id v27 = [MEMORY[0x1E4FB1620] _colorEffectCAMatrix:v41];
      v28 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
      v55[0] = v27;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
      [v28 setBackgroundEffects:v33];

      if ([(id)objc_opt_class() usesEmergencyCallButtonColorMatrixFilters])
      {
        v34 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:100.0];
        v54[0] = v27;
        v54[1] = v34;
        v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
        [v28 setBackgroundEffects:v35];
      }
      [p_isa[61] frame];
      objc_msgSend(v28, "setFrame:");
      v36 = [p_isa[61] layer];
      [v36 cornerRadius];
      double v38 = v37;
      BOOL v39 = [v28 layer];
      [v39 setCornerRadius:v38];

      [v28 setClipsToBounds:1];
      [p_isa setBackDropVisualEffectView:v28];
      [p_isa addSubview:v28];
    }
    else
    {
      if (![v21 usesButtonSaturationFilters])
      {
LABEL_14:
        [p_isa addSubview:p_isa[61]];
        [p_isa reloadImagesForCurrentCharacter];
        [p_isa addTarget:p_isa action:sel_touchDown forControlEvents:1];
        [p_isa addTarget:p_isa action:sel_touchUp forControlEvents:64];
        [p_isa addTarget:p_isa action:sel_touchUp forControlEvents:128];
        [p_isa addTarget:p_isa action:sel_touchCancelled forControlEvents:256];
        return p_isa;
      }
      id v27 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      v28 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
      [v28 setName:@"saturation"];
      [v28 setValue:&unk_1F1E89978 forKey:@"inputAmount"];
      id v29 = objc_alloc_init(MEMORY[0x1E4F39B40]);
      v53 = v28;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      [v29 setFilters:v30];

      [p_isa[61] frame];
      objc_msgSend(v29, "setFrame:");
      double v31 = [p_isa[61] layer];
      [v31 cornerRadius];
      objc_msgSend(v29, "setCornerRadius:");

      [v29 setScale:0.5];
      [v29 setGroupName:@"TPNumberPadButton"];
      double v32 = [v27 layer];
      [v32 addSublayer:v29];

      [p_isa addSubview:v27];
    }

    goto LABEL_14;
  }
  return p_isa;
}

- (void)updateBackgroundMaterial:(id)a3
{
  id v6 = a3;
  double v4 = [(TPNumberPadButton *)self backDropVisualEffectView];

  if (v4)
  {
    int v5 = [(TPNumberPadButton *)self backDropVisualEffectView];
    [v5 setBackgroundEffects:v6];
  }
}

- (void)reloadImagesForCurrentCharacter
{
  uint64_t v3 = [(TPNumberPadButton *)self glyphLayer];

  if (v3)
  {
    double v4 = [(TPNumberPadButton *)self glyphLayer];
    [v4 removeFromSuperlayer];
  }
  int v5 = [(TPNumberPadButton *)self highlightedGlyphLayer];

  if (v5)
  {
    id v6 = [(TPNumberPadButton *)self highlightedGlyphLayer];
    [v6 removeFromSuperlayer];
  }
  double v7 = objc_msgSend((id)objc_opt_class(), "imageForCharacter:", -[TPNumberPadButton character](self, "character"));
  double v8 = [MEMORY[0x1E4F39BE8] layer];
  [v8 setOpaque:0];
  id v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 scale];
  objc_msgSend(v8, "setContentsScale:");

  id v40 = v7;
  objc_msgSend(v8, "setContents:", objc_msgSend(v40, "CGImage"));
  [v40 size];
  double v11 = v10;
  double v13 = v12;
  [(TPNumberPadButton *)self frame];
  double v15 = v14;
  [v40 size];
  *(float *)&double v16 = (v15 - v16) * 0.5;
  double v17 = roundf(*(float *)&v16);
  [(TPNumberPadButton *)self frame];
  double v19 = v18;
  [v40 size];
  float v21 = (v19 - v20) * 0.5;
  objc_msgSend(v8, "setFrame:", v17, roundf(v21), v11, v13);
  uint64_t v22 = [(TPNumberPadButton *)self layer];
  [v22 addSublayer:v8];

  [(TPNumberPadButton *)self setGlyphLayer:v8];
  uint64_t v23 = objc_msgSend((id)objc_opt_class(), "imageForCharacter:highlighted:", -[TPNumberPadButton character](self, "character"), 1);
  int v24 = [MEMORY[0x1E4F39BE8] layer];
  [v24 setOpaque:0];
  int v25 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v25 scale];
  objc_msgSend(v24, "setContentsScale:");

  id v26 = v23;
  objc_msgSend(v24, "setContents:", objc_msgSend(v26, "CGImage"));
  [v40 size];
  double v28 = v27;
  double v30 = v29;
  [(TPNumberPadButton *)self frame];
  double v32 = v31;
  [v26 size];
  *(float *)&double v33 = (v32 - v33) * 0.5;
  double v34 = roundf(*(float *)&v33);
  [(TPNumberPadButton *)self frame];
  double v36 = v35;
  [v26 size];
  float v38 = (v36 - v37) * 0.5;
  objc_msgSend(v24, "setFrame:", v34, roundf(v38), v28, v30);
  [v24 setOpacity:0.0];
  BOOL v39 = [(TPNumberPadButton *)self layer];
  [v39 addSublayer:v24];

  [(TPNumberPadButton *)self setHighlightedGlyphLayer:v24];
  [(TPNumberPadButton *)self setNeedsLayout];
}

- (void)setColor:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_color, a3);
  if ([(TPNumberPadButton *)self character] != 13)
  {
    int v5 = [(TPNumberPadButton *)self circleView];
    [v5 setBackgroundColor:v9];

    [(id)objc_opt_class() unhighlightedCircleViewAlpha];
    double v7 = v6;
    double v8 = [(TPNumberPadButton *)self circleView];
    [v8 setAlpha:v7];
  }
}

- (void)setGreyedOut:(BOOL)a3
{
  int v5 = [(TPNumberPadButton *)self glyphLayer];

  if (v5)
  {
    double v6 = [(TPNumberPadButton *)self glyphLayer];
    [v6 removeFromSuperlayer];

    [(TPNumberPadButton *)self setGlyphLayer:0];
  }
  int64_t v7 = [(TPNumberPadButton *)self character];
  double v8 = objc_opt_class();
  if (a3) {
    [v8 disabledImageForCharacter:v7];
  }
  else {
  id v9 = [v8 imageForCharacter:v7];
  }
  double v10 = [MEMORY[0x1E4F39BE8] layer];
  [v10 setOpaque:0];
  double v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  objc_msgSend(v10, "setContentsScale:");

  id v20 = v9;
  objc_msgSend(v10, "setContents:", objc_msgSend(v20, "CGImage"));
  [v20 size];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v12, v13);
  [(TPNumberPadButton *)self frame];
  float v15 = v14 * 0.5;
  double v16 = roundf(v15);
  [(TPNumberPadButton *)self frame];
  float v18 = v17 * 0.5;
  objc_msgSend(v10, "setPosition:", v16, roundf(v18));
  double v19 = [(TPNumberPadButton *)self layer];
  [v19 addSublayer:v10];

  [(TPNumberPadButton *)self setGlyphLayer:v10];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TPNumberPadButton *)self bounds];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v11, v10)) {
    int64_t v7 = self;
  }
  else {
    int64_t v7 = 0;
  }
  return v7;
}

- (void)highlightCircleView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__TPNumberPadButton_highlightCircleView_animated___block_invoke;
  v10[3] = &unk_1E647BF70;
  v10[4] = self;
  BOOL v11 = a3;
  double v6 = _Block_copy(v10);
  int64_t v7 = v6;
  if (v4)
  {
    if (v5) {
      double v8 = 0.0;
    }
    else {
      double v8 = 0.850000024;
    }
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1ED8]), "initWithDuration:controlPoint1:controlPoint2:animations:", v6, v8, 0.0, 0.0, 0.0, 1.0);
    [v9 startAnimation];
  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }
}

void __50__TPNumberPadButton_highlightCircleView_animated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) circleView];
  int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = objc_opt_class();
  if (v3) {
    [v4 highlightedCircleViewAlpha];
  }
  else {
    [v4 unhighlightedCircleViewAlpha];
  }
  objc_msgSend(v2, "setAlpha:");

  BOOL v5 = [*(id *)(a1 + 32) highlightedButtonColor];

  if (v5)
  {
    double v6 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 40)) {
      [v6 highlightedButtonColor];
    }
    else {
    id v7 = [v6 buttonColor];
    }
    [*(id *)(a1 + 32) setColor:v7];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(TPNumberPadButton *)self isHighlighted];
  v6.receiver = self;
  v6.super_class = (Class)TPNumberPadButton;
  [(TPNumberPadButton *)&v6 setHighlighted:v3];
  if (v5 != v3) {
    [(TPNumberPadButton *)self highlightCircleView:v3 animated:1];
  }
}

- (id)defaultColor
{
  return 0;
}

- (int64_t)character
{
  return self->character;
}

- (void)setCharacter:(int64_t)a3
{
  self->character = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (CALayer)glyphLayer
{
  return (CALayer *)objc_getProperty(self, a2, 472, 1);
}

- (void)setGlyphLayer:(id)a3
{
}

- (CALayer)highlightedGlyphLayer
{
  return (CALayer *)objc_getProperty(self, a2, 480, 1);
}

- (void)setHighlightedGlyphLayer:(id)a3
{
}

- (UIView)circleView
{
  return (UIView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setCircleView:(id)a3
{
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (TPRevealingRingView)revealingRingView
{
  return self->_revealingRingView;
}

- (UIVisualEffectView)backDropVisualEffectView
{
  return self->_backDropVisualEffectView;
}

- (void)setBackDropVisualEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backDropVisualEffectView, 0);
  objc_storeStrong((id *)&self->_revealingRingView, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_highlightedGlyphLayer, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
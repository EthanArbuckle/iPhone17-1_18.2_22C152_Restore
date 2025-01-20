@interface TPNumberPadKey
+ (float)absoluteTrackingValueForString:(id)a3 pointSize:(float)a4 unitsPerEm:(float)a5;
+ (void)initialize;
- (BOOL)isAsterisk;
- (BOOL)isPound;
- (NSLayoutConstraint)digitBaseline;
- (NSLayoutConstraint)letterBaseline;
- (NSLayoutConstraint)secondaryLetterBaseline;
- (TPNumberPadKey)initWithFrame:(CGRect)a3;
- (UILabel)digit;
- (UILabel)letters;
- (UILabel)secondaryLetters;
- (double)digitFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5;
- (double)letterFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5;
- (double)secondaryLetterFontSizeForScreenSizeCategory:(unint64_t)a3;
- (void)doLayoutNow;
- (void)setDigit:(id)a3;
- (void)setDigit:(id)a3 primaryLetters:(id)a4 secondaryLetters:(id)a5;
- (void)setDigitBaseline:(id)a3;
- (void)setFontStylesForHighlightState:(BOOL)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5 shouldCenterDigit:(BOOL)a6 fontColor:(BOOL)a7 circleDiameter:(double)a8 isCarPlay:(BOOL)a9 screenSizeCategory:(unint64_t)a10;
- (void)setLetterBaseline:(id)a3;
- (void)setLetters:(id)a3;
- (void)setSecondaryLetterBaseline:(id)a3;
- (void)setSecondaryLetters:(id)a3;
- (void)updateBaselineConstraintConstantsFor:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5;
@end

@implementation TPNumberPadKey

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
  }
}

- (TPNumberPadKey)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)TPNumberPadKey;
  v3 = -[TPNumberPadKey initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    digit = v3->_digit;
    v3->_digit = (UILabel *)v4;

    uint64_t v6 = objc_opt_new();
    letters = v3->_letters;
    v3->_letters = (UILabel *)v6;

    uint64_t v8 = objc_opt_new();
    secondaryLetters = v3->_secondaryLetters;
    v3->_secondaryLetters = (UILabel *)v8;

    [(TPNumberPadKey *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondaryLetters setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_letters setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_digit setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TPNumberPadKey *)v3 addSubview:v3->_digit];
    [(TPNumberPadKey *)v3 addSubview:v3->_letters];
    [(TPNumberPadKey *)v3 addSubview:v3->_secondaryLetters];
    v10 = [(TPNumberPadKey *)v3 widthAnchor];
    v11 = [v10 constraintEqualToConstant:75.0];
    [v11 setActive:1];

    v12 = [(TPNumberPadKey *)v3 heightAnchor];
    v13 = [v12 constraintEqualToConstant:75.0];
    [v13 setActive:1];

    v14 = [(UILabel *)v3->_digit centerXAnchor];
    v15 = [(TPNumberPadKey *)v3 centerXAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(UILabel *)v3->_secondaryLetters centerXAnchor];
    v18 = [(TPNumberPadKey *)v3 centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = [(UILabel *)v3->_digit centerYAnchor];
    v21 = [(TPNumberPadKey *)v3 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];

    LODWORD(v23) = 1132068864;
    [v22 setPriority:v23];
    [v22 setActive:1];
    v24 = [(UILabel *)v3->_letters centerXAnchor];
    v25 = [(TPNumberPadKey *)v3 centerXAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    [v26 setActive:1];

    v27 = [(UILabel *)v3->_letters firstBaselineAnchor];
    v28 = [(UILabel *)v3->_digit firstBaselineAnchor];
    uint64_t v29 = [v27 constraintEqualToAnchor:v28 constant:14.0];
    letterBaseline = v3->_letterBaseline;
    v3->_letterBaseline = (NSLayoutConstraint *)v29;

    v31 = [(UILabel *)v3->_digit firstBaselineAnchor];
    v32 = [(TPNumberPadKey *)v3 topAnchor];
    uint64_t v33 = [v31 constraintEqualToAnchor:v32 constant:44.0];
    digitBaseline = v3->_digitBaseline;
    v3->_digitBaseline = (NSLayoutConstraint *)v33;

    v35 = [(UILabel *)v3->_secondaryLetters firstBaselineAnchor];
    v36 = [(UILabel *)v3->_letters firstBaselineAnchor];
    uint64_t v37 = [v35 constraintEqualToAnchor:v36];
    secondaryLetterBaseline = v3->_secondaryLetterBaseline;
    v3->_secondaryLetterBaseline = (NSLayoutConstraint *)v37;

    [(NSLayoutConstraint *)v3->_secondaryLetterBaseline setActive:1];
    [(NSLayoutConstraint *)v3->_digitBaseline setActive:1];
    [(NSLayoutConstraint *)v3->_letterBaseline setActive:1];
  }
  return v3;
}

+ (float)absoluteTrackingValueForString:(id)a3 pointSize:(float)a4 unitsPerEm:(float)a5
{
  unint64_t v7 = [a3 length];
  float v8 = -25.0;
  if (v7 < 6) {
    float v8 = 0.0;
  }
  if (isBold) {
    float v8 = -175.0;
  }
  return (float)(v8 / a5) * a4;
}

- (BOOL)isAsterisk
{
  v2 = [(TPNumberPadKey *)self digit];
  v3 = [v2 text];
  char v4 = [v3 isEqualToString:@"*"];

  return v4;
}

- (BOOL)isPound
{
  v2 = [(TPNumberPadKey *)self digit];
  v3 = [v2 text];
  char v4 = [v3 isEqualToString:@"#"];

  return v4;
}

- (double)digitFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = 36.0;
  switch(a3)
  {
    case 3uLL:
      float v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
      if ([v8 isUserInterfaceIdiomPad]) {
        double v7 = 36.0;
      }
      else {
        double v7 = 40.0;
      }

      break;
    case 5uLL:
      double v7 = 37.0;
      break;
    case 6uLL:
      double v7 = 40.0;
      break;
    case 0xAuLL:
      double v7 = 41.0;
      break;
    default:
      break;
  }
  double result = v7 + 2.0;
  if (!v5) {
    double result = v7;
  }
  if (useIndicDigits) {
    BOOL v10 = a4 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10) {
    return v7;
  }
  return result;
}

- (double)letterFontSizeForScreenSizeCategory:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  BOOL v5 = a5;
  double v7 = 10.0;
  if (a3 == 3)
  {
    v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
    if (![v9 isUserInterfaceIdiomPad]) {
      double v7 = 12.0;
    }

    if (a4) {
      goto LABEL_9;
    }
    return v7 + 1.0;
  }
  if (a3 == 10) {
    double v8 = 12.0;
  }
  else {
    double v8 = 10.0;
  }
  if (a3 == 6) {
    double v7 = 12.0;
  }
  else {
    double v7 = v8;
  }
  if (!a4) {
    return v7 + 1.0;
  }
LABEL_9:
  if (v5)
  {
    if (a4 == 2) {
      return v7 + 1.0;
    }
    else {
      return v7 + -1.0;
    }
  }
  return v7;
}

- (double)secondaryLetterFontSizeForScreenSizeCategory:(unint64_t)a3
{
  double v3 = 9.0;
  if (a3 == 3)
  {
    BOOL v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    if (![v5 isUserInterfaceIdiomPad]) {
      double v3 = 11.0;
    }
  }
  else
  {
    double v4 = 10.0;
    if (a3 != 10) {
      double v4 = 9.0;
    }
    if (a3 == 6) {
      return 11.0;
    }
    else {
      return v4;
    }
  }
  return v3;
}

- (void)updateBaselineConstraintConstantsFor:(unint64_t)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 == 6)
  {
    int v9 = 1;
    if (a4) {
      goto LABEL_6;
    }
LABEL_9:
    if (useIndicDigits)
    {
      v13 = [(TPNumberPadKey *)self letterBaseline];
      [v13 setConstant:14.0];
    }
    BOOL v10 = v9 == 0;
    double v11 = 12.0;
    double v12 = 14.0;
    goto LABEL_12;
  }
  if (a3 != 3)
  {
    int v9 = 0;
    if (a4) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  double v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  int v9 = [v8 isUserInterfaceIdiomPad] ^ 1;

  if (!a4) {
    goto LABEL_9;
  }
LABEL_6:
  if (!v5) {
    goto LABEL_16;
  }
  BOOL v10 = v9 == 0;
  double v11 = 11.0;
  double v12 = 13.0;
LABEL_12:
  if (v10) {
    double v14 = v11;
  }
  else {
    double v14 = v12;
  }
  v15 = [(TPNumberPadKey *)self secondaryLetterBaseline];
  [v15 setConstant:v14];

LABEL_16:
  if (v9) {
    double v16 = 16.0;
  }
  else {
    double v16 = 14.0;
  }
  id v17 = [(TPNumberPadKey *)self letterBaseline];
  [v17 setConstant:v16];
}

- (void)setFontStylesForHighlightState:(BOOL)a3 language:(unint64_t)a4 showLocalizedLetters:(BOOL)a5 shouldCenterDigit:(BOOL)a6 fontColor:(BOOL)a7 circleDiameter:(double)a8 isCarPlay:(BOOL)a9 screenSizeCategory:(unint64_t)a10
{
  BOOL v10 = a9;
  BOOL v12 = a7;
  BOOL v13 = a6;
  BOOL v14 = a5;
  -[TPNumberPadKey digitFontSizeForScreenSizeCategory:language:showLocalizedLetters:](self, "digitFontSizeForScreenSizeCategory:language:showLocalizedLetters:", a10);
  double v18 = v17;
  [(TPNumberPadKey *)self letterFontSizeForScreenSizeCategory:a10 language:a4 showLocalizedLetters:v14];
  double v20 = v19;
  [(TPNumberPadKey *)self secondaryLetterFontSizeForScreenSizeCategory:a10];
  double v22 = v21;
  if (isBold) {
    double v23 = &semiBoldFont;
  }
  else {
    double v23 = &regularFont;
  }
  uint64_t v24 = *v23;
  uint64_t v25 = boldFont;
  v26 = &blackColor;
  if (v12) {
    v26 = &whiteColor;
  }
  id v94 = (id)*v26;
  v27 = [(TPNumberPadKey *)self letters];
  [v27 setHidden:0];

  v28 = [(TPNumberPadKey *)self secondaryLetters];
  [v28 setHidden:0];

  [(TPNumberPadKey *)self updateBaselineConstraintConstantsFor:a10 language:a4 showLocalizedLetters:v14];
  if (!v14)
  {
    v32 = [(TPNumberPadKey *)self secondaryLetters];
    [v32 setHidden:1];

    uint64_t v33 = [(TPNumberPadKey *)self letters];
    v34 = [v33 text];
    int v35 = [v34 isEqualToString:@"+"];

    if (v35) {
      double v20 = v20 + 5.0;
    }
    if (a8 == 65.0)
    {
      uint64_t v36 = 0x4043000000000000;
    }
    else
    {
      if (a8 == 83.0)
      {
        uint64_t v37 = 0x4047800000000000;
        goto LABEL_15;
      }
      uint64_t v36 = 0x4046000000000000;
    }
    uint64_t v37 = v36;
LABEL_15:
    uint64_t v29 = [(TPNumberPadKey *)self digitBaseline];
    v30 = v29;
    double v31 = *(double *)&v37;
    goto LABEL_16;
  }
  uint64_t v29 = [(TPNumberPadKey *)self digitBaseline];
  v30 = v29;
  double v31 = 38.0;
LABEL_16:
  [v29 setConstant:v31];

  v38 = [(TPNumberPadKey *)self digitBaseline];
  [v38 setActive:!v13];

  if (v10)
  {
    double v18 = v18 * 0.5;
    double v20 = v20 * 0.5;
    double v22 = v22 * 0.5;
    v39 = [(TPNumberPadKey *)self secondaryLetterBaseline];
    [v39 constant];
    [v39 setConstant:v40 * 0.5];

    v41 = [(TPNumberPadKey *)self letterBaseline];
    [v41 constant];
    [v41 setConstant:v42 * 0.5];

    if (!v14)
    {
      v43 = [(TPNumberPadKey *)self digitBaseline];
      [v43 constant];
      [v43 setConstant:v44 + -3.0];
    }
  }
  objc_msgSend(MEMORY[0x1E4FB08E0], "fontWithDescriptor:size:", v25, v20, v24);
  v45 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  v46 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v25 size:v22];
  v47 = [(TPNumberPadKey *)self letters];
  v48 = [v47 text];
  *(float *)&double v50 = (float)CTFontGetUnitsPerEm(v45);
  float v49 = v20;
  *(float *)&double v51 = v49;
  +[TPNumberPadKey absoluteTrackingValueForString:v48 pointSize:v51 unitsPerEm:v50];
  double v53 = v52;

  v54 = [(TPNumberPadKey *)self secondaryLetters];
  v55 = [v54 text];

  if (v55)
  {
    v56 = [(TPNumberPadKey *)self secondaryLetters];
    v57 = [v56 text];
    *(float *)&double v59 = (float)CTFontGetUnitsPerEm(v45);
    float v58 = v22;
    *(float *)&double v60 = v58;
    +[TPNumberPadKey absoluteTrackingValueForString:v57 pointSize:v60 unitsPerEm:v59];
    double v62 = v61;
  }
  else
  {
    double v62 = 0.0;
  }
  id v63 = objc_alloc(MEMORY[0x1E4F28E48]);
  v64 = [(TPNumberPadKey *)self letters];
  v65 = [v64 text];
  v66 = (void *)[v63 initWithString:v65];

  uint64_t v67 = *MEMORY[0x1E4FB0710];
  v68 = [NSNumber numberWithDouble:v53];
  v69 = [(TPNumberPadKey *)self letters];
  v70 = [v69 text];
  objc_msgSend(v66, "addAttribute:value:range:", v67, v68, 0, objc_msgSend(v70, "length"));

  v71 = [(TPNumberPadKey *)self letters];
  [v71 setAttributedText:v66];

  v72 = [(TPNumberPadKey *)self secondaryLetters];
  v73 = [v72 text];

  if (v73)
  {
    id v74 = objc_alloc(MEMORY[0x1E4F28E48]);
    v75 = [(TPNumberPadKey *)self secondaryLetters];
    v76 = [v75 text];
    v77 = (void *)[v74 initWithString:v76];

    v78 = [NSNumber numberWithDouble:v62];
    v79 = [(TPNumberPadKey *)self secondaryLetters];
    v80 = [v79 text];
    objc_msgSend(v77, "addAttribute:value:range:", v67, v78, 0, objc_msgSend(v80, "length"));

    v81 = [(TPNumberPadKey *)self secondaryLetters];
    [v81 setAttributedText:v77];
  }
  v82 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v93 size:v18];
  v83 = [(TPNumberPadKey *)self digit];
  [v83 setFont:v82];

  if ([(TPNumberPadKey *)self isAsterisk] || [(TPNumberPadKey *)self isPound])
  {
    v84 = [(TPNumberPadKey *)self digit];
    v85 = [v84 font];
    v86 = [v85 withCaseSensitiveAttribute];
    v87 = [(TPNumberPadKey *)self digit];
    [v87 setFont:v86];
  }
  v88 = [(TPNumberPadKey *)self letters];
  [v88 setFont:v45];

  v89 = [(TPNumberPadKey *)self secondaryLetters];
  [v89 setFont:v46];

  v90 = [(TPNumberPadKey *)self digit];
  [v90 setTextColor:v94];

  v91 = [(TPNumberPadKey *)self letters];
  [v91 setTextColor:v94];

  v92 = [(TPNumberPadKey *)self secondaryLetters];
  [v92 setTextColor:v94];
}

- (void)setDigit:(id)a3 primaryLetters:(id)a4 secondaryLetters:(id)a5
{
  id v13 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = [(TPNumberPadKey *)self digit];
  [v10 setText:v9];

  double v11 = [(TPNumberPadKey *)self letters];
  [v11 setText:v8];

  if (v13)
  {
    BOOL v12 = [(TPNumberPadKey *)self secondaryLetters];
    [v12 setText:v13];
  }
}

- (void)doLayoutNow
{
  [(TPNumberPadKey *)self setNeedsLayout];
  [(TPNumberPadKey *)self setNeedsDisplay];
  [(TPNumberPadKey *)self layoutIfNeeded];
}

- (UILabel)digit
{
  return self->_digit;
}

- (void)setDigit:(id)a3
{
}

- (UILabel)letters
{
  return self->_letters;
}

- (void)setLetters:(id)a3
{
}

- (UILabel)secondaryLetters
{
  return self->_secondaryLetters;
}

- (void)setSecondaryLetters:(id)a3
{
}

- (NSLayoutConstraint)digitBaseline
{
  return self->_digitBaseline;
}

- (void)setDigitBaseline:(id)a3
{
}

- (NSLayoutConstraint)letterBaseline
{
  return self->_letterBaseline;
}

- (void)setLetterBaseline:(id)a3
{
}

- (NSLayoutConstraint)secondaryLetterBaseline
{
  return self->_secondaryLetterBaseline;
}

- (void)setSecondaryLetterBaseline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLetterBaseline, 0);
  objc_storeStrong((id *)&self->_letterBaseline, 0);
  objc_storeStrong((id *)&self->_digitBaseline, 0);
  objc_storeStrong((id *)&self->_secondaryLetters, 0);
  objc_storeStrong((id *)&self->_letters, 0);
  objc_storeStrong((id *)&self->_digit, 0);
}

@end
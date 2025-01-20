@interface SBUISimpleFixedDigitPasscodeEntryField
- (BOOL)_hasAnyCharacters;
- (CGRect)_entryFieldBoundsWithXOffset:(double)a3;
- (CGSize)_viewSize;
- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3;
- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4;
- (UIEdgeInsets)_entryFieldPaddingOutsideRing;
- (void)_appendString:(id)a3;
- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3;
- (void)_deleteLastCharacter;
- (void)_resetForFailedPasscode:(BOOL)a3;
- (void)reset;
@end

@implementation SBUISimpleFixedDigitPasscodeEntryField

- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  return [(SBUISimpleFixedDigitPasscodeEntryField *)self initWithDefaultSizeAndLightStyle:a3 numberOfDigits:6];
}

- (SBUISimpleFixedDigitPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4
{
  BOOL v5 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  v6 = -[SBUINumericPasscodeEntryFieldBase initWithDefaultSizeAndLightStyle:](&v59, sel_initWithDefaultSizeAndLightStyle_);
  v7 = v6;
  if (v6)
  {
    [(SBUISimpleFixedDigitPasscodeEntryField *)v6 setClipsToBounds:1];
    [(SBUINumericPasscodeEntryFieldBase *)v7 setMaxNumbersAllowed:a4];
    v8 = [(SBUIPasscodeEntryField *)v7 _textField];
    double v9 = 0.0;
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, 0.0);
    [v8 setHidden:1];
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    characterIndicators = v7->_characterIndicators;
    v7->_characterIndicators = v10;

    v12 = [MEMORY[0x1E4F42D90] mainScreen];
    [v12 bounds];
    double v14 = v13;

    [(SBUISimpleFixedDigitPasscodeEntryField *)v7 _entryFieldBoundsWithXOffset:0.0];
    double v16 = v15;
    double v18 = v17 * (double)a4;
    double v19 = SBUIFloatFloorForMainScreenScale((v14 - v18) * 0.5);
    id v20 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUISimpleFixedDigitPasscodeEntryField *)v7 bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    springView = v7->_springView;
    v7->_springView = (UIView *)v21;

    id v23 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(SBUISimpleFixedDigitPasscodeEntryField *)v7 bounds];
    uint64_t v24 = objc_msgSend(v23, "initWithFrame:");
    springViewParent = v7->_springViewParent;
    v7->_springViewParent = (UIView *)v24;

    [(UIView *)v7->_springView setAutoresizingMask:2];
    [(UIView *)v7->_springViewParent setAutoresizingMask:2];
    [(SBUISimpleFixedDigitPasscodeEntryField *)v7 addSubview:v7->_springViewParent];
    [(UIView *)v7->_springViewParent addSubview:v7->_springView];
    uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v19, 0.0, v18, v16);
    characterIndicatorsContainerView = v7->_characterIndicatorsContainerView;
    v7->_characterIndicatorsContainerView = (UIView *)v26;

    v28 = v7->_characterIndicatorsContainerView;
    v29 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v28 setBackgroundColor:v29];

    [(UIView *)v7->_characterIndicatorsContainerView setAutoresizingMask:5];
    [(UIView *)v7->_springView addSubview:v7->_characterIndicatorsContainerView];
    [(SBUISimpleFixedDigitPasscodeEntryField *)v7 _entryFieldPaddingOutsideRing];
    if (a4)
    {
      double v34 = v30;
      double v35 = v31;
      double v36 = v32;
      double v37 = v33;
      v38 = 0;
      do
      {
        double v58 = v9;
        v39 = v38;
        [(SBUISimpleFixedDigitPasscodeEntryField *)v7 _entryFieldBoundsWithXOffset:v9];
        double v40 = v37;
        double v41 = v36;
        double v42 = v35;
        double v43 = v34;
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;
        double v51 = v50;
        v52 = [SBSimplePasscodeEntryFieldButton alloc];
        double v53 = v45;
        double v34 = v43;
        double v35 = v42;
        double v36 = v41;
        double v37 = v40;
        v38 = -[SBSimplePasscodeEntryFieldButton initWithFrame:paddingOutsideRing:useLightStyle:](v52, "initWithFrame:paddingOutsideRing:useLightStyle:", v5, v53, v47, v49, v51, v34, v35, v36, v40);

        [(NSMutableArray *)v7->_characterIndicators addObject:v38];
        [(UIView *)v7->_characterIndicatorsContainerView addSubview:v38];
        [(SBSimplePasscodeEntryFieldButton *)v38 size];
        double v55 = v54;
        -[SBSimplePasscodeEntryFieldButton setFrame:](v38, "setFrame:", v58, 0.0, v54, v56);
        double v9 = v58 + v55;
        --a4;
      }
      while (a4);
    }
  }
  return v7;
}

- (void)reset
{
  [(NSMutableArray *)self->_characterIndicators enumerateObjectsWithOptions:2 usingBlock:&__block_literal_global_3];
  v3.receiver = self;
  v3.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v3 reset];
}

uint64_t __47__SBUISimpleFixedDigitPasscodeEntryField_reset__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setRevealed:0 animated:0 delay:0.0];
}

- (void)_appendString:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(SBUIPasscodeEntryField *)self stringValue];
  unint64_t v6 = [v5 length];

  if (v6 < [(SBUINumericPasscodeEntryFieldBase *)self maxNumbersAllowed])
  {
    v7 = [(UIView *)self->_springView layer];
    v8 = [v7 animationKeys];
    char v9 = [v8 containsObject:@"shake"];

    if (v9)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v10 = self->_characterIndicators;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if ([v15 isAnimatingUnreveal])
            {
              [v15 setRevealed:1 animated:1 delay:0.0];
              [v15 setRevealed:0 animated:1 delay:0.0];
            }
          }
          uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v12);
      }

      double v16 = [(UIView *)self->_springView layer];
      [v16 removeAnimationForKey:@"shake"];

      double v17 = [(UIView *)self->_springViewParent layer];
      [v17 removeAnimationForKey:@"force-off-center"];

      unint64_t v18 = v6 + 1;
      if (v6 == -1) {
        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v18 = v6 + 1;
    }
    if (v18 <= [(SBUINumericPasscodeEntryFieldBase *)self maxNumbersAllowed])
    {
      double v19 = [(NSMutableArray *)self->_characterIndicators objectAtIndex:v6];
      [v19 setRevealed:1 animated:1];
    }
LABEL_17:
    v20.receiver = self;
    v20.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
    [(SBUINumericPasscodeEntryFieldBase *)&v20 _appendString:v4];
  }
}

- (void)_deleteLastCharacter
{
  objc_super v3 = [(SBUIPasscodeEntryField *)self stringValue];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    unint64_t v5 = v4 - 1;
    if (v5 < [(NSMutableArray *)self->_characterIndicators count])
    {
      unint64_t v6 = [(NSMutableArray *)self->_characterIndicators objectAtIndex:v5];
      [v6 setRevealed:0 animated:1];
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  [(SBUINumericPasscodeEntryFieldBase *)&v7 _deleteLastCharacter];
}

- (BOOL)_hasAnyCharacters
{
  v2 = [(SBUIPasscodeEntryField *)self stringValue];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position.x"];
  [v5 setMass:1.20000005];
  [v5 setStiffness:1200.0];
  [v5 setDamping:12.0];
  LODWORD(v6) = 1028389654;
  LODWORD(v7) = 990057071;
  LODWORD(v8) = 1059712716;
  LODWORD(v9) = 1.0;
  v10 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v6 :v7 :v8 :v9];
  [v5 setTimingFunction:v10];

  [v5 setDuration:0.666999996];
  [v5 setVelocity:0.0];
  uint64_t v11 = *MEMORY[0x1E4F39F98];
  [v5 setFillMode:*MEMORY[0x1E4F39F98]];
  uint64_t v12 = NSNumber;
  uint64_t v13 = [(UIView *)self->_springView layer];
  [v13 position];
  double v15 = v14 + 75.0;
  *(float *)&double v15 = v15;
  double v16 = [v12 numberWithFloat:v15];
  [v5 setFromValue:v16];

  double v17 = [(UIView *)self->_springView layer];
  [v17 addAnimation:v5 forKey:@"shake"];

  unint64_t v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"position.x"];
  LODWORD(v19) = 1054276898;
  LODWORD(v20) = 1058305108;
  LODWORD(v21) = 1.0;
  long long v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v19 :0.0 :v20 :v21];
  [v18 setTimingFunction:v22];

  [v18 setDuration:0.100000001];
  [v18 setFillMode:v11];
  long long v23 = NSNumber;
  long long v24 = [(UIView *)self->_springViewParent layer];
  [v24 position];
  double v26 = v25 + -75.0;
  *(float *)&double v26 = v26;
  v27 = [v23 numberWithFloat:v26];
  [v18 setFromValue:v27];

  v28 = [(UIView *)self->_springViewParent layer];
  [v28 addAnimation:v18 forKey:@"force-off-center"];

  v29.receiver = self;
  v29.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  [(SBUIPasscodeEntryField *)&v29 _resetForFailedPasscode:v3];
}

- (CGSize)_viewSize
{
  BOOL v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;

  [(SBUISimpleFixedDigitPasscodeEntryField *)self _entryFieldBoundsWithXOffset:0.0];
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v5 = self->_characterIndicators;
  int64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    double v8 = 0.0;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v9) setRevealed:1 animated:1 delay:v8];
        double v8 = v8 + 0.0166666666;
        ++v9;
      }
      while (v6 != v9);
      int64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
    int64_t v6 = (uint64_t)(v8 * 1000000000.0);
  }

  dispatch_time_t v10 = dispatch_time(0, v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__SBUISimpleFixedDigitPasscodeEntryField__autofillForBiometricAuthenticationWithCompletion___block_invoke;
  v12[3] = &unk_1E5CCCDF0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  dispatch_after(v10, MEMORY[0x1E4F14428], v12);
}

id __92__SBUISimpleFixedDigitPasscodeEntryField__autofillForBiometricAuthenticationWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUISimpleFixedDigitPasscodeEntryField;
  return objc_msgSendSuper2(&v3, sel__autofillForBiometricAuthenticationWithCompletion_, v1);
}

- (CGRect)_entryFieldBoundsWithXOffset:(double)a3
{
  id v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  double Height = CGRectGetHeight(v22);
  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  BOOL v14 = Height >= CGRectGetWidth(v23);
  [MEMORY[0x1E4FA5F68] pinFixedDigitEntryFieldIndicatorDiameter:v14];
  double v16 = v15;
  [MEMORY[0x1E4FA5F68] pinFixedDigitEntryFieldIndicatorPaddingWidth:v14];
  double v18 = v16 + v17 * 2.0;
  double v19 = 0.0;
  double v20 = a3;
  double v21 = v16;
  result.size.height = v21;
  result.size.width = v18;
  result.origin.y = v19;
  result.origin.x = v20;
  return result;
}

- (UIEdgeInsets)_entryFieldPaddingOutsideRing
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double Height = CGRectGetHeight(v17);
  v18.origin.x = v4;
  v18.origin.y = v6;
  v18.size.width = v8;
  v18.size.height = v10;
  [MEMORY[0x1E4FA5F68] pinFixedDigitEntryFieldIndicatorPaddingWidth:Height >= CGRectGetWidth(v18)];
  double v13 = v12;
  double v14 = 0.0;
  double v15 = 0.0;
  double v16 = v13;
  result.right = v16;
  result.bottom = v15;
  result.left = v13;
  result.top = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_characterIndicators, 0);
  objc_storeStrong((id *)&self->_characterIndicatorsContainerView, 0);
}

@end
@interface RTIInputSourceState
+ (BOOL)supportsSecureCoding;
- (BOOL)centerFilled;
- (BOOL)floating;
- (BOOL)hardwareKeyboardMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)minimized;
- (BOOL)showingEmojiSearch;
- (BOOL)showsCandidateBar;
- (BOOL)split;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (CGRect)leftSplitFrame;
- (CGRect)rightSplitFrame;
- (NSString)inputMode;
- (RTIInputSourceState)init;
- (RTIInputSourceState)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCenterFilled:(BOOL)a3;
- (void)setFloating:(BOOL)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInputMode:(id)a3;
- (void)setLeftSplitFrame:(CGRect)a3;
- (void)setMinimized:(BOOL)a3;
- (void)setRightSplitFrame:(CGRect)a3;
- (void)setShowingEmojiSearch:(BOOL)a3;
- (void)setShowsCandidateBar:(BOOL)a3;
- (void)setSplit:(BOOL)a3;
- (void)setSupportsSetPhraseBoundary:(BOOL)a3;
- (void)setUsesCandidateSelection:(BOOL)a3;
@end

@implementation RTIInputSourceState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  if (([v8 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  inputMode = self->_inputMode;
  v5 = v8;
  if (inputMode)
  {
    [v8 encodeObject:inputMode forKey:@"im"];
    v5 = v8;
  }
  [v5 encodeInt32:self->_inputSourceStateMask.integerValue forKey:@"mask"];
  if (!CGRectIsNull(self->_leftSplitFrame))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_leftSplitFrame.origin.x, self->_leftSplitFrame.origin.y, self->_leftSplitFrame.size.width, self->_leftSplitFrame.size.height);
    [v8 encodeObject:v6 forKey:@"lsf"];
  }
  if (!CGRectIsNull(self->_rightSplitFrame))
  {
    v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", self->_rightSplitFrame.origin.x, self->_rightSplitFrame.origin.y, self->_rightSplitFrame.size.width, self->_rightSplitFrame.size.height);
    [v8 encodeObject:v7 forKey:@"rsf"];
  }
}

- (RTIInputSourceState)init
{
  v5.receiver = self;
  v5.super_class = (Class)RTIInputSourceState;
  result = [(RTIInputSourceState *)&v5 init];
  if (result)
  {
    result->_inputSourceStateMask.integerValue = 0;
    CGPoint v3 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_leftSplitFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_leftSplitFrame.size = v4;
    result->_rightSplitFrame.origin = v3;
    result->_rightSplitFrame.size = v4;
  }
  return result;
}

- (RTIInputSourceState)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v23.receiver = self;
  v23.super_class = (Class)RTIInputSourceState;
  objc_super v5 = [(RTIInputSourceState *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"im"];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    *((_DWORD *)v5 + 2) = [v4 decodeInt32ForKey:@"mask"];
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lsf"];
    v9 = v8;
    if (v8)
    {
      [v8 rectValue];
      *((void *)v5 + 3) = v10;
      *((void *)v5 + 4) = v11;
      *((void *)v5 + 5) = v12;
      *((void *)v5 + 6) = v13;
    }
    else
    {
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v5 + 24) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v5 + 40) = v14;
    }
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rsf"];
    v16 = v15;
    if (v15)
    {
      [v15 rectValue];
      *((void *)v5 + 7) = v17;
      *((void *)v5 + 8) = v18;
      *((void *)v5 + 9) = v19;
      *((void *)v5 + 10) = v20;
    }
    else
    {
      long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v5 + 56) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v5 + 72) = v21;
    }
  }
  return (RTIInputSourceState *)v5;
}

- (id)description
{
  CGPoint v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(RTIInputSourceState *)self inputMode];
  [v3 appendFormat:@"; inputMode = %@", v4];

  if ([(RTIInputSourceState *)self minimized]) {
    objc_msgSend(v3, "appendFormat:", @"; minimized = %d", -[RTIInputSourceState minimized](self, "minimized"));
  }
  if ([(RTIInputSourceState *)self hardwareKeyboardMode]) {
    objc_msgSend(v3, "appendFormat:", @"; hardwareKeyboardMode = %d",
  }
      [(RTIInputSourceState *)self hardwareKeyboardMode]);
  if ([(RTIInputSourceState *)self centerFilled]) {
    objc_msgSend(v3, "appendFormat:", @"; centerFilled = %d",
  }
      [(RTIInputSourceState *)self centerFilled]);
  if ([(RTIInputSourceState *)self split])
  {
    objc_msgSend(v3, "appendFormat:", @"; split = %d", -[RTIInputSourceState split](self, "split"));
    [(RTIInputSourceState *)self leftSplitFrame];
    if (!CGRectIsNull(v17))
    {
      [(RTIInputSourceState *)self leftSplitFrame];
      v9 = _RTI_NSStringFromCGRect(v5, v6, v7, v8);
      [v3 appendFormat:@"; leftSplitFrame = %@", v9];
    }
    [(RTIInputSourceState *)self rightSplitFrame];
    if (!CGRectIsNull(v18))
    {
      [(RTIInputSourceState *)self rightSplitFrame];
      long long v14 = _RTI_NSStringFromCGRect(v10, v11, v12, v13);
      [v3 appendFormat:@"; rightSplitFrame = %@", v14];
    }
  }
  if ([(RTIInputSourceState *)self floating]) {
    objc_msgSend(v3, "appendFormat:", @"; floating = %d", -[RTIInputSourceState floating](self, "floating"));
  }
  if ([(RTIInputSourceState *)self showingEmojiSearch]) {
    objc_msgSend(v3, "appendFormat:", @"; showingEmojiSearch = %d",
  }
      [(RTIInputSourceState *)self showingEmojiSearch]);
  if ([(RTIInputSourceState *)self usesCandidateSelection]) {
    objc_msgSend(v3, "appendFormat:", @"; usesCandidateSelection = %d",
  }
      [(RTIInputSourceState *)self usesCandidateSelection]);
  if ([(RTIInputSourceState *)self showsCandidateBar]) {
    objc_msgSend(v3, "appendFormat:", @"; showsCandidateBar = %d",
  }
      [(RTIInputSourceState *)self showsCandidateBar]);
  if ([(RTIInputSourceState *)self supportsSetPhraseBoundary]) {
    objc_msgSend(v3, "appendFormat:", @"; supportsSetPhraseBoundary = %d",
  }
      [(RTIInputSourceState *)self supportsSetPhraseBoundary]);
  [v3 appendString:@">"];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIInputSourceState *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(RTIInputSourceState *)self inputMode];
      uint64_t v7 = [(RTIInputSourceState *)v5 inputMode];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        double v8 = (void *)v7;
        v9 = [(RTIInputSourceState *)self inputMode];
        double v10 = [(RTIInputSourceState *)v5 inputMode];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_19;
        }
      }
      BOOL v13 = [(RTIInputSourceState *)self minimized];
      if (v13 == [(RTIInputSourceState *)v5 minimized])
      {
        BOOL v14 = [(RTIInputSourceState *)self hardwareKeyboardMode];
        if (v14 == [(RTIInputSourceState *)v5 hardwareKeyboardMode])
        {
          BOOL v15 = [(RTIInputSourceState *)self centerFilled];
          if (v15 == [(RTIInputSourceState *)v5 centerFilled])
          {
            BOOL v16 = [(RTIInputSourceState *)self split];
            if (v16 == [(RTIInputSourceState *)v5 split])
            {
              [(RTIInputSourceState *)self leftSplitFrame];
              CGFloat v18 = v17;
              CGFloat v20 = v19;
              CGFloat v22 = v21;
              CGFloat v24 = v23;
              [(RTIInputSourceState *)self leftSplitFrame];
              v49.origin.x = v25;
              v49.origin.y = v26;
              v49.size.width = v27;
              v49.size.height = v28;
              v47.origin.x = v18;
              v47.origin.y = v20;
              v47.size.width = v22;
              v47.size.height = v24;
              if (CGRectEqualToRect(v47, v49))
              {
                [(RTIInputSourceState *)self rightSplitFrame];
                CGFloat v30 = v29;
                CGFloat v32 = v31;
                CGFloat v34 = v33;
                CGFloat v36 = v35;
                [(RTIInputSourceState *)self rightSplitFrame];
                v50.origin.x = v37;
                v50.origin.y = v38;
                v50.size.width = v39;
                v50.size.height = v40;
                v48.origin.x = v30;
                v48.origin.y = v32;
                v48.size.width = v34;
                v48.size.height = v36;
                if (CGRectEqualToRect(v48, v50))
                {
                  BOOL v41 = [(RTIInputSourceState *)self floating];
                  if (v41 == [(RTIInputSourceState *)v5 floating])
                  {
                    BOOL v42 = [(RTIInputSourceState *)self showingEmojiSearch];
                    if (v42 == [(RTIInputSourceState *)v5 showingEmojiSearch])
                    {
                      BOOL v43 = [(RTIInputSourceState *)self usesCandidateSelection];
                      if (v43 == [(RTIInputSourceState *)v5 usesCandidateSelection])
                      {
                        BOOL v44 = [(RTIInputSourceState *)self showsCandidateBar];
                        if (v44 == [(RTIInputSourceState *)v5 showsCandidateBar])
                        {
                          BOOL v46 = [(RTIInputSourceState *)self supportsSetPhraseBoundary];
                          BOOL v12 = v46 ^ [(RTIInputSourceState *)v5 supportsSetPhraseBoundary] ^ 1;
                          goto LABEL_20;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_19:
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    LOBYTE(v12) = 0;
  }
LABEL_21:

  return v12;
}

- (BOOL)minimized
{
  return self->_inputSourceStateMask.integerValue & 1;
}

- (void)setMinimized:(BOOL)a3
{
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFE | a3;
}

- (BOOL)hardwareKeyboardMode
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 1) & 1;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFD | v3;
}

- (BOOL)centerFilled
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 2) & 1;
}

- (void)setCenterFilled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFFB | v3;
}

- (BOOL)split
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 3) & 1;
}

- (void)setSplit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFF7 | v3;
}

- (BOOL)floating
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 4) & 1;
}

- (void)setFloating:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFEF | v3;
}

- (BOOL)showingEmojiSearch
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 5) & 1;
}

- (void)setShowingEmojiSearch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFDF | v3;
}

- (BOOL)usesCandidateSelection
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 7) & 1;
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFF7F | v3;
}

- (BOOL)showsCandidateBar
{
  return (LOWORD(self->_inputSourceStateMask.integerValue) >> 6) & 1;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFFBF | v3;
}

- (BOOL)supportsSetPhraseBoundary
{
  return HIBYTE(LOWORD(self->_inputSourceStateMask.integerValue)) & 1;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_inputSourceStateMask.integerValue) = self->_inputSourceStateMask.integerValue & 0xFEFF | v3;
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setInputMode:(id)a3
{
}

- (CGRect)leftSplitFrame
{
  double x = self->_leftSplitFrame.origin.x;
  double y = self->_leftSplitFrame.origin.y;
  double width = self->_leftSplitFrame.size.width;
  double height = self->_leftSplitFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLeftSplitFrame:(CGRect)a3
{
  self->_leftSplitFrame = a3;
}

- (CGRect)rightSplitFrame
{
  double x = self->_rightSplitFrame.origin.x;
  double y = self->_rightSplitFrame.origin.y;
  double width = self->_rightSplitFrame.size.width;
  double height = self->_rightSplitFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRightSplitFrame:(CGRect)a3
{
  self->_rightSplitFrame = a3;
}

- (void).cxx_destruct
{
}

@end
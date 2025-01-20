@interface _UIInputViewControllerOutput
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDictation;
- (BOOL)isEqual:(id)a3;
- (BOOL)proceedShouldReturn;
- (BOOL)requiresInputManagerSync;
- (BOOL)setMarkedText;
- (BOOL)shouldAdvanceInputMode;
- (BOOL)shouldAdvanceResponder;
- (BOOL)shouldDismiss;
- (BOOL)shouldPostReturnKeyNotification;
- (BOOL)unmarkText;
- (CGPoint)inputModeListFromLocation;
- (CGPoint)inputModeListUpdatePoint;
- (NSArray)keyboardOutputs;
- (NSString)markedText;
- (NSString)primaryLanguage;
- (_NSRange)selectedRange;
- (_UIInputViewControllerOutput)initWithCoder:(id)a3;
- (double)inputModeListTouchBegan;
- (id)_currentKeyboardOutput;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)inputModeListTouchPhase;
- (int64_t)source;
- (void)_pushNewKeyboardOutput;
- (void)adjustTextPositionByCharacterOffset:(int64_t)a3;
- (void)deleteBackward;
- (void)encodeWithCoder:(id)a3;
- (void)insertText:(id)a3;
- (void)setHasDictation:(BOOL)a3;
- (void)setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6;
- (void)setInputModeListFromLocation:(CGPoint)a3;
- (void)setInputModeListTouchBegan:(double)a3;
- (void)setInputModeListTouchPhase:(int64_t)a3;
- (void)setInputModeListUpdatePoint:(CGPoint)a3;
- (void)setKeyboardOutputs:(id)a3;
- (void)setMarkedText:(id)a3;
- (void)setPrimaryLanguage:(id)a3;
- (void)setProceedShouldReturn:(BOOL)a3;
- (void)setRequiresInputManagerSync:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setSetMarkedText:(BOOL)a3;
- (void)setShouldAdvanceInputMode:(BOOL)a3;
- (void)setShouldAdvanceResponder:(BOOL)a3;
- (void)setShouldDismiss:(BOOL)a3;
- (void)setShouldPostReturnKeyNotification:(BOOL)a3;
- (void)setSource:(int64_t)a3;
- (void)setUnmarkText:(BOOL)a3;
@end

@implementation _UIInputViewControllerOutput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_pushNewKeyboardOutput
{
  v3 = [(_UIInputViewControllerOutput *)self keyboardOutputs];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    [(_UIInputViewControllerOutput *)self setKeyboardOutputs:v4];
  }
  id v6 = [(_UIInputViewControllerOutput *)self keyboardOutputs];
  v5 = objc_alloc_init(_UIInputViewKeyboardOutput);
  [v6 addObject:v5];
}

- (id)_currentKeyboardOutput
{
  v3 = [(_UIInputViewControllerOutput *)self keyboardOutputs];
  uint64_t v4 = [v3 count];

  if (!v4) {
    [(_UIInputViewControllerOutput *)self _pushNewKeyboardOutput];
  }
  v5 = [(_UIInputViewControllerOutput *)self keyboardOutputs];
  id v6 = [v5 lastObject];

  return v6;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIInputViewControllerOutput *)self _currentKeyboardOutput];
  [v5 insertText:v4];
}

- (void)deleteBackward
{
  id v7 = [(_UIInputViewControllerOutput *)self _currentKeyboardOutput];
  v3 = [v7 insertionText];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    [(_UIInputViewControllerOutput *)self _pushNewKeyboardOutput];
    uint64_t v5 = [(_UIInputViewControllerOutput *)self _currentKeyboardOutput];

    id v6 = (void *)v5;
  }
  else
  {
    id v6 = v7;
  }
  id v8 = v6;
  [v6 deleteBackward];
}

- (void)adjustTextPositionByCharacterOffset:(int64_t)a3
{
  id v9 = [(_UIInputViewControllerOutput *)self _currentKeyboardOutput];
  uint64_t v5 = [v9 insertionText];
  if ([v5 length])
  {

LABEL_4:
    [(_UIInputViewControllerOutput *)self _pushNewKeyboardOutput];
    uint64_t v7 = [(_UIInputViewControllerOutput *)self _currentKeyboardOutput];

    id v8 = (void *)v7;
    goto LABEL_5;
  }
  uint64_t v6 = [v9 deletionCount];

  if (v6) {
    goto LABEL_4;
  }
  id v8 = v9;
LABEL_5:
  id v10 = v8;
  objc_msgSend(v8, "setPositionOffset:", objc_msgSend(v8, "positionOffset") + a3);
}

- (void)setInputModeList:(int64_t)a3 touchBegan:(double)a4 fromLocation:(CGPoint)a5 updatePoint:(CGPoint)a6
{
  self->_inputModeListTouchPhase = a3;
  self->_inputModeListTouchBegan = a4;
  self->_inputModeListFromLocation = a5;
  self->_inputModeListUpdatePoint = a6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(_UIInputViewControllerOutput);
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:self->_keyboardOutputs copyItems:1];
    keyboardOutputs = v4->_keyboardOutputs;
    v4->_keyboardOutputs = (NSArray *)v5;

    v4->_shouldDismiss = self->_shouldDismiss;
    v4->_proceedShouldReturn = self->_proceedShouldReturn;
    v4->_hasDictation = self->_hasDictation;
    v4->_shouldAdvanceInputMode = self->_shouldAdvanceInputMode;
    v4->_inputModeListTouchPhase = self->_inputModeListTouchPhase;
    v4->_inputModeListTouchBegan = self->_inputModeListTouchBegan;
    v4->_inputModeListFromLocation = self->_inputModeListFromLocation;
    v4->_inputModeListUpdatePoint = self->_inputModeListUpdatePoint;
    uint64_t v7 = [(NSString *)self->_primaryLanguage copy];
    primaryLanguage = v4->_primaryLanguage;
    v4->_primaryLanguage = (NSString *)v7;

    v4->_setMarkedText = self->_setMarkedText;
    uint64_t v9 = [(NSString *)self->_markedText copy];
    markedText = v4->_markedText;
    v4->_markedText = (NSString *)v9;

    v4->_selectedRange = self->_selectedRange;
    v4->_unmarkText = self->_unmarkText;
    v4->_source = self->_source;
  }
  return v4;
}

- (_UIInputViewControllerOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIInputViewControllerOutput;
  uint64_t v5 = [(_UIInputViewControllerOutput *)&v21 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keyboardOutputs"];
    keyboardOutputs = v5->_keyboardOutputs;
    v5->_keyboardOutputs = (NSArray *)v9;

    v5->_shouldDismiss = [v4 decodeBoolForKey:@"shouldDismiss"];
    v5->_proceedShouldReturn = [v4 decodeBoolForKey:@"proceedShouldReturn"];
    v5->_shouldAdvanceInputMode = [v4 decodeBoolForKey:@"shouldAdvanceInputMode"];
    v5->_hasDictation = [v4 decodeBoolForKey:@"hasDictation"];
    v5->_inputModeListTouchPhase = [v4 decodeIntegerForKey:@"setInputModeListTouchPhase"];
    [v4 decodeFloatForKey:@"setInputModeListTouchBegan"];
    v5->_inputModeListTouchBegan = v11;
    [v4 decodeFloatForKey:@"setInputModeListFromLocationX"];
    v5->_inputModeListFromLocation.x = v12;
    [v4 decodeFloatForKey:@"setInputModeListFromLocationY"];
    v5->_inputModeListFromLocation.y = v13;
    [v4 decodeFloatForKey:@"setInputModeUpdatePointX"];
    v5->_inputModeListUpdatePoint.x = v14;
    [v4 decodeFloatForKey:@"setInputModeUpdatePointY"];
    v5->_inputModeListUpdatePoint.y = v15;
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryLanguage"];
    primaryLanguage = v5->_primaryLanguage;
    v5->_primaryLanguage = (NSString *)v16;

    v5->_setMarkedText = [v4 decodeBoolForKey:@"setMarkedText"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"markedText"];
    markedText = v5->_markedText;
    v5->_markedText = (NSString *)v18;

    v5->_selectedRange.location = [v4 decodeIntegerForKey:@"selectedRangeLocation"];
    v5->_selectedRange.length = [v4 decodeIntegerForKey:@"selectedRangeLength"];
    v5->_unmarkText = [v4 decodeBoolForKey:@"unmarkText"];
    v5->_source = [v4 decodeIntegerForKey:@"source"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  keyboardOutputs = self->_keyboardOutputs;
  id v13 = v4;
  if (keyboardOutputs)
  {
    [v4 encodeObject:keyboardOutputs forKey:@"keyboardOutputs"];
    id v4 = v13;
  }
  if (self->_shouldDismiss)
  {
    [v13 encodeBool:1 forKey:@"shouldDismiss"];
    id v4 = v13;
  }
  if (self->_proceedShouldReturn)
  {
    [v13 encodeBool:1 forKey:@"proceedShouldReturn"];
    id v4 = v13;
  }
  if (self->_hasDictation)
  {
    [v13 encodeBool:1 forKey:@"hasDictation"];
    id v4 = v13;
  }
  if (self->_shouldAdvanceInputMode)
  {
    [v13 encodeBool:1 forKey:@"shouldAdvanceInputMode"];
    id v4 = v13;
  }
  if (self->_inputModeListTouchBegan != 0.0)
  {
    [v13 encodeInteger:self->_inputModeListTouchPhase forKey:@"setInputModeListTouchPhase"];
    double inputModeListTouchBegan = self->_inputModeListTouchBegan;
    *(float *)&double inputModeListTouchBegan = inputModeListTouchBegan;
    [v13 encodeFloat:@"setInputModeListTouchBegan" forKey:inputModeListTouchBegan];
    CGFloat x = self->_inputModeListFromLocation.x;
    *(float *)&CGFloat x = x;
    [v13 encodeFloat:@"setInputModeListFromLocationX" forKey:x];
    CGFloat y = self->_inputModeListFromLocation.y;
    *(float *)&CGFloat y = y;
    [v13 encodeFloat:@"setInputModeListFromLocationY" forKey:y];
    CGFloat v9 = self->_inputModeListUpdatePoint.x;
    *(float *)&CGFloat v9 = v9;
    [v13 encodeFloat:@"setInputModeUpdatePointX" forKey:v9];
    CGFloat v10 = self->_inputModeListUpdatePoint.y;
    *(float *)&CGFloat v10 = v10;
    [v13 encodeFloat:@"setInputModeUpdatePointY" forKey:v10];
    id v4 = v13;
  }
  primaryLanguage = self->_primaryLanguage;
  if (primaryLanguage)
  {
    [v13 encodeObject:primaryLanguage forKey:@"primaryLanguage"];
    id v4 = v13;
  }
  if (self->_setMarkedText)
  {
    [v13 encodeBool:1 forKey:@"setMarkedText"];
    [v13 encodeObject:self->_markedText forKey:@"markedText"];
    [v13 encodeInteger:self->_selectedRange.location forKey:@"selectedRangeLocation"];
    [v13 encodeInteger:self->_selectedRange.length forKey:@"selectedRangeLength"];
    id v4 = v13;
  }
  if (self->_unmarkText)
  {
    [v13 encodeBool:1 forKey:@"unmarkText"];
    id v4 = v13;
  }
  int64_t source = self->_source;
  if (source)
  {
    [v13 encodeInteger:source forKey:@"source"];
    id v4 = v13;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(_UIInputViewControllerOutput *)self keyboardOutputs];
    uint64_t v7 = [v5 keyboardOutputs];
    int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_27;
    }
    int v9 = [(_UIInputViewControllerOutput *)self shouldDismiss];
    if (v9 != [v5 shouldDismiss]) {
      goto LABEL_27;
    }
    int v10 = [(_UIInputViewControllerOutput *)self proceedShouldReturn];
    if (v10 != [v5 proceedShouldReturn]) {
      goto LABEL_27;
    }
    int v11 = [(_UIInputViewControllerOutput *)self hasDictation];
    if (v11 != [v5 hasDictation]) {
      goto LABEL_27;
    }
    int v12 = [(_UIInputViewControllerOutput *)self shouldAdvanceInputMode];
    if (v12 != [v5 shouldAdvanceInputMode]) {
      goto LABEL_27;
    }
    [(_UIInputViewControllerOutput *)self inputModeListTouchBegan];
    double v14 = v13;
    [v5 inputModeListTouchBegan];
    if (v14 != v15) {
      goto LABEL_27;
    }
    [(_UIInputViewControllerOutput *)self inputModeListTouchBegan];
    if (v16 != 0.0)
    {
      int64_t v17 = [(_UIInputViewControllerOutput *)self inputModeListTouchPhase];
      if (v17 != [v5 inputModeListTouchPhase]) {
        goto LABEL_27;
      }
      [(_UIInputViewControllerOutput *)self inputModeListFromLocation];
      double v19 = v18;
      double v21 = v20;
      [v5 inputModeListFromLocation];
      BOOL v23 = 0;
      if (v19 != v24) {
        goto LABEL_28;
      }
      if (v21 != v22) {
        goto LABEL_28;
      }
      [(_UIInputViewControllerOutput *)self inputModeListUpdatePoint];
      double v26 = v25;
      double v28 = v27;
      [v5 inputModeListUpdatePoint];
      BOOL v23 = 0;
      if (v26 != v30 || v28 != v29) {
        goto LABEL_28;
      }
    }
    v31 = [(_UIInputViewControllerOutput *)self primaryLanguage];
    uint64_t v32 = [v5 primaryLanguage];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(_UIInputViewControllerOutput *)self primaryLanguage];
      v35 = [v5 primaryLanguage];
      int v36 = [v34 isEqualToString:v35];

      if (!v36) {
        goto LABEL_27;
      }
    }
    int v37 = [(_UIInputViewControllerOutput *)self setMarkedText];
    if (v37 == [v5 setMarkedText])
    {
      v38 = [(_UIInputViewControllerOutput *)self markedText];
      uint64_t v39 = [v5 markedText];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(_UIInputViewControllerOutput *)self markedText];
        v42 = [v5 markedText];
        int v43 = [v41 isEqualToString:v42];

        if (!v43) {
          goto LABEL_27;
        }
      }
      uint64_t v44 = [(_UIInputViewControllerOutput *)self selectedRange];
      uint64_t v46 = v45;
      BOOL v23 = 0;
      if (v44 != [v5 selectedRange] || v46 != v47) {
        goto LABEL_28;
      }
      int v48 = [(_UIInputViewControllerOutput *)self unmarkText];
      if (v48 == [v5 unmarkText])
      {
        int64_t v50 = [(_UIInputViewControllerOutput *)self source];
        BOOL v23 = v50 == [v5 source];
        goto LABEL_28;
      }
    }
LABEL_27:
    BOOL v23 = 0;
LABEL_28:

    goto LABEL_29;
  }
  BOOL v23 = 0;
LABEL_29:

  return v23;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  id v4 = [(_UIInputViewControllerOutput *)self keyboardOutputs];
  [v3 appendFormat:@"; keyboardOutputs = %@", v4];

  if ([(_UIInputViewControllerOutput *)self shouldDismiss]) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; shouldDismiss = %s", v5);
  if ([(_UIInputViewControllerOutput *)self proceedShouldReturn]) {
    uint64_t v6 = "YES";
  }
  else {
    uint64_t v6 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; proceedShouldReturn = %s", v6);
  if ([(_UIInputViewControllerOutput *)self hasDictation]) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; hasDictation = %s", v7);
  if ([(_UIInputViewControllerOutput *)self shouldAdvanceInputMode]) {
    int v8 = "YES";
  }
  else {
    int v8 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; shouldAdvanceInputMode = %s", v8);
  objc_msgSend(v3, "appendFormat:", @"; inputModeListTouchPhase = %ld",
    [(_UIInputViewControllerOutput *)self inputModeListTouchPhase]);
  [(_UIInputViewControllerOutput *)self inputModeListTouchBegan];
  objc_msgSend(v3, "appendFormat:", @"; double inputModeListTouchBegan = %f", v9);
  [(_UIInputViewControllerOutput *)self inputModeListFromLocation];
  uint64_t v11 = v10;
  [(_UIInputViewControllerOutput *)self inputModeListFromLocation];
  objc_msgSend(v3, "appendFormat:", @"; inputModeListFromLocation = %f:%f", v11, v12);
  [(_UIInputViewControllerOutput *)self inputModeListUpdatePoint];
  uint64_t v14 = v13;
  [(_UIInputViewControllerOutput *)self inputModeListUpdatePoint];
  objc_msgSend(v3, "appendFormat:", @"; inputModeListUpdatePoint = %f:%f", v14, v15);
  double v16 = [(_UIInputViewControllerOutput *)self primaryLanguage];
  [v3 appendFormat:@"; primaryLanguage = %@", v16];

  if ([(_UIInputViewControllerOutput *)self setMarkedText]) {
    int64_t v17 = "YES";
  }
  else {
    int64_t v17 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; setMarkedText = %s", v17);
  double v18 = [(_UIInputViewControllerOutput *)self markedText];
  [v3 appendFormat:@"; markedText = %@", v18];

  uint64_t v19 = [(_UIInputViewControllerOutput *)self selectedRange];
  [(_UIInputViewControllerOutput *)self selectedRange];
  objc_msgSend(v3, "appendFormat:", @"; selectedRange location = %ld length = %ld", v19, v20);
  if ([(_UIInputViewControllerOutput *)self unmarkText]) {
    double v21 = "YES";
  }
  else {
    double v21 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; unmarkText = %s", v21);
  objc_msgSend(v3, "appendFormat:", @"; int64_t source = %ld", -[_UIInputViewControllerOutput source](self, "source"));
  [v3 appendString:@">"];
  return v3;
}

- (NSArray)keyboardOutputs
{
  return self->_keyboardOutputs;
}

- (void)setKeyboardOutputs:(id)a3
{
}

- (BOOL)shouldDismiss
{
  return self->_shouldDismiss;
}

- (void)setShouldDismiss:(BOOL)a3
{
  self->_shouldDismiss = a3;
}

- (BOOL)proceedShouldReturn
{
  return self->_proceedShouldReturn;
}

- (void)setProceedShouldReturn:(BOOL)a3
{
  self->_proceedShouldReturn = a3;
}

- (BOOL)shouldAdvanceInputMode
{
  return self->_shouldAdvanceInputMode;
}

- (void)setShouldAdvanceInputMode:(BOOL)a3
{
  self->_shouldAdvanceInputMode = a3;
}

- (NSString)primaryLanguage
{
  return self->_primaryLanguage;
}

- (void)setPrimaryLanguage:(id)a3
{
}

- (BOOL)hasDictation
{
  return self->_hasDictation;
}

- (void)setHasDictation:(BOOL)a3
{
  self->_hasDictation = a3;
}

- (BOOL)setMarkedText
{
  return self->_setMarkedText;
}

- (void)setSetMarkedText:(BOOL)a3
{
  self->_setMarkedText = a3;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectedRange:(_NSRange)a3
{
  self->_selectedRange = a3;
}

- (BOOL)unmarkText
{
  return self->_unmarkText;
}

- (void)setUnmarkText:(BOOL)a3
{
  self->_unmarkText = a3;
}

- (int64_t)inputModeListTouchPhase
{
  return self->_inputModeListTouchPhase;
}

- (void)setInputModeListTouchPhase:(int64_t)a3
{
  self->_inputModeListTouchPhase = a3;
}

- (double)inputModeListTouchBegan
{
  return self->_inputModeListTouchBegan;
}

- (void)setInputModeListTouchBegan:(double)a3
{
  self->_double inputModeListTouchBegan = a3;
}

- (CGPoint)inputModeListFromLocation
{
  double x = self->_inputModeListFromLocation.x;
  double y = self->_inputModeListFromLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInputModeListFromLocation:(CGPoint)a3
{
  self->_inputModeListFromLocation = a3;
}

- (CGPoint)inputModeListUpdatePoint
{
  double x = self->_inputModeListUpdatePoint.x;
  double y = self->_inputModeListUpdatePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInputModeListUpdatePoint:(CGPoint)a3
{
  self->_inputModeListUpdatePoint = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_int64_t source = a3;
}

- (BOOL)requiresInputManagerSync
{
  return self->_requiresInputManagerSync;
}

- (void)setRequiresInputManagerSync:(BOOL)a3
{
  self->_requiresInputManagerSync = a3;
}

- (BOOL)shouldAdvanceResponder
{
  return self->_shouldAdvanceResponder;
}

- (void)setShouldAdvanceResponder:(BOOL)a3
{
  self->_shouldAdvanceResponder = a3;
}

- (BOOL)shouldPostReturnKeyNotification
{
  return self->_shouldPostReturnKeyNotification;
}

- (void)setShouldPostReturnKeyNotification:(BOOL)a3
{
  self->_shouldPostReturnKeyNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_primaryLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardOutputs, 0);
}

@end
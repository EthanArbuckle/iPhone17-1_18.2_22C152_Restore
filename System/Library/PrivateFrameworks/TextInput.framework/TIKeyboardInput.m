@interface TIKeyboardInput
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutoshifted;
- (BOOL)isBackspace;
- (BOOL)isDoubleSpace;
- (BOOL)isExpandSegment;
- (BOOL)isFlick;
- (BOOL)isGesture;
- (BOOL)isMultitap;
- (BOOL)isPopupVariant;
- (BOOL)isRapidDelete;
- (BOOL)isShiftDown;
- (BOOL)isShrinkSegment;
- (BOOL)isSynthesizedByAcceptingCandidate;
- (BOOL)isUppercase;
- (NSCopying)object;
- (NSString)inputManagerHint;
- (NSString)string;
- (TIHandwritingStrokes)handwritingStrokes;
- (TIKeyboardCandidate)acceptedCandidate;
- (TIKeyboardInput)initWithCoder:(id)a3;
- (TIKeyboardOutput)output;
- (TIKeyboardTouchEvent)touchEvent;
- (double)timestamp;
- (id)description;
- (int64_t)transliterationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptedCandidate:(id)a3;
- (void)setAutoshifted:(BOOL)a3;
- (void)setBackspace:(BOOL)a3;
- (void)setDoubleSpace:(BOOL)a3;
- (void)setExpandSegment:(BOOL)a3;
- (void)setFlick:(BOOL)a3;
- (void)setGesture:(BOOL)a3;
- (void)setHandwritingStrokes:(id)a3;
- (void)setInputManagerHint:(id)a3;
- (void)setMultitap:(BOOL)a3;
- (void)setObject:(id)a3;
- (void)setOutput:(id)a3;
- (void)setPopupVariant:(BOOL)a3;
- (void)setRapidDelete:(BOOL)a3;
- (void)setShiftDown:(BOOL)a3;
- (void)setShrinkSegment:(BOOL)a3;
- (void)setString:(id)a3;
- (void)setSynthesizedByAcceptingCandidate:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setTouchEvent:(id)a3;
- (void)setTransliterationType:(int64_t)a3;
- (void)setUppercase:(BOOL)a3;
@end

@implementation TIKeyboardInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_touchEvent, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_handwritingStrokes, 0);
  objc_storeStrong((id *)&self->_inputManagerHint, 0);

  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setOutput:(id)a3
{
}

- (TIKeyboardOutput)output
{
  return self->_output;
}

- (void)setTouchEvent:(id)a3
{
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return self->_string;
}

- (void)setHandwritingStrokes:(id)a3
{
}

- (TIHandwritingStrokes)handwritingStrokes
{
  return self->_handwritingStrokes;
}

- (void)setInputManagerHint:(id)a3
{
}

- (NSString)inputManagerHint
{
  return self->_inputManagerHint;
}

- (void)setBackspace:(BOOL)a3
{
  self->_backspace = a3;
}

- (BOOL)isBackspace
{
  return self->_backspace;
}

- (void)setAcceptedCandidate:(id)a3
{
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(TIKeyboardInput *)self string];
  [v3 appendFormat:@"; string = \"%@\"", v4];

  v5 = [(TIKeyboardInput *)self output];
  [v3 appendFormat:@"; output = \"%@\"", v5];

  v6 = [(TIKeyboardInput *)self object];
  [v3 appendFormat:@"; object = \"%@\"", v6];

  BOOL v7 = [(TIKeyboardInput *)self isBackspace];
  v8 = "NO";
  if (v7) {
    v8 = "YES";
  }
  objc_msgSend(v3, "appendFormat:", @"; backspace = %s", v8);
  objc_msgSend(v3, "appendString:", @"; flags =(");
  if ([(TIKeyboardInput *)self isUppercase]) {
    [v3 appendString:@"isUpperCase "];
  }
  if ([(TIKeyboardInput *)self isAutoshifted]) {
    [v3 appendString:@"isAutoshifted "];
  }
  if ([(TIKeyboardInput *)self isPopupVariant]) {
    [v3 appendString:@"isPopupVariant "];
  }
  if ([(TIKeyboardInput *)self isMultitap]) {
    [v3 appendString:@"isMultitap "];
  }
  if ([(TIKeyboardInput *)self isFlick]) {
    [v3 appendString:@"isFlick"];
  }
  if ([(TIKeyboardInput *)self isGesture]) {
    [v3 appendString:@"isGesture"];
  }
  if ([(TIKeyboardInput *)self isSynthesizedByAcceptingCandidate]) {
    [v3 appendString:@"isSynthesizedByAcceptingCandidate "];
  }
  if ([(TIKeyboardInput *)self isDoubleSpace]) {
    [v3 appendString:@"isDoubleSpace "];
  }
  if ([(TIKeyboardInput *)self isRapidDelete]) {
    [v3 appendString:@"isRapidDelete "];
  }
  if ([(TIKeyboardInput *)self isShiftDown]) {
    [v3 appendString:@"isShiftDown "];
  }
  [v3 appendString:@""]);
  v9 = [(TIKeyboardInput *)self touchEvent];
  [v3 appendFormat:@"; touchEvent = %@", v9];

  v10 = [(TIKeyboardInput *)self acceptedCandidate];
  [v3 appendFormat:@"; acceptedCandidate = %@", v10];

  v11 = [(TIKeyboardInput *)self inputManagerHint];
  [v3 appendFormat:@"; inputManagerHint = %@", v11];

  objc_msgSend(v3, "appendFormat:", @"; transliterateType = %ld",
    [(TIKeyboardInput *)self transliterationType]);
  [v3 appendString:@">"];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  string = self->_string;
  id v13 = v4;
  if (string)
  {
    [v4 encodeObject:string forKey:@"string"];
    id v4 = v13;
  }
  output = self->_output;
  if (output)
  {
    [v13 encodeObject:output forKey:@"output"];
    id v4 = v13;
  }
  handwritingStrokes = self->_handwritingStrokes;
  if (handwritingStrokes)
  {
    [v13 encodeObject:handwritingStrokes forKey:@"handwritingStrokes"];
    id v4 = v13;
  }
  if (self->_backspace)
  {
    [v13 encodeBool:1 forKey:@"backspace"];
    id v4 = v13;
  }
  int64_t integerValue = self->_flags.integerValue;
  if (integerValue)
  {
    [v13 encodeInteger:integerValue forKey:@"flags"];
    id v4 = v13;
  }
  touchEvent = self->_touchEvent;
  if (touchEvent)
  {
    [v13 encodeObject:touchEvent forKey:@"touchEvent"];
    id v4 = v13;
  }
  acceptedCandidate = self->_acceptedCandidate;
  if (acceptedCandidate)
  {
    [v13 encodeObject:acceptedCandidate forKey:@"acceptedCandidate"];
    id v4 = v13;
  }
  inputManagerHint = self->_inputManagerHint;
  if (inputManagerHint)
  {
    [v13 encodeObject:inputManagerHint forKey:@"inputManagerHint"];
    id v4 = v13;
  }
  int64_t transliterationType = self->_transliterationType;
  if (transliterationType)
  {
    [v13 encodeInteger:transliterationType forKey:@"transliterateType"];
    id v4 = v13;
  }
}

- (TIKeyboardInput)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInput;
  v5 = [(TIKeyboardInput *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"string"];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"output"];
    output = v5->_output;
    v5->_output = (TIKeyboardOutput *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handwritingStrokes"];
    handwritingStrokes = v5->_handwritingStrokes;
    v5->_handwritingStrokes = (TIHandwritingStrokes *)v10;

    v5->_backspace = [v4 decodeBoolForKey:@"backspace"];
    v5->_flags.int64_t integerValue = [v4 decodeIntegerForKey:@"flags"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"touchEvent"];
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptedCandidate"];
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputManagerHint"];
    inputManagerHint = v5->_inputManagerHint;
    v5->_inputManagerHint = (NSString *)v16;

    v5->_int64_t transliterationType = (int)[v4 decodeIntForKey:@"transliterateType"];
    v18 = v5;
  }

  return v5;
}

- (void)setObject:(id)a3
{
  id v4 = (TIHandwritingStrokes *)a3;
  objc_opt_class();
  objc_opt_isKindOfClass();
  handwritingStrokes = self->_handwritingStrokes;
  self->_handwritingStrokes = v4;
}

- (NSCopying)object
{
  return (NSCopying *)self->_handwritingStrokes;
}

- (void)setUppercase:(BOOL)a3
{
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFE | a3;
}

- (BOOL)isUppercase
{
  return self->_flags.integerValue & 1;
}

- (void)setSynthesizedByAcceptingCandidate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFBF | v3;
}

- (BOOL)isSynthesizedByAcceptingCandidate
{
  return (LOWORD(self->_flags.integerValue) >> 6) & 1;
}

- (void)setShrinkSegment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xF7FF | v3;
}

- (BOOL)isShrinkSegment
{
  return (LOWORD(self->_flags.integerValue) >> 11) & 1;
}

- (void)setShiftDown:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFDFF | v3;
}

- (BOOL)isShiftDown
{
  return (LOWORD(self->_flags.integerValue) >> 9) & 1;
}

- (void)setRapidDelete:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFEFF | v3;
}

- (BOOL)isRapidDelete
{
  return HIBYTE(LOWORD(self->_flags.integerValue)) & 1;
}

- (void)setPopupVariant:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFB | v3;
}

- (BOOL)isPopupVariant
{
  return (LOWORD(self->_flags.integerValue) >> 2) & 1;
}

- (void)setMultitap:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFF7 | v3;
}

- (BOOL)isMultitap
{
  return (LOWORD(self->_flags.integerValue) >> 3) & 1;
}

- (void)setGesture:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFDF | v3;
}

- (BOOL)isGesture
{
  return (LOWORD(self->_flags.integerValue) >> 5) & 1;
}

- (void)setFlick:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFEF | v3;
}

- (BOOL)isFlick
{
  return (LOWORD(self->_flags.integerValue) >> 4) & 1;
}

- (void)setExpandSegment:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFBFF | v3;
}

- (BOOL)isExpandSegment
{
  return (LOWORD(self->_flags.integerValue) >> 10) & 1;
}

- (void)setDoubleSpace:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFF7F | v3;
}

- (BOOL)isDoubleSpace
{
  return (LOWORD(self->_flags.integerValue) >> 7) & 1;
}

- (void)setAutoshifted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_flags.integerValue) = self->_flags.integerValue & 0xFFFD | v3;
}

- (BOOL)isAutoshifted
{
  return (LOWORD(self->_flags.integerValue) >> 1) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
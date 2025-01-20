@interface TIUserAction
+ (BOOL)supportsSecureCoding;
- (TIDocumentState)documentState;
- (TIKeyboardState)keyboardState;
- (TIUserAction)initWithCoder:(id)a3;
- (TIUserAction)initWithTIKeyboardState:(id)a3;
- (double)endTime;
- (double)occurenceTime;
- (double)startTime;
- (id)description;
- (int)actionType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(int)a3;
- (void)setDocumentState:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setKeyboardState:(id)a3;
- (void)setOccurenceTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation TIUserAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardState, 0);

  objc_storeStrong((id *)&self->_documentState, 0);
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setDocumentState:(id)a3
{
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setActionType:(int)a3
{
  self->_actionType = a3;
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setOccurenceTime:(double)a3
{
  self->_occurenceTime = a3;
}

- (double)occurenceTime
{
  return self->_occurenceTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)description
{
  v2 = NSString;
  v3 = [(TIUserAction *)self documentState];
  v4 = [v3 contextBeforeInput];
  v5 = [v2 stringWithFormat:@"%@<>", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double startTime = self->_startTime;
  id v5 = a3;
  [v5 encodeDouble:@"startTime" forKey:startTime];
  [v5 encodeDouble:@"endTime" forKey:self->_endTime];
  [v5 encodeDouble:@"occurenceTime" forKey:self->_occurenceTime];
  [v5 encodeInt:self->_actionType forKey:@"actionType"];
  [v5 encodeObject:self->_documentState forKey:@"documentState"];
  [v5 encodeObject:self->_keyboardState forKey:@"keyboardState"];
}

- (TIUserAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIUserAction;
  id v5 = [(TIUserAction *)&v14 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"startTime"];
    v5->_double startTime = v6;
    [v4 decodeDoubleForKey:@"endTime"];
    v5->_endTime = v7;
    [v4 decodeDoubleForKey:@"occurenceTime"];
    v5->_occurenceTime = v8;
    v5->_actionType = [v4 decodeIntForKey:@"actionType"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v11;
  }
  return v5;
}

- (TIUserAction)initWithTIKeyboardState:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIUserAction;
  double v6 = [(TIUserAction *)&v9 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyboardState, a3);
    v7->_occurenceTime = -1.0;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
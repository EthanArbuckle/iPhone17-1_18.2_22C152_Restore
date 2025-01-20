@interface TITypologyRecordSkipHitTest
+ (BOOL)supportsSecureCoding;
- (TIKeyboardLayout)keyLayout;
- (TIKeyboardState)keyboardState;
- (TIKeyboardTouchEvent)touchEvent;
- (TITypologyRecordSkipHitTest)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setKeyLayout:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setTouchEvent:(id)a3;
@end

@implementation TITypologyRecordSkipHitTest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);

  objc_storeStrong((id *)&self->_touchEvent, 0);
}

- (void)setKeyLayout:(id)a3
{
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setTouchEvent:(id)a3
{
}

- (TIKeyboardTouchEvent)touchEvent
{
  return self->_touchEvent;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordSkipHitTest *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(TITypologyRecordSkipHitTest *)self touchEvent];
  id v4 = [v3 shortDescription];
  id v5 = [v2 stringWithFormat:@"SKIP HIT TEST at %@", v4];

  return v5;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordSkipHitTest *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordSkipHitTest *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordSkipHitTest;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_touchEvent, @"touchEvent", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_keyLayout forKey:@"keyLayout"];
}

- (TITypologyRecordSkipHitTest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TITypologyRecordSkipHitTest;
  objc_super v5 = [(TITypologyRecord *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"touchEvent"];
    touchEvent = v5->_touchEvent;
    v5->_touchEvent = (TIKeyboardTouchEvent *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyLayout"];
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end
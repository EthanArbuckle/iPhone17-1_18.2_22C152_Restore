@interface TITypologyRecordPhraseBoundaryAdjustment
+ (BOOL)supportsSecureCoding;
- (BOOL)forwardAdjustment;
- (TIKeyboardConfiguration)keyboardConfig;
- (TIKeyboardState)keyboardState;
- (TITypologyRecordPhraseBoundaryAdjustment)initWithCoder:(id)a3;
- (id)shortDescription;
- (int)granularity;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeContextFromKeyboardState;
- (void)replaceDocumentState:(id)a3;
- (void)setForwardAdjustment:(BOOL)a3;
- (void)setGranularity:(int)a3;
- (void)setKeyboardConfig:(id)a3;
- (void)setKeyboardState:(id)a3;
@end

@implementation TITypologyRecordPhraseBoundaryAdjustment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardConfig, 0);

  objc_storeStrong((id *)&self->_keyboardState, 0);
}

- (void)setKeyboardConfig:(id)a3
{
}

- (TIKeyboardConfiguration)keyboardConfig
{
  return self->_keyboardConfig;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setGranularity:(int)a3
{
  self->_granularity = a3;
}

- (int)granularity
{
  return self->_granularity;
}

- (void)setForwardAdjustment:(BOOL)a3
{
  self->_forwardAdjustment = a3;
}

- (BOOL)forwardAdjustment
{
  return self->_forwardAdjustment;
}

- (void)replaceDocumentState:(id)a3
{
  id v4 = a3;
  id v5 = [(TITypologyRecordPhraseBoundaryAdjustment *)self keyboardState];
  [v5 setDocumentState:v4];
}

- (id)shortDescription
{
  v3 = NSString;
  if ([(TITypologyRecordPhraseBoundaryAdjustment *)self forwardAdjustment]) {
    id v4 = "YES";
  }
  else {
    id v4 = "NO";
  }
  uint64_t v5 = [(TITypologyRecordPhraseBoundaryAdjustment *)self granularity];
  v6 = [(TITypologyRecordPhraseBoundaryAdjustment *)self keyboardConfig];
  v7 = [v6 intermediateText];
  v8 = [v3 stringWithFormat:@"ADJUST PHRASE BOUNDARY forward = %s granularity = %d; %@", v4, v5, v7];;

  return v8;
}

- (void)removeContextFromKeyboardState
{
  v3 = [(TITypologyRecordPhraseBoundaryAdjustment *)self keyboardState];
  id v4 = (id)[v3 copy];

  [v4 setInputContextHistory:0];
  [(TITypologyRecordPhraseBoundaryAdjustment *)self setKeyboardState:v4];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TITypologyRecordPhraseBoundaryAdjustment;
  id v4 = a3;
  [(TITypologyRecord *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_forwardAdjustment, @"forwardAdjustment", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_granularity forKey:@"granularity"];
  [v4 encodeObject:self->_keyboardState forKey:@"keyboardState"];
  [v4 encodeObject:self->_keyboardConfig forKey:@"keyboardConfig"];
}

- (TITypologyRecordPhraseBoundaryAdjustment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TITypologyRecordPhraseBoundaryAdjustment;
  objc_super v5 = [(TITypologyRecord *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_forwardAdjustment = [v4 decodeBoolForKey:@"forwardAdjustment"];
    v5->_granularity = [v4 decodeIntegerForKey:@"granularity"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardState"];
    keyboardState = v5->_keyboardState;
    v5->_keyboardState = (TIKeyboardState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyboardConfig"];
    keyboardConfig = v5->_keyboardConfig;
    v5->_keyboardConfig = (TIKeyboardConfiguration *)v8;
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
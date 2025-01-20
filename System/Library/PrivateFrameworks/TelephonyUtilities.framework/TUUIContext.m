@interface TUUIContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isFullScreen;
- (BOOL)isMicIndicatorVisible;
- (TUUIContext)initWithCoder:(id)a3;
- (TUUIContext)initWithState:(unint64_t)a3;
- (unint64_t)inCallUIState;
- (void)encodeWithCoder:(id)a3;
- (void)setInCallUIState:(unint64_t)a3;
@end

@implementation TUUIContext

- (TUUIContext)initWithState:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUUIContext;
  result = [(TUUIContext *)&v5 init];
  if (result) {
    result->_inCallUIState = a3;
  }
  return result;
}

- (BOOL)isMicIndicatorVisible
{
  return ([(TUUIContext *)self inCallUIState] >> 1) & 1;
}

- (BOOL)isFullScreen
{
  return [(TUUIContext *)self inCallUIState] & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUUIContext)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TUUIContext *)self init];
  if (v5) {
    -[TUUIContext setInCallUIState:](v5, "setInCallUIState:", [v4 decodeIntegerForKey:@"inCallUIState"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TUUIContext inCallUIState](self, "inCallUIState"), @"inCallUIState");
}

- (unint64_t)inCallUIState
{
  return self->_inCallUIState;
}

- (void)setInCallUIState:(unint64_t)a3
{
  self->_inCallUIState = a3;
}

@end
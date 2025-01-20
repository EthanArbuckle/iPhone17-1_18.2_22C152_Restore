@interface UIPressInfo
+ (id)_keyboardPressInfoForType:(int64_t)a3 isKeyDown:(BOOL)a4 timestamp:(double)a5 contextID:(unsigned int)a6 modifierFlags:(int64_t)a7;
- (BOOL)isLongClick;
- (UIKey)key;
- (UIPressInfo)init;
- (double)force;
- (double)timestamp;
- (id)_sourceDescription;
- (id)description;
- (int64_t)modifierFlags;
- (int64_t)phase;
- (int64_t)type;
- (unint64_t)clickCount;
- (unint64_t)gameControllerComponent;
- (unint64_t)source;
- (unsigned)contextID;
- (void)setClickCount:(unint64_t)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setForce:(double)a3;
- (void)setGameControllerComponent:(unint64_t)a3;
- (void)setKey:(id)a3;
- (void)setLongClick:(BOOL)a3;
- (void)setModifierFlags:(int64_t)a3;
- (void)setPhase:(int64_t)a3;
- (void)setSource:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
@end

@implementation UIPressInfo

- (UIPressInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPressInfo;
  result = [(UIPressInfo *)&v3 init];
  if (result) {
    result->_clickCount = 1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(UIPressInfo *)self phase];
  int64_t v6 = [(UIPressInfo *)self type];
  [(UIPressInfo *)self force];
  uint64_t v8 = v7;
  v9 = [(UIPressInfo *)self _sourceDescription];
  v10 = [v3 stringWithFormat:@"<%@: %p phase=%ld type=%ld force=%f, source=%@, contextID=%u>", v4, self, v5, v6, v8, v9, -[UIPressInfo contextID](self, "contextID")];

  return v10;
}

- (id)_sourceDescription
{
  unint64_t v2 = self->_source - 1;
  if (v2 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5304398[v2];
  }
}

+ (id)_keyboardPressInfoForType:(int64_t)a3 isKeyDown:(BOOL)a4 timestamp:(double)a5 contextID:(unsigned int)a6 modifierFlags:(int64_t)a7
{
  uint64_t v8 = *(void *)&a6;
  BOOL v10 = a4;
  id v12 = objc_alloc_init((Class)a1);
  [v12 setType:a3];
  double v13 = 0.0;
  if (v10)
  {
    double v13 = 1.0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 3;
  }
  [v12 setForce:v13];
  [v12 setPhase:v14];
  [v12 setTimestamp:a5];
  [v12 setSource:1];
  [v12 setContextID:v8];
  [v12 setModifierFlags:a7];
  return v12;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)phase
{
  return self->_phase;
}

- (void)setPhase:(int64_t)a3
{
  self->_phase = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (unint64_t)gameControllerComponent
{
  return self->_gameControllerComponent;
}

- (void)setGameControllerComponent:(unint64_t)a3
{
  self->_gameControllerComponent = a3;
}

- (double)force
{
  return self->_force;
}

- (void)setForce:(double)a3
{
  self->_force = a3;
}

- (unint64_t)clickCount
{
  return self->_clickCount;
}

- (void)setClickCount:(unint64_t)a3
{
  self->_clickCount = a3;
}

- (BOOL)isLongClick
{
  return self->_longClick;
}

- (void)setLongClick:(BOOL)a3
{
  self->_longClick = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_contextID = a3;
}

- (UIKey)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (void).cxx_destruct
{
}

@end
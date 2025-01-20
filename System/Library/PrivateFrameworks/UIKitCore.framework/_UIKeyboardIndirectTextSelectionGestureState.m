@interface _UIKeyboardIndirectTextSelectionGestureState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShiftKeyBeingHeld;
- (CGPoint)translation;
- (_UIKeyboardIndirectTextSelectionGestureState)initWithCoder:(id)a3;
- (int64_t)state;
- (int64_t)type;
- (unint64_t)flickDirection;
- (unint64_t)touchCount;
- (void)encodeWithCoder:(id)a3;
- (void)setFlickDirection:(unint64_t)a3;
- (void)setIsShiftKeyBeingHeld:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTouchCount:(unint64_t)a3;
- (void)setTranslation:(CGPoint)a3;
- (void)setType:(int64_t)a3;
@end

@implementation _UIKeyboardIndirectTextSelectionGestureState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIKeyboardIndirectTextSelectionGestureState)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyboardIndirectTextSelectionGestureState;
  v5 = [(_UIKeyboardIndirectTextSelectionGestureState *)&v9 init];
  if (v5)
  {
    v5->_type = (int)[v4 decodeIntForKey:@"Type"];
    v5->_state = (int)[v4 decodeIntForKey:@"State"];
    [v4 decodeCGPointForKey:@"Translation"];
    v5->_translation.x = v6;
    v5->_translation.y = v7;
    v5->_flickDirection = (int)[v4 decodeIntForKey:@"FlickDirection"];
    v5->_isShiftKeyBeingHeld = [v4 decodeBoolForKey:@"Shift"];
    v5->_touchCount = (int)[v4 decodeIntForKey:@"TouchCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  [v5 encodeInt:LODWORD(self->_type) forKey:@"Type"];
  [v5 encodeInt:LODWORD(self->_state) forKey:@"State"];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"Translation", self->_translation.x, self->_translation.y);
  [v5 encodeInt:LODWORD(self->_flickDirection) forKey:@"FlickDirection"];
  if (self->_isShiftKeyBeingHeld) {
    [v5 encodeBool:1 forKey:@"Shift"];
  }
  unint64_t touchCount = self->_touchCount;
  if (touchCount) {
    [v5 encodeInt:touchCount forKey:@"TouchCount"];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_UIKeyboardIndirectTextSelectionGestureState *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = 0;
    goto LABEL_13;
  }
  id v5 = v4;
  int64_t v6 = [(_UIKeyboardIndirectTextSelectionGestureState *)self type];
  if (v6 != [(_UIKeyboardIndirectTextSelectionGestureState *)v5 type]) {
    goto LABEL_9;
  }
  int64_t v7 = [(_UIKeyboardIndirectTextSelectionGestureState *)self state];
  if (v7 != [(_UIKeyboardIndirectTextSelectionGestureState *)v5 state]) {
    goto LABEL_9;
  }
  [(_UIKeyboardIndirectTextSelectionGestureState *)self translation];
  double v9 = v8;
  double v11 = v10;
  [(_UIKeyboardIndirectTextSelectionGestureState *)v5 translation];
  BOOL v13 = 0;
  if (v9 != v14 || v11 != v12) {
    goto LABEL_10;
  }
  unint64_t v15 = [(_UIKeyboardIndirectTextSelectionGestureState *)self flickDirection];
  if (v15 == [(_UIKeyboardIndirectTextSelectionGestureState *)v5 flickDirection]
    && (BOOL v16 = [(_UIKeyboardIndirectTextSelectionGestureState *)self isShiftKeyBeingHeld],
        v16 == [(_UIKeyboardIndirectTextSelectionGestureState *)v5 isShiftKeyBeingHeld]))
  {
    unint64_t v18 = [(_UIKeyboardIndirectTextSelectionGestureState *)self touchCount];
    BOOL v13 = v18 == [(_UIKeyboardIndirectTextSelectionGestureState *)v5 touchCount];
  }
  else
  {
LABEL_9:
    BOOL v13 = 0;
  }
LABEL_10:

LABEL_13:
  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (unint64_t)flickDirection
{
  return self->_flickDirection;
}

- (void)setFlickDirection:(unint64_t)a3
{
  self->_flickDirection = a3;
}

- (BOOL)isShiftKeyBeingHeld
{
  return self->_isShiftKeyBeingHeld;
}

- (void)setIsShiftKeyBeingHeld:(BOOL)a3
{
  self->_isShiftKeyBeingHeld = a3;
}

- (unint64_t)touchCount
{
  return self->_touchCount;
}

- (void)setTouchCount:(unint64_t)a3
{
  self->_unint64_t touchCount = a3;
}

@end
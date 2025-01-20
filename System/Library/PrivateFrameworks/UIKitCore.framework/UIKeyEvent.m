@interface UIKeyEvent
+ (id)stringFromKeyEventType:(int64_t)a3;
+ (int64_t)modifierFlagsFromWebFlags:(unsigned int)a3;
+ (int64_t)typeFromWebEventType:(int)a3;
- (BOOL)isKeyRepeating;
- (NSString)characters;
- (NSString)charactersIgnoringModifiers;
- (NSString)inputManagerHint;
- (UIKeyEvent)initWithWebEvent:(id)a3;
- (WebEvent)webEvent;
- (double)timestamp;
- (id)copyWithUpdatedKeyEventType:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)inputFlags;
- (int64_t)keyCode;
- (int64_t)modifierFlags;
- (int64_t)type;
- (void)setCharacters:(id)a3;
- (void)setCharactersIgnoringModifiers:(id)a3;
- (void)setInputFlags:(int)a3;
- (void)setInputManagerHint:(id)a3;
- (void)setKeyCode:(int64_t)a3;
- (void)setKeyRepeating:(BOOL)a3;
- (void)setModifierFlags:(int64_t)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setWebEvent:(id)a3;
@end

@implementation UIKeyEvent

- (UIKeyEvent)initWithWebEvent:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UIKeyEvent;
  v6 = [(UIKeyEvent *)&v15 init];
  if (v6)
  {
    v6->_type = objc_msgSend((id)objc_opt_class(), "typeFromWebEventType:", objc_msgSend(v5, "type"));
    uint64_t v7 = [v5 characters];
    characters = v6->_characters;
    v6->_characters = (NSString *)v7;

    uint64_t v9 = [v5 charactersIgnoringModifiers];
    charactersIgnoringModifiers = v6->_charactersIgnoringModifiers;
    v6->_charactersIgnoringModifiers = (NSString *)v9;

    v6->_keyRepeating = [v5 isKeyRepeating];
    v6->_keyCode = [v5 keyCode];
    [v5 timestamp];
    v6->_timestamp = v11;
    v6->_modifierFlags = objc_msgSend((id)objc_opt_class(), "modifierFlagsFromWebFlags:", objc_msgSend(v5, "modifierFlags"));
    objc_storeStrong((id *)&v6->_webEvent, a3);
    uint64_t v12 = [v5 inputManagerHint];
    inputManagerHint = v6->_inputManagerHint;
    v6->_inputManagerHint = (NSString *)v12;

    v6->_inputFlags = [v5 keyboardFlags];
  }

  return v6;
}

- (id)copyWithUpdatedKeyEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIKeyEvent.m", 55, @"Invalid parameter not satisfying: %@", @"type == UIKeyEventKeyDown || type == UIKeyEventKeyUp" object file lineNumber description];
  }
  id v5 = (void *)[(UIKeyEvent *)self copy];
  [v5 setType:a3];
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(UIKeyEvent);
  id v5 = [(UIKeyEvent *)self characters];
  v6 = (void *)[v5 copy];
  [(UIKeyEvent *)v4 setCharacters:v6];

  uint64_t v7 = [(UIKeyEvent *)self charactersIgnoringModifiers];
  v8 = (void *)[v7 copy];
  [(UIKeyEvent *)v4 setCharactersIgnoringModifiers:v8];

  [(UIKeyEvent *)v4 setType:[(UIKeyEvent *)self type]];
  [(UIKeyEvent *)v4 setKeyRepeating:[(UIKeyEvent *)self isKeyRepeating]];
  [(UIKeyEvent *)v4 setKeyCode:[(UIKeyEvent *)self keyCode]];
  [(UIKeyEvent *)self timestamp];
  -[UIKeyEvent setTimestamp:](v4, "setTimestamp:");
  [(UIKeyEvent *)v4 setModifierFlags:[(UIKeyEvent *)self modifierFlags]];
  uint64_t v9 = [(UIKeyEvent *)self webEvent];
  [(UIKeyEvent *)v4 setWebEvent:v9];

  [(UIKeyEvent *)v4 setInputFlags:[(UIKeyEvent *)self inputFlags]];
  v10 = [(UIKeyEvent *)self inputManagerHint];
  double v11 = (void *)[v10 copy];
  [(UIKeyEvent *)v4 setInputManagerHint:v11];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(UIKeyEvent *)self characters];
  uint64_t v7 = [(UIKeyEvent *)self charactersIgnoringModifiers];
  v8 = objc_msgSend((id)objc_opt_class(), "stringFromKeyEventType:", -[UIKeyEvent type](self, "type"));
  BOOL v9 = [(UIKeyEvent *)self isKeyRepeating];
  int64_t v10 = [(UIKeyEvent *)self keyCode];
  [(UIKeyEvent *)self timestamp];
  uint64_t v12 = [v3 stringWithFormat:@"<%@: %p chars: %@, charsIgnoringModifiers: %@, type: %@, repeating: %d, keyCode: 0x%.4lX, timestamp: %lf, modifierFlags: %lX>", v5, self, v6, v7, v8, v9, v10, v11, -[UIKeyEvent modifierFlags](self, "modifierFlags")];

  return v12;
}

+ (id)stringFromKeyEventType:(int64_t)a3
{
  if (a3 == 1) {
    return @"KeyDown";
  }
  else {
    return @"KeyUp";
  }
}

+ (int64_t)typeFromWebEventType:(int)a3
{
  if (a3 == 5) {
    return 2;
  }
  else {
    return a3 == 4;
  }
}

+ (int64_t)modifierFlagsFromWebFlags:(unsigned int)a3
{
  if ((a3 & 0x220000) != 0) {
    unint64_t v3 = ((unint64_t)((a3 & 0x1010000) != 0) << 20) | 0x20000;
  }
  else {
    unint64_t v3 = (unint64_t)((a3 & 0x1010000) != 0) << 20;
  }
  if ((a3 & 0x480000) != 0) {
    v3 |= 0x80000uLL;
  }
  if ((a3 & 0x900000) != 0) {
    v3 |= 0x40000uLL;
  }
  return v3 | (a3 >> 2) & 0x10000;
}

- (NSString)characters
{
  return self->_characters;
}

- (void)setCharacters:(id)a3
{
}

- (NSString)charactersIgnoringModifiers
{
  return self->_charactersIgnoringModifiers;
}

- (void)setCharactersIgnoringModifiers:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)isKeyRepeating
{
  return self->_keyRepeating;
}

- (void)setKeyRepeating:(BOOL)a3
{
  self->_keyRepeating = a3;
}

- (int64_t)keyCode
{
  return self->_keyCode;
}

- (void)setKeyCode:(int64_t)a3
{
  self->_keyCode = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (int)inputFlags
{
  return self->_inputFlags;
}

- (void)setInputFlags:(int)a3
{
  self->_inputFlags = a3;
}

- (NSString)inputManagerHint
{
  return self->_inputManagerHint;
}

- (void)setInputManagerHint:(id)a3
{
}

- (WebEvent)webEvent
{
  return self->_webEvent;
}

- (void)setWebEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEvent, 0);
  objc_storeStrong((id *)&self->_inputManagerHint, 0);
  objc_storeStrong((id *)&self->_charactersIgnoringModifiers, 0);
  objc_storeStrong((id *)&self->_characters, 0);
}

@end
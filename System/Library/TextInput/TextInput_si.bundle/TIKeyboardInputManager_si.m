@interface TIKeyboardInputManager_si
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (unsigned)composedCharacterWithInputCharacter:(unsigned __int16)a3;
- (unsigned)lastTypedChar;
- (void)deleteFromInputWithContext:(id)a3;
- (void)setLastTypedChar:(unsigned __int16)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
@end

@implementation TIKeyboardInputManager_si

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_si;
  -[TIKeyboardInputManager_si syncToKeyboardState:from:afterContextChange:](&v7, sel_syncToKeyboardState_from_afterContextChange_, a3, a4);
  if (v5) {
    [(TIKeyboardInputManager_si *)self setLastTypedChar:0];
  }
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if ([v11 length] == 1) {
    uint64_t v12 = [v11 characterAtIndex:0];
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [(TIKeyboardInputManager_si *)self composedCharacterWithInputCharacter:v12];
  __int16 v20 = v13;
  if (v13)
  {
    uint64_t v14 = v13;
    *a6 = 1;
    TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa
                                                         + (int)*MEMORY[0x263F7EB98]));
    MEMORY[0x24563D440](v21, v14);
    TIInputManager::add_input();
    KB::String::~String((KB::String *)v21);
    if (v14 == 3548) {
      uint64_t v15 = 3548;
    }
    else {
      uint64_t v15 = 0;
    }
    [(TIKeyboardInputManager_si *)self setLastTypedChar:v15];
    uint64_t v16 = [NSString stringWithCharacters:&v20 length:1];
  }
  else
  {
    [(TIKeyboardInputManager_si *)self setLastTypedChar:v12];
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManager_si;
    uint64_t v16 = -[TIKeyboardInputManager_si addInput:flags:point:firstDelete:](&v19, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
  }
  v17 = (void *)v16;

  return v17;
}

- (unsigned)composedCharacterWithInputCharacter:(unsigned __int16)a3
{
  int v3 = a3;
  int v4 = [(TIKeyboardInputManager_si *)self lastTypedChar];
  if (!v3 || !v4) {
    return 0;
  }
  if (v4 > 3543)
  {
    if (v4 == 3544)
    {
      if (v3 == 3544) {
        return 3570;
      }
    }
    else if (v4 == 3545)
    {
      if (v3 <= 3534)
      {
        if (v3 == 3473) {
          return 3475;
        }
        if (v3 == 3530) {
          return 3546;
        }
      }
      else
      {
        switch(v3)
        {
          case 3551:
            return 3550;
          case 3545:
            return 3547;
          case 3535:
            return 3548;
        }
      }
    }
    else if (v4 == 3548 && v3 == 3530)
    {
      return 3549;
    }
    return 0;
  }
  switch(v4)
  {
    case 3467:
      if (v3 != 3551) {
        return 0;
      }
      unsigned __int16 v5 = 3468;
      break;
    case 3468:
    case 3470:
    case 3472:
    case 3474:
    case 3475:
      return 0;
    case 3469:
      if (v3 != 3544) {
        return 0;
      }
      unsigned __int16 v5 = 3470;
      break;
    case 3471:
      if (v3 != 3551) {
        return 0;
      }
      unsigned __int16 v5 = 3472;
      break;
    case 3473:
      if (v3 != 3530) {
        return 0;
      }
      unsigned __int16 v5 = 3474;
      break;
    case 3476:
      if (v3 == 3551) {
        unsigned __int16 v5 = 3478;
      }
      else {
        unsigned __int16 v5 = 0;
      }
      if (v3 == 3530) {
        unsigned __int16 v5 = 3477;
      }
      break;
    default:
      if (v4 != 3461 || (v3 - 3535) >= 3) {
        return 0;
      }
      unsigned __int16 v5 = v3 - 73;
      break;
  }
  return v5;
}

- (void)deleteFromInputWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_si;
  [(TIKeyboardInputManager_si *)&v4 deleteFromInputWithContext:a3];
  [(TIKeyboardInputManager_si *)self setLastTypedChar:0];
}

- (unsigned)lastTypedChar
{
  return self->_lastTypedChar;
}

- (void)setLastTypedChar:(unsigned __int16)a3
{
  self->_lastTypedChar = a3;
}

@end
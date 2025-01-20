@interface TPDialerNumberPad
+ (id)dialerNumberPadFullCharacters;
+ (id)dialerNumberPadNumericCharacters;
- (BOOL)playsSounds;
- (TPDialerKeypadDelegate)delegate;
- (TPDialerSoundController)soundController;
- (int64_t)indexForHighlightedKey;
- (void)buttonDown:(id)a3;
- (void)buttonLongPressed:(id)a3;
- (void)buttonUp:(id)a3;
- (void)buttonUpOutside:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaysSounds:(BOOL)a3;
- (void)setSoundController:(id)a3;
@end

@implementation TPDialerNumberPad

+ (id)dialerNumberPadFullCharacters
{
  v16[12] = *MEMORY[0x1E4F143B8];
  v15 = [NSNumber numberWithInt:0];
  v16[0] = v15;
  v14 = [NSNumber numberWithInt:1];
  v16[1] = v14;
  v13 = [NSNumber numberWithInt:2];
  v16[2] = v13;
  v2 = [NSNumber numberWithInt:3];
  v16[3] = v2;
  v3 = [NSNumber numberWithInt:4];
  v16[4] = v3;
  v4 = [NSNumber numberWithInt:5];
  v16[5] = v4;
  v5 = [NSNumber numberWithInt:6];
  v16[6] = v5;
  v6 = [NSNumber numberWithInt:7];
  v16[7] = v6;
  v7 = [NSNumber numberWithInt:8];
  v16[8] = v7;
  v8 = [NSNumber numberWithInt:9];
  v16[9] = v8;
  v9 = [NSNumber numberWithInt:10];
  v16[10] = v9;
  v10 = [NSNumber numberWithInt:11];
  v16[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)dialerNumberPadNumericCharacters
{
  v16[12] = *MEMORY[0x1E4F143B8];
  v15 = [NSNumber numberWithInt:0];
  v16[0] = v15;
  v14 = [NSNumber numberWithInt:1];
  v16[1] = v14;
  v13 = [NSNumber numberWithInt:2];
  v16[2] = v13;
  v2 = [NSNumber numberWithInt:3];
  v16[3] = v2;
  v3 = [NSNumber numberWithInt:4];
  v16[4] = v3;
  v4 = [NSNumber numberWithInt:5];
  v16[5] = v4;
  v5 = [NSNumber numberWithInt:6];
  v16[6] = v5;
  v6 = [NSNumber numberWithInt:7];
  v16[7] = v6;
  v7 = [NSNumber numberWithInt:8];
  v16[8] = v7;
  v8 = [NSNumber numberWithInt:13];
  v16[9] = v8;
  v9 = [NSNumber numberWithInt:10];
  v16[10] = v9;
  v10 = [NSNumber numberWithInt:13];
  v16[11] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

- (void)buttonUp:(id)a3
{
  id v5 = a3;
  v4 = [(TPDialerNumberPad *)self soundController];
  objc_msgSend(v4, "stopSoundForDialerCharacter:", objc_msgSend(v5, "character"));

  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
    -[TPDialerKeypadDelegate phonePad:keyUp:](self->_delegate, "phonePad:keyUp:", self, (char)-[__CFString characterAtIndex:](TPNumberPadCharacterValues[[v5 character]], "characterAtIndex:", 0));
  }
}

- (void)buttonUpOutside:(id)a3
{
  id v4 = a3;
  id v5 = [(TPDialerNumberPad *)self soundController];
  uint64_t v6 = [v4 character];

  [v5 stopSoundForDialerCharacter:v6];
  uint64_t v7 = [(TPDialerNumberPad *)self delegate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(TPDialerNumberPad *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(TPDialerNumberPad *)self delegate];
      [v11 phonePadDeleteLastDigit:self];
    }
  }
}

- (void)buttonDown:(id)a3
{
  id v5 = a3;
  id v4 = [(TPDialerNumberPad *)self soundController];
  objc_msgSend(v4, "playSoundForDialerCharacter:", objc_msgSend(v5, "character"));

  if (self->_delegate)
  {
    if (objc_opt_respondsToSelector()) {
      -[TPDialerKeypadDelegate phonePad:appendString:](self->_delegate, "phonePad:appendString:", self, TPNumberPadCharacterValues[[v5 character]]);
    }
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      -[TPDialerKeypadDelegate phonePad:keyDown:](self->_delegate, "phonePad:keyDown:", self, (char)-[__CFString characterAtIndex:](TPNumberPadCharacterValues[[v5 character]], "characterAtIndex:", 0));
    }
  }
}

- (void)buttonLongPressed:(id)a3
{
  id v21 = a3;
  if ([v21 character] == 10)
  {
    id v4 = @"+";
  }
  else if ([v21 character] == 9)
  {
    id v4 = @",";
  }
  else
  {
    if ([v21 character] != 11)
    {
      if (![v21 character])
      {
        v19 = [(TPDialerNumberPad *)self delegate];
        char v20 = objc_opt_respondsToSelector();

        if (v20)
        {
          v9 = [(TPDialerNumberPad *)self delegate];
          objc_msgSend(v9, "phonePad:dialerCharacterButtonWasHeld:", self, objc_msgSend(v21, "character"));
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
    id v4 = @";";
  }
  uint64_t v5 = [(TPDialerNumberPad *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [(TPDialerNumberPad *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(TPDialerNumberPad *)self delegate];
      [v9 phonePad:self replaceLastDigitWithString:v4];
LABEL_16:

      goto LABEL_17;
    }
  }
  uint64_t v10 = [(TPDialerNumberPad *)self delegate];
  if (v10)
  {
    id v11 = (void *)v10;
    v12 = [(TPDialerNumberPad *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      v14 = [(TPDialerNumberPad *)self delegate];
      [v14 phonePadDeleteLastDigit:self];
    }
  }
  uint64_t v15 = [(TPDialerNumberPad *)self delegate];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [(TPDialerNumberPad *)self delegate];
    char v18 = objc_opt_respondsToSelector();

    if (v18)
    {
      v9 = [(TPDialerNumberPad *)self delegate];
      [v9 phonePad:self appendString:v4];
      goto LABEL_16;
    }
  }
LABEL_17:
}

- (void)setPlaysSounds:(BOOL)a3
{
  if (self->_playsSounds != a3)
  {
    if (a3)
    {
      id v4 = objc_alloc_init(TPDialerSoundController);
      [(TPDialerNumberPad *)self setSoundController:v4];
    }
    else
    {
      [(TPDialerNumberPad *)self setSoundController:0];
    }
  }
}

- (int64_t)indexForHighlightedKey
{
  return -1;
}

- (BOOL)playsSounds
{
  return self->_playsSounds;
}

- (TPDialerKeypadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TPDialerKeypadDelegate *)a3;
}

- (TPDialerSoundController)soundController
{
  return (TPDialerSoundController *)objc_getProperty(self, a2, 496, 1);
}

- (void)setSoundController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface SBEmptyButtonView
- (id)initForCharacter:(int64_t)a3;
- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4;
- (int64_t)character;
- (void)setCharacter:(int64_t)a3;
@end

@implementation SBEmptyButtonView

- (id)initForCharacter:(int64_t)a3
{
  return [(SBEmptyButtonView *)self initForCharacter:a3 style:0];
}

- (id)initForCharacter:(int64_t)a3 style:(int64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBEmptyButtonView;
  id result = -[SBEmptyButtonView initWithFrame:](&v6, sel_initWithFrame_, a3, a4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (result) {
    *((void *)result + 51) = a3;
  }
  return result;
}

- (int64_t)character
{
  return self->_char;
}

- (void)setCharacter:(int64_t)a3
{
  self->_char = a3;
}

@end
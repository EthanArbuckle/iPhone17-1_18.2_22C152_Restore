@interface TIWordSearchThai
- (TIKeyboardLayout)baseLayout;
- (int)mecabraInputMethodType;
- (void)updateMecabraState;
@end

@implementation TIWordSearchThai

- (int)mecabraInputMethodType
{
  return 18;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchThai;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
  [(TIWordSearch *)self updateDictionaryPaths];
}

- (TIKeyboardLayout)baseLayout
{
  return self->_baseLayout;
}

- (void).cxx_destruct
{
}

@end
@interface TIWordSearchKorean
- (BOOL)bilingualEnabled;
- (BOOL)tenKeyEnabled;
- (id)mecabraCreationOptionsDictionary;
- (int)mecabraInputMethodType;
- (void)setBilingualEnabled:(BOOL)a3;
- (void)setTenKeyEnabled:(BOOL)a3;
- (void)updateMecabraState;
@end

@implementation TIWordSearchKorean

- (int)mecabraInputMethodType
{
  return 17;
}

- (void)updateMecabraState
{
  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKorean;
  [(TIWordSearch *)&v3 updateMecabraState];
  [(TIWordSearch *)self updateUserWordEntries];
  [(TIWordSearch *)self updateDictionaryPaths];
}

- (id)mecabraCreationOptionsDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)TIWordSearchKorean;
  objc_super v3 = [(TIWordSearch *)&v10 mecabraCreationOptionsDictionary];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(TIWordSearch *)self inputMode];
  v6 = [v5 originalIdentifier];
  v7 = TIInputModeGetSWLayout();
  int v8 = [v7 isEqualToString:@"Korean-With-QWERTY"];

  if (v8) {
    [v4 setObject:@"en_US" forKeyedSubscript:*MEMORY[0x263F8C538]];
  }

  return v4;
}

- (BOOL)tenKeyEnabled
{
  return self->_tenKeyEnabled;
}

- (void)setTenKeyEnabled:(BOOL)a3
{
  self->_tenKeyEnabled = a3;
}

- (BOOL)bilingualEnabled
{
  return self->_bilingualEnabled;
}

- (void)setBilingualEnabled:(BOOL)a3
{
  self->_bilingualEnabled = a3;
}

@end
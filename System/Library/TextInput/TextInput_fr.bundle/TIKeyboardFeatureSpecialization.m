@interface TIKeyboardFeatureSpecialization
@end

@implementation TIKeyboardFeatureSpecialization

void __68__TIKeyboardFeatureSpecialization_fr_accentKeyStringForInputPrefix___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFFA08]);
  id v3 = [@"aujourd c d entr j l m n prud s t y" componentsSeparatedByString:@" "];
  uint64_t v1 = [v0 initWithArray:v3];
  v2 = (void *)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes;
  -[TIKeyboardFeatureSpecialization_fr accentKeyStringForInputPrefix:]::apostrophePrefixes = v1;
}

void __70__TIKeyboardFeatureSpecialization_fr_accentKeyStringForKeyboardState___block_invoke()
{
  id v2 = [MEMORY[0x263F08708] letterCharacterSet];
  uint64_t v0 = [v2 invertedSet];
  uint64_t v1 = (void *)-[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet;
  -[TIKeyboardFeatureSpecialization_fr accentKeyStringForKeyboardState:]::nonLetterSet = v0;
}

uint64_t __57__TIKeyboardFeatureSpecialization_fr_createInputManager___block_invoke(int a1, KB *this)
{
  int v2 = (int)this;
  LODWORD(result) = KB::character_is_word_medial_punctuation(this);
  if (v2 == 45) {
    return 1;
  }
  else {
    return result;
  }
}

uint64_t __66__TIKeyboardFeatureSpecialization_fr_terminatorsDeletingAutospace__block_invoke()
{
  -[TIKeyboardFeatureSpecialization_fr terminatorsDeletingAutospace]::uint64_t result = [objc_alloc(MEMORY[0x263F7E520]) initWithCharactersInString:@",.]}"]);

  return MEMORY[0x270F9A758]();
}

@end
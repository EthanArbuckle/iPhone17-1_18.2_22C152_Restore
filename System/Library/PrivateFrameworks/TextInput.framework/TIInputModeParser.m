@interface TIInputModeParser
+ (id)sharedInstance;
- (TIInputModeParser)init;
- (id)parseInputMode:(id)a3;
- (id)stringByReplacingInvalidCharactersWithUnderscores:(id)a3;
@end

@implementation TIInputModeParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidCharacterSet, 0);

  objc_storeStrong((id *)&self->_inputModeDicts, 0);
}

- (id)stringByReplacingInvalidCharactersWithUnderscores:(id)a3
{
  id v4 = a3;
  if ([v4 length]
    && [v4 rangeOfCharacterFromSet:self->_invalidCharacterSet] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [v4 _stringByReplacingCharactersInSet:self->_invalidCharacterSet withCharacter:95];
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)parseInputMode:(id)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_inputModeDicts objectForKey:v4];
  if (!v5)
  {
    v6 = TIInputModeGetLanguageWithRegion(v4);
    v7 = [(TIInputModeParser *)self stringByReplacingInvalidCharactersWithUnderscores:v6];

    v8 = TIInputModeGetComponentsFromIdentifier(v4);
    v9 = [v8 objectForKey:@"sw"];
    v10 = [(TIInputModeParser *)self stringByReplacingInvalidCharactersWithUnderscores:v9];

    v11 = [v8 objectForKey:@"hw"];
    v12 = [(TIInputModeParser *)self stringByReplacingInvalidCharactersWithUnderscores:v11];

    v17[0] = v7;
    v16[0] = @"language";
    v16[1] = @"softwareLayout";
    if (v10 || [0 length]) {
      v13 = v10;
    }
    else {
      v13 = @"Automatic";
    }
    v17[1] = v13;
    v16[2] = @"hardwareLayout";
    if (v12 || [0 length]) {
      v14 = v12;
    }
    else {
      v14 = @"Automatic";
    }
    v17[2] = v14;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
    [(NSMutableDictionary *)self->_inputModeDicts setObject:v5 forKey:v4];
  }

  return v5;
}

- (TIInputModeParser)init
{
  v8.receiver = self;
  v8.super_class = (Class)TIInputModeParser;
  v2 = [(TIInputModeParser *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    inputModeDicts = v2->_inputModeDicts;
    v2->_inputModeDicts = (NSMutableDictionary *)v3;

    id v5 = [MEMORY[0x1E4F28E58] characterSetWithCharactersInString:@"_"];
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 97, 26);
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 65, 26);
    -[NSCharacterSet addCharactersInRange:](v5, "addCharactersInRange:", 48, 10);
    [(NSCharacterSet *)v5 invert];
    invalidCharacterSet = v2->_invalidCharacterSet;
    v2->_invalidCharacterSet = v5;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7452 != -1) {
    dispatch_once(&sharedInstance_onceToken_7452, &__block_literal_global_7453);
  }
  v2 = (void *)sharedInstance_instance;

  return v2;
}

uint64_t __35__TIInputModeParser_sharedInstance__block_invoke()
{
  sharedInstance_instance = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end
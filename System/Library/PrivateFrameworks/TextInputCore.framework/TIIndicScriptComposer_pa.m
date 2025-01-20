@interface TIIndicScriptComposer_pa
- (NSDictionary)_modifiersToAllowedPrefixes;
- (id)_displayStringForModifier:(id)a3 withPrefix:(id)a4;
- (id)_outputForModifier:(id)a3 withPrefix:(id)a4;
- (id)_outputForModifier:(id)a3 withPrefix:(id)a4 displayString:(id *)a5;
- (id)contextualDisplayKeys;
- (id)stringByComposingInput:(id)a3;
@end

@implementation TIIndicScriptComposer_pa

- (void).cxx_destruct
{
}

- (id)stringByComposingInput:(id)a3
{
  id v4 = a3;
  v5 = [(TIIndicScriptComposer *)self context];
  v6 = [(TIIndicScriptComposer_pa *)self _outputForModifier:v4 withPrefix:v5];

  if ([v6 length])
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIIndicScriptComposer_pa;
    id v7 = [(TIIndicScriptComposer *)&v10 stringByComposingInput:v4];
  }
  v8 = v7;

  return v8;
}

- (id)contextualDisplayKeys
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)TIIndicScriptComposer_pa;
  v3 = [(TIIndicScriptComposer *)&v19 contextualDisplayKeys];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(TIIndicScriptComposer *)self context];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(TIIndicScriptComposer_pa *)self _modifiersToAllowedPrefixes];
  id v7 = [v6 allKeys];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v13 = [(TIIndicScriptComposer_pa *)self _displayStringForModifier:v12 withPrefix:v5];
        [v4 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

- (id)_displayStringForModifier:(id)a3 withPrefix:(id)a4
{
  id v6 = a3;
  id v10 = v6;
  id v7 = [(TIIndicScriptComposer_pa *)self _outputForModifier:v6 withPrefix:a4 displayString:&v10];
  id v8 = v10;

  if (v7) {
    id v7 = v8;
  }

  return v7;
}

- (id)_outputForModifier:(id)a3 withPrefix:(id)a4
{
  return [(TIIndicScriptComposer_pa *)self _outputForModifier:a3 withPrefix:a4 displayString:0];
}

- (id)_outputForModifier:(id)a3 withPrefix:(id)a4 displayString:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(TIIndicScriptComposer_pa *)self _modifiersToAllowedPrefixes];
  v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    uint64_t v12 = [(TIIndicScriptComposer *)self languageIdentifier];
    v13 = [v9 _lastConjunctInLanguage:v12];

    v14 = objc_msgSend(NSString, "_stringWithUnichar:", objc_msgSend(v13, "_lastLongCharacter"));
    if ([v13 rangeOfString:@"੍" options:2] == 0x7FFFFFFFFFFFFFFFLL
      && [v11 containsObject:v14])
    {
      if (a5)
      {
        *a5 = [v13 stringByAppendingString:v8];
      }
      id v15 = v8;
    }
    else
    {
      long long v16 = [v11 objectAtIndexedSubscript:0];
      long long v17 = [v16 stringByAppendingString:v8];
      id v15 = v17;
      if (a5) {
        *a5 = v17;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (NSDictionary)_modifiersToAllowedPrefixes
{
  modifiersToAllowedPrefixes = self->_modifiersToAllowedPrefixes;
  if (!modifiersToAllowedPrefixes)
  {
    self->_modifiersToAllowedPrefixes = (NSDictionary *)&unk_1F3FA8100;
    modifiersToAllowedPrefixes = self->_modifiersToAllowedPrefixes;
  }

  return modifiersToAllowedPrefixes;
}

@end
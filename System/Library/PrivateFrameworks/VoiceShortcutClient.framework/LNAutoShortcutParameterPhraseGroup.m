@interface LNAutoShortcutParameterPhraseGroup
- (LNAutoShortcutParameterPhraseGroup)initWithParameterID:(id)a3 phrases:(id)a4;
- (NSArray)phrases;
- (NSUUID)parameterID;
- (void)addPhrase:(id)a3;
@end

@implementation LNAutoShortcutParameterPhraseGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_parameterID, 0);
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (NSUUID)parameterID
{
  return self->_parameterID;
}

- (void)addPhrase:(id)a3
{
  self->_phrases = [(NSArray *)self->_phrases arrayByAddingObject:a3];
  MEMORY[0x1F41817F8]();
}

- (LNAutoShortcutParameterPhraseGroup)initWithParameterID:(id)a3 phrases:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LNAutoShortcutParameterPhraseGroup;
  v9 = [(LNAutoShortcutParameterPhraseGroup *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterID, a3);
    uint64_t v11 = [v8 mutableCopy];
    phrases = v10->_phrases;
    v10->_phrases = (NSArray *)v11;

    v13 = v10;
  }

  return v10;
}

@end
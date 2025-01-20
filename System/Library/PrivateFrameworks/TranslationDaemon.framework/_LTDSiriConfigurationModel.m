@interface _LTDSiriConfigurationModel
- (NSArray)availableLanguagePairs;
- (_LTDSiriConfigurationModel)initWithDictionary:(id)a3;
- (id)debugDescription;
@end

@implementation _LTDSiriConfigurationModel

- (_LTDSiriConfigurationModel)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTDSiriConfigurationModel;
  v5 = [(_LTDSiriConfigurationModel *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"LanguagePairs"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v7 = objc_msgSend(v6, "lt_ensureElementType:", objc_opt_class());
      v8 = (void *)MEMORY[0x263EFFA68];
      if (v7) {
        v8 = v6;
      }
    }
    else
    {

      v6 = 0;
      v8 = (void *)MEMORY[0x263EFFA68];
    }
    v9 = v8;

    availableLanguagePairs = v5->_availableLanguagePairs;
    v5->_availableLanguagePairs = v9;

    v11 = v5;
  }

  return v5;
}

- (id)debugDescription
{
  return (id)[(NSArray *)self->_availableLanguagePairs debugDescription];
}

- (NSArray)availableLanguagePairs
{
  return self->_availableLanguagePairs;
}

- (void).cxx_destruct
{
}

@end
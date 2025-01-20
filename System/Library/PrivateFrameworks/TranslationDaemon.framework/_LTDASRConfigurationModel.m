@interface _LTDASRConfigurationModel
- (NSArray)localeIdentifiers;
- (NSArray)locales;
- (NSDictionary)root;
- (_LTDASRConfigurationModel)initWithDictionary:(id)a3;
- (void)setRoot:(id)a3;
@end

@implementation _LTDASRConfigurationModel

- (_LTDASRConfigurationModel)initWithDictionary:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_LTDASRConfigurationModel;
  v6 = [(_LTDASRConfigurationModel *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_root, a3);
    v8 = [(NSDictionary *)v7->_root objectForKeyedSubscript:@"_all"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v9 = objc_msgSend(v8, "lt_ensureElementType:", objc_opt_class());
      v10 = (void *)MEMORY[0x263EFFA68];
      if (v9) {
        v10 = v8;
      }
    }
    else
    {

      v8 = 0;
      v10 = (void *)MEMORY[0x263EFFA68];
    }
    v11 = v10;

    localeIdentifiers = v7->_localeIdentifiers;
    v7->_localeIdentifiers = v11;

    v13 = v7;
  }

  return v7;
}

- (NSArray)locales
{
  return (NSArray *)[(NSArray *)self->_localeIdentifiers _ltCompactMap:&__block_literal_global_2];
}

- (NSArray)localeIdentifiers
{
  return self->_localeIdentifiers;
}

- (NSDictionary)root
{
  return self->_root;
}

- (void)setRoot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
}

@end
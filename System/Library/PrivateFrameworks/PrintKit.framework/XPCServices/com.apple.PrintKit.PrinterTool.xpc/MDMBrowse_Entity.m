@interface MDMBrowse_Entity
- (BOOL)isEqual:(id)a3;
- (MDMBrowse_Entity)initWithBonjourName:(id)a3 txt:(id)a4;
- (id)bonjourName;
- (id)displayName;
- (id)txtRecordDictionary;
- (unint64_t)hash;
- (void)setTXTRecordValue:(id)a3 forKey:(id)a4;
@end

@implementation MDMBrowse_Entity

- (MDMBrowse_Entity)initWithBonjourName:(id)a3 txt:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MDMBrowse_Entity;
  v9 = [(MDMBrowse_Entity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bonjourName, a3);
    objc_storeStrong((id *)&v10->_txt, a4);
  }

  return v10;
}

- (id)displayName
{
  return [(PKPrinterBonjourEndpoint *)self->_bonjourName displayNameForPrintKitUI];
}

- (id)txtRecordDictionary
{
  return self->_txt;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    if ([(PKPrinterBonjourEndpoint *)self->_bonjourName isEqual:v5[1]]) {
      BOOL v6 = [(NSDictionary *)self->_txt isEqualToDictionary:v5[2]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(PKPrinterBonjourEndpoint *)self->_bonjourName hash];
  return (unint64_t)[(NSDictionary *)self->_txt hash] ^ v3;
}

- (id)bonjourName
{
  return self->_bonjourName;
}

- (void)setTXTRecordValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_txt mutableCopy];
  [v7 setObject:v8 forKeyedSubscript:v6];
  objc_storeStrong((id *)&self->_txt, v7);
  [(PKPrinterBonjourEndpoint *)self->_bonjourName setResolvedTXT:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txt, 0);

  objc_storeStrong((id *)&self->_bonjourName, 0);
}

@end
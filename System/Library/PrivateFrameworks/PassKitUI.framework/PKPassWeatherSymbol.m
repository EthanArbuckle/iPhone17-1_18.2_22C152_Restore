@interface PKPassWeatherSymbol
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSymbol:(id)a3;
- (NSArray)colorPalette;
- (NSString)symbolName;
- (PKPassWeatherSymbol)initWithCoder:(id)a3;
- (PKPassWeatherSymbol)initWithSymbolName:(id)a3 colorPalette:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassWeatherSymbol

- (PKPassWeatherSymbol)initWithSymbolName:(id)a3 colorPalette:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPassWeatherSymbol;
  v9 = [(PKPassWeatherSymbol *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symbolName, a3);
    objc_storeStrong((id *)&v10->_colorPalette, a4);
  }

  return v10;
}

- (PKPassWeatherSymbol)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPassWeatherSymbol;
  v5 = [(PKPassWeatherSymbol *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"symbolName"];
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"colorPalette"];
    colorPalette = v5->_colorPalette;
    v5->_colorPalette = (NSArray *)v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_alloc_init(PKPassWeatherSymbol);
  uint64_t v6 = [(NSString *)self->_symbolName copyWithZone:a3];
  symbolName = v5->_symbolName;
  v5->_symbolName = (NSString *)v6;

  uint64_t v8 = [(NSArray *)self->_colorPalette copyWithZone:a3];
  colorPalette = v5->_colorPalette;
  v5->_colorPalette = (NSArray *)v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  symbolName = self->_symbolName;
  id v5 = a3;
  [v5 encodeObject:symbolName forKey:@"symbolName"];
  [v5 encodeObject:self->_colorPalette forKey:@"colorPalette"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassWeatherSymbol *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassWeatherSymbol *)self isEqualToSymbol:v5];

  return v6;
}

- (BOOL)isEqualToSymbol:(id)a3
{
  id v4 = a3;
  id v5 = (void *)v4[1];
  BOOL v6 = self->_symbolName;
  id v7 = v5;
  if (v6 != v7)
  {
    uint64_t v8 = v7;
    if (v6) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
    }
    else
    {
      BOOL v10 = [(NSString *)v6 isEqualToString:v7];

      if (v10) {
        goto LABEL_10;
      }
    }
    char v11 = 0;
    goto LABEL_12;
  }

LABEL_10:
  char v11 = PKEqualObjects();
LABEL_12:

  return v11;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_symbolName];
  [v3 safelyAddObject:self->_colorPalette];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (NSArray)colorPalette
{
  return self->_colorPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorPalette, 0);

  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
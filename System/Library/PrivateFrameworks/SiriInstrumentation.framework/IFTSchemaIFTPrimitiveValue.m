@interface IFTSchemaIFTPrimitiveValue
- (BOOL)hasApp;
- (BOOL)hasCurrencyAmount;
- (BOOL)hasFile;
- (BOOL)hasMeasurement;
- (BOOL)hasPaymentMethod;
- (BOOL)hasPerson;
- (BOOL)hasPlacemark;
- (BOOL)hasPrimitiveBool;
- (BOOL)hasPrimitiveDateComponents;
- (BOOL)hasPrimitiveDecimal;
- (BOOL)hasPrimitiveDouble;
- (BOOL)hasPrimitiveInt;
- (BOOL)hasPrimitiveNull;
- (BOOL)isEqual:(id)a3;
- (BOOL)primitiveBool;
- (BOOL)primitiveNull;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTApp)app;
- (IFTSchemaIFTCurrencyAmount)currencyAmount;
- (IFTSchemaIFTDateComponents)primitiveDateComponents;
- (IFTSchemaIFTFile)file;
- (IFTSchemaIFTMeasurement)measurement;
- (IFTSchemaIFTPaymentMethod)paymentMethod;
- (IFTSchemaIFTPerson)person;
- (IFTSchemaIFTPlacemark)placemark;
- (IFTSchemaIFTPrimitiveValue)initWithDictionary:(id)a3;
- (IFTSchemaIFTPrimitiveValue)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)primitiveDecimal;
- (double)primitiveDouble;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)primitiveInt;
- (unint64_t)hash;
- (unint64_t)whichOneof_Primitivevalue;
- (void)deleteApp;
- (void)deleteCurrencyAmount;
- (void)deleteFile;
- (void)deleteMeasurement;
- (void)deletePaymentMethod;
- (void)deletePerson;
- (void)deletePlacemark;
- (void)deletePrimitiveBool;
- (void)deletePrimitiveDateComponents;
- (void)deletePrimitiveDecimal;
- (void)deletePrimitiveDouble;
- (void)deletePrimitiveInt;
- (void)deletePrimitiveNull;
- (void)setApp:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setFile:(id)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasCurrencyAmount:(BOOL)a3;
- (void)setHasFile:(BOOL)a3;
- (void)setHasMeasurement:(BOOL)a3;
- (void)setHasPaymentMethod:(BOOL)a3;
- (void)setHasPerson:(BOOL)a3;
- (void)setHasPlacemark:(BOOL)a3;
- (void)setHasPrimitiveBool:(BOOL)a3;
- (void)setHasPrimitiveDateComponents:(BOOL)a3;
- (void)setHasPrimitiveDecimal:(BOOL)a3;
- (void)setHasPrimitiveDouble:(BOOL)a3;
- (void)setHasPrimitiveInt:(BOOL)a3;
- (void)setHasPrimitiveNull:(BOOL)a3;
- (void)setMeasurement:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setPerson:(id)a3;
- (void)setPlacemark:(id)a3;
- (void)setPrimitiveBool:(BOOL)a3;
- (void)setPrimitiveDateComponents:(id)a3;
- (void)setPrimitiveDecimal:(id)a3;
- (void)setPrimitiveDouble:(double)a3;
- (void)setPrimitiveInt:(int64_t)a3;
- (void)setPrimitiveNull:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTPrimitiveValue

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)IFTSchemaIFTPrimitiveValue;
  v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaIFTPrimitiveValue *)self deletePrimitiveDateComponents];
  }
  v9 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(IFTSchemaIFTPrimitiveValue *)self deleteMeasurement];
  }
  v12 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(IFTSchemaIFTPrimitiveValue *)self deleteCurrencyAmount];
  }
  v15 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(IFTSchemaIFTPrimitiveValue *)self deletePaymentMethod];
  }
  v18 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(IFTSchemaIFTPrimitiveValue *)self deletePlacemark];
  }
  v21 = [(IFTSchemaIFTPrimitiveValue *)self person];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(IFTSchemaIFTPrimitiveValue *)self deletePerson];
  }
  v24 = [(IFTSchemaIFTPrimitiveValue *)self file];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(IFTSchemaIFTPrimitiveValue *)self deleteFile];
  }
  v27 = [(IFTSchemaIFTPrimitiveValue *)self app];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(IFTSchemaIFTPrimitiveValue *)self deleteApp];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_app, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_currencyAmount, 0);
  objc_storeStrong((id *)&self->_measurement, 0);
  objc_storeStrong((id *)&self->_primitiveDateComponents, 0);
  objc_storeStrong((id *)&self->_primitiveDecimal, 0);
}

- (void)setHasApp:(BOOL)a3
{
  self->_hasApp = a3;
}

- (BOOL)hasApp
{
  return self->_hasApp;
}

- (void)setHasFile:(BOOL)a3
{
  self->_hasFile = a3;
}

- (BOOL)hasFile
{
  return self->_hasFile;
}

- (void)setHasPerson:(BOOL)a3
{
  self->_hasPerson = a3;
}

- (BOOL)hasPerson
{
  return self->_hasPerson;
}

- (void)setHasPlacemark:(BOOL)a3
{
  self->_hasPlacemark = a3;
}

- (BOOL)hasPlacemark
{
  return self->_hasPlacemark;
}

- (void)setHasPaymentMethod:(BOOL)a3
{
  self->_hasPaymentMethod = a3;
}

- (BOOL)hasPaymentMethod
{
  return self->_hasPaymentMethod;
}

- (void)setHasCurrencyAmount:(BOOL)a3
{
  self->_hasCurrencyAmount = a3;
}

- (BOOL)hasCurrencyAmount
{
  return self->_hasCurrencyAmount;
}

- (void)setHasMeasurement:(BOOL)a3
{
  self->_hasMeasurement = a3;
}

- (BOOL)hasMeasurement
{
  return self->_hasMeasurement;
}

- (void)setHasPrimitiveDateComponents:(BOOL)a3
{
  self->_hasPrimitiveDateComponents = a3;
}

- (BOOL)hasPrimitiveDateComponents
{
  return self->_hasPrimitiveDateComponents;
}

- (void)setHasPrimitiveDecimal:(BOOL)a3
{
  self->_hasPrimitiveDecimal = a3;
}

- (BOOL)hasPrimitiveDecimal
{
  return self->_hasPrimitiveDecimal;
}

- (void)setHasPrimitiveDouble:(BOOL)a3
{
  self->_hasPrimitiveDouble = a3;
}

- (BOOL)hasPrimitiveDouble
{
  return self->_hasPrimitiveDouble;
}

- (void)setHasPrimitiveInt:(BOOL)a3
{
  self->_hasPrimitiveInt = a3;
}

- (BOOL)hasPrimitiveInt
{
  return self->_hasPrimitiveInt;
}

- (void)setHasPrimitiveBool:(BOOL)a3
{
  self->_hasPrimitiveBool = a3;
}

- (BOOL)hasPrimitiveBool
{
  return self->_hasPrimitiveBool;
}

- (void)setHasPrimitiveNull:(BOOL)a3
{
  self->_hasPrimitiveNull = a3;
}

- (BOOL)hasPrimitiveNull
{
  return self->_hasPrimitiveNull;
}

- (unint64_t)whichOneof_Primitivevalue
{
  return self->_whichOneof_Primitivevalue;
}

- (IFTSchemaIFTPrimitiveValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)IFTSchemaIFTPrimitiveValue;
  v5 = [(IFTSchemaIFTPrimitiveValue *)&v37 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"primitiveNull"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPrimitiveValue setPrimitiveNull:](v5, "setPrimitiveNull:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"primitiveBool"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPrimitiveValue setPrimitiveBool:](v5, "setPrimitiveBool:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"primitiveInt"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTPrimitiveValue setPrimitiveInt:](v5, "setPrimitiveInt:", [v8 longLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"primitiveDouble"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[IFTSchemaIFTPrimitiveValue setPrimitiveDouble:](v5, "setPrimitiveDouble:");
    }
    v10 = [v4 objectForKeyedSubscript:@"primitiveDecimal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = (void *)[v10 copy];
      [(IFTSchemaIFTPrimitiveValue *)v5 setPrimitiveDecimal:v11];
    }
    v33 = v10;
    uint64_t v12 = [v4 objectForKeyedSubscript:@"primitiveDateComponents"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[IFTSchemaIFTDateComponents alloc] initWithDictionary:v12];
      [(IFTSchemaIFTPrimitiveValue *)v5 setPrimitiveDateComponents:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"measurement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[IFTSchemaIFTMeasurement alloc] initWithDictionary:v14];
      [(IFTSchemaIFTPrimitiveValue *)v5 setMeasurement:v15];
    }
    v36 = v6;
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"currencyAmount", v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[IFTSchemaIFTCurrencyAmount alloc] initWithDictionary:v16];
      [(IFTSchemaIFTPrimitiveValue *)v5 setCurrencyAmount:v17];
    }
    v35 = v7;
    v18 = [v4 objectForKeyedSubscript:@"paymentMethod"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[IFTSchemaIFTPaymentMethod alloc] initWithDictionary:v18];
      [(IFTSchemaIFTPrimitiveValue *)v5 setPaymentMethod:v19];
    }
    v32 = (void *)v12;
    v34 = v8;
    int v20 = [v4 objectForKeyedSubscript:@"placemark"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[IFTSchemaIFTPlacemark alloc] initWithDictionary:v20];
      [(IFTSchemaIFTPrimitiveValue *)v5 setPlacemark:v21];
    }
    v22 = v9;
    int v23 = [v4 objectForKeyedSubscript:@"person"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [[IFTSchemaIFTPerson alloc] initWithDictionary:v23];
      [(IFTSchemaIFTPrimitiveValue *)v5 setPerson:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"file"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[IFTSchemaIFTFile alloc] initWithDictionary:v25];
      [(IFTSchemaIFTPrimitiveValue *)v5 setFile:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"app"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = [[IFTSchemaIFTApp alloc] initWithDictionary:v27];
      [(IFTSchemaIFTPrimitiveValue *)v5 setApp:v28];
    }
    int v29 = v5;
  }
  return v5;
}

- (IFTSchemaIFTPrimitiveValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTPrimitiveValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTPrimitiveValue *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_app)
  {
    id v4 = [(IFTSchemaIFTPrimitiveValue *)self app];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"app"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"app"];
    }
  }
  if (self->_currencyAmount)
  {
    uint64_t v7 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"currencyAmount"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"currencyAmount"];
    }
  }
  if (self->_file)
  {
    v10 = [(IFTSchemaIFTPrimitiveValue *)self file];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"file"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"file"];
    }
  }
  if (self->_measurement)
  {
    v13 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"measurement"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"measurement"];
    }
  }
  if (self->_paymentMethod)
  {
    v16 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"paymentMethod"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"paymentMethod"];
    }
  }
  if (self->_person)
  {
    v19 = [(IFTSchemaIFTPrimitiveValue *)self person];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"person"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"person"];
    }
  }
  if (self->_placemark)
  {
    v22 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"placemark"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"placemark"];
    }
  }
  if (self->_whichOneof_Primitivevalue == 2)
  {
    v25 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPrimitiveValue primitiveBool](self, "primitiveBool"));
    [v3 setObject:v25 forKeyedSubscript:@"primitiveBool"];
  }
  if (self->_primitiveDateComponents)
  {
    int v26 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
    v27 = [v26 dictionaryRepresentation];
    if (v27)
    {
      [v3 setObject:v27 forKeyedSubscript:@"primitiveDateComponents"];
    }
    else
    {
      v28 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v28 forKeyedSubscript:@"primitiveDateComponents"];
    }
  }
  if (self->_primitiveDecimal)
  {
    int v29 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDecimal];
    v30 = (void *)[v29 copy];
    [v3 setObject:v30 forKeyedSubscript:@"primitiveDecimal"];
  }
  unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue == 4)
  {
    v32 = NSNumber;
    [(IFTSchemaIFTPrimitiveValue *)self primitiveDouble];
    v33 = objc_msgSend(v32, "numberWithDouble:");
    [v3 setObject:v33 forKeyedSubscript:@"primitiveDouble"];

    unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 3)
  {
    v34 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTPrimitiveValue primitiveInt](self, "primitiveInt"));
    [v3 setObject:v34 forKeyedSubscript:@"primitiveInt"];

    unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 1)
  {
    v35 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaIFTPrimitiveValue primitiveNull](self, "primitiveNull"));
    [v3 setObject:v35 forKeyedSubscript:@"primitiveNull"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  switch(self->_whichOneof_Primitivevalue)
  {
    case 1uLL:
      uint64_t v3 = 8;
      goto LABEL_10;
    case 2uLL:
      uint64_t v3 = 9;
LABEL_10:
      uint64_t v4 = 2654435761 * *((unsigned __int8 *)&self->super.super.super.isa + v3);
      break;
    case 3uLL:
      uint64_t v4 = 2654435761 * self->_primitiveInt;
      break;
    case 4uLL:
      double primitiveDouble = self->_primitiveDouble;
      double v6 = -primitiveDouble;
      if (primitiveDouble >= 0.0) {
        double v6 = self->_primitiveDouble;
      }
      long double v7 = floor(v6 + 0.5);
      double v8 = (v6 - v7) * 1.84467441e19;
      uint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
      if (v8 >= 0.0)
      {
        if (v8 > 0.0) {
          v4 += (unint64_t)v8;
        }
      }
      else
      {
        v4 -= (unint64_t)fabs(v8);
      }
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  NSUInteger v9 = [(NSString *)self->_primitiveDecimal hash] ^ v4;
  unint64_t v10 = [(IFTSchemaIFTDateComponents *)self->_primitiveDateComponents hash];
  unint64_t v11 = v9 ^ v10 ^ [(IFTSchemaIFTMeasurement *)self->_measurement hash];
  unint64_t v12 = [(IFTSchemaIFTCurrencyAmount *)self->_currencyAmount hash];
  unint64_t v13 = v12 ^ [(IFTSchemaIFTPaymentMethod *)self->_paymentMethod hash];
  unint64_t v14 = v11 ^ v13 ^ [(IFTSchemaIFTPlacemark *)self->_placemark hash];
  unint64_t v15 = [(IFTSchemaIFTPerson *)self->_person hash];
  unint64_t v16 = v15 ^ [(IFTSchemaIFTFile *)self->_file hash];
  return v14 ^ v16 ^ [(IFTSchemaIFTApp *)self->_app hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue != objc_msgSend(v4, "whichOneof_Primitivevalue")) {
    goto LABEL_52;
  }
  int primitiveNull = self->_primitiveNull;
  if (primitiveNull != [v4 primitiveNull]) {
    goto LABEL_52;
  }
  int primitiveBool = self->_primitiveBool;
  if (primitiveBool != [v4 primitiveBool]) {
    goto LABEL_52;
  }
  int64_t primitiveInt = self->_primitiveInt;
  if (primitiveInt != [v4 primitiveInt]) {
    goto LABEL_52;
  }
  double primitiveDouble = self->_primitiveDouble;
  [v4 primitiveDouble];
  if (primitiveDouble != v10) {
    goto LABEL_52;
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDecimal];
  unint64_t v12 = [v4 primitiveDecimal];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v13 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDecimal];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDecimal];
    unint64_t v16 = [v4 primitiveDecimal];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
  unint64_t v12 = [v4 primitiveDateComponents];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v18 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
    v21 = [v4 primitiveDateComponents];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
  unint64_t v12 = [v4 measurement];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v23 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
  if (v23)
  {
    v24 = (void *)v23;
    v25 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
    int v26 = [v4 measurement];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
  unint64_t v12 = [v4 currencyAmount];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v28 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
    objc_super v31 = [v4 currencyAmount];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
  unint64_t v12 = [v4 paymentMethod];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v33 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
    v36 = [v4 paymentMethod];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
  unint64_t v12 = [v4 placemark];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v38 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
    v41 = [v4 placemark];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self person];
  unint64_t v12 = [v4 person];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v43 = [(IFTSchemaIFTPrimitiveValue *)self person];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(IFTSchemaIFTPrimitiveValue *)self person];
    v46 = [v4 person];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self file];
  unint64_t v12 = [v4 file];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_51;
  }
  uint64_t v48 = [(IFTSchemaIFTPrimitiveValue *)self file];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(IFTSchemaIFTPrimitiveValue *)self file];
    v51 = [v4 file];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_52;
    }
  }
  else
  {
  }
  unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self app];
  unint64_t v12 = [v4 app];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v53 = [(IFTSchemaIFTPrimitiveValue *)self app];
    if (!v53)
    {

LABEL_55:
      BOOL v58 = 1;
      goto LABEL_53;
    }
    v54 = (void *)v53;
    v55 = [(IFTSchemaIFTPrimitiveValue *)self app];
    v56 = [v4 app];
    char v57 = [v55 isEqual:v56];

    if (v57) {
      goto LABEL_55;
    }
  }
  else
  {
LABEL_51:
  }
LABEL_52:
  BOOL v58 = 0;
LABEL_53:

  return v58;
}

- (void)writeTo:(id)a3
{
  id v23 = a3;
  unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  if (whichOneof_Primitivevalue == 1)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 2)
  {
    PBDataWriterWriteBOOLField();
    unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 3)
  {
    PBDataWriterWriteInt64Field();
    unint64_t whichOneof_Primitivevalue = self->_whichOneof_Primitivevalue;
  }
  if (whichOneof_Primitivevalue == 4) {
    PBDataWriterWriteDoubleField();
  }
  v5 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDecimal];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  double v6 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];

  if (v6)
  {
    long double v7 = [(IFTSchemaIFTPrimitiveValue *)self primitiveDateComponents];
    PBDataWriterWriteSubmessage();
  }
  double v8 = [(IFTSchemaIFTPrimitiveValue *)self measurement];

  if (v8)
  {
    NSUInteger v9 = [(IFTSchemaIFTPrimitiveValue *)self measurement];
    PBDataWriterWriteSubmessage();
  }
  double v10 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];

  if (v10)
  {
    unint64_t v11 = [(IFTSchemaIFTPrimitiveValue *)self currencyAmount];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v12 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];

  if (v12)
  {
    uint64_t v13 = [(IFTSchemaIFTPrimitiveValue *)self paymentMethod];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(IFTSchemaIFTPrimitiveValue *)self placemark];

  if (v14)
  {
    unint64_t v15 = [(IFTSchemaIFTPrimitiveValue *)self placemark];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(IFTSchemaIFTPrimitiveValue *)self person];

  if (v16)
  {
    int v17 = [(IFTSchemaIFTPrimitiveValue *)self person];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(IFTSchemaIFTPrimitiveValue *)self file];

  if (v18)
  {
    v19 = [(IFTSchemaIFTPrimitiveValue *)self file];
    PBDataWriterWriteSubmessage();
  }
  int v20 = [(IFTSchemaIFTPrimitiveValue *)self app];

  v21 = v23;
  if (v20)
  {
    int v22 = [(IFTSchemaIFTPrimitiveValue *)self app];
    PBDataWriterWriteSubmessage();

    v21 = v23;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTPrimitiveValueReadFrom(self, (uint64_t)a3);
}

- (void)deleteApp
{
  if (self->_whichOneof_Primitivevalue == 17)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_app = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTApp)app
{
  if (self->_whichOneof_Primitivevalue == 17) {
    v2 = self->_app;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setApp:(id)a3
{
  id v4 = (IFTSchemaIFTApp *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  unint64_t v13 = 17;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  app = self->_app;
  self->_app = v4;
}

- (void)deleteFile
{
  if (self->_whichOneof_Primitivevalue == 16)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_file = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTFile)file
{
  if (self->_whichOneof_Primitivevalue == 16) {
    v2 = self->_file;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setFile:(id)a3
{
  id v4 = (IFTSchemaIFTFile *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 16 * (v4 != 0);
  file = self->_file;
  self->_file = v4;
}

- (void)deletePerson
{
  if (self->_whichOneof_Primitivevalue == 15)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_person = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPerson)person
{
  if (self->_whichOneof_Primitivevalue == 15) {
    v2 = self->_person;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerson:(id)a3
{
  id v4 = (IFTSchemaIFTPerson *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v13 = 15;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  person = self->_person;
  self->_person = v4;
}

- (void)deletePlacemark
{
  if (self->_whichOneof_Primitivevalue == 14)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_placemark = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPlacemark)placemark
{
  if (self->_whichOneof_Primitivevalue == 14) {
    v2 = self->_placemark;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPlacemark:(id)a3
{
  id v4 = (IFTSchemaIFTPlacemark *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v13 = 14;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  placemark = self->_placemark;
  self->_placemark = v4;
}

- (void)deletePaymentMethod
{
  if (self->_whichOneof_Primitivevalue == 13)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_paymentMethod = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTPaymentMethod)paymentMethod
{
  if (self->_whichOneof_Primitivevalue == 13) {
    v2 = self->_paymentMethod;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPaymentMethod:(id)a3
{
  id v4 = (IFTSchemaIFTPaymentMethod *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v13 = 13;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = v4;
}

- (void)deleteCurrencyAmount
{
  if (self->_whichOneof_Primitivevalue == 12)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_currencyAmount = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTCurrencyAmount)currencyAmount
{
  if (self->_whichOneof_Primitivevalue == 12) {
    v2 = self->_currencyAmount;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCurrencyAmount:(id)a3
{
  id v4 = (IFTSchemaIFTCurrencyAmount *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v13 = 12;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = v4;
}

- (void)deleteMeasurement
{
  if (self->_whichOneof_Primitivevalue == 11)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_measurement = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTMeasurement)measurement
{
  if (self->_whichOneof_Primitivevalue == 11) {
    v2 = self->_measurement;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMeasurement:(id)a3
{
  id v4 = (IFTSchemaIFTMeasurement *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v13 = 11;
  if (!v4) {
    unint64_t v13 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v13;
  measurement = self->_measurement;
  self->_measurement = v4;
}

- (void)deletePrimitiveDateComponents
{
  if (self->_whichOneof_Primitivevalue == 8)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_primitiveDateComponents = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTDateComponents)primitiveDateComponents
{
  if (self->_whichOneof_Primitivevalue == 8) {
    v2 = self->_primitiveDateComponents;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrimitiveDateComponents:(id)a3
{
  id v4 = (IFTSchemaIFTDateComponents *)a3;
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 8 * (v4 != 0);
  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = v4;
}

- (void)deletePrimitiveDecimal
{
  if (self->_whichOneof_Primitivevalue == 5)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_primitiveDecimal = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)primitiveDecimal
{
  if (self->_whichOneof_Primitivevalue == 5) {
    v2 = self->_primitiveDecimal;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPrimitiveDecimal:(id)a3
{
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;
  id v15 = a3;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  unint64_t v12 = 5;
  if (!v15) {
    unint64_t v12 = 0;
  }
  self->_unint64_t whichOneof_Primitivevalue = v12;
  unint64_t v13 = (NSString *)[v15 copy];
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = v13;
}

- (void)deletePrimitiveDouble
{
  if (self->_whichOneof_Primitivevalue == 4)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_double primitiveDouble = 0.0;
  }
}

- (double)primitiveDouble
{
  double result = 0.0;
  if (self->_whichOneof_Primitivevalue == 4) {
    return self->_primitiveDouble;
  }
  return result;
}

- (void)setPrimitiveDouble:(double)a3
{
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 4;
  self->_double primitiveDouble = a3;
}

- (void)deletePrimitiveInt
{
  if (self->_whichOneof_Primitivevalue == 3)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_int64_t primitiveInt = 0;
  }
}

- (int64_t)primitiveInt
{
  if (self->_whichOneof_Primitivevalue == 3) {
    return self->_primitiveInt;
  }
  else {
    return 0;
  }
}

- (void)setPrimitiveInt:(int64_t)a3
{
  self->_int primitiveNull = 0;
  self->_int primitiveBool = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 3;
  self->_int64_t primitiveInt = a3;
}

- (void)deletePrimitiveBool
{
  if (self->_whichOneof_Primitivevalue == 2)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_int primitiveBool = 0;
  }
}

- (BOOL)primitiveBool
{
  return self->_whichOneof_Primitivevalue == 2 && self->_primitiveBool;
}

- (void)setPrimitiveBool:(BOOL)a3
{
  self->_int primitiveNull = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 2;
  self->_int primitiveBool = a3;
}

- (void)deletePrimitiveNull
{
  if (self->_whichOneof_Primitivevalue == 1)
  {
    self->_unint64_t whichOneof_Primitivevalue = 0;
    self->_int primitiveNull = 0;
  }
}

- (BOOL)primitiveNull
{
  return self->_whichOneof_Primitivevalue == 1 && self->_primitiveNull;
}

- (void)setPrimitiveNull:(BOOL)a3
{
  self->_int primitiveBool = 0;
  self->_int64_t primitiveInt = 0;
  self->_double primitiveDouble = 0.0;
  primitiveDecimal = self->_primitiveDecimal;
  self->_primitiveDecimal = 0;

  primitiveDateComponents = self->_primitiveDateComponents;
  self->_primitiveDateComponents = 0;

  measurement = self->_measurement;
  self->_measurement = 0;

  currencyAmount = self->_currencyAmount;
  self->_currencyAmount = 0;

  paymentMethod = self->_paymentMethod;
  self->_paymentMethod = 0;

  placemark = self->_placemark;
  self->_placemark = 0;

  person = self->_person;
  self->_person = 0;

  file = self->_file;
  self->_file = 0;

  app = self->_app;
  self->_app = 0;

  self->_unint64_t whichOneof_Primitivevalue = 1;
  self->_int primitiveNull = a3;
}

@end
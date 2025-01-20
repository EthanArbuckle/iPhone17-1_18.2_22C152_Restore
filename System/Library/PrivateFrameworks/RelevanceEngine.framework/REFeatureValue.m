@interface REFeatureValue
+ (REFeatureValue)featureValueWithBool:(BOOL)a3;
+ (REFeatureValue)featureValueWithDictionary:(id)a3;
+ (REFeatureValue)featureValueWithDouble:(double)a3;
+ (REFeatureValue)featureValueWithInt64:(int64_t)a3;
+ (REFeatureValue)featureValueWithSet:(id)a3;
+ (REFeatureValue)featureValueWithString:(id)a3;
+ (id)nullValueForFeature:(id)a3;
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (NSSet)setValue;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)hash;
- (unint64_t)int64Value;
- (unint64_t)type;
@end

@implementation REFeatureValue

+ (REFeatureValue)featureValueWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"value_type"];
  uint64_t v5 = [v4 integerValue];

  v6 = [v3 objectForKeyedSubscript:@"value_value"];
  v7 = v6;
  switch(v5)
  {
    case 0:
      uint64_t v8 = +[REFeatureValue featureValueWithBool:](REFeatureValue, "featureValueWithBool:", [v6 BOOLValue]);
      goto LABEL_7;
    case 1:
      uint64_t v8 = +[REFeatureValue featureValueWithInt64:](REFeatureValue, "featureValueWithInt64:", [v6 integerValue]);
      goto LABEL_7;
    case 2:
      [v6 doubleValue];
      uint64_t v8 = +[REFeatureValue featureValueWithDouble:](REFeatureValue, "featureValueWithDouble:");
      goto LABEL_7;
    case 3:
      uint64_t v8 = +[REFeatureValue featureValueWithString:v6];
LABEL_7:
      v9 = (void *)v8;
      break;
    case 4:
      v10 = [MEMORY[0x263EFF9C0] set];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v11 = v7;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = +[REFeatureValue featureValueWithDictionary:](REFeatureValue, "featureValueWithDictionary:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
            [v10 addObject:v16];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v13);
      }

      v9 = +[REFeatureValue featureValueWithSet:v10];

      break;
    default:
      v9 = 0;
      break;
  }

  return (REFeatureValue *)v9;
}

+ (REFeatureValue)featureValueWithString:(id)a3
{
  return (REFeatureValue *)+[_REStringFeatureValue featureValueWithString:a3];
}

+ (REFeatureValue)featureValueWithInt64:(int64_t)a3
{
  return (REFeatureValue *)+[_REIntegerFeatureValue featureValueWithInt64:a3];
}

+ (REFeatureValue)featureValueWithDouble:(double)a3
{
  return (REFeatureValue *)+[_REDoubleFeatureValue featureValueWithDouble:a3];
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)BOOLValue
{
  return 0;
}

- (unint64_t)int64Value
{
  return 0;
}

- (double)doubleValue
{
  return 0.0;
}

- (NSString)stringValue
{
  return (NSString *)&stru_26CFA57D0;
}

- (NSSet)setValue
{
  return (NSSet *)[MEMORY[0x263EFFA08] set];
}

+ (REFeatureValue)featureValueWithBool:(BOOL)a3
{
  return (REFeatureValue *)+[_REBoolFeatureValue featureValueWithBool:a3];
}

+ (REFeatureValue)featureValueWithSet:(id)a3
{
  return (REFeatureValue *)+[_RESetFeatureValue featureValueWithSet:a3];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = REValueDescriptionStringFromFeatureValue(self);
  v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

+ (id)nullValueForFeature:(id)a3
{
  id v3 = a3;
  if (nullValueForFeature__onceToken != -1) {
    dispatch_once(&nullValueForFeature__onceToken, &__block_literal_global_266);
  }
  uint64_t v4 = [v3 featureType];
  uint64_t v5 = &nullValueForFeature__NullValue;
  if (!v4) {
    uint64_t v5 = &nullValueForFeature__NullBinaryValue;
  }
  id v6 = (id)*v5;

  return v6;
}

uint64_t __49__REFeatureValue_NullValue__nullValueForFeature___block_invoke()
{
  uint64_t v0 = +[REFeatureValue featureValueWithInt64:-1];
  v1 = (void *)nullValueForFeature__NullValue;
  nullValueForFeature__NullValue = v0;

  uint64_t v2 = +[REFeatureValue featureValueWithBool:0];
  uint64_t v3 = nullValueForFeature__NullBinaryValue;
  nullValueForFeature__NullBinaryValue = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

- (id)dictionaryEncoding
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  switch([(REFeatureValue *)self type])
  {
    case 0uLL:
      uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[REFeatureValue BOOLValue](self, "BOOLValue"));
      goto LABEL_7;
    case 1uLL:
      uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[REFeatureValue int64Value](self, "int64Value"));
      goto LABEL_7;
    case 2uLL:
      uint64_t v5 = NSNumber;
      [(REFeatureValue *)self doubleValue];
      uint64_t v3 = objc_msgSend(v5, "numberWithDouble:");
      goto LABEL_7;
    case 3uLL:
      uint64_t v3 = [(REFeatureValue *)self stringValue];
LABEL_7:
      uint64_t v4 = (void *)v3;
      break;
    case 4uLL:
      id v6 = [MEMORY[0x263EFF980] array];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v7 = [(REFeatureValue *)self setValue];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryEncoding];
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v9);
      }

      uint64_t v4 = (void *)[v6 copy];
      break;
    default:
      uint64_t v4 = &unk_26CFCD668;
      break;
  }
  v20[0] = @"value_type";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[REFeatureValue type](self, "type"));
  v20[1] = @"value_value";
  v21[0] = v13;
  v21[1] = v4;
  uint64_t v14 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v14;
}

@end
@interface SSBagKey
- (NSArray)stringRepresentation;
- (NSObject)defaultValue;
- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4;
- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5;
- (id)valueFromDictionary:(id)a3;
- (unint64_t)valueType;
@end

@implementation SSBagKey

- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4
{
  return [(SSBagKey *)self initWithStringRepresentation:a3 valueType:a4 defaultValue:0];
}

- (SSBagKey)initWithStringRepresentation:(id)a3 valueType:(unint64_t)a4 defaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && !SSBagValueTypeIsPrimitive(a4))
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Default values are only supported for primitive types." userInfo:0];
    objc_exception_throw(v15);
  }
  v10 = [(SSBagKey *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultValue, a5);
    uint64_t v12 = [v8 componentsSeparatedByString:@"/"];
    stringRepresentation = v11->_stringRepresentation;
    v11->_stringRepresentation = (NSArray *)v12;

    v11->_valueType = a4;
  }

  return v11;
}

- (id)valueFromDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(SSBagKey *)self stringRepresentation];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(SSBagKey *)self stringRepresentation];
      id v9 = [v8 objectAtIndexedSubscript:v7];

      v10 = [v4 objectForKeyedSubscript:v9];
      if (!v10)
      {
LABEL_9:
        id v15 = 0;
        goto LABEL_11;
      }
      v11 = [(SSBagKey *)self stringRepresentation];
      uint64_t v12 = [v11 count] - 1;

      if (v7 == v12) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_9;
      }

      ++v7;
      v13 = [(SSBagKey *)self stringRepresentation];
      unint64_t v14 = [v13 count];

      id v4 = v10;
      if (v7 >= v14)
      {
        id v15 = 0;
        id v4 = v10;
        goto LABEL_12;
      }
    }
    id v15 = v10;
LABEL_11:
  }
  else
  {
    id v15 = 0;
  }
LABEL_12:

  return v15;
}

- (NSObject)defaultValue
{
  return self->_defaultValue;
}

- (NSArray)stringRepresentation
{
  return self->_stringRepresentation;
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_defaultValue, 0);
}

@end
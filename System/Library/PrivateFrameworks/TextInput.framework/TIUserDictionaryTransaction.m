@interface TIUserDictionaryTransaction
+ (BOOL)supportsSecureCoding;
- (TIUserDictionaryEntryValue)valueToDelete;
- (TIUserDictionaryEntryValue)valueToInsert;
- (TIUserDictionaryTransaction)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setValueToDelete:(id)a3;
- (void)setValueToInsert:(id)a3;
@end

@implementation TIUserDictionaryTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueToInsert, 0);

  objc_storeStrong((id *)&self->_valueToDelete, 0);
}

- (void)setValueToInsert:(id)a3
{
}

- (TIUserDictionaryEntryValue)valueToInsert
{
  return self->_valueToInsert;
}

- (void)setValueToDelete:(id)a3
{
}

- (TIUserDictionaryEntryValue)valueToDelete
{
  return self->_valueToDelete;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TIUserDictionaryTransaction *)self valueToDelete];
  v6 = [(TIUserDictionaryTransaction *)self valueToInsert];
  v7 = [v3 stringWithFormat:@"<%@: valueToDelete = %@, valueToInsert = %@>", v4, v5, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  valueToDelete = self->_valueToDelete;
  id v7 = v4;
  if (valueToDelete)
  {
    [v4 encodeObject:valueToDelete forKey:@"valueToDelete"];
    id v4 = v7;
  }
  valueToInsert = self->_valueToInsert;
  if (valueToInsert)
  {
    [v7 encodeObject:valueToInsert forKey:@"valueToInsert"];
    id v4 = v7;
  }
}

- (TIUserDictionaryTransaction)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIUserDictionaryTransaction;
  v5 = [(TIUserDictionaryTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueToDelete"];
    valueToDelete = v5->_valueToDelete;
    v5->_valueToDelete = (TIUserDictionaryEntryValue *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueToInsert"];
    valueToInsert = v5->_valueToInsert;
    v5->_valueToInsert = (TIUserDictionaryEntryValue *)v8;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
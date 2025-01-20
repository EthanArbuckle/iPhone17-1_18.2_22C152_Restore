@interface CRDictionaryElement
+ (id)temporaryElementWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CRDataType)value;
- (CRDictionaryElement)initWithValue:(id)a3;
- (CRDictionaryElement)initWithValue:(id)a3 timestamp:(id)a4;
- (CRVectorTimestamp)timestamp;
- (id)description;
- (unint64_t)hash;
- (void)mergeWith:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CRDictionaryElement

+ (id)temporaryElementWithValue:(id)a3
{
  id v3 = a3;
  v4 = [[CRDictionaryElement alloc] initWithValue:v3 timestamp:0];

  return v4;
}

- (CRDictionaryElement)initWithValue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRDictionaryElement;
  v6 = [(CRDictionaryElement *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_value, a3);
    v8 = objc_alloc_init(CRVectorTimestamp);
    timestamp = v7->_timestamp;
    v7->_timestamp = v8;
  }
  return v7;
}

- (CRDictionaryElement)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRDictionaryElement;
  v9 = [(CRDictionaryElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(CRDictionaryElement *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(CRDictionaryElement *)self value];
    v6 = [v4 value];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)mergeWith:(id)a3
{
  id v8 = a3;
  id v4 = [(CRDictionaryElement *)self timestamp];
  id v5 = [v8 timestamp];
  [v4 mergeWith:v5];

  v6 = [(CRDictionaryElement *)self value];
  char v7 = [v8 value];
  [v6 mergeWith:v7];
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(CRDictionaryElement *)self timestamp];
  char v7 = [v6 shortDescription];
  id v8 = [(CRDictionaryElement *)self value];
  v9 = [v3 stringWithFormat:@"<%@ %p %@ %@>", v5, self, v7, v8];

  return v9;
}

- (CRDataType)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (CRVectorTimestamp)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end
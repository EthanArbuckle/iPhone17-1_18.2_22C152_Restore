@interface ICCRDictionaryElement
+ (id)temporaryElementWithValue:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRDataType)value;
- (ICCRDictionaryElement)initWithValue:(id)a3;
- (ICCRDictionaryElement)initWithValue:(id)a3 timestamp:(id)a4;
- (ICCRVectorTimestamp)timestamp;
- (id)description;
- (unint64_t)hash;
- (void)mergeWith:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation ICCRDictionaryElement

- (ICCRDataType)value
{
  return self->_value;
}

- (ICCRDictionaryElement)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICCRDictionaryElement;
  v9 = [(ICCRDictionaryElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_value, a3);
    objc_storeStrong((id *)&v10->_timestamp, a4);
  }

  return v10;
}

+ (id)temporaryElementWithValue:(id)a3
{
  id v3 = a3;
  v4 = [[ICCRDictionaryElement alloc] initWithValue:v3 timestamp:0];

  return v4;
}

- (ICCRDictionaryElement)initWithValue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRDictionaryElement;
  v6 = [(ICCRDictionaryElement *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_value, a3);
    id v8 = objc_alloc_init(ICCRVectorTimestamp);
    timestamp = v7->_timestamp;
    v7->_timestamp = v8;
  }
  return v7;
}

- (unint64_t)hash
{
  v2 = [(ICCRDictionaryElement *)self value];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ICCRDictionaryElement *)self value];
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
  id v4 = [(ICCRDictionaryElement *)self timestamp];
  id v5 = [v8 timestamp];
  [v4 mergeWith:v5];

  v6 = [(ICCRDictionaryElement *)self value];
  char v7 = [v8 value];
  [v6 mergeWith:v7];
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(ICCRDictionaryElement *)self timestamp];
  char v7 = [v6 shortDescription];
  id v8 = [(ICCRDictionaryElement *)self value];
  v9 = [v3 stringWithFormat:@"<%@ %p %@ %@>", v5, self, v7, v8];

  return v9;
}

- (void)setValue:(id)a3
{
}

- (ICCRVectorTimestamp)timestamp
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
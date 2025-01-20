@interface WFCloudKitWebServiceQueryFilterComparison
- (NSString)recordKey;
- (NSString)value;
- (id)stringRepresentationWithRecordType:(id)a3;
- (unint64_t)type;
- (void)setRecordKey:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation WFCloudKitWebServiceQueryFilterComparison

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setRecordKey:(id)a3
{
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (id)stringRepresentationWithRecordType:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [(WFCloudKitWebServiceQueryFilterComparison *)self recordKey];
  v7 = [v4 stringWithFormat:@"%@.%@", v5, v6];

  v8 = [(WFCloudKitWebServiceQueryFilterComparison *)self value];
  switch([(WFCloudKitWebServiceQueryFilterComparison *)self type])
  {
    case 0uLL:
      [NSString stringWithFormat:@"%@ = %@", v7, v8];
      goto LABEL_4;
    case 1uLL:
      [NSString stringWithFormat:@"%@ IN (%@)", v7, v8];
LABEL_4:
      self = (WFCloudKitWebServiceQueryFilterComparison *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      v9 = NSString;
      v10 = [v8 lowercaseString];
      [v9 stringWithFormat:@"tokenize_set(%@, %@)", v7, v10];
      goto LABEL_8;
    case 3uLL:
      v11 = NSString;
      v10 = [v8 lowercaseString];
      [v11 stringWithFormat:@"tokenize_phrase(%@, %@)", v7, v10];
      goto LABEL_8;
    case 4uLL:
      v12 = NSString;
      v10 = [v8 lowercaseString];
      [v12 stringWithFormat:@"prefix(%@, %@)", v7, v10];
LABEL_8:
      self = (WFCloudKitWebServiceQueryFilterComparison *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return self;
}

@end
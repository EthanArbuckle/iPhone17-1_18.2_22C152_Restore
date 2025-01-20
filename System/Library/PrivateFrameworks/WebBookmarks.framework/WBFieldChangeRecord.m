@interface WBFieldChangeRecord
- (CKRecord)record;
- (NSDictionary)attributes;
- (WBFieldChangeRecord)initWithField:(id)a3 changeType:(int)a4 attributes:(id)a5 record:(id)a6 identifier:(int64_t)a7;
- (WBSCRDTField)field;
- (int)changeType;
- (int64_t)identifier;
@end

@implementation WBFieldChangeRecord

- (WBFieldChangeRecord)initWithField:(id)a3 changeType:(int)a4 attributes:(id)a5 record:(id)a6 identifier:(int64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBFieldChangeRecord;
  v16 = [(WBFieldChangeRecord *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_field, a3);
    v17->_changeType = a4;
    objc_storeStrong((id *)&v17->_attributes, a5);
    objc_storeStrong((id *)&v17->_record, a6);
    v17->_identifier = a7;
    v18 = v17;
  }

  return v17;
}

- (WBSCRDTField)field
{
  return self->_field;
}

- (int)changeType
{
  return self->_changeType;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (CKRecord)record
{
  return self->_record;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_field, 0);
}

@end
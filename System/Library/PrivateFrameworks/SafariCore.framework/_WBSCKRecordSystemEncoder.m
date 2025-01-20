@interface _WBSCKRecordSystemEncoder
+ (BOOL)supportsSecureCoding;
- (CKRecord)record;
- (Class)classForCoder;
- (_WBSCKRecordSystemEncoder)initWithCoder:(id)a3;
- (_WBSCKRecordSystemEncoder)initWithRecord:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _WBSCKRecordSystemEncoder

- (_WBSCKRecordSystemEncoder)initWithRecord:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WBSCKRecordSystemEncoder;
  v5 = [(_WBSCKRecordSystemEncoder *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_record, v4);
    v7 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WBSCKRecordSystemEncoder)initWithCoder:(id)a3
{
  return [(_WBSCKRecordSystemEncoder *)self initWithRecord:0];
}

- (Class)classForCoder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_record);
  v3 = objc_opt_class();

  return (Class)v3;
}

- (void)encodeWithCoder:(id)a3
{
  p_record = &self->_record;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_record);
  [WeakRetained encodeSystemFieldsWithCoder:v4];
}

- (CKRecord)record
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_record);
  return (CKRecord *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
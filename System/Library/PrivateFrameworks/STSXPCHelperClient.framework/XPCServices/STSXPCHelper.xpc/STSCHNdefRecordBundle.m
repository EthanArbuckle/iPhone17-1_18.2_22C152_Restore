@interface STSCHNdefRecordBundle
- (BOOL)isEqual:(id)a3;
- (NSArray)auxiliaryRecords;
- (STSCHNdefRecordBundle)initWithAlternativeRecord:(id)a3 configurationRecord:(id)a4 auxiliaryRecords:(id)a5 errorRecord:(id)a6;
- (STSNDEFRecord)alternativeRecord;
- (STSNDEFRecord)configurationRecord;
- (STSNDEFRecord)errorRecord;
- (void)setAlternativeRecord:(id)a3;
- (void)setAuxiliaryRecords:(id)a3;
- (void)setConfigurationRecord:(id)a3;
- (void)setErrorRecord:(id)a3;
@end

@implementation STSCHNdefRecordBundle

- (BOOL)isEqual:(id)a3
{
  v4 = (STSCHNdefRecordBundle *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = v6;
    if (self->_alternativeRecord)
    {
      uint64_t v8 = [(STSCHNdefRecordBundle *)v6 alternativeRecord];
      if (v8)
      {
        v9 = (void *)v8;
        alternativeRecord = self->_alternativeRecord;
        v11 = [(STSCHNdefRecordBundle *)v7 alternativeRecord];
        LODWORD(alternativeRecord) = [(STSNDEFRecord *)alternativeRecord isEqual:v11];

        if (!alternativeRecord) {
          goto LABEL_9;
        }
      }
      if (self->_alternativeRecord) {
        goto LABEL_9;
      }
    }
    v12 = [(STSCHNdefRecordBundle *)v7 alternativeRecord];

    if (v12) {
      goto LABEL_9;
    }
    if (!self->_configurationRecord) {
      goto LABEL_9;
    }
    uint64_t v15 = [(STSCHNdefRecordBundle *)v7 configurationRecord];
    if (v15)
    {
      v16 = (void *)v15;
      configurationRecord = self->_configurationRecord;
      v18 = [(STSCHNdefRecordBundle *)v7 configurationRecord];
      LODWORD(configurationRecord) = [(STSNDEFRecord *)configurationRecord isEqual:v18];

      if (!configurationRecord) {
        goto LABEL_9;
      }
    }
    if (!self->_configurationRecord) {
      goto LABEL_9;
    }
    v19 = [(STSCHNdefRecordBundle *)v7 configurationRecord];

    if (!v19) {
      goto LABEL_9;
    }
    auxiliaryRecords = self->_auxiliaryRecords;
    v21 = [(STSCHNdefRecordBundle *)v7 auxiliaryRecords];
    LODWORD(auxiliaryRecords) = [(NSArray *)auxiliaryRecords isEqualToArray:v21];

    if (!auxiliaryRecords) {
      goto LABEL_9;
    }
    if (!self->_errorRecord) {
      goto LABEL_9;
    }
    uint64_t v22 = [(STSCHNdefRecordBundle *)v7 errorRecord];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = self->_configurationRecord;
      v25 = [(STSCHNdefRecordBundle *)v7 errorRecord];
      LODWORD(v24) = [(STSNDEFRecord *)v24 isEqual:v25];

      if (!v24) {
        goto LABEL_9;
      }
    }
    if (self->_errorRecord)
    {
      v26 = [(STSCHNdefRecordBundle *)v7 errorRecord];
      BOOL v13 = v26 != 0;
    }
    else
    {
LABEL_9:
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (STSCHNdefRecordBundle)initWithAlternativeRecord:(id)a3 configurationRecord:(id)a4 auxiliaryRecords:(id)a5 errorRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STSCHNdefRecordBundle;
  uint64_t v15 = [(STSCHNdefRecordBundle *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alternativeRecord, a3);
    objc_storeStrong((id *)&v16->_configurationRecord, a4);
    objc_storeStrong((id *)&v16->_auxiliaryRecords, a5);
    objc_storeStrong((id *)&v16->_errorRecord, a6);
  }

  return v16;
}

- (STSNDEFRecord)alternativeRecord
{
  return self->_alternativeRecord;
}

- (void)setAlternativeRecord:(id)a3
{
}

- (STSNDEFRecord)configurationRecord
{
  return self->_configurationRecord;
}

- (void)setConfigurationRecord:(id)a3
{
}

- (NSArray)auxiliaryRecords
{
  return self->_auxiliaryRecords;
}

- (void)setAuxiliaryRecords:(id)a3
{
}

- (STSNDEFRecord)errorRecord
{
  return self->_errorRecord;
}

- (void)setErrorRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorRecord, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);
  objc_storeStrong((id *)&self->_configurationRecord, 0);

  objc_storeStrong((id *)&self->_alternativeRecord, 0);
}

@end
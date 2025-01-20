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
    BOOL v18 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v9 = v6;
    if (self->_alternativeRecord)
    {
      uint64_t v10 = objc_msgSend_alternativeRecord(v6, v7, v8);
      if (v10)
      {
        v11 = (void *)v10;
        alternativeRecord = self->_alternativeRecord;
        v13 = objc_msgSend_alternativeRecord(v9, v7, v8);
        LODWORD(alternativeRecord) = objc_msgSend_isEqual_(alternativeRecord, v14, (uint64_t)v13);

        if (!alternativeRecord) {
          goto LABEL_9;
        }
      }
      if (self->_alternativeRecord) {
        goto LABEL_9;
      }
    }
    v15 = objc_msgSend_alternativeRecord(v9, v7, v8);

    if (v15) {
      goto LABEL_9;
    }
    if (!self->_configurationRecord) {
      goto LABEL_9;
    }
    uint64_t v20 = objc_msgSend_configurationRecord(v9, v16, v17);
    if (v20)
    {
      v23 = (void *)v20;
      configurationRecord = self->_configurationRecord;
      v25 = objc_msgSend_configurationRecord(v9, v21, v22);
      LODWORD(configurationRecord) = objc_msgSend_isEqual_(configurationRecord, v26, (uint64_t)v25);

      if (!configurationRecord) {
        goto LABEL_9;
      }
    }
    if (!self->_configurationRecord) {
      goto LABEL_9;
    }
    v27 = objc_msgSend_configurationRecord(v9, v21, v22);

    if (!v27) {
      goto LABEL_9;
    }
    auxiliaryRecords = self->_auxiliaryRecords;
    v31 = objc_msgSend_auxiliaryRecords(v9, v28, v29);
    LODWORD(auxiliaryRecords) = objc_msgSend_isEqualToArray_(auxiliaryRecords, v32, (uint64_t)v31);

    if (!auxiliaryRecords) {
      goto LABEL_9;
    }
    if (!self->_errorRecord) {
      goto LABEL_9;
    }
    uint64_t v35 = objc_msgSend_errorRecord(v9, v33, v34);
    if (v35)
    {
      v38 = (void *)v35;
      v39 = self->_configurationRecord;
      v40 = objc_msgSend_errorRecord(v9, v36, v37);
      LODWORD(v39) = objc_msgSend_isEqual_(v39, v41, (uint64_t)v40);

      if (!v39) {
        goto LABEL_9;
      }
    }
    if (self->_errorRecord)
    {
      v42 = objc_msgSend_errorRecord(v9, v36, v37);
      BOOL v18 = v42 != 0;
    }
    else
    {
LABEL_9:
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (STSCHNdefRecordBundle)initWithAlternativeRecord:(id)a3 configurationRecord:(id)a4 auxiliaryRecords:(id)a5 errorRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)STSCHNdefRecordBundle;
  v15 = [(STSCHNdefRecordBundle *)&v18 init];
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
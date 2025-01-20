@interface _ICNAAccountReportToDevice
- (NSMutableDictionary)countOfAccountsByType;
- (NSMutableDictionary)countOfNotesByType;
- (_ICNAAccountReportToDevice)init;
- (id)accountTypeSummary;
- (void)reportAccountType:(int64_t)a3 noteCount:(unint64_t)a4;
- (void)setCountOfAccountsByType:(id)a3;
- (void)setCountOfNotesByType:(id)a3;
@end

@implementation _ICNAAccountReportToDevice

- (_ICNAAccountReportToDevice)init
{
  v8.receiver = self;
  v8.super_class = (Class)_ICNAAccountReportToDevice;
  v2 = [(_ICNAAccountReportToDevice *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfAccountsByType = v2->_countOfAccountsByType;
    v2->_countOfAccountsByType = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfNotesByType = v2->_countOfNotesByType;
    v2->_countOfNotesByType = v5;
  }
  return v2;
}

- (void)reportAccountType:(int64_t)a3 noteCount:(unint64_t)a4
{
  v7 = [(_ICNAAccountReportToDevice *)self countOfAccountsByType];
  objc_super v8 = [NSNumber numberWithInteger:a3];
  v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [NSNumber numberWithUnsignedInteger:v10 + 1];
  v12 = [(_ICNAAccountReportToDevice *)self countOfAccountsByType];
  v13 = [NSNumber numberWithInteger:a3];
  [v12 setObject:v11 forKeyedSubscript:v13];

  v14 = [(_ICNAAccountReportToDevice *)self countOfNotesByType];
  v15 = [NSNumber numberWithInteger:a3];
  v16 = [v14 objectForKeyedSubscript:v15];
  uint64_t v17 = [v16 unsignedIntegerValue];

  id v20 = [NSNumber numberWithUnsignedInteger:v17 + a4];
  v18 = [(_ICNAAccountReportToDevice *)self countOfNotesByType];
  v19 = [NSNumber numberWithInteger:a3];
  [v18 setObject:v20 forKeyedSubscript:v19];
}

- (id)accountTypeSummary
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(_ICNAAccountReportToDevice *)self countOfAccountsByType];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___ICNAAccountReportToDevice_accountTypeSummary__block_invoke;
  v6[3] = &unk_1E64B8B98;
  v6[4] = self;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)countOfAccountsByType
{
  return self->_countOfAccountsByType;
}

- (void)setCountOfAccountsByType:(id)a3
{
}

- (NSMutableDictionary)countOfNotesByType
{
  return self->_countOfNotesByType;
}

- (void)setCountOfNotesByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countOfNotesByType, 0);
  objc_storeStrong((id *)&self->_countOfAccountsByType, 0);
}

@end
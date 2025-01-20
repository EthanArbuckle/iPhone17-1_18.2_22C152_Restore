@interface _ICNAAttachmentReportToAccount
- (NSMutableDictionary)countOfAttachmentByUTI;
- (_ICNAAttachmentReportToAccount)init;
- (id)attachmentUTISummary;
- (void)reportAttachmentTypeUTI:(id)a3;
- (void)setCountOfAttachmentByUTI:(id)a3;
@end

@implementation _ICNAAttachmentReportToAccount

- (_ICNAAttachmentReportToAccount)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICNAAttachmentReportToAccount;
  v2 = [(_ICNAAttachmentReportToAccount *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    countOfAttachmentByUTI = v2->_countOfAttachmentByUTI;
    v2->_countOfAttachmentByUTI = v3;
  }
  return v2;
}

- (void)reportAttachmentTypeUTI:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(_ICNAAttachmentReportToAccount *)self countOfAttachmentByUTI];
    objc_super v6 = [v5 objectForKeyedSubscript:v4];
    uint64_t v7 = [v6 unsignedIntegerValue];

    id v9 = [NSNumber numberWithUnsignedInteger:v7 + 1];
    v8 = [(_ICNAAttachmentReportToAccount *)self countOfAttachmentByUTI];
    [v8 setObject:v9 forKeyedSubscript:v4];
  }
}

- (id)attachmentUTISummary
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v3 = [(_ICNAAttachmentReportToAccount *)self countOfAttachmentByUTI];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54___ICNAAttachmentReportToAccount_attachmentUTISummary__block_invoke;
  v6[3] = &unk_1E64B8B70;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (NSMutableDictionary)countOfAttachmentByUTI
{
  return self->_countOfAttachmentByUTI;
}

- (void)setCountOfAttachmentByUTI:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
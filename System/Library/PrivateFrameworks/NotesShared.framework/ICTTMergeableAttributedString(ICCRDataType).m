@interface ICTTMergeableAttributedString(ICCRDataType)
@end

@implementation ICTTMergeableAttributedString(ICCRDataType)

- (void)initWithICCRCoder:()ICCRDataType string:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTTMergeableString initialized with non-TT-compatible document.", v1, 2u);
}

@end
@interface ICAttachment(SearchIndexable)
@end

@implementation ICAttachment(SearchIndexable)

- (void)dataForTypeIdentifier:()SearchIndexable .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "The ICNoteItemProviderUTI should never be requested", v1, 2u);
}

@end
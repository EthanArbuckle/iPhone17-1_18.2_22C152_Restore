@interface NSError(MessageContentView)
- (id)mf_markupString;
- (void)mf_markupString;
@end

@implementation NSError(MessageContentView)

- (id)mf_markupString
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = messageForFragment(a1);
  if (!v2)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = objc_msgSend(a1, "ef_publicDescription");
      [(NSError(MessageContentView) *)v4 mf_markupString];
    }

    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v2 = [v5 localizedStringForKey:@"MESSAGE_CAUSED_PROBLEM" value:&stru_1F39E2A88 table:@"Main"];
  }
  v6 = NSString;
  v7 = objc_msgSend(v2, "mf_stringByEscapingHTMLCodes");
  v8 = [v6 localizedStringWithFormat:@"<html dir=auto><body><i><font color=#888>%@</font></i></body></html>", v7];

  return v8;
}

- (void)mf_markupString
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DDF5A000, log, OS_LOG_TYPE_ERROR, "Failed to find a message for error: %{public}@", buf, 0xCu);
}

@end
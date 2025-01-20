@interface UIDocumentRequestRectCountBeforePreference
@end

@implementation UIDocumentRequestRectCountBeforePreference

void ___UIDocumentRequestRectCountBeforePreference_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!os_variant_has_internal_diagnostics()) {
    goto LABEL_2;
  }
  v0 = TIGetDocumentRequestRectCountBeforeValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_2:
    qword_1EB261D48 = 5;
    return;
  }
  qword_1EB261D48 = [v0 integerValue];
  v1 = _UIKeyboardLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    v3 = "RectCountBefore";
    __int16 v4 = 2048;
    uint64_t v5 = qword_1EB261D48;
    _os_log_impl(&dword_1853B0000, v1, OS_LOG_TYPE_DEFAULT, "Obtained RTIDocumentRequest default %s=%ld from user defaults", (uint8_t *)&v2, 0x16u);
  }
}

@end
@interface UIDocumentUnavailableConfiguration
@end

@implementation UIDocumentUnavailableConfiguration

BOOL __57___UIDocumentUnavailableConfiguration__setSecondaryMenu___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  v3 = [a2 identifier];
  v4 = _UIDocumentCreationIntentFromActionIdentifier(v3);
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __57___UIDocumentUnavailableConfiguration__setSecondaryMenu___block_invoke_2()
{
  return MEMORY[0x1E4F1CBF0];
}

@end
@interface PKGetConstantStringNF
@end

@implementation PKGetConstantStringNF

void __PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary) {
    PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_NAME_constant = *(void *)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_SECURE_XPC_EVENT_KEY_EVENT_NAME");
  }
}

void __PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_SIMPLE_STRING_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary) {
    qword_1EB403560 = *(void *)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_SECURE_XPC_EVENT_KEY_EVENT_SIMPLE_STRING");
  }
}

void __PKGetConstantStringNF_SECURE_XPC_EVENT_KEY_EVENT_SIMPLE_NUMBER_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary) {
    qword_1EB403570 = *(void *)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_SECURE_XPC_EVENT_KEY_EVENT_SIMPLE_NUMBER");
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_APPLET_IDENTIFIER_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_APPLET_IDENTIFIER");
    objc_storeStrong((id *)&PKGetConstantStringNF_DCK_EVENT_KEY_APPLET_IDENTIFIER_constant, v0);
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_NAME_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_NAME");
    objc_storeStrong((id *)&qword_1EB403580, v0);
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_KEY_IDENTIFIER_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_KEY_IDENTIFIER");
    objc_storeStrong((id *)&PKGetConstantStringNF_DCK_EVENT_KEY_KEY_IDENTIFIER_constant, v0);
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_ERROR_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_ERROR");
    objc_storeStrong((id *)&qword_1EB403590, v0);
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_RKE_ACTIONS_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_RKE_ACTIONS");
    objc_storeStrong((id *)&qword_1EB4035A0, v0);
  }
}

void __PKGetConstantStringNF_DCK_EVENT_KEY_RANGING_SUSPENSION_REASONS_block_invoke()
{
  if (PKLoadNearField_loadPredicate != -1) {
    dispatch_once(&PKLoadNearField_loadPredicate, &__block_literal_global_213);
  }
  if (PKLoadNearField_frameworkLibrary)
  {
    v0 = *(void **)dlsym((void *)PKLoadNearField_frameworkLibrary, "NF_DCK_EVENT_KEY_RANGING_SUSPENSION_REASONS");
    objc_storeStrong((id *)&qword_1EB4035B0, v0);
  }
}

@end
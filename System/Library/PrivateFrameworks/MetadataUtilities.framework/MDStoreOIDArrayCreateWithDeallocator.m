@interface MDStoreOIDArrayCreateWithDeallocator
@end

@implementation MDStoreOIDArrayCreateWithDeallocator

void *___MDStoreOIDArrayCreateWithDeallocator_block_invoke()
{
  if (qword_1E95ACA80 == 0xFFFFFFFFLL)
  {
    qword_1E95ACA80 = 0;
    _CFRuntimeInitStaticInstance();
  }
  result = _Block_copy(&__block_literal_global_43);
  qword_1E95ACA88 = (uint64_t)result;
  return result;
}

@end
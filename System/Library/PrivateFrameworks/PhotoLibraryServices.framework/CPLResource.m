@interface CPLResource
@end

@implementation CPLResource

void __39__CPLResource_PL__imageDerivativeTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EEBEF750, &unk_1EEBEF768, &unk_1EEBEF780, &unk_1EEBEF798, 0);
  v1 = (void *)imageDerivativeTypes_s_types;
  imageDerivativeTypes_s_types = v0;
}

void __39__CPLResource_PL__videoDerivativeTypes__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EEBEF6F0, &unk_1EEBEF708, &unk_1EEBEF720, &unk_1EEBEF738, 0);
  v1 = (void *)videoDerivativeTypes_s_types;
  videoDerivativeTypes_s_types = v0;
}

@end
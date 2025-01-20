@interface BasicAceContext
+ (id)sharedBasicAceContext;
- (Class)classWithClassName:(id)a3 group:(id)a4;
- (id)aceObjectWithDictionary:(id)a3;
- (void)registerGroupAcronym:(id)a3 forGroupWithIdentifier:(id)a4;
@end

@implementation BasicAceContext

+ (id)sharedBasicAceContext
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BasicAceContext_sharedBasicAceContext__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB4EC9D8 != -1) {
    dispatch_once(&qword_1EB4EC9D8, block);
  }
  v2 = (void *)_MergedGlobals_0;
  return v2;
}

uint64_t __40__BasicAceContext_sharedBasicAceContext__block_invoke(uint64_t a1)
{
  _MergedGlobals_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)registerGroupAcronym:(id)a3 forGroupWithIdentifier:(id)a4
{
}

- (Class)classWithClassName:(id)a3 group:(id)a4
{
  return +[SAClassRegistry classForAceClassName:a3 inGroupWithIdentifier:a4];
}

- (id)aceObjectWithDictionary:(id)a3
{
  return +[AceObject aceObjectWithDictionary:a3];
}

@end
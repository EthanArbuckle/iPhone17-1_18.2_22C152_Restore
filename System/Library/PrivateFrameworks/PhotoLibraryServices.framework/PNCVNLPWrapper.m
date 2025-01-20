@interface PNCVNLPWrapper
- (PNCVNLPWrapper)initWithCLIPModelName:(id)a3 error:(id *)a4;
- (id)encodeText:(id)a3 error:(id *)a4;
@end

@implementation PNCVNLPWrapper

- (id)encodeText:(id)a3 error:(id *)a4
{
  id v4 = objc_alloc(MEMORY[0x1E4F45958]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B90]);
  v6 = (void *)[v4 initWithCoder:v5];

  return v6;
}

- (PNCVNLPWrapper)initWithCLIPModelName:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PNCVNLPWrapper;
  return [(PNCVNLPWrapper *)&v5 init];
}

@end
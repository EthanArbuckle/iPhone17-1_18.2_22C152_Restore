@interface SFCoder
- (SFCoder)initWithOptions:(id)a3;
- (SFCodingOptions)options;
- (id)encodeTopLevelValue:(id)a3 error:(id *)a4;
- (void)setOptions:(id)a3;
@end

@implementation SFCoder

- (SFCoder)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFCoder;
  v6 = [(SFCoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_coderInternal + 1, a3);
  }

  return v7;
}

- (id)encodeTopLevelValue:(id)a3 error:(id *)a4
{
  return 0;
}

- (SFCodingOptions)options
{
  v2 = (void *)[*((id *)self->_coderInternal + 1) copy];
  return (SFCodingOptions *)v2;
}

- (void)setOptions:(id)a3
{
  *((void *)self->_coderInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end
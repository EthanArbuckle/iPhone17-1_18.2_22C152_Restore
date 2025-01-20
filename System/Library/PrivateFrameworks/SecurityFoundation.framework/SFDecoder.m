@interface SFDecoder
- (SFCodingOptions)options;
- (SFDecoder)initWithOptions:(id)a3;
- (id)decodeValueOfType:(Class)a3 fromData:(id)a4 error:(id)a5;
- (void)setOptions:(id)a3;
@end

@implementation SFDecoder

- (SFDecoder)initWithOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFDecoder;
  v6 = [(SFDecoder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)v6->_decoderInternal + 1, a3);
  }

  return v7;
}

- (id)decodeValueOfType:(Class)a3 fromData:(id)a4 error:(id)a5
{
  return 0;
}

- (SFCodingOptions)options
{
  v2 = (void *)[*((id *)self->_decoderInternal + 1) copy];
  return (SFCodingOptions *)v2;
}

- (void)setOptions:(id)a3
{
  *((void *)self->_decoderInternal + 1) = [a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
}

@end
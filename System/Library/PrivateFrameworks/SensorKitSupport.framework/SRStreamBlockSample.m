@interface SRStreamBlockSample
- (BOOL)sr_prefersUTF8StringRepresentation;
- (NSDictionary)sampleDict;
- (SRStreamBlockSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (_TtC16SensorKitSupport13SRStreamBlock)streamBlock;
- (id)sr_dictionaryRepresentation;
- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3;
- (void)setSampleDict:(id)a3;
- (void)setStreamBlock:(id)a3;
@end

@implementation SRStreamBlockSample

- (SRStreamBlockSample)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SRStreamBlockSample;
  v7 = [(SRStreamBlockSample *)&v10 init];
  if (v7)
  {
    v8 = [[_TtC16SensorKitSupport13SRStreamBlock alloc] initWithBinaryRep:v6];
    [(SRStreamBlockSample *)v7 setStreamBlock:v8];
  }
  return v7;
}

- (id)sr_dictionaryRepresentation
{
  uint64_t v3 = [(SRStreamBlockSample *)self streamBlock];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(SRStreamBlockSample *)self sampleDict];

    if (!v5)
    {
      id v6 = [(SRStreamBlockSample *)self streamBlock];
      v7 = [v6 dictionary];
      [(SRStreamBlockSample *)self setSampleDict:v7];

      [(SRStreamBlockSample *)self setStreamBlock:0];
    }
  }
  return [(SRStreamBlockSample *)self sampleDict];
}

- (BOOL)sr_prefersUTF8StringRepresentation
{
  return 1;
}

- (int64_t)sr_writeUTF8RepresentationToOutputStream:(id)a3
{
  id v4 = a3;
  v5 = [(SRStreamBlockSample *)self sr_dictionaryRepresentation];
  uint64_t v9 = 0;
  uint64_t v6 = [MEMORY[0x263F08900] writeJSONObject:v5 toStream:v4 options:0 error:&v9];

  if (v9) {
    int64_t v7 = -1;
  }
  else {
    int64_t v7 = v6;
  }

  return v7;
}

- (_TtC16SensorKitSupport13SRStreamBlock)streamBlock
{
  return self->_streamBlock;
}

- (void)setStreamBlock:(id)a3
{
}

- (NSDictionary)sampleDict
{
  return self->_sampleDict;
}

- (void)setSampleDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sampleDict, 0);
  objc_storeStrong((id *)&self->_streamBlock, 0);
}

@end
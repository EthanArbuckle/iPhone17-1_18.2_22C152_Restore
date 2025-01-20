@interface TRIFBCloudKitTreatmentRecordAssetBuilder
- (void)dealloc;
- (void)setAssetIndex:(unsigned int)a3;
- (void)setContainer:(unsigned __int8)a3;
- (void)setHasCkIndex:(BOOL)a3;
- (void)setTreatmentId:(id)a3;
@end

@implementation TRIFBCloudKitTreatmentRecordAssetBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBCloudKitTreatmentRecordAssetBuilder;
  [(TRIFBCloudKitTreatmentRecordAssetBuilder *)&v4 dealloc];
}

- (void)setContainer:(unsigned __int8)a3
{
  int v3 = a3;
  v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 4, v3);
  }
}

- (void)setTreatmentId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 623, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, [v7 unsignedIntValue]);
  }
}

- (void)setAssetIndex:(unsigned int)a3
{
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)self->_bldr->var0, 8, a3);
  }
}

- (void)setHasCkIndex:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 10, v3);
  }
}

- (void).cxx_destruct
{
}

@end
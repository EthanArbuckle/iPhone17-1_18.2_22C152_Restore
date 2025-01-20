@interface TRIFBMobileAssetReferenceBuilder
- (void)dealloc;
- (void)setAssetName:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setFileType:(unsigned __int8)a3;
- (void)setIsOnDemand:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setType:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation TRIFBMobileAssetReferenceBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBMobileAssetReferenceBuilder;
  [(TRIFBMobileAssetReferenceBuilder *)&v4 dealloc];
}

- (void)setType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2272, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, [v7 unsignedIntValue]);
  }
}

- (void)setSpecifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2282, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, [v7 unsignedIntValue]);
  }
}

- (void)setVersion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2292, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, [v7 unsignedIntValue]);
  }
}

- (void)setFileType:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 10, v3);
  }
}

- (void)setIsOnDemand:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 12, v3);
  }
}

- (void)setDownloadSize:(unint64_t)a3
{
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((uint64_t)self->_bldr->var0, 14, a3);
  }
}

- (void)setAssetName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2325, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 16, [v7 unsignedIntValue]);
  }
}

- (void).cxx_destruct
{
}

@end
@interface TRIFBFactorMetadataKeyValueBuilder
- (void)dealloc;
- (void)setKey:(id)a3;
- (void)setVal:(id)a3;
@end

@implementation TRIFBFactorMetadataKeyValueBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBFactorMetadataKeyValueBuilder;
  [(TRIFBFactorMetadataKeyValueBuilder *)&v4 dealloc];
}

- (void)setKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2826, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, [v7 unsignedIntValue]);
  }
}

- (void)setVal:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2836, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 6, [v7 unsignedIntValue]);
  }
}

- (void).cxx_destruct
{
}

@end
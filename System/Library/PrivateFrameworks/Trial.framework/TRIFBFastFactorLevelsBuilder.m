@interface TRIFBFastFactorLevelsBuilder
- (void)dealloc;
- (void)setLevels:(id)a3;
- (void)setNamespaceName:(id)a3;
- (void)setNcvs:(id)a3;
- (void)setSourceWithFactorPackId:(id)a3;
- (void)setSourceWithTreatmentId:(id)a3;
@end

@implementation TRIFBFastFactorLevelsBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBFastFactorLevelsBuilder;
  [(TRIFBFastFactorLevelsBuilder *)&v4 dealloc];
}

- (void)setLevels:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4622, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8)
    {
      var0 = self->_bldr->var0;
      int v10 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)var0, v8);
      apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)var0, 4, v10);
    }
  }
}

- (void)setSourceWithTreatmentId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4631, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 1);
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, [v7 unsignedIntValue]);
  }
}

- (void)setSourceWithFactorPackId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4641, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, 2);
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, [v7 unsignedIntValue]);
  }
}

- (void)setNamespaceName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    unsigned int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4652, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 10, [v7 unsignedIntValue]);
  }
}

- (void)setNcvs:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4662, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    unsigned int v8 = [v7 unsignedIntValue];
    if (v8)
    {
      var0 = self->_bldr->var0;
      int v10 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo((apple::aiml::flatbuffers2::FlatBufferBuilder *)var0, v8);
      apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)var0, 12, v10);
    }
  }
}

- (void).cxx_destruct
{
}

@end
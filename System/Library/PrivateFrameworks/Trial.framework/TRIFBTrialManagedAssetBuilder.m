@interface TRIFBTrialManagedAssetBuilder
- (void)dealloc;
- (void)setAssetId:(id)a3;
- (void)setAssetName:(id)a3;
- (void)setCloudKitMetadataWithAsset:(id)a3;
- (void)setCloudKitMetadataWithTreatment:(id)a3;
- (void)setDownloadSize:(unint64_t)a3;
- (void)setFileType:(unsigned __int8)a3;
- (void)setHasOnDemandFlag:(BOOL)a3;
- (void)setIsOnDemand:(BOOL)a3;
- (void)setPath:(id)a3;
@end

@implementation TRIFBTrialManagedAssetBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBTrialManagedAssetBuilder;
  [(TRIFBTrialManagedAssetBuilder *)&v4 dealloc];
}

- (void)setPath:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1513, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 4, [v7 unsignedIntValue]);
  }
}

- (void)setFileType:(unsigned __int8)a3
{
  int v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 6, v3);
  }
}

- (void)setAssetId:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1532, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 8, [v7 unsignedIntValue]);
  }
}

- (void)setCloudKitMetadataWithTreatment:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1542, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 10, 1);
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 12, [v7 unsignedIntValue]);
  }
}

- (void)setCloudKitMetadataWithAsset:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1553, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 10, 2);
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 12, [v7 unsignedIntValue]);
  }
}

- (void)setIsOnDemand:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 14, v3);
  }
}

- (void)setDownloadSize:(unint64_t)a3
{
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>((uint64_t)self->_bldr->var0, 16, a3);
  }
}

- (void)setAssetName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1578, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];
  }
  v6 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v6)
  {
    id v7 = v5;
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)self->_bldr->var0, 18, [v7 unsignedIntValue]);
  }
}

- (void)setHasOnDemandFlag:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AFBBufferBuilder *)self->_owner firstError];

  if (!v5) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>((apple::aiml::flatbuffers2::vector_downward *)self->_bldr->var0, 20, v3);
  }
}

- (void).cxx_destruct
{
}

@end
@interface VGSharedMeshDump
+ (BOOL)supportsSecureCoding;
- (VGSharedMeshDump)initWithCoder:(id)a3;
- (VGVertexAttributeBufferDump)meshPositions;
- (VGVertexAttributeBufferDump)meshTriangleIndices;
- (VGVertexAttributeBufferDump)meshUVs;
- (void)encodeWithCoder:(id)a3;
- (void)setMeshPositions:(id)a3;
- (void)setMeshTriangleIndices:(id)a3;
- (void)setMeshUVs:(id)a3;
@end

@implementation VGSharedMeshDump

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  meshPositions = self->_meshPositions;
  v5 = NSStringFromSelector(sel_meshPositions);
  [v10 encodeObject:meshPositions forKey:v5];

  meshUVs = self->_meshUVs;
  v7 = NSStringFromSelector(sel_meshUVs);
  [v10 encodeObject:meshUVs forKey:v7];

  meshTriangleIndices = self->_meshTriangleIndices;
  v9 = NSStringFromSelector(sel_meshTriangleIndices);
  [v10 encodeObject:meshTriangleIndices forKey:v9];
}

- (VGSharedMeshDump)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VGSharedMeshDump;
  v5 = [(VGSharedMeshDump *)&v20 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_meshPositions);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    meshPositions = v5->_meshPositions;
    v5->_meshPositions = (VGVertexAttributeBufferDump *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_meshUVs);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    meshUVs = v5->_meshUVs;
    v5->_meshUVs = (VGVertexAttributeBufferDump *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_meshTriangleIndices);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    meshTriangleIndices = v5->_meshTriangleIndices;
    v5->_meshTriangleIndices = (VGVertexAttributeBufferDump *)v16;

    v18 = v5;
  }

  return v5;
}

- (VGVertexAttributeBufferDump)meshPositions
{
  return self->_meshPositions;
}

- (void)setMeshPositions:(id)a3
{
}

- (VGVertexAttributeBufferDump)meshUVs
{
  return self->_meshUVs;
}

- (void)setMeshUVs:(id)a3
{
}

- (VGVertexAttributeBufferDump)meshTriangleIndices
{
  return self->_meshTriangleIndices;
}

- (void)setMeshTriangleIndices:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshTriangleIndices, 0);
  objc_storeStrong((id *)&self->_meshUVs, 0);

  objc_storeStrong((id *)&self->_meshPositions, 0);
}

@end
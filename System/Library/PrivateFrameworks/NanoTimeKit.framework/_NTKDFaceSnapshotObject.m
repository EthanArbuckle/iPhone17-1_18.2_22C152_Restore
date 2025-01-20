@interface _NTKDFaceSnapshotObject
- (BOOL)isEqual:(id)a3;
- (BOOL)snapshotStale;
- (NSDictionary)options;
- (NSString)key;
- (NTKFace)face;
- (NTKFaceSnapshotContext)context;
- (unint64_t)hash;
- (void)setContext:(id)a3;
- (void)setFace:(id)a3;
- (void)setKey:(id)a3;
- (void)setOptions:(id)a3;
- (void)setSnapshotStale:(BOOL)a3;
@end

@implementation _NTKDFaceSnapshotObject

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(_NTKDFaceSnapshotObject *)self face];
    v6 = [v4 face];
    if ([v5 isEquivalentToFace:v6])
    {
      v7 = [(_NTKDFaceSnapshotObject *)self key];
      v8 = [v4 key];
      if ([v7 isEqualToString:v8])
      {
        v9 = [(_NTKDFaceSnapshotObject *)self options];
        v10 = [v4 options];
        if ([v9 isEqualToDictionary:v10])
        {
          uint64_t v11 = [(_NTKDFaceSnapshotObject *)self face];
          uint64_t v12 = [(_NTKDFaceSnapshotObject *)self context];
          uint64_t v13 = [v4 context];
          v20 = (void *)v11;
          v14 = (void *)v11;
          v15 = (void *)v12;
          v16 = (void *)v13;
          if ([v14 snapshotContext:v15 isStaleRelativeToContext:v13])
          {
            LOBYTE(v17) = 0;
          }
          else
          {
            unsigned int v18 = [(_NTKDFaceSnapshotObject *)self snapshotStale];
            unsigned int v17 = v18 ^ [v4 snapshotStale] ^ 1;
          }
        }
        else
        {
          LOBYTE(v17) = 0;
        }
      }
      else
      {
        LOBYTE(v17) = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  v2 = [(_NTKDFaceSnapshotObject *)self key];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NTKFaceSnapshotContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)snapshotStale
{
  return self->_snapshotStale;
}

- (void)setSnapshotStale:(BOOL)a3
{
  self->_snapshotStale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
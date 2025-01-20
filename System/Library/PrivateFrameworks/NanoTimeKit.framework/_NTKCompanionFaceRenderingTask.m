@interface _NTKCompanionFaceRenderingTask
- (BOOL)isMemberOfBatch;
- (NTKFace)face;
- (_NTKCompanionFaceRenderingTask)initWithFace:(id)a3 detailMode:(int64_t)a4 completionHandler:(id)a5;
- (id)completionHandler;
- (int64_t)detailMode;
@end

@implementation _NTKCompanionFaceRenderingTask

- (_NTKCompanionFaceRenderingTask)initWithFace:(id)a3 detailMode:(int64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_NTKCompanionFaceRenderingTask;
  v11 = [(_NTKCompanionFaceRenderingTask *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_face, a3);
    v12->_detailMode = a4;
    uint64_t v13 = [v10 copy];
    id completionHandler = v12->_completionHandler;
    v12->_id completionHandler = (id)v13;
  }
  return v12;
}

- (BOOL)isMemberOfBatch
{
  return +[NTKFaceView numberOfDetailModesForFaceStyle:[(NTKFace *)self->_face faceStyle]] > 0;
}

- (NTKFace)face
{
  return self->_face;
}

- (int64_t)detailMode
{
  return self->_detailMode;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end
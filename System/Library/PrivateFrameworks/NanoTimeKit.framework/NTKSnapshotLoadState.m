@interface NTKSnapshotLoadState
+ (id)failureWithError:(id)a3;
+ (id)loading;
+ (id)pending;
+ (id)successWithImage:(id)a3;
- (NSError)error;
- (NTKSnapshotLoadState)initWithStatus:(unint64_t)a3 image:(id)a4 error:(id)a5;
- (UIImage)image;
- (unint64_t)status;
@end

@implementation NTKSnapshotLoadState

- (NTKSnapshotLoadState)initWithStatus:(unint64_t)a3 image:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKSnapshotLoadState;
  v11 = [(NTKSnapshotLoadState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_status = a3;
    objc_storeStrong((id *)&v11->_image, a4);
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

+ (id)pending
{
  v2 = [[NTKSnapshotLoadState alloc] initWithStatus:0 image:0 error:0];
  return v2;
}

+ (id)loading
{
  v2 = [[NTKSnapshotLoadState alloc] initWithStatus:1 image:0 error:0];
  return v2;
}

+ (id)successWithImage:(id)a3
{
  id v3 = a3;
  v4 = [[NTKSnapshotLoadState alloc] initWithStatus:2 image:v3 error:0];

  return v4;
}

+ (id)failureWithError:(id)a3
{
  id v3 = a3;
  v4 = [[NTKSnapshotLoadState alloc] initWithStatus:3 image:0 error:v3];

  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (UIImage)image
{
  return self->_image;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
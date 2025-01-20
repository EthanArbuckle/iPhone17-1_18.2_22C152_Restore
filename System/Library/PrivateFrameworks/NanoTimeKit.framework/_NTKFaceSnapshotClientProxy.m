@interface _NTKFaceSnapshotClientProxy
- (_NTKFaceSnapshotClientProxy)initWithWeakProxy:(id)a3;
- (void)faceSnapshotChangedForKey:(id)a3;
@end

@implementation _NTKFaceSnapshotClientProxy

- (_NTKFaceSnapshotClientProxy)initWithWeakProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKFaceSnapshotClientProxy;
  v5 = [(_NTKFaceSnapshotClientProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxy, v4);
  }

  return v6;
}

- (void)faceSnapshotChangedForKey:(id)a3
{
  p_proxy = &self->_proxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained faceSnapshotChangedForKey:v4];
}

- (void).cxx_destruct
{
}

@end
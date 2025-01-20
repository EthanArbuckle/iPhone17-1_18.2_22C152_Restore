@interface NTKFaceBundleSortableGalleryFace
- (NTKFace)face;
- (NTKFaceBundleSortableGalleryFace)initWithFace:(id)a3 priority:(unint64_t)a4;
- (int64_t)compare:(id)a3;
- (unint64_t)priority;
@end

@implementation NTKFaceBundleSortableGalleryFace

- (NTKFaceBundleSortableGalleryFace)initWithFace:(id)a3 priority:(unint64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKFaceBundleSortableGalleryFace;
    v8 = [(NTKFaceBundleSortableGalleryFace *)&v12 init];
    v9 = v8;
    if (v8)
    {
      v8->_priority = a4;
      objc_storeStrong((id *)&v8->_face, a3);
    }
    self = v9;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(NTKFaceBundleSortableGalleryFace *)self priority];
    if ([v4 priority] == v5)
    {
      v6 = [(NTKFaceBundleSortableGalleryFace *)self face];
      id v7 = [v4 face];
      uint64_t v8 = [v6 name];
      v9 = (void *)v8;
      if (v8) {
        v10 = (__CFString *)v8;
      }
      else {
        v10 = &stru_1F1635E90;
      }
      v11 = v10;

      uint64_t v12 = [v7 name];
      v13 = (void *)v12;
      if (v12) {
        v14 = (__CFString *)v12;
      }
      else {
        v14 = &stru_1F1635E90;
      }
      v15 = v14;

      int64_t v16 = [(__CFString *)v11 localizedCaseInsensitiveCompare:v15];
    }
    else
    {
      unint64_t v17 = [v4 priority];
      if (v17 < [(NTKFaceBundleSortableGalleryFace *)self priority]) {
        int64_t v16 = -1;
      }
      else {
        int64_t v16 = 1;
      }
    }
  }
  else
  {
    int64_t v16 = -1;
  }

  return v16;
}

- (NTKFace)face
{
  return self->_face;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void).cxx_destruct
{
}

@end
@interface NTKCachedPhoto
- (BOOL)load;
- (NTKCachedPhoto)initWithPhoto:(id)a3;
- (NTKCachedPhoto)initWithPhoto:(id)a3 index:(int64_t)a4;
- (NTKPhoto)photo;
- (UIImage)image;
- (int64_t)index;
@end

@implementation NTKCachedPhoto

- (NTKCachedPhoto)initWithPhoto:(id)a3
{
  return [(NTKCachedPhoto *)self initWithPhoto:a3 index:0x7FFFFFFFFFFFFFFFLL];
}

- (NTKCachedPhoto)initWithPhoto:(id)a3 index:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKCachedPhoto;
  v8 = [(NTKCachedPhoto *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_photo, a3);
    v9->_index = a4;
  }

  return v9;
}

- (BOOL)load
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(NTKPhoto *)self->_photo imageURL];
  NTKPhotosSubsampledImageForURLAndSize(v3, 512.0, 600.0);
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;
  self->_image = v4;

  int64_t index = self->_index;
  id v7 = _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (index == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v8)
    {
      v9 = objc_opt_class();
      photo = self->_photo;
      id v11 = v9;
      v12 = [(NTKPhoto *)photo imageURL];
      v13 = [v12 path];
      v14 = self->_image;
      int v23 = 138412802;
      v24 = v9;
      __int16 v25 = 2112;
      *(void *)v26 = v13;
      *(_WORD *)&v26[8] = 2112;
      *(void *)&v26[10] = v14;
      v15 = "%@: loading image %@ ==> %@";
      v16 = v7;
      uint32_t v17 = 32;
LABEL_6:
      _os_log_impl(&dword_1BC5A9000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
    }
  }
  else if (v8)
  {
    v18 = objc_opt_class();
    v19 = self->_photo;
    int64_t v20 = self->_index;
    id v11 = v18;
    v12 = [(NTKPhoto *)v19 imageURL];
    v13 = [v12 path];
    v21 = self->_image;
    int v23 = 138413058;
    v24 = v18;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v20;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v13;
    *(_WORD *)&v26[14] = 2112;
    *(void *)&v26[16] = v21;
    v15 = "%@: loading index %d image %@ ==> %@";
    v16 = v7;
    uint32_t v17 = 38;
    goto LABEL_6;
  }

  return self->_image != 0;
}

- (UIImage)image
{
  return self->_image;
}

- (NTKPhoto)photo
{
  return self->_photo;
}

- (int64_t)index
{
  return self->_index;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
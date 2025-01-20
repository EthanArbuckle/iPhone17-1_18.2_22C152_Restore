@interface MKPhotoLibraryAsset
- (MKPhotoLibraryAsset)initWithIdentifier:(id)a3;
- (MKPhotoLibraryAsset)initWithPath:(id)a3 filename:(id)a4 collection:(id)a5 originalFilename:(id)a6 size:(unint64_t)a7;
- (NSString)collection;
- (NSString)filename;
- (NSString)identifier;
- (NSString)originalFilename;
- (NSString)path;
- (int64_t)rowID;
- (unint64_t)size;
- (void)setCollection:(id)a3;
- (void)setFilename:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOriginalFilename:(id)a3;
- (void)setPath:(id)a3;
- (void)setRowID:(int64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation MKPhotoLibraryAsset

- (MKPhotoLibraryAsset)initWithPath:(id)a3 filename:(id)a4 collection:(id)a5 originalFilename:(id)a6 size:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MKPhotoLibraryAsset;
  v16 = [(MKPhotoLibraryAsset *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(MKPhotoLibraryAsset *)v16 setSize:a7];
    [(MKPhotoLibraryAsset *)v17 setPath:v12];
    [(MKPhotoLibraryAsset *)v17 setFilename:v13];
    [(MKPhotoLibraryAsset *)v17 setCollection:v14];
    [(MKPhotoLibraryAsset *)v17 setOriginalFilename:v15];
  }

  return v17;
}

- (MKPhotoLibraryAsset)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPhotoLibraryAsset;
  v5 = [(MKPhotoLibraryAsset *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MKPhotoLibraryAsset *)v5 setIdentifier:v4];
  }

  return v6;
}

- (int64_t)rowID
{
  return self->_rowID;
}

- (void)setRowID:(int64_t)a3
{
  self->_rowID = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)originalFilename
{
  return self->_originalFilename;
}

- (void)setOriginalFilename:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalFilename, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
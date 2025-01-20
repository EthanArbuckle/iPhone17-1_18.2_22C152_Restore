@interface ICMusicLibraryContentMetadataDescriptor
- (BOOL)isEqual:(id)a3;
- (ICMusicLibraryContentMetadataDescriptor)initWithTitle:(id)a3 andStoreAdamID:(int64_t)a4;
- (NSString)title;
- (id)debugDescription;
- (int64_t)storeAdamID;
- (void)setStoreAdamID:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICMusicLibraryContentMetadataDescriptor

- (void).cxx_destruct
{
}

- (void)setStoreAdamID:(int64_t)a3
{
  self->_storeAdamID = a3;
}

- (int64_t)storeAdamID
{
  return self->_storeAdamID;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (id)debugDescription
{
  v3 = [(ICMusicLibraryContentMetadataDescriptor *)self title];
  v4 = +[NSString stringWithFormat:@"Title: %@, storeAdamID: %lld", v3, [(ICMusicLibraryContentMetadataDescriptor *)self storeAdamID]];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(ICMusicLibraryContentMetadataDescriptor *)self storeAdamID];
    if (v6 == [v5 storeAdamID])
    {
      v7 = [(ICMusicLibraryContentMetadataDescriptor *)self title];
      v8 = [v5 title];
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (ICMusicLibraryContentMetadataDescriptor)initWithTitle:(id)a3 andStoreAdamID:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICMusicLibraryContentMetadataDescriptor;
  v7 = [(ICMusicLibraryContentMetadataDescriptor *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ICMusicLibraryContentMetadataDescriptor *)v7 setTitle:v6];
    [(ICMusicLibraryContentMetadataDescriptor *)v8 setStoreAdamID:a4];
  }

  return v8;
}

@end
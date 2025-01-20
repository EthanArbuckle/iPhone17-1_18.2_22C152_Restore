@interface _PXStoryExplicitChapter
- (NSCopying)identifier;
- (NSSet)assetUUIDs;
- (NSString)diagnosticDescription;
- (NSString)firstAssetUUID;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (_PXStoryExplicitChapter)initWithFirstAssetUUID:(id)a3 assetUUIDs:(id)a4;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation _PXStoryExplicitChapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_firstAssetUUID, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSSet)assetUUIDs
{
  return self->_assetUUIDs;
}

- (NSString)firstAssetUUID
{
  return self->_firstAssetUUID;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  v4 = [(_PXStoryExplicitChapter *)self identifier];
  v5 = [(_PXStoryExplicitChapter *)self localizedTitle];
  v6 = [(_PXStoryExplicitChapter *)self localizedSubtitle];
  v7 = [(_PXStoryExplicitChapter *)self assetUUIDs];
  v8 = (void *)[v3 initWithFormat:@"{ id=%@ title=“%@” subtitle=“%@” assetUUIDs=%@ }", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (_PXStoryExplicitChapter)initWithFirstAssetUUID:(id)a3 assetUUIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXStoryExplicitChapter;
  v9 = [(_PXStoryExplicitChapter *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    uint64_t v11 = [v7 copy];
    firstAssetUUID = v10->_firstAssetUUID;
    v10->_firstAssetUUID = (NSString *)v11;

    uint64_t v13 = [v8 copy];
    assetUUIDs = v10->_assetUUIDs;
    v10->_assetUUIDs = (NSSet *)v13;
  }
  return v10;
}

@end
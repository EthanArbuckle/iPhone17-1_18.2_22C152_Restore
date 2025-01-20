@interface PXSharedAlbumNavigationAttributes
+ (id)attributesForURLComponents:(id)a3;
- (NSString)commentGUID;
- (NSString)invitationAlbumUUID;
- (NSString)revealAssetUUID;
@end

@implementation PXSharedAlbumNavigationAttributes

+ (id)attributesForURLComponents:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v20 = a3;
  v3 = [v20 queryItems];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = 0;
    v21 = 0;
    v7 = 0;
    uint64_t v8 = *(void *)v23;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = [v10 name];
        if ([v11 isEqualToString:@"invitationalbumuuid"])
        {
          uint64_t v12 = [v10 value];
          v13 = v7;
          v7 = (void *)v12;
        }
        else if ([v11 isEqualToString:@"revealassetuuid"])
        {
          uint64_t v14 = [v10 value];
          v13 = v6;
          v6 = (void *)v14;
        }
        else
        {
          if (![v11 isEqualToString:@"commentguid"]) {
            goto LABEL_13;
          }
          uint64_t v15 = [v10 value];
          v13 = v21;
          v21 = (void *)v15;
        }

LABEL_13:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (!v5) {
        goto LABEL_17;
      }
    }
  }
  v6 = 0;
  v21 = 0;
  v7 = 0;
LABEL_17:

  if (v7 || v6 || v21)
  {
    v16 = (id *)objc_alloc_init((Class)a1);
    objc_storeStrong(v16 + 1, v7);
    objc_storeStrong(v16 + 2, v6);
    objc_storeStrong(v16 + 3, v21);
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentGUID, 0);
  objc_storeStrong((id *)&self->_revealAssetUUID, 0);
  objc_storeStrong((id *)&self->_invitationAlbumUUID, 0);
}

- (NSString)commentGUID
{
  return self->_commentGUID;
}

- (NSString)revealAssetUUID
{
  return self->_revealAssetUUID;
}

- (NSString)invitationAlbumUUID
{
  return self->_invitationAlbumUUID;
}

@end
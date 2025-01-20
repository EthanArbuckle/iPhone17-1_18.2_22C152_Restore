@interface ICSharedListeningItem
+ (ICSharedListeningItem)itemWithMediaIdentifier:(id)a3;
- (BOOL)isAutoPlayItem;
- (ICLiveLinkIdentity)contributorIdentity;
- (ICSharedListeningItem)initWithProtobuf:(id)a3 identity:(id)a4;
- (NSDictionary)playParams;
- (NSString)identifier;
- (NSString)mediaIdentifier;
- (NSString)shortDescription;
- (id)_playParamsForPlaybackItemProto:(id)a3;
- (id)description;
- (void)setIdentifier:(id)a3;
@end

@implementation ICSharedListeningItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParams, 0);
  objc_storeStrong((id *)&self->_contributorIdentity, 0);
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)playParams
{
  return self->_playParams;
}

- (ICLiveLinkIdentity)contributorIdentity
{
  return self->_contributorIdentity;
}

- (BOOL)isAutoPlayItem
{
  return self->_isAutoPlayItem;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (id)_playParamsForPlaybackItemProto:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v4 = (id *)a3;
  v5 = v4;
  if (v4 && (v6 = v4[5]) != 0 && (uint64_t v7 = v6[2], v6, v7))
  {
    id v8 = v5[5];
    v9 = v8;
    if (v8) {
      v10 = (void *)*((void *)v8 + 2);
    }
    else {
      v10 = 0;
    }
    id v11 = v10;
    v12 = [v11 dataUsingEncoding:4];

    id v22 = 0;
    v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v12 options:0 error:&v22];
    id v14 = v22;
    if (v14 || !v13)
    {
      v16 = os_log_create("com.apple.amp.iTunesCloud", "LiveLink");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = v5[5];
        v18 = v17;
        if (v17) {
          v19 = (void *)*((void *)v17 + 2);
        }
        else {
          v19 = 0;
        }
        id v20 = v19;
        *(_DWORD *)buf = 134218498;
        v24 = self;
        __int16 v25 = 2114;
        id v26 = v20;
        __int16 v27 = 2114;
        id v28 = v14;
        _os_log_impl(&dword_1A2D01000, v16, OS_LOG_TYPE_ERROR, "ILL %p: _playParamsForPlaybackItemProto: Error deserializing playParams: %{public}@ error: %{public}@", buf, 0x20u);
      }
      id v15 = (id)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v15 = v13;
    }
  }
  else
  {
    id v15 = (id)MEMORY[0x1E4F1CC08];
  }

  return v15;
}

- (NSString)shortDescription
{
  return (NSString *)[NSString stringWithFormat:@"<ITEM id=%@ mediaID=%-20s>", self->_identifier, -[NSString UTF8String](self->_mediaIdentifier, "UTF8String")];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p id=%@ mediaID=%@>", objc_opt_class(), self, self->_identifier, self->_mediaIdentifier];
}

- (ICSharedListeningItem)initWithProtobuf:(id)a3 identity:(id)a4
{
  v6 = (id *)a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ICSharedListeningItem;
  id v8 = [(ICSharedListeningItem *)&v24 init];
  if (v8)
  {
    if (v6)
    {
      id v9 = v6[3];
      uint64_t v10 = [v9 copy];
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v10;

      id v12 = v6[4];
    }
    else
    {
      uint64_t v22 = [0 copy];
      v23 = v8->_identifier;
      v8->_identifier = (NSString *)v22;

      id v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [v13 copy];
    mediaIdentifier = v8->_mediaIdentifier;
    v8->_mediaIdentifier = (NSString *)v14;

    BOOL v16 = v6 && ((_BYTE)v6[7] & 2) != 0 && *((_DWORD *)v6 + 12) == 2;
    v8->_isAutoPlayItem = v16;
    uint64_t v17 = [v7 copy];
    contributorIdentity = v8->_contributorIdentity;
    v8->_contributorIdentity = (ICLiveLinkIdentity *)v17;

    uint64_t v19 = [(ICSharedListeningItem *)v8 _playParamsForPlaybackItemProto:v6];
    playParams = v8->_playParams;
    v8->_playParams = (NSDictionary *)v19;
  }
  return v8;
}

+ (ICSharedListeningItem)itemWithMediaIdentifier:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = MSVNanoIDCreateTaggedPointer();
  v6 = (void *)v4[2];
  v4[2] = v5;

  uint64_t v7 = [v3 copy];
  id v8 = (void *)v4[3];
  v4[3] = v7;

  return (ICSharedListeningItem *)v4;
}

@end
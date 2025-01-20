@interface _PXGMediaRequestToken
- (PXMediaProvider)mediaProvider;
- (_PXGMediaRequestToken)initWithMediaProvider:(id)a3 mediaRequestID:(int64_t)a4;
- (int64_t)mediaRequestID;
@end

@implementation _PXGMediaRequestToken

- (_PXGMediaRequestToken)initWithMediaProvider:(id)a3 mediaRequestID:(int64_t)a4
{
  id v8 = a3;
  if (v8)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXGDisplayAssetTextureProvider.m", 170, @"Invalid parameter not satisfying: %@", @"mediaProvider" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PXGDisplayAssetTextureProvider.m", 171, @"Invalid parameter not satisfying: %@", @"mediaRequestID != PXInvalidMediaRequestID" object file lineNumber description];

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_PXGMediaRequestToken;
  v9 = [(_PXGMediaRequestToken *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProvider, a3);
    v10->_mediaRequestID = a4;
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (int64_t)mediaRequestID
{
  return self->_mediaRequestID;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

@end
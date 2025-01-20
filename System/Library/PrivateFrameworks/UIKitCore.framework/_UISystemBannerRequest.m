@interface _UISystemBannerRequest
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)primaryTitleText;
- (NSString)secondaryTitleText;
- (_UISystemBannerRequest)init;
- (_UISystemBannerRequest)initWithBSXPCCoder:(id)a3;
- (double)bannerTimeoutDuration;
- (double)preferredMaximumBannerWidth;
- (double)preferredMinimumBannerWidth;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)postBanner;
- (void)setBannerTimeoutDuration:(double)a3;
- (void)setPreferredMaximumBannerWidth:(double)a3;
- (void)setPreferredMinimumBannerWidth:(double)a3;
- (void)setPrimaryTitleText:(id)a3;
- (void)setSecondaryTitleText:(id)a3;
- (void)verifyParameters;
@end

@implementation _UISystemBannerRequest

- (_UISystemBannerRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UISystemBannerRequest;
  v2 = [(_UISystemBannerRequest *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_UISystemBannerRequest *)v2 setBannerTimeoutDuration:2.5];
  }
  return v3;
}

- (void)verifyParameters
{
  uint64_t v4 = [(_UISystemBannerRequest *)self primaryTitleText];

  uint64_t v5 = [(_UISystemBannerRequest *)self secondaryTitleText];
  uint64_t v6 = v4 | v5;

  if (!v6)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISystemBannerRequest.m" lineNumber:34 description:@"System banner request must contain some text"];
  }
}

- (void)postBanner
{
  [(_UISystemBannerRequest *)self verifyParameters];
  v3 = (_UIOverlayService *)objc_opt_new();
  overlayService = self->_overlayService;
  self->_overlayService = v3;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36___UISystemBannerRequest_postBanner__block_invoke;
  v6[3] = &unk_1E52D9F70;
  v6[4] = self;
  uint64_t v5 = +[_UIOBannerRequestAction actionForSystemBannerRequest:completionHandler:]((uint64_t)_UIOBannerRequestAction, self, v6);
  [(_UIOverlayService *)self->_overlayService sendOverlayAction:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(_UISystemBannerRequest *)self primaryTitleText];
    id v7 = [v5 primaryTitleText];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      int v11 = [v8 isEqual:v9];

      if (!v11) {
        goto LABEL_16;
      }
    }
    v14 = [(_UISystemBannerRequest *)self secondaryTitleText];
    v15 = [v5 secondaryTitleText];
    id v13 = v14;
    id v16 = v15;
    v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16) {
        LOBYTE(v11) = [v13 isEqual:v16];
      }
    }

    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UISystemBannerRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(_UISystemBannerRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeStringForKey:@"primaryText"];
    [(_UISystemBannerRequest *)v5 setPrimaryTitleText:v6];

    id v7 = [v4 decodeStringForKey:@"secondaryText"];
    [(_UISystemBannerRequest *)v5 setSecondaryTitleText:v7];

    [v4 decodeDoubleForKey:@"bannerTimeoutDuration"];
    [(_UISystemBannerRequest *)v5 setBannerTimeoutDuration:"setBannerTimeoutDuration:"];
    [v4 decodeDoubleForKey:@"preferredMinimumBannerWidth"];
    -[_UISystemBannerRequest setPreferredMinimumBannerWidth:](v5, "setPreferredMinimumBannerWidth:");
    [v4 decodeDoubleForKey:@"preferredMaximumBannerWidth"];
    -[_UISystemBannerRequest setPreferredMaximumBannerWidth:](v5, "setPreferredMaximumBannerWidth:");
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(_UISystemBannerRequest *)self primaryTitleText];
  [v6 encodeObject:v4 forKey:@"primaryText"];

  id v5 = [(_UISystemBannerRequest *)self secondaryTitleText];
  [v6 encodeObject:v5 forKey:@"secondaryText"];

  [(_UISystemBannerRequest *)self bannerTimeoutDuration];
  objc_msgSend(v6, "encodeDouble:forKey:", @"bannerTimeoutDuration");
  [(_UISystemBannerRequest *)self preferredMinimumBannerWidth];
  objc_msgSend(v6, "encodeDouble:forKey:", @"preferredMinimumBannerWidth");
  [(_UISystemBannerRequest *)self preferredMaximumBannerWidth];
  objc_msgSend(v6, "encodeDouble:forKey:", @"preferredMaximumBannerWidth");
}

- (NSString)primaryTitleText
{
  return self->_primaryTitleText;
}

- (void)setPrimaryTitleText:(id)a3
{
}

- (NSString)secondaryTitleText
{
  return self->_secondaryTitleText;
}

- (void)setSecondaryTitleText:(id)a3
{
}

- (double)preferredMinimumBannerWidth
{
  return self->_preferredMinimumBannerWidth;
}

- (void)setPreferredMinimumBannerWidth:(double)a3
{
  self->_preferredMinimumBannerWidth = a3;
}

- (double)preferredMaximumBannerWidth
{
  return self->_preferredMaximumBannerWidth;
}

- (void)setPreferredMaximumBannerWidth:(double)a3
{
  self->_preferredMaximumBannerWidth = a3;
}

- (double)bannerTimeoutDuration
{
  return self->_bannerTimeoutDuration;
}

- (void)setBannerTimeoutDuration:(double)a3
{
  self->_bannerTimeoutDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitleText, 0);
  objc_storeStrong((id *)&self->_primaryTitleText, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
}

@end
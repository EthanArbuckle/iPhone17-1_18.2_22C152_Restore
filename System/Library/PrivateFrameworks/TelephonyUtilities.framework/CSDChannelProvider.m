@interface CSDChannelProvider
- (BOOL)isEqualToChannelProvider:(id)a3;
- (BOOL)isFaceTimeProvider;
- (BOOL)isSystemProvider;
- (BOOL)isTelephonyProvider;
- (BOOL)isTinCanProvider;
- (BOOL)supportsCurrentPlatform;
- (BOOL)supportsRecents;
- (CSDChannelProvider)initWithApplicationRecord:(id)a3;
- (CSDChannelProvider)initWithChannelProvider:(id)a3;
- (CSDChannelProvider)initWithSource:(id)a3 configuration:(id)a4;
- (id)base;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CSDChannelProvider

- (CSDChannelProvider)initWithSource:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 identifier];
  v15.receiver = self;
  v15.super_class = (Class)CSDChannelProvider;
  v9 = [(CSDChannelProvider *)&v15 initWithIdentifier:v8];

  if (v9)
  {
    -[CSDChannelProvider setAudioSessionID:](v9, "setAudioSessionID:", [v7 audioSessionID]);
    v10 = [v6 bundleIdentifier];
    [(CSDChannelProvider *)v9 setBundleIdentifier:v10];

    v11 = [v6 bundleURL];
    [(CSDChannelProvider *)v9 setBundleURL:v11];

    v12 = [v6 localizedName];
    id v13 = [v12 copy];
    [(CSDChannelProvider *)v9 setLocalizedName:v13];
  }
  return v9;
}

- (CSDChannelProvider)initWithChannelProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v11.receiver = self;
  v11.super_class = (Class)CSDChannelProvider;
  id v6 = [(CSDChannelProvider *)&v11 initWithIdentifier:v5];

  if (v6)
  {
    -[CSDChannelProvider setAudioSessionID:](v6, "setAudioSessionID:", [v4 audioSessionID]);
    id v7 = [v4 bundleIdentifier];
    [(CSDChannelProvider *)v6 setBundleIdentifier:v7];

    v8 = [v4 bundleURL];
    [(CSDChannelProvider *)v6 setBundleURL:v8];

    v9 = [v4 localizedName];
    [(CSDChannelProvider *)v6 setLocalizedName:v9];
  }
  return v6;
}

- (CSDChannelProvider)initWithApplicationRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 applicationIdentifier];
  v11.receiver = self;
  v11.super_class = (Class)CSDChannelProvider;
  id v6 = [(CSDChannelProvider *)&v11 initWithIdentifier:v5];

  if (v6)
  {
    id v7 = [v4 bundleIdentifier];
    [(CSDChannelProvider *)v6 setBundleIdentifier:v7];

    v8 = [v4 URL];
    [(CSDChannelProvider *)v6 setBundleURL:v8];

    v9 = [v4 localizedName];
    [(CSDChannelProvider *)v6 setLocalizedName:v9];
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CSDChannelProvider allocWithZone:a3];

  return [(CSDChannelProvider *)v4 initWithChannelProvider:self];
}

- (BOOL)isEqualToChannelProvider:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CSDChannelProvider *)self audioSessionID];
  if (v5 == [v4 audioSessionID])
  {
    id v6 = [(CSDChannelProvider *)self bundleURL];
    id v7 = [v4 bundleURL];
    if ([v6 isEqual:v7])
    {
      v8 = [(CSDChannelProvider *)self bundleIdentifier];
      v9 = [v4 bundleIdentifier];
      if (TUStringsAreEqualOrNil())
      {
        v10 = [(CSDChannelProvider *)self localizedName];
        objc_super v11 = [v4 localizedName];
        char v12 = TUStringsAreEqualOrNil();
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)base
{
  id v3 = objc_alloc((Class)TUCallProvider);
  id v4 = [(CSDChannelProvider *)self identifier];
  id v5 = [v3 initWithIdentifier:v4];

  id v6 = [(CSDChannelProvider *)self bundleURL];
  id v7 = [v6 copy];
  [v5 setBundleURL:v7];

  v8 = [(CSDChannelProvider *)self bundleIdentifier];
  id v9 = [v8 copy];
  [v5 setBundleIdentifier:v9];

  v10 = [(CSDChannelProvider *)self localizedName];
  id v11 = [v10 copy];
  [v5 setLocalizedName:v11];

  objc_msgSend(v5, "setAudioSessionID:", -[CSDChannelProvider audioSessionID](self, "audioSessionID"));

  return v5;
}

- (BOOL)supportsCurrentPlatform
{
  return 1;
}

- (BOOL)isSystemProvider
{
  return 0;
}

- (BOOL)isTelephonyProvider
{
  return 0;
}

- (BOOL)isFaceTimeProvider
{
  return 0;
}

- (BOOL)isTinCanProvider
{
  return 0;
}

- (BOOL)supportsRecents
{
  return 0;
}

@end
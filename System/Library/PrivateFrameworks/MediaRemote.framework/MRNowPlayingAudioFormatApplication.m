@interface MRNowPlayingAudioFormatApplication
- (BOOL)isEqual:(id)a3;
- (MRNowPlayingAudioFormatApplication)initWithBundleID:(id)a3 displayName:(id)a4;
- (NSString)bundleID;
- (NSString)displayName;
- (id)description;
@end

@implementation MRNowPlayingAudioFormatApplication

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p | bundleID: %@ | displayName: %@", objc_opt_class(), self, self->_bundleID, self->_displayName];
}

- (MRNowPlayingAudioFormatApplication)initWithBundleID:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRNowPlayingAudioFormatApplication;
  v9 = [(MRNowPlayingAudioFormatApplication *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a3);
    objc_storeStrong((id *)&v10->_displayName, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MRNowPlayingAudioFormatApplication *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MRNowPlayingAudioFormatApplication *)v5 bundleID];
      int v7 = [v6 isEqualToString:self->_bundleID];

      id v8 = [(MRNowPlayingAudioFormatApplication *)v5 displayName];

      int v9 = v7 & [v8 isEqualToString:self->_displayName];
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
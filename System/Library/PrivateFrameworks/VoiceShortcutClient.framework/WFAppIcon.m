@interface WFAppIcon
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (WFAppIcon)initWithBundleIdentifier:(id)a3;
- (WFAppIcon)initWithCoder:(id)a3;
- (id)associatedLogo;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppIcon

- (void).cxx_destruct
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WFAppIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  v6 = [(WFAppIcon *)self initWithBundleIdentifier:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = [(WFAppIcon *)self bundleIdentifier];
    v6 = [v4 bundleIdentifier];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return [(NSString *)self->_bundleIdentifier hash];
}

- (WFAppIcon)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFIcon.m", 179, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFAppIcon;
  v6 = [(WFIcon *)&v12 _init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)associatedLogo
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v3 = [(WFAppIcon *)self bundleIdentifier];

  if (v3)
  {
    v10[0] = @"com.apple.freeform";
    v10[1] = @"com.apple.Music";
    v11[0] = @"FreeformLogo";
    v11[1] = @"MusicLogo";
    v10[2] = @"com.apple.musicrecognition";
    v10[3] = @"com.apple.podcasts";
    v11[2] = @"ShazamLogo";
    v11[3] = @"PodcastsLogo";
    v10[4] = @"com.apple.mobileslideshow";
    v10[5] = @"com.apple.Translate";
    v11[4] = @"PhotosLogo";
    v11[5] = @"TranslateLogo";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];
    id v5 = [(WFAppIcon *)self bundleIdentifier];
    v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v8 = +[WFImage imageNamed:v6 inBundle:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

@end
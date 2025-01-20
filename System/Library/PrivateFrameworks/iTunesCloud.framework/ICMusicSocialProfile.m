@interface ICMusicSocialProfile
+ (BOOL)supportsSecureCoding;
+ (id)mediaAPIRequestURL;
+ (id)socialProfileInfoFromMediaAPIResponse:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivate;
- (BOOL)isVerified;
- (ICMusicSocialProfile)initWithCoder:(id)a3;
- (ICMusicSocialProfile)initWithMediaAPIResponse:(id)a3;
- (ICStoreArtworkInfo)artworkInfo;
- (NSString)handle;
- (NSString)name;
- (NSString)socialProfileID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICMusicSocialProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkInfo, 0);
  objc_storeStrong((id *)&self->_socialProfileID, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (ICStoreArtworkInfo)artworkInfo
{
  return self->_artworkInfo;
}

- (NSString)socialProfileID
{
  return self->_socialProfileID;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ICMusicSocialProfile allocWithZone:a3] init];
  v5 = [(ICMusicSocialProfile *)self name];
  uint64_t v6 = [v5 copy];
  name = v4->_name;
  v4->_name = (NSString *)v6;

  v8 = [(ICMusicSocialProfile *)self artworkInfo];
  uint64_t v9 = [v8 copy];
  artworkInfo = v4->_artworkInfo;
  v4->_artworkInfo = (ICStoreArtworkInfo *)v9;

  v11 = [(ICMusicSocialProfile *)self handle];
  uint64_t v12 = [v11 copy];
  handle = v4->_handle;
  v4->_handle = (NSString *)v12;

  v14 = [(ICMusicSocialProfile *)self socialProfileID];
  uint64_t v15 = [v14 copy];
  socialProfileID = v4->_socialProfileID;
  v4->_socialProfileID = (NSString *)v15;

  v4->_isPrivate = [(ICMusicSocialProfile *)self isPrivate];
  v4->_isVerified = [(ICMusicSocialProfile *)self isVerified];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(ICMusicSocialProfile *)self isPrivate];
    if (v5 == [v4 isPrivate])
    {
      int v6 = [(ICMusicSocialProfile *)self isVerified];
      if (v6 == [v4 isVerified])
      {
        id v9 = [(ICMusicSocialProfile *)self name];
        id v10 = [v4 name];
        if (v9 == v10)
        {
        }
        else
        {
          int v11 = [v9 isEqual:v10];

          if (!v11)
          {
            char v7 = 0;
LABEL_24:

            goto LABEL_5;
          }
        }
        id v12 = [(ICMusicSocialProfile *)self handle];
        id v13 = [v4 handle];
        if (v12 == v13)
        {
        }
        else
        {
          int v14 = [v12 isEqual:v13];

          if (!v14)
          {
            char v7 = 0;
LABEL_23:

            goto LABEL_24;
          }
        }
        id v15 = [(ICMusicSocialProfile *)self socialProfileID];
        id v16 = [v4 socialProfileID];
        if (v15 == v16)
        {
        }
        else
        {
          int v17 = [v15 isEqual:v16];

          if (!v17)
          {
            char v7 = 0;
LABEL_22:

            goto LABEL_23;
          }
        }
        v18 = [(ICMusicSocialProfile *)self artworkInfo];
        v19 = [v4 artworkInfo];
        if (v18 == v19) {
          char v7 = 1;
        }
        else {
          char v7 = [v18 isEqual:v19];
        }

        goto LABEL_22;
      }
    }
  }
  char v7 = 0;
LABEL_5:

  return v7;
}

- (ICMusicSocialProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICMusicSocialProfile;
  int v5 = [(ICMusicSocialProfile *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"artwork"];
    artworkInfo = v5->_artworkInfo;
    v5->_artworkInfo = (ICStoreArtworkInfo *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"socialProfileID"];
    socialProfileID = v5->_socialProfileID;
    v5->_socialProfileID = (NSString *)v12;

    v5->_isPrivate = [v4 decodeBoolForKey:@"isPrivate"];
    v5->_isVerified = [v4 decodeBoolForKey:@"isVerified"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_artworkInfo forKey:@"artwork"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeObject:self->_socialProfileID forKey:@"socialProfileID"];
  [v5 encodeBool:self->_isPrivate forKey:@"isPrivate"];
  [v5 encodeBool:self->_isVerified forKey:@"isVerified"];
}

- (ICMusicSocialProfile)initWithMediaAPIResponse:(id)a3
{
  id v4 = +[ICMusicSocialProfile socialProfileInfoFromMediaAPIResponse:a3];
  if (v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)ICMusicSocialProfile;
    id v5 = [(ICMusicSocialProfile *)&v24 init];
    if (v5)
    {
      uint64_t v6 = [v4 valueForKeyPath:@"attributes.name"];
      name = v5->_name;
      v5->_name = (NSString *)v6;

      uint64_t v8 = [v4 valueForKeyPath:@"id"];
      socialProfileID = v5->_socialProfileID;
      v5->_socialProfileID = (NSString *)v8;

      uint64_t v10 = [v4 valueForKeyPath:@"attributes.handle"];
      handle = v5->_handle;
      v5->_handle = (NSString *)v10;

      uint64_t v12 = [v4 valueForKeyPath:@"attributes.isPrivate"];
      if ((_NSIsNSString() & 1) != 0 || (int v13 = _NSIsNSNumber()) != 0) {
        LOBYTE(v13) = [v12 BOOLValue];
      }
      v5->_isPrivate = v13;
      int v14 = [v4 valueForKeyPath:@"attributes.isVerified"];
      if ((_NSIsNSString() & 1) != 0 || (int v15 = _NSIsNSNumber()) != 0) {
        LOBYTE(v15) = [v14 BOOLValue];
      }
      v5->_isVerified = v15;
      id v16 = [v4 valueForKeyPath:@"attributes.artwork"];
      if (_NSIsNSDictionary())
      {
        int v17 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v16];
        v18 = v17;
        if (v17)
        {
          v19 = v17;
          p_super = &v5->_artworkInfo->super;
          v5->_artworkInfo = v19;
        }
        else
        {
          p_super = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_1A2D01000, p_super, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile initWithResponse:] invalid artwork response dictionary", v23, 2u);
          }
        }
      }
    }
    self = v5;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)socialProfileInfoFromMediaAPIResponse:(id)a3
{
  if (a3)
  {
    v3 = [a3 objectForKeyedSubscript:@"data"];
    id v4 = [v3 firstObject];

    if (!v4)
    {
      id v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile] invalid response. userData=nil", v20, 2u);
      }
      id v12 = 0;
      goto LABEL_22;
    }
    id v5 = [v4 valueForKeyPath:@"relationships.social-profile.data"];
    uint64_t v6 = [v5 firstObject];
    char v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 valueForKeyPath:@"id"];
      char v9 = _NSIsNSString();

      if (v9)
      {
        uint64_t v10 = [v7 valueForKeyPath:@"attributes.name"];
        char v11 = _NSIsNSString();

        if (v11)
        {
          id v12 = v7;
LABEL_21:

LABEL_22:
          goto LABEL_23;
        }
        int v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = 0;
          int v14 = "[ICMusicSocialProfile] invalid response. name=nil";
          int v15 = (uint8_t *)&v17;
          goto LABEL_19;
        }
LABEL_20:

        id v12 = 0;
        goto LABEL_21;
      }
      int v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v18 = 0;
      int v14 = "[ICMusicSocialProfile] invalid response. socialProfileID=nil";
      int v15 = (uint8_t *)&v18;
    }
    else
    {
      int v13 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      __int16 v19 = 0;
      int v14 = "[ICMusicSocialProfile] invalid response. socialProfileInfo=nil";
      int v15 = (uint8_t *)&v19;
    }
LABEL_19:
    _os_log_impl(&dword_1A2D01000, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    goto LABEL_20;
  }
  id v4 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2D01000, v4, OS_LOG_TYPE_ERROR, "[ICMusicSocialProfile] invalid response. response=nil", buf, 2u);
  }
  id v12 = 0;
LABEL_23:

  return v12;
}

+ (id)mediaAPIRequestURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://amp-api.music.apple.com/v1/me/account?include=social-profile&with=nonOnboarded"];
}

@end
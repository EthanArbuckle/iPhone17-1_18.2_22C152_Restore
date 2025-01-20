@interface ICMusicUserProfile
+ (BOOL)supportsSecureCoding;
+ (id)attributesInfoFromMediaAPIResponse:(id)a3;
+ (id)mediaAPIRequestURL;
- (BOOL)_capabilityForKey:(id)a3 fromAttributes:(id)a4;
- (BOOL)collaborationAllowed;
- (BOOL)displayNameAccepted;
- (BOOL)isContactCheckAllowed;
- (BOOL)isDiscoverableByContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnboarded;
- (BOOL)isPrivate;
- (BOOL)isVerified;
- (ICMusicSocialProfile)socialProfile;
- (ICMusicUserProfile)initWithCoder:(id)a3;
- (ICMusicUserProfile)initWithMediaAPIResponse:(id)a3;
- (ICStoreArtworkInfo)artworkInfo;
- (NSArray)acceptedTerms;
- (NSString)handle;
- (NSString)name;
- (NSString)socialProfileID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setSocialProfile:(id)a3;
@end

@implementation ICMusicUserProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfile, 0);
  objc_storeStrong((id *)&self->_artworkInfo, 0);
  objc_storeStrong((id *)&self->_acceptedTerms, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)displayNameAccepted
{
  return self->_displayNameAccepted;
}

- (BOOL)collaborationAllowed
{
  return self->_collaborationAllowed;
}

- (BOOL)isOnboarded
{
  return self->_isOnboarded;
}

- (BOOL)isVerified
{
  return self->_isVerified;
}

- (BOOL)isContactCheckAllowed
{
  return self->_isContactCheckAllowed;
}

- (BOOL)isDiscoverableByContact
{
  return self->_isDiscoverableByContact;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (ICMusicSocialProfile)socialProfile
{
  return self->_socialProfile;
}

- (ICStoreArtworkInfo)artworkInfo
{
  return self->_artworkInfo;
}

- (NSArray)acceptedTerms
{
  return self->_acceptedTerms;
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
  v4 = [+[ICMusicUserProfile allocWithZone:a3] init];
  v5 = [(ICMusicUserProfile *)self name];
  uint64_t v6 = [v5 copy];
  name = v4->_name;
  v4->_name = (NSString *)v6;

  v8 = [(ICMusicUserProfile *)self artworkInfo];
  uint64_t v9 = [v8 copy];
  artworkInfo = v4->_artworkInfo;
  v4->_artworkInfo = (ICStoreArtworkInfo *)v9;

  v11 = [(ICMusicUserProfile *)self handle];
  uint64_t v12 = [v11 copy];
  handle = v4->_handle;
  v4->_handle = (NSString *)v12;

  v14 = [(ICMusicUserProfile *)self socialProfile];
  uint64_t v15 = [v14 copy];
  socialProfile = v4->_socialProfile;
  v4->_socialProfile = (ICMusicSocialProfile *)v15;

  v4->_isPrivate = [(ICMusicUserProfile *)self isPrivate];
  v4->_isDiscoverableByContact = [(ICMusicUserProfile *)self isDiscoverableByContact];
  v4->_isContactCheckAllowed = [(ICMusicUserProfile *)self isContactCheckAllowed];
  v4->_isVerified = [(ICMusicUserProfile *)self isVerified];
  v4->_isOnboarded = [(ICMusicUserProfile *)self isOnboarded];
  v4->_collaborationAllowed = [(ICMusicUserProfile *)self collaborationAllowed];
  v4->_displayNameAccepted = [(ICMusicUserProfile *)self displayNameAccepted];
  v17 = [(ICMusicUserProfile *)self acceptedTerms];
  uint64_t v18 = [v17 copy];
  acceptedTerms = v4->_acceptedTerms;
  v4->_acceptedTerms = (NSArray *)v18;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = [(ICMusicUserProfile *)self isPrivate];
    if (v5 == [v4 isPrivate])
    {
      int v6 = [(ICMusicUserProfile *)self isDiscoverableByContact];
      if (v6 == [v4 isDiscoverableByContact])
      {
        int v7 = [(ICMusicUserProfile *)self isContactCheckAllowed];
        if (v7 == [v4 isContactCheckAllowed])
        {
          int v8 = [(ICMusicUserProfile *)self isVerified];
          if (v8 == [v4 isVerified])
          {
            int v9 = [(ICMusicUserProfile *)self isOnboarded];
            if (v9 == [v4 isOnboarded])
            {
              int v10 = [(ICMusicUserProfile *)self collaborationAllowed];
              if (v10 == [v4 collaborationAllowed])
              {
                int v11 = [(ICMusicUserProfile *)self displayNameAccepted];
                if (v11 == [v4 displayNameAccepted])
                {
                  id v14 = [(ICMusicUserProfile *)self name];
                  id v15 = [v4 name];
                  if (v14 == v15)
                  {
                  }
                  else
                  {
                    int v16 = [v14 isEqual:v15];

                    if (!v16)
                    {
                      char v12 = 0;
LABEL_39:

                      goto LABEL_10;
                    }
                  }
                  id v17 = [(ICMusicUserProfile *)self handle];
                  id v18 = [v4 handle];
                  if (v17 == v18)
                  {
                  }
                  else
                  {
                    int v19 = [v17 isEqual:v18];

                    if (!v19)
                    {
                      char v12 = 0;
LABEL_38:

                      goto LABEL_39;
                    }
                  }
                  id v20 = [(ICMusicUserProfile *)self socialProfileID];
                  id v21 = [v4 socialProfileID];
                  if (v20 == v21)
                  {
                  }
                  else
                  {
                    int v22 = [v20 isEqual:v21];

                    if (!v22)
                    {
                      char v12 = 0;
LABEL_37:

                      goto LABEL_38;
                    }
                  }
                  id v23 = [(ICMusicUserProfile *)self artworkInfo];
                  id v24 = [v4 artworkInfo];
                  v40 = v24;
                  if (v23 == v24)
                  {
                  }
                  else
                  {
                    v38 = v14;
                    v25 = v20;
                    id v26 = v18;
                    v27 = v17;
                    id v28 = v21;
                    v29 = v24;
                    int v30 = [v23 isEqual:v24];

                    id v21 = v28;
                    id v17 = v27;
                    id v18 = v26;
                    id v20 = v25;
                    id v14 = v38;
                    if (!v30)
                    {
                      char v12 = 0;
LABEL_36:

                      goto LABEL_37;
                    }
                  }
                  v39 = v23;
                  id v31 = [(ICMusicUserProfile *)self socialProfile];
                  id v32 = [v4 socialProfile];
                  v37 = v31;
                  if (v31 == v32)
                  {
                  }
                  else
                  {
                    int v33 = [v31 isEqual:v32];

                    if (!v33)
                    {
                      char v12 = 0;
LABEL_35:

                      id v23 = v39;
                      goto LABEL_36;
                    }
                  }
                  v34 = [(ICMusicUserProfile *)self acceptedTerms];
                  v35 = [v4 acceptedTerms];
                  if (v34 == v35) {
                    char v12 = 1;
                  }
                  else {
                    char v12 = [v34 isEqual:v35];
                  }

                  id v20 = v36;
                  goto LABEL_35;
                }
              }
            }
          }
        }
      }
    }
  }
  char v12 = 0;
LABEL_10:

  return v12;
}

- (ICMusicUserProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ICMusicUserProfile;
  int v5 = [(ICMusicUserProfile *)&v17 init];
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

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"socialProfile"];
    socialProfile = v5->_socialProfile;
    v5->_socialProfile = (ICMusicSocialProfile *)v12;

    v5->_isPrivate = [v4 decodeBoolForKey:@"isPrivate"];
    v5->_isDiscoverableByContact = [v4 decodeBoolForKey:@"isDiscoverableByContact"];
    v5->_isContactCheckAllowed = [v4 decodeBoolForKey:@"isContactCheckAllowed"];
    v5->_isVerified = [v4 decodeBoolForKey:@"isVerified"];
    v5->_isOnboarded = [v4 decodeBoolForKey:@"isOnboarded"];
    v5->_collaborationAllowed = [v4 decodeBoolForKey:@"collaborationAllowed"];
    v5->_displayNameAccepted = [v4 decodeBoolForKey:@"displayName"];
    uint64_t v14 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"acceptedTerms"];
    acceptedTerms = v5->_acceptedTerms;
    v5->_acceptedTerms = (NSArray *)v14;
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
  [v5 encodeObject:self->_socialProfile forKey:@"socialProfile"];
  [v5 encodeBool:self->_isPrivate forKey:@"isPrivate"];
  [v5 encodeBool:self->_isDiscoverableByContact forKey:@"isDiscoverableByContact"];
  [v5 encodeBool:self->_isContactCheckAllowed forKey:@"isContactCheckAllowed"];
  [v5 encodeBool:self->_isVerified forKey:@"isVerified"];
  [v5 encodeBool:self->_isOnboarded forKey:@"isOnboarded"];
  [v5 encodeBool:self->_collaborationAllowed forKey:@"collaborationAllowed"];
  [v5 encodeBool:self->_displayNameAccepted forKey:@"displayName"];
  [v5 encodeObject:self->_acceptedTerms forKey:@"acceptedTerms"];
}

- (BOOL)_capabilityForKey:(id)a3 fromAttributes:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 objectForKeyedSubscript:v5];
  if ((_NSIsNSNumber() & 1) != 0 || _NSIsNSString())
  {
    char v7 = [v6 BOOLValue];
  }
  else
  {
    uint64_t v8 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] attributesInfo missing value for key '%@'. Defaulting to \"NO\"", (uint8_t *)&v10, 0xCu);
    }

    char v7 = 0;
  }

  return v7;
}

- (NSString)socialProfileID
{
  return [(ICMusicSocialProfile *)self->_socialProfile socialProfileID];
}

- (void)setSocialProfile:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ICMusicUserProfile *)self socialProfile];
  objc_msgSend(v3, "stringWithFormat:", @"[<ICMusicUserProfile:%p> socialProfile=%@; isOnboarded=%d, collaborationAllowed=%d]",
    self,
    v4,
    self->_isOnboarded,
  id v5 = self->_collaborationAllowed);

  return v5;
}

- (ICMusicUserProfile)initWithMediaAPIResponse:(id)a3
{
  id v4 = a3;
  id v5 = +[ICMusicUserProfile attributesInfoFromMediaAPIResponse:v4];
  if (v5)
  {
    v27.receiver = self;
    v27.super_class = (Class)ICMusicUserProfile;
    uint64_t v6 = [(ICMusicUserProfile *)&v27 init];
    if (v6)
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:@"name"];
      name = v6->_name;
      v6->_name = (NSString *)v7;

      v6->_isPrivate = [(ICMusicUserProfile *)v6 _capabilityForKey:@"isPrivate" fromAttributes:v5];
      v6->_isDiscoverableByContact = [(ICMusicUserProfile *)v6 _capabilityForKey:@"isDiscoverableByContact" fromAttributes:v5];
      v6->_isContactCheckAllowed = [(ICMusicUserProfile *)v6 _capabilityForKey:@"isContactCheckAllowed" fromAttributes:v5];
      v6->_isVerified = [(ICMusicUserProfile *)v6 _capabilityForKey:@"isVerified" fromAttributes:v5];
      v6->_isOnboarded = [(ICMusicUserProfile *)v6 _capabilityForKey:@"isOnboarded" fromAttributes:v5];
      int v9 = [v5 objectForKeyedSubscript:@"acceptedTerms"];
      v6->_displayNameAccepted = [v9 containsObject:@"displayName"];
      v6->_collaborationAllowed = [v9 containsObject:@"collaboration"];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__ICMusicUserProfile_initWithMediaAPIResponse___block_invoke;
      v25[3] = &unk_1E5ACAF50;
      int v10 = v6;
      id v26 = v10;
      uint64_t v11 = objc_msgSend(v9, "msv_map:", v25);
      acceptedTerms = v10->_acceptedTerms;
      v10->_acceptedTerms = (NSArray *)v11;

      v13 = [v5 objectForKeyedSubscript:@"artwork"];
      if (_NSIsNSDictionary())
      {
        uint64_t v14 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v13];
        id v15 = v14;
        if (v14)
        {
          int v16 = v14;
          p_super = &v10->_artworkInfo->super;
          v10->_artworkInfo = v16;
        }
        else
        {
          p_super = os_log_create("com.apple.amp.iTunesCloud", "UserState");
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            __int16 v24 = 0;
            _os_log_impl(&dword_1A2D01000, p_super, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile initWithResponse:] invalid artwork response dictionary", (uint8_t *)&v24, 2u);
          }
        }
      }
      uint64_t v19 = [v5 objectForKeyedSubscript:@"handle"];
      handle = v10->_handle;
      v10->_handle = (NSString *)v19;

      id v21 = [[ICMusicSocialProfile alloc] initWithMediaAPIResponse:v4];
      socialProfile = v10->_socialProfile;
      v10->_socialProfile = v21;
    }
    self = v6;
    id v18 = self;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

__CFString *__47__ICMusicUserProfile_initWithMediaAPIResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (_NSIsNSString())
  {
    id v4 = (__CFString *)v3;
LABEL_5:
    id v5 = v4;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 stringValue];
    goto LABEL_5;
  }
  uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 134218242;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_FAULT, "<ICMusicUserProfile %p> initWithMediaAPIResponse: unable to convert acceptedTerm to valid string. item=%@", (uint8_t *)&v9, 0x16u);
  }

  id v5 = &stru_1EF5F5C40;
LABEL_9:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)attributesInfoFromMediaAPIResponse:(id)a3
{
  v26[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"data"];
    uint64_t v6 = [v5 firstObject];

    uint64_t v7 = [v6 objectForKeyedSubscript:@"attributes"];
    char v8 = _NSIsNSDictionary();

    if (v8)
    {
      int v9 = [v6 objectForKey:@"attributes"];
      uint64_t v10 = [v9 objectForKey:@"name"];
      char v11 = _NSIsNSString();

      if ((v11 & 1) == 0)
      {
        id v12 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2D01000, v12, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid entry for key 'name'", buf, 2u);
        }

        *((unsigned char *)v23 + 24) = 0;
      }
      v26[0] = @"isPrivate";
      v26[1] = @"isDiscoverableByContact";
      v26[2] = @"isContactCheckAllowed";
      v26[3] = @"isVerified";
      v26[4] = @"isOnboarded";
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:5];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__ICMusicUserProfile_attributesInfoFromMediaAPIResponse___block_invoke;
      v18[3] = &unk_1E5ACAF28;
      os_log_t v14 = v9;
      os_log_t v19 = v14;
      id v20 = &v22;
      [v13 enumerateObjectsUsingBlock:v18];
      if (*((unsigned char *)v23 + 24)) {
        os_log_t v15 = v14;
      }
      else {
        os_log_t v15 = 0;
      }
      int v16 = v15;
    }
    else
    {
      os_log_t v14 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2D01000, v14, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid response. response missing attributes", buf, 2u);
      }
      int v16 = 0;
    }
  }
  else
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2D01000, v6, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid response. response=nil", buf, 2u);
    }
    int v16 = 0;
  }

  _Block_object_dispose(&v22, 8);

  return v16;
}

void __57__ICMusicUserProfile_attributesInfoFromMediaAPIResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if ((_NSIsNSNumber() & 1) == 0 && (_NSIsNSString() & 1) == 0)
  {
    id v5 = os_log_create("com.apple.amp.iTunesCloud", "UserState");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A2D01000, v5, OS_LOG_TYPE_ERROR, "[ICMusicUserProfile] invalid entry for key '%@'", (uint8_t *)&v6, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

+ (id)mediaAPIRequestURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"https://amp-api.music.apple.com/v1/me/social/profile?include=social-profile&with=nonOnboarded"];
}

@end
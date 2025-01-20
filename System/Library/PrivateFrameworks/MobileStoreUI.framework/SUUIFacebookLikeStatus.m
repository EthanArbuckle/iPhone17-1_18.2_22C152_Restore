@interface SUUIFacebookLikeStatus
- (BOOL)isUserLiked;
- (NSArray)friendNames;
- (NSURL)URL;
- (SUUIFacebookLikeStatus)initWithURL:(id)a3 likeStatusDictionary:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setFriendNames:(id)a3;
- (void)setURL:(id)a3;
- (void)setUserLiked:(BOOL)a3;
@end

@implementation SUUIFacebookLikeStatus

- (SUUIFacebookLikeStatus)initWithURL:(id)a3 likeStatusDictionary:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SUUIFacebookLikeStatus;
  v8 = [(SUUIFacebookLikeStatus *)&v30 init];
  if (v8)
  {
    v9 = (void *)SUUISocialFramework();
    v10 = objc_msgSend(v7, "objectForKey:", *(void *)SUUIWeakLinkedSymbolForString("SLFacebookLikeInfoMeKey", v9));
    if (objc_opt_respondsToSelector()) {
      v8->_userLiked = [v10 BOOLValue];
    }
    v11 = (void *)SUUISocialFramework();
    v12 = objc_msgSend(v7, "objectForKey:", *(void *)SUUIWeakLinkedSymbolForString("SLFacebookLikeInfoFriendsKey", v11));

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v25 = v6;
      id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v12;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v27;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v27 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * v18);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v13 addObject:v19];
            }
            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v31 count:16];
        }
        while (v16);
      }

      uint64_t v20 = [v13 copy];
      friends = v8->_friends;
      v8->_friends = (NSArray *)v20;

      id v6 = v25;
    }
    uint64_t v22 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v22;
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_friends copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  uint64_t v8 = [(NSURL *)self->_url copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  *(unsigned char *)(v5 + 24) = self->_userLiked;
  return (id)v5;
}

- (NSArray)friendNames
{
  return self->_friends;
}

- (void)setFriendNames:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (BOOL)isUserLiked
{
  return self->_userLiked;
}

- (void)setUserLiked:(BOOL)a3
{
  self->_userLiked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_friends, 0);
}

@end
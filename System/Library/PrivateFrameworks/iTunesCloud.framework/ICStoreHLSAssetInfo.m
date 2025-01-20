@interface ICStoreHLSAssetInfo
- (BOOL)isiTunesStoreStream;
- (ICStoreHLSAssetInfo)initWithItemResponseDictionary:(id)a3;
- (NSNumber)keyServerAdamID;
- (NSSet)audioTraits;
- (NSString)keyServerProtocolType;
- (NSURL)alternateKeyCertificateURL;
- (NSURL)alternateKeyServerURL;
- (NSURL)alternatePlaylistURL;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)playlistURL;
- (void)setAudioTraits:(id)a3;
- (void)setITunesStoreStream:(BOOL)a3;
- (void)setKeyCertificateURL:(id)a3;
- (void)setKeyServerAdamID:(id)a3;
- (void)setKeyServerProtocolType:(id)a3;
- (void)setKeyServerURL:(id)a3;
- (void)setPlaylistURL:(id)a3;
@end

@implementation ICStoreHLSAssetInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTraits, 0);
  objc_storeStrong((id *)&self->_keyServerAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_playlistURL, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);

  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

- (void)setAudioTraits:(id)a3
{
}

- (void)setKeyServerAdamID:(id)a3
{
}

- (NSNumber)keyServerAdamID
{
  return self->_keyServerAdamID;
}

- (void)setKeyServerProtocolType:(id)a3
{
}

- (void)setPlaylistURL:(id)a3
{
}

- (NSURL)playlistURL
{
  return self->_playlistURL;
}

- (void)setKeyServerURL:(id)a3
{
}

- (void)setKeyCertificateURL:(id)a3
{
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_isiTunesStoreStream = a3;
}

- (NSString)keyServerProtocolType
{
  keyServerProtocolType = self->_keyServerProtocolType;
  if (keyServerProtocolType)
  {
    v3 = keyServerProtocolType;
  }
  else
  {
    v3 = [(NSDictionary *)self->_itemResponseDictionary ic_stringValueForKey:@"key-server-protocol-type"];
  }

  return v3;
}

- (NSSet)audioTraits
{
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    v3 = [(NSDictionary *)itemResponseDictionary objectForKey:@"audioTraits"];
    if (_NSIsNSString() && [v3 length])
    {
      v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"[]"];
      v5 = [v3 stringByTrimmingCharactersInSet:v4];

      v6 = [v5 componentsSeparatedByString:@","];
      v7 = objc_msgSend(v6, "msv_map:", &__block_literal_global_25900);

      v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    }
    else if (_NSIsNSArray() && [v3 count])
    {
      v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return (NSSet *)v8;
}

id __34__ICStoreHLSAssetInfo_audioTraits__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28B88];
  id v3 = a2;
  v4 = [v2 whitespaceCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return v5;
}

- (NSURL)alternateKeyServerURL
{
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    id v3 = [(NSDictionary *)itemResponseDictionary objectForKey:@"mp-hls-key-server-url"];
    if (_NSIsNSString() && [v3 length])
    {
      v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSURL)alternateKeyCertificateURL
{
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    id v3 = [(NSDictionary *)itemResponseDictionary objectForKey:@"mp-hls-key-cert-url"];
    if (_NSIsNSString() && [v3 length])
    {
      v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSURL)alternatePlaylistURL
{
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    id v3 = [(NSDictionary *)itemResponseDictionary objectForKey:@"mp-hls-playlist-url"];
    if (_NSIsNSString() && [v3 length])
    {
      v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)isiTunesStoreStream
{
  itemResponseDictionary = self->_itemResponseDictionary;
  if (!itemResponseDictionary) {
    return self->_isiTunesStoreStream;
  }
  v4 = [(NSDictionary *)itemResponseDictionary objectForKey:@"is-itunes-stream"];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (NSURL)keyServerURL
{
  keyServerURL = self->_keyServerURL;
  if (keyServerURL)
  {
    id v3 = keyServerURL;
    goto LABEL_9;
  }
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    char v5 = [(NSDictionary *)itemResponseDictionary objectForKey:@"hls-key-server-url"];
    if (_NSIsNSString() && [v5 length])
    {
      id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

      goto LABEL_9;
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

- (NSURL)keyCertificateURL
{
  keyCertificateURL = self->_keyCertificateURL;
  if (keyCertificateURL)
  {
    id v3 = keyCertificateURL;
    goto LABEL_9;
  }
  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    char v5 = [(NSDictionary *)itemResponseDictionary objectForKey:@"hls-key-cert-url"];
    if (_NSIsNSString() && [v5 length])
    {
      id v3 = [MEMORY[0x1E4F1CB10] URLWithString:v5];

      goto LABEL_9;
    }
  }
  id v3 = 0;
LABEL_9:

  return v3;
}

- (ICStoreHLSAssetInfo)initWithItemResponseDictionary:(id)a3
{
  id v4 = a3;
  char v5 = [v4 objectForKey:@"hls-playlist-url"];
  if (_NSIsNSString() && [v5 length])
  {
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    if (v6)
    {
      v7 = [(ICStoreHLSAssetInfo *)self init];
      v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_playlistURL, v6);
        uint64_t v9 = [v4 copy];
        itemResponseDictionary = v8->_itemResponseDictionary;
        v8->_itemResponseDictionary = (NSDictionary *)v9;
      }
      self = v8;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
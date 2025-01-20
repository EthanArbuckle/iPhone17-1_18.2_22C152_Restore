@interface ICMusicRestoreBagConfiguration
- (BOOL)shouldGZip;
- (ICMusicRestoreBagConfiguration)initWithServerConfiguration:(id)a3;
- (NSArray)allowedKinds;
- (NSArray)allowedMatchStatus;
- (NSURL)restoreURL;
@end

@implementation ICMusicRestoreBagConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreURL, 0);
  objc_storeStrong((id *)&self->_allowedMatchStatus, 0);

  objc_storeStrong((id *)&self->_allowedKinds, 0);
}

- (BOOL)shouldGZip
{
  return self->_shouldGZip;
}

- (NSURL)restoreURL
{
  return self->_restoreURL;
}

- (NSArray)allowedMatchStatus
{
  return self->_allowedMatchStatus;
}

- (NSArray)allowedKinds
{
  return self->_allowedKinds;
}

- (ICMusicRestoreBagConfiguration)initWithServerConfiguration:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICMusicRestoreBagConfiguration;
  v5 = [(ICMusicRestoreBagConfiguration *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ic_arrayValueForKey:", @"allowed-kinds");
    allowedKinds = v5->_allowedKinds;
    v5->_allowedKinds = (NSArray *)v6;

    uint64_t v8 = objc_msgSend(v4, "ic_arrayValueForKey:", @"allowed-match-status");
    allowedMatchStatus = v5->_allowedMatchStatus;
    v5->_allowedMatchStatus = (NSArray *)v8;

    if (!v5->_allowedMatchStatus)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1EF640828, 0);
      v11 = v5->_allowedMatchStatus;
      v5->_allowedMatchStatus = (NSArray *)v10;
    }
    v5->_shouldGZip = objc_msgSend(v4, "ic_BOOLValueForKey:", @"gzip");
    v12 = objc_msgSend(v4, "ic_stringValueForKey:", @"url");
    if (v12)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      restoreURL = v5->_restoreURL;
      v5->_restoreURL = (NSURL *)v13;
    }
  }

  return v5;
}

@end
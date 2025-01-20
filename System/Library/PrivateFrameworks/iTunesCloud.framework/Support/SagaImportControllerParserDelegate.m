@interface SagaImportControllerParserDelegate
- (BOOL)includesBookmarkable;
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldRestart;
- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap;
- (NSString)currentLyricsToken;
- (NSString)currentPaginationToken;
- (SagaImportControllerParserDelegate)init;
- (int64_t)currentCloudID;
- (unsigned)currentItemCount;
- (unsigned)processedItemCount;
- (unsigned)totalItemCount;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidStart:(id)a3;
- (void)setMutableCloudIDToLyricsTokenMap:(id)a3;
@end

@implementation SagaImportControllerParserDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableCloudIDToLyricsTokenMap, 0);
  objc_storeStrong((id *)&self->_currentLyricsToken, 0);

  objc_storeStrong((id *)&self->_currentPaginationToken, 0);
}

- (void)setMutableCloudIDToLyricsTokenMap:(id)a3
{
}

- (NSMutableDictionary)mutableCloudIDToLyricsTokenMap
{
  return self->_mutableCloudIDToLyricsTokenMap;
}

- (NSString)currentLyricsToken
{
  return self->_currentLyricsToken;
}

- (int64_t)currentCloudID
{
  return self->_currentCloudID;
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (unsigned)processedItemCount
{
  return self->_processedItemCount;
}

- (unsigned)currentItemCount
{
  return self->_currentItemCount;
}

- (unsigned)totalItemCount
{
  return self->_totalItemCount;
}

- (BOOL)includesBookmarkable
{
  return self->_includesBookmarkable;
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1835821428 && self->_currentCloudID >= 1)
  {
    id v11 = v6;
    id v6 = [(NSString *)self->_currentLyricsToken length];
    id v7 = v11;
    if (v6)
    {
      currentLyricsToken = self->_currentLyricsToken;
      mutableCloudIDToLyricsTokenMap = self->_mutableCloudIDToLyricsTokenMap;
      v10 = +[NSNumber numberWithLongLong:self->_currentCloudID];
      [(NSMutableDictionary *)mutableCloudIDToLyricsTokenMap setObject:currentLyricsToken forKeyedSubscript:v10];

      id v7 = v11;
    }
  }

  _objc_release_x1(v6, v7);
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 <= 1836081510)
  {
    if (a4 != 1634026356)
    {
      if (a4 == 1634951787)
      {
        self->_includesBookmarkable = bswap32(*(_DWORD *)a5) != 0;
      }
      else if (a4 == 1835624804)
      {
        self->_currentCloudID = bswap32(*(_DWORD *)a5);
      }
      goto LABEL_15;
    }
    id v14 = v10;
    id v11 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    currentLyricsToken = self->_currentLyricsToken;
    self->_currentLyricsToken = v11;
LABEL_13:

    id v10 = v14;
    goto LABEL_15;
  }
  switch(a4)
  {
    case 0x6D706167u:
      id v14 = v10;
      v13 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      currentLyricsToken = self->_currentPaginationToken;
      self->_currentPaginationToken = v13;
      goto LABEL_13;
    case 0x6D72636Fu:
      self->_currentItemCount = bswap32(*(_DWORD *)a5);
      break;
    case 0x6D74636Fu:
      self->_totalItemCount = bswap32(*(_DWORD *)a5);
      break;
  }
LABEL_15:
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_currentCloudID = 0;
    self->_currentLyricsToken = 0;
    _objc_release_x1();
  }
  else if (a4 == 1836413554)
  {
    self->_shouldRestart = 1;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835819883)
  {
    if (a4 != 1835819884 && a4 != 1835821428 && a4 != 1836413554) {
      return 0;
    }
  }
  else if (a4 != 1633968755)
  {
    if (a4 == 1634165100 || a4 == 1634165106) {
      return _os_feature_enabled_impl();
    }
    return 0;
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  id v6 = a3;
  if (self->_shouldRestart) {
    goto LABEL_2;
  }
  char v7 = 1;
  if ((int)a4 > 1835819883)
  {
    if ((int)a4 > 1836213102)
    {
      if (a4 == 1836213103 || a4 == 1836344175) {
        goto LABEL_3;
      }
      int v9 = 1836413554;
    }
    else
    {
      if (a4 == 1835819884 || a4 == 1835821428) {
        goto LABEL_3;
      }
      int v9 = 1836081511;
    }
LABEL_20:
    if (a4 == v9) {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if ((int)a4 > 1634165105)
  {
    if (a4 == 1634165106) {
      goto LABEL_22;
    }
    if (a4 == 1634951787) {
      goto LABEL_3;
    }
    int v9 = 1835624804;
    goto LABEL_20;
  }
  if (a4 != 1633968755 && a4 != 1634026356)
  {
    if (a4 != 1634165100)
    {
LABEL_2:
      char v7 = 0;
      goto LABEL_3;
    }
LABEL_22:
    char v7 = _os_feature_enabled_impl();
  }
LABEL_3:

  return v7;
}

- (void)parserDidStart:(id)a3
{
  self->_shouldRestart = 0;
  self->_currentPaginationToken = 0;
  _objc_release_x1();
}

- (SagaImportControllerParserDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)SagaImportControllerParserDelegate;
  v2 = [(SagaImportControllerParserDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    mutableCloudIDToLyricsTokenMap = v2->_mutableCloudIDToLyricsTokenMap;
    v2->_mutableCloudIDToLyricsTokenMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end
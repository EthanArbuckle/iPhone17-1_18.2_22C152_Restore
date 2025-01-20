@interface PublishPlaylistResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (NSString)playlistGlobalID;
- (NSString)playlistShareURL;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
@end

@implementation PublishPlaylistResponseParserDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playlistShareURL, 0);

  objc_storeStrong((id *)&self->_playlistGlobalID, 0);
}

- (NSString)playlistShareURL
{
  return self->_playlistShareURL;
}

- (NSString)playlistGlobalID
{
  return self->_playlistGlobalID;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if (a4 == 1634358101)
  {
    id v14 = v10;
    v13 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    playlistShareURL = self->_playlistShareURL;
    self->_playlistShareURL = v13;
  }
  else
  {
    if (a4 != 1634357319) {
      goto LABEL_6;
    }
    id v14 = v10;
    v11 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    playlistShareURL = self->_playlistGlobalID;
    self->_playlistGlobalID = v11;
  }

  id v10 = v14;
LABEL_6:
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1835360880 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835624803)
  {
    if (a4 != 1835624804 && a4 != 1835819884)
    {
      int v5 = 1835821428;
LABEL_8:
      if (a4 != v5) {
        return 0;
      }
    }
  }
  else if (a4 != 1634357319 && a4 != 1634358101)
  {
    int v5 = 1835360880;
    goto LABEL_8;
  }
  return result;
}

@end
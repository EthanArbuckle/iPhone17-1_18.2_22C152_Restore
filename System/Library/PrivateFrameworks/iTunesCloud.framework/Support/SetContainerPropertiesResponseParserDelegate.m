@interface SetContainerPropertiesResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (NSString)globalPlaylistID;
- (NSString)subscribedContainerURL;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setSubscribedContainerURL:(id)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation SetContainerPropertiesResponseParserDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedContainerURL, 0);

  objc_storeStrong((id *)&self->_globalPlaylistID, 0);
}

- (void)setSubscribedContainerURL:(id)a3
{
}

- (NSString)subscribedContainerURL
{
  return self->_subscribedContainerURL;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  switch(a4)
  {
    case 0x616A5047u:
      id v14 = v10;
      v11 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      globalPlaylistID = self->_globalPlaylistID;
      self->_globalPlaylistID = v11;
LABEL_7:

      id v10 = v14;
      break;
    case 0x616A5355u:
      id v14 = v10;
      v13 = (NSString *)[objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      globalPlaylistID = self->_subscribedContainerURL;
      self->_subscribedContainerURL = v13;
      goto LABEL_7;
    case 0x6D757072u:
      self->_updateRequired = *a5 != 0;
      break;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1835360880 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835819883)
  {
    if (a4 != 1835819884 && a4 != 1835821428)
    {
      int v5 = 1836413042;
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
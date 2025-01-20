@interface ContainerCloudIDsParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ContainerCloudIDsParserDelegate)init;
- (NSMutableArray)subscribedPlaylistCloudIDs;
- (unsigned)currentPlaylistCloudID;
- (unsigned)currentPlaylistKind;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ContainerCloudIDsParserDelegate

- (void).cxx_destruct
{
}

- (unsigned)currentPlaylistKind
{
  return self->_currentPlaylistKind;
}

- (unsigned)currentPlaylistCloudID
{
  return self->_currentPlaylistCloudID;
}

- (NSMutableArray)subscribedPlaylistCloudIDs
{
  return self->_subscribedPlaylistCloudIDs;
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428 && self->_currentPlaylistCloudID && self->_currentPlaylistKind - 7 <= 1)
  {
    subscribedPlaylistCloudIDs = self->_subscribedPlaylistCloudIDs;
    id v9 = v6;
    v8 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:");
    [(NSMutableArray *)subscribedPlaylistCloudIDs addObject:v8];

    id v6 = v9;
  }
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if (a4 == 1634029643)
  {
    self->_currentPlaylistKind = *a5;
  }
  else if (a4 == 1835624804)
  {
    self->_currentPlaylistCloudID = bswap32(*(_DWORD *)a5);
  }
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_currentPlaylistCloudID = 0;
    self->_currentPlaylistKind = 0;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1634757753 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1835624803)
  {
    if (a4 == 1634029643) {
      return result;
    }
    int v5 = 1634757753;
    goto LABEL_7;
  }
  if (a4 != 1835624804 && a4 != 1835819884)
  {
    int v5 = 1835821428;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }
  return result;
}

- (ContainerCloudIDsParserDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)ContainerCloudIDsParserDelegate;
  v2 = [(ContainerCloudIDsParserDelegate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    subscribedPlaylistCloudIDs = v2->_subscribedPlaylistCloudIDs;
    v2->_subscribedPlaylistCloudIDs = (NSMutableArray *)v3;
  }
  return v2;
}

@end
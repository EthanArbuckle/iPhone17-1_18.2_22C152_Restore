@interface ICCollaborationEndResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationEndResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationEndResponseParserDelegate

- (void).cxx_destruct
{
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  self->_currentContainerDAAPCode = a4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  switch(a4)
  {
    case 0x616A5047u:
      response = self->_response;
      id v15 = v10;
      id v14 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      [(ICCollaborationEndResponse *)response setConvertedPlaylistGlobalID:v14];

      break;
    case 0x6D757072u:
      id v15 = v10;
      [(ICCollaborationEndResponse *)self->_response setUpdateRequired:*a5 != 0];
      break;
    case 0x6D696964u:
      uint64_t v11 = bswap32(*(_DWORD *)a5);
      unsigned int currentContainerDAAPCode = self->_currentContainerDAAPCode;
      if (currentContainerDAAPCode == 1836409964)
      {
        id v15 = v10;
        [(ICCollaborationEndResponse *)self->_response setPlaylistCloudLibraryIDToDelete:v11];
      }
      else
      {
        if (currentContainerDAAPCode != 1835821428) {
          goto LABEL_11;
        }
        id v15 = v10;
        [(ICCollaborationEndResponse *)self->_response setConvertedPlaylistCloudLibraryID:v11];
      }
      break;
    default:
      goto LABEL_11;
  }
  id v10 = v15;
LABEL_11:
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835821428 || a4 == 1836409964;
  return a4 == 1634354002 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1835624803)
  {
    if (a4 == 1634354002) {
      return result;
    }
    int v5 = 1634357319;
    goto LABEL_7;
  }
  if (a4 != 1835624804 && a4 != 1835821428)
  {
    int v5 = 1836413042;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }
  return result;
}

- (ICCollaborationEndResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [(ICCollaborationEndResponseParserDelegate *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

@end
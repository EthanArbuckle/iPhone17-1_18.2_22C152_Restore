@interface ICCollaborationBeginResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationBeginResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationBeginResponseParserDelegate

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
  if ((int)a4 <= 1634354039)
  {
    if (a4 == 1634353999)
    {
      id v16 = v10;
      [(ICCollaborationBeginResponse *)self->_response setCollaborationMode:bswap32(*(_DWORD *)a5)];
      goto LABEL_21;
    }
    if (a4 == 1634354021)
    {
      id v16 = v10;
      [(ICCollaborationBeginResponse *)self->_response setIsCollaborative:*a5 != 0];
      goto LABEL_21;
    }
    if (a4 != 1634354025) {
      goto LABEL_22;
    }
    response = self->_response;
    id v16 = v10;
    id v12 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    [(ICCollaborationBeginResponse *)response setCollaborationInviteURL:v12];
    goto LABEL_10;
  }
  if ((int)a4 <= 1835624803)
  {
    if (a4 == 1634354040)
    {
      id v16 = v10;
      [(ICCollaborationBeginResponse *)self->_response setCollaborationInviteURLExpirationDate:bswap32(*(_DWORD *)a5)];
      goto LABEL_21;
    }
    if (a4 != 1634357319) {
      goto LABEL_22;
    }
    v11 = self->_response;
    id v16 = v10;
    id v12 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    [(ICCollaborationBeginResponse *)v11 setCollaborationGlobalID:v12];
LABEL_10:

    goto LABEL_21;
  }
  if (a4 == 1836413042)
  {
    id v16 = v10;
    [(ICCollaborationBeginResponse *)self->_response setUpdateRequired:*a5 != 0];
  }
  else
  {
    if (a4 != 1835624804) {
      goto LABEL_22;
    }
    uint64_t v14 = bswap32(*(_DWORD *)a5);
    unsigned int currentContainerDAAPCode = self->_currentContainerDAAPCode;
    if (currentContainerDAAPCode == 1836409964)
    {
      id v16 = v10;
      [(ICCollaborationBeginResponse *)self->_response setPlaylistCloudLibraryIDToDelete:v14];
    }
    else
    {
      if (currentContainerDAAPCode != 1835821428) {
        goto LABEL_22;
      }
      id v16 = v10;
      [(ICCollaborationBeginResponse *)self->_response setCollaborationCloudLibraryID:v14];
    }
  }
LABEL_21:
  id v10 = v16;
LABEL_22:
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835821428 || a4 == 1836409964;
  return a4 == 1634354002 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634357318)
  {
    if (a4 - 1634353999 <= 0x29 && ((1 << (a4 - 79)) & 0x20004400009) != 0) {
      return result;
    }
    return 0;
  }
  if ((int)a4 > 1835821427)
  {
    if (a4 == 1835821428) {
      return result;
    }
    int v5 = 1836413042;
  }
  else
  {
    if (a4 == 1634357319) {
      return result;
    }
    int v5 = 1835624804;
  }
  if (a4 != v5) {
    return 0;
  }
  return result;
}

- (ICCollaborationBeginResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [(ICCollaborationBeginResponseParserDelegate *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

@end
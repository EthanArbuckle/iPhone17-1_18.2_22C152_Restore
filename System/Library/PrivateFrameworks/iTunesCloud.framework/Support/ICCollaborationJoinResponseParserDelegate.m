@interface ICCollaborationJoinResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationJoinResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationJoinResponseParserDelegate

- (void).cxx_destruct
{
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  self->_currentContainerDAAPCode = a4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v9 = a3;
  if (a4 == 1836413042)
  {
    id v10 = v9;
    [(ICCollaborationJoinResponse *)self->_joinResponse setUpdateRequired:*a5 != 0];
    goto LABEL_6;
  }
  if (a4 == 1835624804 && self->_currentContainerDAAPCode == 1835821428)
  {
    id v10 = v9;
    [(ICCollaborationJoinResponse *)self->_joinResponse setCollaborationCloudLibraryID:bswap32(*(_DWORD *)a5)];
LABEL_6:
    id v9 = v10;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1634354002 || v4;
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
  else if (a4 != 1634354002 && a4 != 1634357319)
  {
    int v5 = 1835624804;
    goto LABEL_8;
  }
  return result;
}

- (ICCollaborationJoinResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [(ICCollaborationJoinResponseParserDelegate *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_joinResponse, a3);
  }

  return v7;
}

@end
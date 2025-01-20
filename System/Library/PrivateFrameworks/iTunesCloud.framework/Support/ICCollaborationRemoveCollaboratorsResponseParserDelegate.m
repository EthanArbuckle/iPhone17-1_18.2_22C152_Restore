@interface ICCollaborationRemoveCollaboratorsResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationRemoveCollaboratorsResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationRemoveCollaboratorsResponseParserDelegate

- (void).cxx_destruct
{
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  self->_currentContainerDAAPCode = a4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if (a4 == 1836413042) {
    [(ICCollaborationRemoveCollaboratorsResponse *)self->_removeResponse setUpdateRequired:*a5 != 0];
  }
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
    if (a4 - 1634353999 <= 0x1A && ((1 << (a4 - 79)) & 0x4400009) != 0) {
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

- (ICCollaborationRemoveCollaboratorsResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [(ICCollaborationRemoveCollaboratorsResponseParserDelegate *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_removeResponse, a3);
  }

  return v7;
}

@end
@interface ICCollaborationEditResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (ICCollaborationEditResponseParserDelegate)initWithResponse:(id)a3;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
@end

@implementation ICCollaborationEditResponseParserDelegate

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
    [(ICCollaborationEditResponse *)self->_response setUpdateRequired:*a5 != 0];
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

- (ICCollaborationEditResponseParserDelegate)initWithResponse:(id)a3
{
  id v5 = a3;
  v6 = [(ICCollaborationEditResponseParserDelegate *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_response, a3);
  }

  return v7;
}

@end
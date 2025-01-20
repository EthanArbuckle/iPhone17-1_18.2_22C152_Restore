@interface SubscribedContainersUpdateRequiredParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
@end

@implementation SubscribedContainersUpdateRequiredParserDelegate

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if (a4 == 1836413042) {
    self->_updateRequired = *a5 != 0;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1634366290;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  return a4 == 1634366290 || a4 == 1836413042;
}

@end
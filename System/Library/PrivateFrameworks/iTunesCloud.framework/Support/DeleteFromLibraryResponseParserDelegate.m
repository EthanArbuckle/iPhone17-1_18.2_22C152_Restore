@interface DeleteFromLibraryResponseParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)updateRequired;
- (DeleteFromLibraryResponseParserDelegate)init;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation DeleteFromLibraryResponseParserDelegate

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
  if (a4 == 1836413042) {
    self->_updateRequired = *a5 != 0;
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1835360880;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  return a4 == 1835360880 || a4 == 1836413042;
}

- (DeleteFromLibraryResponseParserDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)DeleteFromLibraryResponseParserDelegate;
  result = [(DeleteFromLibraryResponseParserDelegate *)&v3 init];
  if (result) {
    result->_updateRequired = 0;
  }
  return result;
}

@end
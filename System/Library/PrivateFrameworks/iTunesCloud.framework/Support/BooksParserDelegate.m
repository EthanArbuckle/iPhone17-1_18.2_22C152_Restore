@interface BooksParserDelegate
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldParseMetadata;
- (BooksParserDelegate)initWithOperation:(id)a3;
- (ICBook)currentParsingBook;
- (JaliscoLoadBooksOperation)operation;
- (NSMutableArray)parsedBooks;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidStart:(id)a3;
- (void)setCurrentParsingBook:(id)a3;
- (void)setShouldParseMetadata:(BOOL)a3;
@end

@implementation BooksParserDelegate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentParsingBook, 0);
  objc_storeStrong((id *)&self->_parsedBooks, 0);

  objc_storeStrong((id *)&self->_operation, 0);
}

- (void)setShouldParseMetadata:(BOOL)a3
{
  self->_shouldParseMetadata = a3;
}

- (BOOL)shouldParseMetadata
{
  return self->_shouldParseMetadata;
}

- (void)setCurrentParsingBook:(id)a3
{
}

- (ICBook)currentParsingBook
{
  return self->_currentParsingBook;
}

- (NSMutableArray)parsedBooks
{
  return self->_parsedBooks;
}

- (JaliscoLoadBooksOperation)operation
{
  return self->_operation;
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428)
  {
    id v8 = v6;
    if (self->_shouldParseMetadata) {
      [(NSMutableArray *)self->_parsedBooks addObject:self->_currentParsingBook];
    }
    currentParsingBook = self->_currentParsingBook;
    self->_currentParsingBook = 0;

    id v6 = v8;
  }
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if (self->_shouldParseMetadata)
  {
    id v18 = v10;
    if ((int)a4 > 1634358894)
    {
      if ((int)a4 > 1634953069)
      {
        switch(a4)
        {
          case 0x6173676Eu:
            id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ICBook *)self->_currentParsingBook setGenre:v11];
            break;
          case 0x6D696E6Du:
            id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ICBook *)self->_currentParsingBook setTitle:v11];
            break;
          case 0x6D706572u:
            [(ICBook *)self->_currentParsingBook setPurchaseHistoryID:(((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))+ a5[7]];
            goto LABEL_30;
          default:
            goto LABEL_31;
        }
      }
      else
      {
        switch(a4)
        {
          case 0x616A566Fu:
            id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ICBook *)self->_currentParsingBook setVppOrganizationID:v11];
            break;
          case 0x61736172u:
            id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ICBook *)self->_currentParsingBook setAuthor:v11];
            break;
          case 0x61736470u:
            id v11 = +[NSDate dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a5)];
            [(ICBook *)self->_currentParsingBook setDatePurchased:v11];
            break;
          default:
            goto LABEL_31;
        }
      }
      goto LABEL_29;
    }
    if ((int)a4 <= 1634030408)
    {
      if (a4 == 1634026337)
      {
        id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
        v17 = +[NSURL URLWithString:v11];
        [(ICBook *)self->_currentParsingBook setArtworkURL:v17];
      }
      else
      {
        if (a4 != 1634030192) {
          goto LABEL_31;
        }
        id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
        [(ICBook *)self->_currentParsingBook setRedownloadParameters:v11];
      }
LABEL_29:

      goto LABEL_30;
    }
    if (a4 != 1634030409)
    {
      if (a4 != 1634358884)
      {
        if (a4 != 1634358892) {
          goto LABEL_31;
        }
        [(ICBook *)self->_currentParsingBook setVppLicensed:*a5 != 0];
        goto LABEL_30;
      }
      id v11 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      [(ICBook *)self->_currentParsingBook setVppOrganizationDisplayName:v11];
      goto LABEL_29;
    }
    [(ICBook *)self->_currentParsingBook setStoreID:(((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))+ a5[7]];
    v12 = [(JaliscoLoadBooksOperation *)self->_operation queryStoreIDs];
    id v10 = v18;
    if (v12)
    {
      v13 = [(JaliscoLoadBooksOperation *)self->_operation queryStoreIDs];
      v14 = +[NSNumber numberWithUnsignedLongLong:[(ICBook *)self->_currentParsingBook storeID]];
      unsigned __int8 v15 = [v13 containsObject:v14];

      id v10 = v18;
      if ((v15 & 1) == 0)
      {
        self->_shouldParseMetadata = 0;
        currentParsingBook = self->_currentParsingBook;
        self->_currentParsingBook = 0;

LABEL_30:
        id v10 = v18;
      }
    }
  }
LABEL_31:
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    self->_shouldParseMetadata = 1;
    self->_currentParsingBook = (ICBook *)objc_alloc_init((Class)ICBook);
    _objc_release_x1();
  }
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 <= 1634036069)
  {
    if (a4 == 1633968755) {
      return result;
    }
    int v5 = 1634035308;
    goto LABEL_7;
  }
  if (a4 != 1634036070 && a4 != 1835819884)
  {
    int v5 = 1835821428;
LABEL_7:
    if (a4 != v5) {
      return 0;
    }
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1634951537)
  {
    if ((int)a4 > 1835626092)
    {
      if ((int)a4 > 1835821427)
      {
        if (a4 == 1835821428) {
          return result;
        }
        int v6 = 1836082546;
      }
      else
      {
        if (a4 == 1835626093) {
          return result;
        }
        int v6 = 1835819884;
      }
      goto LABEL_22;
    }
    if (a4 != 1634951538 && a4 != 1634952304)
    {
      int v6 = 1634953070;
      goto LABEL_22;
    }
  }
  else
  {
    if ((int)a4 <= 1634035307)
    {
      if ((int)a4 > 1634030191)
      {
        if (a4 == 1634030192) {
          return result;
        }
        unsigned __int16 v5 = 21321;
      }
      else
      {
        if (a4 == 1633968755) {
          return result;
        }
        unsigned __int16 v5 = 17249;
      }
      goto LABEL_21;
    }
    if ((a4 - 1634358884 > 0xB || ((1 << (a4 - 100)) & 0x901) == 0) && a4 != 1634035308)
    {
      unsigned __int16 v5 = 26982;
LABEL_21:
      int v6 = v5 | 0x61650000;
LABEL_22:
      if (a4 != v6) {
        return 0;
      }
    }
  }
  return result;
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  -[JaliscoLoadBooksOperation setParserSuccess:](self->_operation, "setParserSuccess:", 0, a4);
  [(JaliscoLoadBooksOperation *)self->_operation setBooks:0];
  parsedBooks = self->_parsedBooks;
  self->_parsedBooks = 0;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  [(JaliscoLoadBooksOperation *)self->_operation setParserSuccess:a4 == 2];
  if ([(JaliscoLoadBooksOperation *)self->_operation parserSuccess]) {
    parsedBooks = self->_parsedBooks;
  }
  else {
    parsedBooks = 0;
  }
  [(JaliscoLoadBooksOperation *)self->_operation setBooks:parsedBooks];
  int v6 = self->_parsedBooks;
  self->_parsedBooks = 0;
}

- (void)parserDidStart:(id)a3
{
  self->_parsedBooks = +[NSMutableArray array];

  _objc_release_x1();
}

- (BooksParserDelegate)initWithOperation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BooksParserDelegate;
  int v6 = [(BooksParserDelegate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operation, a3);
  }

  return v7;
}

@end
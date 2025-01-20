@interface WBSNetscapeBookmarkFileReader
+ (BOOL)looksLikeBookmarkFile:(id)a3;
- (BOOL)readFromFileHandle:(id)a3 error:(id *)a4;
- (BOOL)readFromURL:(id)a3 error:(id *)a4;
- (WBSNetscapeBookmarkFileReaderDelegate)delegate;
- (void)_handleDoctype:(id)a3;
- (void)_handleEndElement:(id)a3;
- (void)_handleError:(id)a3;
- (void)_handleStartElement:(id)a3 attributes:(id)a4;
- (void)_handleText:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation WBSNetscapeBookmarkFileReader

+ (BOOL)looksLikeBookmarkFile:(id)a3
{
  v3 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:a3 error:0];
  v4 = [v3 readDataOfLength:128];

  if ([v4 length])
  {
    id v5 = v4;
    BOOL v6 = memmem((const void *)[v5 bytes], objc_msgSend(v5, "length"), (const void *)objc_msgSend(@"NETSCAPE-Bookmark-file-1", "UTF8String"), objc_msgSend(@"NETSCAPE-Bookmark-file-1", "length")) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  BOOL v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", a3, 0, 0, a4);
  if (v6) {
    BOOL v7 = [(WBSNetscapeBookmarkFileReader *)self readFromFileHandle:v6 error:a4];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)readFromFileHandle:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  xmlSAXHandler sax = *(xmlSAXHandler *)byte_1F1059468;
  BOOL v7 = htmlCreatePushParserCtxt(&sax, self, 0, 0, 0, XML_CHAR_ENCODING_NONE);
  v8 = v7;
  if (v7)
  {
    htmlCtxtUseOptions(v7, 2112);
    error = self->_error;
    p_error = (id *)&self->_error;
    id *p_error = 0;

    do
    {
      if (*p_error) {
        break;
      }
      v11 = (void *)MEMORY[0x1BA9BCF20]();
      id v20 = 0;
      v12 = [v6 readDataUpToLength:4096 error:&v20];
      id v13 = v20;
      id v14 = v20;
      uint64_t v15 = [v12 length];
      if (v15)
      {
        id v16 = v12;
        htmlParseChunk(v8, (const char *)[v16 bytes], objc_msgSend(v16, "length"), 0);
      }
      else
      {
        htmlParseChunk(v8, 0, 0, 1);
        objc_storeStrong(p_error, v13);
      }
    }
    while (v15);
    xmlFreeParserCtxt(v8);
    if (a4) {
      *a4 = *p_error;
    }
    LOBYTE(a4) = *p_error == 0;
  }
  else if (a4)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    v23[0] = @"Failed to create parser context";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    *a4 = [v17 errorWithDomain:*MEMORY[0x1E4F28798] code:14 userInfo:v18];

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void)_handleDoctype:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 caseInsensitiveCompare:@"NETSCAPE-Bookmark-file-1"])
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [NSString stringWithFormat:@"Invalid document type. Expected 'NETSCAPE-Bookmark-file-1'. Got '%@'", v4, *MEMORY[0x1E4F28568]];
    v11[0] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    v8 = [v5 errorWithDomain:*MEMORY[0x1E4F281F8] code:259 userInfo:v7];
    error = self->_error;
    self->_error = v8;
  }
}

- (void)_handleStartElement:(id)a3 attributes:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if ([v17 isEqualToString:@"h3"])
  {
    BOOL v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    accumulatedText = self->_accumulatedText;
    self->_accumulatedText = v7;

    v9 = [v6 objectForKeyedSubscript:@"id"];
    bookmarkListIdentifier = (NSMutableString *)self->_bookmarkListIdentifier;
    self->_bookmarkListIdentifier = v9;
  }
  else if ([v17 isEqualToString:@"h1"])
  {
    v11 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    bookmarkListIdentifier = self->_accumulatedText;
    self->_accumulatedText = v11;
  }
  else if ([v17 isEqualToString:@"dl"])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained beginAddingFolder:self->_bookmarkListTitle identifier:self->_bookmarkListIdentifier];

    bookmarkListTitle = self->_bookmarkListTitle;
    self->_bookmarkListTitle = 0;

    bookmarkListIdentifier = (NSMutableString *)self->_bookmarkListIdentifier;
    self->_bookmarkListIdentifier = 0;
  }
  else
  {
    if (![v17 isEqualToString:@"a"]) {
      goto LABEL_10;
    }
    id v14 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v15 = self->_accumulatedText;
    self->_accumulatedText = v14;

    id v16 = [v6 objectForKeyedSubscript:@"href"];
    bookmarkListIdentifier = (NSMutableString *)self->_bookmarkLeafURL;
    self->_bookmarkLeafURL = v16;
  }

LABEL_10:
}

- (void)_handleEndElement:(id)a3
{
  id v8 = a3;
  if ([v8 isEqualToString:@"h3"])
  {
    objc_storeStrong((id *)&self->_bookmarkListTitle, self->_accumulatedText);
LABEL_3:
    accumulatedText = self->_accumulatedText;
    self->_accumulatedText = 0;
    goto LABEL_4;
  }
  if ([v8 isEqualToString:@"h1"])
  {
    if ([(NSMutableString *)self->_accumulatedText isEqualToString:@"Reading List"])
    {
      bookmarkListIdentifier = self->_bookmarkListIdentifier;
      self->_bookmarkListIdentifier = (NSString *)@"com.apple.ReadingList";
    }
    goto LABEL_3;
  }
  accumulatedText = objc_loadWeakRetained((id *)&self->_delegate);
  if ([v8 isEqualToString:@"dl"])
  {
    [accumulatedText endAddingFolder];
  }
  else if ([v8 isEqualToString:@"a"])
  {
    [accumulatedText appendBookmarkWithTitle:self->_accumulatedText urlString:self->_bookmarkLeafURL];
    id v6 = self->_accumulatedText;
    self->_accumulatedText = 0;

    bookmarkLeafURL = self->_bookmarkLeafURL;
    self->_bookmarkLeafURL = 0;
  }
LABEL_4:
}

- (void)_handleText:(id)a3
{
  id v5 = a3;
  accumulatedText = self->_accumulatedText;
  if (accumulatedText) {
    [(NSMutableString *)accumulatedText appendString:v5];
  }
}

- (void)_handleError:(id)a3
{
}

- (WBSNetscapeBookmarkFileReaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSNetscapeBookmarkFileReaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bookmarkLeafURL, 0);
  objc_storeStrong((id *)&self->_bookmarkListIdentifier, 0);
  objc_storeStrong((id *)&self->_bookmarkListTitle, 0);
  objc_storeStrong((id *)&self->_accumulatedText, 0);
}

@end
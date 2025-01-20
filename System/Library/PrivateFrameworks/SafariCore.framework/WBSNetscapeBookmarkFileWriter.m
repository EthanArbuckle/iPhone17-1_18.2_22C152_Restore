@interface WBSNetscapeBookmarkFileWriter
- (BOOL)_writeData:(id)a3 error:(id *)a4;
- (BOOL)_writeString:(id)a3 error:(id *)a4;
- (BOOL)appendURLString:(id)a3 title:(id)a4 error:(id *)a5;
- (BOOL)closeFolderWithError:(id *)a3;
- (BOOL)finishWithError:(id *)a3;
- (BOOL)openFolder:(id)a3 identifier:(id)a4 error:(id *)a5;
- (NSFileHandle)fileHandle;
- (WBSNetscapeBookmarkFileWriter)initWithFileHandle:(id)a3 error:(id *)a4;
- (WBSNetscapeBookmarkFileWriter)initWithURL:(id)a3 error:(id *)a4;
@end

@implementation WBSNetscapeBookmarkFileWriter

- (WBSNetscapeBookmarkFileWriter)initWithURL:(id)a3 error:(id *)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28CB0], "safari_fileHandleWithURL:options:createMode:error:", a3, 1537, 416, a4);
  if (v6)
  {
    self = [(WBSNetscapeBookmarkFileWriter *)self initWithFileHandle:v6 error:a4];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSNetscapeBookmarkFileWriter)initWithFileHandle:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WBSNetscapeBookmarkFileWriter;
  v8 = [(WBSNetscapeBookmarkFileWriter *)&v25 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v8->_fileHandle, a3);
  v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  indentation = v9->_indentation;
  v9->_indentation = v10;

  if (![(WBSNetscapeBookmarkFileWriter *)v9 _writeString:@"<!DOCTYPE NETSCAPE-Bookmark-file-1>\n" error:a4])goto LABEL_11; {
  v12 = (void *)MEMORY[0x1E4F1CA20];
  }
  v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  v14 = [v13 languageCode];
  uint64_t v15 = [v12 characterDirectionForLanguage:v14];

  v16 = v15 == 2 ? @"<HTML dir=\"rtl\">\n" : @"<HTML>\n";
  if ([(WBSNetscapeBookmarkFileWriter *)v9 _writeString:v16 error:a4]
    && -[WBSNetscapeBookmarkFileWriter _writeString:error:](v9, "_writeString:error:", @"<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n",
         a4))
  {
    v17 = _WBSLocalizedString(@"Bookmarks (exported bookmarks HTML title)", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
    v18 = [NSString stringWithFormat:@"<TITLE>%@</TITLE>\n", v17];
    BOOL v19 = [(WBSNetscapeBookmarkFileWriter *)v9 _writeString:v18 error:a4];

    if (v19)
    {
      v20 = _WBSLocalizedString(@"Bookmarks (exported bookmarks displayed title)", &_WBSLocalizableStringsBundleOnceToken, &_WBSLocalizableStringsBundle);
      v21 = [NSString stringWithFormat:@"<H1>%@</H1>\n", v20];
      BOOL v22 = [(WBSNetscapeBookmarkFileWriter *)v9 _writeString:v21 error:a4];

      if (v22) {
        v23 = v9;
      }
      else {
        v23 = 0;
      }
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
LABEL_11:
    v23 = 0;
  }

  return v23;
}

- (BOOL)openFolder:(id)a3 identifier:(id)a4 error:(id *)a5
{
  v8 = (NSString *)a3;
  id v9 = a4;
  if (v8)
  {
    if (![(WBSNetscapeBookmarkFileWriter *)self _writeString:self->_indentation error:a5]) {
      goto LABEL_10;
    }
    if (![(WBSNetscapeBookmarkFileWriter *)self _writeString:@"<DT><H3" error:a5]) {
      goto LABEL_10;
    }
    if (v9)
    {
      v10 = [NSString stringWithFormat:@" id=\"%@\"", v9];
      BOOL v11 = [(WBSNetscapeBookmarkFileWriter *)self _writeString:v10 error:a5];

      if (!v11) {
        goto LABEL_10;
      }
    }
    v12 = NSString;
    v13 = escapeHTML(v8);
    v14 = [v12 stringWithFormat:@">%@</H3>\n", v13];
    BOOL v15 = [(WBSNetscapeBookmarkFileWriter *)self _writeString:v14 error:a5];

    if (!v15) {
      goto LABEL_10;
    }
  }
  if ([(WBSNetscapeBookmarkFileWriter *)self _writeString:self->_indentation error:a5]
    && [(WBSNetscapeBookmarkFileWriter *)self _writeString:@"<DL><p>\n" error:a5])
  {
    [(NSMutableString *)self->_indentation appendString:@"\t"];
    BOOL v16 = 1;
  }
  else
  {
LABEL_10:
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)appendURLString:(id)a3 title:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = (NSString *)a4;
  if ([(WBSNetscapeBookmarkFileWriter *)self _writeString:self->_indentation error:a5])
  {
    v10 = NSString;
    BOOL v11 = escapeHTML(v9);
    v12 = [v10 stringWithFormat:@"<DT><A HREF=\"%@\">%@</A>\n", v8, v11];
    BOOL v13 = [(WBSNetscapeBookmarkFileWriter *)self _writeString:v12 error:a5];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)closeFolderWithError:(id *)a3
{
  if (![(NSMutableString *)self->_indentation length])
  {
    if (a3)
    {
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
    }
    return 0;
  }
  -[NSMutableString deleteCharactersInRange:](self->_indentation, "deleteCharactersInRange:", [(NSMutableString *)self->_indentation length] - 1, 1);
  if (![(WBSNetscapeBookmarkFileWriter *)self _writeString:self->_indentation error:a3]) {
    return 0;
  }
  return [(WBSNetscapeBookmarkFileWriter *)self _writeString:@"</DL><p>\n" error:a3];
}

- (BOOL)finishWithError:(id *)a3
{
  return [(WBSNetscapeBookmarkFileWriter *)self _writeString:@"</HTML>\n" error:a3];
}

- (BOOL)_writeString:(id)a3 error:(id *)a4
{
  v6 = [a3 dataUsingEncoding:4];
  LOBYTE(a4) = [(WBSNetscapeBookmarkFileWriter *)self _writeData:v6 error:a4];

  return (char)a4;
}

- (BOOL)_writeData:(id)a3 error:(id *)a4
{
  return [(NSFileHandle *)self->_fileHandle writeData:a3 error:a4];
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_indentation, 0);
}

@end
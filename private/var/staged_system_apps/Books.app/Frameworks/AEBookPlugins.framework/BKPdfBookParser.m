@interface BKPdfBookParser
+ (unint64_t)pdfAnchorToPageNumber:(id)a3;
+ (unint64_t)pdfHrefToPageNumber:(id)a3;
- (AEPdfCacheObject)pdfObject;
- (id)hrefForPageNumber:(unint64_t)a3;
- (int)constructBKNavigationInfoWithPdfTocEntry:(id)a3 absoluteOrder:(int)a4 indentationLevel:(int)a5;
- (int)loadMetadata;
- (int)parse:(BOOL)a3;
- (void)constructBKDocumentWithPdfTocParser:(id)a3;
- (void)constructBKNavigationInfoWithPdfTocParser:(id)a3;
- (void)setPdfObject:(id)a3;
@end

@implementation BKPdfBookParser

- (int)parse:(BOOL)a3
{
  v5 = [(BKBookParser *)self book];
  unsigned __int8 v6 = [v5 wasParsed];

  if (v6) {
    return 0;
  }
  v8 = +[AEPdfCache sharedInstance];
  v9 = [(BKBookParser *)self book];
  v10 = (AEPdfCacheObject *)[v8 copyCacheObjectForBook:v9];
  pdfObject = self->_pdfObject;
  self->_pdfObject = v10;

  v12 = [(BKPdfBookParser *)self pdfObject];
  v13 = [v12 document];

  if (v13)
  {
    if ([v13 isLocked])
    {
      v14 = [(BKBookParser *)self book];
      v15 = AEBundle();
      v16 = [v15 localizedStringForKey:@"Untitled" value:&stru_1DF0D8 table:0];
      [(BKPdfTocParser *)v14 setBookTitle:v16];

      v17 = AEBundle();
      v18 = [v17 localizedStringForKey:@"Untitled" value:&stru_1DF0D8 table:0];
      [(BKPdfTocParser *)v14 setSortTitle:v18];
    }
    else
    {
      int v7 = [(BKPdfBookParser *)self loadMetadata];
      if (v7 || a3) {
        goto LABEL_11;
      }
      v19 = [(BKBookParser *)self book];
      [v19 resetAsNewlyDownloaded];

      v14 = -[BKPdfTocParser initWithDocument:]([BKPdfTocParser alloc], "initWithDocument:", [v13 documentRef]);
      [(BKPdfBookParser *)self constructBKNavigationInfoWithPdfTocParser:v14];
      [(BKPdfBookParser *)self constructBKDocumentWithPdfTocParser:v14];
      v17 = [(BKBookParser *)self book];
      [v17 setParserVersion:BKPdfBookParser_CurrentVersion[0]];
    }

    int v7 = 0;
  }
  else
  {
    int v7 = -1;
  }
LABEL_11:
  v20 = [(BKBookParser *)self book];
  v21 = [v20 fileSize];
  id v22 = [v21 longLongValue];

  if (!v22)
  {
    v23 = +[NSFileManager defaultManager];
    v24 = [(BKBookParser *)self book];
    v25 = [v24 url];
    v26 = [v25 path];
    v27 = [v23 attributesOfItemAtPath:v26 error:0];

    id v28 = [v27 fileSize];
    if (v28)
    {
      v29 = [(BKBookParser *)self book];
      v30 = +[NSNumber numberWithLongLong:v28];
      [v29 setFileSize:v30];
    }
  }

  return v7;
}

- (id)hrefForPageNumber:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = &stru_1DF0D8;
  }
  else
  {
    v5 = +[NSString stringWithFormat:@"%@%d", BKPdfBookParserFakeBaseHref[0], a3, v3];
  }
  return v5;
}

- (int)loadMetadata
{
  uint64_t v3 = [(BKPdfBookParser *)self pdfObject];
  uint64_t v4 = [v3 document];
  Info = CGPDFDocumentGetInfo((CGPDFDocumentRef)[v4 documentRef]);

  if (!Info) {
    return 0;
  }
  CGPDFStringRef value = 0;
  unsigned __int8 v6 = [(BKBookParser *)self book];
  if (CGPDFDictionaryGetString(Info, "Title", &value))
  {
    int v7 = (__CFString *)CGPDFStringCopyTextString(value);
    if ([(__CFString *)v7 length])
    {
      v8 = [v6 bookTitle];
      id v9 = [v8 length];

      if (!v9)
      {
        [v6 setBookTitle:v7];
        [v6 setSortTitle:v7];
      }
    }
  }
  v10 = [v6 bookAuthor];
  if (![v10 length])
  {

    goto LABEL_11;
  }
  v11 = [v6 sortAuthor];
  id v12 = [v11 length];

  if (!v12)
  {
LABEL_11:
    if (CGPDFDictionaryGetString(Info, "Author", &value))
    {
      v13 = (__CFString *)CGPDFStringCopyTextString(value);
      if ([(__CFString *)v13 length])
      {
        v14 = [v6 bookAuthor];
        id v15 = [v14 length];

        if (!v15) {
          [v6 setBookAuthor:v13];
        }
        v16 = [v6 sortAuthor];
        id v17 = [v16 length];

        if (!v17) {
          [v6 setSortAuthor:v13];
        }
      }
    }
  }
  v18 = [v6 genre];
  id v19 = [v18 length];

  if (!v19 && CGPDFDictionaryGetString(Info, "Subject", &value))
  {
    v20 = (__CFString *)CGPDFStringCopyTextString(value);
    if ([(__CFString *)v20 length]) {
      [v6 setGenre:v20];
    }
  }
  v21 = [(BKPdfBookParser *)self hrefForPageNumber:1];
  [v6 setEmbeddedArtHref:v21];

  return 0;
}

+ (unint64_t)pdfHrefToPageNumber:(id)a3
{
  id v3 = a3;
  id v4 = [(__CFString *)BKPdfBookParserFakeBaseHref[0] length];
  if ([v3 length] >= v4)
  {
    unsigned __int8 v6 = [v3 substringFromIndex:v4];
    if ([v6 length]) {
      unint64_t v5 = +[BKPdfBookParser pdfAnchorToPageNumber:v6];
    }
    else {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

+ (unint64_t)pdfAnchorToPageNumber:(id)a3
{
  return (int)[a3 intValue];
}

- (int)constructBKNavigationInfoWithPdfTocEntry:(id)a3 absoluteOrder:(int)a4 indentationLevel:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
  }
  else
  {
    id v9 = [(BKBookParser *)self book];
    v10 = [v9 managedObjectContext];

    id v11 = +[BKNavigationInfo newEmptyNavigationInfo:v10];
    id v12 = -[BKPdfBookParser hrefForPageNumber:](self, "hrefForPageNumber:", [v8 pageNumber]);
    [v11 setHref:v12];

    [v11 setBaseHref:BKPdfBookParserFakeBaseHref[0]];
    v13 = [v8 title];
    [v11 setName:v13];

    v14 = +[NSNumber numberWithInt:v5];
    [v11 setIndentationLevel:v14];

    id v15 = +[NSNumber numberWithInt:v6];
    [v11 setAbsoluteOrder:v15];

    v16 = [(BKBookParser *)self book];
    [v16 addChaptersObject:v11];

    uint64_t v17 = (v5 + 1);
    uint64_t v18 = (v6 + 1);
  }
  id v19 = (char *)[v8 numberOfChildren];
  if (v19)
  {
    for (i = 0; i != v19; ++i)
    {
      v21 = [v8 childAtIndex:i];
      if (v21) {
        uint64_t v18 = [(BKPdfBookParser *)self constructBKNavigationInfoWithPdfTocEntry:v21 absoluteOrder:v18 indentationLevel:v17];
      }
    }
  }

  return v18;
}

- (void)constructBKNavigationInfoWithPdfTocParser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    uint64_t v5 = [v4 tocRoot];
    if (v5) {
      [(BKPdfBookParser *)self constructBKNavigationInfoWithPdfTocEntry:v5 absoluteOrder:0xFFFFFFFFLL indentationLevel:0xFFFFFFFFLL];
    }

    id v4 = v6;
  }
}

- (void)constructBKDocumentWithPdfTocParser:(id)a3
{
  id v18 = a3;
  id v4 = [(BKBookParser *)self book];
  uint64_t v5 = [v4 bookBundlePath];
  uint64_t Size = ITFileUtil::GetSize(v5, v6);

  id v8 = [(BKBookParser *)self book];
  id v9 = [v8 managedObjectContext];

  id v10 = +[BKDocument newEmptyDocument:v9];
  id v11 = [(BKBookParser *)self book];
  id v12 = [v11 databaseKey];
  [v10 setBookDatabaseKey:v12];

  [v10 setHref:BKPdfBookParserFakeBaseHref[0]];
  [v10 setMime:@"application/pdf"];
  v13 = +[NSNumber numberWithInt:0];
  [v10 setDocumentOrdinal:v13];

  v14 = +[NSNumber numberWithUnsignedLongLong:Size];
  [v10 setFileSize:v14];

  [v10 setManifestId:&stru_1DF0D8];
  id v15 = [v18 tocRoot];
  id v16 = [v15 numberOfChildren];

  if (v16)
  {
    uint64_t v17 = +[NSNumber numberWithBool:1];
    [v10 setHasTocElements:v17];
  }
}

- (AEPdfCacheObject)pdfObject
{
  return self->_pdfObject;
}

- (void)setPdfObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
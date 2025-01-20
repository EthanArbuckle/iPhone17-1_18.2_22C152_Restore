@interface THReadingStatisticsScanOperation
- (NSMutableDictionary)counts;
- (NSString)documentEntryURI;
- (NSURL)applePubURL;
- (THReadingStatisticsScanOperation)initWithDelegate:(id)a3 ordinal:(unint64_t)a4 applePubURL:(id)a5 documentEntryURI:(id)a6;
- (THReadingStatisticsScanOperationDelegate)delegate;
- (_xmlTextReader)streamAPI;
- (id)_ignoredElements;
- (unint64_t)ordinal;
- (void)_parseBodyWithPrefix:(id)a3 index:(int64_t)a4;
- (void)dealloc;
- (void)main;
- (void)setApplePubURL:(id)a3;
- (void)setCounts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentEntryURI:(id)a3;
- (void)setOrdinal:(unint64_t)a3;
- (void)setStreamAPI:(_xmlTextReader *)a3;
@end

@implementation THReadingStatisticsScanOperation

- (THReadingStatisticsScanOperation)initWithDelegate:(id)a3 ordinal:(unint64_t)a4 applePubURL:(id)a5 documentEntryURI:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)THReadingStatisticsScanOperation;
  v10 = [(THReadingStatisticsScanOperation *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_delegate = (THReadingStatisticsScanOperationDelegate *)a3;
    v10->_ordinal = a4;
    v10->_applePubURL = (NSURL *)a5;
    v11->_documentEntryURI = (NSString *)a6;
  }
  return v11;
}

- (void)dealloc
{
  self->_applePubURL = 0;
  self->_documentEntryURI = 0;

  self->_counts = 0;
  streamAPI = self->_streamAPI;
  if (streamAPI)
  {
    xmlFreeTextReader(streamAPI);
    self->_streamAPI = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THReadingStatisticsScanOperation;
  [(THReadingStatisticsScanOperation *)&v4 dealloc];
}

- (id)_ignoredElements
{
  if (qword_573458 != -1) {
    dispatch_once(&qword_573458, &stru_45C118);
  }
  return (id)qword_573450;
}

- (void)_parseBodyWithPrefix:(id)a3 index:(int64_t)a4
{
  v6 = self;
  p_streamAPI = &self->_streamAPI;
  int v8 = xmlTextReaderDepth(self->_streamAPI);
  char v9 = 0;
  v10 = (void **)&isPad_ptr;
  while (1)
  {
    v11 = *p_streamAPI;
    int v12 = (v9 & 1) != 0 ? xmlTextReaderNext(v11) : xmlTextReaderRead(v11);
    int v13 = v12;
    int v14 = xmlTextReaderDepth(*p_streamAPI);
    if (v13 != 1 || v14 < v8) {
      break;
    }
    int v16 = v14;
    int v17 = xmlTextReaderNodeType(*p_streamAPI);
    if ((v17 - 3) <= 1)
    {
      v20 = v6;
      String = xmlTextReaderReadString(*p_streamAPI);
      if (String)
      {
        v22 = String;
        v23 = v10;
        id v24 = [objc_alloc((Class)v10[434]) initWithUTF8String:String];
        if (v24)
        {
          v25 = v24;
          id v38 = a3;
          id v26 = [v24 length];
          if (a4)
          {
            v27 = THImportLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v40 = a4;
              _os_log_error_impl(&dword_0, v27, OS_LOG_TYPE_ERROR, "Text node with index %ld not expected.  Should be even (resulting in odd CFI index with +1 adjustment)", buf, 0xCu);
            }
          }
          id v28 = [v23[434] stringWithFormat:@"epubcfi(%@/%ld,:0,:%lu)", v38, a4 + 1, v26];
          v29 = THImportLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(void *)&v40[6] = "";
            __int16 v41 = 2080;
            v42 = v22;
            __int16 v43 = 2112;
            int64_t v44 = (int64_t)v28;
            _os_log_debug_impl(&dword_0, v29, OS_LOG_TYPE_DEBUG, "%*scounting text \"%s\" cfi=%@", buf, 0x26u);
          }
          v6 = v20;
          [(NSMutableDictionary *)[(THReadingStatisticsScanOperation *)v20 counts] setObject:+[NSNumber numberWithUnsignedInteger:v26] forKeyedSubscript:v28];

          char v9 = 0;
          a3 = v38;
          v10 = v23;
        }
        else
        {
          char v9 = 0;
          v6 = v20;
        }
      }
      else
      {
        char v9 = 0;
      }
      goto LABEL_35;
    }
    if (v17 == 15)
    {
      char v9 = 0;
      if (v16 == v8)
      {
        v36 = THImportLog();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          sub_1F5210(2 * v8, p_streamAPI, v36);
        }
        return;
      }
    }
    else
    {
      char v9 = 0;
      if (v17 == 1)
      {
        a4 |= 1uLL;
        if (xmlTextReaderIsEmptyElement(*p_streamAPI))
        {
          v18 = THImportLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            v19 = xmlTextReaderName(*p_streamAPI);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(void *)&v40[6] = "";
            __int16 v41 = 2080;
            v42 = v19;
            __int16 v43 = 2048;
            int64_t v44 = a4;
            _os_log_debug_impl(&dword_0, v18, OS_LOG_TYPE_DEBUG, "%*sparsing empty element %s index=%ld", buf, 0x26u);
          }
LABEL_34:
          char v9 = 0;
          goto LABEL_35;
        }
        v30 = v10;
        v31 = (xmlChar *)[v10[434] stringWithUTF8String:xmlTextReaderConstLocalName(*p_streamAPI)];
        unsigned int v32 = [v6 _ignoredElements].containsObject:v31];
        v33 = THImportLog();
        BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG);
        if (!v32)
        {
          if (v34)
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v40 = 2 * v8;
            *(_WORD *)&v40[4] = 2080;
            *(void *)&v40[6] = "";
            __int16 v41 = 2112;
            v42 = v31;
            __int16 v43 = 2048;
            int64_t v44 = a4;
            _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%*sparsing element %@ index=%ld", buf, 0x26u);
          }
          v10 = v30;
          id v35 = [objc_alloc((Class)v30[434]) initWithFormat:@"%@/%ld", a3, a4 + 1];
          [(THReadingStatisticsScanOperation *)v6 _parseBodyWithPrefix:v35 index:0];

          goto LABEL_34;
        }
        if (v34)
        {
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v40 = 2 * v8;
          *(_WORD *)&v40[4] = 2080;
          *(void *)&v40[6] = "";
          __int16 v41 = 2112;
          v42 = v31;
          __int16 v43 = 2048;
          int64_t v44 = a4;
          _os_log_debug_impl(&dword_0, v33, OS_LOG_TYPE_DEBUG, "%*signoring non-body-text element %@ index=%ld", buf, 0x26u);
        }
        char v9 = 1;
        v10 = v30;
LABEL_35:
        ++a4;
      }
    }
  }
}

- (void)main
{
  if (([(THReadingStatisticsScanOperation *)self isCancelled] & 1) == 0)
  {
    objc_super v4 = [[PFXArchive alloc] initWithPath:[(NSURL *)[(THReadingStatisticsScanOperation *)self applePubURL] path]];
    if (![(PFXArchive *)v4 isValid]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsScanOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THReadingStatisticsScanOperation.m") lineNumber:176 description:@"Failed to load valid archive"];
    }
    if ([(PFXArchive *)v4 isValid])
    {
      id v5 = [(PFXArchive *)v4 decryptEntryWithName:[(THReadingStatisticsScanOperation *)self documentEntryURI] error:0];
      if (v5)
      {
        v6 = (xmlTextReader *)[v5 xmlReader];
        v7 = v6;
        if (v6)
        {
          for (int i = xmlTextReaderRead(v6); i == 1; int i = xmlTextReaderRead(v7))
          {
            if (xmlTextReaderNodeType(v7) == 1)
            {
              char v9 = xmlTextReaderConstLocalName(v7);
              if (!xmlStrcmp(v9, (const xmlChar *)"html"))
              {
                [(THReadingStatisticsScanOperation *)self setCounts:+[NSMutableDictionary dictionary]];
                int v13 = +[NSString stringWithFormat:@"/6/%ld!", 2 * [(THReadingStatisticsScanOperation *)self ordinal] + 2];
                [(THReadingStatisticsScanOperation *)self setStreamAPI:v7];
                [(THReadingStatisticsScanOperation *)self _parseBodyWithPrefix:v13 index:0];
                if (([(THReadingStatisticsScanOperation *)self isCancelled] & 1) == 0) {
                  [(THReadingStatisticsScanOperationDelegate *)[(THReadingStatisticsScanOperation *)self delegate] readingStatisticsScanOperation:self addTextNodeCharacterCounts:[(THReadingStatisticsScanOperation *)self counts]];
                }
                [(THReadingStatisticsScanOperation *)self setCounts:0];
                goto LABEL_27;
              }
            }
          }
          if (i < 0)
          {
            int v12 = THImportLog();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v15 = [(THReadingStatisticsScanOperation *)self documentEntryURI];
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Unable to parse XML file %@", buf, 0xCu);
            }
          }
LABEL_27:
          if (v7)
          {
            xmlFreeTextReader(v7);
            self->_streamAPI = 0;
          }
          goto LABEL_22;
        }
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsScanOperation main]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/THReadingStatisticsScanOperation.m") lineNumber:184 description:@"invalid nil value for '%s'", "streamAPI"];
        v10 = THImportLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = [(THReadingStatisticsScanOperation *)self documentEntryURI];
          v11 = "Unable to open XML file %@";
          goto LABEL_21;
        }
LABEL_22:

        return;
      }
      v10 = THImportLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v15 = [(THReadingStatisticsScanOperation *)self documentEntryURI];
      v11 = "Unable to decrypt %@";
    }
    else
    {
      v10 = THImportLog();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v15 = [(THReadingStatisticsScanOperation *)self applePubURL];
      v11 = "Failed to load valid archive %@";
    }
LABEL_21:
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    goto LABEL_22;
  }
}

- (unint64_t)ordinal
{
  return self->_ordinal;
}

- (void)setOrdinal:(unint64_t)a3
{
  self->_ordinal = a3;
}

- (THReadingStatisticsScanOperationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReadingStatisticsScanOperationDelegate *)a3;
}

- (NSURL)applePubURL
{
  return self->_applePubURL;
}

- (void)setApplePubURL:(id)a3
{
}

- (NSString)documentEntryURI
{
  return self->_documentEntryURI;
}

- (void)setDocumentEntryURI:(id)a3
{
}

- (_xmlTextReader)streamAPI
{
  return self->_streamAPI;
}

- (void)setStreamAPI:(_xmlTextReader *)a3
{
  self->_streamAPI = a3;
}

- (NSMutableDictionary)counts
{
  return self->_counts;
}

- (void)setCounts:(id)a3
{
}

@end
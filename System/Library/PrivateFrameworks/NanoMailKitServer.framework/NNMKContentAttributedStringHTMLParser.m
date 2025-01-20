@interface NNMKContentAttributedStringHTMLParser
+ (CGSize)_scaledDownSize:(CGSize)result maxWidth:(double)a4;
+ (id)_scaleAndPrepareImageForClient:(id)a3 maxWidth:(double)a4 screenScale:(double)a5;
+ (id)attachmentAttributedStringWithContentId:(id)a3 mergingAttributes:(id)a4;
+ (id)imageAttachmentAttributedStringWithContentId:(id)a3 imageSize:(CGSize)a4 mergingAttributes:(id)a5;
+ (id)trimAttributedString:(id)a3;
- (BOOL)_validateURLsAndHTMLTagsInParsedString:(id)a3 urlsFound:(id *)a4;
- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4;
- (BOOL)isElementIgnorable:(id)a3;
- (BOOL)isErrorTypeBlocked:(char *)a3;
- (BOOL)isWebLink:(id)a3;
- (BOOL)partiallyParsed;
- (NSDataDetector)dataDetector;
- (NSLock)lock;
- (NSMutableAttributedString)parsedAttributedString;
- (NSMutableDictionary)imageAtachmentsDataByContentId;
- (double)maxImageWidth;
- (id)_parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9 urlsFound:(id *)a10;
- (id)_parsePlainTextBody:(id)a3 encoding:(unint64_t)a4;
- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9;
- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsFound:(id *)a9;
- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsForValidation:(id)a8;
- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsFound:(id *)a8;
- (id)parseTextBody:(id)a3;
- (unint64_t)maxLength;
- (void)_addDataDetectionAttributes:(id)a3;
- (void)_appendComponentWithKey:(id)a3 from:(id)a4 to:(id)a5;
- (void)appendImageWithSource:(id)a3 width:(double)a4 height:(double)a5 stringAttributes:(id)a6;
- (void)appendString:(id)a3 stringAttributes:(id)a4;
- (void)dataDetector;
- (void)setDataDetector:(id)a3;
- (void)setImageAtachmentsDataByContentId:(id)a3;
- (void)setLock:(id)a3;
- (void)setMaxImageWidth:(double)a3;
- (void)setMaxLength:(unint64_t)a3;
- (void)setParsedAttributedString:(id)a3;
- (void)setPartiallyParsed:(BOOL *)a3;
@end

@implementation NNMKContentAttributedStringHTMLParser

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsFound:(id *)a9
{
  return [(NNMKContentAttributedStringHTMLParser *)self _parseHTMLBody:a3 encoding:a4 maxLength:a5 maxImageWidth:a7 partiallyParsed:a8 imageAttachmentsLoaded:0 urlsForValidation:a6 urlsFound:a9];
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9
{
  return [(NNMKContentAttributedStringHTMLParser *)self _parseHTMLBody:a3 encoding:a4 maxLength:a5 maxImageWidth:a7 partiallyParsed:a8 imageAttachmentsLoaded:a9 urlsForValidation:a6 urlsFound:0];
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsFound:(id *)a8
{
  return [(NNMKContentAttributedStringHTMLParser *)self _parseHTMLBody:a3 encoding:a4 maxLength:a5 maxImageWidth:a7 partiallyParsed:0 imageAttachmentsLoaded:0 urlsForValidation:a6 urlsFound:a8];
}

- (id)parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 urlsForValidation:(id)a8
{
  return [(NNMKContentAttributedStringHTMLParser *)self _parseHTMLBody:a3 encoding:a4 maxLength:a5 maxImageWidth:a7 partiallyParsed:0 imageAttachmentsLoaded:a8 urlsForValidation:a6 urlsFound:0];
}

- (id)parseTextBody:(id)a3
{
  return [(NNMKContentAttributedStringHTMLParser *)self _parsePlainTextBody:a3 encoding:4];
}

+ (id)attachmentAttributedStringWithContentId:(id)a3 mergingAttributes:(id)a4
{
  if (a4) {
    id v4 = a4;
  }
  else {
    id v4 = (id)MEMORY[0x263EFFA78];
  }
  id v5 = a3;
  v6 = (void *)[v4 mutableCopy];
  [v6 setObject:v5 forKeyedSubscript:@"NNMKInlineAttachment"];

  id v7 = objc_alloc(MEMORY[0x263F086A0]);
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
  v9 = (void *)[v7 initWithString:v8 attributes:v6];

  return v9;
}

+ (id)imageAttachmentAttributedStringWithContentId:(id)a3 imageSize:(CGSize)a4 mergingAttributes:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v19[2] = *MEMORY[0x263EF8340];
  v8 = (__CFString *)a3;
  if (a5) {
    id v9 = a5;
  }
  else {
    id v9 = (id)MEMORY[0x263EFFA78];
  }
  v10 = (void *)[v9 mutableCopy];
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = &stru_26F11E918;
  }
  v18[0] = @"cid";
  v18[1] = @"size";
  v19[0] = v11;
  v12 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", width, height);
  v19[1] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  [v10 setObject:v13 forKeyedSubscript:@"NNMKInlineImage"];

  id v14 = objc_alloc(MEMORY[0x263F086A0]);
  v15 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 65532);
  v16 = (void *)[v14 initWithString:v15 attributes:v10];

  return v16;
}

+ (id)trimAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 string];
    for (unint64_t i = 0; i < [v5 length]; ++i)
    {
      id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      int v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", i));

      if (!v8) {
        break;
      }
    }
    uint64_t v9 = [v5 length];
    unint64_t v10 = [v5 length];
    if (v10 > i)
    {
      uint64_t v9 = v10 + 1;
      do
      {
        v11 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        unint64_t v12 = v9 - 2;
        int v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v5, "characterAtIndex:", v9 - 2));

        --v9;
        if (v13) {
          BOOL v14 = v12 > i;
        }
        else {
          BOOL v14 = 0;
        }
      }
      while (v14);
    }
    v15 = objc_msgSend(v4, "attributedSubstringFromRange:", i, v9 - i);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_parseHTMLBody:(id)a3 encoding:(unint64_t)a4 maxLength:(unint64_t)a5 maxImageWidth:(double)a6 partiallyParsed:(BOOL *)a7 imageAttachmentsLoaded:(id *)a8 urlsForValidation:(id)a9 urlsFound:(id *)a10
{
  lock = self->_lock;
  id v17 = a9;
  id v18 = a3;
  [(NSLock *)lock lock];
  v19 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x263F089B8]);
  parsedAttributedString = self->_parsedAttributedString;
  self->_parsedAttributedString = v19;

  v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  imageAtachmentsDataByContentId = self->_imageAtachmentsDataByContentId;
  self->_imageAtachmentsDataByContentId = v21;

  self->_maxLength = a5;
  self->_maxImageWidth = a6;
  self->_partiallyParsed = a7;
  if (a7) {
    *a7 = 0;
  }
  [(NNMKHTMLParser *)self parseHTMLBody:v18 encoding:a4];

  BOOL v23 = [(NNMKContentAttributedStringHTMLParser *)self _validateURLsAndHTMLTagsInParsedString:v17 urlsFound:a10];
  v24 = 0;
  if (![(NNMKHTMLParser *)self containsBlockedElements] && v23)
  {
    [(NNMKContentAttributedStringHTMLParser *)self _addDataDetectionAttributes:self->_parsedAttributedString];
    v24 = self->_parsedAttributedString;
  }
  [(NSLock *)self->_lock unlock];
  if (a8) {
    *a8 = self->_imageAtachmentsDataByContentId;
  }
  return v24;
}

- (id)_parsePlainTextBody:(id)a3 encoding:(unint64_t)a4
{
  [(NSLock *)self->_lock lock];
  id v5 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x263F089B8]);
  parsedAttributedString = self->_parsedAttributedString;
  self->_parsedAttributedString = v5;

  [(NNMKContentAttributedStringHTMLParser *)self _addDataDetectionAttributes:self->_parsedAttributedString];
  id v7 = self->_parsedAttributedString;
  [(NSLock *)self->_lock unlock];
  return v7;
}

- (NSDataDetector)dataDetector
{
  dataDetector = self->_dataDetector;
  if (!dataDetector)
  {
    id v9 = 0;
    id v4 = [MEMORY[0x263F08770] dataDetectorWithTypes:2096 error:&v9];
    id v5 = v9;
    v6 = self->_dataDetector;
    self->_dataDetector = v4;

    if (v5)
    {
      id v7 = __logCategories;
      if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR)) {
        [(NNMKContentAttributedStringHTMLParser *)(uint64_t)v5 dataDetector];
      }
    }

    dataDetector = self->_dataDetector;
  }
  return dataDetector;
}

- (BOOL)isElementBlocked:(id)a3 attributeQueryBlock:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, __CFString *))a4;
  LOBYTE(v7) = 1;
  if ([v5 compare:@"table" options:1])
  {
    if ([v5 compare:@"img" options:1])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      int v8 = v6[2](v6, @"src");
      if ([v8 hasPrefix:@"cid:"]) {
        LOBYTE(v7) = 0;
      }
      else {
        int v7 = [v8 hasPrefix:@"data:image/"] ^ 1;
      }
    }
  }

  return v7;
}

- (BOOL)isErrorTypeBlocked:(char *)a3
{
  if (!a3) {
    return 0;
  }
  if (!strcmp(a3, "ol")) {
    return 1;
  }
  return strcmp(a3, "ul") == 0;
}

- (BOOL)isElementIgnorable:(id)a3
{
  id v3 = a3;
  BOOL v4 = 1;
  if ([v3 compare:@"head" options:1]) {
    BOOL v4 = [v3 compare:@"style" options:1] == 0;
  }

  return v4;
}

- (void)appendImageWithSource:(id)a3 width:(double)a4 height:(double)a5 stringAttributes:(id)a6
{
  id v26 = a3;
  id v10 = a6;
  if ([v26 hasPrefix:@"cid:"])
  {
    v11 = [v26 substringFromIndex:objc_msgSend(@"cid:", "length")];
  }
  else if ([v26 hasPrefix:@"data:"])
  {
    unint64_t v12 = [MEMORY[0x263F08C38] UUID];
    v11 = [v12 UUIDString];

    uint64_t v13 = [v26 rangeOfString:@";base64,"];
    v15 = [v26 substringFromIndex:v13 + v14];
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v15 options:0];
    if (v16)
    {
      id v17 = [(NNMKContentAttributedStringHTMLParser *)self imageAtachmentsDataByContentId];
      [v17 setObject:v16 forKeyedSubscript:v11];
    }
  }
  else
  {
    v11 = 0;
  }
  id v18 = objc_opt_class();
  [(NNMKContentAttributedStringHTMLParser *)self maxImageWidth];
  objc_msgSend(v18, "_scaledDownSize:maxWidth:", a4, a5, v19);
  double v21 = v20;
  double v23 = v22;
  if (self->_maxLength == 0x7FFFFFFFFFFFFFFFLL
    || [(NSMutableAttributedString *)self->_parsedAttributedString length] < self->_maxLength)
  {
    v24 = objc_msgSend((id)objc_opt_class(), "imageAttachmentAttributedStringWithContentId:imageSize:mergingAttributes:", v11, v10, v21, v23);
    v25 = [(NNMKContentAttributedStringHTMLParser *)self parsedAttributedString];
    [v25 appendAttributedString:v24];
  }
  else
  {
    *self->_partiallyParsed = 1;
    [(NNMKHTMLParser *)self setCancelled:1];
  }
}

- (void)appendString:(id)a3 stringAttributes:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  unint64_t maxLength = self->_maxLength;
  if (maxLength != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v8 = maxLength - [(NSMutableAttributedString *)self->_parsedAttributedString length];
    if ([v11 length] > v8)
    {
      uint64_t v9 = [v11 substringToIndex:v8];

      *self->_partiallyParsed = 1;
      [(NNMKHTMLParser *)self setCancelled:1];
      id v11 = (id)v9;
    }
  }
  id v10 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v11 attributes:v6];
  [(NSMutableAttributedString *)self->_parsedAttributedString appendAttributedString:v10];
}

- (void)_addDataDetectionAttributes:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v27 = 0;
  uint64_t v4 = DDScannerCreate();
  if (v4)
  {
    id v5 = (const void *)v4;
    [v3 string];
    if (DDScannerScanString())
    {
      CFTypeRef cf = v5;
      double v22 = v3;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v6 = (id)DDScannerCopyResultsWithOptions();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        char v9 = 0;
        uint64_t v10 = *(void *)v24;
        uint64_t v11 = *MEMORY[0x263F39490];
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v6);
            }
            uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            int Category = DDResultGetCategory();
            uint64_t Range = DDResultGetRange();
            if ((Category - 1) <= 2)
            {
              uint64_t v17 = Range;
              uint64_t v18 = v16;
              double v19 = objc_msgSend(MEMORY[0x263F394A8], "resultFromCoreResult:", v13, cf);
              objc_msgSend(v22, "addAttribute:value:range:", v11, v19, v17, v18);

              char v9 = 1;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v8);
      }
      else
      {
        char v9 = 0;
      }

      CFRelease(cf);
      id v3 = v22;
      if (v9) {
        objc_msgSend(v22, "dd_replaceResultAttributesWithSimpleLinksForTypes:context:", 7, 0);
      }
    }
    else
    {
      CFRelease(v5);
    }
  }
  else
  {
    double v20 = (void *)__logCategories;
    if (os_log_type_enabled((os_log_t)__logCategories, OS_LOG_TYPE_ERROR)) {
      -[NNMKContentAttributedStringHTMLParser _addDataDetectionAttributes:](v20, v27);
    }
  }
}

- (void)_appendComponentWithKey:(id)a3 from:(id)a4 to:(id)a5
{
  id v8 = a5;
  uint64_t v7 = [a4 objectForKeyedSubscript:a3];
  if (v7)
  {
    if ([v8 length]) {
      [v8 appendFormat:@", %@", v7];
    }
    else {
      [v8 appendString:v7];
    }
  }
}

+ (id)_scaleAndPrepareImageForClient:(id)a3 maxWidth:(double)a4 screenScale:(double)a5
{
  uint64_t v7 = (void *)MEMORY[0x263EFF990];
  id v8 = (UIImage *)a3;
  char v9 = [v7 data];
  uint64_t v10 = UIImageJPEGRepresentation(v8, 0.9);

  double v11 = a4 * a5;
  *(float *)&double v11 = a4 * a5;
  +[NNMKImageUtility scaleImageFromData:v10 destinationData:v9 maxWidth:v11];

  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v9];
  return v12;
}

+ (CGSize)_scaledDownSize:(CGSize)result maxWidth:(double)a4
{
  if (result.width > a4)
  {
    double v4 = a4 / result.width;
    result.double width = result.width * v4;
    result.double height = result.height * v4;
  }
  return result;
}

- (BOOL)_validateURLsAndHTMLTagsInParsedString:(id)a3 urlsFound:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  uint64_t v29 = self;
  id v8 = [(NSMutableAttributedString *)self->_parsedAttributedString string];
  if (![v8 length])
  {
    BOOL v24 = 1;
    if (!a4) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  long long v26 = a4;
  v27 = v7;
  uint64_t v9 = 0;
  id v28 = v6;
  while (1)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x263F08708], "whitespaceAndNewlineCharacterSet", v26);
    uint64_t v11 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v10, 0, v9, objc_msgSend(v8, "length") - v9);

    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v11 = [v8 length];
    }
    unint64_t v12 = objc_msgSend(v8, "substringWithRange:", v9, v11 - v9);
    uint64_t v13 = v12;
    if (v6)
    {
      if (([v12 isEqualToString:@"<b>"] & 1) != 0
        || ([v13 isEqualToString:@"<i>"] & 1) != 0
        || ([v13 hasPrefix:@"<br"] & 1) != 0
        || ([v13 hasPrefix:@"<img"] & 1) != 0
        || ([v13 hasPrefix:@"<div"] & 1) != 0
        || ([v13 hasPrefix:@"<span"] & 1) != 0
        || ([v13 hasPrefix:@"<p"] & 1) != 0
        || [v13 hasPrefix:@"<font"])
      {
        break;
      }
    }
    uint64_t v14 = [MEMORY[0x263F08708] punctuationCharacterSet];
    v15 = (void *)[v14 mutableCopy];

    [v15 removeCharactersInString:@"?/}&"];
    [v15 addCharactersInString:@"<>"];
    uint64_t v16 = [v13 stringByTrimmingCharactersInSet:v15];
    if (([v16 hasPrefix:@"http:"] & 1) != 0
      || ([v16 hasPrefix:@"https:"] & 1) != 0
      || ([v16 hasPrefix:@"mailto:"] & 1) != 0
      || ([v16 hasPrefix:@"ftp:"] & 1) != 0
      || [(NNMKContentAttributedStringHTMLParser *)v29 isWebLink:v16])
    {
      if (v6)
      {
        uint64_t v17 = [v6 containsObject:v16] ^ 1;
      }
      else
      {
        [v27 addObject:v16];
        uint64_t v17 = 0;
      }
      uint64_t v18 = [v13 rangeOfString:v16];
      uint64_t v20 = v19;
      uint64_t v21 = v18 + v9;
      parsedAttributedString = v29->_parsedAttributedString;
      long long v23 = [NSNumber numberWithBool:v17];
      [(NSMutableAttributedString *)parsedAttributedString addAttribute:@"NNMKCollapsableURL", v23, v21, v20 value range];

      id v6 = v28;
    }
    uint64_t v9 = v11 + 1;

    if (v11 + 1 >= (unint64_t)[v8 length])
    {
      BOOL v24 = 1;
      goto LABEL_26;
    }
  }

  BOOL v24 = 0;
LABEL_26:
  a4 = v26;
  uint64_t v7 = v27;
  if (v26) {
LABEL_27:
  }
    *a4 = v7;
LABEL_28:

  return v24;
}

- (BOOL)isWebLink:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(NNMKContentAttributedStringHTMLParser *)self dataDetector];
  id v6 = objc_msgSend(v5, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "resultType", (void)v12) == 32)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSMutableAttributedString)parsedAttributedString
{
  return self->_parsedAttributedString;
}

- (void)setParsedAttributedString:(id)a3
{
}

- (unint64_t)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(unint64_t)a3
{
  self->_unint64_t maxLength = a3;
}

- (double)maxImageWidth
{
  return self->_maxImageWidth;
}

- (void)setMaxImageWidth:(double)a3
{
  self->_maxImageWidth = a3;
}

- (BOOL)partiallyParsed
{
  return self->_partiallyParsed;
}

- (void)setPartiallyParsed:(BOOL *)a3
{
  self->_partiallyParsed = a3;
}

- (NSMutableDictionary)imageAtachmentsDataByContentId
{
  return self->_imageAtachmentsDataByContentId;
}

- (void)setImageAtachmentsDataByContentId:(id)a3
{
}

- (void)setDataDetector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataDetector, 0);
  objc_storeStrong((id *)&self->_imageAtachmentsDataByContentId, 0);
  objc_storeStrong((id *)&self->_parsedAttributedString, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)dataDetector
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Error instantiating NSDataDetector: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_addDataDetectionAttributes:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 description];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Unable to create DDScanner: %@", (uint8_t *)&v5, 0xCu);
}

@end
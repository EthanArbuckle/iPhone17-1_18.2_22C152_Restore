@interface WLMessage
+ (BOOL)_shouldIgnoreMessageThreadID;
+ (_NSRange)_populateMimeHeaders:(id)a3 recipients:(id)a4 fromRange:(_NSRange)a5 ofString:(id)a6 addCountryCodeToParties:(BOOL)a7 sqlController:(id)a8;
+ (id)_dateFormatterForMimeDateStrings;
+ (id)_fileNameForPart:(id)a3 smilContext:(id)a4;
+ (id)dateFromMimeHeaders:(id)a3;
+ (id)mimeHeadersFromMimeData:(id)a3 sqlController:(id)a4;
+ (id)recipientsFromMimeHeaders:(id)a3;
+ (id)senderFromMimeHeaders:(id)a3;
+ (void)addRecipients:(id)a3 toMimeHeaders:(id)a4;
- (BOOL)isGroupMessage;
- (NSArray)attachments;
- (NSArray)recipients;
- (NSData)mimeData;
- (NSDate)date;
- (NSString)dateString;
- (NSString)messageText;
- (NSString)subject;
- (NSString)threadID;
- (WLMessageParty)sender;
- (id)summary;
- (unint64_t)messageDirection;
- (unint64_t)messageType;
- (void)parseMIMEData:(id)a3 sqlController:(id)a4;
- (void)progressiveMimeParser:(id)a3 beganDataForMimePart:(id)a4;
- (void)progressiveMimeParser:(id)a3 beganMimePart:(id)a4;
- (void)progressiveMimeParser:(id)a3 failedWithError:(id)a4;
- (void)progressiveMimeParser:(id)a3 finishedMimePart:(id)a4;
- (void)setIsGroupMessage:(BOOL)a3;
- (void)setMessageDirection:(unint64_t)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation WLMessage

+ (_NSRange)_populateMimeHeaders:(id)a3 recipients:(id)a4 fromRange:(_NSRange)a5 ofString:(id)a6 addCountryCodeToParties:(BOOL)a7 sqlController:(id)a8
{
  BOOL v40 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v12 = a3;
  id v39 = a4;
  id v13 = a6;
  id v41 = a8;
  if (length)
  {
    v14 = @"\r\n";
    id v38 = v13;
    do
    {
      if ([v12 count])
      {
        objc_msgSend(v13, "rangeOfString:options:range:", v14, 8, location, length);
        if (v15) {
          break;
        }
      }
      uint64_t v16 = objc_msgSend(v13, "rangeOfString:options:range:", @": ", 0, location, length);
      if (!v17) {
        break;
      }
      uint64_t v18 = v16;
      uint64_t v19 = v17;
      v20 = objc_msgSend(v13, "substringWithRange:", location, v16 - location);
      NSUInteger location = v18 + v19;
      NSUInteger length = [v13 length] - (v18 + v19);
      uint64_t v21 = objc_msgSend(v13, "rangeOfString:options:range:", v14, 0, v18 + v19, length);
      if (!v22)
      {

        break;
      }
      uint64_t v23 = v21;
      uint64_t v24 = v22;
      objc_msgSend(v13, "substringWithRange:", location, v21 - location);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = [v13 length];
      if (([v20 isEqualToString:@"To"] & 1) != 0
        || (id v27 = v25, [v20 isEqualToString:@"From"]))
      {
        id v27 = [[WLMessageParty alloc] _initWithAddress:v25 addCountryCode:v40 sqlController:v41];

        [v27 address];
        uint64_t v28 = v26;
        id v29 = v12;
        v31 = v30 = v14;

        id v36 = v25;
        v37 = v31;
        id v35 = a1;
        _WLLog();

        v14 = v30;
        id v12 = v29;
        uint64_t v26 = v28;
        id v13 = v38;
      }
      if (objc_msgSend(v20, "isEqualToString:", @"To", v35, v36, v37))
      {
        [v39 addObject:v27];
      }
      else
      {
        v32 = [v12 objectForKey:v20];

        if (v32)
        {
          id v35 = a1;
          id v36 = v20;
          _WLLog();
        }
        objc_msgSend(v12, "setValue:forKey:", v27, v20, v35, v36);
      }
      NSUInteger location = v23 + v24;
      NSUInteger length = v26 - (v23 + v24);
    }
    while (length);
  }

  NSUInteger v33 = location;
  NSUInteger v34 = length;
  result.NSUInteger length = v34;
  result.NSUInteger location = v33;
  return result;
}

+ (id)_dateFormatterForMimeDateStrings
{
  if (_dateFormatterForMimeDateStrings_onceToken != -1) {
    dispatch_once(&_dateFormatterForMimeDateStrings_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)_dateFormatterForMimeDateStrings__dateFormatter;
  return v2;
}

void __45__WLMessage__dateFormatterForMimeDateStrings__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)_dateFormatterForMimeDateStrings__dateFormatter;
  _dateFormatterForMimeDateStrings__dateFormatter = (uint64_t)v0;

  [(id)_dateFormatterForMimeDateStrings__dateFormatter setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss Z"];
  [(id)_dateFormatterForMimeDateStrings__dateFormatter setLocale:v4];
  v2 = (void *)_dateFormatterForMimeDateStrings__dateFormatter;
  v3 = [MEMORY[0x263EFFA18] timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];
}

+ (id)mimeHeadersFromMimeData:(id)a3 sqlController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:7];
    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_msgSend(a1, "_populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:", v9, v10, 0, objc_msgSend(v8, "length"), v8, 0, v7);
    [a1 addRecipients:v10 toMimeHeaders:v9];
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    _WLLog();
    v9 = 0;
  }

  return v9;
}

+ (id)dateFromMimeHeaders:(id)a3
{
  if (a3)
  {
    id v4 = [a3 objectForKeyedSubscript:@"Date"];
    if (v4)
    {
      v5 = [a1 _dateFormatterForMimeDateStrings];
      id v6 = [v5 dateFromString:v4];

      _WLLog();
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)senderFromMimeHeaders:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"From"];
}

+ (id)recipientsFromMimeHeaders:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"To"];
}

+ (void)addRecipients:(id)a3 toMimeHeaders:(id)a4
{
}

- (void)parseMIMEData:(id)a3 sqlController:(id)a4
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_mimeData, a3);
  v9 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  if (v9)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
    uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    v83 = self;
    v76 = v9;
    uint64_t v12 = +[WLMessage _populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:](WLMessage, "_populateMimeHeaders:recipients:fromRange:ofString:addCountryCodeToParties:sqlController:", v10, v11, 0, [v9 length], v9, 1, v8);
    uint64_t v14 = v13;
    _WLLog();
    id obj = (id)v11;
    uint64_t v66 = v11;
    unint64_t v15 = 0x26B6E9000uLL;
    _WLLog();
    uint64_t v16 = objc_msgSend(v10, "objectForKeyedSubscript:", @"X-CMD-Message-Type", self, v66);
    self->_messageType = [v16 isEqualToString:@"sms"];
    v78 = v10;
    uint64_t v17 = [v10 objectForKeyedSubscript:@"Date"];
    dateString = self->_dateString;
    self->_dateString = v17;

    if (self->_dateString)
    {
      uint64_t v19 = +[WLMessage _dateFormatterForMimeDateStrings];
      v20 = [v19 dateFromString:self->_dateString];
      date = self->_date;
      self->_date = v20;

      v67 = self->_date;
      v69 = self->_dateString;
      v64 = self;
      _WLLog();
    }
    uint64_t v22 = objc_msgSend(v10, "objectForKeyedSubscript:", @"X-CMD-Message-Direction", v64, v67, v69);

    v75 = v22;
    if ([v22 isEqualToString:@"sent"])
    {
      self->_messageDirection = 0;
      if (![obj count])
      {
        v65 = self;
        _WLLog();
      }
    }
    else
    {
      self->_messageDirection = 1;
      uint64_t v23 = [v78 objectForKeyedSubscript:@"From"];
      sender = self->_sender;
      self->_sender = v23;
    }
    objc_storeStrong((id *)&self->_recipients, obj);
    self->_isGroupMessage = [(NSArray *)self->_recipients count] > 1;
    objc_msgSend(v78, "objectForKeyedSubscript:", @"Subject", v65);
    id v25 = (NSString *)objc_claimAutoreleasedReturnValue();
    subject = self->_subject;
    self->_subject = v25;

    if (+[WLMessage _shouldIgnoreMessageThreadID])
    {
      threadID = self->_threadID;
      self->_threadID = 0;
    }
    else
    {
      uint64_t v28 = [v78 objectForKeyedSubscript:@"X-CMD-Message-Thread"];
      threadID = self->_threadID;
      self->_threadID = v28;
    }

    uint64_t v29 = objc_msgSend(v76, "rangeOfString:options:range:", @"\r\n", 8, v12, v14);
    if (v30)
    {
      uint64_t v12 = v29 + v30;
      uint64_t v14 = [v76 length] - (v29 + v30);
    }
    v31 = v78;
    if (self->_messageType == 1)
    {
      v9 = v76;
      objc_msgSend(v76, "rangeOfString:options:range:", @"\r\n", 12, v12, v14);
      objc_msgSend(v76, "substringWithRange:", v12, v14 - v32);
      NSUInteger v33 = (NSString *)objc_claimAutoreleasedReturnValue();
      messageText = self->_messageText;
      self->_messageText = v33;
    }
    else
    {
      uint64_t v35 = [v78 objectForKeyedSubscript:@"Content-Type"];
      id v73 = v8;
      id v74 = v7;
      v72 = (void *)v35;
      if (v35) {
        [v78 setObject:v35 forKey:@"content-type"];
      }
      else {
        _WLLog();
      }
      id v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      mimeParts = self->_mimeParts;
      self->_mimeParts = v36;

      uint64_t v38 = [(NSData *)self->_mimeData mutableCopy];
      id v39 = objc_alloc(MEMORY[0x263F553A0]);
      v80 = (void *)v38;
      BOOL v40 = (void *)[v39 initWithBodyData:v38 topLevelHeaders:v78 headersToPreserve:MEMORY[0x263EFFA68]];
      [v40 setDelegate:self];
      v71 = v40;
      [v40 start];
      id v79 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_mimeParts, "count"));
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      v82 = self->_mimeParts;
      uint64_t v41 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        v43 = @"%@: begin attachment creation for part %@";
        uint64_t v84 = *(void *)v86;
        do
        {
          uint64_t v44 = 0;
          uint64_t v81 = v42;
          do
          {
            if (*(void *)v86 != v84) {
              objc_enumerationMutation(v82);
            }
            v45 = *(void **)(*((void *)&v85 + 1) + 8 * v44);
            _WLLog();
            v46 = objc_msgSend(v45, "contentTransferEncoding", self, v45);
            v47 = [v46 lowercaseString];
            int v48 = [v47 isEqualToString:@"base64"];

            if (v48)
            {
              uint64_t v49 = [v45 range];
              v51 = objc_msgSend(v80, "subdataWithRange:", v49, v50);
              v52 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedData:v51 options:1];
              v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "length"));
              v70 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v51, "length"));
              _WLLog();

              if (v52)
              {
                v54 = objc_msgSend((id)(v15 + 3592), "_fileNameForPart:smilContext:", v45, self->_smilContext, self, v53, v70);
                v55 = NSString;
                v56 = [v45 type];
                [v45 subtype];
                v58 = v57 = v43;
                v59 = [v55 stringWithFormat:@"%@/%@", v56, v58];

                v60 = [MEMORY[0x263F1D920] typeWithMIMEType:v59];
                v61 = [v60 identifier];

                _WLLog();
                id v62 = -[WLMessageAttachment _initWithData:fileName:mimeType:uti:]([WLMessageAttachment alloc], "_initWithData:fileName:mimeType:uti:", v52, v54, v59, v61, v83, v61, v59);
                [v79 addObject:v62];

                v43 = v57;
                unint64_t v15 = 0x26B6E9000;
                self = v83;
              }
              else
              {
                _WLLog();
              }

              uint64_t v42 = v81;
            }
            _WLLog();
            ++v44;
          }
          while (v42 != v44);
          uint64_t v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v85, v89, 16, self, v45);
        }
        while (v42);
      }

      objc_storeStrong((id *)&self->_attachments, v79);
      if (!self->_messageText)
      {
        _WLLog();
        v63 = self->_messageText;
        self->_messageText = (NSString *)&stru_26DF81F20;
      }
      id v8 = v73;
      id v7 = v74;
      v9 = v76;
      v31 = v78;
    }
  }
  else
  {
    v68 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
    _WLLog();
  }
}

+ (id)_fileNameForPart:(id)a3 smilContext:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 disposition];
  id v8 = v7;
  if (!v7
    || (uint64_t v9 = [v7 rangeOfString:@"; filename=\""], v9 == 0x7FFFFFFFFFFFFFFFLL)
    || (uint64_t v11 = v9 + v10,
        uint64_t v12 = objc_msgSend(v8, "rangeOfString:options:range:", @"\", 0, v11, objc_msgSend(v8, "length"") - v11),
        v12 == 0x7FFFFFFFFFFFFFFFLL)
    || (objc_msgSend(v8, "substringWithRange:", v11, v12 - v11),
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = [v6 parts];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v15)
    {

LABEL_17:
      uint64_t v23 = NSString;
      uint64_t v24 = [MEMORY[0x263F08C38] UUID];
      id v25 = [v24 UUIDString];
      uint64_t v13 = [v23 stringWithFormat:@"Image_%@", v25];

      goto LABEL_18;
    }
    uint64_t v16 = v15;
    id v27 = v6;
    uint64_t v13 = 0;
    uint64_t v17 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v20 = [v19 elementName];
        char v21 = [v20 isEqualToString:@"text"];

        if ((v21 & 1) == 0)
        {
          uint64_t v22 = [v19 fileName];

          uint64_t v13 = (void *)v22;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);

    id v6 = v27;
    if (!v13) {
      goto LABEL_17;
    }
  }
LABEL_18:

  return v13;
}

+ (BOOL)_shouldIgnoreMessageThreadID
{
  if (_shouldIgnoreMessageThreadID_onceToken != -1) {
    dispatch_once(&_shouldIgnoreMessageThreadID_onceToken, &__block_literal_global_124);
  }
  return _shouldIgnoreMessageThreadID_shouldIgnoreMessageThreadID;
}

void __41__WLMessage__shouldIgnoreMessageThreadID__block_invoke()
{
  _shouldIgnoreMessageThreadID_shouldIgnoreMessageThreadID = [MEMORY[0x263F862C0] BOOLForKey:@"WLIgnoreMessageThreadID"] == 1;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _WLLog();
}

- (void)progressiveMimeParser:(id)a3 beganMimePart:(id)a4
{
}

- (void)progressiveMimeParser:(id)a3 finishedMimePart:(id)a4
{
  id v30 = a4;
  _WLLog();
  id v5 = objc_msgSend(v30, "type", self, v30);
  int v6 = [v5 isEqualToString:@"multipart"];

  if (v6) {
    goto LABEL_2;
  }
  id v7 = [v30 type];
  if ([v7 isEqualToString:@"text"])
  {
    id v8 = [v30 subtype];
    int v9 = [v8 isEqualToString:@"plain"];

    if (v9)
    {
      uint64_t v10 = v30;
      if (self->_messageText) {
        goto LABEL_22;
      }
      _WLLog();
      mimeData = self->_mimeData;
      uint64_t v12 = objc_msgSend(v30, "range", self, v30);
      uint64_t v14 = -[NSData wl_subdataWithRangeExcludingTrailingCrnl:](mimeData, "wl_subdataWithRangeExcludingTrailingCrnl:", v12, v13);
      if (![v14 length])
      {
        _WLLog();
        messageText = self->_messageText;
        self->_messageText = (NSString *)&stru_26DF81F20;

        goto LABEL_20;
      }
      uint64_t v15 = (NSString *)[[NSString alloc] initWithData:v14 encoding:4];
      uint64_t v16 = self->_messageText;
      self->_messageText = v15;

      if ([(NSString *)self->_messageText length] <= 0x63)
      {
        _WLLog();
LABEL_20:

        goto LABEL_21;
      }
      id v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSString length](self->_messageText, "length"));
      _WLLog();
LABEL_19:

      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v17 = [v30 type];
  if (([v17 isEqualToString:@"application"] & 1) == 0)
  {

    goto LABEL_15;
  }
  uint64_t v18 = [v30 subtype];
  int v19 = [v18 isEqualToString:@"smil"];

  if (!v19)
  {
LABEL_15:
    _WLLog();
    -[NSMutableArray addObject:](self->_mimeParts, "addObject:", v30, self, v30);
    goto LABEL_21;
  }
  _WLLog();
  if (!self->_smilContext)
  {
    v20 = objc_alloc_init(WLMessageSMILContext);
    smilContext = self->_smilContext;
    self->_smilContext = v20;

    uint64_t v22 = self->_mimeData;
    uint64_t v23 = objc_msgSend(v30, "range", self, v30);
    uint64_t v14 = -[NSData wl_subdataWithRangeExcludingTrailingCrnl:](v22, "wl_subdataWithRangeExcludingTrailingCrnl:", v23, v24);
    id v25 = (void *)[objc_alloc(MEMORY[0x263F08D58]) initWithData:v14];
    [v25 setDelegate:self->_smilContext];
    long long v28 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
    _WLLog();

    uint64_t v26 = objc_msgSend(v25, "parse", self, v28);
    long long v29 = [NSNumber numberWithBool:v26];
    _WLLog();

    goto LABEL_19;
  }
LABEL_2:
  _WLLog();
LABEL_21:
  uint64_t v10 = v30;
LABEL_22:
}

- (void)progressiveMimeParser:(id)a3 beganDataForMimePart:(id)a4
{
}

- (void)progressiveMimeParser:(id)a3 failedWithError:(id)a4
{
}

- (id)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSData)mimeData
{
  return self->_mimeData;
}

- (unint64_t)messageType
{
  return self->_messageType;
}

- (NSString)dateString
{
  return self->_dateString;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)messageDirection
{
  return self->_messageDirection;
}

- (void)setMessageDirection:(unint64_t)a3
{
  self->_messageDirection = a3;
}

- (WLMessageParty)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  self->_isGroupMessage = a3;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)messageText
{
  return self->_messageText;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_mimeData, 0);
  objc_storeStrong((id *)&self->_mimeParts, 0);
  objc_storeStrong((id *)&self->_smilContext, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
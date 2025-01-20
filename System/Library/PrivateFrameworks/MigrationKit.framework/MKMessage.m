@interface MKMessage
- (BOOL)isNormalized;
- (BOOL)isRead;
- (BOOL)isSent;
- (MKMessage)initWithData:(id)a3;
- (NSArray)attachments;
- (NSArray)handles;
- (NSArray)recipients;
- (NSData)attributedBody;
- (NSDate)date;
- (NSString)ID;
- (NSString)UUID;
- (NSString)account;
- (NSString)body;
- (NSString)sender;
- (NSString)subject;
- (NSString)threadID;
- (int64_t)chatStyle;
- (int64_t)timestampInNanoseconds;
- (int64_t)timestampInSeconds;
- (void)setAccount:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAttributedBody:(id)a3;
- (void)setBody:(id)a3;
- (void)setChatStyle:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setHandles:(id)a3;
- (void)setID:(id)a3;
- (void)setIsNormalized:(BOOL)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setIsSent:(BOOL)a3;
- (void)setRecipients:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setThreadID:(id)a3;
- (void)setTimestampInNanoseconds:(int64_t)a3;
- (void)setTimestampInSeconds:(int64_t)a3;
- (void)setUUID:(id)a3;
@end

@implementation MKMessage

- (MKMessage)initWithData:(id)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)MKMessage;
  v5 = [(MKMessage *)&v86 init];
  if (!v5) {
    goto LABEL_80;
  }
  id v85 = 0;
  v6 = [MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:&v85];
  id v7 = v85;
  if (!v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = +[MKLog log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MKAccount initWithData:]((uint64_t)v5, v8);
      }
      goto LABEL_28;
    }
    id v9 = v6;
    v10 = objc_msgSend(v9, "mk_numberForKey:", @"is_sent");
    -[MKMessage setIsSent:](v5, "setIsSent:", [v10 BOOLValue]);

    v11 = objc_msgSend(v9, "mk_numberForKey:", @"is_read");
    -[MKMessage setIsRead:](v5, "setIsRead:", [v11 BOOLValue]);

    v12 = objc_msgSend(v9, "mk_numberForKey:", @"is_normalized");
    -[MKMessage setIsNormalized:](v5, "setIsNormalized:", [v12 BOOLValue]);

    v13 = (void *)MEMORY[0x263EFF910];
    v14 = objc_msgSend(v9, "mk_numberForKey:", @"date");
    [v14 doubleValue];
    v15 = objc_msgSend(v13, "dateWithTimeIntervalSince1970:");
    [(MKMessage *)v5 setDate:v15];

    [(NSDate *)v5->_date timeIntervalSinceReferenceDate];
    [(MKMessage *)v5 setTimestampInSeconds:(uint64_t)v16];
    [(NSDate *)v5->_date timeIntervalSinceReferenceDate];
    [(MKMessage *)v5 setTimestampInNanoseconds:(uint64_t)(v17 * 1000000000.0)];
    v18 = objc_msgSend(v9, "mk_stringForKey:", @"id");
    [(MKMessage *)v5 setID:v18];

    v19 = objc_msgSend(v9, "mk_stringForKey:", @"thread_id");
    [(MKMessage *)v5 setThreadID:v19];

    v20 = objc_msgSend(v9, "mk_stringForKey:", @"sender");
    [(MKMessage *)v5 setSender:v20];

    if (!v5->_isNormalized)
    {
      v21 = +[MKMessagePhoneNumber addCountryCallingCode:v5->_sender];
      [(MKMessage *)v5 setSender:v21];
    }
    v22 = objc_msgSend(v9, "mk_stringForKey:", @"subject");
    [(MKMessage *)v5 setSubject:v22];

    v23 = objc_msgSend(v9, "mk_stringForKey:", @"body");
    [(MKMessage *)v5 setBody:v23];

    if (!v5->_body) {
      [(MKMessage *)v5 setBody:&stru_26DF6A8B0];
    }
    v24 = [v9 objectForKey:@"recipients"];
    if (v24)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v69 = v9;
        id v71 = v4;
        v25 = v5;
        id v26 = v24;
        id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v81 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id v28 = v26;
        uint64_t v29 = [v28 countByEnumeratingWithState:&v81 objects:v89 count:16];
        if (v29)
        {
          uint64_t v30 = v29;
          v31 = 0;
          uint64_t v32 = *(void *)v82;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v82 != v32) {
                objc_enumerationMutation(v28);
              }
              v34 = *(void **)(*((void *)&v81 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v34 length])
              {
                if (v25->_isNormalized)
                {
                  id v35 = v34;
                }
                else
                {
                  id v35 = +[MKMessagePhoneNumber addCountryCallingCode:v34];
                }
                id v36 = v35;

                [v27 addObject:v36];
                v31 = v36;
              }
            }
            uint64_t v30 = [v28 countByEnumeratingWithState:&v81 objects:v89 count:16];
          }
          while (v30);
        }
        else
        {
          v31 = 0;
        }

        v5 = v25;
        [(MKMessage *)v25 setRecipients:v27];

        id v9 = v69;
        id v4 = v71;
      }
    }
    if (v5->_isSent)
    {
      if (![(NSArray *)v5->_recipients count])
      {
        if ([(NSString *)v5->_sender length])
        {
          v38 = (void *)[(NSString *)v5->_sender copy];
          v88 = v38;
          v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v88 count:1];
          [(MKMessage *)v5 setRecipients:v39];

          goto LABEL_39;
        }
LABEL_40:
        v40 = [v9 objectForKey:@"attachments"];
        if (v40)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v68 = v24;
            id v70 = v9;
            v76 = v5;
            id v72 = v4;
            id v74 = objc_alloc_init(MEMORY[0x263EFF980]);
            v67 = v40;
            id v41 = v40;
            id v73 = objc_alloc_init(MEMORY[0x263EFF980]);
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            id v42 = v41;
            uint64_t v43 = [v42 countByEnumeratingWithState:&v77 objects:v87 count:16];
            if (!v43) {
              goto LABEL_59;
            }
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v78;
            id v75 = v42;
            while (1)
            {
              for (uint64_t j = 0; j != v44; ++j)
              {
                if (*(void *)v78 != v45) {
                  objc_enumerationMutation(v42);
                }
                v47 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                v48 = objc_msgSend(v47, "mk_stringForKey:", @"id", v67);
                v49 = objc_msgSend(v47, "mk_stringForKey:", @"content_type");
                v50 = objc_msgSend(v47, "mk_stringForKey:", @"data");
                if ([v48 length]
                  && [v49 length]
                  && [v50 length]
                  && ([v49 isEqualToString:@"application/smil"] & 1) == 0)
                {
                  if ([v49 isEqualToString:@"text/plain"])
                  {
                    v51 = (MKMessageAttachment *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v50 options:0];
                    body = v76->_body;
                    v53 = (void *)[[NSString alloc] initWithData:v51 encoding:4];
                    v54 = [(NSString *)body stringByAppendingString:v53];
                    id v42 = v75;
                    [(MKMessage *)v76 setBody:v54];

                    goto LABEL_55;
                  }
                  v51 = [[MKMessageAttachment alloc] initWithID:v48 contentType:v49 base64Data:v50];
                  if (v51)
                  {
                    [v74 addObject:v51];
                    v53 = [(MKMessageAttachment *)v51 UUID];
                    [v73 addObject:v53];
LABEL_55:
                  }
                }
              }
              uint64_t v44 = [v42 countByEnumeratingWithState:&v77 objects:v87 count:16];
              if (!v44)
              {
LABEL_59:

                v5 = v76;
                [(MKMessage *)v76 setAttachments:v74];
                v55 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v76->_body];
                v56 = (void *)IMCreateSuperFormatStringWithAppendedFileTransfers();

                v57 = [MEMORY[0x263F08688] archivedDataWithRootObject:v56];
                [(MKMessage *)v76 setAttributedBody:v57];

                id v9 = v70;
                id v4 = v72;
                v40 = v67;
                v24 = v68;
                break;
              }
            }
          }
        }
        id v58 = objc_alloc_init(MEMORY[0x263EFF980]);
        v59 = [(MKMessage *)v5 recipients];
        unint64_t v60 = [v59 count];

        if (v60 >= 2)
        {
          if ([(NSString *)v5->_sender length]) {
            [v58 addObject:v5->_sender];
          }
          objc_msgSend(v58, "addObjectsFromArray:", v5->_recipients, v67);
LABEL_71:
          if (objc_msgSend(v58, "count", v67)) {
            [(MKMessage *)v5 setHandles:v58];
          }
          if (v5->_isSent)
          {
            sender = (__CFString *)v5->_sender;
          }
          else
          {
            if ([(NSArray *)v5->_recipients count] == 1)
            {
              v63 = [(NSArray *)v5->_recipients objectAtIndexedSubscript:0];
              [(MKMessage *)v5 setAccount:v63];

LABEL_79:
              v64 = [MEMORY[0x263F08C38] UUID];
              v65 = [v64 UUIDString];
              [(MKMessage *)v5 setUUID:v65];

LABEL_80:
              v37 = v5;
              goto LABEL_81;
            }
            sender = &stru_26DF6A8B0;
          }
          [(MKMessage *)v5 setAccount:sender];
          goto LABEL_79;
        }
        if ([(NSArray *)v5->_recipients count] == 1)
        {
          if (v5->_isSent || ![(NSString *)v5->_sender length])
          {
            v61 = -[NSArray objectAtIndexedSubscript:](v5->_recipients, "objectAtIndexedSubscript:", 0, v67);
            [v58 addObject:v61];

            goto LABEL_71;
          }
        }
        else if (![(NSString *)v5->_sender length])
        {
          goto LABEL_71;
        }
        objc_msgSend(v58, "addObject:", v5->_sender, v67);
        goto LABEL_71;
      }
      if (v5->_isSent) {
        goto LABEL_40;
      }
    }
    if (![(NSString *)v5->_sender length] && [(NSArray *)v5->_recipients count])
    {
      v38 = [(NSArray *)v5->_recipients objectAtIndexedSubscript:0];
      [(MKMessage *)v5 setSender:v38];
LABEL_39:

      goto LABEL_40;
    }
    goto LABEL_40;
  }
  v8 = +[MKLog log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(MKAccount *)(uint64_t)v5 initWithData:v8];
  }
LABEL_28:

  v37 = 0;
LABEL_81:

  return v37;
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (BOOL)isNormalized
{
  return self->_isNormalized;
}

- (void)setIsNormalized:(BOOL)a3
{
  self->_isNormalized = a3;
}

- (int64_t)timestampInSeconds
{
  return self->_timestampInSeconds;
}

- (void)setTimestampInSeconds:(int64_t)a3
{
  self->_timestampInSeconds = a3;
}

- (int64_t)timestampInNanoseconds
{
  return self->_timestampInNanoseconds;
}

- (void)setTimestampInNanoseconds:(int64_t)a3
{
  self->_timestampInNanoseconds = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)ID
{
  return self->_ID;
}

- (void)setID:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSData)attributedBody
{
  return self->_attributedBody;
}

- (void)setAttributedBody:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (int64_t)chatStyle
{
  return self->_chatStyle;
}

- (void)setChatStyle:(int64_t)a3
{
  self->_chatStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
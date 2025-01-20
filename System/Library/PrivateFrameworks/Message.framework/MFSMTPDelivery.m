@interface MFSMTPDelivery
+ (id)log;
- (Class)deliveryClass;
- (id)deliverMessageData:(id)a3 toRecipients:(id)a4;
- (void)_openConnection;
- (void)setAccount:(id)a3;
@end

@implementation MFSMTPDelivery

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__MFSMTPDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_38 != -1) {
    dispatch_once(&log_onceToken_38, block);
  }
  v2 = (void *)log_log_38;
  return v2;
}

void __21__MFSMTPDelivery_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_38;
  log_log_38 = (uint64_t)v1;
}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

- (void)_openConnection
{
  if (![(MFConnection *)self->_connection isValid])
  {
    id v3 = [(DeliveryAccount *)self->super._account authenticatedConnection:(*((unsigned __int8 *)&self->super + 104) >> 1) & 1];
    connection = self->_connection;
    self->_connection = v3;
  }
}

- (void)setAccount:(id)a3
{
  v4 = (DeliveryAccount *)a3;
  v5 = v4;
  connection = self->_connection;
  if (connection && self->super._account != v4)
  {
    self->_connection = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)MFSMTPDelivery;
  [(MFMailDelivery *)&v7 setAccount:v5];
}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  v91[6] = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v73 = a4;
  v79 = [(MFAccount *)self->super._account hostname];
  int v88 = 1030;
  char v87 = 0;
  v80 = +[MFActivityMonitor currentMonitor];
  [v80 resetConnectionStats];
  v75 = (void *)[objc_alloc(MEMORY[0x1E4F608C8]) initWithDomain:21 type:21];
  [v75 startActivity];
  if (![(MFConnection *)self->_connection isValid]) {
    [(MFSMTPDelivery *)self _openConnection];
  }
  if (v79)
  {
    v6 = 0;
  }
  else
  {
    int v88 = 1044;
    v6 = MFLookupLocalizedString(@"NO_SMTP_HOST", @"You have not specified an SMTP server in Mail Preferences. You must specify a server before you can send mail.", @"Delayed");
  }
  if ([(MFConnection *)self->_connection isValid])
  {
    connection = self->_connection;
    id WeakRetained = objc_loadWeakRetained(&self->super._delegate);
    [(MFSMTPConnection *)connection setDelegate:WeakRetained];

    id v9 = objc_loadWeakRetained(&self->super._delegate);
    [v9 setPercentDone:0.1];

    if (!v79)
    {
      int v22 = 0;
      v77 = 0;
      BOOL v23 = 0;
      uint64_t v24 = 1;
      goto LABEL_30;
    }
    v10 = [(MFMailMessage *)self->super._message headers];
    v11 = (void *)[v10 copyAddressListForResentFrom];
    if (![v11 count]) {
      goto LABEL_21;
    }
    id v12 = [v11 objectAtIndex:0];
    v13 = [v12 emailAddressValue];
    v14 = [v13 simpleAddress];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v12 stringValue];
    }
    v25 = v16;

    if (v25)
    {
      v78 = v25;
      if (![v25 isEqualToString:&stru_1EFF11268])
      {
        v26 = v25;
LABEL_29:
        v77 = v26;
        v34 = [v26 dataUsingEncoding:1];
        BOOL v23 = v34 == 0;

        uint64_t v24 = 0;
        int v22 = 1;
        goto LABEL_30;
      }
    }
    else
    {
LABEL_21:
      v78 = 0;
    }
    v27 = [(MFMailMessage *)self->super._message senders];

    if ([v27 count])
    {
      id v28 = [v27 objectAtIndex:0];
      v29 = [v28 emailAddressValue];
      v30 = [v29 simpleAddress];
      v31 = v30;
      if (v30)
      {
        id v32 = v30;
      }
      else
      {
        id v32 = [v28 stringValue];
      }
      id v33 = v32;
    }
    else
    {
      id v33 = 0;
      id v28 = v78;
    }

    v26 = v33;
    v11 = v27;
    goto LABEL_29;
  }
  v17 = [v80 error];

  if (!v17)
  {
    v18 = NSString;
    v19 = MFLookupLocalizedString(@"SMTP_NO_CONNECTION", @"The connection to the outgoing server “%@” failed. Additional Outgoing Mail Servers can be configured for Mail accounts in Settings > Apps > Mail > Accounts.", @"Delayed");
    uint64_t v20 = objc_msgSend(v18, "stringWithFormat:", v19, v79);

    int v88 = 1051;
    v6 = (void *)v20;
  }
  v21 = +[MFSMTPDelivery log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    -[MFSMTPDelivery deliverMessageData:toRecipients:](v21);
  }

  int v22 = 0;
  v77 = 0;
  BOOL v23 = 0;
  uint64_t v24 = 5;
LABEL_30:
  uint64_t v35 = *MEMORY[0x1E4F60660];
  v91[0] = *MEMORY[0x1E4F60740];
  v91[1] = v35;
  uint64_t v36 = *MEMORY[0x1E4F60730];
  v91[2] = *MEMORY[0x1E4F60650];
  v91[3] = v36;
  uint64_t v37 = *MEMORY[0x1E4F60710];
  v91[4] = *MEMORY[0x1E4F60718];
  v91[5] = v37;
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:6];
  v38 = [(MFMailDelivery *)self headersForDelivery];
  v76 = [v38 headersRequiringSMTPUTF8Support];

  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __50__MFSMTPDelivery_deliverMessageData_toRecipients___block_invoke;
  v85[3] = &unk_1E5D3F758;
  id v71 = v72;
  id v86 = v71;
  if ((v23 | objc_msgSend(v76, "ef_any:", v85)) == 1)
  {
    if (![(MFSMTPConnection *)self->_connection supportsSMTPUTF8])
    {
      v59 = +[MFSMTPDelivery log];
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        message = self->super._message;
        *(_DWORD *)buf = 138412290;
        v90 = message;
        _os_log_impl(&dword_1A7EFF000, v59, OS_LOG_TYPE_DEFAULT, "SMTPUTF8 is not supported: %@", buf, 0xCu);
      }

      MFLookupLocalizedString(@"SMTP_SENDING_FAILED_TITLE", @"Unable to Send Email", @"Delayed");
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v23) {
        int v61 = 1047;
      }
      else {
        int v61 = 1049;
      }
      int v88 = v61;
      if (v23) {
        MFLookupLocalizedString(@"SMTP_INVALID_SENDER_ADDRESS", @"The sender address “%@” was rejected by the server.", @"Delayed");
      }
      else {
        MFLookupLocalizedString(@"MF_SMTP_RECIPIENT_INVALID_ADDRESS", @"The recipient “%@” was rejected by the server because it is not a valid email address.", @"Delayed");
      }
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v24 = 1;
      goto LABEL_53;
    }
    v39 = +[MFSMTPDelivery log];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = self->super._message;
      *(_DWORD *)buf = 138412290;
      v90 = v40;
      _os_log_impl(&dword_1A7EFF000, v39, OS_LOG_TYPE_DEFAULT, "Enabling SMTPUTF8 support for message delivery: %@", buf, 0xCu);
    }

    uint64_t v41 = 0;
    if (!v22) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v41 = 1;
    if (!v22)
    {
LABEL_35:
      id v42 = 0;
      id v43 = 0;
      id v44 = 0;
      double v45 = 0.0;
      id v46 = v6;
      goto LABEL_54;
    }
  }
  unint64_t v47 = [(MFSMTPConnection *)self->_connection maximumMessageBytes];
  if (v47)
  {
    uint64_t v48 = [v74 length];
    unint64_t v49 = [v74 numberOfNewlinesNeedingConversion:0] + v48;
    if (v47 < v49)
    {
      v50 = NSString;
      uint64_t v51 = MFLookupLocalizedString(@"MESSAGE_TOO_LARGE", @"Your message has size %@, which exceeds %@, the maximum allowed by the server.", @"Message");
      v52 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v49);
      v53 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v47);
      objc_msgSend(v50, "stringWithFormat:", v51, v52, v53);
      id v46 = (id)objc_claimAutoreleasedReturnValue();

      id v42 = 0;
      uint64_t v24 = 7;
      v6 = (void *)v51;
LABEL_53:

      id v43 = 0;
      id v44 = 0;
      double v45 = 0.0;
      goto LABEL_54;
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(MFConnection *)self->_connection enableThroughputMonitoring:1];
  [(MFConnection *)self->_connection startActivity];
  v55 = self->_connection;
  id v83 = v6;
  id v84 = 0;
  id v81 = 0;
  id v82 = 0;
  uint64_t v24 = [(MFSMTPConnection *)v55 mailFrom:v77 recipients:v73 withData:v74 host:v79 emailFormatStyle:v41 errorTitle:&v84 errorMessage:&v83 serverResponse:&v82 displayError:&v87 errorCode:&v88 errorUserInfo:&v81];
  id v42 = v84;
  id v46 = v83;

  id v44 = v82;
  id v43 = v81;
  [(MFConnection *)self->_connection stopActivity];
  [(MFConnection *)self->_connection enableThroughputMonitoring:0];
  double v56 = CFAbsoluteTimeGetCurrent();
  [(DeliveryAccount *)self->super._account setSupportsOutboxCopy:0];
  double v45 = v56 - Current;
  if (v24 == 3)
  {
    [(MFSMTPConnection *)self->_connection abort];
    uint64_t v58 = 0;
    uint64_t v24 = 3;
    if (v46) {
      goto LABEL_57;
    }
    goto LABEL_64;
  }
  if (!v24)
  {
    v57 = [(MFMailDelivery *)self account];
    [v57 checkInConnection:self->_connection];

    uint64_t v24 = 0;
    uint64_t v58 = 1;
    if (v46) {
      goto LABEL_57;
    }
    goto LABEL_64;
  }
LABEL_54:
  [(MFSMTPConnection *)self->_connection quit];
  if (v24 == 4)
  {
    v62 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:0];
    [v80 setError:v62];
    uint64_t v58 = 0;
    uint64_t v24 = 4;
LABEL_62:

    v68 = v46;
    goto LABEL_65;
  }
  uint64_t v58 = 0;
  if (v46)
  {
LABEL_57:
    v62 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:v88 localizedDescription:0 title:v42 userInfo:v43];
    if (v87)
    {
      v63 = MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed");
      [v62 setShortDescription:v63];
    }
    [v62 setLocalizedDescription:v46];
    [v62 setMoreInfo:v44];
    v64 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v62 setUserInfoObject:v64 forKey:@"MailErrorHandlerDoNotSanitize"];

    [v80 setError:v62];
    v65 = +[MFSMTPDelivery log];
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = [(MFMailMessage *)self->super._message messageID];
      v67 = objc_msgSend(v62, "ef_publicDescription");
      [(MFSMTPDelivery *)v66 deliverMessageData:buf toRecipients:v65];
    }

    goto LABEL_62;
  }
LABEL_64:
  v68 = 0;
LABEL_65:
  v69 = [[MFDeliveryResult alloc] initWithStatus:v24];
  [(MFDeliveryResult *)v69 setDuration:v45];
  -[MFDeliveryResult setBytesSent:](v69, "setBytesSent:", [v80 bytesWritten]);
  [v75 stopActivityWithSuccess:v58];

  return v69;
}

uint64_t __50__MFSMTPDelivery_deliverMessageData_toRecipients___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void).cxx_destruct
{
}

- (void)deliverMessageData:(uint8_t *)buf toRecipients:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "SMTP Delivery for messageID %@ failed with error %{public}@", buf, 0x16u);
}

- (void)deliverMessageData:(os_log_t)log toRecipients:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Failed to find valid connection for SMTP delivery", v1, 2u);
}

@end
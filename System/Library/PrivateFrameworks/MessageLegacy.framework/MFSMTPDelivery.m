@interface MFSMTPDelivery
- (Class)deliveryClass;
- (id)deliverMessageData:(id)a3 toRecipients:(id)a4;
- (void)_openConnection;
- (void)dealloc;
- (void)setAccount:(id)a3;
@end

@implementation MFSMTPDelivery

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFSMTPDelivery;
  [(MFMailDelivery *)&v3 dealloc];
}

- (Class)deliveryClass
{
  return (Class)objc_opt_class();
}

- (void)_openConnection
{
  if (![(MFConnection *)self->_connection isValid])
  {

    self->_connection = (MFSMTPConnection *)(id)[(DeliveryAccount *)self->super._account authenticatedConnection:(*((unsigned __int8 *)&self->super + 112) >> 1) & 1];
  }
}

- (void)setAccount:(id)a3
{
  connection = self->_connection;
  if (connection && self->super._account != a3)
  {

    self->_connection = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MFSMTPDelivery;
  [(MFMailDelivery *)&v6 setAccount:a3];
}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  v7 = [(MFAccount *)self->super._account hostname];
  int v39 = 1030;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  char v34 = 0;
  id v8 = +[MFActivityMonitor currentMonitor];
  [v8 resetConnectionStats];
  if (![(MFConnection *)self->_connection isValid]) {
    [(MFSMTPDelivery *)self _openConnection];
  }
  if (!v7)
  {
    int v39 = 1044;
    v10 = 0;
    uint64_t v37 = MFLookupLocalizedString(@"NO_SMTP_HOST", @"You have not specified an SMTP server in Mail Preferences. You must specify a server before you can send mail.", @"Delayed");
    goto LABEL_13;
  }
  v9 = objc_msgSend((id)-[MFMessage headers](self->super._message, "headers"), "copyAddressListForResentFrom");
  if (![v9 count])
  {

LABEL_10:
    v11 = (void *)[(MFMessage *)self->super._message senders];
    if ([v11 count]) {
      v10 = objc_msgSend((id)objc_msgSend(v11, "objectAtIndex:", 0), "mf_uncommentedAddress");
    }
    else {
      v10 = 0;
    }
    goto LABEL_13;
  }
  v10 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", 0), "mf_uncommentedAddress");

  if (!v10 || [v10 isEqualToString:&stru_1F265CF90]) {
    goto LABEL_10;
  }
LABEL_13:
  if (![(MFConnection *)self->_connection isValid])
  {
    if (![v8 error])
    {
      uint64_t v37 = [NSString stringWithFormat:MFLookupLocalizedString(@"SMTP_NO_CONNECTION", @"The connection to the outgoing server “%@” failed. Additional Outgoing Mail Servers can be configured for Mail accounts in Settings > Accounts & Passwords.", @"Delayed", v7];
      int v39 = 1051;
    }
    int64_t v20 = 5;
    goto LABEL_24;
  }
  [(MFSMTPConnection *)self->_connection setDelegate:self->super._delegate];
  [self->super._delegate setPercentDone:0.1];
  if (!v7)
  {
    int64_t v20 = 1;
    goto LABEL_24;
  }
  id v33 = a4;
  unint64_t v12 = [(MFSMTPConnection *)self->_connection maximumMessageBytes];
  if (v12)
  {
    unint64_t v13 = v12;
    BOOL v14 = [(MFSMTPConnection *)self->_connection supportsBinaryMime];
    uint64_t v15 = [a3 length];
    unint64_t v16 = [a3 numberOfNewlinesNeedingConversion:v14] + v15;
    if (v13 < v16)
    {
      v17 = NSString;
      uint64_t v18 = MFLookupLocalizedString(@"MESSAGE_TOO_LARGE", @"Your message has size %@, which exceeds %@, the maximum allowed by the server.", 0);
      uint64_t v19 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v16);
      uint64_t v37 = objc_msgSend(v17, "stringWithFormat:", v18, v19, objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v13));
      int64_t v20 = 7;
LABEL_24:
      [(MFSMTPConnection *)self->_connection quit];
      double v25 = 0.0;
      goto LABEL_25;
    }
  }
  id v21 = [(MFMailDelivery *)self archiveAccount];
  BOOL v22 = [(DeliveryAccount *)self->super._account shouldUseSaveSentForAccount:v21];
  connection = self->_connection;
  if (v22) {
    uint64_t v24 = [v21 saveSentFolder];
  }
  else {
    uint64_t v24 = 0;
  }
  [(MFSMTPConnection *)connection setUseSaveSent:v22 toFolder:v24];
  double Current = CFAbsoluteTimeGetCurrent();
  [(MFConnection *)self->_connection enableThroughputMonitoring:1];
  int64_t v20 = [(MFSMTPConnection *)self->_connection mailFrom:v10 recipients:v33 withData:a3 host:v7 errorTitle:&v38 errorMessage:&v37 serverResponse:&v35 displayError:&v34 errorCode:&v39 errorUserInfo:&v36];
  [(MFConnection *)self->_connection enableThroughputMonitoring:0];
  double v30 = CFAbsoluteTimeGetCurrent();
  BOOL v31 = 0;
  account = self->super._account;
  if (v22) {
    BOOL v31 = [(MFSMTPConnection *)self->_connection supportsOutboxCopy];
  }
  double v25 = v30 - Current;
  [(DeliveryAccount *)account setSupportsOutboxCopy:v31];
  if (v20 == 3)
  {
    [(MFSMTPConnection *)self->_connection abort];
  }
  else if (v20)
  {
    [(MFSMTPConnection *)self->_connection quit];
    if (v20 == 4)
    {
      v26 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1028 localizedDescription:0];
LABEL_29:
      [v8 setError:v26];
      goto LABEL_30;
    }
  }
  else
  {
    objc_msgSend(-[MFMailDelivery account](self, "account"), "checkInConnection:", self->_connection);
  }
LABEL_25:
  if (v37)
  {
    v26 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:v39 localizedDescription:0 title:v38 userInfo:v36];
    if (v34) {
      [(MFError *)v26 setShortDescription:MFLookupLocalizedString(@"FAILED_SEND_TITLE", @"Cannot Send Mail", @"Delayed")];
    }
    [(MFError *)v26 setLocalizedDescription:v37];
    [(MFError *)v26 setMoreInfo:v35];
    -[MFError setUserInfoObject:forKey:](v26, "setUserInfoObject:forKey:", [NSNumber numberWithBool:1], @"MailErrorHandlerDoNotSanitize");
    goto LABEL_29;
  }
LABEL_30:
  v27 = [[MFDeliveryResult alloc] initWithStatus:v20];
  [(MFDeliveryResult *)v27 setDuration:v25];
  -[MFDeliveryResult setBytesSent:](v27, "setBytesSent:", [v8 bytesWritten]);
  return v27;
}

@end
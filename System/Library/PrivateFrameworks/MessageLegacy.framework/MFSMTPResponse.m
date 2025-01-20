@interface MFSMTPResponse
- (MFSMTPResponse)initWithStatus:(int)a3;
- (NSArray)continuationResponses;
- (NSString)statusString;
- (id)description;
- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4;
- (id)lastResponseLine;
- (int)failureReason;
- (int)status;
- (unsigned)statusClass;
- (unsigned)statusDetail;
- (unsigned)statusSubject;
- (void)_updateEnhancedStatusCodesFromLastResponse;
- (void)dealloc;
- (void)setContinuationResponses:(id)a3;
- (void)setLastResponseLine:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation MFSMTPResponse

- (MFSMTPResponse)initWithStatus:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFSMTPResponse;
  result = [(MFSMTPResponse *)&v5 init];
  if (result)
  {
    result->_status = a3;
    *((_WORD *)result + 11) &= 0xC00Fu;
    *(_WORD *)((char *)result + 21) &= 0xF003u;
    *((_WORD *)result + 10) &= 0xFC00u;
  }
  return result;
}

- (void)setStatus:(int)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    *((_WORD *)self + 11) &= 0xC00Fu;
    *(_WORD *)((char *)self + 21) &= 0xF003u;
    *((_WORD *)self + 10) &= 0xFC00u;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MFSMTPResponse;
  [(MFSMTPResponse *)&v3 dealloc];
}

- (void)_updateEnhancedStatusCodesFromLastResponse
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    self->_statusString = 0;
    uint64_t v4 = [self->_lastResponseLine bytes];
    uint64_t v5 = [self->_lastResponseLine length];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke;
    v15 = &unk_1E6866FC0;
    v16 = self;
    SEL v17 = a2;
    if (_updateEnhancedStatusCodesFromLastResponse_once != -1) {
      dispatch_once(&_updateEnhancedStatusCodesFromLastResponse_once, &v12);
    }
    id v6 = [NSString alloc];
    v7 = objc_msgSend(v6, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v4, v5, 1, 0, v12, v13, v14, v15, v16, v17);
    v8 = objc_msgSend((id)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex, "firstMatchInString:options:range:", v7, 0, 0, v5);
    if (v8)
    {
      v9 = v8;
      *((_WORD *)self + 10) = *((_WORD *)self + 10) & 0xFC00 | strtoul((const char *)(v4+ [v8 rangeAtIndex:1]), 0, 10) & 0x3FF;
      *(_WORD *)((char *)self + 21) = (4
                                     * (strtoul((const char *)(v4 + [v9 rangeAtIndex:2]), 0, 10) & 0x3FF)) | *(_WORD *)((char *)self + 21) & 0xF003;
      *((_WORD *)self + 11) = (16
                             * (strtoul((const char *)(v4 + [v9 rangeAtIndex:3]), 0, 10) & 0x3FF)) | *((_WORD *)self + 11) & 0xC00F;
      uint64_t v10 = [v9 rangeAtIndex:5];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        self->_statusString = (NSString *)(id)objc_msgSend(v7, "substringWithRange:", v10, v11);
      }
    }
    else
    {
      *((_WORD *)self + 11) &= 0xC00Fu;
      *(_WORD *)((char *)self + 21) &= 0xF003u;
      *((_WORD *)self + 10) &= 0xFC00u;
    }
  }
  else
  {
    *((_WORD *)self + 11) &= 0xC00Fu;
    *(_WORD *)((char *)self + 21) &= 0xF003u;
    *((_WORD *)self + 10) &= 0xFC00u;
  }
}

uint64_t __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)" options:16 error:0];
  _updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex = result;
  if (!result) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 40), *(void *)(a1 + 32), @"SMTPResponse.m", 96, @"Unable to init regular expression from %@", @"^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)");
  }
  return result;
}

- (id)lastResponseLine
{
  return self->_lastResponseLine;
}

- (void)setLastResponseLine:(id)a3
{
  id lastResponseLine = self->_lastResponseLine;
  if (lastResponseLine != a3)
  {

    self->_id lastResponseLine = a3;
    [(MFSMTPResponse *)self _updateEnhancedStatusCodesFromLastResponse];
  }
}

- (int)failureReason
{
  id lastResponseLine = self->_lastResponseLine;
  if (lastResponseLine)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id lastResponseLine = (id)[[NSString alloc] initWithData:self->_lastResponseLine encoding:4];
    }
    else {
      id lastResponseLine = 0;
    }
  }
  uint64_t v4 = &ExtendedStatusCodesTable;
  failureReason_uint64_t result = (uint64_t)&ExtendedStatusCodesTable;
  while (*v4 != (*((_WORD *)self + 10) & 0x3FF)
       || v4[1] != ((*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF)
       || v4[2] != ((*((unsigned __int16 *)self + 11) >> 4) & 0x3FF))
  {
    if (*((void *)v4 + 1) && lastResponseLine != 0)
    {
      objc_msgSend(lastResponseLine, "rangeOfString:options:");
      uint64_t v4 = (__int16 *)failureReason_result;
      if (v6) {
        break;
      }
    }
    v4 += 12;
    failureReason_uint64_t result = (uint64_t)v4;
    if (v4 >= (__int16 *)off_1E6867CE0)
    {
      int v7 = -1;
      goto LABEL_17;
    }
  }
  int v7 = *((_DWORD *)v4 + 4);
LABEL_17:

  return v7;
}

- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4
{
  switch([(MFSMTPResponse *)self failureReason])
  {
    case 0:
      uint64_t v6 = @"MF_SMTP_RECIPIENT_UNKNOWN";
      int v7 = @"The recipient “%@” was rejected by the server because the user is unknown.";
      goto LABEL_8;
    case 1:
      uint64_t v6 = @"MF_SMTP_RECIPIENT_RELAYING_NOT_ALLOWED";
      int v7 = @"The recipient “%@” was rejected by the server because it does not allow relaying.";
      goto LABEL_8;
    case 2:
      uint64_t v6 = @"MF_SMTP_RECIPIENT_INVALID_ADDRESS";
      int v7 = @"The recipient “%@” was rejected by the server because it is not a valid email address.";
      goto LABEL_8;
    case 3:
      uint64_t v6 = @"MF_SMTP_SENDING_LIMIT_EXCEEDED";
      int v7 = @"Sending the message failed because you exceeded your sending limit.";
      goto LABEL_8;
    case 4:
      uint64_t v6 = @"NO_PASSWORD_PROVIDED_ERROR";
      int v7 = @"No password provided.\n\nPlease go to Mail Account Settings and enter a password.";
      v8 = 0;
      goto LABEL_9;
    case 5:
      uint64_t v6 = @"SMTP_INVALID_SENDER_ADDRESS";
      int v7 = @"The sender address “%@” was rejected by the server.";
LABEL_8:
      v8 = @"Delayed";
LABEL_9:
      a4 = (id)MFLookupLocalizedString((uint64_t)v6, (uint64_t)v7, v8);
      break;
    default:
      break;
  }
  if (a3 && a4) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", a4, a3);
  }
  else {
    return a4;
  }
}

- (id)description
{
  if ((*((_WORD *)self + 10) & 0x3FF) != 0) {
    return (id)[NSString stringWithFormat:@"%d (%d.%d.%d) %@", self->_status, *((_WORD *)self + 10) & 0x3FF, (*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF, (*((unsigned __int16 *)self + 11) >> 4) & 0x3FF, self->_statusString];
  }
  else {
    return (id)[NSString stringWithFormat:@"%d %@", self->_status, self->_statusString, v3, v4, v5];
  }
}

- (int)status
{
  return self->_status;
}

- (unsigned)statusClass
{
  return *((_WORD *)self + 10) & 0x3FF;
}

- (unsigned)statusSubject
{
  return (*(unsigned __int16 *)((char *)self + 21) >> 2) & 0x3FF;
}

- (unsigned)statusDetail
{
  return (*((unsigned __int16 *)self + 11) >> 4) & 0x3FF;
}

- (NSString)statusString
{
  return self->_statusString;
}

- (NSArray)continuationResponses
{
  return self->_continuationResponses;
}

- (void)setContinuationResponses:(id)a3
{
}

@end
@interface MFSMTPResponse
- (MFSMTPResponse)initWithStatus:(unint64_t)a3;
- (NSArray)continuationResponses;
- (NSString)statusString;
- (id)description;
- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4;
- (id)lastResponseLine;
- (int64_t)failureReason;
- (unint64_t)status;
- (unsigned)statusClass;
- (unsigned)statusDetail;
- (unsigned)statusSubject;
- (void)_updateEnhancedStatusCodesFromLastResponse;
- (void)setContinuationResponses:(id)a3;
- (void)setLastResponseLine:(id)a3;
- (void)setStatus:(unint64_t)a3;
@end

@implementation MFSMTPResponse

- (MFSMTPResponse)initWithStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFSMTPResponse;
  result = [(MFSMTPResponse *)&v5 init];
  if (result)
  {
    result->_status = a3;
    *((_WORD *)result + 13) &= 0xC00Fu;
    *(_WORD *)((char *)result + 25) &= 0xF003u;
    *((_WORD *)result + 12) &= 0xFC00u;
  }
  return result;
}

- (void)setStatus:(unint64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    *((_WORD *)self + 13) &= 0xC00Fu;
    *(_WORD *)((char *)self + 25) &= 0xF003u;
    *((_WORD *)self + 12) &= 0xFC00u;
  }
}

- (void)_updateEnhancedStatusCodesFromLastResponse
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    statusString = self->_statusString;
    self->_statusString = 0;

    uint64_t v5 = [self->_lastResponseLine bytes];
    uint64_t v6 = [self->_lastResponseLine length];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke;
    v18 = &unk_1E5D3C388;
    v19 = self;
    SEL v20 = a2;
    if (_updateEnhancedStatusCodesFromLastResponse_once[0] != -1) {
      dispatch_once(_updateEnhancedStatusCodesFromLastResponse_once, &v15);
    }
    id v7 = [NSString alloc];
    v8 = objc_msgSend(v7, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v5, v6, 1, 0, v15, v16, v17, v18, v19, v20);
    v9 = objc_msgSend((id)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex, "firstMatchInString:options:range:", v8, 0, 0, v6);
    v10 = v9;
    if (v9)
    {
      *((_WORD *)self + 12) = *((_WORD *)self + 12) & 0xFC00 | strtoul((const char *)(v5+ [v9 rangeAtIndex:1]), 0, 10) & 0x3FF;
      *(_WORD *)((char *)self + 25) = (4
                                     * (strtoul((const char *)(v5 + [v10 rangeAtIndex:2]), 0, 10) & 0x3FF)) | *(_WORD *)((char *)self + 25) & 0xF003;
      *((_WORD *)self + 13) = (16
                             * (strtoul((const char *)(v5 + [v10 rangeAtIndex:3]), 0, 10) & 0x3FF)) | *((_WORD *)self + 13) & 0xC00F;
      uint64_t v12 = [v10 rangeAtIndex:5];
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "substringWithRange:", v12, v11);
        v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        v14 = self->_statusString;
        self->_statusString = v13;
      }
    }
    else
    {
      *((_WORD *)self + 13) &= 0xC00Fu;
      *(_WORD *)((char *)self + 25) &= 0xF003u;
      *((_WORD *)self + 12) &= 0xFC00u;
    }
  }
  else
  {
    *((_WORD *)self + 13) &= 0xC00Fu;
    *(_WORD *)((char *)self + 25) &= 0xF003u;
    *((_WORD *)self + 12) &= 0xFC00u;
  }
}

void __60__MFSMTPResponse__updateEnhancedStatusCodesFromLastResponse__block_invoke(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)" options:16 error:0];
  v3 = (void *)_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex;
  _updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex = v2;

  if (!_updateEnhancedStatusCodesFromLastResponse__responseEnhancedStatusCodesRegex)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"SMTPResponse.m", 89, @"Unable to init regular expression from %@", @"^([0-9]+)\\.([0-9]+)\\.([0-9]+)([ ]+)(.*)" object file lineNumber description];
  }
}

- (id)lastResponseLine
{
  return self->_lastResponseLine;
}

- (void)setLastResponseLine:(id)a3
{
  id v5 = a3;
  if (self->_lastResponseLine != v5)
  {
    objc_storeStrong(&self->_lastResponseLine, a3);
    [(MFSMTPResponse *)self _updateEnhancedStatusCodesFromLastResponse];
  }
}

- (int64_t)failureReason
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
  id v4 = &ExtendedStatusCodesTable;
  failureReason_result = (uint64_t)&ExtendedStatusCodesTable;
  while (*v4 != (*((_WORD *)self + 12) & 0x3FF)
       || v4[1] != ((*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF)
       || v4[2] != ((*((unsigned __int16 *)self + 13) >> 4) & 0x3FF))
  {
    if (*((void *)v4 + 1) && lastResponseLine != 0)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:");
      [lastResponseLine rangeOfString:v6 options:1];
      uint64_t v8 = v7;

      id v4 = (__int16 *)failureReason_result;
      if (v8) {
        break;
      }
    }
    v4 += 12;
    failureReason_result = (uint64_t)v4;
    if (v4 >= (__int16 *)off_1E5D40DE0)
    {
      int64_t v9 = -1;
      goto LABEL_17;
    }
  }
  int64_t v9 = *((void *)v4 + 2);
LABEL_17:

  return v9;
}

- (id)errorMessageWithAddress:(id)a3 defaultMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(MFSMTPResponse *)self failureReason];
  if (v8 >= 6)
  {
    id v9 = v7;
  }
  else
  {
    MFLookupLocalizedString(off_1E5D40E20[v8], off_1E5D40E50[v8], off_1E5D40E80[v8]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v6 && v9)
  {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", v9, v6);

    v10 = (void *)v11;
  }

  return v10;
}

- (id)description
{
  if ((*((_WORD *)self + 12) & 0x3FF) != 0) {
    [NSString stringWithFormat:@"%lu (%d.%d.%d) %@", self->_status, *((_WORD *)self + 12) & 0x3FF, (*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF, (*((unsigned __int16 *)self + 13) >> 4) & 0x3FF, self->_statusString];
  }
  else {
  uint64_t v2 = [NSString stringWithFormat:@"%lu %@", self->_status, self->_statusString, v4, v5, v6];
  }
  return v2;
}

- (unint64_t)status
{
  return self->_status;
}

- (unsigned)statusClass
{
  return *((_WORD *)self + 12) & 0x3FF;
}

- (unsigned)statusSubject
{
  return (*(unsigned __int16 *)((char *)self + 25) >> 2) & 0x3FF;
}

- (unsigned)statusDetail
{
  return (*((unsigned __int16 *)self + 13) >> 4) & 0x3FF;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_continuationResponses, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong(&self->_lastResponseLine, 0);
}

@end
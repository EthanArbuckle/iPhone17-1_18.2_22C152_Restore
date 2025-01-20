@interface MFIMAPResponse
- (BOOL)isAlertResponse;
- (BOOL)isResponseWithCode:(int64_t)a3;
- (BOOL)isUntagged;
- (MFIMAPResponse)initWithConnection:(id)a3 responseConsumer:(id)a4;
- (MFIMAPResponse)initWithResponseType:(int64_t)a3;
- (MFIMAPResponse)initWithString:(id)a3;
- (MFIMAPResponseConsumer)responseConsumer;
- (NSArray)privateNamespaces;
- (NSArray)publicNamespaces;
- (NSArray)sharedNamespaces;
- (NSString)description;
- (NSString)ef_publicDescription;
- (id)_descriptionWithFullData:(BOOL)a3;
- (id)capabilities;
- (id)extraAttributes;
- (id)fetchResultWithType:(int64_t)a3;
- (id)fetchResults;
- (id)flags;
- (id)flagsFetchResult;
- (id)keyValuePairs;
- (id)mailboxName;
- (id)parameters;
- (id)quotaRootName;
- (id)quotaRootNames;
- (id)quotas;
- (id)responseInfo;
- (id)responseName;
- (id)searchResults;
- (id)separator;
- (id)serverInfo;
- (id)statusEntries;
- (id)tag;
- (id)uids;
- (id)userData;
- (id)userString;
- (int64_t)responseCode;
- (int64_t)responseType;
- (int64_t)uidFlagsChange;
- (unint64_t)mailboxAttributes;
- (unint64_t)number;
- (void)dealloc;
- (void)fetchResults;
- (void)setCapabilities:(id)a3;
- (void)setFetchResults:(id)a3;
- (void)setFlags:(id)a3;
- (void)setFlagsFetchResult:(id)a3;
- (void)setMailboxAttributes:(unint64_t)a3 separator:(id)a4 mailboxName:(id)a5 extraAttributes:(id)a6;
- (void)setMailboxName:(id)a3 quotaRootNames:(id)a4;
- (void)setMailboxName:(id)a3 statusEntries:(id)a4;
- (void)setNumber:(unint64_t)a3;
- (void)setPrivateNamespaces:(id)a3;
- (void)setPublicNamespaces:(id)a3;
- (void)setQuotaRootName:(id)a3 quotas:(id)a4;
- (void)setResponseConsumer:(id)a3;
- (void)setResponseName:(id)a3 parameters:(id)a4;
- (void)setResponseType:(int64_t)a3;
- (void)setSearchResults:(id)a3;
- (void)setServerInfo:(id)a3;
- (void)setSharedNamespaces:(id)a3;
- (void)setTag:(id)a3;
- (void)setUidFlagsChange:(int64_t)a3;
- (void)setUids:(id)a3;
- (void)setUserData:(id)a3 responseCode:(int64_t)a4 responseInfo:(id)a5;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation MFIMAPResponse

- (int64_t)responseType
{
  return *((char *)self + 8);
}

- (void)setResponseType:(int64_t)a3
{
  *((unsigned char *)self + 8) = a3;
}

- (BOOL)isUntagged
{
  return *((unsigned char *)self + 8) != 1 && self->_tag == 0;
}

- (BOOL)isAlertResponse
{
  return [(MFIMAPResponse *)self isResponseWithCode:1];
}

- (BOOL)isResponseWithCode:(int64_t)a3
{
  return (*((char *)self + 8) - 2) <= 4 && self->_data.basic.responseCode == a3;
}

- (id)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
  self->_tag = (NSString *)a3;
}

- (void)dealloc
{
  uint64_t v3 = 40;
  switch(*((unsigned char *)self + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 0x11:
      goto LABEL_6;
    case 7:
    case 8:
    case 0xC:
    case 0xE:
    case 0x15:
      uint64_t v3 = 32;
      goto LABEL_6;
    case 0xD:
    case 0x12:
    case 0x13:
    case 0x17:
    case 0x18:

      uint64_t v3 = 40;
      goto LABEL_6;
    case 0xF:
    case 0x10:
      goto LABEL_5;
    case 0x16:

LABEL_5:
      uint64_t v3 = 48;
LABEL_6:

      break;
    default:
      break;
  }

  v4.receiver = self;
  v4.super_class = (Class)MFIMAPResponse;
  [(MFIMAPResponse *)&v4 dealloc];
}

- (int64_t)responseCode
{
  if ((*((char *)self + 8) - 1) <= 5) {
    return self->_data.basic.responseCode;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 296, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  return 0;
}

- (id)responseInfo
{
  if ((*((char *)self + 8) - 1) > 5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 316, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  return (id)[responseInfoAndOrUserData objectAtIndex:0];
}

- (id)userData
{
  if ((*((char *)self + 8) - 1) > 5)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 336, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id result = self->_data.basic.responseInfoAndOrUserData;
    if (isKindOfClass)
    {
      return (id)[result objectAtIndex:1];
    }
  }
  return result;
}

- (id)userString
{
  id v2 = [(MFIMAPResponse *)self userData];
  if (v2)
  {
    uint64_t v3 = v2;
    id v2 = (id)MFCreateStringWithData();
    if (!v2) {
      id v2 = (id)CFStringCreateWithBytes(0, (const UInt8 *)[v3 bytes], objc_msgSend(v3, "length"), 0x600u, 0);
    }
  }
  return v2;
}

- (void)setUserData:(id)a3 responseCode:(int64_t)a4 responseInfo:(id)a5
{
  if ((*((char *)self + 8) - 1) > 5)
  {
    [(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:a3, a4, a5), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 373, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]];
    return;
  }
  id v7 = a3;
  self->_data.basic.responseCode = a4;
  if (objc_msgSend(MEMORY[0x1E4F73488], "isValidBase64:")) {
    id v7 = (id)objc_msgSend(v7, "mf_decodeBase64");
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (a5)
  {

    id v9 = objc_allocWithZone(MEMORY[0x1E4F1C978]);
    if (!v7) {
      id v7 = (id)[MEMORY[0x1E4F1C9B8] data];
    }
    id v10 = (id)objc_msgSend(v9, "initWithObjects:", a5, v7, 0);
  }
  else
  {
    if (responseInfoAndOrUserData == v7) {
      return;
    }

    id v10 = v7;
  }
  self->_data.basic.id responseInfoAndOrUserData = v10;
}

- (id)capabilities
{
  if (*((unsigned char *)self + 8) != 7) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 379, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setCapabilities:(id)a3
{
  if (*((unsigned char *)self + 8) != 7) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 384, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (id)serverInfo
{
  int v3 = *((unsigned __int8 *)self + 8);
  if (v3 != 8 && v3 != 21) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 393, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setServerInfo:(id)a3
{
  int v5 = *((unsigned __int8 *)self + 8);
  if (v5 != 8 && v5 != 21) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 398, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (unint64_t)number
{
  int v2 = *((char *)self + 8);
  if ((v2 - 9) < 3 || v2 == 17) {
    return self->_data.number;
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 416, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  return 0;
}

- (void)setNumber:(unint64_t)a3
{
  int v3 = *((char *)self + 8);
  if ((v3 - 9) < 3 || v3 == 17) {
    self->_data.basic.responseCode = a3;
  }
  else {
    [(id)objc_msgSend(MEMORY[0x1E4F28B00] currentHandler:a3), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 433, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]];
  }
}

- (id)flags
{
  if (*((unsigned char *)self + 8) != 12) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 440, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setFlags:(id)a3
{
  if (*((unsigned char *)self + 8) != 12) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 446, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)createFixedMutableArray(a3);
  }
}

- (id)mailboxName
{
  int v3 = *((char *)self + 8);
  if ((v3 - 15) >= 2)
  {
    if (v3 == 13 || v3 == 18) {
      return self->_data.capabilities;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 476, @"%@ is invalid for %s", NSStringFromSelector(a2), ResponseTypeTable[4 * *((char *)self + 8) + 1]);
    return 0;
  }
  if (!self->_data.basic.responseInfoAndOrUserData) {
    return 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id result = self->_data.basic.responseInfoAndOrUserData;
  if (isKindOfClass)
  {
    return (id)[result objectAtIndex:1];
  }
  return result;
}

- (id)statusEntries
{
  if (*((unsigned char *)self + 8) != 13) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 484, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setMailboxName:(id)a3 statusEntries:(id)a4
{
  if (*((unsigned char *)self + 8) != 13) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 489, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    CFIndex v9 = [a4 count];
    if (v9)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, v9, (CFDictionaryRef)a4);
    }
    else if (a4)
    {
      CFMutableDictionaryRef MutableCopy = (CFMutableDictionaryRef)(id)[MEMORY[0x1E4F1C9E8] dictionary];
    }
    else
    {
      CFMutableDictionaryRef MutableCopy = 0;
    }
    self->_data.basic.id responseInfoAndOrUserData = MutableCopy;
  }
}

- (id)searchResults
{
  if (*((unsigned char *)self + 8) != 14) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 502, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setSearchResults:(id)a3
{
  if (*((unsigned char *)self + 8) != 14) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 507, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)createFixedMutableArray(a3);
  }
}

- (unint64_t)mailboxAttributes
{
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 522, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.number;
}

- (id)separator
{
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 527, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  if (!self->_data.basic.responseInfoAndOrUserData) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  return (id)[responseInfoAndOrUserData objectAtIndex:0];
}

- (void)setMailboxAttributes:(unint64_t)a3 separator:(id)a4 mailboxName:(id)a5 extraAttributes:(id)a6
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  if ((unint64_t)(*((char *)self + 8) - 15) >= 2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 536, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  self->_data.basic.responseCode = a3;
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a5)
  {

    if (a4)
    {
      values[0] = a4;
      values[1] = a5;
      CFArrayRef v12 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E4F1D510]);
    }
    else
    {
      CFArrayRef v12 = (CFArrayRef)a5;
    }
    self->_data.basic.id responseInfoAndOrUserData = v12;
  }
  var0 = self->_data.list.var0;
  if (var0 != a6)
  {

    self->_data.fetch.modSeqNumber = (unint64_t)a6;
  }
}

- (id)extraAttributes
{
  return self->_data.list.var0;
}

- (id)fetchResultWithType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [(MFIMAPResponse *)self fetchResults];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    CFIndex v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 type] == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)fetchResults
{
  int v3 = (char *)self + 8;
  if (*((unsigned char *)self + 8) != 17)
  {
    id v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(MFIMAPResponse *)v3 fetchResults];
    }
    if (*v3 != 17) {
      -[MFIMAPResponse fetchResults]();
    }
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setFetchResults:(id)a3
{
  if (*((unsigned char *)self + 8) != 17) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 586, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.id responseInfoAndOrUserData = createFixedMutableArray(a3);
  }
}

- (id)quotaRootNames
{
  if (*((unsigned char *)self + 8) != 18) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 597, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setMailboxName:(id)a3 quotaRootNames:(id)a4
{
  if (*((unsigned char *)self + 8) != 18) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 603, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.id responseInfoAndOrUserData = createFixedMutableArray(a4);
  }
}

- (id)quotaRootName
{
  if (*((unsigned char *)self + 8) != 19) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 618, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (id)quotas
{
  if (*((unsigned char *)self + 8) != 19) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 624, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setQuotaRootName:(id)a3 quotas:(id)a4
{
  if (*((unsigned char *)self + 8) != 19) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 630, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.id responseInfoAndOrUserData = createFixedMutableArray(a4);
  }
}

- (int64_t)uidFlagsChange
{
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 644, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return -(uint64_t)(*(unsigned char *)(&self->_data.other + 1) & 1);
}

- (void)setUidFlagsChange:(int64_t)a3
{
  char v3 = a3;
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 650, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  *((unsigned char *)&self->_data.other + 16) = *(unsigned char *)(&self->_data.other + 1) & 0xFE | v3 & 1;
}

- (id)uids
{
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 656, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setUids:(id)a3
{
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 662, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (id)flagsFetchResult
{
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 670, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setFlagsFetchResult:(id)a3
{
  if (*((unsigned char *)self + 8) != 24) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 675, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.id responseInfoAndOrUserData = a3;
  }
}

- (NSArray)privateNamespaces
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 685, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (void)setPrivateNamespaces:(id)a3
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 690, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
}

- (NSArray)publicNamespaces
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 699, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.fetch.items;
}

- (void)setPublicNamespaces:(id)a3
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 704, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a3)
  {

    self->_data.basic.id responseInfoAndOrUserData = a3;
  }
}

- (NSArray)sharedNamespaces
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 713, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.list.var0;
}

- (void)setSharedNamespaces:(id)a3
{
  if (*((unsigned char *)self + 8) != 22) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 718, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  var0 = self->_data.list.var0;
  if (var0 != a3)
  {

    self->_data.fetch.modSeqNumber = (unint64_t)a3;
  }
}

- (id)responseName
{
  if (*((unsigned char *)self + 8) != 23) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 728, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.capabilities;
}

- (id)parameters
{
  if (*((unsigned char *)self + 8) != 23) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 734, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  return self->_data.basic.responseInfoAndOrUserData;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  keyValuePairs = self->_keyValuePairs;
  if (!keyValuePairs)
  {
    keyValuePairs = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_keyValuePairs = keyValuePairs;
  }
  [(NSDictionary *)keyValuePairs setValue:a3 forKey:a4];
}

- (id)keyValuePairs
{
  int v2 = self->_keyValuePairs;
  return v2;
}

- (void)setResponseName:(id)a3 parameters:(id)a4
{
  if (*((unsigned char *)self + 8) != 23) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFIMAPResponse.m", 750, @"%@ is invalid for response type %d", NSStringFromSelector(a2), *((char *)self + 8));
  }
  capabilities = self->_data.capabilities;
  if (capabilities != a3)
  {

    self->_data.basic.responseCode = (int64_t)a3;
  }
  id responseInfoAndOrUserData = self->_data.basic.responseInfoAndOrUserData;
  if (responseInfoAndOrUserData != a4)
  {

    self->_data.basic.id responseInfoAndOrUserData = a4;
  }
}

- (NSString)ef_publicDescription
{
  return (NSString *)[(MFIMAPResponse *)self _descriptionWithFullData:0];
}

- (NSString)description
{
  return (NSString *)[(MFIMAPResponse *)self _descriptionWithFullData:1];
}

- (id)_descriptionWithFullData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28E78] string];
  if ([(MFIMAPResponse *)self isUntagged]) {
    [v5 appendString:@"* "];
  }
  if (self->_tag)
  {
    objc_msgSend(v5, "appendString:");
    [v5 appendString:@" "];
  }
  objc_msgSend(v5, "appendFormat:", @"%s ", ResponseTypeTable[4 * *((char *)self + 8) + 1]);
  v72 = v5;
  switch(*((unsigned char *)self + 8))
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      int64_t v6 = [(MFIMAPResponse *)self responseCode];
      uint64_t v7 = ResponseCodeTable[v6];
      id v8 = [(MFIMAPResponse *)self responseInfo];
      CFIndex v9 = [(MFIMAPResponse *)self userString];
      if (v6 || v8)
      {
        [v5 appendString:@"["];
        if (v6) {
          objc_msgSend(v5, "appendFormat:", @"%s", v7);
        }
        if (v8)
        {
          [v5 appendString:@" "];
          objc_msgSend(v5, "appendString:", objc_msgSend(v8, "description"));
        }
        [v5 appendString:@"]"];
      }
      if (((unint64_t)(v6 - 15) < 2 || v3) && [(__CFString *)v9 length])
      {
        [v5 appendString:@" "];
        id v10 = v5;
        long long v11 = v9;
        goto LABEL_97;
      }
      return v5;
    case 7:
      id v23 = [(MFIMAPResponse *)self capabilities];
      goto LABEL_82;
    case 8:
    case 0x15:
      id v12 = [(MFIMAPResponse *)self serverInfo];
      long long v13 = (void *)[v12 allKeys];
      uint64_t v14 = [v13 count];
      objc_msgSend(v5, "appendString:", @"(");
      if (v14)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          uint64_t v16 = [v13 objectAtIndex:i];
          if (i) {
            [v5 appendString:@" "];
          }
          [v5 appendFormat:@"%@ %@", v16, objc_msgSend(v12, "objectForKey:", v16)];
        }
      }
      goto LABEL_95;
    case 9:
    case 0xA:
    case 0xB:
      objc_msgSend(v5, "appendFormat:", @"%llu", -[MFIMAPResponse number](self, "number"), v68, v69, v70);
      return v5;
    case 0xC:
      [v5 appendFormat:@"(%@)", objc_msgSend(-[MFIMAPResponse flags](self, "flags"), "componentsJoinedByString:", @" ", v68, v69, v70];
      return v5;
    case 0xD:
      id v24 = [(MFIMAPResponse *)self statusEntries];
      v25 = (void *)[v24 allKeys];
      uint64_t v26 = [v25 count];
      if (v3) {
        id v27 = [(MFIMAPResponse *)self mailboxName];
      }
      else {
        id v27 = (id)objc_msgSend(MEMORY[0x1E4F60E00], "partiallyRedactedStringForString:", -[MFIMAPResponse mailboxName](self, "mailboxName"));
      }
      [v5 appendFormat:@"\"%@\"", v27];
      objc_msgSend(v5, "appendString:", @" (");
      if (v26)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          uint64_t v65 = [v25 objectAtIndex:j];
          if (j) {
            [v5 appendString:@" "];
          }
          [v5 appendFormat:@"%@ %@", v65, objc_msgSend(v24, "objectForKey:", v65)];
        }
      }
      goto LABEL_95;
    case 0xE:
      [v5 appendFormat:@"%@", -[MFIMAPResponse searchResults](self, "searchResults"), v68, v69, v70];
      return v5;
    case 0xF:
    case 0x10:
      if (v3)
      {
        id v17 = [(MFIMAPResponse *)self separator];
        id v18 = [(MFIMAPResponse *)self mailboxName];
        unint64_t v19 = [(MFIMAPResponse *)self mailboxAttributes];
        v20 = 0;
        v21 = (id *)&IMAPMailboxAttributeEntries;
        do
        {
          unint64_t v22 = (unint64_t)v21[1];
          if ((v22 & v19) != 0
            && (v22 != 2 || ([*v21 isEqualToString:@"\\NonExistent"] & 1) == 0))
          {
            if (v20) {
              [(__CFString *)v20 appendString:@" "];
            }
            else {
              v20 = (__CFString *)objc_msgSend(@"("), "mutableCopy";
            }
            [(__CFString *)v20 appendString:*v21];
          }
          v21 += 2;
        }
        while (v21 < &__block_descriptor_40_e8_32o_e25___NSURL_16__0__NSString_8ls32l8);
        if (v20) {
          [(__CFString *)v20 appendString:@""]);
        }
        else {
          v20 = @"()";
        }
        [v5 appendString:v20];

        [v5 appendString:@" "];
        if (v17) {
          [v5 appendFormat:@"\"%@\"", v17];
        }
        else {
          [v5 appendString:@"NIL"];
        }
        [v5 appendString:@" "];
        [v5 appendFormat:@"\"%@\"", v18];
        id v66 = [(MFIMAPResponse *)self extraAttributes];
        if ([v66 count]) {
          [v5 appendFormat:@" ==> (%@)", objc_msgSend(v66, "componentsJoinedByString:", @", "), v68, v69, v70];
        }
      }
      return v5;
    case 0x11:
      id v28 = [(MFIMAPResponse *)self fetchResults];
      uint64_t v29 = [v28 count];
      objc_msgSend(v5, "appendString:", @"(");
      if (v29)
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          v31 = (void *)[v28 objectAtIndex:k];
          if (k) {
            [v5 appendString:@" "];
          }
          objc_msgSend(v5, "appendString:", objc_msgSend(v31, "description"));
        }
      }
LABEL_95:
      long long v11 = @"");
      goto LABEL_96;
    case 0x12:
      v32 = [(MFIMAPResponse *)self mailboxName];
      id v33 = [(MFIMAPResponse *)self quotaRootNames];
      v34 = @"NIL";
      if (v32) {
        v34 = v32;
      }
      [v5 appendFormat:@"\"%@\"", v34];
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v35 = [v33 countByEnumeratingWithState:&v81 objects:v86 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v82;
        do
        {
          for (uint64_t m = 0; m != v36; ++m)
          {
            if (*(void *)v82 != v37) {
              objc_enumerationMutation(v33);
            }
            [v5 appendFormat:@" \"%@\"", *(void *)(*((void *)&v81 + 1) + 8 * m)];
          }
          uint64_t v36 = [v33 countByEnumeratingWithState:&v81 objects:v86 count:16];
        }
        while (v36);
      }
      return v5;
    case 0x13:
      id v39 = [(MFIMAPResponse *)self quotas];
      [v5 appendFormat:@"\"%@\", -[MFIMAPResponse quotaRootName](self, "quotaRootName"")];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      obuint64_t j = v39;
      uint64_t v40 = [v39 countByEnumeratingWithState:&v77 objects:v85 count:16];
      if (v40)
      {
        uint64_t v41 = v40;
        uint64_t v42 = *(void *)v78;
        do
        {
          for (uint64_t n = 0; n != v41; ++n)
          {
            if (*(void *)v78 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = *(void **)(*((void *)&v77 + 1) + 8 * n);
            uint64_t v45 = [v44 objectForKey:@"_IMAPNameQuotaKey"];
            uint64_t v46 = [v44 objectForKey:@"_IMAPCurrentUsageQuotaKey"];
            uint64_t v47 = [v44 objectForKey:@"_IMAPMaxUsageQuotaKey"];
            if (v45) {
              v48 = (__CFString *)v45;
            }
            else {
              v48 = @"NIL";
            }
            if (v46) {
              v49 = (__CFString *)v46;
            }
            else {
              v49 = @"0";
            }
            if (v47) {
              v50 = (__CFString *)v47;
            }
            else {
              v50 = @"0";
            }
            uint64_t v5 = v72;
            [v72 appendFormat:@" (%@ %@/%@)", v48, v49, v50];
          }
          uint64_t v41 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
        }
        while (v41);
      }
      return v5;
    case 0x14:
      id v51 = [(MFIMAPResponse *)self keyValuePairs];
      uint64_t v52 = [v51 objectForKeyedSubscript:@"IMAPESearchTagKey"];
      if ([v51 objectForKeyedSubscript:@"IMAPESearchAllKey"])
      {
        v53 = (void *)[v51 objectForKeyedSubscript:@"IMAPESearchAllKey"];
        [v5 appendFormat:@" TAG (\"%@\", lowest = %lu, highest = %lu)"), v52, objc_msgSend(v53, "count"), objc_msgSend(v53, "firstIndex"), objc_msgSend(v53, "lastIndex")];
      }
      else if ([v51 objectForKeyedSubscript:@"IMAPESearchMaxKey"])
      {
        [v5 appendFormat:@" TAG (\"%@\", v52, objc_msgSend(v51, "objectForKeyedSubscript:", @"IMAPESearchMaxKey"", v69, v70];
      }
      else if ([v51 objectForKeyedSubscript:@"IMAPESearchMinKey"])
      {
        [v5 appendFormat:@" TAG (\"%@\", v52, objc_msgSend(v51, "objectForKeyedSubscript:", @"IMAPESearchMinKey"", v69, v70];
      }
      else if ([v51 objectForKeyedSubscript:@"IMAPESearchCountKey"])
      {
        [v5 appendFormat:@" TAG (\"%@\", v52, objc_msgSend(v51, "objectForKeyedSubscript:", @"IMAPESearchCountKey"", v69, v70];
      }
      return v5;
    case 0x16:
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v74 = __43__MFIMAPResponse__descriptionWithFullData___block_invoke;
      v75 = &unk_1E5D3EA60;
      v76 = v5;
      __43__MFIMAPResponse__descriptionWithFullData___block_invoke((uint64_t)v73, [(MFIMAPResponse *)self privateNamespaces]);
      [v5 appendString:@" "];
      v54 = [(MFIMAPResponse *)self publicNamespaces];
      v74((uint64_t)v73, v54);
      [v5 appendString:@" "];
      v55 = [(MFIMAPResponse *)self sharedNamespaces];
      v74((uint64_t)v73, v55);
      return v5;
    case 0x17:
      id v56 = [(MFIMAPResponse *)self responseName];
      id v57 = [(MFIMAPResponse *)self parameters];
      if (v56)
      {
        [v5 appendString:@" "];
        [v5 appendString:v56];
      }
      if (!v3 || !v57) {
        return v5;
      }
      [v5 appendString:@" "];
      id v23 = v57;
LABEL_82:
      long long v11 = (__CFString *)[v23 componentsJoinedByString:@" "];
LABEL_96:
      id v10 = v5;
LABEL_97:
      [v10 appendString:v11];
      return v5;
    case 0x18:
      int64_t v58 = [(MFIMAPResponse *)self uidFlagsChange];
      v59 = [(MFIMAPResponse *)self uids];
      id v60 = [(MFIMAPResponse *)self flagsFetchResult];
      v61 = @"*nil*";
      if (v59) {
        v62 = v59;
      }
      else {
        v62 = @"*nil*";
      }
      uint64_t v63 = byte_1A8AC64F0[v58];
      if (v60) {
        v61 = (__CFString *)[v60 description];
      }
      [v5 appendFormat:@" %@ %c%@", v62, v63, v61, v70];
      return v5;
    default:
      return v5;
  }
}

uint64_t __43__MFIMAPResponse__descriptionWithFullData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "appendString:", @"(");
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(a2);
          }
          CFIndex v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v10 = [v9 objectForKeyedSubscript:@"_IMAPNamespacePrefixKey"];
          uint64_t v11 = [v9 objectForKeyedSubscript:@"_IMAPNamespaceDelimiterKey"];
          id v12 = (void *)[v9 objectForKeyedSubscript:@"_IMAPNamespaceExtensionsKey"];
          objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"(\"%@\" "), v10;
          long long v13 = *(void **)(a1 + 32);
          if (v11) {
            [v13 appendFormat:@"\"%@\"", v11];
          }
          else {
            [v13 appendString:@"NIL"];
          }
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __43__MFIMAPResponse__descriptionWithFullData___block_invoke_2;
          v15[3] = &unk_1E5D3EA38;
          v15[4] = *(void *)(a1 + 32);
          [v12 enumerateKeysAndObjectsUsingBlock:v15];
          [*(id *)(a1 + 32) appendString:@""]);
        }
        uint64_t v6 = [a2 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
    return [*(id *)(a1 + 32) appendString:@""]);
  }
  else
  {
    return [v3 appendString:@"NIL"];
  }
}

uint64_t __43__MFIMAPResponse__descriptionWithFullData___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [*(id *)(a1 + 32) appendFormat:@" \"%@\" (\"%@\", a2, objc_msgSend(a3, "componentsJoinedByString:", @"\" \"];
}

- (MFIMAPResponse)initWithConnection:(id)a3 responseConsumer:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MFIMAPResponse;
  uint64_t v6 = [(MFIMAPResponse *)&v12 init];
  if (!v6) {
    return 0;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [(MFIMAPResponse *)v6 setResponseConsumer:a4];
  id v8 = (void *)[a3 _readDataOfLength:-1];
  if (!v8
    || ((CFIndex v9 = -[MFIMAPParseContext initWithConnection:response:start:end:]([MFIMAPParseContext alloc], "initWithConnection:response:start:end:", a3, v6, [v8 bytes], objc_msgSend(v8, "bytes") + objc_msgSend(v8, "length")), response(v9), !-[MFIMAPParseContext isValid](v9, "isValid"))? (v10 = 0): (v10 = v6), v9, !v10))
  {

    uint64_t v10 = 0;
  }

  return v10;
}

- (MFIMAPResponse)initWithString:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)MFIMAPResponse;
  id v4 = [(MFIMAPResponse *)&v10 init];
  if (!v4) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  uint64_t v6 = [a3 UTF8String];
  id v7 = -[MFIMAPParseContext initWithConnection:response:start:end:]([MFIMAPParseContext alloc], "initWithConnection:response:start:end:", 0, v4, v6, v6 + [a3 length]);
  response(v7);
  if ([(MFIMAPParseContext *)v7 isValid]) {
    id v8 = v4;
  }
  else {
    id v8 = 0;
  }

  if (!v8) {
  return v8;
  }
}

- (MFIMAPResponse)initWithResponseType:(int64_t)a3
{
  char v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFIMAPResponse;
  id result = [(MFIMAPResponse *)&v5 init];
  if (result) {
    *((unsigned char *)result + 8) = v3;
  }
  return result;
}

- (MFIMAPResponseConsumer)responseConsumer
{
  return self->_responseConsumer;
}

- (void)setResponseConsumer:(id)a3
{
}

- (void)fetchResults
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "Invalid for response type %d", (uint8_t *)v3, 8u);
}

@end
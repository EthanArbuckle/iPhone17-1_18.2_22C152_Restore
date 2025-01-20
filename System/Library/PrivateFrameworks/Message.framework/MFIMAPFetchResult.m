@interface MFIMAPFetchResult
- (MFIMAPFetchResult)initWithType:(int64_t)a3;
- (id)appleRemoteLinks;
- (id)bodyStructure;
- (id)customFlagsArray;
- (id)description;
- (id)envelope;
- (id)fetchData;
- (id)flagsArray;
- (id)internalDate;
- (id)section;
- (int64_t)type;
- (unint64_t)messageFlags;
- (unint64_t)messageSize;
- (unint64_t)modSequenceNumber;
- (unint64_t)startOffset;
- (unint64_t)uniqueRemoteId;
- (unsigned)encoding;
- (unsigned)uid;
- (void)dealloc;
- (void)setAppleRemoteLinks:(id)a3;
- (void)setBodyStructure:(id)a3;
- (void)setCustomFlagsArray:(id)a3;
- (void)setEnvelope:(id)a3;
- (void)setFetchData:(id)a3;
- (void)setFlagsArray:(id)a3;
- (void)setInternalDate:(id)a3;
- (void)setMessageFlags:(unint64_t)a3;
- (void)setMessageSize:(unint64_t)a3;
- (void)setModSequenceNumber:(unint64_t)a3;
- (void)setSection:(id)a3;
- (void)setStartOffset:(unint64_t)a3;
- (void)setUid:(unsigned int)a3;
- (void)setUniqueRemoteId:(unint64_t)a3;
@end

@implementation MFIMAPFetchResult

- (MFIMAPFetchResult)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MFIMAPFetchResult;
  result = [(MFIMAPFetchResult *)&v5 init];
  if (result) {
    result->_itemType = a3;
  }
  return result;
}

- (void)dealloc
{
  unint64_t itemType = self->_itemType;
  if (itemType <= 0xC)
  {
    if (((1 << itemType) & 0x1046) != 0)
    {
      uint64_t v4 = 24;
      goto LABEL_8;
    }
    if (((1 << itemType) & 0xB0) != 0)
    {

      uint64_t v4 = 40;
      goto LABEL_8;
    }
    if (((1 << itemType) & 0x700) != 0)
    {
      uint64_t v4 = 32;
LABEL_8:
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MFIMAPFetchResult;
  [(MFIMAPFetchResult *)&v5 dealloc];
}

- (int64_t)type
{
  return self->_itemType;
}

- (id)envelope
{
  if (self->_itemType != 1)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult envelope]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 96, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.envelope;
}

- (void)setEnvelope:(id)a3
{
  if (self->_itemType != 1)
  {
    v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setEnvelope:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 102, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (id)internalDate
{
  if (self->_itemType != 2)
  {
    uint64_t v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult internalDate]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 112, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.envelope;
}

- (void)setInternalDate:(id)a3
{
  if (self->_itemType != 2)
  {
    v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setInternalDate:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 118, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (id)fetchData
{
  unint64_t itemType = self->_itemType;
  BOOL v4 = itemType > 7;
  uint64_t v5 = (1 << itemType) & 0xB0;
  if (!v4 && v5 != 0) {
    return self->_typeSpecific.bodySectionInfo.sectionData;
  }
  v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult fetchData]"];
  [v8 handleFailureInFunction:v9, @"MFIMAPFetchResult.m", 135, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  return 0;
}

- (void)setFetchData:(id)a3
{
  unint64_t itemType = self->_itemType;
  BOOL v5 = itemType > 7;
  uint64_t v6 = (1 << itemType) & 0xB0;
  if (v5 || v6 == 0)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    uint64_t v11 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setFetchData:]"];
    [v10 handleFailureInFunction:v11, @"MFIMAPFetchResult.m", 151, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  else
  {
    sectionData = self->_typeSpecific.bodySectionInfo.sectionData;
    if (sectionData != a3)
    {

      self->_typeSpecific.bodySectionInfo.sectionData = (NSData *)a3;
    }
  }
}

- (unint64_t)messageSize
{
  if (self->_itemType != 3)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult messageSize]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 157, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.messageSize;
}

- (void)setMessageSize:(unint64_t)a3
{
  if (self->_itemType != 3)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setMessageSize:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 161, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.messageSize = a3;
}

- (id)bodyStructure
{
  if (self->_itemType != 6)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult bodyStructure]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 166, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.envelope;
}

- (void)setBodyStructure:(id)a3
{
  if (self->_itemType != 6)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setBodyStructure:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 172, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unint64_t)startOffset
{
  unint64_t itemType = self->_itemType;
  BOOL v4 = itemType > 7;
  uint64_t v5 = (1 << itemType) & 0xB0;
  if (!v4 && v5 != 0) {
    return self->_typeSpecific.bodySectionInfo.startOffset;
  }
  v8 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult startOffset]"];
  [v8 handleFailureInFunction:v9, @"MFIMAPFetchResult.m", 189, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  return 0;
}

- (void)setStartOffset:(unint64_t)a3
{
  if (self->_itemType != 7)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setStartOffset:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 197, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.bodySectionInfo.startOffset = a3;
}

- (id)section
{
  int64_t itemType = self->_itemType;
  switch(itemType)
  {
    case 4:
      return @"HEADER";
    case 7:
      return self->_typeSpecific.envelope;
    case 5:
      return @"TEXT";
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult section]"];
  [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 214, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  return 0;
}

- (void)setSection:(id)a3
{
  if (self->_itemType != 7)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setSection:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 221, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unsigned)uid
{
  if (self->_itemType != 8)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult uid]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 230, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.uid;
}

- (void)setUid:(unsigned int)a3
{
  if (self->_itemType != 8)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setUid:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 235, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.uid = a3;
}

- (unint64_t)uniqueRemoteId
{
  if (self->_itemType != 9)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult uniqueRemoteId]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 241, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.messageSize;
}

- (void)setUniqueRemoteId:(unint64_t)a3
{
  if (self->_itemType != 9)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setUniqueRemoteId:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 246, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.messageSize = a3;
}

- (id)flagsArray
{
  if (self->_itemType != 10)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult flagsArray]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 252, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  v3 = (void *)MFCreateArrayForMessageFlags((uint64_t)self->_typeSpecific.envelope, 1);
  return v3;
}

- (void)setFlagsArray:(id)a3
{
  if (self->_itemType != 10)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setFlagsArray:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 258, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.messageSize = MFMessageFlagsFromArray(a3);
}

- (void)setMessageFlags:(unint64_t)a3
{
  if (self->_itemType != 10)
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setMessageFlags:]"];
    [v5 handleFailureInFunction:v6, @"MFIMAPFetchResult.m", 263, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  self->_typeSpecific.messageSize = a3;
}

- (unint64_t)messageFlags
{
  return self->_typeSpecific.messageSize;
}

- (void)setCustomFlagsArray:(id)a3
{
  if (self->_itemType != 10)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setCustomFlagsArray:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 272, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  id v5 = a3;

  self->_typeSpecific.bodySectionInfo.startOffset = (unint64_t)a3;
}

- (id)customFlagsArray
{
  if (self->_itemType != 10)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult customFlagsArray]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 279, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.flags.customFlags;
}

- (unint64_t)modSequenceNumber
{
  return self->_modSequenceNumber;
}

- (void)setModSequenceNumber:(unint64_t)a3
{
  self->_modSequenceNumber = a3;
}

- (id)appleRemoteLinks
{
  if (self->_itemType != 12)
  {
    BOOL v4 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult appleRemoteLinks]"];
    [v4 handleFailureInFunction:v5, @"MFIMAPFetchResult.m", 292, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  return self->_typeSpecific.envelope;
}

- (void)setAppleRemoteLinks:(id)a3
{
  if (self->_itemType != 12)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[MFIMAPFetchResult setAppleRemoteLinks:]"];
    [v6 handleFailureInFunction:v7, @"MFIMAPFetchResult.m", 298, @"Invalid item type %@", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", self->_itemType) file lineNumber description];
  }
  envelope = self->_typeSpecific.envelope;
  if (envelope != a3)
  {

    self->_typeSpecific.messageSize = (unint64_t)a3;
  }
}

- (unsigned)encoding
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFIMAPFetchResult *)self flagsArray];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v3) {
    return -1;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)v13;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v13 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
    if (v7)
    {
      uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v6) rangeOfString:0x1EFF1EE28 options:9];
      if (v9)
      {
        uint64_t v10 = v8 + v9;
        if (v8 + v9 < (unint64_t)[v7 length])
        {
          [v7 substringFromIndex:v10];
          unsigned int result = MFEncodingForCharset();
          if (result != -1) {
            return result;
          }
        }
      }
    }
    if (v4 == ++v6)
    {
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return -1;
    }
  }
}

- (id)description
{
  int64_t itemType = self->_itemType;
  id result = @"* INVALID *";
  switch(itemType)
  {
    case 0:
      return result;
    case 1:
      uint64_t v9 = NSString;
      uint64_t v17 = [(MFIMAPFetchResult *)self envelope];
      uint64_t v10 = @"ENVELOPE %@";
      goto LABEL_20;
    case 2:
      uint64_t v11 = NSString;
      uint64_t v10 = @"INTERNALDATE";
      goto LABEL_21;
    case 3:
      uint64_t v9 = NSString;
      uint64_t v17 = [(MFIMAPFetchResult *)self messageSize];
      uint64_t v10 = @"RFC822.SIZE %u";
      goto LABEL_20;
    case 4:
    case 5:
    case 7:
      uint64_t v5 = [(MFIMAPFetchResult *)self section];
      unint64_t v6 = [(MFIMAPFetchResult *)self startOffset];
      uint64_t v7 = objc_msgSend(-[MFIMAPFetchResult fetchData](self, "fetchData"), "length");
      uint64_t v8 = &stru_1EFF11268;
      if (v5) {
        uint64_t v8 = v5;
      }
      if (v6) {
        id result = (id)[NSString stringWithFormat:@"BODY[%@]<%lu> {%lu}...", v8, v6, v7];
      }
      else {
        id result = (id)[NSString stringWithFormat:@"BODY[%@] {%lu}...", v8, v7, v19];
      }
      goto LABEL_22;
    case 6:
      uint64_t v9 = NSString;
      uint64_t v17 = (id)CFCopyDescription([(MFIMAPFetchResult *)self bodyStructure]);
      uint64_t v10 = @"BODYSTRUCTURE %@";
      goto LABEL_20;
    case 8:
      uint64_t v9 = NSString;
      uint64_t v17 = [(MFIMAPFetchResult *)self uid];
      uint64_t v10 = @"UID %u";
      goto LABEL_20;
    case 9:
      uint64_t v9 = NSString;
      uint64_t v17 = [(MFIMAPFetchResult *)self uniqueRemoteId];
      uint64_t v10 = @"X-GM-MSGID %llu";
      goto LABEL_20;
    case 10:
      id v12 = [(MFIMAPFetchResult *)self customFlagsArray];
      uint64_t v9 = NSString;
      long long v13 = @" ";
      uint64_t v14 = objc_msgSend(-[MFIMAPFetchResult flagsArray](self, "flagsArray"), "componentsJoinedByString:", @" ");
      long long v15 = &stru_1EFF11268;
      if (![v12 count]) {
        long long v13 = &stru_1EFF11268;
      }
      if ([v12 count]) {
        long long v15 = (__CFString *)[v12 componentsJoinedByString:@" "];
      }
      v18 = v13;
      v19 = v15;
      uint64_t v17 = v14;
      uint64_t v10 = @"FLAGS (%@%@%@)";
      goto LABEL_20;
    case 11:
      id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"MODSEQ %d", 0, v18, v19);
      goto LABEL_22;
    case 12:
      v16 = objc_msgSend(-[MFIMAPFetchResult appleRemoteLinks](self, "appleRemoteLinks"), "ef_map:", &__block_literal_global_34);
      uint64_t v9 = NSString;
      uint64_t v17 = [v16 componentsJoinedByString:@", "];
      uint64_t v10 = @"X-APPLE-REMOTE-LINKS (%@)";
LABEL_20:
      uint64_t v11 = v9;
LABEL_21:
      id result = (id)objc_msgSend(v11, "stringWithFormat:", v10, v17, v18, v19);
LABEL_22:
      if (!result) {
        goto LABEL_23;
      }
      return result;
    default:
LABEL_23:
      v20.receiver = self;
      v20.super_class = (Class)MFIMAPFetchResult;
      return [(MFIMAPFetchResult *)&v20 description];
  }
}

uint64_t __32__MFIMAPFetchResult_description__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F60E00];
  uint64_t v3 = [a2 absoluteString];
  return [v2 fullyRedactedStringForString:v3];
}

@end
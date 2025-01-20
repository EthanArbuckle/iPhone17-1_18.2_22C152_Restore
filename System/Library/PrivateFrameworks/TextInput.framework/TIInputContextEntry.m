@interface TIInputContextEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (NSDate)timestamp;
- (NSPersonNameComponents)senderName;
- (NSSet)primaryRecipientIdentifiers;
- (NSSet)secondaryRecipientIdentifiers;
- (NSString)entryIdentifier;
- (NSString)senderIdentifier;
- (NSString)spotlightCacheKey;
- (NSString)text;
- (NSString)threadIdentifier;
- (TIInputContextEntry)init;
- (TIInputContextEntry)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)entryType;
- (void)encodeWithCoder:(id)a3;
- (void)enforceMaxContextLength:(unint64_t)a3;
- (void)setEntryIdentifier:(id)a3;
- (void)setEntryType:(int64_t)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setPrimaryRecipientIdentifiers:(id)a3;
- (void)setSecondaryRecipientIdentifiers:(id)a3;
- (void)setSenderIdentifier:(id)a3;
- (void)setSenderName:(id)a3;
- (void)setSpotlightCacheKey:(id)a3;
- (void)setText:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation TIInputContextEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spotlightCacheKey, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_primaryRecipientIdentifiers, 0);
  objc_storeStrong((id *)&self->_entryIdentifier, 0);
  objc_storeStrong((id *)&self->_senderName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TIInputContextEntry *)self text];
  BOOL v7 = [v6 length] != 0;
  v8 = [(TIInputContextEntry *)self senderIdentifier];
  BOOL v9 = [v8 length] != 0;
  v10 = [(TIInputContextEntry *)self senderName];
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[TIInputContextEntry isFromMe](self, "isFromMe"));
  v12 = [v3 stringWithFormat:@"<%@: %p: hasText: %d, hasSenderID: %d, hasName: %d>, isFromMe: %@", v5, self, v7, v9, v10 != 0, v11];

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_text copy];
  v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_senderIdentifier copy];
  v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSDate *)self->_timestamp copy];
  v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSPersonNameComponents *)self->_senderName copy];
  v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  uint64_t v13 = [(NSString *)self->_entryIdentifier copy];
  v14 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v13;

  uint64_t v15 = [(NSSet *)self->_primaryRecipientIdentifiers copy];
  v16 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v15;

  uint64_t v17 = [(NSSet *)self->_secondaryRecipientIdentifiers copy];
  v18 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v17;

  *(void *)(v4 + 72) = self->_entryType;
  uint64_t v19 = [(NSString *)self->_threadIdentifier copy];
  v20 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v19;

  uint64_t v21 = [(NSString *)self->_spotlightCacheKey copy];
  v22 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v21;

  *(unsigned char *)(v4 + 8) = self->_isFromMe;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    BOOL v5 = [(TIInputContextEntry *)self compare:v4] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  timestamp = self->_timestamp;
  uint64_t v6 = [v4 timestamp];
  uint64_t v7 = (void *)v6;
  if (timestamp) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (v6) {
      int64_t v9 = -1;
    }
    else {
      int64_t v9 = 0;
    }
    if (timestamp) {
      goto LABEL_34;
    }
  }
  else
  {
    int64_t v9 = [(NSDate *)timestamp compare:v6];
  }

  if (!v9)
  {
    senderIdentifier = self->_senderIdentifier;
    uint64_t v11 = [v4 senderIdentifier];
    uint64_t v7 = (void *)v11;
    if (senderIdentifier && v11)
    {
      int64_t v9 = [(NSString *)senderIdentifier compare:v11];
    }
    else
    {
      if (v11) {
        int64_t v9 = -1;
      }
      else {
        int64_t v9 = 0;
      }
      if (senderIdentifier) {
        goto LABEL_34;
      }
    }

    if (!v9)
    {
      threadIdentifier = self->_threadIdentifier;
      uint64_t v13 = [v4 threadIdentifier];
      uint64_t v7 = (void *)v13;
      if (threadIdentifier && v13)
      {
        int64_t v9 = [(NSString *)threadIdentifier compare:v13];
      }
      else
      {
        if (v13) {
          int64_t v9 = -1;
        }
        else {
          int64_t v9 = 0;
        }
        if (threadIdentifier) {
          goto LABEL_34;
        }
      }

      if (!v9)
      {
        spotlightCacheKey = self->_spotlightCacheKey;
        uint64_t v15 = [v4 spotlightCacheKey];
        uint64_t v7 = (void *)v15;
        if (spotlightCacheKey && v15)
        {
          int64_t v9 = [(NSString *)spotlightCacheKey compare:v15];
LABEL_37:

          if (v9) {
            goto LABEL_36;
          }
          int isFromMe = self->_isFromMe;
          if (isFromMe != [v4 isFromMe])
          {
            int64_t v9 = -1;
            goto LABEL_36;
          }
          text = self->_text;
          uint64_t v19 = [v4 text];
          uint64_t v7 = (void *)v19;
          if (text && v19)
          {
            int64_t v9 = [(NSString *)text compare:v19];
          }
          else
          {
            if (v19) {
              uint64_t v20 = -1;
            }
            else {
              uint64_t v20 = 0;
            }
            if (text) {
              int64_t v9 = 1;
            }
            else {
              int64_t v9 = v20;
            }
          }
          goto LABEL_35;
        }
        if (v15) {
          int64_t v9 = -1;
        }
        else {
          int64_t v9 = 0;
        }
        if (!spotlightCacheKey) {
          goto LABEL_37;
        }
LABEL_34:
        int64_t v9 = 1;
LABEL_35:
      }
    }
  }
LABEL_36:

  return v9;
}

- (void)setSpotlightCacheKey:(id)a3
{
}

- (NSString)spotlightCacheKey
{
  return self->_spotlightCacheKey;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setEntryType:(int64_t)a3
{
  self->_entryType = a3;
}

- (int64_t)entryType
{
  return self->_entryType;
}

- (NSPersonNameComponents)senderName
{
  return self->_senderName;
}

- (void)setSenderName:(id)a3
{
}

- (NSSet)secondaryRecipientIdentifiers
{
  return self->_secondaryRecipientIdentifiers;
}

- (void)setSecondaryRecipientIdentifiers:(id)a3
{
}

- (NSSet)primaryRecipientIdentifiers
{
  return self->_primaryRecipientIdentifiers;
}

- (void)setPrimaryRecipientIdentifiers:(id)a3
{
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)entryIdentifier
{
  return self->_entryIdentifier;
}

- (void)setEntryIdentifier:(id)a3
{
}

- (NSString)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setSenderIdentifier:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void)enforceMaxContextLength:(unint64_t)a3
{
  if (+[TIInputContextHistory isMail]
    && [(NSString *)self->_text length] > a3)
  {
    self->_text = 0;
  }
  else
  {
    self->_text = [(NSString *)self->_text _stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:a3];
  }

  MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  text = self->_text;
  id v5 = a3;
  [v5 encodeObject:text forKey:@"text"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    timestamp = self->_timestamp;
    int v15 = 136315650;
    v16 = "-[TIInputContextEntry encodeWithCoder:]";
    __int16 v17 = 2114;
    v18 = v13;
    __int16 v19 = 2114;
    uint64_t v20 = timestamp;
    _os_log_error_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Sender identifier is NOT of NSString class: %{public}@, timestamp: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  [v5 encodeObject:self->_senderIdentifier forKey:@"senderIdentifier"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_senderName forKey:@"senderName"];
  [v5 encodeObject:self->_entryIdentifier forKey:@"entryIdentifier"];
  primaryRecipientIdentifiers = self->_primaryRecipientIdentifiers;
  uint64_t v7 = objc_opt_class();
  BOOL v8 = TI_filteredSetWithClass(primaryRecipientIdentifiers, v7);
  [v5 encodeObject:v8 forKey:@"primaryRecipientIdentifiers"];

  secondaryRecipientIdentifiers = self->_secondaryRecipientIdentifiers;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = TI_filteredSetWithClass(secondaryRecipientIdentifiers, v10);
  [v5 encodeObject:v11 forKey:@"secondaryRecipientIdentifiers"];

  [v5 encodeInteger:self->_entryType forKey:@"entryType"];
  [v5 encodeObject:self->_threadIdentifier forKey:@"threadIdentifier"];
  [v5 encodeObject:self->_spotlightCacheKey forKey:@"spotlightCacheKey"];
  [v5 encodeBool:self->_isFromMe forKey:@"isFromMe"];
}

- (TIInputContextEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIInputContextEntry;
  return [(TIInputContextEntry *)&v3 init];
}

- (TIInputContextEntry)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TIInputContextEntry;
  id v5 = [(TIInputContextEntry *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderIdentifier"];
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderName"];
    senderName = v5->_senderName;
    v5->_senderName = (NSPersonNameComponents *)v12;

    if (!v5->_senderIdentifier && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v28 = v5->_timestamp;
      *(_DWORD *)buf = 136315394;
      v31 = "-[TIInputContextEntry initWithCoder:]";
      __int16 v32 = 2114;
      v33 = v28;
      _os_log_error_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%s  Sender identifier is Nil, timestamp: %{public}@", buf, 0x16u);
    }
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryIdentifier"];
    entryIdentifier = v5->_entryIdentifier;
    v5->_entryIdentifier = (NSString *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"primaryRecipientIdentifiers"];
    primaryRecipientIdentifiers = v5->_primaryRecipientIdentifiers;
    v5->_primaryRecipientIdentifiers = (NSSet *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v18 forKey:@"secondaryRecipientIdentifiers"];
    secondaryRecipientIdentifiers = v5->_secondaryRecipientIdentifiers;
    v5->_secondaryRecipientIdentifiers = (NSSet *)v21;

    v5->_entryType = [v4 decodeIntegerForKey:@"entryType"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"threadIdentifier"];
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spotlightCacheKey"];
    spotlightCacheKey = v5->_spotlightCacheKey;
    v5->_spotlightCacheKey = (NSString *)v25;

    v5->_int isFromMe = [v4 decodeBoolForKey:@"isFromMe"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
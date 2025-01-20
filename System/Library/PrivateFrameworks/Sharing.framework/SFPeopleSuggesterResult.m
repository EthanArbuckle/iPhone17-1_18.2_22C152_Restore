@interface SFPeopleSuggesterResult
+ (BOOL)supportsSecureCoding;
- (NSArray)handles;
- (NSString)contactID;
- (NSString)sendersKnownAlias;
- (SFPeopleSuggesterResult)initWithCoder:(id)a3;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setContactID:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHandles:(id)a3;
- (void)setSendersKnownAlias:(id)a3;
@end

@implementation SFPeopleSuggesterResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggesterResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFPeopleSuggesterResult;
  v5 = [(SFPeopleSuggesterResult *)&v10 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v11 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = v11;
    }
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  contactID = self->_contactID;
  id v9 = v4;
  if (contactID)
  {
    [v4 encodeObject:contactID forKey:@"cnID"];
    id v4 = v9;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v9 encodeInt64:flags forKey:@"flags"];
    id v4 = v9;
  }
  handles = self->_handles;
  if (handles)
  {
    [v9 encodeObject:handles forKey:@"hnds"];
    id v4 = v9;
  }
  sendersKnownAlias = self->_sendersKnownAlias;
  if (sendersKnownAlias)
  {
    [v9 encodeObject:sendersKnownAlias forKey:@"ska"];
    id v4 = v9;
  }
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (NSArray)handles
{
  return self->_handles;
}

- (void)setHandles:(id)a3
{
}

- (NSString)sendersKnownAlias
{
  return self->_sendersKnownAlias;
}

- (void)setSendersKnownAlias:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendersKnownAlias, 0);
  objc_storeStrong((id *)&self->_handles, 0);

  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
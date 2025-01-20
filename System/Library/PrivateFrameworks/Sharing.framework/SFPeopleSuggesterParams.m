@interface SFPeopleSuggesterParams
+ (BOOL)supportsSecureCoding;
- (BOOL)excludeBackfills;
- (NSArray)contactIDs;
- (SFPeopleSuggesterParams)initWithCoder:(id)a3;
- (unsigned)flags;
- (unsigned)maxPeople;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIDs:(id)a3;
- (void)setExcludeBackfills:(BOOL)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setMaxPeople:(unsigned int)a3;
@end

@implementation SFPeopleSuggesterParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPeopleSuggesterParams)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFPeopleSuggesterParams;
  v5 = [(SFPeopleSuggesterParams *)&v9 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = v10;
    }
    uint64_t v10 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_maxPeople = v10;
    }
    id v6 = v4;
    if ([v6 containsValueForKey:@"exclBf"]) {
      v5->_excludeBackfills = [v6 decodeBoolForKey:@"exclBf"];
    }

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  contactIDs = self->_contactIDs;
  id v8 = v4;
  if (contactIDs)
  {
    [v4 encodeObject:contactIDs forKey:@"cids"];
    id v4 = v8;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v8 encodeInt64:flags forKey:@"flags"];
    id v4 = v8;
  }
  uint64_t maxPeople = self->_maxPeople;
  if (maxPeople)
  {
    [v8 encodeInt64:maxPeople forKey:@"maxP"];
    id v4 = v8;
  }
  if (self->_excludeBackfills)
  {
    [v8 encodeBool:1 forKey:@"exclBf"];
    id v4 = v8;
  }
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
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

- (unsigned)maxPeople
{
  return self->_maxPeople;
}

- (void)setMaxPeople:(unsigned int)a3
{
  self->_uint64_t maxPeople = a3;
}

- (BOOL)excludeBackfills
{
  return self->_excludeBackfills;
}

- (void)setExcludeBackfills:(BOOL)a3
{
  self->_excludeBackfills = a3;
}

- (void).cxx_destruct
{
}

@end
@interface TVRCPINEntryAttributes
+ (BOOL)supportsSecureCoding;
- (TVRCPINEntryAttributes)initWithCoder:(id)a3;
- (TVRCPINEntryAttributes)initWithDigitCount:(unint64_t)a3;
- (TVRCPINEntryAttributes)initWithGroupLengths:(id)a3;
- (id)description;
- (unint64_t)numberOfDigitGroups;
- (unint64_t)numberOfDigitsInGroup:(unint64_t)a3;
- (unint64_t)totalDigitCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCPINEntryAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCPINEntryAttributes)initWithDigitCount:(unint64_t)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  v4 = [NSNumber numberWithUnsignedInteger:a3];
  v8[0] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  v6 = [(TVRCPINEntryAttributes *)self initWithGroupLengths:v5];

  return v6;
}

- (TVRCPINEntryAttributes)initWithGroupLengths:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRCPINEntryAttributes;
  v5 = [(TVRCPINEntryAttributes *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    groupLengths = v5->_groupLengths;
    v5->_groupLengths = (NSArray *)v6;
  }
  return v5;
}

- (TVRCPINEntryAttributes)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"groupLengths"];

  objc_super v9 = [(TVRCPINEntryAttributes *)self initWithGroupLengths:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (unint64_t)totalDigitCount
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_groupLengths;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "unsignedIntegerValue", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfDigitGroups
{
  return [(NSArray *)self->_groupLengths count];
}

- (unint64_t)numberOfDigitsInGroup:(unint64_t)a3
{
  if ([(NSArray *)self->_groupLengths count] <= a3) {
    return 0;
  }
  unint64_t v5 = [(NSArray *)self->_groupLengths objectAtIndex:a3];
  unint64_t v6 = [v5 unsignedIntegerValue];

  return v6;
}

- (id)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@ %p", objc_opt_class(), self];
  if ([(NSArray *)self->_groupLengths count])
  {
    [v3 appendString:@"; pattern="];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = self->_groupLengths;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      char v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ((v8 & 1) == 0) {
            [v3 appendString:@"-"];
          }
          for (uint64_t j = [v10 unsignedIntegerValue]; j; --j)
            [v3 appendString:@"X"];
          char v8 = 0;
        }
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        char v8 = 0;
      }
      while (v6);
    }
  }
  [v3 appendString:@">"];
  long long v12 = (void *)[v3 copy];

  return v12;
}

- (void).cxx_destruct
{
}

@end
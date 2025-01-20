@interface TIUserDictionaryEntryValue
+ (BOOL)supportsSecureCoding;
+ (id)valueWithEntry:(id)a3;
- (BOOL)matchesEntry:(id)a3;
- (NSNumber)timestamp;
- (NSString)description;
- (NSString)phrase;
- (NSString)shortcut;
- (TIUserDictionaryEntryValue)initWithCoder:(id)a3;
- (id)shortcutForSorting;
- (void)encodeWithCoder:(id)a3;
- (void)setPhrase:(id)a3;
- (void)setShortcut:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation TIUserDictionaryEntryValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_storeStrong((id *)&self->_phrase, 0);
}

- (void)setTimestamp:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setShortcut:(id)a3
{
}

- (NSString)shortcut
{
  return self->_shortcut;
}

- (void)setPhrase:(id)a3
{
}

- (NSString)phrase
{
  return self->_phrase;
}

- (id)shortcutForSorting
{
  v2 = [(TIUserDictionaryEntryValue *)self shortcut];
  v3 = v2;
  if (!v2) {
    v2 = &stru_1EDBDCE38;
  }
  v4 = v2;

  return v4;
}

- (BOOL)matchesEntry:(id)a3
{
  id v4 = a3;
  v5 = [(TIUserDictionaryEntryValue *)self phrase];
  uint64_t v6 = [v4 phrase];
  v7 = (void *)v6;
  if (v5)
  {
    v8 = [(TIUserDictionaryEntryValue *)self phrase];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = v6 == 0;
  }

  v10 = [(TIUserDictionaryEntryValue *)self shortcut];
  uint64_t v11 = [v4 shortcut];
  v12 = (void *)v11;
  if (v10)
  {
    v13 = [(TIUserDictionaryEntryValue *)self shortcut];
    char v14 = [v12 isEqualToString:v13];
  }
  else
  {
    char v14 = v11 == 0;
  }

  return v9 & v14;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(TIUserDictionaryEntryValue *)self shortcut];
  v5 = [(TIUserDictionaryEntryValue *)self phrase];
  uint64_t v6 = [v3 stringWithFormat:@"{%@ => %@}", v4, v5];

  return (NSString *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  phrase = self->_phrase;
  id v8 = v4;
  if (phrase)
  {
    [v4 encodeObject:phrase forKey:@"phrase"];
    id v4 = v8;
  }
  shortcut = self->_shortcut;
  if (shortcut)
  {
    [v8 encodeObject:shortcut forKey:@"shortcut"];
    id v4 = v8;
  }
  timestamp = self->_timestamp;
  if (timestamp)
  {
    [v8 encodeObject:timestamp forKey:@"timestamp"];
    id v4 = v8;
  }
}

- (TIUserDictionaryEntryValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIUserDictionaryEntryValue;
  v5 = [(TIUserDictionaryEntryValue *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phrase"];
    uint64_t v7 = [v6 copy];
    phrase = v5->_phrase;
    v5->_phrase = (NSString *)v7;

    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcut"];
    uint64_t v10 = [v9 copy];
    shortcut = v5->_shortcut;
    v5->_shortcut = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSNumber *)v12;
  }
  return v5;
}

+ (id)valueWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 phrase];
  [v5 setPhrase:v6];

  uint64_t v7 = [v4 shortcut];
  [v5 setShortcut:v7];

  id v8 = [v4 timestamp];

  [v5 setTimestamp:v8];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface TICharacterSetDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)inverted;
- (BOOL)isEqual:(id)a3;
- (NSCharacterSet)characterSet;
- (NSString)charactersAddedToBase;
- (NSString)charactersRemovedFromBase;
- (TICharacterSetDescription)initWithBase:(int64_t)a3 additionalCharacters:(id)a4 removedCharacters:(id)a5 inverted:(BOOL)a6;
- (TICharacterSetDescription)initWithBaseCharacterSet:(int64_t)a3;
- (TICharacterSetDescription)initWithCharactersInString:(id)a3;
- (TICharacterSetDescription)initWithCoder:(id)a3;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)description;
- (id)invertedSetDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newCharacterSetFromDescription;
- (int64_t)baseIdentifier;
- (unint64_t)hash;
- (void)clearCachedCharacterSet;
- (void)encodeWithCoder:(id)a3;
- (void)setCharactersAddedToBase:(id)a3;
- (void)setCharactersRemovedFromBase:(id)a3;
@end

@implementation TICharacterSetDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charactersRemovedFromBase, 0);
  objc_storeStrong((id *)&self->_charactersAddedToBase, 0);

  objc_storeStrong((id *)&self->_characterSet, 0);
}

- (BOOL)inverted
{
  return self->_inverted;
}

- (void)setCharactersRemovedFromBase:(id)a3
{
}

- (NSString)charactersRemovedFromBase
{
  return self->_charactersRemovedFromBase;
}

- (void)setCharactersAddedToBase:(id)a3
{
}

- (NSString)charactersAddedToBase
{
  return self->_charactersAddedToBase;
}

- (int64_t)baseIdentifier
{
  return self->_baseIdentifier;
}

- (void)clearCachedCharacterSet
{
  self->_characterSet = 0;
  MEMORY[0x1F41817F8]();
}

- (NSCharacterSet)characterSet
{
  characterSet = self->_characterSet;
  if (!characterSet)
  {
    v4 = [(TICharacterSetDescription *)self newCharacterSetFromDescription];
    v5 = self->_characterSet;
    self->_characterSet = v4;

    characterSet = self->_characterSet;
  }

  return characterSet;
}

- (id)newCharacterSetFromDescription
{
  if ([(TICharacterSetDescription *)self baseIdentifier])
  {
    v3 = CFCharacterSetGetPredefined((CFCharacterSetPredefinedSet)[(TICharacterSetDescription *)self baseIdentifier]);
  }
  else
  {
    v3 = 0;
  }
  v4 = [(TICharacterSetDescription *)self charactersAddedToBase];

  if (v4)
  {
    if (v3)
    {
      v5 = (void *)[v3 mutableCopy];
      v6 = [(TICharacterSetDescription *)self charactersAddedToBase];
      [v5 addCharactersInString:v6];

      uint64_t v7 = [v5 copy];
      v3 = (void *)v7;
    }
    else
    {
      v8 = (void *)MEMORY[0x1E4F28B88];
      v5 = [(TICharacterSetDescription *)self charactersAddedToBase];
      v3 = [v8 characterSetWithCharactersInString:v5];
    }
  }
  v9 = [(TICharacterSetDescription *)self charactersRemovedFromBase];

  if (v9)
  {
    v10 = (void *)[v3 mutableCopy];
    v11 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
    [v10 removeCharactersInString:v11];

    uint64_t v12 = [v10 copy];
    v3 = (void *)v12;
  }
  if ([(TICharacterSetDescription *)self inverted])
  {
    v13 = [v3 invertedSet];
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      v16 = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 0, 0);
      id v15 = [v16 invertedSet];

      v3 = v16;
    }

    return v15;
  }
  return v3;
}

- (id)invertedSetDescription
{
  v3 = [TICharacterSetDescription alloc];
  int64_t v4 = [(TICharacterSetDescription *)self baseIdentifier];
  v5 = [(TICharacterSetDescription *)self charactersAddedToBase];
  v6 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
  uint64_t v7 = [(TICharacterSetDescription *)v3 initWithBase:v4 additionalCharacters:v5 removedCharacters:v6 inverted:[(TICharacterSetDescription *)self inverted] ^ 1];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  int64_t v4 = +[TIMutableCharacterSetDescription allocWithZone:a3];
  int64_t v5 = [(TICharacterSetDescription *)self baseIdentifier];
  v6 = [(TICharacterSetDescription *)self charactersAddedToBase];
  uint64_t v7 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
  v8 = [(TICharacterSetDescription *)v4 initWithBase:v5 additionalCharacters:v6 removedCharacters:v7 inverted:[(TICharacterSetDescription *)self inverted]];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v16.receiver = self;
  v16.super_class = (Class)TICharacterSetDescription;
  int64_t v4 = [(TICharacterSetDescription *)&v16 description];
  int64_t v5 = [v3 stringWithString:v4];

  uint64_t v6 = [v5 rangeOfString:@">" options:4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v5, "replaceCharactersInRange:withString:", v6, v7, &stru_1EDBDCE38);
  }
  if ([(TICharacterSetDescription *)self baseIdentifier])
  {
    int64_t v8 = [(TICharacterSetDescription *)self baseIdentifier];
    if (v8 == 3)
    {
      v9 = sel_whitespaceAndNewlineCharacterSet;
    }
    else if (v8 == 10)
    {
      v9 = sel_alphanumericCharacterSet;
    }
    else
    {
      v9 = 0;
    }
    v10 = NSStringFromSelector(v9);
    [v5 appendFormat:@", base: %@", v10];
  }
  v11 = [(TICharacterSetDescription *)self charactersAddedToBase];

  if (v11)
  {
    uint64_t v12 = [(TICharacterSetDescription *)self charactersAddedToBase];
    [v5 appendFormat:@", characters: <%@>", v12];
  }
  v13 = [(TICharacterSetDescription *)self charactersRemovedFromBase];

  if (v13)
  {
    v14 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
    [v5 appendFormat:@", without: <%@>", v14];
  }
  if ([(TICharacterSetDescription *)self inverted]) {
    [v5 appendFormat:@", inverted"];
  }
  [v5 appendString:@">"];

  return v5;
}

- (unint64_t)hash
{
  int64_t v3 = 257 * [(TICharacterSetDescription *)self baseIdentifier];
  int64_t v4 = 257 * (v3 + [(TICharacterSetDescription *)self inverted]);
  int64_t v5 = [(TICharacterSetDescription *)self charactersAddedToBase];
  int64_t v6 = v4 + [v5 hash];

  uint64_t v7 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
  unint64_t v8 = [v7 hash] + 257 * v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()])
  {
    char v14 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  int64_t v6 = [(TICharacterSetDescription *)self baseIdentifier];
  if (v6 != [v5 baseIdentifier]) {
    goto LABEL_6;
  }
  int v7 = [(TICharacterSetDescription *)self inverted];
  if (v7 != [v5 inverted]) {
    goto LABEL_6;
  }
  unint64_t v8 = [(TICharacterSetDescription *)self charactersAddedToBase];
  uint64_t v9 = [v5 charactersAddedToBase];
  if (v8 == (void *)v9)
  {

    goto LABEL_11;
  }
  v10 = (void *)v9;
  v11 = [(TICharacterSetDescription *)self charactersAddedToBase];
  uint64_t v12 = [v5 charactersAddedToBase];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
LABEL_11:
    objc_super v16 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
    v17 = [v5 charactersRemovedFromBase];
    if (v16 == v17)
    {
      char v14 = 1;
    }
    else
    {
      v18 = [(TICharacterSetDescription *)self charactersRemovedFromBase];
      v19 = [v5 charactersRemovedFromBase];
      char v14 = [v18 isEqualToString:v19];
    }
    goto LABEL_7;
  }
LABEL_6:
  char v14 = 0;
LABEL_7:

LABEL_9:
  return v14;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  if ([(TICharacterSetDescription *)self isMemberOfClass:objc_opt_class()])
  {
    if (awakeAfterUsingCoder__onceToken != -1) {
      dispatch_once(&awakeAfterUsingCoder__onceToken, &__block_literal_global_1024);
    }
    id v4 = (id)awakeAfterUsingCoder____decodedInstances;
    objc_sync_enter(v4);
    id v5 = [(id)awakeAfterUsingCoder____decodedInstances member:self];
    if (!v5)
    {
      [(id)awakeAfterUsingCoder____decodedInstances addObject:self];
      id v5 = self;
    }
    objc_sync_exit(v4);
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

uint64_t __50__TICharacterSetDescription_awakeAfterUsingCoder___block_invoke()
{
  awakeAfterUsingCoder____decodedInstances = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA80]);

  return MEMORY[0x1F41817F8]();
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t baseIdentifier = self->_baseIdentifier;
  id v8 = v4;
  if (baseIdentifier)
  {
    [v4 encodeInteger:baseIdentifier forKey:@"baseIdentifier"];
    id v4 = v8;
  }
  charactersAddedToBase = self->_charactersAddedToBase;
  if (charactersAddedToBase)
  {
    [v8 encodeObject:charactersAddedToBase forKey:@"charactersAddedToBase"];
    id v4 = v8;
  }
  charactersRemovedFromBase = self->_charactersRemovedFromBase;
  if (charactersRemovedFromBase)
  {
    [v8 encodeObject:charactersRemovedFromBase forKey:@"charactersRemovedFromBase"];
    id v4 = v8;
  }
  if (self->_inverted)
  {
    [v8 encodeBool:1 forKey:@"inverted"];
    id v4 = v8;
  }
}

- (TICharacterSetDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TICharacterSetDescription;
  id v5 = [(TICharacterSetDescription *)&v13 init];
  if (v5)
  {
    v5->_int64_t baseIdentifier = [v4 decodeIntegerForKey:@"baseIdentifier"];
    int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"charactersAddedToBase"];
    uint64_t v7 = [v6 copy];
    charactersAddedToBase = v5->_charactersAddedToBase;
    v5->_charactersAddedToBase = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"charactersRemovedFromBase"];
    uint64_t v10 = [v9 copy];
    charactersRemovedFromBase = v5->_charactersRemovedFromBase;
    v5->_charactersRemovedFromBase = (NSString *)v10;

    v5->_inverted = [v4 decodeBoolForKey:@"inverted"];
  }

  return v5;
}

- (TICharacterSetDescription)initWithBase:(int64_t)a3 additionalCharacters:(id)a4 removedCharacters:(id)a5 inverted:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TICharacterSetDescription;
  uint64_t v12 = [(TICharacterSetDescription *)&v19 init];
  objc_super v13 = v12;
  if (v12)
  {
    v12->_int64_t baseIdentifier = a3;
    uint64_t v14 = [v10 copy];
    charactersAddedToBase = v13->_charactersAddedToBase;
    v13->_charactersAddedToBase = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    charactersRemovedFromBase = v13->_charactersRemovedFromBase;
    v13->_charactersRemovedFromBase = (NSString *)v16;

    v13->_inverted = a6;
  }

  return v13;
}

- (TICharacterSetDescription)initWithCharactersInString:(id)a3
{
  return [(TICharacterSetDescription *)self initWithBase:0 additionalCharacters:a3 removedCharacters:0 inverted:0];
}

- (TICharacterSetDescription)initWithBaseCharacterSet:(int64_t)a3
{
  return [(TICharacterSetDescription *)self initWithBase:a3 additionalCharacters:0 removedCharacters:0 inverted:0];
}

@end
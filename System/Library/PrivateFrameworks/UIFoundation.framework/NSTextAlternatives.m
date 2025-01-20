@interface NSTextAlternatives
+ (BOOL)supportsSecureCoding;
- (BOOL)isLowConfidence;
- (NSArray)alternativeStrings;
- (NSString)primaryString;
- (NSTextAlternatives)initWithCoder:(id)a3;
- (NSTextAlternatives)initWithPrimaryString:(NSString *)primaryString alternativeStrings:(NSArray *)alternativeStrings;
- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5;
- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5 isLowConfidence:(BOOL)a6;
- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 isLowConfidence:(BOOL)a5;
- (id)alternativeAtIndex:(unint64_t)a3;
- (id)alternatives;
- (id)description;
- (id)identifier;
- (id)originalText;
- (unint64_t)numberOfAlternatives;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)noteSelectedAlternativeString:(NSString *)alternativeString;
- (void)setIsLowConfidence:(BOOL)a3;
@end

@implementation NSTextAlternatives

- (NSTextAlternatives)initWithPrimaryString:(NSString *)primaryString alternativeStrings:(NSArray *)alternativeStrings
{
  v7 = (void *)MEMORY[0x1E4F1C3C8];
  if (primaryString)
  {
    if (!alternativeStrings) {
      goto LABEL_6;
    }
LABEL_5:
    if ([(NSArray *)alternativeStrings count]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: must have original text", _NSFullMethodName() format];
  if (alternativeStrings) {
    goto LABEL_5;
  }
LABEL_6:
  [MEMORY[0x1E4F1CA00] raise:*v7, @"%@: must have alternatives", _NSFullMethodName() format];
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)NSTextAlternatives;
  v8 = [(NSTextAlternatives *)&v10 init];
  if (v8)
  {
    v8->_primaryString = (NSString *)[(NSString *)primaryString copy];
    v8->_alternativeStrings = (NSArray *)[(NSArray *)alternativeStrings copy];
    v8->_isLowConfidence = 1;
  }
  return v8;
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 isLowConfidence:(BOOL)a5
{
  result = [(NSTextAlternatives *)self initWithPrimaryString:a3 alternativeStrings:a4];
  if (result) {
    result->_isLowConfidence = a5;
  }
  return result;
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5
{
  return [(NSTextAlternatives *)self initWithPrimaryString:a3 alternativeStrings:a4 identifier:a5 isLowConfidence:1];
}

- (NSTextAlternatives)initWithPrimaryString:(id)a3 alternativeStrings:(id)a4 identifier:(id)a5 isLowConfidence:(BOOL)a6
{
  v7 = [(NSTextAlternatives *)self initWithPrimaryString:a3 alternativeStrings:a4 isLowConfidence:a6];
  if (v7) {
    v7->_internal = (id)[a5 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextAlternatives;
  [(NSTextAlternatives *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextAlternatives;
  return (id)[NSString stringWithFormat:@"%@ primary <%@> alternatives %@", -[NSTextAlternatives description](&v3, sel_description), -[NSTextAlternatives primaryString](self, "primaryString"), -[NSTextAlternatives alternativeStrings](self, "alternativeStrings")];
}

- (void)encodeWithCoder:(id)a3
{
  v5 = [(NSTextAlternatives *)self primaryString];
  id v6 = [(NSTextAlternatives *)self identifier];
  v7 = [(NSTextAlternatives *)self alternativeStrings];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:v5 forKey:@"NSPrimary"];
    [a3 encodeObject:v7 forKey:@"NSAlternatives"];
    [a3 encodeObject:v6 forKey:@"NSIdentifier"];
    uint64_t v8 = [NSNumber numberWithBool:self->_isLowConfidence];
    [a3 encodeObject:v8 forKey:@"NSLowConfidence"];
  }
  else
  {
    [a3 encodeObject:v5];
    [a3 encodeObject:v7];
    [a3 encodeObject:v6];
  }
}

- (NSTextAlternatives)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v11 = [a3 versionForClassName:@"NSTextAlternatives"];
    if (v11 != 1)
    {
      uint64_t v13 = v11;
      uint64_t v14 = _NSFullMethodName();
      NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v14, 1, v13);
      [(NSTextAlternatives *)self dealloc];
      return 0;
    }
    uint64_t v5 = [a3 decodeObject];
    uint64_t v8 = [a3 decodeObject];
    uint64_t v9 = [a3 decodeObject];
    goto LABEL_6;
  }
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPrimary"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), @"NSAlternatives");
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSIdentifier"];
  if (![a3 containsValueForKey:@"NSLowConfidence"])
  {
LABEL_6:
    uint64_t v10 = 1;
    goto LABEL_7;
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSLowConfidence"), "BOOLValue");
LABEL_7:

  return [(NSTextAlternatives *)self initWithPrimaryString:v5 alternativeStrings:v8 identifier:v9 isLowConfidence:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)primaryString
{
  return self->_primaryString;
}

- (NSArray)alternativeStrings
{
  return self->_alternativeStrings;
}

- (void)noteSelectedAlternativeString:(NSString *)alternativeString
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", alternativeString, @"NSAlternativeString", 0);

  [v5 postNotificationName:@"NSTextAlternativesSelectedAlternativeStringNotification" object:self userInfo:v6];
}

- (id)originalText
{
  return self->_primaryString;
}

- (unint64_t)numberOfAlternatives
{
  return [(NSArray *)self->_alternativeStrings count];
}

- (id)alternatives
{
  return self->_alternativeStrings;
}

- (id)alternativeAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_alternativeStrings objectAtIndex:a3];
}

- (id)identifier
{
  return self->_internal;
}

- (BOOL)isLowConfidence
{
  return self->_isLowConfidence;
}

- (void)setIsLowConfidence:(BOOL)a3
{
  self->_isLowConfidence = a3;
}

@end
@interface TSWPLineStyling
+ (id)lineStylingWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6;
- (BOOL)isEqual:(id)a3;
- (TSSPropertyMap)additionalCharacterStylePropertyMap;
- (TSSPropertyMap)overrideCharacterStylePropertyMap;
- (TSWPLineStyling)initWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6;
- (id)_optionsDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)lineCount;
- (unint64_t)hash;
- (unint64_t)options;
- (void)dealloc;
@end

@implementation TSWPLineStyling

+ (id)lineStylingWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6
{
  v6 = (void *)[objc_alloc((Class)a1) initWithLineCount:a3 options:a4 additionalCharacterStylePropertyMap:a5 overrideCharacterStylePropertyMap:a6];

  return v6;
}

- (TSWPLineStyling)initWithLineCount:(int64_t)a3 options:(unint64_t)a4 additionalCharacterStylePropertyMap:(id)a5 overrideCharacterStylePropertyMap:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)TSWPLineStyling;
  v10 = [(TSWPLineStyling *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_lineCount = a3;
    v10->_options = a4;
    v10->_additionalCharacterStylePropertyMap = (TSSPropertyMap *)[a5 copy];
    v11->_overrideCharacterStylePropertyMap = (TSSPropertyMap *)[a6 copy];
  }
  return v11;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPLineStyling;
  [(TSWPLineStyling *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t lineCount = self->_lineCount;
  unint64_t options = self->_options;
  additionalCharacterStylePropertyMap = self->_additionalCharacterStylePropertyMap;
  overrideCharacterStylePropertyMap = self->_overrideCharacterStylePropertyMap;

  return (id)[v4 initWithLineCount:lineCount options:options additionalCharacterStylePropertyMap:additionalCharacterStylePropertyMap overrideCharacterStylePropertyMap:overrideCharacterStylePropertyMap];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    int64_t v6 = [(TSWPLineStyling *)self lineCount];
    if (v6 == [v5 lineCount]
      && (unint64_t v7 = -[TSWPLineStyling options](self, "options"), v7 == [v5 options]))
    {
      v8 = [(TSWPLineStyling *)self additionalCharacterStylePropertyMap];
      if (v8 == (TSSPropertyMap *)[v5 additionalCharacterStylePropertyMap]
        || (LODWORD(v4) = -[TSSPropertyMap isEqual:](-[TSWPLineStyling additionalCharacterStylePropertyMap](self, "additionalCharacterStylePropertyMap"), "isEqual:", [v5 additionalCharacterStylePropertyMap]), v4))
      {
        v9 = [(TSWPLineStyling *)self overrideCharacterStylePropertyMap];
        if (v9 == (TSSPropertyMap *)[v5 overrideCharacterStylePropertyMap])
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          v10 = [(TSWPLineStyling *)self overrideCharacterStylePropertyMap];
          uint64_t v11 = [v5 overrideCharacterStylePropertyMap];
          LOBYTE(v4) = [(TSSPropertyMap *)v10 isEqual:v11];
        }
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (unint64_t)hash
{
  int64_t v3 = [(TSWPLineStyling *)self lineCount];
  unint64_t v4 = [(TSWPLineStyling *)self options] ^ v3;
  unint64_t v5 = v4 ^ (4
           * [(TSSPropertyMap *)[(TSWPLineStyling *)self additionalCharacterStylePropertyMap] hash]);
  return v5 ^ ([(TSSPropertyMap *)[(TSWPLineStyling *)self overrideCharacterStylePropertyMap] hash] << 10);
}

- (id)_optionsDescription
{
  char v2 = [(TSWPLineStyling *)self options];
  int64_t v3 = (void *)[MEMORY[0x263F089D8] string];
  unint64_t v4 = v3;
  if (v2) {
    [v3 appendString:@"LM+"];
  }
  if ((v2 & 2) != 0) {
    [v4 appendString:@"W+"];
  }
  uint64_t v5 = [v4 length];
  if (v5) {
    objc_msgSend(v4, "deleteCharactersInRange:", v5 - 1, 1);
  }
  else {
    [v4 appendString:@"none"];
  }
  return (id)[NSString stringWithFormat:@"autoresize = %@; ", v4];
}

- (id)description
{
  int64_t v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; lineCount=%lu options=%@ additionalMap=%@ overrideMap=%@>",
               v5,
               objc_opt_class(),
               self->_lineCount,
               [(TSWPLineStyling *)self _optionsDescription],
               self->_additionalCharacterStylePropertyMap,
               self->_overrideCharacterStylePropertyMap);
}

- (int64_t)lineCount
{
  return self->_lineCount;
}

- (unint64_t)options
{
  return self->_options;
}

- (TSSPropertyMap)additionalCharacterStylePropertyMap
{
  return self->_additionalCharacterStylePropertyMap;
}

- (TSSPropertyMap)overrideCharacterStylePropertyMap
{
  return self->_overrideCharacterStylePropertyMap;
}

@end
@interface NSCountableTextLocation
+ (NSCountableTextLocation)endOfDocumentLocation;
- (BOOL)isEndOfDocument;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextLocation:(id)a3;
- (NSCountableTextLocation)initWithIndex:(unint64_t)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)type;
- (int64_t)compare:(id)a3;
- (unint64_t)characterIndex;
- (unint64_t)hash;
- (void)setCharacterIndex:(unint64_t)a3;
@end

@implementation NSCountableTextLocation

- (unint64_t)hash
{
  return self->_characterIndex;
}

- (NSString)type
{
  return (NSString *)NSTextLocationTypeCountable;
}

- (unint64_t)characterIndex
{
  return self->_characterIndex;
}

- (BOOL)isEndOfDocument
{
  return self->_characterIndex > 0x7FFFFFFFFFFFFFFELL;
}

- (int64_t)compare:(id)a3
{
  if (self == a3) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = *((void *)a3 + 1);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v13 = *MEMORY[0x1E4F1C3C8];
      uint64_t v14 = objc_opt_class();
      [v12 raise:v13, @"-[%@ %@] receiving unmatching type %@", v14, NSStringFromSelector(a2), a3 format];
      return 0;
    }
    uint64_t v6 = [a3 characterIndex];
  }
  int64_t characterIndex = self->_characterIndex;
  BOOL v9 = characterIndex == v6;
  BOOL v10 = characterIndex < v6;
  int64_t v11 = -1;
  if (!v10) {
    int64_t v11 = 1;
  }
  if (v9) {
    return 0;
  }
  else {
    return v11;
  }
}

- (NSCountableTextLocation)initWithIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NSCountableTextLocation;
  result = [(NSCountableTextLocation *)&v5 init];
  if (result) {
    result->_int64_t characterIndex = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = self->_characterIndex == *((void *)a3 + 1);
    }
    else
    {
      int v6 = [a3 conformsToProtocol:&unk_1EDD716D0];
      if (!v6) {
        return v6;
      }
      BOOL v5 = [(NSCountableTextLocation *)self compare:a3] == 0;
    }
    LOBYTE(v6) = v5;
  }
  return v6;
}

+ (NSCountableTextLocation)endOfDocumentLocation
{
  if (endOfDocumentLocation_onceToken != -1) {
    dispatch_once(&endOfDocumentLocation_onceToken, &__block_literal_global_78_0);
  }
  return (NSCountableTextLocation *)endOfDocumentLocation_textLocation;
}

NSCountableTextLocation *__48__NSCountableTextLocation_endOfDocumentLocation__block_invoke()
{
  result = [[NSCountableTextLocation alloc] initWithIndex:0x7FFFFFFFFFFFFFFFLL];
  endOfDocumentLocation_textLocation = (uint64_t)result;
  return result;
}

- (NSString)debugDescription
{
  v3 = NSString;
  if ([(NSCountableTextLocation *)self isEndOfDocument]) {
    v4 = @"%@: <EOD>";
  }
  else {
    v4 = @"%@: %lu";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", v4, objc_opt_class(), -[NSCountableTextLocation characterIndex](self, "characterIndex"));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[NSCountableTextLocation characterIndex](self, "characterIndex"));
}

- (BOOL)isEqualToTextLocation:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return self->_characterIndex == *((void *)a3 + 1);
  }
  else {
    return [(NSCountableTextLocation *)self compare:a3] == 0;
  }
}

- (void)setCharacterIndex:(unint64_t)a3
{
  self->_int64_t characterIndex = a3;
}

@end
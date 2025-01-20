@interface NSTextSelection
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForAffinity:(int64_t)a3;
+ (id)descriptionForGranularity:(int64_t)a3;
- (BOOL)containsLocation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTextSelection:(id)a3;
- (BOOL)isLogical;
- (BOOL)isTransient;
- (CGFloat)anchorPositionOffset;
- (NSArray)textRanges;
- (NSDictionary)typingAttributes;
- (NSTextLocation)selectionAnchorLocation;
- (NSTextSelection)initWithCoder:(NSCoder *)coder;
- (NSTextSelection)initWithLocation:(id)location affinity:(NSTextSelectionAffinity)affinity;
- (NSTextSelection)initWithRange:(NSTextRange *)range affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity;
- (NSTextSelection)initWithRanges:(NSArray *)textRanges affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity;
- (NSTextSelection)textSelectionWithTextRanges:(NSArray *)textRanges;
- (NSTextSelectionAffinity)affinity;
- (NSTextSelectionGranularity)granularity;
- (id)description;
- (id)secondarySelectionLocation;
- (id)textRangeContainingLocation:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchorPositionOffset:(CGFloat)anchorPositionOffset;
- (void)setLogical:(BOOL)logical;
- (void)setSecondarySelectionLocation:(id)secondarySelectionLocation;
- (void)setSelectionAnchorLocation:(id)a3;
- (void)setTransient:(BOOL)a3;
- (void)setTypingAttributes:(NSDictionary *)typingAttributes;
@end

@implementation NSTextSelection

- (NSArray)textRanges
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (id)textRangeContainingLocation:(id)a3
{
  v4 = [(NSTextSelection *)self textRanges];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  uint64_t v13 = 0;
  if ((objc_msgSend(-[NSArray firstObject](v4, "firstObject"), "isEmpty") & 1) == 0)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__NSTextSelection_textRangeContainingLocation___block_invoke;
    v7[3] = &unk_1E55C5B48;
    v7[4] = a3;
    v7[5] = &v8;
    [(NSArray *)v4 enumerateObjectsUsingBlock:v7];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)isEqualToTextSelection:(id)a3
{
  if (self == a3) {
    goto LABEL_16;
  }
  int v5 = -[NSArray isEqualToArray:](self->_textRanges, "isEqualToArray:", [a3 textRanges]);
  if (v5)
  {
    int64_t granularity = self->_granularity;
    if (granularity != [a3 granularity]
      || (int64_t affinity = self->_affinity, affinity != [a3 affinity])
      || (int transient = self->_transient, transient != [a3 isTransient])
      || (int logical = self->_logical, logical != [a3 isLogical])
      || (double anchorPositionOffset = self->_anchorPositionOffset,
          [a3 anchorPositionOffset],
          anchorPositionOffset != v11))
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    secondarySelectionLocation = self->_secondarySelectionLocation;
    if (secondarySelectionLocation == (NSTextLocation *)[a3 secondarySelectionLocation]
      || (int v5 = -[NSTextLocation isEqual:](self->_secondarySelectionLocation, "isEqual:", [a3 secondarySelectionLocation])) != 0)
    {
      typingAttributes = self->_typingAttributes;
      if (typingAttributes == (NSDictionary *)[a3 typingAttributes]
        || (int v5 = -[NSDictionary isEqualToDictionary:](self->_typingAttributes, "isEqualToDictionary:", [a3 typingAttributes])) != 0)
      {
        selectionAnchorLocation = self->_selectionAnchorLocation;
        if (selectionAnchorLocation != (NSTextLocation *)[a3 selectionAnchorLocation])
        {
          v15 = self->_selectionAnchorLocation;
          uint64_t v16 = [a3 selectionAnchorLocation];
          LOBYTE(v5) = [(NSTextLocation *)v15 isEqual:v16];
          return v5;
        }
LABEL_16:
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (NSDictionary)typingAttributes
{
  return self->_typingAttributes;
}

- (NSTextLocation)selectionAnchorLocation
{
  return (NSTextLocation *)objc_getProperty(self, a2, 64, 1);
}

- (id)secondarySelectionLocation
{
  return objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (BOOL)isLogical
{
  return self->_logical;
}

- (NSTextSelectionGranularity)granularity
{
  return self->_granularity;
}

- (CGFloat)anchorPositionOffset
{
  return self->_anchorPositionOffset;
}

- (NSTextSelectionAffinity)affinity
{
  return self->_affinity;
}

- (NSTextSelection)initWithRange:(NSTextRange *)range affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = range;
  return -[NSTextSelection initWithRanges:affinity:granularity:](self, "initWithRanges:affinity:granularity:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1], affinity, granularity);
}

- (NSTextSelection)initWithRanges:(NSArray *)textRanges affinity:(NSTextSelectionAffinity)affinity granularity:(NSTextSelectionGranularity)granularity
{
  v11.receiver = self;
  v11.super_class = (Class)NSTextSelection;
  uint64_t v8 = [(NSTextSelection *)&v11 init];
  if (v8)
  {
    uint64_t v9 = [(NSArray *)textRanges copy];
    v8->_int64_t granularity = granularity;
    v8->_int64_t affinity = affinity;
    v8->_textRanges = (NSArray *)v9;
  }
  return v8;
}

- (void)setTypingAttributes:(NSDictionary *)typingAttributes
{
  objc_sync_enter(self);
  int v5 = +[NSAttributeDictionary newWithDictionary:typingAttributes];

  self->_typingAttributes = v5;

  objc_sync_exit(self);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextSelection;
  [(NSTextSelection *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(NSTextSelection *)self isEqualToTextSelection:a3];
}

- (NSTextSelection)initWithLocation:(id)location affinity:(NSTextSelectionAffinity)affinity
{
  v6 = [[NSTextRange alloc] initWithLocation:location];

  return [(NSTextSelection *)self initWithRange:v6 affinity:affinity granularity:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextSelection)initWithCoder:(NSCoder *)coder
{
  if ([(NSCoder *)coder allowsKeyedCoding])
  {
    __int16 v5 = [(NSCoder *)coder decodeIntegerForKey:@"NS.flags"];
    self->_textRanges = (NSArray *)[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NS.textRanges"];
    self->_int64_t granularity = [(NSCoder *)coder decodeIntegerForKey:@"NS.granularity"];
    [(NSCoder *)coder decodeDoubleForKey:@"NS.anchorPositionOffset"];
    self->_double anchorPositionOffset = v6;
    self->_secondarySelectionLocation = (NSTextLocation *)[(NSCoder *)coder decodeObjectForKey:@"NS.secondarySelectionLocation"];
    self->_int64_t affinity = v5 & 0xF;
    self->_int transient = HIBYTE(v5) & 1;
    self->_int logical = (v5 & 0x200) != 0;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInteger:self->_affinity & 0xF | ((unint64_t)self->_transient << 8) | ((unint64_t)self->_logical << 9) forKey:@"NS.flags"];
    [a3 encodeObject:self->_textRanges forKey:@"NS.textRanges"];
    [a3 encodeInteger:self->_granularity forKey:@"NS.granularity"];
    [a3 encodeDouble:@"NS.anchorPositionOffset" forKey:self->_anchorPositionOffset];
    secondarySelectionLocation = self->_secondarySelectionLocation;
    [a3 encodeObject:secondarySelectionLocation forKey:@"NS.secondarySelectionLocation"];
  }
}

id __47__NSTextSelection_textRangeContainingLocation___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id result = (id)objc_msgSend(*(id *)(a1 + 32), "compare:", objc_msgSend(a2, "endLocation"));
  if (result == (id)-1)
  {
    id result = (id)objc_msgSend((id)objc_msgSend(a2, "location"), "compare:", *(void *)(a1 + 32));
    if (result == (id)1) {
      return result;
    }
    id result = a2;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  *a4 = 1;
  return result;
}

- (BOOL)containsLocation:(id)a3
{
  return [(NSTextSelection *)self textRangeContainingLocation:a3] != 0;
}

- (NSTextSelection)textSelectionWithTextRanges:(NSArray *)textRanges
{
  v4 = self;
  if (![(NSArray *)textRanges isEqualToArray:[(NSTextSelection *)self textRanges]])
  {
    __int16 v5 = [[NSTextSelection alloc] initWithRanges:textRanges affinity:[(NSTextSelection *)v4 affinity] granularity:[(NSTextSelection *)v4 granularity]];
    [(NSTextSelection *)v5 setLogical:[(NSTextSelection *)v4 isLogical]];
    [(NSTextSelection *)v5 setSecondarySelectionLocation:[(NSTextSelection *)v4 secondarySelectionLocation]];
    [(NSTextSelection *)v5 setTypingAttributes:[(NSTextSelection *)v4 typingAttributes]];
    [(NSTextSelection *)v5 setSelectionAnchorLocation:[(NSTextSelection *)v4 selectionAnchorLocation]];
    return v5;
  }
  return v4;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_textRanges hash];
  uint64_t v4 = [(NSTextLocation *)self->_secondarySelectionLocation hash] + v3;
  uint64_t v5 = [(NSDictionary *)self->_typingAttributes hash];
  return v4 + v5 + [(NSTextLocation *)self->_selectionAnchorLocation hash] + self->_affinity + self->_granularity;
}

+ (id)descriptionForGranularity:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return @"unknown";
  }
  else {
    return off_1E55CE088[a3];
  }
}

+ (id)descriptionForAffinity:(int64_t)a3
{
  uint64_t v3 = @"unknown";
  if (a3 == 1) {
    uint64_t v3 = @"downstream";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"upstream";
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() descriptionForGranularity:self->_granularity];
  uint64_t v6 = [(id)objc_opt_class() descriptionForAffinity:self->_affinity];
  BOOL transient = self->_transient;
  if (self->_anchorPositionOffset == 0.0) {
    uint64_t v8 = &stru_1EDD49F70;
  }
  else {
    uint64_t v8 = (__CFString *)[NSString stringWithFormat:@", anchor position offset=%f", *(void *)&self->_anchorPositionOffset];
  }
  if (self->_selectionAnchorLocation) {
    uint64_t v9 = (__CFString *)[NSString stringWithFormat:@", anchor location %@", self->_selectionAnchorLocation];
  }
  else {
    uint64_t v9 = &stru_1EDD49F70;
  }
  uint64_t v10 = @", transient";
  if (!transient) {
    uint64_t v10 = &stru_1EDD49F70;
  }
  return (id)[v3 stringWithFormat:@"%@:<%p> granularity=%@, affinity=%@%@%@%@, textRanges=%@", v4, self, v5, v6, v10, v8, v9, self->_textRanges];
}

- (void)setTransient:(BOOL)a3
{
  self->_BOOL transient = a3;
}

- (void)setAnchorPositionOffset:(CGFloat)anchorPositionOffset
{
  self->_double anchorPositionOffset = anchorPositionOffset;
}

- (void)setLogical:(BOOL)logical
{
  self->_int logical = logical;
}

- (void)setSecondarySelectionLocation:(id)secondarySelectionLocation
{
}

- (void)setSelectionAnchorLocation:(id)a3
{
}

@end
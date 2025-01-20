@interface SCRCComposedCharacter
- (BOOL)_formKCContaintsUpperCase;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUChar32:(int)a3;
- (SCRCComposedCharacter)initWithCharacter:(int)a3;
- (SCRCComposedCharacter)initWithComposedCharacter:(__CFString *)a3;
- (__CFString)copyUnicodeDescriptionString;
- (__CFString)originalString;
- (id)_initWithCharacter:(int)a3;
- (id)_initWithComposedCharacter:(__CFString *)a3;
- (id)_initWithSimpleCharacter:(int)a3;
- (int)formDCharAtIndex:(unint64_t)a3;
- (int)formKCCharAtIndex:(unint64_t)a3;
- (int)originalFromCharAtIndex:(unint64_t)a3;
- (unint64_t)formDLength;
- (unint64_t)formKCLength;
- (unint64_t)originalLength;
- (void)_buildFormD;
- (void)_buildFormKC;
- (void)dealloc;
@end

@implementation SCRCComposedCharacter

- (id)_initWithCharacter:(int)a3
{
  *(_DWORD *)bytes = a3;
  v4 = [(SCRCComposedCharacter *)self init];
  if (v4)
  {
    v5 = (int *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
    v4->_originalRepresentation = v5;
    int *v5 = a3;
    CFStringEncoding v6 = SCRCUTF32Encoding();
    CFStringRef v7 = CFStringCreateWithBytes(0, bytes, 4, v6, 0);
    if (*(int *)bytes < 0x10000) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    v4->_originalCombinedCharacterLength = v8;
    v4->_originalCombinedCharacter = (__CFString *)v7;
    v4->_originalRepresentationLength = 1;
  }
  return v4;
}

- (id)_initWithSimpleCharacter:(int)a3
{
  id result = [(SCRCComposedCharacter *)self _initWithCharacter:*(void *)&a3];
  if (result)
  {
    uint64_t v4 = *((void *)result + 4);
    *((void *)result + 5) = v4;
    *((void *)result + 6) = v4;
    uint64_t v5 = *((void *)result + 1);
    *((void *)result + 2) = v5;
    *((void *)result + 3) = v5;
  }
  return result;
}

- (SCRCComposedCharacter)initWithCharacter:(int)a3
{
  if (a3 > 127) {
    id v3 = -[SCRCComposedCharacter _initWithCharacter:](self, "_initWithCharacter:");
  }
  else {
    id v3 = -[SCRCComposedCharacter _initWithSimpleCharacter:](self, "_initWithSimpleCharacter:");
  }
  uint64_t v4 = (SCRCComposedCharacter *)v3;

  return v4;
}

- (id)_initWithComposedCharacter:(__CFString *)a3
{
  uint64_t v4 = [(SCRCComposedCharacter *)self init];
  uint64_t v5 = v4;
  if (a3 && v4)
  {
    CFRetain(a3);
    v5->_originalCombinedCharacter = a3;
    v5->_originalCombinedCharacterLength = CFStringGetLength(a3);
    v5->_originalRepresentation = (int *)SCRCCopyStringToUChar32Array(v5->_originalCombinedCharacter, &v5->_originalRepresentationLength);
  }
  return v5;
}

- (SCRCComposedCharacter)initWithComposedCharacter:(__CFString *)a3
{
  if ([(__CFString *)a3 scrc_containsOnlyOneGlyph])
  {
    self = (SCRCComposedCharacter *)[(SCRCComposedCharacter *)self _initWithComposedCharacter:a3];
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  originalCombinedCharacter = self->_originalCombinedCharacter;
  if (originalCombinedCharacter) {
    CFRelease(originalCombinedCharacter);
  }
  originalRepresentation = self->_originalRepresentation;
  if (originalRepresentation)
  {
    if (originalRepresentation == self->_normalFormDRepresentation) {
      self->_normalFormDRepresentation = 0;
    }
    if (originalRepresentation == self->_normalFormKCRepresentation) {
      self->_normalFormKCRepresentation = 0;
    }
    free(originalRepresentation);
    self->_originalRepresentation = 0;
    self->_originalRepresentationLength = 0;
  }
  normalFormDRepresentation = self->_normalFormDRepresentation;
  if (normalFormDRepresentation)
  {
    free(normalFormDRepresentation);
    self->_normalFormDRepresentation = 0;
    self->_normalFormDRepresentationLength = 0;
  }
  normalFormKCRepresentation = self->_normalFormKCRepresentation;
  if (normalFormKCRepresentation)
  {
    free(normalFormKCRepresentation);
    self->_normalFormKCRepresentation = 0;
    self->_normalFormKCRepresentationLength = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SCRCComposedCharacter;
  [(SCRCComposedCharacter *)&v7 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SCRCComposedCharacter *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      unsigned __int8 v7 = 1;
    }
    else
    {
      originalCombinedCharacter = self->_originalCombinedCharacter;
      unsigned __int8 v7 = originalCombinedCharacter
        && (CFStringRef v6 = v4->_originalCombinedCharacter) != 0
        && CFStringCompare(originalCombinedCharacter, v6, 0x10uLL) == kCFCompareEqualTo;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SCRCComposedCharacter;
    unsigned __int8 v7 = [(SCRCComposedCharacter *)&v9 isEqual:v4];
  }

  return v7;
}

- (BOOL)isEqualToUChar32:(int)a3
{
  uint64_t v4 = [[SCRCComposedCharacter alloc] initWithCharacter:*(void *)&a3];
  LOBYTE(self) = [(SCRCComposedCharacter *)self isEqual:v4];

  return (char)self;
}

- (__CFString)originalString
{
  return self->_originalCombinedCharacter;
}

- (__CFString)copyUnicodeDescriptionString
{
  Mutable = CFStringCreateMutable(0, 0);
  if (self->_normalFormKCRepresentationLength
    || ([(SCRCComposedCharacter *)self _buildFormKC], self->_normalFormKCRepresentationLength))
  {
    unint64_t v4 = 0;
    char v5 = 0;
    do
    {
      if (v5)
      {
        uint64_t v6 = [MEMORY[0x263F086E0] localizedCoreStringForKey:@"with"];
        if (v6)
        {
          CFStringRef v7 = (const __CFString *)v6;
          CFStringAppend(Mutable, @" ");
          CFStringAppend(Mutable, v7);
          CFStringAppend(Mutable, @" ");
        }
      }
      uint64_t v8 = _CopyUnicodeDescriptionStringForCharacter(self->_normalFormKCRepresentation[v4]);
      if (v8)
      {
        objc_super v9 = v8;
        CFStringAppend(Mutable, v8);
        CFRelease(v9);
      }
      ++v4;
      char v5 = 1;
    }
    while (v4 < self->_normalFormKCRepresentationLength);
  }
  return Mutable;
}

- (void)_buildFormD
{
  id v3 = self;
  unint64_t v4 = v3;
  CFStringRef originalCombinedCharacter = v3->_originalCombinedCharacter;
  if (originalCombinedCharacter
    && (MutableCopy = CFStringCreateMutableCopy(0, v3->_originalCombinedCharacterLength, originalCombinedCharacter)) != 0)
  {
    CFStringRef v7 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
    uint64_t v8 = SCRCCopyStringToUChar32Array(v7, &self->_normalFormDRepresentationLength);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v4->_normalFormDRepresentation = (int *)v8;
}

- (void)_buildFormKC
{
  id v3 = self;
  unint64_t v4 = v3;
  CFStringRef originalCombinedCharacter = v3->_originalCombinedCharacter;
  if (originalCombinedCharacter
    && (MutableCopy = CFStringCreateMutableCopy(0, v3->_originalCombinedCharacterLength, originalCombinedCharacter)) != 0)
  {
    CFStringRef v7 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormKC);
    uint64_t v8 = SCRCCopyStringToUChar32Array(v7, &self->_normalFormKCRepresentationLength);
    CFRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  v4->_normalFormKCRepresentation = (int *)v8;
}

- (int)formDCharAtIndex:(unint64_t)a3
{
  unint64_t normalFormDRepresentationLength = self->_normalFormDRepresentationLength;
  if (!normalFormDRepresentationLength)
  {
    [(SCRCComposedCharacter *)self _buildFormD];
    unint64_t normalFormDRepresentationLength = self->_normalFormDRepresentationLength;
  }
  if (normalFormDRepresentationLength <= a3) {
    return 0;
  }
  else {
    return self->_normalFormDRepresentation[a3];
  }
}

- (int)formKCCharAtIndex:(unint64_t)a3
{
  unint64_t normalFormKCRepresentationLength = self->_normalFormKCRepresentationLength;
  if (!normalFormKCRepresentationLength)
  {
    [(SCRCComposedCharacter *)self _buildFormKC];
    unint64_t normalFormKCRepresentationLength = self->_normalFormKCRepresentationLength;
  }
  if (normalFormKCRepresentationLength <= a3) {
    return 0;
  }
  else {
    return self->_normalFormKCRepresentation[a3];
  }
}

- (int)originalFromCharAtIndex:(unint64_t)a3
{
  originalRepresentation = self->_originalRepresentation;
  if (originalRepresentation && self->_originalRepresentationLength > a3) {
    return originalRepresentation[a3];
  }
  else {
    return 0;
  }
}

- (BOOL)_formKCContaintsUpperCase
{
  if (!self->_normalFormKCRepresentationLength) {
    [(SCRCComposedCharacter *)self _buildFormKC];
  }
  id v3 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  if (self->_normalFormKCRepresentationLength)
  {
    unint64_t v4 = 0;
    do
    {
      int v5 = [v3 longCharacterIsMember:self->_normalFormKCRepresentation[v4]];
      if (v5) {
        break;
      }
      ++v4;
    }
    while (v4 < self->_normalFormKCRepresentationLength);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (unint64_t)originalLength
{
  return self->_originalCombinedCharacterLength;
}

- (unint64_t)formDLength
{
  unint64_t result = self->_normalFormDRepresentationLength;
  if (!result)
  {
    [(SCRCComposedCharacter *)self _buildFormD];
    return self->_normalFormDRepresentationLength;
  }
  return result;
}

- (unint64_t)formKCLength
{
  unint64_t result = self->_normalFormKCRepresentationLength;
  if (!result)
  {
    [(SCRCComposedCharacter *)self _buildFormKC];
    return self->_normalFormKCRepresentationLength;
  }
  return result;
}

@end
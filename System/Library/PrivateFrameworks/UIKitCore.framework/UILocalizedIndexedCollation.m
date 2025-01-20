@interface UILocalizedIndexedCollation
+ (UILocalizedIndexedCollation)collationWithDictionary:(id)a3;
+ (UILocalizedIndexedCollation)currentCollation;
- (NSArray)sectionIndexTitles;
- (NSArray)sectionTitles;
- (NSArray)sortedArrayFromArray:(NSArray *)array collationStringSelector:(SEL)selector;
- (NSInteger)sectionForObject:(id)object collationStringSelector:(SEL)selector;
- (NSInteger)sectionForSectionIndexTitleAtIndex:(NSInteger)indexTitleIndex;
- (UILocalizedIndexedCollation)initWithDictionary:(id)a3;
- (__CFStringTokenizer)tokenizer;
- (id)_kanaTranscriptionForString:(id)a3;
- (id)transformedCollationStringForString:(id)a3;
- (void)dealloc;
@end

@implementation UILocalizedIndexedCollation

+ (UILocalizedIndexedCollation)collationWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDictionary:v4];

  return (UILocalizedIndexedCollation *)v5;
}

- (UILocalizedIndexedCollation)initWithDictionary:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UILocalizedIndexedCollation;
  v6 = [(UILocalizedIndexedCollation *)&v29 init];
  if (v6)
  {
    v7 = [v5 objectForKey:@"UICollationKey"];
    if (!v7)
    {
      v28 = [MEMORY[0x1E4F28B00] currentHandler];
      [v28 handleFailureInMethod:a2 object:v6 file:@"UILocalizedIndexedCollation.m" lineNumber:61 description:@"Missing locale identifier in collation dictionary"];
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v7];
    locale = v6->_locale;
    v6->_locale = (NSLocale *)v8;

    uint64_t v10 = [v5 objectForKey:@"UISectionTitles"];
    sectionTitles = v6->_sectionTitles;
    v6->_sectionTitles = (NSArray *)v10;

    uint64_t v12 = [v5 objectForKey:@"UISectionStartStrings"];
    sectionStartStrings = v6->_sectionStartStrings;
    v6->_sectionStartStrings = (NSArray *)v12;

    uint64_t v14 = [v5 objectForKey:@"UIIndexTitles"];
    sectionIndexTitles = v6->_sectionIndexTitles;
    v6->_sectionIndexTitles = (NSArray *)v14;

    uint64_t v16 = [v5 objectForKey:@"UIIndexMapping"];
    sectionIndexMapping = v6->_sectionIndexMapping;
    v6->_sectionIndexMapping = (NSArray *)v16;

    uint64_t v18 = [v5 objectForKey:@"UITransform"];
    transform = v6->_transform;
    v6->_transform = (NSString *)v18;

    uint64_t v20 = [(NSArray *)v6->_sectionStartStrings objectAtIndex:0];
    firstSectionStartString = v6->_firstSectionStartString;
    v6->_firstSectionStartString = (NSString *)v20;

    uint64_t v22 = [(NSArray *)v6->_sectionStartStrings lastObject];
    lastSectionStartString = v6->_lastSectionStartString;
    v6->_lastSectionStartString = (NSString *)v22;

    v24 = [(NSLocale *)v6->_locale languageCode];
    v6->_primaryLanguageIsJapanese = [v24 isEqualToString:@"ja"];

    if (v6->_primaryLanguageIsJapanese)
    {
      v6->_preferJapaneseRomajiTranscriptions = 0;
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:&unk_1ED3F1348];
      v26 = [v25 firstObject];
      v6->_preferJapaneseRomajiTranscriptions = [v26 isEqualToString:@"ja"];
    }
  }

  return v6;
}

- (id)_kanaTranscriptionForString:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _firstGrapheme];
  int v6 = [v5 _containsJapaneseOnly];

  if (v6)
  {
    v7 = objc_msgSend(v4, "_stringByTranscribingUsingTokenizer:", -[UILocalizedIndexedCollation tokenizer](self, "tokenizer"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)transformedCollationStringForString:(id)a3
{
  if (a3 && self->_transform)
  {
    MutableCopy = CFStringCreateMutableCopy(0, 0, (CFStringRef)a3);
    if (CFStringTransform(MutableCopy, 0, (CFStringRef)self->_transform, 0)) {
      goto LABEL_18;
    }
    CFRelease(MutableCopy);
    goto LABEL_17;
  }
  if (!a3) {
    goto LABEL_17;
  }
  uint64_t v6 = [a3 length];
  if (objc_msgSend(a3, "compare:options:range:locale:", self->_lastSectionStartString, 64, 0, v6, self->_locale) == -1
    && objc_msgSend(a3, "compare:options:range:locale:", self->_firstSectionStartString, 64, 0, v6, self->_locale) != -1)
  {
    goto LABEL_17;
  }
  if (!self->_primaryLanguageIsJapanese
    || ([(UILocalizedIndexedCollation *)self _kanaTranscriptionForString:a3],
        (MutableCopy = (__CFString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!self->_preferJapaneseRomajiTranscriptions)
    {
      MutableCopy = [a3 _stringByApplyingTransform:*MEMORY[0x1E4F1D4F8]];
      if (MutableCopy) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    v7 = [(UILocalizedIndexedCollation *)self _kanaTranscriptionForString:a3];
    uint64_t v8 = v7;
    if (!v7) {
      v7 = a3;
    }
    MutableCopy = [v7 _stringByApplyingTransform:*MEMORY[0x1E4F1D4F8]];

    if (!MutableCopy) {
LABEL_17:
    }
      MutableCopy = (__CFString *)a3;
  }
LABEL_18:
  return MutableCopy;
}

- (__CFStringTokenizer)tokenizer
{
  result = self->_tokenizer;
  if (!result)
  {
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFLocaleRef v5 = (const __CFLocale *)[MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"ja"];
    v6.location = 0;
    v6.length = 0;
    result = CFStringTokenizerCreate(v4, 0, v6, 0, v5);
    self->_tokenizer = result;
  }
  return result;
}

+ (UILocalizedIndexedCollation)currentCollation
{
  v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  CFAllocatorRef v4 = [v3 pathForResource:@"UITableViewLocalizedSectionIndex" ofType:@"plist"];

  CFLocaleRef v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v4];
  CFRange v6 = [a1 collationWithDictionary:v5];

  return (UILocalizedIndexedCollation *)v6;
}

- (void)dealloc
{
  tokenizer = self->_tokenizer;
  if (tokenizer) {
    CFRelease(tokenizer);
  }
  v4.receiver = self;
  v4.super_class = (Class)UILocalizedIndexedCollation;
  [(UILocalizedIndexedCollation *)&v4 dealloc];
}

- (NSArray)sectionTitles
{
  return self->_sectionTitles;
}

- (NSArray)sectionIndexTitles
{
  sectionIndexTitles = self->_sectionIndexTitles;
  if (!sectionIndexTitles) {
    sectionIndexTitles = self->_sectionTitles;
  }
  v3 = sectionIndexTitles;
  return v3;
}

- (NSInteger)sectionForSectionIndexTitleAtIndex:(NSInteger)indexTitleIndex
{
  NSInteger v3 = indexTitleIndex;
  sectionIndexMapping = self->_sectionIndexMapping;
  if (sectionIndexMapping)
  {
    CFLocaleRef v5 = [(NSArray *)sectionIndexMapping objectAtIndex:indexTitleIndex];
    NSInteger v3 = (int)[v5 intValue];
  }
  return v3;
}

- (NSInteger)sectionForObject:(id)object collationStringSelector:(SEL)selector
{
  sectionStartStrings = self->_sectionStartStrings;
  if (!sectionStartStrings) {
    sectionStartStrings = self->_sectionTitles;
  }
  CFRange v6 = ((void (*)(id, SEL))[object methodForSelector:selector])(object, selector);
  v7 = [(UILocalizedIndexedCollation *)self transformedCollationStringForString:v6];

  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = [(NSArray *)sectionStartStrings count];
  if (v8 < 1) {
    goto LABEL_14;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  do
  {
    uint64_t v11 = v10 + v9;
    if (v10 + v9 < 0 != __OFADD__(v10, v9)) {
      ++v11;
    }
    NSInteger v12 = v11 >> 1;
    uint64_t v13 = objc_msgSend(v7, "compare:options:range:locale:", -[NSArray objectAtIndex:](sectionStartStrings, "objectAtIndex:", v11 >> 1), 64, 0, objc_msgSend(v7, "length"), self->_locale);
    if (v13 == -1)
    {
      uint64_t v9 = v12;
    }
    else
    {
      if (v13 != 1) {
        goto LABEL_16;
      }
      uint64_t v10 = v12 + 1;
    }
  }
  while (v10 < v9);
  if (v10 <= 0) {
LABEL_14:
  }
    uint64_t v10 = [(NSArray *)sectionStartStrings count];
  NSInteger v12 = v10 - 1;
LABEL_16:

  return v12;
}

- (NSArray)sortedArrayFromArray:(NSArray *)array collationStringSelector:(SEL)selector
{
  v6[0] = self;
  v6[1] = selector;
  objc_super v4 = [(NSArray *)array sortedArrayUsingFunction:localizedObjectSort context:v6];
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSectionStartString, 0);
  objc_storeStrong((id *)&self->_firstSectionStartString, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_sectionIndexMapping, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_sectionStartStrings, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
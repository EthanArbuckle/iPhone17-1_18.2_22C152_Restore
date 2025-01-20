@interface _UIDefinitionDictionary
+ (id)_normalizedLanguageStringForLanguageCode:(id)a3;
- (BOOL)_hasDefinitionForTerm:(id)a3;
- (BOOL)_isTTYDictionary;
- (BOOL)activated;
- (BOOL)assetIsDeletable;
- (BOOL)assetIsLocal;
- (MAAsset)assetToUpgrade;
- (MAAsset)rawAsset;
- (NSString)definitionLanguage;
- (NSString)localizedDictionaryName;
- (NSString)localizedLanguageName;
- (_UIDefinitionDictionary)initWithAsset:(id)a3;
- (id)_HTMLDefinitionForTerm:(id)a3 type:(int64_t)a4;
- (id)_attributedDefinitionForTerm:(id)a3;
- (id)_definitionValueForTerm:(id)a3;
- (id)_fullHTMLDefinitionForTerm:(id)a3;
- (id)_shortHTMLDefinitionForTerm:(id)a3;
- (id)description;
- (void)dealloc;
- (void)setActivated:(BOOL)a3;
- (void)setAssetToUpgrade:(id)a3;
- (void)updateAsset;
@end

@implementation _UIDefinitionDictionary

- (_UIDefinitionDictionary)initWithAsset:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDefinitionDictionary;
  v6 = [(_UIDefinitionDictionary *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rawAsset, a3);
    v8 = [(MAAsset *)v7->_rawAsset attributes];
    uint64_t v9 = [v8 objectForKey:@"Language"];
    definitionLanguage = v7->_definitionLanguage;
    v7->_definitionLanguage = (NSString *)v9;

    [(_UIDefinitionDictionary *)v7 updateAsset];
  }

  return v7;
}

- (void)updateAsset
{
  assetToUpgrade = self->_assetToUpgrade;
  if (assetToUpgrade)
  {
    objc_storeStrong((id *)&self->_rawAsset, assetToUpgrade);
    v4 = self->_assetToUpgrade;
    self->_assetToUpgrade = 0;
  }
  if ([(_UIDefinitionDictionary *)self assetIsLocal])
  {
    dictionary = self->_dictionary;
    if (dictionary) {
      CFRelease(dictionary);
    }
    v6 = [(MAAsset *)self->_rawAsset attributes];
    uint64_t v7 = [(MAAsset *)self->_rawAsset getLocalFileUrl];
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    v8 = (uint64_t (*)(void *, uint64_t))getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr;
    v15 = getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr;
    if (!getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr)
    {
      uint64_t v9 = DictionaryServicesLibrary_0();
      v13[3] = (uint64_t)dlsym(v9, "DCSDictionaryCreateWithAssetAttributes");
      getDCSDictionaryCreateWithAssetAttributesSymbolLoc_ptr = (_UNKNOWN *)v13[3];
      v8 = (uint64_t (*)(void *, uint64_t))v13[3];
    }
    _Block_object_dispose(&v12, 8);
    if (v8)
    {
      self->_dictionary = (__DCSDictionary *)v8(v6, v7);
    }
    else
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", "DCSDictionaryRef _DCSDictionaryCreateWithAssetAttributes(CFDictionaryRef, CFURLRef)");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"_UIDictionaryManager.m", 34, @"%s", dlerror());

      __break(1u);
    }
  }
}

- (BOOL)assetIsLocal
{
  return [(MAAsset *)self->_rawAsset wasLocal];
}

- (BOOL)assetIsDeletable
{
  return [(MAAsset *)self->_rawAsset wasPurgeable];
}

- (void)dealloc
{
  dictionary = self->_dictionary;
  if (dictionary)
  {
    CFRelease(dictionary);
    self->_dictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIDefinitionDictionary;
  [(_UIDefinitionDictionary *)&v4 dealloc];
}

- (NSString)localizedLanguageName
{
  if ([(_UIDefinitionDictionary *)self _isTTYDictionary])
  {
    _UINSLocalizedStringWithDefaultValue(@"TTY Dictionary", @"TTY Dictionary");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v4 = [(MAAsset *)self->_rawAsset attributes];
    id v5 = [v4 objectForKey:@"IndexLanguages"];

    v6 = objc_opt_class();
    uint64_t v7 = [v5 firstObject];
    v8 = [v6 _normalizedLanguageStringForLanguageCode:v7];

    if ([v5 count] == 1)
    {
      id v9 = v8;
    }
    else if ([v5 count] == 2)
    {
      v10 = objc_opt_class();
      v11 = [v5 objectAtIndex:1];
      uint64_t v12 = [v10 _normalizedLanguageStringForLanguageCode:v11];

      id v9 = [NSString stringWithFormat:@"%@-%@", v8, v12];
    }
    else
    {
      id v9 = 0;
    }
    id v3 = v9;
  }
  return (NSString *)v3;
}

- (NSString)localizedDictionaryName
{
  v2 = [(MAAsset *)self->_rawAsset attributes];
  id v3 = [v2 objectForKey:@"DictionaryPackageDisplayName"];
  if (!v3)
  {
    id v3 = [v2 objectForKey:@"DictionaryPackageName"];
  }
  objc_super v4 = [v3 stringByDeletingPathExtension];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v7 = *MEMORY[0x1E4F1C430];
    v8 = [v2 objectForKey:@"Language"];
    id v5 = [v6 displayNameForKey:v7 value:v8];
  }
  return (NSString *)v5;
}

+ (id)_normalizedLanguageStringForLanguageCode:(id)a3
{
  v14[64] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    v6 = 0;
    goto LABEL_12;
  }
  objc_super v4 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v3];
  if ([v4 isEqual:@"en-US"])
  {
    uint64_t v5 = _UINSLocalizedStringWithDefaultValue(@"American English", @"American English");
  }
  else
  {
    if (qword_1EB260048 != -1) {
      dispatch_once(&qword_1EB260048, &__block_literal_global_136);
    }
    v13[1] = 0;
    id v7 = v3;
    [v7 UTF8String];
    uint64_t v8 = uldn_localeDisplayName();
    unsigned int v9 = v8;
    if ((int)v8 >= 257)
    {
      MEMORY[0x1F4188790](v8);
      v11 = (char *)v13 - v10;
      [v7 UTF8String];
      uldn_localeDisplayName();
      v6 = [NSString stringWithCharacters:v11 length:v9];
      goto LABEL_11;
    }
    uint64_t v5 = [NSString stringWithCharacters:v14 length:(int)v8];
  }
  v6 = (void *)v5;
LABEL_11:

LABEL_12:
  return v6;
}

- (BOOL)_hasDefinitionForTerm:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 >= 0xFA) {
    uint64_t v6 = 250;
  }
  else {
    uint64_t v6 = v5;
  }
  id v7 = [v4 substringToIndex:v6];
  uint64_t v8 = v7;
  dictionary = self->_dictionary;
  if (!dictionary) {
    goto LABEL_9;
  }
  uint64_t v10 = [v7 length];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v11 = getDCSHasDefinitionForTermSymbolLoc_ptr;
  v19 = getDCSHasDefinitionForTermSymbolLoc_ptr;
  if (!getDCSHasDefinitionForTermSymbolLoc_ptr)
  {
    uint64_t v12 = DictionaryServicesLibrary_0();
    v17[3] = (uint64_t)dlsym(v12, "DCSHasDefinitionForTerm");
    getDCSHasDefinitionForTermSymbolLoc_ptr = (_UNKNOWN *)v17[3];
    v11 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v11)
  {
    LOBYTE(dictionary) = ((unsigned int (*)(__DCSDictionary *, void *, void, uint64_t, uint64_t, void))v11)(dictionary, v8, 0, v10, 2, 0) != 0;
LABEL_9:

    return (char)dictionary;
  }
  uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
  v15 = objc_msgSend(NSString, "stringWithUTF8String:", "Boolean _DCSHasDefinitionForTerm(DCSDictionaryRef, CFStringRef, CFRange, DCSTransformStyle, DCSDictionaryRef *)");
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"_UIDictionaryManager.m", 35, @"%s", dlerror());

  __break(1u);
  return result;
}

- (id)_HTMLDefinitionForTerm:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (self->_dictionary)
  {
    unint64_t v8 = [v6 length];
    if (v8 >= 0xFA) {
      uint64_t v9 = 250;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [v7 substringToIndex:v9];
    dictionary = self->_dictionary;
    uint64_t v12 = [v10 length];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    v13 = getDCSCopyDefinitionMarkupSymbolLoc_ptr;
    v22 = getDCSCopyDefinitionMarkupSymbolLoc_ptr;
    if (!getDCSCopyDefinitionMarkupSymbolLoc_ptr)
    {
      uint64_t v14 = DictionaryServicesLibrary_0();
      v20[3] = (uint64_t)dlsym(v14, "DCSCopyDefinitionMarkup");
      getDCSCopyDefinitionMarkupSymbolLoc_ptr = (_UNKNOWN *)v20[3];
      v13 = (void *)v20[3];
    }
    _Block_object_dispose(&v19, 8);
    if (!v13)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef _DCSCopyDefinitionMarkup(DCSDictionaryRef, CFStringRef, CFRange, DCSTransformStyle, CFURLRef *)");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"_UIDictionaryManager.m", 36, @"%s", dlerror());

      __break(1u);
      return result;
    }
    v15 = (void *)((uint64_t (*)(__DCSDictionary *, void *, void, uint64_t, int64_t, void))v13)(dictionary, v10, 0, v12, a4, 0);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_shortHTMLDefinitionForTerm:(id)a3
{
  return [(_UIDefinitionDictionary *)self _HTMLDefinitionForTerm:a3 type:2];
}

- (id)_fullHTMLDefinitionForTerm:(id)a3
{
  return [(_UIDefinitionDictionary *)self _HTMLDefinitionForTerm:a3 type:1];
}

- (id)_attributedDefinitionForTerm:(id)a3
{
  id v3 = [(_UIDefinitionDictionary *)self _shortHTMLDefinitionForTerm:a3];
  id v4 = [v3 dataUsingEncoding:10];

  unint64_t v5 = (void *)[objc_alloc((Class)off_1E52D2C20) initWithData:v4 options:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 attributedString];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_definitionValueForTerm:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [_UIDefinitionValue alloc];
  id v6 = [(_UIDefinitionDictionary *)self localizedDictionaryName];
  id v7 = [(_UIDefinitionDictionary *)self _attributedDefinitionForTerm:v4];
  unint64_t v8 = [(_UIDefinitionDictionary *)self _fullHTMLDefinitionForTerm:v4];
  uint64_t v9 = [(_UIDefinitionValue *)v5 initWithLocalizedDictionaryName:v6 term:v4 definition:v7 longDefinition:v8];

  [(_UIDefinitionValue *)v9 setRawAsset:self->_rawAsset];
  return v9;
}

- (BOOL)_isTTYDictionary
{
  v2 = [(MAAsset *)self->_rawAsset attributes];
  id v3 = [v2 objectForKey:@"DictionaryPackageName"];
  char v4 = [v3 isEqualToString:@"TTY Abbreviations Dictionary.dictionary"];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  char v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  id v6 = [(_UIDefinitionDictionary *)self localizedDictionaryName];
  BOOL v7 = [(_UIDefinitionDictionary *)self activated];
  unint64_t v8 = @"inactive";
  if (v7) {
    unint64_t v8 = @"active";
  }
  uint64_t v9 = [v3 stringWithFormat:@"%@ <%p>: Dictionary name: %@ (%@), Asset: %@", v5, self, v6, v8, self->_rawAsset];

  return v9;
}

- (MAAsset)rawAsset
{
  return (MAAsset *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)definitionLanguage
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (MAAsset)assetToUpgrade
{
  return (MAAsset *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssetToUpgrade:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetToUpgrade, 0);
  objc_storeStrong((id *)&self->_definitionLanguage, 0);
  objc_storeStrong((id *)&self->_rawAsset, 0);
}

@end
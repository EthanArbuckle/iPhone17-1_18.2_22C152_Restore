@interface NSString
+ (id)crl_JSONStringFromString:(id)a3;
+ (id)crl_localizedDisplayNameWithPersonNameComponents:(id)a3;
+ (id)crl_redactedStringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)crl_regexStringForSearchString:(id)a3 options:(unint64_t)a4;
+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5;
+ (id)crl_stringByHexEncodingData:(id)a3;
+ (id)crl_stringByIndentingString:(id)a3;
+ (id)crl_stringByIndentingString:(id)a3 times:(unint64_t)a4;
+ (id)crl_stringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)crl_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)crl_stringWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)crl_stringWithUUID;
+ (id)crl_stringWithXMLString:(const char *)a3;
+ (id)crl_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4;
+ (id)crlwp_stringForValue:(unsigned int)a3 withListNumberFormat:(unint64_t)a4;
+ (id)crlwp_stringForValue:(unsigned int)a3 withListNumberFormat:(unint64_t)a4 includeFormatting:(BOOL)a5;
+ (id)crlwp_stringForValue:(unsigned int)a3 withPageNumberFormat:(int)a4;
+ (id)crlwpax_descriptionForParagraphAlignment:(int64_t)a3;
+ (id)crlwpax_descriptionForVerticalAlignment:(int64_t)a3;
+ (unint64_t)crlwp_numberForString:(id)a3 withListNumberFormat:(unint64_t)a4;
+ (unint64_t)crlwp_numberForString:(id)a3 withPageNumberFormat:(int)a4;
- (BOOL)crl_conformsToAnyUTI:(id)a3;
- (BOOL)crl_conformsToUTI:(id)a3;
- (BOOL)crl_containsOnlyCharactersFromSet:(id)a3;
- (BOOL)crl_containsSubstring:(id)a3;
- (BOOL)crl_isCJKString;
- (BOOL)crl_isChildOfPath:(id)a3;
- (BOOL)crl_isDescendantOfPath:(id)a3;
- (BOOL)crl_isEqualToString:(id)a3;
- (BOOL)crl_isPasteboardStateType;
- (BOOL)crl_pathConformsToUTI:(id)a3;
- (BOOL)crl_pathExtensionConformsToUTI:(id)a3;
- (BOOL)crl_representsPhysicalKeyboard;
- (BOOL)crlwp_NSDetectorMatchStringIsStrictPhoneNumber;
- (BOOL)crlwp_containsIdeographs;
- (BOOL)crlwp_isAllWhitespaceInRange:(_NSRange)a3;
- (BOOL)crlwp_isHyphenationAtCharacterIndex:(unint64_t)a3;
- (BOOL)crlwp_isLowerCaseFromIndex:(unint64_t)a3;
- (NSString)crl_UTIFilenameExtension;
- (NSString)crl_normalizedFilenameExtension;
- (NSString)crl_pathUTI;
- (_NSRange)crl_range;
- (_NSRange)crl_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5;
- (_NSRange)crl_rangeOfString:(id)a3 searchOptions:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5;
- (_NSRange)crlwp_rangeOfCharactersFromSet:(id)a3 index:(unint64_t)a4;
- (_NSRange)crlwp_rangeOfWordAtCharacterIndex:(unint64_t)a3 range:(_NSRange)a4 includePreviousWord:(BOOL)a5;
- (_NSRange)crlwp_rangeOfWordAtCharacterIndex:(unint64_t)a3 range:(_NSRange)a4 includePreviousWord:(BOOL)a5 includeHyphenation:(BOOL)a6;
- (id)crl_attributedStringAllowingHyphenationWithAlignment:(int64_t)a3 color:(id)a4;
- (id)crl_displayNameFromFilename;
- (id)crl_displayNameFromFilenameDeletingPathExtension:(BOOL)a3;
- (id)crl_encodeStringBase64;
- (id)crl_escapeForIcuRegex;
- (id)crl_escapeXML;
- (id)crl_filenameFromDisplayNameWithExtension:(id)a3;
- (id)crl_filenameFromDisplayNameWithExtension:(id)a3 characterLimit:(unint64_t)a4;
- (id)crl_filenameTruncatedToCharacterLimit:(unint64_t)a3;
- (id)crl_firstKey;
- (id)crl_initRedactedWithFormat:(id)a3;
- (id)crl_initRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)crl_initUnRedactedWithFormat:(id)a3;
- (id)crl_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4;
- (id)crl_initialsWithLimit:(unint64_t)a3;
- (id)crl_keyPathByAppendingKey:(id)a3;
- (id)crl_keyPathByPrependingKey:(id)a3;
- (id)crl_keyPathByRemovingFirstKey;
- (id)crl_keyPathByRemovingLastKey;
- (id)crl_lastKey;
- (id)crl_middleTruncateToLength:(unint64_t)a3;
- (id)crl_nameByConvertingFirstNameToInitials;
- (id)crl_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6;
- (id)crl_pathExceptPrivate;
- (id)crl_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4;
- (id)crl_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3;
- (id)crl_stringByAppendingSeparator:(id)a3 format:(id)a4;
- (id)crl_stringByApplyingSubstitutions:(id)a3;
- (id)crl_stringByCapitalizingToMatchString:(id)a3 range:(_NSRange)a4 searchOptions:(unint64_t)a5;
- (id)crl_stringByDeletingPathExtensionIfEqualTo:(id)a3;
- (id)crl_stringByExpandingTableFormatting;
- (id)crl_stringByFixingBrokenSurrogatePairs;
- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7;
- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3;
- (id)crl_stringByMakingFirstCharacterLowercase;
- (id)crl_stringByMakingFirstCharacterUppercase;
- (id)crl_stringByRemovingCharactersInSet:(id)a3;
- (id)crl_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4;
- (id)crl_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4;
- (id)crl_stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 searchOptions:(unint64_t)a5 range:(_NSRange)a6 replacementCount:(unint64_t *)a7;
- (id)crl_stringByTrimmingCharactersInSetFromFront:(id)a3;
- (id)crl_stringByUniquingPathInsideDirectory:(id)a3;
- (id)crl_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4;
- (id)crl_stringQuotedIfContainsCharacterSet:(id)a3;
- (id)crl_stringTrimByLimitingFirstCharacterToSet:(id)a3;
- (id)crl_stringWithNormalizedHyphens;
- (id)crl_stringWithNormalizedHyphensAndQuotationMarks;
- (id)crl_stringWithNormalizedQuotationMarks;
- (id)crl_stringWithPathRelativeTo:(id)a3;
- (id)crl_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4;
- (id)crl_stringWithRealpath;
- (id)crl_stringWithTrimmedWhitespace;
- (id)crl_stringWithoutAttachmentCharacters;
- (id)crl_stringWithoutBidiControls;
- (id)crl_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3;
- (id)crl_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3;
- (id)crl_tolerantStringByAppendingPathExtension:(id)a3;
- (id)crl_uncommentedAddress;
- (id)crl_uncommentedAddressRespectingGroups;
- (id)crl_unescapeXML;
- (id)crl_writeToFileUsingName:(id)a3 error:(id *)a4;
- (id)crlwp_replaceOccurrencesOfCharactersInSet:(id)a3 minimumConsecutiveLength:(unint64_t)a4 replaceString:(id)a5;
- (id)crlwp_stringByNormalizingParagraphBreaks;
- (id)crlwp_stringWithAddedIsolatesBasedOn:(int64_t)a3;
- (id)crlwp_stringWithUnambiguousNeutralEnding;
- (id)crlwp_stringWithoutControlCharacters;
- (int)crlwp_contentsScript;
- (int)crlwp_contentsScriptInRange:(_NSRange)a3;
- (unint64_t)crl_countInstancesOfString:(id)a3 options:(unint64_t)a4;
- (unint64_t)crl_numberOfKeysInKeyPath;
- (unint64_t)crlwp_findIndexOfCharacter:(unsigned __int16)a3 range:(_NSRange)a4;
- (unsigned)crlwp_utf32CharacterAtIndex:(unint64_t)a3;
- (unsigned)crlwp_utf32CharacterAtIndex:(unint64_t)a3 planeClassification:(int64_t *)a4;
- (void)crl_appendJSONStringToString:(id)a3;
- (void)crl_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4;
@end

@implementation NSString

- (BOOL)crl_representsPhysicalKeyboard
{
  return 0;
}

- (BOOL)crl_conformsToUTI:(id)a3
{
  id v4 = a3;
  v5 = +[CRLIngestionTypes nativeTypes];
  unsigned int v6 = [v5 containsObject:v4];

  if (v6)
  {
    unsigned __int8 v7 = [(NSString *)self isEqualToString:v4];
  }
  else
  {
    v8 = +[UTType typeWithIdentifier:self];
    if (v8
      && (+[CRLIngestionTypes unsupportedImageTypes],
          v9 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v10 = [v9 containsObject:v4],
          v9,
          (v10 & 1) == 0))
    {
      uint64_t v11 = +[UTType typeWithIdentifier:v4];
      if (v11)
      {
        v12 = (void *)v11;
        unsigned __int8 v7 = [v8 conformsToType:v11];
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D6EC8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107A834();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D6EE8);
        }
        v13 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010668E0(v13);
        }
        v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLUTIUtilities) crl_conformsToUTI:]");
        v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLUTIUtilities.m"];
        +[CRLAssertionHandler handleFailureInFunction:v12, v14, 61, 0, "Could not instantiate UTType for %@", v4 file lineNumber isFatal description];

        unsigned __int8 v7 = 0;
      }
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  return v7;
}

- (BOOL)crl_conformsToAnyUTI:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[NSString crl_conformsToUTI:](self, "crl_conformsToUTI:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (NSString)crl_UTIFilenameExtension
{
  v3 = +[UTType typeWithIdentifier:self];
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6F08);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A8C8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6F28);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v4);
    }
    id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLUTIUtilities) crl_UTIFilenameExtension]");
    id v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLUTIUtilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:v5, v6, 79, 0, "Failed to create UTType for %@", self file lineNumber isFatal description];
  }
  uint64_t v7 = [v3 preferredFilenameExtension];

  return (NSString *)v7;
}

- (NSString)crl_pathUTI
{
  v3 = [(NSString *)self pathExtension];
  if (!v3)
  {
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  if (![(NSString *)self isAbsolutePath])
  {
    v8 = UTTagClassFilenameExtension;
    goto LABEL_8;
  }
  char v12 = 1;
  id v4 = +[NSFileManager defaultManager];
  unsigned __int8 v5 = [v4 fileExistsAtPath:self isDirectory:&v12];
  id v6 = (id *)&UTTypeData;
  if ((v5 & (v12 == 0)) == 0) {
    id v6 = (id *)&UTTypeDirectory;
  }
  id v7 = *v6;

  v8 = UTTagClassFilenameExtension;
  BOOL v9 = +[UTType typeWithTag:v3 tagClass:UTTagClassFilenameExtension conformingToType:v7];

  if ([v9 isDynamic])
  {

LABEL_8:
    BOOL v9 = +[UTType typeWithTag:v3 tagClass:v8 conformingToType:0];
    if (![v9 isDynamic]) {
      goto LABEL_11;
    }

    goto LABEL_10;
  }
  if (!v9) {
    goto LABEL_8;
  }
LABEL_11:
  unsigned __int8 v10 = [v9 identifier];

  return (NSString *)v10;
}

- (NSString)crl_normalizedFilenameExtension
{
  v2 = [(NSString *)self crl_pathUTI];
  v3 = [v2 crl_UTIFilenameExtension];

  return (NSString *)v3;
}

- (BOOL)crl_pathConformsToUTI:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSString *)self pathExtension];
  unsigned __int8 v6 = [v5 crl_pathExtensionConformsToUTI:v4];

  return v6;
}

- (BOOL)crl_pathExtensionConformsToUTI:(id)a3
{
  id v3 = a3;
  +[UTType typesWithTag:v3 tagClass:UTTagClassFilenameExtension conformingToType:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isDynamic", (void)v12) & 1) == 0)
        {
          BOOL v9 = [v8 identifier];
          unsigned __int8 v10 = [v9 crl_conformsToUTI:v3];

          if (v10)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

- (id)crlwp_stringByNormalizingParagraphBreaks
{
  v2 = self;
  uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
  v31 = v2;
  uint64_t v34 = 0;
  int64_t v35 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  v33 = CStringPtr;
  int64_t v36 = 0;
  int64_t v37 = 0;
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
    id v7 = 0;
    v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = 64;
    while (1)
    {
      if ((unint64_t)v9 >= 3) {
        uint64_t v11 = 3;
      }
      else {
        uint64_t v11 = v9;
      }
      if ((unint64_t)v9 >= 4) {
        uint64_t v12 = 4;
      }
      else {
        uint64_t v12 = v9;
      }
      if (v35 <= v9) {
        goto LABEL_48;
      }
      if (CharactersPtr)
      {
        UniChar v13 = CharactersPtr[v9 + v34];
      }
      else if (v33)
      {
        UniChar v13 = v33[v34 + v9];
      }
      else
      {
        if (v37 <= v9 || v6 > v9)
        {
          uint64_t v14 = -v12;
          uint64_t v15 = v12 + v5;
          uint64_t v16 = v10 - v12;
          int64_t v17 = v9 + v14;
          int64_t v18 = v17 + 64;
          if (v17 + 64 >= v35) {
            int64_t v18 = v35;
          }
          int64_t v36 = v17;
          int64_t v37 = v18;
          v19.location = v17 + v34;
          if (v35 >= v16) {
            uint64_t v20 = v16;
          }
          else {
            uint64_t v20 = v35;
          }
          v19.length = v20 + v15;
          CFStringGetCharacters(v31, v19, buffer);
          int64_t v6 = v36;
        }
        UniChar v13 = buffer[v9 - v6];
      }
      if (v13 == 8233) {
        goto LABEL_33;
      }
      if (v13 == 13) {
        break;
      }
LABEL_48:
      ++v9;
      --v5;
      ++v10;
      if (v9 >= v3)
      {

        goto LABEL_59;
      }
    }
    int64_t v21 = v9 + 1;
    if (v9 + 1 >= v3 || v35 <= v21)
    {
LABEL_33:
      uint64_t v24 = 1;
      if (!v8) {
        goto LABEL_42;
      }
      goto LABEL_34;
    }
    if (CharactersPtr)
    {
      v22 = (UniChar *)&CharactersPtr[v9 + v34];
    }
    else
    {
      if (v33)
      {
        UniChar v23 = v33[v34 + 1 + v9];
LABEL_38:
        if (v23 == 10) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 1;
        }
        if (!v8)
        {
LABEL_42:
          v8 = (__CFString *)[(__CFString *)v2 mutableCopyWithZone:0];

          v2 = v8;
          if (!v7)
          {
LABEL_43:
            __int16 v29 = 10;
            id v7 = [objc_alloc((Class)NSString) initWithCharacters:&v29 length:1];
          }
LABEL_44:
          -[__CFString replaceCharactersInRange:withString:](v8, "replaceCharactersInRange:withString:", v9, v24, v7);
          uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
          v31 = v2;
          uint64_t v34 = 0;
          int64_t v35 = v3;
          CharactersPtr = CFStringGetCharactersPtr(v2);
          if (CharactersPtr) {
            v25 = 0;
          }
          else {
            v25 = CFStringGetCStringPtr(v2, 0x600u);
          }
          int64_t v6 = 0;
          v33 = v25;
          int64_t v36 = 0;
          int64_t v37 = 0;
          goto LABEL_48;
        }
LABEL_34:
        if (!v7) {
          goto LABEL_43;
        }
        goto LABEL_44;
      }
      if (v37 <= v21 || v6 > v21)
      {
        uint64_t v26 = v9 - v11 + 64;
        if (v26 >= v35) {
          uint64_t v26 = v35;
        }
        int64_t v36 = v9 - v11;
        int64_t v37 = v26;
        if (v35 >= v10 - v11) {
          uint64_t v27 = v10 - v11;
        }
        else {
          uint64_t v27 = v35;
        }
        v39.length = v27 + v11 + v5;
        v39.location = v9 - v11 + v34;
        CFStringGetCharacters(v31, v39, buffer);
        int64_t v6 = v36;
      }
      v22 = &buffer[v9 - v6];
    }
    UniChar v23 = v22[1];
    goto LABEL_38;
  }
LABEL_59:

  return v2;
}

- (unint64_t)crlwp_findIndexOfCharacter:(unsigned __int16)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int v6 = a3;
  v33.NSUInteger length = [(NSString *)self length];
  v32.NSUInteger location = location;
  v32.NSUInteger length = length;
  v33.NSUInteger location = 0;
  NSRange v8 = NSIntersectionRange(v32, v33);
  if (!v8.length) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFStringRef theString = (CFStringRef)self;
  NSRange v29 = v8;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  int64_t v9 = CharactersPtr ? 0 : CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  uint64_t v30 = 0;
  int64_t v31 = 0;
  v28 = v9;
  if ((uint64_t)v8.length < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  for (uint64_t i = 64; ; ++i)
  {
    uint64_t v14 = (unint64_t)v12 >= 4 ? 4 : v12;
    if ((uint64_t)v29.length <= v12)
    {
      UniChar v15 = 0;
    }
    else if (CharactersPtr)
    {
      UniChar v15 = CharactersPtr[v12 + v29.location];
    }
    else if (v28)
    {
      UniChar v15 = v28[v29.location + v12];
    }
    else
    {
      if (v31 <= v12 || v11 > v12)
      {
        uint64_t v17 = -v14;
        uint64_t v18 = v14 + v10;
        uint64_t v19 = i - v14;
        uint64_t v20 = v12 + v17;
        NSUInteger v21 = v20 + 64;
        if (v20 + 64 >= (uint64_t)v29.length) {
          NSUInteger v21 = v29.length;
        }
        uint64_t v30 = v20;
        int64_t v31 = v21;
        v22.NSUInteger location = v20 + v29.location;
        if ((uint64_t)v29.length >= v19) {
          NSUInteger v23 = v19;
        }
        else {
          NSUInteger v23 = v29.length;
        }
        v22.NSUInteger length = v23 + v18;
        CFStringGetCharacters(theString, v22, buffer);
        uint64_t v11 = v30;
      }
      UniChar v15 = buffer[v12 - v11];
    }
    if (v6 == v15) {
      break;
    }
    ++v12;
    --v10;
    if (v8.length == v12) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v8.location + v12;
}

- (_NSRange)crlwp_rangeOfCharactersFromSet:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(NSString *)self length];
  id v9 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", v6, 0, a4, v7 - a4);
  NSUInteger v10 = v8;
  if (v8)
  {
    unint64_t v11 = a4 + 1;
    if (a4 + 1 < v7)
    {
      unint64_t v12 = v8 + v7 + ~a4;
      while (objc_msgSend(v6, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v11)))
      {
        ++v10;
        if (v7 == ++v11)
        {
          NSUInteger v10 = v12;
          break;
        }
      }
    }
  }

  NSUInteger v13 = (NSUInteger)v9;
  NSUInteger v14 = v10;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (_NSRange)crlwp_rangeOfWordAtCharacterIndex:(unint64_t)a3 range:(_NSRange)a4 includePreviousWord:(BOOL)a5
{
  id v5 = -[NSString crlwp_rangeOfWordAtCharacterIndex:range:includePreviousWord:includeHyphenation:](self, "crlwp_rangeOfWordAtCharacterIndex:range:includePreviousWord:includeHyphenation:", a3, a4.location, a4.length, a5, 0);
  result.NSUInteger length = v6;
  result.NSUInteger location = (NSUInteger)v5;
  return result;
}

- (_NSRange)crlwp_rangeOfWordAtCharacterIndex:(unint64_t)a3 range:(_NSRange)a4 includePreviousWord:(BOOL)a5 includeHyphenation:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v12 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v13 = 0;
  NSUInteger v14 = [(NSString *)self length];
  unint64_t v15 = location + length;
  if (a3 < location || a3 - location >= length)
  {
    BOOL v16 = v15 == a3;
    if (v14 < v15)
    {
LABEL_6:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA580);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107F594();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA5A0);
      }
      uint64_t v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      uint64_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_rangeOfWordAtCharacterIndex:range:includePreviousWord:includeHyphenation:]");
      uint64_t v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v18 file:v19 lineNumber:968 isFatal:0 description:"Specified range is out of range of string"];

      if (v16) {
        goto LABEL_58;
      }
LABEL_21:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA5C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107F50C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA5E0);
      }
      CFRange v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      NSUInteger v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_rangeOfWordAtCharacterIndex:range:includePreviousWord:includeHyphenation:]");
      uint64_t v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v23 file:v24 lineNumber:969 isFatal:0 description:"Character index out of range"];

      goto LABEL_58;
    }
    if (v15 != a3) {
      goto LABEL_21;
    }
  }
  else if (v14 < v15)
  {
    BOOL v16 = 1;
    goto LABEL_6;
  }
  if (CFStringGetLength((CFStringRef)self) <= a3)
  {
    int v21 = 0;
  }
  else
  {
    uint64_t CharacterAtIndex = CFStringGetCharacterAtIndex((CFStringRef)self, a3);
    int v21 = 0;
    if (CharacterAtIndex && v15 > a3) {
      int v21 = sub_1001CA378(CharacterAtIndex) ^ 1;
    }
  }
  if (v7 && a3 > location)
  {
    uint64_t v25 = CFStringGetCharacterAtIndex((CFStringRef)self, a3 - 1);
    int v26 = sub_1001CA378(v25);
    v21 |= v26 ^ 1;
    if (!v26) {
      --a3;
    }
  }
  if (v21 && length)
  {
    v42.NSUInteger location = location;
    v42.NSUInteger length = length;
    uint64_t v27 = CFStringTokenizerCreate(0, (CFStringRef)self, v42, 4uLL, 0);
    v28 = v27;
    if (v27)
    {
      CFStringTokenizerTokenType v29 = CFStringTokenizerGoToTokenAtIndex(v27, a3);
      CFIndex v30 = 0;
      CFIndex v31 = -1;
      if (v29 && (v29 & 0x10) == 0)
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v28);
        CFIndex v31 = CurrentTokenRange.location;
        CFIndex v30 = CurrentTokenRange.length;
      }
    }
    else
    {
      CFIndex v30 = 0;
      CFIndex v31 = -1;
    }
    if (v31 != -1 && v30 != 0)
    {
      NSUInteger v12 = v31;
      NSUInteger v13 = v30;
      if (v6)
      {
        if ((CFStringTokenizerAdvanceToNextToken(v28) & 0x10) != 0
          && (CFRange v34 = CFStringTokenizerGetCurrentTokenRange(v28), v34.length == 1))
        {
          CFIndex v35 = v34.location;
          NSUInteger v12 = v31;
          NSUInteger v13 = v30;
          do
          {
            if (![(NSString *)self crlwp_isHyphenationAtCharacterIndex:v35]) {
              break;
            }
            if (CFStringTokenizerAdvanceToNextToken(v28) != 1) {
              break;
            }
            NSRange v43 = (NSRange)CFStringTokenizerGetCurrentTokenRange(v28);
            v40.NSUInteger location = v12;
            v40.NSUInteger length = v13;
            NSRange v36 = NSUnionRange(v40, v43);
            NSUInteger v12 = v36.location;
            NSUInteger v13 = v36.length;
            if ((CFStringTokenizerAdvanceToNextToken(v28) & 0x10) == 0) {
              break;
            }
            CFRange v37 = CFStringTokenizerGetCurrentTokenRange(v28);
            CFIndex v35 = v37.location;
          }
          while (v37.length == 1);
        }
        else
        {
          NSUInteger v12 = v31;
          NSUInteger v13 = v30;
        }
      }
    }
    if (v28) {
      CFRelease(v28);
    }
  }
LABEL_58:
  NSUInteger v38 = v12;
  NSUInteger v39 = v13;
  result.NSUInteger length = v39;
  result.NSUInteger location = v38;
  return result;
}

- (BOOL)crlwp_isHyphenationAtCharacterIndex:(unint64_t)a3
{
  int v3 = [(NSString *)self characterAtIndex:a3];
  BOOL result = 1;
  if (v3 > 8207)
  {
    unsigned int v5 = v3 - 8208;
    if (v5 > 0x17 || ((1 << v5) & 0x800003) == 0) {
      return 0;
    }
  }
  else if (v3 != 45 && v3 != 173 && v3 != 183)
  {
    return 0;
  }
  return result;
}

- (BOOL)crlwp_isAllWhitespaceInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v32.NSUInteger length = [(NSString *)self length];
  v30.NSUInteger location = location;
  v30.NSUInteger length = length;
  v32.NSUInteger location = 0;
  NSRange v6 = NSIntersectionRange(v30, v32);
  if (v6.length)
  {
    CFStringRef theString = (CFStringRef)self;
    NSRange v27 = v6;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
    }
    uint64_t v28 = 0;
    int64_t v29 = 0;
    int v26 = CStringPtr;
    if ((uint64_t)v6.length < 1)
    {
      return 1;
    }
    else
    {
      uint64_t v9 = 0;
      BOOL v8 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = 64;
      do
      {
        if ((unint64_t)v10 >= 4) {
          uint64_t v12 = 4;
        }
        else {
          uint64_t v12 = v10;
        }
        NSUInteger v13 = v27.length;
        if ((uint64_t)v27.length <= v10)
        {
          UniChar v14 = 0;
        }
        else if (CharactersPtr)
        {
          UniChar v14 = CharactersPtr[v10 + v27.location];
        }
        else if (v26)
        {
          UniChar v14 = v26[v27.location + v10];
        }
        else
        {
          uint64_t v15 = v28;
          if (v29 <= v10 || v28 > v10)
          {
            uint64_t v17 = -v12;
            uint64_t v18 = v12 + v9;
            uint64_t v19 = v11 - v12;
            uint64_t v20 = v10 + v17;
            NSUInteger v21 = v20 + 64;
            if (v20 + 64 >= (uint64_t)v27.length) {
              NSUInteger v21 = v27.length;
            }
            uint64_t v28 = v20;
            int64_t v29 = v21;
            if ((uint64_t)v27.length >= v19) {
              NSUInteger v13 = v19;
            }
            v31.NSUInteger length = v13 + v18;
            v31.NSUInteger location = v20 + v27.location;
            CFStringGetCharacters(theString, v31, buffer);
            uint64_t v15 = v28;
          }
          UniChar v14 = buffer[v10 - v15];
        }
        if ((sub_1001CA378(v14) & 1) == 0) {
          break;
        }
        BOOL v8 = ++v10 >= (int64_t)v6.length;
        --v9;
        ++v11;
      }
      while (v6.length != v10);
    }
  }
  else
  {
    return 0;
  }
  return v8;
}

- (id)crlwp_replaceOccurrencesOfCharactersInSet:(id)a3 minimumConsecutiveLength:(unint64_t)a4 replaceString:(id)a5
{
  CFCharacterSetRef v8 = (const __CFCharacterSet *)a3;
  id v9 = a5;
  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA600);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107F61C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA620);
    }
    uint64_t v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_10107F4C8();
    }

    uint64_t v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_replaceOccurrencesOfCharactersInSet:minimumConsecutiveLength:replaceString:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1060, 0, "invalid nil value for '%{public}s'", "replaceString");
  }
  v57 = 0;
  v58 = 0;
  v59 = 0;
  unint64_t v13 = [(NSString *)self length];
  CFStringRef theString = (CFStringRef)self;
  range.NSUInteger location = 0;
  range.CFIndex length = v13;
  CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  uint64_t v55 = 0;
  CFIndex length = 0;
  v53 = CStringPtr;
  if (v13 && range.length >= 1)
  {
    if (CharactersPtr)
    {
      UniChar v15 = CharactersPtr[range.location];
    }
    else if (CStringPtr)
    {
      UniChar v15 = CStringPtr[range.location];
    }
    else
    {
      if (range.length >= 0x40uLL) {
        v46.CFIndex length = 64;
      }
      else {
        v46.CFIndex length = range.length;
      }
      CFIndex length = v46.length;
      v46.NSUInteger location = range.location;
      CFStringGetCharacters(theString, v46, buffer);
      UniChar v15 = buffer[-v55];
    }
  }
  else
  {
    UniChar v15 = 0;
  }
  Boolean IsCharacterMember = CFCharacterSetIsCharacterMember(v8, v15);
  if (v13 < 2 || range.length < 2)
  {
    UniChar v17 = 0;
  }
  else if (CharactersPtr)
  {
    UniChar v17 = CharactersPtr[range.location + 1];
  }
  else if (v53)
  {
    UniChar v17 = v53[range.location + 1];
  }
  else
  {
    if (length < 2 || (uint64_t v47 = v55, v55 >= 2))
    {
      if (range.length >= 0x40uLL) {
        v48.CFIndex length = 64;
      }
      else {
        v48.CFIndex length = range.length;
      }
      uint64_t v55 = 0;
      CFIndex length = v48.length;
      v48.NSUInteger location = range.location;
      CFStringGetCharacters(theString, v48, buffer);
      uint64_t v47 = v55;
    }
    UniChar v17 = buffer[1 - v47];
  }
  int v18 = CFCharacterSetIsCharacterMember(v8, v17);
  v49 = self;
  if (v13)
  {
    unint64_t v19 = 0;
    unint64_t v20 = 0;
    BOOL v21 = v18 != 0;
    unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      Boolean v23 = IsCharacterMember;
      Boolean IsCharacterMember = v21;
      if (v23)
      {
        if (v19 < v22) {
          unint64_t v22 = v19;
        }
        ++v20;
        if (!v21)
        {
          if (v20 >= a4)
          {
            uint64_t v24 = v58;
            if (v58 >= v59)
            {
              int v26 = v57;
              uint64_t v27 = ((char *)v58 - (char *)v57) >> 4;
              unint64_t v28 = v27 + 1;
              if ((unint64_t)(v27 + 1) >> 60) {
                sub_100004E40();
              }
              uint64_t v29 = (char *)v59 - (char *)v57;
              if (v59 - v57 > v28) {
                unint64_t v28 = v29 >> 3;
              }
              if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v30 = v28;
              }
              if (v30)
              {
                CFRange v31 = (char *)sub_10001EAB0((uint64_t)&v59, v30);
                int v26 = v57;
                uint64_t v24 = v58;
              }
              else
              {
                CFRange v31 = 0;
              }
              NSRange v32 = (unint64_t *)&v31[16 * v27];
              *NSRange v32 = v22;
              v32[1] = v20;
              NSRange v33 = v32;
              if (v24 != v26)
              {
                do
                {
                  *((_OWORD *)v33 - 1) = *((_OWORD *)v24 - 1);
                  v33 -= 2;
                  v24 -= 2;
                }
                while (v24 != v26);
                int v26 = v57;
              }
              uint64_t v25 = v32 + 2;
              v57 = v33;
              v58 = v32 + 2;
              v59 = (unint64_t *)&v31[16 * v30];
              if (v26) {
                operator delete(v26);
              }
            }
            else
            {
              unint64_t *v58 = v22;
              v24[1] = v20;
              uint64_t v25 = v24 + 2;
            }
            unint64_t v20 = 0;
            v58 = v25;
          }
          else
          {
            unint64_t v20 = 0;
          }
          unint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      if (v19 < v13 - 2) {
        break;
      }
      BOOL v21 = 0;
LABEL_59:
      if (++v19 == v13) {
        goto LABEL_71;
      }
    }
    int64_t v34 = v19 + 2;
    if ((uint64_t)(v19 + 2) < 0 || (CFIndex v35 = range.length, range.length <= v34))
    {
      UniChar v38 = 0;
    }
    else
    {
      NSRange v36 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        CFIndex v37 = range.location + v34;
      }
      else
      {
        if (v53)
        {
          UniChar v38 = v53[range.location + v34];
          goto LABEL_58;
        }
        if (length <= v34 || (uint64_t v39 = v55, v55 > v34))
        {
          uint64_t v40 = v19 - 2;
          if ((unint64_t)v34 < 4) {
            uint64_t v40 = 0;
          }
          if (v40 + 64 < range.length) {
            CFIndex v35 = v40 + 64;
          }
          uint64_t v55 = v40;
          CFIndex length = v35;
          v61.NSUInteger location = range.location + v40;
          v61.CFIndex length = v35 - v40;
          CFStringGetCharacters(theString, v61, buffer);
          uint64_t v39 = v55;
        }
        CFIndex v37 = v34 - v39;
        NSRange v36 = buffer;
      }
      UniChar v38 = v36[v37];
    }
LABEL_58:
    BOOL v21 = CFCharacterSetIsCharacterMember(v8, v38) != 0;
    goto LABEL_59;
  }
LABEL_71:
  if (v58 == v57)
  {
    v41 = v49;
  }
  else
  {
    v41 = (NSString *)[(NSString *)v49 mutableCopy];
    for (uint64_t i = v58; i != v57; i -= 2)
    {
      uint64_t v43 = *(i - 2);
      uint64_t v44 = *(i - 1);
      -[NSString replaceCharactersInRange:withString:](v41, "replaceCharactersInRange:withString:", v43, v44, v9);
    }
  }
  if (v57)
  {
    v58 = v57;
    operator delete(v57);
  }

  return v41;
}

+ (unint64_t)crlwp_numberForString:(id)a3 withListNumberFormat:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    NSRange v6 = +[NSCharacterSet whitespaceCharacterSet];
    BOOL v7 = [v5 stringByTrimmingCharactersInSet:v6];

    if (!qword_1016A9140)
    {
      id v8 = objc_alloc_init((Class)NSMutableCharacterSet);
      id v9 = +[NSString stringWithCharacters:L".()" length:3];
      [v8 addCharactersInString:v9];

      uint64_t v10 = (void *)qword_1016A9140;
      qword_1016A9140 = (uint64_t)v8;
    }
    if (a4 >= 3)
    {
      uint64_t v11 = [v7 crl_stringByRemovingCharactersInSet:qword_1016A9140];

      BOOL v7 = (void *)v11;
    }
    if ((unint64_t)[v7 length] >= 0x65)
    {
      uint64_t v12 = [v7 substringWithRange:0, 100];

      BOOL v7 = (void *)v12;
    }
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        uint64_t v13 = sub_10016260C(v7);
        goto LABEL_15;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        uint64_t v13 = sub_100162718(v7);
        goto LABEL_15;
      case 6uLL:
      case 7uLL:
      case 8uLL:
        uint64_t v13 = sub_10016283C(v7);
        goto LABEL_15;
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
        uint64_t v13 = sub_100162884(v7);
        goto LABEL_15;
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
        uint64_t v13 = sub_100162980(v7);
LABEL_15:
        unint64_t v14 = v13;
        break;
      default:
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA640);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107F6C8();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA660);
        }
        BOOL v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_10107F4C8();
        }

        UniChar v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLWPAdditions) crlwp_numberForString:withListNumberFormat:]");
        int v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1179, 0, "Label format (%lu) not recognized.", a4);

        unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  else
  {
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

+ (unint64_t)crlwp_numberForString:(id)a3 withPageNumberFormat:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  if ([v5 length])
  {
    NSRange v6 = +[NSCharacterSet whitespaceCharacterSet];
    BOOL v7 = [v5 stringByTrimmingCharactersInSet:v6];

    if ((unint64_t)[v7 length] >= 0x65)
    {
      uint64_t v8 = [v7 substringWithRange:0, 100];

      BOOL v7 = (void *)v8;
    }
    switch((int)v4)
    {
      case 0:
        uint64_t v9 = sub_10016260C(v7);
        goto LABEL_20;
      case 1:
        uint64_t v9 = sub_100162718(v7);
        goto LABEL_20;
      case 2:
        uint64_t v9 = sub_10016283C(v7);
        goto LABEL_20;
      case 3:
        uint64_t v9 = sub_100162884(v7);
        goto LABEL_20;
      case 4:
        uint64_t v9 = sub_100162980(v7);
LABEL_20:
        unint64_t v10 = v9;
        break;
      default:
        int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA680);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107F754(v11);
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA6A0);
        }
        uint64_t v12 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_10107F4C8();
        }

        uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLWPAdditions) crlwp_numberForString:withPageNumberFormat:]");
        unint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 1220, 0, "Number format (%d) not recognized.", v4);

        unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        break;
    }
  }
  else
  {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

+ (id)crlwp_stringForValue:(unsigned int)a3 withListNumberFormat:(unint64_t)a4
{
  return +[NSString crlwp_stringForValue:*(void *)&a3 withListNumberFormat:a4 includeFormatting:1];
}

+ (id)crlwp_stringForValue:(unsigned int)a3 withListNumberFormat:(unint64_t)a4 includeFormatting:(BOOL)a5
{
  switch(a4)
  {
    case 0uLL:
      BOOL v7 = sub_100164298(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 1uLL:
      BOOL v7 = sub_100164298(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 2uLL:
      BOOL v7 = sub_100164298(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 3uLL:
      BOOL v7 = sub_100164480(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 4uLL:
      BOOL v7 = sub_100164480(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 5uLL:
      BOOL v7 = sub_100164480(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 6uLL:
      BOOL v7 = sub_100164700(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 7uLL:
      BOOL v7 = sub_100164700(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 8uLL:
      BOOL v7 = sub_100164700(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 9uLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)aAbcdefghijklmn_0, 0x1AuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0xAuLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)aAbcdefghijklmn_0, 0x1AuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0xBuLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)aAbcdefghijklmn_0, 0x1AuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0xCuLL:
      BOOL v7 = sub_10016475C(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0xDuLL:
      BOOL v7 = sub_10016475C(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0xEuLL:
      BOOL v7 = sub_10016475C(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0xFuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x10uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x11uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x12uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x13uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x14uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x15uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x16uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x17uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A34, 0x2EuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x18uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x19uLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x1AuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x1BuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x1CuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x1DuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175A90, 0x2FuLL, 1);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x1EuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 1u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x1FuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 1u);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x20uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 1u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x21uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 2u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x22uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 2u);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x23uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 2u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x24uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 3u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x25uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 3u);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x26uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 3u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x27uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 4u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x28uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 4u);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x29uLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 4u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x2AuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 5u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x2BuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 5u);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x2CuLL:
      BOOL v7 = sub_100164868(*(uint64_t *)&a3, 5u);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x2DuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175AEE, 0xEuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x2EuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175AEE, 0xEuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x2FuLL:
      BOOL v7 = sub_1001680C8(a3, (uint64_t)&unk_101175AEE, 0xEuLL, 0);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x30uLL:
      BOOL v7 = sub_100164B58(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@", v7];
      goto LABEL_67;
    case 0x31uLL:
      BOOL v7 = sub_100164D94(a3, @"ar");
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x32uLL:
      BOOL v7 = sub_100164D94(a3, @"ar");
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x33uLL:
      BOOL v7 = sub_100164D94(a3, @"ar");
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x34uLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175B2A, 0x1CuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x35uLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175B2A, 0x1CuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x36uLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175B2A, 0x1CuLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x37uLL:
      BOOL v7 = sub_100165020(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x38uLL:
      BOOL v7 = sub_100165020(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x39uLL:
      BOOL v7 = sub_100165020(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x3AuLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175BA0, 0x16uLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x3BuLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175BA0, 0x16uLL);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x3CuLL:
      BOOL v7 = sub_100167608(a3, (uint64_t)&unk_101175BA0, 0x16uLL);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
      goto LABEL_67;
    case 0x3DuLL:
      BOOL v7 = sub_1001653C8(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@", v7];
      goto LABEL_67;
    case 0x3EuLL:
      BOOL v7 = sub_1001653C8(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@.", v7];
      goto LABEL_67;
    case 0x3FuLL:
      BOOL v7 = sub_1001653C8(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"(%@)", v7];
      goto LABEL_67;
    case 0x40uLL:
      BOOL v7 = sub_1001653C8(a3);
      uint64_t v8 = +[NSString stringWithFormat:@"%@"], v7);
LABEL_67:
      uint64_t v9 = (__CFString *)v8;

      break;
    case 0x42uLL:
      uint64_t v12 = sub_1001647C4(a3);
      goto LABEL_77;
    case 0x43uLL:
      uint64_t v12 = sub_100164700(a3);
LABEL_77:
      uint64_t v9 = (__CFString *)v12;
      break;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA6C0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107F804();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA6E0);
      }
      uint64_t v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      unint64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLWPAdditions) crlwp_stringForValue:withListNumberFormat:includeFormatting:]");
      UniChar v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1438, 0, "Label format (%lu) invalid for numeric list.", a4);

      uint64_t v9 = &stru_101538650;
      break;
  }
  if (!a5)
  {
    if (qword_1016A9150 != -1) {
      dispatch_once(&qword_1016A9150, &stru_1014DA700);
    }
    uint64_t v10 = [(__CFString *)v9 crl_stringByRemovingCharactersInSet:qword_1016A9148];

    uint64_t v9 = (__CFString *)v10;
  }

  return v9;
}

- (BOOL)crlwp_NSDetectorMatchStringIsStrictPhoneNumber
{
  int v3 = +[NSCharacterSet letterCharacterSet];
  id v4 = [(NSString *)self rangeOfCharacterFromSet:v3];

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
    return 1;
  }
  id v5 = +[NSCharacterSet punctuationCharacterSet];
  id v6 = [(NSString *)self rangeOfCharacterFromSet:v5];

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL
    || [(NSString *)self length]
    && !u_charDigitValue([(NSString *)self crlwp_utf32CharacterAtIndex:0]))
  {
    return 1;
  }
  BOOL v7 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v8 = [(NSString *)self componentsSeparatedByCharactersInSet:v7];

  if ((unint64_t)[v8 count] < 2)
  {
    BOOL v15 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          unint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v14, "length", (void)v17) > 3)
          {
            BOOL v15 = 1;
            goto LABEL_22;
          }
          if ((unint64_t)[v14 length] <= 2)
          {
            BOOL v15 = 1;
            if (v11) {
              goto LABEL_22;
            }
            uint64_t v11 = 1;
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    BOOL v15 = 0;
LABEL_22:
  }
  return v15;
}

- (int)crlwp_contentsScript
{
  NSUInteger v3 = [(NSString *)self length];

  return -[NSString crlwp_contentsScriptInRange:](self, "crlwp_contentsScriptInRange:", 0, v3);
}

- (int)crlwp_contentsScriptInRange:(_NSRange)a3
{
  if (!a3.length) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location >= [(NSString *)self length]) {
    return 0;
  }
  unsigned int v6 = [(NSString *)self characterAtIndex:location];
  UChar32 v7 = v6;
  unint64_t v8 = 1;
  if (length >= 2 && (v6 & 0xFC00) == 0xD800)
  {
    unsigned int v9 = [(NSString *)self characterAtIndex:location + 1];
    unint64_t v8 = (v9 & 0xFC00) == 0xDC00 ? 2 : 1;
    if ((v9 & 0xFC00) == 0xDC00) {
      UChar32 v7 = v9 + (v7 << 10) - 56613888;
    }
  }
  int v10 = sub_1001C9A34(v7);
  if (v10 && length > v8)
  {
    CFStringRef theString = (CFStringRef)self;
    unint64_t v31 = v8 + location;
    int64_t v32 = length - v8;
    CharactersPtr = CFStringGetCharactersPtr((CFStringRef)self);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
    }
    int64_t v13 = 0;
    int64_t v33 = 0;
    int64_t v34 = 0;
    unint64_t v30 = CStringPtr;
    while (1)
    {
      int64_t v14 = v32;
      if (v32 <= v13) {
        break;
      }
      if (CharactersPtr)
      {
        UniChar v15 = CharactersPtr[v31 + v13];
      }
      else if (v30)
      {
        UniChar v15 = v30[v31 + v13];
      }
      else
      {
        int64_t v16 = v33;
        if (v34 <= v13 || v33 > v13)
        {
          int64_t v18 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            int64_t v18 = 0;
          }
          if (v18 + 64 < v32) {
            int64_t v14 = v18 + 64;
          }
          int64_t v33 = v18;
          int64_t v34 = v14;
          v35.NSUInteger location = v31 + v18;
          v35.NSUInteger length = v14 - v18;
          CFStringGetCharacters(theString, v35, buffer);
          int64_t v16 = v33;
        }
        UniChar v15 = buffer[v13 - v16];
      }
      UChar32 v19 = v15;
      if (!v15) {
        break;
      }
      int64_t v20 = v13 + 1;
      if (v15 >> 10 == 54)
      {
        int64_t v21 = v32;
        if (v32 > v20)
        {
          if (CharactersPtr)
          {
            UniChar v22 = CharactersPtr[v31 + v20];
          }
          else if (v30)
          {
            UniChar v22 = v30[v31 + v20];
          }
          else
          {
            if (v34 <= v20 || (int64_t v23 = v33, v33 > v20))
            {
              int64_t v24 = v13 - 3;
              if ((unint64_t)v13 < 3) {
                int64_t v24 = 0;
              }
              if (v24 + 64 < v32) {
                int64_t v21 = v24 + 64;
              }
              int64_t v33 = v24;
              int64_t v34 = v21;
              v36.NSUInteger location = v31 + v24;
              v36.NSUInteger length = v21 - v24;
              CFStringGetCharacters(theString, v36, buffer);
              int64_t v23 = v33;
            }
            UniChar v22 = buffer[v20 - v23];
          }
          int v25 = v22 >> 10;
          int v26 = (v19 << 10) - 56613888 + v22;
          if (v25 == 55) {
            int64_t v20 = v13 + 2;
          }
          else {
            int64_t v20 = v13 + 1;
          }
          if (v25 == 55) {
            UChar32 v19 = v26;
          }
        }
      }
      int64_t v13 = v20;
      if (sub_1001C9A34(v19) != v10) {
        return 1;
      }
    }
  }
  return v10;
}

+ (id)crlwp_stringForValue:(unsigned int)a3 withPageNumberFormat:(int)a4
{
  switch(a4)
  {
    case 0:
      id v5 = sub_100164298(a3);
      goto LABEL_11;
    case 1:
      id v5 = sub_100164480(a3);
      goto LABEL_11;
    case 2:
      id v5 = sub_100164700(a3);
      goto LABEL_11;
    case 3:
      id v5 = sub_100167608(a3, (uint64_t)aAbcdefghijklmn_0, 0x1AuLL);
      goto LABEL_11;
    case 4:
      id v5 = sub_10016475C(a3);
      goto LABEL_11;
    case 5:
      id v5 = sub_100164D94(a3, @"ar");
LABEL_11:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (unsigned)crlwp_utf32CharacterAtIndex:(unint64_t)a3
{
  unint64_t v5 = [(NSString *)self length];
  if (v5 <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA720);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107FDE0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA740);
    }
    uint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_10107F4C8();
    }

    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:]");
    int64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1635 isFatal:0 description:"index out of bounds"];

    return 0;
  }
  else
  {
    unint64_t v6 = v5;
    unsigned int v7 = [(NSString *)self characterAtIndex:a3];
    if ((v7 & 0xFC00) == 0xDC00)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA760);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107FCD0();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA780);
      }
      unint64_t v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      unsigned int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:]");
      int v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:1639 isFatal:0 description:"index inside surrogate pair"];
    }
    else if (a3 + 1 < v6 && (v7 & 0xFC00) == 0xD800)
    {
      unsigned int v15 = -[NSString characterAtIndex:](self, "characterAtIndex:");
      if ((v15 & 0xFC00) == 0xDC00)
      {
        return v15 + (v7 << 10) - 56613888;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA7A0);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107FD58();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014DA7C0);
        }
        int64_t v16 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_10107F4C8();
        }

        long long v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:]");
        int64_t v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:1643 isFatal:0 description:"invalid surrogate pair"];
      }
    }
  }
  return v7;
}

- (unsigned)crlwp_utf32CharacterAtIndex:(unint64_t)a3 planeClassification:(int64_t *)a4
{
  NSUInteger v7 = [(NSString *)self length];
  uint64_t v8 = [(NSString *)self characterAtIndex:a3];
  if ((v8 & 0xFC00) == 0xD800)
  {
    if (a4) {
      *a4 = 1;
    }
    if (v7 - 1 == a3)
    {
      unsigned int v11 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA860);
      }
      uint64_t v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v32 = v11;
        __int16 v33 = 2082;
        int64_t v34 = "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]";
        __int16 v35 = 2082;
        CFRange v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm";
        __int16 v37 = 1024;
        int v38 = 1712;
        __int16 v39 = 1024;
        int v40 = v8;
        __int16 v41 = 2048;
        unint64_t v42 = a3;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid surrogate pair (single code point=0x%x, index=%lu)", buf, 0x32u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA880);
      }
      int64_t v13 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      int64_t v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]");
      unsigned int v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 1712, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    else
    {
      unsigned int v16 = [(NSString *)self characterAtIndex:a3 + 1];
      if ((v16 & 0xFC00) == 0xDC00)
      {
        unsigned int v10 = v16 + (v8 << 10);
        goto LABEL_24;
      }
      unsigned int v25 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA8A0);
      }
      int v26 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v32 = v25;
        __int16 v33 = 2082;
        int64_t v34 = "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]";
        __int16 v35 = 2082;
        CFRange v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm";
        __int16 v37 = 1024;
        int v38 = 1720;
        __int16 v39 = 1024;
        int v40 = v8;
        __int16 v41 = 2048;
        unint64_t v42 = a3;
        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid surrogate pair (single code point=0x%x, index=%lu)", buf, 0x32u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA8C0);
      }
      uint64_t v27 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      unint64_t v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]");
      uint64_t v29 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 1720, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
  }
  else if ((v8 & 0xFC00) == 0xDC00)
  {
    if (a4) {
      *a4 = 2;
    }
    if (a3)
    {
      unsigned int v9 = [(NSString *)self characterAtIndex:a3 - 1];
      if ((v9 & 0xFC00) == 0xD800)
      {
        unsigned int v10 = v8 + (v9 << 10);
LABEL_24:
        LODWORD(v8) = v10 - 56613888;
        return v8;
      }
      unsigned int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA820);
      }
      int64_t v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        unsigned int v32 = v20;
        __int16 v33 = 2082;
        int64_t v34 = "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]";
        __int16 v35 = 2082;
        CFRange v36 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm";
        __int16 v37 = 1024;
        int v38 = 1701;
        __int16 v39 = 1024;
        int v40 = v8;
        __int16 v41 = 2048;
        unint64_t v42 = a3;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid surrogate pair (single code point=0x%x, index=%lu)", buf, 0x32u);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA840);
      }
      UniChar v22 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      int64_t v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]");
      int64_t v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 1701, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, a3);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA7E0);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10107FE68();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DA800);
      }
      long long v17 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10107F4C8();
      }

      int64_t v18 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_utf32CharacterAtIndex:planeClassification:]");
      UChar32 v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 1693, 0, "Invalid surrogate pair (single code point=0x%x, index=%lu)", v8, 0);
    }
  }
  else if (a4)
  {
    *a4 = 0;
  }
  return v8;
}

- (BOOL)crlwp_containsIdeographs
{
  CFStringRef theString = (CFStringRef)self;
  uint64_t v24 = 0;
  int64_t v25 = [(NSString *)self length];
  CharactersPtr = CFStringGetCharactersPtr(theString);
  CStringPtr = 0;
  UniChar v22 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)self, 0x600u);
  }
  int64_t v5 = 0;
  int64_t v26 = 0;
  int64_t v27 = 0;
  int64_t v23 = CStringPtr;
  while (1)
  {
    int64_t v6 = v25;
    if (v25 <= v5) {
      break;
    }
    if (v22)
    {
      UniChar v7 = v22[v24 + v5];
    }
    else if (v23)
    {
      UniChar v7 = v23[v24 + v5];
    }
    else
    {
      int64_t v8 = v26;
      if (v27 <= v5 || v26 > v5)
      {
        int64_t v10 = v5 - 4;
        if ((unint64_t)v5 < 4) {
          int64_t v10 = 0;
        }
        if (v10 + 64 < v25) {
          int64_t v6 = v10 + 64;
        }
        int64_t v26 = v10;
        int64_t v27 = v6;
        v28.NSUInteger location = v24 + v10;
        v28.NSUInteger length = v6 - v10;
        CFStringGetCharacters(theString, v28, buffer);
        int64_t v8 = v26;
      }
      UniChar v7 = buffer[v5 - v8];
    }
    UChar32 v11 = v7;
    if (!v7) {
      break;
    }
    int64_t v12 = v5 + 1;
    if (v7 >> 10 == 54)
    {
      int64_t v13 = v25;
      if (v25 > v12)
      {
        if (v22)
        {
          UniChar v14 = v22[v24 + v12];
        }
        else if (v23)
        {
          UniChar v14 = v23[v24 + v12];
        }
        else
        {
          if (v27 <= v12 || (int64_t v15 = v26, v26 > v12))
          {
            int64_t v16 = v5 - 3;
            if ((unint64_t)v5 < 3) {
              int64_t v16 = 0;
            }
            if (v16 + 64 < v25) {
              int64_t v13 = v16 + 64;
            }
            int64_t v26 = v16;
            int64_t v27 = v13;
            v29.NSUInteger location = v24 + v16;
            v29.NSUInteger length = v13 - v16;
            CFStringGetCharacters(theString, v29, buffer);
            int64_t v15 = v26;
          }
          UniChar v14 = buffer[v12 - v15];
        }
        int v17 = v14 >> 10;
        int v18 = (v11 << 10) + v14 - 56613888;
        if (v17 == 55) {
          int64_t v12 = v5 + 2;
        }
        else {
          int64_t v12 = v5 + 1;
        }
        if (v17 == 55) {
          UChar32 v11 = v18;
        }
      }
    }
    int64_t v5 = v12;
    if (sub_1001C9A34(v11) == 6) {
      return 1;
    }
  }
  return 0;
}

- (BOOL)crlwp_isLowerCaseFromIndex:(unint64_t)a3
{
  NSUInteger v5 = [(NSString *)self length];
  NSUInteger v6 = v5 - a3;
  if (v5 <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA8E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107FF18();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014DA900);
    }
    unsigned int v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      +[CRLAssertionHandler packedBacktraceString];
      objc_claimAutoreleasedReturnValue();
      sub_10107F4C8();
    }

    int64_t v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLWPAdditions) crlwp_isLowerCaseFromIndex:]");
    UChar32 v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/NSString+CRLWPAdditions.mm"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:1762 isFatal:0 description:"index is out of bounds"];

    return 1;
  }
  else
  {
    UniChar v7 = +[NSCharacterSet uppercaseLetterCharacterSet];
    BOOL v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", v7, 2, a3, v6) == (id)0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (id)crlwp_stringWithAddedIsolatesBasedOn:(int64_t)a3
{
  if ([(NSString *)self length] >= 2 && (a3 == -1 || sub_1001CD298(self) != a3))
  {
    id v5 = +[NSString stringWithFormat:@"⁨%@⁩", self];
  }
  else
  {
    id v5 = [(NSString *)self copy];
  }

  return v5;
}

- (id)crlwp_stringWithUnambiguousNeutralEnding
{
  NSUInteger v3 = [(NSString *)self length];
  NSUInteger v4 = v3 - 1;
  if (v3 <= 1
    || (v5 = v3, uint64_t v6 = sub_1001CD298(self), v6 == -1)
    || (uint64_t v7 = v6,
        unsigned int v8 = [(NSString *)self crlwp_utf32CharacterAtIndex:v4 planeClassification:0], v8 >= 0x10000)&& v5 == 2|| sub_1001CD248(v8) != 6)
  {
    id v10 = [(NSString *)self copy];
  }
  else
  {
    if (v7) {
      CFStringRef v9 = @"\u200F";
    }
    else {
      CFStringRef v9 = @"\u200E";
    }
    id v10 = [(NSString *)self stringByAppendingString:v9];
  }

  return v10;
}

- (id)crlwp_stringWithoutControlCharacters
{
  id v2 = [(NSString *)self mutableCopy];
  NSUInteger v3 = +[NSCharacterSet controlCharacterSet];
  while (1)
  {
    id v5 = [v2 rangeOfCharacterFromSet:v3];
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    [v2 deleteCharactersInRange:v5, v4];
  }
  id v6 = [v2 copy];

  return v6;
}

+ (id)crl_regexStringForSearchString:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v5 = a3;
  id v6 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"*?+[(){}^$|\\./");
  uint64_t v7 = +[NSCharacterSet characterSetWithCharactersInString:@"\"“”"];
  unsigned int v8 = +[NSCharacterSet characterSetWithCharactersInString:@"'‘’"];
  CFStringRef v9 = +[NSMutableString string];
  if ([v5 length])
  {
    uint64_t v10 = 0;
    while (1)
    {
      id v11 = [v5 characterAtIndex:v10];
      if (![v6 characterIsMember:v11]) {
        break;
      }
      [v9 appendFormat:@"\\%C", v11];
LABEL_12:
      if (++v10 >= (unint64_t)[v5 length]) {
        goto LABEL_13;
      }
    }
    if ((v4 & 0x10) != 0)
    {
      if ([v7 characterIsMember:v11])
      {
        int64_t v12 = v9;
        CFStringRef v13 = @"[\"“”]";
LABEL_11:
        [v12 appendFormat:v13, v29];
        goto LABEL_12;
      }
      if ([v8 characterIsMember:v11])
      {
        int64_t v12 = v9;
        CFStringRef v13 = @"['‘’]";
        goto LABEL_11;
      }
    }
    uint64_t v29 = v11;
    int64_t v12 = v9;
    CFStringRef v13 = @"%C";
    goto LABEL_11;
  }
LABEL_13:
  if ((v4 & 8) != 0)
  {
    UniChar v14 = +[NSRegularExpression regularExpressionWithPattern:@"\\b" options:0 error:0];
    if (v14)
    {
      id v15 = [v5 crl_range];
      int v17 = [v14 matchesInString:v5 options:0 range:v15];
      if ([v17 count])
      {
        int v18 = [v17 objectAtIndex:0];
        unint64_t v19 = (unint64_t)[v18 range];
        unint64_t v21 = v19 | v20;

        if (!v21)
        {
          uint64_t v22 = +[NSMutableString stringWithFormat:@"\\b%@", v9];

          CFStringRef v9 = (void *)v22;
        }
      }
      if ([v17 count])
      {
        int64_t v23 = [v17 lastObject];
        id v24 = [v23 range];
        uint64_t v30 = v25;
        id v26 = [v5 length];

        if (v24 == v26 && !v30)
        {
          uint64_t v27 = +[NSMutableString stringWithFormat:@"%@\\b", v9];

          CFStringRef v9 = (void *)v27;
        }
      }
    }
  }

  return v9;
}

- (_NSRange)crl_rangeOfString:(id)a3 searchOptions:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  unint64_t v8 = a4 & 1;
  id v9 = a3;
  if ((a4 & 4) != 0)
  {
    id v11 = [(NSString *)self crl_rangeOfString:v9 options:v8 | 4 updatingSearchRange:a5];
    NSUInteger v13 = v14;
  }
  else
  {
    uint64_t v10 = [objc_opt_class() crl_regexStringForSearchString:v9 options:a4];

    id v11 = [(NSString *)self crl_rangeOfString:v10 options:v8 | 0x400 updatingSearchRange:a5];
    NSUInteger v13 = v12;
    id v9 = (id)v10;
  }

  NSUInteger v15 = (NSUInteger)v11;
  NSUInteger v16 = v13;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (id)crl_stringByCapitalizingToMatchString:(id)a3 range:(_NSRange)a4 searchOptions:(unint64_t)a5
{
  char v5 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  uint64_t v10 = self;
  NSUInteger v11 = [(NSString *)v10 length];
  if ((v5 & 1) != 0 && v11 >= 2 && length >= 2)
  {
    NSUInteger v12 = +[NSCharacterSet lowercaseLetterCharacterSet];
    NSUInteger v13 = +[NSCharacterSet uppercaseLetterCharacterSet];
    id v14 = (id)[(NSString *)v10 characterAtIndex:0];
    id v15 = [v9 characterAtIndex:location];
    if ([v12 characterIsMember:v14]
      && [v13 characterIsMember:v15])
    {
      NSUInteger v16 = -[NSString substringWithRange:](v10, "substringWithRange:", 0, 1);
      int v17 = [v16 capitalizedString];

      if ([v17 length])
      {
        id v18 = [(NSString *)v10 mutableCopy];
        [v18 replaceCharactersInRange:0, 1 withString:v17];

        uint64_t v10 = (NSString *)v18;
      }
    }
  }

  return v10;
}

- (id)crl_stringByReplacingOccurrencesOfString:(id)a3 withString:(id)a4 searchOptions:(unint64_t)a5 range:(_NSRange)a6 replacementCount:(unint64_t *)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v12 = a3;
  id v13 = a4;
  id v14 = self;
  NSUInteger v29 = location;
  NSUInteger v30 = length;
  uint64_t v27 = v14;
  if (length)
  {
    unint64_t v15 = 0;
    NSUInteger v16 = 0;
    int v17 = v14;
    do
    {
      id v18 = -[NSString crl_rangeOfString:searchOptions:updatingSearchRange:](v17, "crl_rangeOfString:searchOptions:updatingSearchRange:", v12, a5, &v29, v27);
      if (v18 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v20 = v18;
        uint64_t v21 = v19;
        if (!v16)
        {
          NSUInteger v16 = (NSString *)[(NSString *)v17 mutableCopy];

          int v17 = v16;
        }
        uint64_t v22 = [v13 crl_stringByCapitalizingToMatchString:v17 range:v20 searchOptions:a5];
        -[NSString replaceCharactersInRange:withString:](v16, "replaceCharactersInRange:withString:", v20, v21, v22);
        ++v15;
        int64_t v23 = (char *)[v13 length];
        v29 += (NSUInteger)&v23[-v21];
      }
    }
    while (v30);
  }
  else
  {
    NSUInteger v16 = 0;
    unint64_t v15 = 0;
    int v17 = v14;
  }
  if (a7) {
    *a7 = v15;
  }
  if (v16) {
    id v24 = v16;
  }
  else {
    id v24 = v27;
  }
  uint64_t v25 = v24;

  return v25;
}

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3
{
  return [(NSString *)self crl_filenameFromDisplayNameWithExtension:a3 characterLimit:255];
}

- (id)crl_filenameFromDisplayNameWithExtension:(id)a3 characterLimit:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSString *)self stringByReplacingOccurrencesOfString:@"/" withString:@":"];
  unint64_t v8 = [v7 crl_tolerantStringByAppendingPathExtension:v6];

  id v9 = [v8 crl_filenameTruncatedToCharacterLimit:a4];

  return v9;
}

- (id)crl_filenameTruncatedToCharacterLimit:(unint64_t)a3
{
  char v4 = self;
  if (strlen([(NSString *)v4 fileSystemRepresentation]) > a3)
  {
    id v5 = [(NSString *)v4 stringByDeletingPathExtension];
    id v6 = (char *)[v5 length];
    uint64_t v7 = [(NSString *)v4 substringFromIndex:v6];
    unint64_t v8 = v6 - 1;
    do
    {
      id v9 = [v5 rangeOfComposedCharacterSequencesForRange:0, v8];
      NSUInteger v11 = [v5 substringWithRange:v9, v10];
      id v12 = [v11 stringByAppendingString:v7];

      if (!v8) {
        break;
      }
      id v5 = v12;
      --v8;
    }
    while (strlen((const char *)[v5 fileSystemRepresentation]) > a3);
    id v13 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v14 = [v12 stringByTrimmingCharactersInSet:v13];

    char v4 = (NSString *)v14;
  }

  return v4;
}

- (id)crl_displayNameFromFilename
{
  return [(NSString *)self crl_displayNameFromFilenameDeletingPathExtension:1];
}

- (id)crl_displayNameFromFilenameDeletingPathExtension:(BOOL)a3
{
  if (a3)
  {
    NSUInteger v3 = [(NSString *)self stringByDeletingPathExtension];
  }
  else
  {
    NSUInteger v3 = self;
  }
  char v4 = v3;
  id v5 = [(NSString *)v3 stringByReplacingOccurrencesOfString:@":" withString:@"/"];

  return v5;
}

- (id)crl_initialsWithLimit:(unint64_t)a3
{
  if ([(NSString *)self canBeConvertedToEncoding:5])
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    id v5 = +[NSMutableString string];
    id v6 = +[NSCharacterSet punctuationCharacterSet];
    uint64_t v7 = [(NSString *)self crl_stringByRemovingCharactersInSet:v6];

    id v8 = [v7 length];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100364930;
    v12[3] = &unk_1014F12D8;
    id v9 = v5;
    id v13 = v9;
    uint64_t v14 = v16;
    unint64_t v15 = a3;
    [v7 enumerateSubstringsInRange:0 options:v8 usingBlock:v12];
    uint64_t v10 = [v9 uppercaseString];

    _Block_object_dispose(v16, 8);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)crl_nameByConvertingFirstNameToInitials
{
  if ([(NSString *)self canBeConvertedToEncoding:5])
  {
    NSUInteger v3 = +[NSMutableString string];
    NSUInteger v4 = [(NSString *)self length];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100364AB0;
    v8[3] = &unk_1014F1300;
    id v5 = v3;
    id v9 = v5;
    uint64_t v10 = self;
    -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v4, 1027, v8);
    id v6 = (NSString *)v5;
  }
  else
  {
    id v6 = self;
  }

  return v6;
}

+ (id)crl_stringWithUUID
{
  CFUUIDRef v2 = CFUUIDCreate(0);
  if (v2)
  {
    CFUUIDRef v3 = v2;
    NSUInteger v4 = (__CFString *)CFUUIDCreateString(0, v2);
    CFRelease(v3);
  }
  else
  {
    NSUInteger v4 = 0;
  }

  return v4;
}

+ (id)crl_stringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];

  return v6;
}

+ (id)crl_stringByIndentingString:(id)a3 times:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 length];
  if (a4 && v6)
  {
    do
    {
      uint64_t v7 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];

      if ([v7 hasSuffix:@"\n  "])
      {
        uint64_t v8 = [v7 substringToIndex:[v7 length] - 2];

        uint64_t v7 = (void *)v8;
      }
      id v5 = [@"  " stringByAppendingString:v7];

      --a4;
    }
    while (a4);
  }
  id v9 = v5;

  return v9;
}

+ (id)crl_stringByIndentingString:(id)a3
{
  return [a1 crl_stringByIndentingString:a3 times:1];
}

- (id)crl_pathExceptPrivate
{
  if ([(NSString *)self rangeOfString:@"/private"])
  {
    NSUInteger v4 = self;
  }
  else
  {
    NSUInteger v4 = [(NSString *)self substringFromIndex:v3];
  }

  return v4;
}

- (id)crl_stringByExpandingTableFormatting
{
  NSUInteger v4 = [(NSString *)self componentsSeparatedByString:@"$"];
  id v5 = +[NSMutableArray array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v65 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        [v5 addObject:v12];
        id v13 = [v12 count];
        if (v9 <= v13) {
          id v9 = v13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v8);
  }
  else
  {
    id v9 = 0;
  }

  uint64_t v14 = [v5 lastObject];
  if ([v14 count] == (id)1)
  {
    unint64_t v15 = [v5 lastObject];
    NSUInteger v16 = [v15 objectAtIndexedSubscript:0];
    id v17 = [v16 length];

    if (!v17) {
      [v5 removeLastObject];
    }
  }
  else
  {
  }
  if (v9)
  {
    id v51 = v6;
    v52 = v3;
    id v18 = malloc_type_calloc(8uLL, (size_t)v9, 0xE9192C6EuLL);
    v60 = malloc_type_calloc(8uLL, (size_t)[v5 count], 0x549B2A7CuLL);
    uint64_t v55 = v5;
    if ([v5 count])
    {
      unint64_t v19 = 0;
      int v20 = 0;
      do
      {
        int v53 = v20;
        [v5 objectAtIndexedSubscript:v19];
        v58 = unint64_t v56 = v19;
        unint64_t v21 = 0;
        unsigned int v22 = 0;
        do
        {
          int64_t v23 = &stru_101538650;
          if ((unint64_t)[v58 count] > v21)
          {
            int64_t v23 = [v58 objectAtIndexedSubscript:v21];
          }
          id v24 = [(__CFString *)v23 componentsSeparatedByString:@"\n"];
          unint64_t v25 = v60[v19];
          id v26 = [v24 count];
          if (v25 <= (unint64_t)v26) {
            unint64_t v27 = (unint64_t)v26;
          }
          else {
            unint64_t v27 = v25;
          }
          v60[v19] = v27;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v28 = v24;
          id v29 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = *(void *)v62;
            do
            {
              for (j = 0; j != v30; j = (char *)j + 1)
              {
                if (*(void *)v62 != v31) {
                  objc_enumerationMutation(v28);
                }
                unint64_t v33 = v18[v21];
                id v34 = [*(id *)(*((void *)&v61 + 1) + 8 * (void)j) length];
                if (v33 <= (unint64_t)v34) {
                  unint64_t v35 = (unint64_t)v34;
                }
                else {
                  unint64_t v35 = v33;
                }
                v18[v21] = v35;
              }
              id v30 = [v28 countByEnumeratingWithState:&v61 objects:v69 count:16];
            }
            while (v30);
          }

          unint64_t v21 = ++v22;
          unint64_t v19 = v56;
        }
        while ((unint64_t)v9 > v22);

        unint64_t v19 = (v53 + 1);
        id v5 = v55;
        id v36 = [v55 count];
        int v20 = v53 + 1;
      }
      while ((unint64_t)v36 > v19);
    }
    id v9 = objc_alloc_init((Class)NSMutableString);
    if ([v5 count])
    {
      unint64_t v37 = 0;
      int v38 = 0;
      do
      {
        int v54 = v38;
        __int16 v39 = [v5 objectAtIndexedSubscript:v37];
        if (v60[v37])
        {
          unint64_t v40 = 0;
          int v41 = 0;
          unint64_t v57 = v37;
          do
          {
            int v59 = v41;
            if ([v39 count])
            {
              unint64_t v42 = 0;
              unsigned int v43 = 1;
              do
              {
                uint64_t v44 = &stru_101538650;
                if ((unint64_t)[v39 count] > v42)
                {
                  uint64_t v44 = [v39 objectAtIndexedSubscript:v42];
                }
                v45 = [(__CFString *)v44 componentsSeparatedByString:@"\n"];
                CFRange v46 = &stru_101538650;
                if ((unint64_t)[v45 count] > v40)
                {
                  CFRange v46 = [v45 objectAtIndexedSubscript:v40];
                }
                uint64_t v47 = [(__CFString *)v46 stringByPaddingToLength:v18[v42] + 1 withString:@" " startingAtIndex:0];
                [v9 appendString:v47];

                unint64_t v42 = v43;
              }
              while ((unint64_t)[v39 count] > v43++);
            }
            [v9 appendString:@"\n"];
            unint64_t v40 = (v59 + 1);
            int v41 = v59 + 1;
          }
          while (v60[v57] > v40);
        }

        unint64_t v37 = (v54 + 1);
        id v5 = v55;
        id v49 = [v55 count];
        int v38 = v54 + 1;
      }
      while ((unint64_t)v49 > v37);
    }
    free(v60);
    free(v18);
    id v6 = v51;
    uint64_t v3 = v52;
  }

  return v9;
}

- (id)crl_stringQuotedIfContainsCharacterSet:(id)a3
{
  NSUInteger v4 = self;
  if ([(NSString *)v4 rangeOfCharacterFromSet:a3] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [(NSString *)v4 mutableCopy];
    [v5 replaceOccurrencesOfString:@"\"" withString:@"\"\"" options:0 range:[v4 length]];
    [v5 appendString:@"\""];
    [v5 insertString:@"\"" atIndex:0];

    NSUInteger v4 = (NSString *)v5;
  }

  return v4;
}

- (id)crl_stringByAppendingSeparator:(id)a3 format:(id)a4
{
  id v6 = a3;
  id v7 = +[NSString crl_stringWithFormat:a4 arguments:&v11];
  if ([(NSString *)self length])
  {
    uint64_t v8 = [(NSString *)self stringByAppendingFormat:@"%@%@", v6, v7];

    id v7 = (void *)v8;
  }

  return v7;
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3
{
  return [(NSString *)self crl_stringByUniquingPathInsideDirectory:a3 withFormat:@"%@-%d%@"];
}

- (id)crl_stringByUniquingPathInsideDirectory:(id)a3 withFormat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1320);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3CB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1340);
    }
    uint64_t v8 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v8);
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByUniquingPathInsideDirectory:withFormat:]");
    uint64_t v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 268, 0, "invalid nil value for '%{public}s'", "directoryPath");
  }
  uint64_t v11 = self;
  id v12 = +[NSFileManager defaultManager];
  id v13 = [v6 stringByAppendingPathComponent:v11];
  unsigned int v14 = [v12 fileExistsAtPath:v13];

  if (v14)
  {
    NSUInteger v16 = [(NSString *)v11 pathExtension];
    context = v15;
    if (v16)
    {
      id v17 = v16;
      if ([(__CFString *)v16 length])
      {
        uint64_t v18 = [@"." stringByAppendingString:v17];

        id v17 = (__CFString *)v18;
      }
    }
    else
    {
      id v17 = &stru_101538650;
    }
    unint64_t v19 = [(NSString *)v11 stringByDeletingPathExtension];
    uint64_t v20 = 2;
    do
    {
      unint64_t v21 = v11;
      uint64_t v22 = (v20 + 1);
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v19, v20, v17);
      uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue();

      int64_t v23 = [v6 stringByAppendingPathComponent:v11];
      unsigned __int8 v24 = [v12 fileExistsAtPath:v23];

      uint64_t v20 = v22;
    }
    while ((v24 & 1) != 0);
  }

  return v11;
}

- (id)crl_stringByFixingBrokenSurrogatePairs
{
  CFUUIDRef v2 = self;
  uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
  CFStringRef theString = v2;
  uint64_t v31 = 0;
  int64_t v32 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  CStringPtr = 0;
  id v29 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v2, 0x600u);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int64_t v33 = 0;
  int64_t v34 = 0;
  id v30 = CStringPtr;
  if (v3 >= 1)
  {
    int64_t v6 = 0;
    id v7 = 0;
    int64_t v8 = 0;
    while (1)
    {
      if ((v8 & 0x8000000000000000) == 0)
      {
        int64_t v9 = v32;
        if (v32 > v8)
        {
          if (v29)
          {
            UniChar v10 = v29[v31 + v8];
          }
          else if (v30)
          {
            UniChar v10 = v30[v31 + v8];
          }
          else
          {
            if (v34 <= v8 || v6 > v8)
            {
              int64_t v11 = v8 - 4;
              if ((unint64_t)v8 < 4) {
                int64_t v11 = 0;
              }
              if (v11 + 64 < v32) {
                int64_t v9 = v11 + 64;
              }
              int64_t v33 = v11;
              int64_t v34 = v9;
              v36.NSUInteger location = v31 + v11;
              v36.NSUInteger length = v9 - v11;
              CFStringGetCharacters(theString, v36, (UniChar *)&v20);
              int64_t v6 = v33;
            }
            UniChar v10 = *((_WORD *)&v20 + v8 - v6);
          }
          int v12 = v10 & 0xFC00;
          if (v12 == 56320)
          {
LABEL_37:
            if (!v7)
            {
              id v7 = (__CFString *)-[__CFString mutableCopyWithZone:](v2, "mutableCopyWithZone:", 0, v20, v21, v22, v23, v24, v25, v26, v27);

              CFUUIDRef v2 = v7;
            }
            [(__CFString *)v7 replaceCharactersInRange:v8, 1, @"\uFFFD", v20, v21, v22, v23, v24, v25, v26, v27 withString];
            uint64_t v3 = (uint64_t)[(__CFString *)v2 length];
            CFStringRef theString = v2;
            uint64_t v31 = 0;
            int64_t v32 = v3;
            id v17 = CFStringGetCharactersPtr(v2);
            uint64_t v18 = 0;
            id v29 = v17;
            if (!v17) {
              uint64_t v18 = CFStringGetCStringPtr(v2, 0x600u);
            }
            int64_t v6 = 0;
            id v30 = v18;
            int64_t v33 = 0;
            int64_t v34 = 0;
            goto LABEL_42;
          }
          if (v12 == 55296)
          {
            int64_t v13 = v8 + 1;
            if (v8 + 1 >= v3) {
              goto LABEL_37;
            }
            int64_t v14 = v32;
            if (v32 <= v13) {
              goto LABEL_37;
            }
            if (v29)
            {
              UniChar v15 = v29[v31 + v13];
            }
            else if (v30)
            {
              UniChar v15 = v30[v31 + v13];
            }
            else
            {
              if (v34 <= v13 || v6 > v13)
              {
                int64_t v16 = v8 - 3;
                if ((unint64_t)v8 < 3) {
                  int64_t v16 = 0;
                }
                if (v16 + 64 < v32) {
                  int64_t v14 = v16 + 64;
                }
                int64_t v33 = v16;
                int64_t v34 = v14;
                v37.NSUInteger location = v31 + v16;
                v37.NSUInteger length = v14 - v16;
                CFStringGetCharacters(theString, v37, (UniChar *)&v20);
                int64_t v6 = v33;
              }
              UniChar v15 = *((_WORD *)&v20 + v13 - v6);
            }
            if (v15 >> 10 != 55) {
              goto LABEL_37;
            }
            ++v8;
          }
        }
      }
LABEL_42:
      if (++v8 >= v3)
      {

        break;
      }
    }
  }

  return v2;
}

- (id)crl_stringByRemovingCharactersInSet:(id)a3 options:(unsigned int)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = self;
    if ([(NSString *)v7 rangeOfCharacterFromSet:v6] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v8 = v7;
    }
    else
    {
      int64_t v8 = +[NSMutableString string];
      NSUInteger v12 = [(NSString *)v7 length];
      if (v12)
      {
        NSUInteger v13 = v12;
        int64_t v14 = 0;
        uint64_t v15 = a4 & 0xFFFFFFFB;
        NSUInteger v16 = v12;
        do
        {
          id v17 = (char *)-[NSString rangeOfCharacterFromSet:options:range:](v7, "rangeOfCharacterFromSet:options:range:", v6, v15, v14, v16);
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v19 = 0;
          }
          else {
            uint64_t v19 = v18;
          }
          if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL) {
            long long v20 = (char *)v13;
          }
          else {
            long long v20 = v17;
          }
          long long v21 = -[NSString substringWithRange:](v7, "substringWithRange:", v14, v20 - v14);
          [(NSString *)v8 appendString:v21];

          int64_t v14 = &v20[v19];
          NSUInteger v16 = v13 - (void)&v20[v19];
        }
        while ((char *)v13 != &v20[v19]);
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1360);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3D48();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1380);
    }
    int64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    UniChar v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_stringByRemovingCharactersInSet:options:]");
    int64_t v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 342, 0, "invalid nil value for '%{public}s'", "charSet");

    int64_t v8 = self;
  }

  return v8;
}

- (id)crl_stringByRemovingCharactersInSet:(id)a3
{
  return [(NSString *)self crl_stringByRemovingCharactersInSet:a3 options:0];
}

- (id)crl_stringByReplacingInstancesOfCharactersInSet:(id)a3 withString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(NSString *)self rangeOfCharacterFromSet:v6 options:2] == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = self;
  }
  else
  {
    int64_t v9 = +[NSMutableString stringWithCapacity:[(NSString *)self length]];
    UniChar v10 = +[NSScanner scannerWithString:self];
    [v10 setCharactersToBeSkipped:0];
    if (([v10 isAtEnd] & 1) == 0)
    {
      id v11 = 0;
      while (1)
      {
        id v17 = v11;
        unsigned int v12 = [v10 scanUpToCharactersFromSet:v6 intoString:&v17];
        id v13 = v17;

        if (v12) {
          [v9 appendString:v13];
        }
        if ([v10 isAtEnd]) {
          break;
        }
        id v16 = v13;
        [v10 scanCharactersFromSet:v6 intoString:&v16];
        id v11 = v16;

        for (uint64_t i = (char *)[v11 length]; i; --i)
          [v9 appendString:v7];
        if ([v10 isAtEnd]) {
          goto LABEL_13;
        }
      }
      id v11 = v13;
LABEL_13:
    }
    int64_t v8 = +[NSString stringWithString:v9];
  }

  return v8;
}

- (unint64_t)crl_countInstancesOfString:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  NSUInteger v7 = [(NSString *)self length];
  int64_t v8 = (char *)[v6 length];
  id v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, 0, v7);
  unint64_t v10 = 0;
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = 0;
    unint64_t v10 = 0;
    do
    {
      ++v10;
      unsigned int v12 = &v8[(void)v9];
      NSUInteger v7 = (NSUInteger)&v11[v7 - (unint64_t)&v8[(void)v9]];
      id v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v6, a4, &v8[(void)v9], v7);
      id v11 = v12;
    }
    while (v9 != (id)0x7FFFFFFFFFFFFFFFLL);
  }

  return v10;
}

- (id)crl_escapeForIcuRegex
{
  if (qword_1016A9788 != -1) {
    dispatch_once(&qword_1016A9788, &stru_1014F13A0);
  }
  uint64_t v3 = self;
  NSUInteger v4 = [(NSString *)v3 length];
  *(void *)&long long v13 = [(NSString *)v3 rangeOfCharacterFromSet:qword_1016A9780];
  if ((void)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = objc_alloc((Class)NSMutableString);
    NSUInteger v7 = [(NSString *)v3 substringToIndex:(void)v13];
    id v5 = (NSString *)[v6 initWithString:v7];

    if (v4 != (char *)v13)
    {
      do
      {
        [(NSString *)v5 appendFormat:@"\\%C", [(NSString *)v3 characterAtIndex:(void)v13]];
        *(void *)&long long v13 = v13 + 1;
        *((void *)&v13 + 1) = &v4[-v13];
        uint64_t v8 = v13;
        if (v4 != (char *)v13)
        {
          *(void *)&long long v12 = [(NSString *)v3 rangeOfCharacterFromSet:qword_1016A9780 options:0 range:(void)v13];
          *((void *)&v12 + 1) = v9;
          long long v13 = v12;
          if ((void)v12 == 0x7FFFFFFFFFFFFFFFLL) {
            long long v13 = (unint64_t)v4;
          }
          if ((void)v13 != v8)
          {
            unint64_t v10 = -[NSString substringWithRange:](v3, "substringWithRange:", v8, (void)v13 - v8);
            [(NSString *)v5 appendString:v10];
          }
        }
      }
      while (*((void *)&v13 + 1));
    }
  }

  return v5;
}

- (BOOL)crl_isDescendantOfPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathComponents];
  id v6 = [v4 pathComponents];
  NSUInteger v7 = (char *)[v6 count];
  if (v7)
  {
    do
    {
      uint64_t v8 = v7 - 1;
      uint64_t v9 = [v6 objectAtIndexedSubscript:v7 - 1];
      unsigned int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      --v7;
    }
    while (v8);
  }
  id v11 = (char *)[v5 count];
  unsigned __int8 v12 = v7 <= v11;
  if (v7 - 1 < v11)
  {
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      uint64_t v15 = [v5 objectAtIndexedSubscript:v13];
      id v16 = [v6 objectAtIndexedSubscript:v13];
      unsigned __int8 v12 = [v15 isEqualToString:v16];

      if ((unint64_t)v7 <= v14) {
        break;
      }
      uint64_t v13 = v14++;
    }
    while ((v12 & 1) != 0);
  }

  return v12;
}

- (BOOL)crl_isChildOfPath:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathComponents];
  id v6 = [v5 mutableCopy];

  NSUInteger v7 = [v4 pathComponents];
  id v8 = [v7 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    do
    {
      uint64_t v9 = [v6 lastObject];
      unsigned int v10 = [v9 isEqualToString:@"/"];

      if (!v10) {
        break;
      }
      [v6 removeObjectAtIndex:[v6 count] - 1];
    }
    while ((unint64_t)[v6 count] > 1);
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    do
    {
      id v11 = [v8 lastObject];
      unsigned int v12 = [v11 isEqualToString:@"/"];

      if (!v12) {
        break;
      }
      [v8 removeObjectAtIndex:[v8 count] - 1];
    }
    while ((unint64_t)[v8 count] > 1);
  }
  uint64_t v13 = (char *)[v8 count] + 1;
  unsigned int v14 = (char *)[v6 count];
  unsigned __int8 v15 = v13 == v14;
  id v16 = [v8 count];
  if (v16 && v13 == v14)
  {
    unint64_t v17 = (unint64_t)v16;
    uint64_t v18 = 0;
    unsigned int v19 = 1;
    do
    {
      long long v20 = [v6 objectAtIndexedSubscript:v18];
      long long v21 = [v8 objectAtIndexedSubscript:v18];
      unsigned __int8 v15 = [v20 isEqualToString:v21];

      if (v17 <= v19) {
        break;
      }
      uint64_t v18 = v19++;
    }
    while ((v15 & 1) != 0);
  }

  return v15;
}

- (id)crl_stringWithRealpath
{
  CFUUIDRef v2 = realpath_DARWIN_EXTSN([(NSString *)self fileSystemRepresentation], 0);
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = +[NSString stringWithCString:v2 encoding:4];
    free(v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)crl_stringWithTrimmedWhitespace
{
  uint64_t v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self componentsSeparatedByCharactersInSet:v3];
  id v5 = [v4 componentsJoinedByString:@" "];

  id v6 = [v5 stringByTrimmingCharactersInSet:v3];

  return v6;
}

- (id)crl_substringWithComposedCharacterSequencesTruncatedToLength:(unint64_t)a3
{
  if ([(NSString *)self length] <= a3)
  {
    id v5 = self;
  }
  else
  {
    id v5 = [(NSString *)self substringToIndex:[(NSString *)self rangeOfComposedCharacterSequenceAtIndex:a3]];
  }

  return v5;
}

- (id)crl_substringWithComposedCharacterSequencesToFileSystemLength:(unint64_t)a3
{
  NSUInteger v5 = [(NSString *)self length];
  NSUInteger v6 = 0;
  if (v5)
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = [(NSString *)self rangeOfComposedCharacterSequenceAtIndex:v6];
      uint64_t v10 = v9;
      -[NSString substringWithRange:](self, "substringWithRange:", v8, v9);
      id v11 = objc_claimAutoreleasedReturnValue();
      unsigned int v12 = (const char *)[v11 fileSystemRepresentation];

      v7 += strlen(v12);
      if (v7 > a3) {
        break;
      }
      v6 += v10;
    }
    while (v6 < v5);
  }
  if (v6 == v5)
  {
    uint64_t v13 = self;
  }
  else
  {
    uint64_t v13 = [(NSString *)self substringToIndex:v6];
  }

  return v13;
}

- (id)crl_stringWithPathRelativeTo:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    NSUInteger v6 = [(NSString *)self stringByStandardizingPath];
    unint64_t v7 = [v6 pathComponents];

    id v8 = [v4 stringByStandardizingPath];
    uint64_t v9 = [v8 pathComponents];

    uint64_t v10 = (char *)[v7 count];
    id v11 = (char *)[v9 count];
    if (v10 < v11) {
      goto LABEL_10;
    }
    unint64_t v12 = (unint64_t)v11;
    if (!v11) {
      goto LABEL_8;
    }
    long long v22 = v5;
    uint64_t v13 = 0;
    unsigned int v14 = 1;
    do
    {
      unsigned __int8 v15 = [v9 objectAtIndexedSubscript:v13];
      id v16 = [v7 objectAtIndexedSubscript:v13];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        break;
      }
      uint64_t v13 = v14;
    }
    while (v12 > v14++);
    NSUInteger v5 = v22;
    if (v12 != v13)
    {
LABEL_10:
      unsigned int v19 = 0;
    }
    else
    {
LABEL_8:
      if (v10 == (char *)v12)
      {
        unsigned int v19 = &stru_101538650;
      }
      else
      {
        long long v21 = [v7 subarrayWithRange:v12, &v10[-v12]];
        unsigned int v19 = +[NSString pathWithComponents:v21];
      }
    }
  }
  else
  {
    unsigned int v19 = 0;
  }

  return v19;
}

- (id)crl_stringWithPathRelativeTo:(id)a3 allowBacktracking:(BOOL)a4
{
  id v6 = a3;
  if (a4)
  {
    unint64_t v7 = [(NSString *)self stringByStandardizingPath];
    id v8 = [v7 pathComponents];

    uint64_t v9 = [v6 stringByStandardizingPath];
    uint64_t v10 = [v9 pathComponents];

    id v11 = (char *)[v8 count];
    unint64_t v12 = (char *)[v10 count];
    uint64_t v13 = v12;
    if (v12 >= v11) {
      unint64_t v14 = (unint64_t)v11;
    }
    else {
      unint64_t v14 = (unint64_t)v12;
    }
    if (v14)
    {
      uint64_t v15 = 0;
      id v16 = 0;
      do
      {
        unsigned __int8 v17 = [v10 objectAtIndexedSubscript:v15];
        uint64_t v18 = [v8 objectAtIndexedSubscript:v15];
        unsigned int v19 = [v17 isEqualToString:v18];

        if (!v19) {
          break;
        }
        uint64_t v15 = ++v16;
      }
      while (v14 > v16);
    }
    else
    {
      id v16 = 0;
    }
    int64_t v21 = v13 - v16;
    if (v13 <= v16)
    {
      long long v23 = &stru_101538650;
    }
    else
    {
      long long v22 = &stru_101538650;
      do
      {
        long long v23 = [(__CFString *)v22 stringByAppendingPathComponent:@".."];

        long long v22 = v23;
        --v21;
      }
      while (v21);
    }
    if (v16 >= v11)
    {
      long long v20 = v23;
    }
    else
    {
      do
      {
        long long v24 = [v8 objectAtIndexedSubscript:v16];
        long long v20 = [(__CFString *)v23 stringByAppendingPathComponent:v24];

        ++v16;
        long long v23 = v20;
      }
      while (v11 != v16);
    }
  }
  else
  {
    long long v20 = [(NSString *)self crl_stringWithPathRelativeTo:v6];
  }

  return v20;
}

- (id)crl_stringByTrimmingCharactersInSetFromFront:(id)a3
{
  p_isa = self;
  id v5 = [(NSString *)p_isa rangeOfCharacterFromSet:a3 options:8];
  unint64_t v7 = v6;
  if (v6 == (void *)[(NSString *)p_isa length])
  {
    CFStringRef v8 = &stru_101538650;
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    CFStringRef v8 = [(NSString *)p_isa substringFromIndex:v7];
  }

  p_isa = &v8->isa;
LABEL_6:

  return p_isa;
}

+ (id)crl_stringWithHexFromBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4 = a4;
  unint64_t v6 = 2 * a4;
  unint64_t v7 = malloc_type_malloc(2 * a4, 0x7BD5F295uLL);
  if (v4)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *(unsigned __int8 *)a3++;
      unsigned char *v8 = a0123456789abcd[(unint64_t)v9 >> 4];
      v8[1] = a0123456789abcd[v9 & 0xF];
      v8 += 2;
      --v4;
    }
    while (v4);
  }
  id v10 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:v6 encoding:1 freeWhenDone:1];

  return v10;
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4
{
  return +[NSString crl_stringByBase64EncodingBytes:a3 length:a4 breakLines:0];
}

+ (id)crl_stringByBase64EncodingBytes:(const char *)a3 length:(unint64_t)a4 breakLines:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v6 = a4;
  CFStringRef v8 = +[NSMutableString stringWithCapacity:4 * a4 / 3];
  if (v6 < 3)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v9 = 0;
    id v10 = a3 + 2;
    int v11 = -4;
    unsigned int v12 = 4;
    do
    {
      [v8 appendFormat:@"%c%c%c%c", aAbcdefghijklmn[*(v10 - 2) >> 2], aAbcdefghijklmn[((unint64_t)((*((unsigned __int8 *)v10 - 1) << 8) | (*((unsigned __int8 *)v10 - 2) << 16)) >> 12) & 0x3F], aAbcdefghijklmn[((unint64_t)(*(unsigned __int8 *)v10 | (*((unsigned __int8 *)v10 - 1) << 8)) >> 6) & 0x3F], aAbcdefghijklmn[*v10 & 0x3F]];
      if (v5 && !(v11 + 76 * (v12 / 0x4C))) {
        [v8 appendString:@"\n"];
      }
      v10 += 3;
      v11 -= 4;
      v12 += 4;
      v9 -= 3;
    }
    while (v6 + v9 > 2);
    uint64_t v13 = -v9;
    v6 += v9;
  }
  if (v6 == 1)
  {
    [v8 appendFormat:@"%c%c==", aAbcdefghijklmn[(unint64_t)a3[v13] >> 2], aAbcdefghijklmn[16 * (a3[v13] & 3)], v16];
  }
  else if (v6 == 2)
  {
    unint64_t v14 = &a3[v13];
    [v8 appendFormat:@"%c%c%c=", aAbcdefghijklmn[*v14 >> 2], aAbcdefghijklmn[((unint64_t)((*(unsigned __int8 *)v14 << 16) | (*((unsigned __int8 *)v14 + 1) << 8)) >> 12) & 0x3F], aAbcdefghijklmn[4 * (v14[1] & 0xF)]];
  }

  return v8;
}

- (id)crl_encodeStringBase64
{
  CFUUIDRef v2 = [(NSString *)self UTF8String];
  size_t v3 = strlen(v2);

  return +[NSString crl_stringByBase64EncodingBytes:v2 length:v3];
}

- (id)crl_stringByMakingFirstCharacterLowercase
{
  CFUUIDRef v2 = self;
  if ([(NSString *)v2 length])
  {
    size_t v3 = [(NSString *)v2 substringToIndex:1];
    unint64_t v4 = [v3 lowercaseString];
    if (([v3 isEqualToString:v4] & 1) == 0)
    {
      BOOL v5 = [(NSString *)v2 substringFromIndex:1];
      uint64_t v6 = [v4 stringByAppendingString:v5];

      CFUUIDRef v2 = (NSString *)v6;
    }
  }

  return v2;
}

- (id)crl_stringByMakingFirstCharacterUppercase
{
  id v3 = [(NSString *)self mutableCopy];
  if ([v3 length])
  {
    unint64_t v4 = [(NSString *)self substringToIndex:1];
    BOOL v5 = [v4 uppercaseString];
    [v3 replaceCharactersInRange:0, 1, v5];
  }

  return v3;
}

- (id)crl_stringTrimByLimitingFirstCharacterToSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  if ([(NSString *)v5 length])
  {
    unsigned __int16 v6 = [(NSString *)v5 characterAtIndex:0];
    if ([(NSString *)v5 length])
    {
      while (([v4 characterIsMember:v6] & 1) == 0)
      {
        unint64_t v7 = [(NSString *)v5 substringFromIndex:1];

        if ([v7 length]) {
          unsigned __int16 v6 = (unsigned __int16)[v7 characterAtIndex:0];
        }
        BOOL v5 = (NSString *)v7;
        if (![v7 length]) {
          goto LABEL_9;
        }
      }
    }
  }
  unint64_t v7 = v5;
LABEL_9:

  return v7;
}

+ (id)crl_stringWithXMLString:(const char *)a3
{
  return +[NSString stringWithCString:a3 encoding:4];
}

- (id)crl_escapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  [v2 replaceOccurrencesOfString:@"&" withString:@"&amp;" options:0 range:];
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"<" withString:@"&lt;" options:range:];
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@">" withString:@"&gt;" options:range:];
    0,
    0,
    [v2 length]);

  return v2;
}

- (id)crl_unescapeXML
{
  id v2 = [(NSString *)self mutableCopy];
  [v2 replaceOccurrencesOfString:@"&amp;" withString:@"&" options:range:];
    @"&",
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"&lt;" withString:@"" options:0 range:];
    @"<",
    0,
    0,
    [v2 length]);
  [v2 replaceOccurrencesOfString:@"&gt;" withString:@"" options:0 range:];
    @">",
    0,
    0,
    [v2 length]);

  return v2;
}

- (BOOL)crl_containsOnlyCharactersFromSet:(id)a3
{
  id v4 = [a3 invertedSet];
  id v5 = [(NSString *)self rangeOfCharacterFromSet:v4];

  return v5 == (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_stringByDeletingPathExtensionIfEqualTo:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self pathExtension];
  unsigned __int8 v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    unint64_t v7 = [(NSString *)self stringByDeletingPathExtension];
  }
  else
  {
    unint64_t v7 = self;
  }
  CFStringRef v8 = v7;

  return v8;
}

- (id)crl_tolerantStringByAppendingPathExtension:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self isEqualToString:&stru_101538650]
    || [v4 isEqualToString:&stru_101538650])
  {
    id v5 = self;
LABEL_4:
    unsigned __int8 v6 = v5;
    goto LABEL_5;
  }
  if ([(NSString *)self isEqualToString:@"\\\\""])
  {
    CFStringRef v8 = [@"\\"" stringByAppendingPathExtension:v4];
    uint64_t v9 = [@"\\"" stringByAppendingString:v8];
  }
  else
  {
    if (![(NSString *)self length] || [(NSString *)self characterAtIndex:0] != 126)
    {
      id v5 = [(NSString *)self stringByAppendingPathExtension:v4];
      goto LABEL_4;
    }
    id v10 = [@"X" stringByAppendingString:self];
    CFStringRef v8 = [v10 stringByAppendingPathExtension:v4];

    uint64_t v9 = [v8 substringFromIndex:1];
  }
  unsigned __int8 v6 = (void *)v9;

LABEL_5:

  return v6;
}

+ (id)crl_stringByHexEncodingData:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableString string];
  id v5 = v3;
  unsigned __int8 v6 = (unsigned __int8 *)[v5 bytes];
  unint64_t v7 = (char *)[v5 length];
  if (v7)
  {
    CFStringRef v8 = v7;
    do
    {
      unsigned int v9 = *v6++;
      [v4 appendFormat:@"%02x", v9];
      --v8;
    }
    while (v8);
  }
  id v10 = [v4 copy];

  return v10;
}

- (_NSRange)crl_rangeOfString:(id)a3 options:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  id v8 = a3;
  unsigned int v9 = v8;
  if (a5)
  {
    NSUInteger location = a5->location;
    NSUInteger length = a5->length;
    id v12 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, a5->location, length);
    id v14 = v12;
    NSUInteger v15 = v13;
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      *a5 = (_NSRange)xmmword_101176F48;
    }
    else if ((a4 & 4) != 0)
    {
      a5->NSUInteger location = location;
      a5->NSUInteger length = (NSUInteger)v12 - location;
    }
    else
    {
      a5->NSUInteger location = (NSUInteger)v12 + v13;
      a5->NSUInteger length = length + location - ((void)v12 + v13);
    }
  }
  else
  {
    id v14 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", v8, a4, 0, [v8 length]);
    NSUInteger v15 = v16;
  }

  NSUInteger v17 = (NSUInteger)v14;
  NSUInteger v18 = v15;
  result.NSUInteger length = v18;
  result.NSUInteger location = v17;
  return result;
}

- (_NSRange)crl_range
{
  NSUInteger v2 = [(NSString *)self length];
  NSUInteger v3 = 0;
  result.NSUInteger length = v2;
  result.NSUInteger location = v3;
  return result;
}

- (void)crl_enumerateRangesOfCharactersInSet:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, unsigned char *, int64_t, char *))a4;
  id v8 = [objc_alloc((Class)NSScanner) initWithString:self];
  [v8 setCaseSensitive:1];
  [v8 setCharactersToBeSkipped:0];
  if (([v8 isAtEnd] & 1) == 0)
  {
    do
    {
      unsigned int v9 = [v8 scanLocation];
      if ([v8 scanCharactersFromSet:v6 intoString:0])
      {
        id v10 = [v8 scanLocation];
        char v11 = 0;
        v7[2](v7, v9, v10 - v9, &v11);
        if (v11) {
          break;
        }
      }
      if (([v8 isAtEnd] & 1) == 0) {
        [v8 scanUpToCharactersFromSet:v6 intoString:0];
      }
    }
    while (![v8 isAtEnd]);
  }
}

- (BOOL)crl_containsSubstring:(id)a3
{
  return [(NSString *)self rangeOfString:a3] != (id)0x7FFFFFFFFFFFFFFFLL;
}

- (id)crl_setOfContainedWordsIncludingPunctuationAndSymbols:(BOOL)a3
{
  BOOL v3 = a3;
  id v30 = +[NSMutableSet set];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100367BA0;
  v37[3] = &unk_1014F1400;
  BOOL v35 = v3;
  BOOL v38 = v3;
  id v5 = objc_retainBlock(v37);
  CFRange v36 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  CFIndex v6 = [(NSString *)self length];
  CFLocaleRef v7 = CFLocaleCopyCurrent();
  v40.CFIndex location = 0;
  CFIndex v31 = v6;
  v40.CFIndex length = v6;
  id v8 = CFStringTokenizerCreate(kCFAllocatorDefault, (CFStringRef)self, v40, 4uLL, v7);
  CFRelease(v7);
  CFStringTokenizerTokenType v9 = CFStringTokenizerGoToTokenAtIndex(v8, 0);
  LODWORD(v10) = v9;
  if (!v9) {
    ((void (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
  }
  CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v8);
  if (CurrentTokenRange.location != -1)
  {
    CFIndex location = CurrentTokenRange.location;
    CFIndex length = CurrentTokenRange.length;
    CFIndex v14 = 0;
    CFIndex v15 = CurrentTokenRange.length;
    int64_t v34 = self;
    do
    {
      if (location >= v14) {
        CFIndex v16 = v14;
      }
      else {
        CFIndex v16 = location;
      }
      CFIndex v32 = v16;
      CFIndex v33 = length;
      uint64_t v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
      CFRange v18 = CFStringTokenizerGetCurrentTokenRange(v8);
      CFIndex v19 = v18.location;
      CFIndex length = v18.length;
      if (v35)
      {
        while (1)
        {
          int v20 = v10;
          uint64_t v10 = v17;
          if (((v20 | v17) & 0x20) != 0)
          {
            if ((v17 & 0x10) == 0) {
              goto LABEL_20;
            }
          }
          else if ((v17 & 0x10) != 0 && length == 1)
          {
            if (objc_msgSend(v36, "characterIsMember:", -[NSString characterAtIndex:](self, "characterAtIndex:", v19)))
            {
              uint64_t v28 = 1;
              goto LABEL_21;
            }
          }
          else if (!v17 || (v17 & 0x10) != 0)
          {
            goto LABEL_20;
          }
          uint64_t v17 = ((uint64_t (*)(void *, __CFStringTokenizer *))v5[2])(v5, v8);
          CFRange v21 = CFStringTokenizerGetCurrentTokenRange(v8);
          CFIndex v19 = v21.location;
          CFIndex length = v21.length;
        }
      }
      uint64_t v10 = v17;
LABEL_20:
      uint64_t v28 = length;
LABEL_21:
      CFIndex v22 = location + v15;
      if (location + v15 <= v31) {
        CFIndex v22 = v31;
      }
      if (v19 > v31 || v10 == 0) {
        CFIndex v14 = v22;
      }
      else {
        CFIndex v14 = v19;
      }
      if (v35) {
        CFIndex v24 = v32;
      }
      else {
        CFIndex v24 = location;
      }
      if (v35) {
        CFIndex v25 = v14 - v32;
      }
      else {
        CFIndex v25 = v33;
      }
      long long v26 = -[NSString substringWithRange:](v34, "substringWithRange:", v24, v25, v30);
      long long v27 = [v26 stringByTrimmingCharactersInSet:v36];

      if ([v27 length]) {
        [v30 addObject:v27];
      }

      CFIndex location = v19;
      CFIndex v15 = v28;
      self = v34;
    }
    while (v19 != -1);
  }
  if (v8) {
    CFRelease(v8);
  }

  return v30;
}

- (id)crl_stringWithoutAttachmentCharacters
{
  if (qword_1016A9798 != -1) {
    dispatch_once(&qword_1016A9798, &stru_1014F1420);
  }
  uint64_t v3 = qword_1016A9790;

  return [(NSString *)self stringByReplacingOccurrencesOfString:v3 withString:&stru_101538650];
}

- (id)crl_middleTruncateToLength:(unint64_t)a3
{
  id v4 = self;
  if ([(NSString *)v4 length] <= a3)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = (NSString *)[(NSString *)v4 mutableCopy];
    do
      [(NSString *)v5 replaceCharactersInRange:([(NSString *)v5 length] >> 1) - 1, 3, @"…" withString];
    while ([(NSString *)v5 length] > a3);
  }

  return v5;
}

- (BOOL)crl_isEqualToString:(id)a3
{
  if (a3) {
    return -[NSString isEqualToString:](self, "isEqualToString:");
  }
  else {
    return 0;
  }
}

- (id)crl_stringWithNormalizedHyphensAndQuotationMarks
{
  NSUInteger v2 = [(NSString *)self crl_stringWithNormalizedHyphens];
  uint64_t v3 = [v2 crl_stringWithNormalizedQuotationMarks];

  return v3;
}

- (id)crl_stringWithNormalizedHyphens
{
  if (qword_1016A97A0 != -1) {
    dispatch_once(&qword_1016A97A0, &stru_1014F1440);
  }
  uint64_t v3 = qword_1016A97A8;

  return [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"-"];
}

- (id)crl_stringWithNormalizedQuotationMarks
{
  if (qword_1016A97B0 != -1) {
    dispatch_once(&qword_1016A97B0, &stru_1014F1460);
  }
  uint64_t v3 = qword_1016A97B8;

  return [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:@"'"];
}

- (id)crl_stringWithoutBidiControls
{
  uint64_t v3 = +[NSCharacterSet characterSetWithCharactersInString:@"\u200E\u200F\u202A\u202B\u202C\u202D\u202E⁦⁧⁨⁩"];
  id v4 = [(NSString *)self crl_stringByReplacingInstancesOfCharactersInSet:v3 withString:&stru_101538650];

  return v4;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithUniquenessTest:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  CFIndex v6 = [v5 localizedStringForKey:@"copy" value:0 table:0];

  CFLocaleRef v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"%1$@ %2$@" value:0 table:0];

  CFStringTokenizerTokenType v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"%1$@ %2$@ %3$@" value:0 table:0];

  id v11 = objc_alloc_init((Class)NSNumberFormatter);
  id v12 = [(NSString *)self crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:v6 firstCopyFormatString:v8 generalCopyFormatString:v10 numberFormatter:v11 uniquenessTest:v4];

  return v12;
}

- (id)crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 numberFormatter:(id)a6 uniquenessTest:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  CFIndex v16 = (uint64_t (**)(id, id))a7;
  uint64_t v32 = 0;
  uint64_t v17 = [(NSString *)self crl_parseBaseTitleWithLocalizedCopyString:v12 firstCopyFormatString:v13 generalCopyFormatString:v14 outNumber:&v32];
  CFRange v18 = (void *)v17;
  if (v17)
  {
    v33[0] = @"%1$@";
    v33[1] = @"%2$@";
    id v30 = (void *)v17;
    id v31 = v12;
    v34[0] = v17;
    v34[1] = v12;
    CFIndex v19 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    id v20 = [v19 mutableCopy];

    for (id i = [(NSString *)self copy];
          [(NSString *)self isEqualToString:i] || (v16[2](v16, i) & 1) == 0;
          id i = (id)v28)
    {
      uint64_t v22 = v32;
      uint64_t v23 = ++v32;
      if (v22) {
        CFIndex v24 = v14;
      }
      else {
        CFIndex v24 = v13;
      }
      id v25 = v24;
      long long v26 = +[NSNumber numberWithUnsignedInteger:v23];
      long long v27 = [v15 stringFromNumber:v26];
      [v20 setObject:v27 forKeyedSubscript:@"%3$@"];

      uint64_t v28 = [v25 crl_stringByApplyingSubstitutions:v20];
    }
    CFRange v18 = v30;
    id v12 = v31;
  }
  else
  {
    id i = [(NSString *)self copy];
  }

  return i;
}

- (id)crl_regexForTitleParsingWithLocalizedCopyString:(id)a3 isFirstCopyFormatString:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ((id)[(NSString *)self crl_countInstancesOfString:@"%1$@" options:0] == (id)1&& (id)[(NSString *)self crl_countInstancesOfString:@"%2$@" options:0] == (id)1&& (v4|| (id)[(NSString *)self crl_countInstancesOfString:@"%3$@" options:0] == (id)1))
  {
    CFLocaleRef v7 = +[NSRegularExpression escapedPatternForString:self];
    id v8 = +[NSRegularExpression escapedPatternForString:@"%1$@"];
    v18[0] = v8;
    v19[0] = @"(.*)";
    CFStringTokenizerTokenType v9 = +[NSRegularExpression escapedPatternForString:@"%2$@"];
    v18[1] = v9;
    v19[1] = v6;
    uint64_t v10 = +[NSRegularExpression escapedPatternForString:@"%3$@"];
    v18[2] = v10;
    v19[2] = @"(\\d+)";
    id v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    id v12 = [v7 crl_stringByApplyingSubstitutions:v11];
    id v13 = +[NSRegularExpression regularExpressionWithPattern:v12 options:0 error:0];
  }
  else
  {
    unsigned int v14 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1480);
    }
    id v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      unsigned int v21 = v14;
      __int16 v22 = 2082;
      uint64_t v23 = "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]";
      __int16 v24 = 2082;
      id v25 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
      __int16 v26 = 1024;
      int v27 = 1137;
      __int16 v28 = 2114;
      id v29 = self;
      __int16 v30 = 1024;
      BOOL v31 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Invalid format string: %{public}@, isFirstCopyFormatString: %d", buf, 0x32u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F14A0);
    }
    CFIndex v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    CFLocaleRef v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v11, 1137, 0, "Invalid format string: %{public}@, isFirstCopyFormatString: %d", self, v4);
    id v13 = 0;
  }

  return v13;
}

- (id)crl_parseBaseTitleWithLocalizedCopyString:(id)a3 firstCopyFormatString:(id)a4 generalCopyFormatString:(id)a5 outNumber:(unint64_t *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 crl_regexForTitleParsingWithLocalizedCopyString:v10 isFirstCopyFormatString:0];
  if (!v13)
  {
    unsigned int v21 = self;
    goto LABEL_23;
  }
  unsigned int v14 = [v13 firstMatchInString:self options:0 range:[NSString length:self]];
  if (v14)
  {
    id v15 = [v12 rangeOfString:@"%1$@"];
    id v16 = [v12 rangeOfString:@"%3$@"];
    if (v15 < v16) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    if (v15 >= v16) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 2;
    }
    id v19 = [v14 rangeAtIndex:v17];
    -[NSString substringWithRange:](self, "substringWithRange:", v19, v20);
    unsigned int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v22 = [v14 rangeAtIndex:v18];
    __int16 v24 = -[NSString substringWithRange:](self, "substringWithRange:", v22, v23);
    unint64_t v25 = (unint64_t)[v24 integerValue];
    goto LABEL_20;
  }
  __int16 v26 = [v11 crl_regexForTitleParsingWithLocalizedCopyString:v10 isFirstCopyFormatString:1];
  if (v26)
  {
    __int16 v24 = v26;
    uint64_t v32 = [v26 firstMatchInString:self options:0 range:[NSString length]:0];
    if (v32)
    {
      id v27 = [v11 rangeOfString:@"%1$@"];
      unint64_t v25 = 1;
      if (v27 < [v11 rangeOfString:@"%3$@"]) {
        uint64_t v28 = 1;
      }
      else {
        uint64_t v28 = 2;
      }
      id v29 = [v32 rangeAtIndex:v28];
      -[NSString substringWithRange:](self, "substringWithRange:", v29, v30);
      unsigned int v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned int v21 = (NSString *)[(NSString *)self copy];
      unint64_t v25 = 0;
    }

LABEL_20:
    if (a6) {
      *a6 = v25;
    }
    goto LABEL_22;
  }
  unsigned int v21 = self;
LABEL_22:

LABEL_23:

  return v21;
}

- (id)crl_stringByApplyingSubstitutions:(id)a3
{
  id v4 = a3;
  id v5 = [(NSString *)self mutableCopy];
  id v6 = objc_opt_new();
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100368B10;
  v25[3] = &unk_1014F14C8;
  v25[4] = v5;
  v25[5] = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v25];
  CFLocaleRef v7 = [v6 allKeys];
  id v8 = [v7 sortedArrayUsingComparator:&stru_1014F1508];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (id i = 0; i != v11; id i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v6 objectForKeyedSubscript:v14];
        id v16 = [v14 rangeValue];
        if (v15) {
          BOOL v18 = v16 == (id)0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18) {
          [v5 replaceCharactersInRange:v16 withString:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }

  id v19 = [v5 copy];

  return v19;
}

+ (id)crl_JSONStringFromString:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[NSMutableString string];
    [v3 crl_appendJSONStringToString:v4];
  }
  else
  {
    id v4 = @"null";
  }

  return v4;
}

- (void)crl_appendJSONStringToString:(id)a3
{
  id v4 = a3;
  if (qword_1016A97C8 != -1) {
    dispatch_once(&qword_1016A97C8, &stru_1014F1528);
  }
  [v4 appendString:@"\""];
  if ([(NSString *)self rangeOfCharacterFromSet:qword_1016A97C0] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = [(NSString *)self length];
    id v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    [(NSString *)self getCharacters:v6];
    if (!v5)
    {
LABEL_30:
      free(v6);
      goto LABEL_31;
    }
    CFLocaleRef v7 = v6;
    while (1)
    {
      int v9 = *v7++;
      uint64_t v8 = v9;
      __int16 v13 = v9;
      if (v9 <= 33)
      {
        switch((int)v8)
        {
          case 8:
            id v10 = v4;
            CFStringRef v11 = @"\\b";
            goto LABEL_23;
          case 9:
            id v10 = v4;
            CFStringRef v11 = @"\\t";
            goto LABEL_23;
          case 10:
            id v10 = v4;
            CFStringRef v11 = @"\\n";
            goto LABEL_23;
          case 12:
            id v10 = v4;
            CFStringRef v11 = @"\\f";
            goto LABEL_23;
          case 13:
            id v10 = v4;
            CFStringRef v11 = @"\\r";
            goto LABEL_23;
          default:
            goto LABEL_26;
        }
      }
      if ((int)v8 > 8231)
      {
        if (v8 == 8232)
        {
          id v10 = v4;
          CFStringRef v11 = @"\\u2028";
        }
        else
        {
          if (v8 != 8233)
          {
LABEL_26:
            if (v8 < 0x20) {
              +[NSString stringWithFormat:@"\\u%.4x", v8];
            }
            else {
            uint64_t v12 = +[NSString stringWithCharacters:&v13 length:1];
            }
            [v4 appendString:v12];

            goto LABEL_24;
          }
          id v10 = v4;
          CFStringRef v11 = @"\\u2029";
        }
      }
      else if (v8 == 34)
      {
        id v10 = v4;
        CFStringRef v11 = @"\\\"";
      }
      else
      {
        if (v8 != 92) {
          goto LABEL_26;
        }
        id v10 = v4;
        CFStringRef v11 = @"\\\\"";
      }
LABEL_23:
      [v10 appendString:v11];
LABEL_24:
      if (!--v5) {
        goto LABEL_30;
      }
    }
  }
  [v4 appendString:self];
LABEL_31:
  [v4 appendString:@"\""];
}

+ (id)crl_stringWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = +[NSString objectWithItemProviderData:a3 typeIdentifier:v7 error:a5];
  if (!v8)
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1548);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010A3E78((uint64_t)v7, v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014F1568);
    }
    id v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    CFStringRef v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSString(CRLAdditions) crl_stringWithItemProviderData:typeIdentifier:error:]");
    uint64_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11, v12, 1331, 0, "Unable to make a string out of data with UTI %@", v7 file lineNumber isFatal description];
  }

  return v8;
}

- (id)crl_uncommentedAddress
{
  unint64_t v3 = [(NSString *)self length];
  id v4 = (char *)NSZoneMalloc(0, 2 * v3 + 2);
  NSUInteger v5 = v4;
  id v6 = v4;
  if (v3)
  {
    unint64_t v7 = 0;
    int v8 = 0;
    char v9 = 0;
    char v19 = 0;
    char v20 = 1;
    id v6 = v4;
    do
    {
      unsigned int v10 = [(NSString *)self characterAtIndex:v7];
      unsigned int v11 = v10;
      if (v10 == 92)
      {
        if (v7 + 1 >= v3)
        {
          if ((v9 & 1) == 0)
          {
            if (v8 < 1) {
              goto LABEL_18;
            }
LABEL_15:
            char v9 = 0;
            v8 -= v10 == 41;
            goto LABEL_24;
          }
LABEL_10:
          *(_WORD *)id v6 = v10;
          v6 += 2;
          v9 &= v10 != 34;
          goto LABEL_24;
        }
        *(_WORD *)id v6 = 92;
        *((_WORD *)v6 + 1) = [(NSString *)self characterAtIndex:v7 + 1];
        v6 += 4;
        ++v7;
      }
      else
      {
        if (v9) {
          goto LABEL_10;
        }
        if (v10 == 40)
        {
          char v9 = 0;
          ++v8;
        }
        else
        {
          if (v8 > 0) {
            goto LABEL_15;
          }
          if (v10 != 60)
          {
            if ((v19 & (v10 == 62)) != 0) {
              break;
            }
            if (v10 > 0x7F)
            {
              if (__maskrune(v10, 0x4000uLL))
              {
LABEL_19:
                char v9 = 0;
                if ((v20 & 1) == 0)
                {
                  *(_WORD *)id v6 = 32;
                  v6 += 2;
                }
                char v20 = 1;
                goto LABEL_24;
              }
            }
            else
            {
LABEL_18:
              if ((_DefaultRuneLocale.__runetype[v10] & 0x4000) != 0) {
                goto LABEL_19;
              }
            }
            char v20 = 0;
            *(_WORD *)id v6 = v11;
            v6 += 2;
            v9 |= v11 == 34;
            goto LABEL_24;
          }
          char v9 = 0;
          char v19 = 1;
          id v6 = v5;
        }
      }
LABEL_24:
      ++v7;
    }
    while (v7 < v3);
  }
  uint64_t v12 = v6 - v5;
  do
  {
    __int16 v13 = v6;
    uint64_t v14 = v12;
    if (v6 <= v5) {
      break;
    }
    v6 -= 2;
    unint64_t v15 = *((unsigned __int16 *)v13 - 1);
    __uint32_t v16 = v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : _DefaultRuneLocale.__runetype[v15] & 0x4000;
    uint64_t v12 = v14 - 2;
  }
  while (v16);
  *(_WORD *)__int16 v13 = 0;
  id v17 = [objc_alloc((Class)NSString) initWithCharacters:v5 length:v14 >> 1];
  NSZoneFree(0, v5);

  return v17;
}

- (id)crl_uncommentedAddressRespectingGroups
{
  id v3 = [(NSString *)self rangeOfString:@"@"];
  id v4 = [(NSString *)self rangeOfString:@"<"];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL && v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = self;
  }
  else
  {
    id v6 = [(NSString *)self crl_uncommentedAddress];
  }

  return v6;
}

- (BOOL)crl_isCJKString
{
  if (![(NSString *)self length]) {
    return 0;
  }
  id v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v4 = [(NSString *)self stringByTrimmingCharactersInSet:v3];

  id v5 = [v4 length];
  if (!v5)
  {

    return 0;
  }
  id v7 = v5;
  __chkstk_darwin(v5, v6);
  char v9 = (char *)&v19 - ((v8 + 17) & 0xFFFFFFFFFFFFFFF0);
  [v4 getCharacters:v9 range:0 v7];
  BOOL v10 = 0;
  for (i = 0; (id)i != v7; BOOL v10 = i >= (unint64_t)v7)
  {
    unsigned int v12 = *(unsigned __int16 *)&v9[2 * i];
    int16x8_t v13 = vdupq_n_s16(v12);
    int16x4_t v14 = (int16x4_t)vand_s8(*(int8x8_t *)v13.i8, (int8x8_t)0xFFF0FFC0FF00FF80);
    char v15 = vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)xmmword_101178030, (uint16x8_t)vaddq_s16(v13, (int16x8_t)xmmword_101178020)))) | vmaxv_u16((uint16x4_t)vceq_s16(v14, (int16x4_t)0x3190300011002E80));
    BOOL v17 = (unsigned __int16)v12 >> 5 == 397 || (v14.i16[1] & 0xFF00) == 12800;
    if (!(v15 & 1 | ((unsigned __int16)(v12 + 464) < 0x20u || v17)) && v14.u16[1] != 13056) {
      break;
    }
    ++i;
  }

  return v10;
}

+ (id)crl_localizedDisplayNameWithPersonNameComponents:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_20;
  }
  id v4 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v3 style:0 options:0];
  if (v4) {
    goto LABEL_20;
  }
  if (qword_101719A68 != -1) {
    dispatch_once(&qword_101719A68, &stru_1014F1588);
  }
  id v5 = off_10166B498;
  if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
    sub_1010A3F30(v5);
  }
  uint64_t v6 = [v3 givenName];
  id v7 = [v6 length];
  uint64_t v8 = [v3 familyName];
  id v9 = [v8 length];
  if (v7 && v9)
  {
    if ((objc_msgSend(v6, "crl_isCJKString") & 1) != 0
      || objc_msgSend(v8, "crl_isCJKString"))
    {
      id v10 = [v8 stringByAppendingString:v6];
    }
    else
    {
      id v10 = +[NSString stringWithFormat:@"%@ %@", v6, v8];
    }
  }
  else if (v7)
  {
    id v10 = v6;
  }
  else
  {
    if (!v9)
    {
      id v4 = 0;
      goto LABEL_19;
    }
    id v10 = v8;
  }
  id v4 = v10;
LABEL_19:

LABEL_20:

  return v4;
}

- (id)crl_keyPathByRemovingLastKey
{
  id v3 = [(NSString *)self rangeOfString:@"." options:6];
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_101538650;
  }
  else
  {
    id v4 = [(NSString *)self substringToIndex:v3];
  }

  return v4;
}

- (id)crl_keyPathByRemovingFirstKey
{
  id v3 = (char *)[(NSString *)self rangeOfString:@"." options:2];
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v4 = &stru_101538650;
  }
  else
  {
    id v4 = [(NSString *)self substringFromIndex:v3 + 1];
  }

  return v4;
}

- (id)crl_keyPathByPrependingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", v4, self];
      goto LABEL_7;
    }
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)crl_keyPathByAppendingKey:(id)a3
{
  id v4 = a3;
  if ([(NSString *)self length])
  {
    if ([v4 length])
    {
      uint64_t v5 = +[NSString stringWithFormat:@"%@.%@", self, v4];
      goto LABEL_7;
    }
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = (NSString *)v4;
  }
  uint64_t v5 = +[NSString stringWithString:v6];
LABEL_7:
  id v7 = (void *)v5;

  return v7;
}

- (id)crl_firstKey
{
  NSUInteger v2 = self;
  id v3 = [(NSString *)v2 rangeOfString:@"." options:2];
  if (v3 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(NSString *)v2 substringToIndex:v3];

    NSUInteger v2 = (NSString *)v4;
  }

  return v2;
}

- (id)crl_lastKey
{
  NSUInteger v2 = self;
  id v3 = (char *)[(NSString *)v2 rangeOfString:@"." options:6];
  if (v3 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = [(NSString *)v2 substringFromIndex:v3 + 1];

    NSUInteger v2 = (NSString *)v4;
  }

  return v2;
}

- (unint64_t)crl_numberOfKeysInKeyPath
{
  NSUInteger v3 = [(NSString *)self length];
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  NSUInteger v6 = v3;
  do
  {
    id v7 = (char *)[(NSString *)self rangeOfString:@".", 2, v4, v6 options range];
    ++v5;
    uint64_t v4 = &v7[v8];
    NSUInteger v6 = v3 - (void)&v7[v8];
  }
  while (&v7[v8] != (char *)0x7FFFFFFFFFFFFFFFLL);
  return v5;
}

- (id)crl_initRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  [v5 replaceOccurrencesOfString:@"%s" withString:@"<REDACT %s REDACT>" options:0 range:NSMakeRange(0, [v5 length])];
  [v5 replaceOccurrencesOfString:@"%@" withString:@"<REDACT %@ REDACT>" options range];
  [v5 replaceOccurrencesOfString:@"%{public}" withString:@"%" options:0 range:NSMakeRange(0, [v5 length])];
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a4];
  if (qword_1016A97D8 != -1) {
    dispatch_once(&qword_1016A97D8, &stru_1014F15A8);
  }
  id v7 = [qword_1016A97D0 stringByReplacingMatchesInString:v6 options:0 range:[v6 length] withTemplate:@"<redacted>"];

  return v7;
}

- (id)crl_initUnRedactedWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = [a3 mutableCopy];
  [v5 replaceOccurrencesOfString:@"%{public}" withString:@"%" options:0 range:NSMakeRange(0, [v5 length])];
  id v6 = [(NSString *)self initWithFormat:v5 arguments:a4];

  return v6;
}

- (id)crl_initRedactedWithFormat:(id)a3
{
  return -[NSString crl_initRedactedWithFormat:arguments:](self, "crl_initRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

- (id)crl_initUnRedactedWithFormat:(id)a3
{
  return -[NSString crl_initUnRedactedWithFormat:arguments:](self, "crl_initUnRedactedWithFormat:arguments:", a3, &v4, &v4, &v4);
}

+ (id)crl_redactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) crl_initRedactedWithFormat:v5 arguments:a4];

  return v6;
}

+ (id)crl_unRedactedStringWithFormat:(id)a3 arguments:(char *)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSString) crl_initUnRedactedWithFormat:v5 arguments:a4];

  return v6;
}

- (BOOL)crl_isPasteboardStateType
{
  return [(NSString *)self hasPrefix:@"com.apple.freeform.pasteboardState"];
}

+ (id)crlwpax_descriptionForVerticalAlignment:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Top";
      goto LABEL_7;
    case 1:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Middle";
      goto LABEL_7;
    case 2:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Bottom";
      goto LABEL_7;
    case 3:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Justify";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

+ (id)crlwpax_descriptionForParagraphAlignment:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Left";
      goto LABEL_8;
    case 1:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Right";
      goto LABEL_8;
    case 2:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Center";
      goto LABEL_8;
    case 3:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Justified";
      goto LABEL_8;
    case 4:
      NSUInteger v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"Natural";
LABEL_8:
      id v6 = [v3 localizedStringForKey:v5 value:0 table:0];

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (id)crl_attributedStringAllowingHyphenationWithAlignment:(int64_t)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init((Class)NSMutableParagraphStyle);
  LODWORD(v8) = 1036831949;
  [v7 setHyphenationFactor:v8];
  [v7 setAlignment:a3];
  [v7 setLineBreakMode:4];
  id v9 = objc_alloc((Class)NSAttributedString);
  v13[0] = NSParagraphStyleAttributeName;
  v13[1] = NSForegroundColorAttributeName;
  v14[0] = v7;
  v14[1] = v6;
  id v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v11 = [v9 initWithString:self attributes:v10];

  return v11;
}

- (id)crl_writeToFileUsingName:(id)a3 error:(id *)a4
{
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  id v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;
  int16x8_t v13 = self;
  sub_100D53854(v10, v12, (uint64_t)v9);
  swift_bridgeObjectRelease();

  URL._bridgeToObjectiveC()(v14);
  __uint32_t v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v16;
}

@end
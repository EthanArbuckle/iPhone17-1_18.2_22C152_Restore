@interface NSTextList
+ (BOOL)includesTextListMarkers;
+ (BOOL)supportsSecureCoding;
+ (id)_standardMarkerAttributesForAttributes:(id)a3;
+ (void)initialize;
- (BOOL)isOrdered;
- (NSInteger)startingItemNumber;
- (NSString)markerForItemNumber:(NSInteger)itemNumber;
- (NSTextAttachment)markerTextAttachment;
- (NSTextList)init;
- (NSTextList)initWithCoder:(NSCoder *)coder;
- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSTextListOptions)options startingItemNumber:(NSInteger)startingItemNumber;
- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSUInteger)options;
- (NSTextListMarkerFormat)markerFormat;
- (NSTextListOptions)listOptions;
- (id)_markerAtIndex:(unint64_t)a3 inText:(id)a4;
- (id)_markerForMarkerFormat:(id)a3 itemNumber:(int64_t)a4 isNumbered:(BOOL *)a5 substitutionStart:(unint64_t *)a6 end:(unint64_t *)a7 specifierStart:(unint64_t *)a8 end:(unint64_t *)a9;
- (id)_markerPrefix;
- (id)_markerSpecifier;
- (id)_markerSpecifierAsCSSValue;
- (id)_markerSuffix;
- (id)_markerTitle;
- (id)_unaffixedMarkerForItemNumber:(int64_t)a3;
- (id)_unaffixedMarkerFormat;
- (id)_unaffixedMarkerTitle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMarkerTextAttachment:(id)a3;
- (void)setStartingItemNumber:(NSInteger)startingItemNumber;
@end

@implementation NSTextList

- (NSTextAttachment)markerTextAttachment
{
  return (NSTextAttachment *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)markerForItemNumber:(NSInteger)itemNumber
{
  return (NSString *)[(NSTextList *)self _markerForMarkerFormat:[(NSTextList *)self markerFormat] itemNumber:itemNumber isNumbered:0 substitutionStart:0 end:0 specifierStart:0 end:0];
}

- (NSTextListMarkerFormat)markerFormat
{
  if (self->_markerTextAttachment) {
    return (NSTextListMarkerFormat)@"\uFFFC";
  }
  else {
    return self->_markerFormat;
  }
}

- (NSTextListOptions)listOptions
{
  return self->_listFlags;
}

- (id)_markerForMarkerFormat:(id)a3 itemNumber:(int64_t)a4 isNumbered:(BOOL *)a5 substitutionStart:(unint64_t *)a6 end:(unint64_t *)a7 specifierStart:(unint64_t *)a8 end:(unint64_t *)a9
{
  id v14 = a3;
  unint64_t v15 = [a3 length];
  if (a6) {
    *a6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a7) {
    *a7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a8) {
    *a8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a9) {
    *a9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [v14 rangeOfString:@"{"];
  if (!v16)
  {
    char v46 = 0;
    if (!a5) {
      return v14;
    }
    goto LABEL_132;
  }
  uint64_t v17 = [MEMORY[0x1E4F28E78] string];
  v18 = (void *)v17;
  if (!v15)
  {
    char v46 = 0;
    id v14 = (id)v17;
    if (!a5) {
      return v14;
    }
    goto LABEL_132;
  }
  v60 = a5;
  char v61 = 0;
  unint64_t v19 = 0;
  unint64_t v20 = 0;
  if ((unint64_t)(a4 + 9) >= 0x13) {
    v21 = @"%ld";
  }
  else {
    v21 = @"0%ld";
  }
  int64_t v59 = a4;
  v48 = v21;
  int64_t v49 = (a4 - 1) % 10;
  int64_t v50 = (a4 - 1) % 12;
  int64_t v51 = (a4 - 1) % 47;
  int64_t v52 = (a4 - 1) % 48;
  if (1 - a4 >= 0) {
    int64_t v22 = -((1 - a4) & 0x1F);
  }
  else {
    LODWORD(v22) = (a4 - 1) & 0x1F;
  }
  uint64_t v53 = (v22 + 1040);
  uint64_t v54 = (v22 + 1072);
  int64_t v23 = (a4 - 1) % 24;
  if (v23 > 16) {
    LODWORD(v23) = v23 + 1;
  }
  uint64_t v55 = (v23 + 913);
  uint64_t v56 = (v23 + 945);
  int v24 = ((int)a4 - 1) % 26;
  uint64_t v57 = (v24 + 65);
  uint64_t v58 = (v24 + 97);
  do
  {
    int v25 = [v14 characterAtIndex:v19];
    switch(v25)
    {
      case 123:
        unint64_t v27 = v19 - v20;
        if (v19 > v20) {
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v27));
        }
        if (a6) {
          *a6 = v19;
        }
        if (a7) {
          *a7 = v15;
        }
        unint64_t v28 = v19 + 1;
        if (v19 + 1 >= v15)
        {
LABEL_49:
          unint64_t v31 = v15;
          goto LABEL_50;
        }
        unint64_t v29 = v19 + 1;
        while (1)
        {
          int v30 = objc_msgSend(v14, "characterAtIndex:", v29, v27);
          if (v30 == 125)
          {
            if (a7) {
              *a7 = v29 + 1;
            }
            unint64_t v31 = v29;
            if (v29)
            {
LABEL_48:
              if (!v31) {
                goto LABEL_49;
              }
LABEL_50:
              v32 = &stru_1EDD49F70;
              unint64_t v33 = v31 - v28;
              if (v31 > v28) {
                v32 = (__CFString *)objc_msgSend(v14, "substringWithRange:", v28, v33);
              }
              if (a8) {
                *a8 = v28;
              }
              if (a9) {
                *a9 = v31;
              }
              if (objc_msgSend(@"none", "isEqualToString:", v32, v33)) {
                goto LABEL_75;
              }
              if ([@"box" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"▫";
                goto LABEL_74;
              }
              if ([@"check" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"✓";
                goto LABEL_74;
              }
              if ([@"circle" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"◦";
                goto LABEL_74;
              }
              if ([@"diamond" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"◆";
                goto LABEL_74;
              }
              if ([@"disc" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"•";
                goto LABEL_74;
              }
              if ([@"hyphen" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"⁃";
                goto LABEL_74;
              }
              if ([@"square" isEqualToString:v32])
              {
                v34 = v18;
                v35 = @"▪";
LABEL_74:
                [v34 appendString:v35];
LABEL_75:
                unint64_t v19 = v31 + 1;
LABEL_76:
                unint64_t v20 = v19;
                goto LABEL_77;
              }
              if ([@"lower-hexadecimal" isEqualToString:v32])
              {
                objc_msgSend(v18, "appendFormat:", @"%lx", v59);
                goto LABEL_89;
              }
              if ([@"upper-hexadecimal" isEqualToString:v32])
              {
                objc_msgSend(v18, "appendFormat:", @"%lX", v59);
                goto LABEL_89;
              }
              if ([@"octal" isEqualToString:v32])
              {
                objc_msgSend(v18, "appendFormat:", @"%lo", v59);
                goto LABEL_89;
              }
              if (([@"lower-alpha" isEqualToString:v32] & 1) != 0
                || [@"lower-latin" isEqualToString:v32])
              {
                uint64_t v36 = v58;
                goto LABEL_88;
              }
              if (([@"upper-alpha" isEqualToString:v32] & 1) != 0
                || [@"upper-latin" isEqualToString:v32])
              {
                uint64_t v36 = v57;
                goto LABEL_88;
              }
              if ([@"lower-greek" isEqualToString:v32])
              {
                uint64_t v36 = v56;
                goto LABEL_88;
              }
              if ([@"upper-greek" isEqualToString:v32])
              {
                uint64_t v36 = v55;
                goto LABEL_88;
              }
              if ([@"lower-russian" isEqualToString:v32])
              {
                uint64_t v36 = v54;
                goto LABEL_88;
              }
              if ([@"upper-russian" isEqualToString:v32])
              {
                uint64_t v36 = v53;
                goto LABEL_88;
              }
              if ([@"hiragana" isEqualToString:v32])
              {
                int64_t v37 = v52;
                v38 = (unsigned __int8 *)&gojuon;
                goto LABEL_105;
              }
              if ([@"hiragana-iroha" isEqualToString:v32])
              {
                int64_t v37 = v51;
                v38 = (unsigned __int8 *)&iroha;
LABEL_105:
                int v39 = v38[v37];
                int v40 = 12352;
              }
              else
              {
                if ([@"katakana" isEqualToString:v32])
                {
                  int64_t v41 = v52;
                  v42 = (unsigned __int8 *)&gojuon;
                }
                else
                {
                  if (![@"katakana-iroha" isEqualToString:v32])
                  {
                    if ([@"cjk-earthly-branch" isEqualToString:v32])
                    {
                      int64_t v43 = v50;
                      v44 = (unsigned __int16 *)&earthly_branch;
                    }
                    else
                    {
                      if (![@"cjk-heavenly-stem" isEqualToString:v32])
                      {
                        if ([@"lower-roman" isEqualToString:v32])
                        {
                          v45 = romanString(v59);
                        }
                        else if ([@"upper-roman" isEqualToString:v32])
                        {
                          v45 = (void *)[romanString(v59) uppercaseString];
                        }
                        else if ([@"cjk-ideographic" isEqualToString:v32])
                        {
                          v45 = cjkString(v59);
                        }
                        else
                        {
                          if ([@"decimal-leading-zero" isEqualToString:v32])
                          {
                            objc_msgSend(v18, "appendFormat:", v48, v59);
                            goto LABEL_89;
                          }
                          if ([@"arabic-indic" isEqualToString:v32])
                          {
                            v45 = arabicIndicString(v59);
                          }
                          else
                          {
                            if (![@"hebrew" isEqualToString:v32])
                            {
                              objc_msgSend(v18, "appendFormat:", @"%ld", v59);
                              goto LABEL_89;
                            }
                            v45 = hebrewString(v59);
                          }
                        }
                        [v18 appendFormat:@"%@", v45];
LABEL_89:
                        char v61 = 1;
                        goto LABEL_75;
                      }
                      int64_t v43 = v49;
                      v44 = (unsigned __int16 *)&heavenly_stem;
                    }
                    uint64_t v36 = v44[v43];
LABEL_88:
                    objc_msgSend(v18, "appendFormat:", @"%C", v36);
                    goto LABEL_89;
                  }
                  int64_t v41 = v51;
                  v42 = (unsigned __int8 *)&iroha;
                }
                int v39 = v42[v41];
                int v40 = 12448;
              }
              uint64_t v36 = (v39 + v40);
              goto LABEL_88;
            }
          }
          else
          {
            unint64_t v31 = 0;
            if (v30 == 92) {
              ++v29;
            }
          }
          if (++v29 >= v15) {
            goto LABEL_48;
          }
        }
      case 92:
        unint64_t v26 = v19 - v20;
        if (v19 > v20) {
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v26));
        }
        if (v19 + 1 < v15 && objc_msgSend(v14, "characterAtIndex:", v19 + 1, v26) != 9) {
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v19 + 1, 1));
        }
        v19 += 2;
        goto LABEL_76;
      case 9:
        if (v19 > v20) {
          objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v19 - v20));
        }
        ++v19;
        goto LABEL_76;
    }
    if (++v19 >= v15 && v15 > v20) {
      objc_msgSend(v18, "appendString:", objc_msgSend(v14, "substringWithRange:", v20, v15 - v20));
    }
LABEL_77:
    ;
  }
  while (v19 < v15);
  id v14 = v18;
  a5 = v60;
  char v46 = v61;
  if (v60) {
LABEL_132:
  }
    *a5 = v46 & 1;
  return v14;
}

+ (BOOL)includesTextListMarkers
{
  if (includesTextListMarkers_onceToken != -1) {
    dispatch_once(&includesTextListMarkers_onceToken, &__block_literal_global_25);
  }
  return includesTextListMarkers_includesTextListMarkers;
}

- (void)setMarkerTextAttachment:(id)a3
{
}

- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSUInteger)options
{
  return [(NSTextList *)self initWithMarkerFormat:markerFormat options:options startingItemNumber:0];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSTextList setVersion:1];
    __NSTextListClass = (uint64_t)a1;
  }
}

- (NSInteger)startingItemNumber
{
  return self->_startIndex + 1;
}

uint64_t __37__NSTextList_includesTextListMarkers__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if (!result || (uint64_t result = _NSTextScalingTypeForCurrentEnvironment(), result == 2)) {
    includesTextListMarkers_includesTextListMarkers = 1;
  }
  return result;
}

- (NSTextList)initWithMarkerFormat:(NSTextListMarkerFormat)markerFormat options:(NSTextListOptions)options startingItemNumber:(NSInteger)startingItemNumber
{
  if (markerFormat)
  {
    v11.receiver = self;
    v11.super_class = (Class)NSTextList;
    v8 = [(NSTextList *)&v11 init];
    if (v8)
    {
      v8->_markerFormat = (NSString *)[(NSString *)markerFormat copy];
      v8->_listFlags = options & 0xFFFFFFFF0FFFFFFFLL;
      NSInteger v9 = startingItemNumber - 1;
      if (startingItemNumber <= 0) {
        NSInteger v9 = 0;
      }
      v8->_startIndex = v9;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTextList)init
{
  return [(NSTextList *)self initWithMarkerFormat:&stru_1EDD49F70 options:0 startingItemNumber:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSTextList;
  [(NSTextList *)&v3 dealloc];
}

- (void)setStartingItemNumber:(NSInteger)startingItemNumber
{
  self->_startIndex = startingItemNumber - 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithMarkerFormat:options:startingItemNumber:", self->_markerFormat, self->_listFlags, self->_startIndex + 1);
  objc_msgSend(v4, "setMarkerTextAttachment:", -[NSTextList markerTextAttachment](self, "markerTextAttachment"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  markerFormat = self->_markerFormat;
  objc_super v11 = markerFormat;
  NSTextListOptions v6 = [(NSTextList *)self listOptions];
  NSInteger v7 = [(NSTextList *)self startingItemNumber];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeObject:self->_markerTextAttachment forKey:@"NSMarkerTextAttachment"];
    [a3 encodeObject:markerFormat forKey:@"NSMarkerFormat"];
    if (v6) {
      [a3 encodeInteger:v6 forKey:@"NSOptions"];
    }
    if (v7 != 1)
    {
      [a3 encodeInteger:v7 forKey:@"NSStart"];
    }
  }
  else
  {
    int v10 = v6 & 0xFFFFFFF;
    if (v7 == 1
      || (uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", v7), @"NSStart")) == 0)
    {
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@I", &v11, &v10);
    }
    else
    {
      int v10 = v6 & 0xFFFFFFF | 0x40000000;
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@I", &v11, &v10);
      objc_msgSend(a3, "encodeValuesOfObjCTypes:", "@", &v9, v8);
    }
  }
}

- (NSTextList)initWithCoder:(NSCoder *)coder
{
  v17.receiver = self;
  v17.super_class = (Class)NSTextList;
  v18 = 0;
  v4 = [(NSTextList *)&v17 init];
  if (v4)
  {
    if ([(NSCoder *)coder allowsKeyedCoding])
    {
      v5 = (NSString *)[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"NSMarkerFormat"];
      v18 = v5;
      if ([(NSCoder *)coder containsValueForKey:@"NSOptions"]) {
        int v6 = [(NSCoder *)coder decodeIntegerForKey:@"NSOptions"];
      }
      else {
        int v6 = 0;
      }
      if ([(NSCoder *)coder containsValueForKey:@"NSStart"]) {
        uint64_t v8 = [(NSCoder *)coder decodeIntegerForKey:@"NSStart"];
      }
      else {
        uint64_t v8 = 1;
      }
      id v11 = [(NSCoder *)coder decodeObjectForKey:@"NSMarkerTextAttachment"];
LABEL_22:
      v4->_markerFormat = v5;
      v4->_listFlags = v6 & 0xFFFFFFF;
      v4->_startIndex = v8 - 1;
      v4->_markerTextAttachment = (NSTextAttachment *)v11;
      return v4;
    }
    NSInteger v7 = [(NSCoder *)coder versionForClassName:@"NSTextList"];
    if (v7 == 1)
    {
      int v16 = 0;
      id v15 = 0;
      -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "@I", &v18, &v16);
      int v6 = v16;
      if ((v16 & 0x40000000) != 0)
      {
        -[NSCoder decodeValuesOfObjCTypes:](coder, "decodeValuesOfObjCTypes:", "@", &v15);
        if (v15
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && (uint64_t v12 = [v15 objectForKey:@"NSStart"]) != 0
          && (v13 = (void *)v12, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v8 = [v13 integerValue];
        }
        else
        {
          uint64_t v8 = 1;
        }
      }
      else
      {
        uint64_t v8 = 1;
      }
      id v11 = 0;
      v5 = v18;
      goto LABEL_22;
    }
    NSInteger v9 = v7;
    uint64_t v10 = _NSFullMethodName();
    NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v10, 1, v9);

    return 0;
  }
  return v4;
}

- (id)description
{
  NSInteger v3 = [(NSTextList *)self startingItemNumber];
  NSTextListOptions v4 = [(NSTextList *)self listOptions];
  v5 = NSString;
  int v6 = [(NSTextList *)self markerFormat];
  if (v4) {
    NSInteger v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" options 0x%lx", v4);
  }
  else {
    NSInteger v7 = &stru_1EDD49F70;
  }
  if (v3 == 1) {
    uint64_t v8 = &stru_1EDD49F70;
  }
  else {
    uint64_t v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" start at %ld", v3);
  }
  return (id)[v5 stringWithFormat:@"NSTextList %p format <%@>%@%@", self, v6, v7, v8];
}

- (BOOL)isOrdered
{
  BOOL v3 = 0;
  [(NSTextList *)self _markerForMarkerFormat:[(NSTextList *)self markerFormat] itemNumber:1 isNumbered:&v3 substitutionStart:0 end:0 specifierStart:0 end:0];
  return v3;
}

- (id)_markerTitle
{
  char v5 = 0;
  id v3 = [(NSTextList *)self _markerForMarkerFormat:[(NSTextList *)self markerFormat] itemNumber:1 isNumbered:&v5 substitutionStart:0 end:0 specifierStart:0 end:0];
  if (v5) {
    return (id)[NSString stringWithFormat:@"%@  %@  %@…", v3, -[NSTextList markerForItemNumber:](self, "markerForItemNumber:", 2), -[NSTextList markerForItemNumber:](self, "markerForItemNumber:", 3)];
  }
  return v3;
}

- (id)_markerPrefix
{
  id v3 = [(NSTextList *)self markerFormat];
  uint64_t v5 = 0;
  [(NSTextList *)self _markerForMarkerFormat:v3 itemNumber:1 isNumbered:0 substitutionStart:&v5 end:0 specifierStart:0 end:0];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v5) {
      return [(NSString *)v3 substringWithRange:0];
    }
    else {
      return &stru_1EDD49F70;
    }
  }
  return v3;
}

- (id)_markerSpecifier
{
  id v3 = [(NSTextList *)self markerFormat];
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [(NSTextList *)self _markerForMarkerFormat:v3 itemNumber:1 isNumbered:0 substitutionStart:0 end:0 specifierStart:&v8 end:&v7];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL && v7 > v8) {
    return -[NSString substringWithRange:](v3, "substringWithRange:", v8, v7 - v8);
  }
  else {
    return &stru_1EDD49F70;
  }
}

- (id)_markerSpecifierAsCSSValue
{
  id v2 = [(NSTextList *)self _markerSpecifier];
  if (!v2) {
    return &stru_1EDD49F70;
  }
  id v3 = v2;
  id result = (id)[&unk_1EDD68C60 objectForKey:v2];
  if (!result) {
    return v3;
  }
  return result;
}

- (id)_unaffixedMarkerFormat
{
  id v3 = [(NSTextList *)self markerFormat];
  unint64_t v7 = 0;
  unint64_t v8 = 0;
  [(NSTextList *)self _markerForMarkerFormat:v3 itemNumber:1 isNumbered:0 substitutionStart:&v8 end:&v7 specifierStart:0 end:0];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL && v7 != 0x7FFFFFFFFFFFFFFFLL && v7 > v8) {
    return -[NSString substringWithRange:](v3, "substringWithRange:", v8, v7 - v8);
  }
  else {
    return &stru_1EDD49F70;
  }
}

- (id)_unaffixedMarkerForItemNumber:(int64_t)a3
{
  uint64_t v5 = [(NSTextList *)self markerFormat];
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  [(NSTextList *)self _markerForMarkerFormat:v5 itemNumber:a3 isNumbered:0 substitutionStart:&v10 end:&v9 specifierStart:0 end:0];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0x7FFFFFFFFFFFFFFFLL && v9 > v10) {
    return -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSString substringWithRange:](v5, "substringWithRange:", v10, v9 - v10), a3, 0, 0, 0, 0, 0);
  }
  else {
    return &stru_1EDD49F70;
  }
}

- (id)_unaffixedMarkerTitle
{
  id v3 = [(NSTextList *)self markerFormat];
  char v10 = 0;
  unint64_t v8 = 0;
  unint64_t v9 = 0;
  [(NSTextList *)self _markerForMarkerFormat:v3 itemNumber:1 isNumbered:&v10 substitutionStart:&v9 end:&v8 specifierStart:0 end:0];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v8 == 0x7FFFFFFFFFFFFFFFLL || v8 <= v9) {
    return &stru_1EDD49F70;
  }
  id v6 = -[NSTextList _markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:](self, "_markerForMarkerFormat:itemNumber:isNumbered:substitutionStart:end:specifierStart:end:", -[NSString substringWithRange:](v3, "substringWithRange:", v9, v8 - v9), 1, 0, 0, 0, 0, 0);
  if (v10) {
    return (id)[NSString stringWithFormat:@"%@  %@  %@…", v6, -[NSTextList _unaffixedMarkerForItemNumber:](self, "_unaffixedMarkerForItemNumber:", 2), -[NSTextList _unaffixedMarkerForItemNumber:](self, "_unaffixedMarkerForItemNumber:", 3)];
  }
  return v6;
}

- (id)_markerSuffix
{
  id v3 = [(NSTextList *)self markerFormat];
  unint64_t v7 = 0;
  unint64_t v4 = [(NSString *)v3 length];
  [(NSTextList *)self _markerForMarkerFormat:v3 itemNumber:1 isNumbered:0 substitutionStart:0 end:&v7 specifierStart:0 end:0];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v4 > v7) {
    return -[NSString substringWithRange:](v3, "substringWithRange:", v7, v4 - v7);
  }
  else {
    return &stru_1EDD49F70;
  }
}

- (id)_markerAtIndex:(unint64_t)a3 inText:(id)a4
{
  uint64_t v7 = [a4 itemNumberInTextList:self atIndex:a3];
  if (v7 < 1) {
    return &stru_1EDD49F70;
  }
  unint64_t v8 = [(NSTextList *)self markerForItemNumber:v7];
  if ((self->_listFlags & 1) == 0) {
    return v8;
  }
  unint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "attribute:atIndex:effectiveRange:", @"NSParagraphStyle", a3, 0), "textLists");
  unint64_t v10 = [v9 count];
  if (v10 < 2) {
    return v8;
  }
  unint64_t v11 = v10;
  uint64_t v12 = 1;
  while ((NSTextList *)[v9 objectAtIndex:v12] != self)
  {
    if (v11 == ++v12) {
      return v8;
    }
  }
  return (id)[NSString stringWithFormat:@"%@%@", objc_msgSend((id)objc_msgSend(v9, "objectAtIndex:", v12 - 1), "_markerAtIndex:inText:", a3, a4), v8];
}

+ (id)_standardMarkerAttributesForAttributes:(id)a3
{
  unint64_t v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = [a3 objectForKey:@"NSFont"];
  if (v5) {
    [v4 setObject:v5 forKey:@"NSFont"];
  }
  uint64_t v6 = [a3 objectForKey:@"NSParagraphStyle"];
  if (v6) {
    [v4 setObject:v6 forKey:@"NSParagraphStyle"];
  }
  uint64_t v7 = [a3 objectForKey:@"NSColor"];
  if (v7) {
    [v4 setObject:v7 forKey:@"NSColor"];
  }
  uint64_t v8 = [a3 objectForKey:@"NSBackgroundColor"];
  if (v8) {
    [v4 setObject:v8 forKey:@"NSBackgroundColor"];
  }
  return v4;
}

@end
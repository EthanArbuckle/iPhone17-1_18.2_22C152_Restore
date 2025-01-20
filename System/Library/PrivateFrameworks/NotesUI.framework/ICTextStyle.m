@interface ICTextStyle
+ (BOOL)autoListInsertionEnabled;
+ (id)bodyStyle;
+ (id)bulletStyle;
+ (id)dashStyle;
+ (id)defaultTextStyles;
+ (id)fixedWidthStyle;
+ (id)headingStyle;
+ (id)icaxStyleDescriptionForBIUSStyle:(unint64_t)a3;
+ (id)icaxStyleDescriptionForNamedStyle:(unsigned int)a3;
+ (id)numberedStyle;
+ (id)settingsDescriptionForNamedStyle:(unsigned int)a3;
+ (id)styleForNamedStyle:(unsigned int)a3;
+ (id)subheadingStyle;
+ (id)titleForNamedStyle:(unsigned int)a3;
+ (id)titleStyle;
+ (unsigned)namedStyleFromStyleID:(id)a3;
+ (unsigned)noteDefaultNamedStyle;
+ (unsigned)validatedNamedStyle:(unsigned int)a3;
+ (void)setAutoListInsertionEnabled:(BOOL)a3;
+ (void)setNoteDefaultNamedStyle:(unsigned int)a3;
- (BOOL)isTextList;
- (NSAttributedString)attributedName;
- (NSDictionary)attributes;
- (NSString)name;
- (NSString)styleID;
- (id)icaxStyleDescription;
- (unsigned)ttStyle;
- (void)setAttributes:(id)a3;
- (void)setName:(id)a3;
- (void)setTtStyle:(unsigned int)a3;
@end

@implementation ICTextStyle

- (NSAttributedString)attributedName
{
  v3 = [(ICTextStyle *)self attributes];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = *MEMORY[0x1E4FB0738];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FB0738]];
  v7 = (void *)[v6 mutableCopy];

  [v7 setFirstLineHeadIndent:0.0];
  [v7 setHeadIndent:0.0];
  v8 = (void *)[v7 copy];
  [v4 setObject:v8 forKeyedSubscript:v5];

  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  v10 = [(ICTextStyle *)self name];
  v11 = (void *)[v9 initWithString:v10 attributes:v4];

  return (NSAttributedString *)v11;
}

- (NSString)styleID
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"_ICTTNamedStyle_%d", self->_ttStyle);
  return (NSString *)v2;
}

+ (unsigned)namedStyleFromStyleID:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"_ICTTNamedStyle_"])
  {
    v4 = [v3 substringFromIndex:objc_msgSend(@"_ICTTNamedStyle_", "length")];
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "integerValue"));
    unsigned int v6 = [v5 unsignedIntValue];
  }
  else
  {
    unsigned int v6 = +[ICTextStyle noteDefaultNamedStyle];
  }

  return v6;
}

- (BOOL)isTextList
{
  return [(ICTextStyle *)self ttStyle] - 100 < 3;
}

+ (id)defaultTextStyles
{
  if (defaultTextStyles_onceToken != -1) {
    dispatch_once(&defaultTextStyles_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)defaultTextStyles_defaultStyles;
  return v2;
}

void __32__ICTextStyle_defaultTextStyles__block_invoke()
{
  v10[8] = *MEMORY[0x1E4F143B8];
  v0 = +[ICTextStyle titleStyle];
  v10[0] = v0;
  v1 = +[ICTextStyle headingStyle];
  v10[1] = v1;
  v2 = +[ICTextStyle subheadingStyle];
  v10[2] = v2;
  id v3 = +[ICTextStyle bodyStyle];
  v10[3] = v3;
  v4 = +[ICTextStyle fixedWidthStyle];
  v10[4] = v4;
  uint64_t v5 = +[ICTextStyle bulletStyle];
  v10[5] = v5;
  unsigned int v6 = +[ICTextStyle dashStyle];
  v10[6] = v6;
  v7 = +[ICTextStyle numberedStyle];
  v10[7] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:8];
  id v9 = (void *)defaultTextStyles_defaultStyles;
  defaultTextStyles_defaultStyles = v8;
}

+ (id)titleStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"TITLE_TEXT_STYLE" value:@"Title" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 titleAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:0];
  return v3;
}

+ (id)headingStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Heading" value:@"Heading" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 headingAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:1];
  return v3;
}

+ (id)subheadingStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Subheading" value:@"Subheading" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 subheadingAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:2];
  return v3;
}

+ (id)bodyStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Body" value:@"Body" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 bodyAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:3];
  return v3;
}

+ (id)fixedWidthStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Monostyled" value:@"Monostyled" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 fixedWidthAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:4];
  return v3;
}

+ (id)bulletStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"• Bulleted List" value:@"• Bulleted List" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 defaultListAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:100];
  return v3;
}

+ (id)dashStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"– Dashed List" value:@"– Dashed List" table:0 allowSiri:1];
  [(ICTextStyle *)v3 setName:v4];

  uint64_t v5 = [(ICTTTextController *)v2 defaultListAttributes];
  [(ICTextStyle *)v3 setAttributes:v5];

  [(ICTextStyle *)v3 setTtStyle:101];
  return v3;
}

+ (id)numberedStyle
{
  v2 = objc_alloc_init(ICTTTextController);
  id v3 = objc_alloc_init(ICTextStyle);
  v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%ld. Numbered List" value:@"%ld. Numbered List" table:0 allowSiri:1];
  unsigned int v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, 1);
  [(ICTextStyle *)v3 setName:v6];

  v7 = [(ICTTTextController *)v2 defaultListAttributes];
  [(ICTextStyle *)v3 setAttributes:v7];

  [(ICTextStyle *)v3 setTtStyle:102];
  return v3;
}

+ (unsigned)validatedNamedStyle:(unsigned int)a3
{
  unsigned int result = a3;
  if (a3 >= 6 && a3 - 100 >= 4)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICTextStyle validatedNamedStyle:]", 1, 0, @"Invalid named style %lu, defaulting to title", a3 functionName simulateCrash showAlert format];
    return 3;
  }
  return result;
}

+ (unsigned)noteDefaultNamedStyle
{
  id v3 = [MEMORY[0x1E4F837D0] objectForKey:@"TTTextControllerNoteDefaultNamedStyleKey"];
  v4 = v3;
  if (v3) {
    unsigned int v5 = objc_msgSend(a1, "validatedNamedStyle:", objc_msgSend(v3, "unsignedIntegerValue"));
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

+ (void)setNoteDefaultNamedStyle:(unsigned int)a3
{
  id v3 = (void *)MEMORY[0x1E4F837D0];
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  [v3 setObject:v4 forKey:@"TTTextControllerNoteDefaultNamedStyleKey"];
}

+ (id)titleForNamedStyle:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned int v5 = [a1 defaultTextStyles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      if ([v10 ttStyle] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textStyle", "+[ICTextStyle titleForNamedStyle:]", 1, 0, @"No text style found for namedStyle %ld", a3);
  v12 = [a1 defaultTextStyles];
  id v11 = [v12 firstObject];

LABEL_12:
  v13 = [v11 name];

  return v13;
}

+ (id)icaxStyleDescriptionForNamedStyle:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"TITLE_TEXT_STYLE";
      unsigned int v5 = @"Title";
      goto LABEL_15;
    case 1u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Heading";
      goto LABEL_14;
    case 2u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Subheading";
      goto LABEL_14;
    case 3u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Body";
      goto LABEL_14;
    case 4u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Fixed width";
      goto LABEL_14;
    case 5u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Caption";
LABEL_14:
      unsigned int v5 = v4;
LABEL_15:
      uint64_t v6 = [v3 localizedFrameworkStringForKey:v4 value:v5 table:0 allowSiri:1];
      break;
    default:
      switch(a3)
      {
        case 'd':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"Bulleted List";
          goto LABEL_14;
        case 'e':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"Dashed List";
          goto LABEL_14;
        case 'f':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"Numbered List";
          goto LABEL_14;
        case 'g':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"Checklist";
          goto LABEL_14;
        default:
          uint64_t v6 = 0;
          break;
      }
      break;
  }
  return v6;
}

+ (id)icaxStyleDescriptionForBIUSStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Bold";
      goto LABEL_8;
    case 2uLL:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Italic";
      goto LABEL_8;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_9;
    case 4uLL:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Underline";
      goto LABEL_8;
    case 8uLL:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Strikethrough";
      goto LABEL_8;
    default:
      if (a3 != 16) {
        goto LABEL_9;
      }
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"Highlight";
LABEL_8:
      a1 = [v3 localizedFrameworkStringForKey:v4 value:v4 table:0 allowSiri:1];
LABEL_9:
      return a1;
  }
}

+ (id)settingsDescriptionForNamedStyle:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_TITLE";
      unsigned int v5 = @"Title";
      goto LABEL_14;
    case 1u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_HEADING";
      unsigned int v5 = @"Heading";
      goto LABEL_14;
    case 2u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_SUBHEADING";
      unsigned int v5 = @"Subheading";
      goto LABEL_14;
    case 3u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_BODY";
      unsigned int v5 = @"Body";
      goto LABEL_14;
    case 4u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_FIXED_WIDTH";
      unsigned int v5 = @"Fixed width";
      goto LABEL_14;
    case 5u:
      id v3 = (void *)MEMORY[0x1E4F83770];
      id v4 = @"SETTINGS_TEXT_STYLE_CAPTION";
      unsigned int v5 = @"Caption";
LABEL_14:
      uint64_t v6 = [v3 localizedFrameworkStringForKey:v4 value:v5 table:0 allowSiri:1];
      break;
    default:
      switch(a3)
      {
        case 'd':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"SETTINGS_TEXT_STYLE_BULLETED_LIST";
          unsigned int v5 = @"Bulleted List";
          goto LABEL_14;
        case 'e':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"SETTINGS_TEXT_STYLE_DASHED_LIST";
          unsigned int v5 = @"Dashed List";
          goto LABEL_14;
        case 'f':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"SETTINGS_TEXT_STYLE_NUMBERED_LIST";
          unsigned int v5 = @"Numbered List";
          goto LABEL_14;
        case 'g':
          id v3 = (void *)MEMORY[0x1E4F83770];
          id v4 = @"SETTINGS_TEXT_STYLE_CHECKLIST";
          unsigned int v5 = @"Checklist";
          goto LABEL_14;
        default:
          uint64_t v6 = 0;
          break;
      }
      break;
  }
  return v6;
}

+ (id)styleForNamedStyle:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      id v3 = +[ICTextStyle titleStyle];
      break;
    case 1u:
      id v3 = +[ICTextStyle headingStyle];
      break;
    case 2u:
      id v3 = +[ICTextStyle subheadingStyle];
      break;
    case 3u:
      id v3 = +[ICTextStyle bodyStyle];
      break;
    case 4u:
      id v3 = +[ICTextStyle fixedWidthStyle];
      break;
    case 5u:
      id v4 = (void *)MEMORY[0x1E4F836F8];
      unsigned int v5 = @"Trying to access caption style, but it doesn't exist";
LABEL_13:
      [v4 handleFailedAssertWithCondition:"__objc_no" functionName:"+[ICTextStyle styleForNamedStyle:]" simulateCrash:1 showAlert:0 format:v5];
LABEL_14:
      id v3 = 0;
      break;
    default:
      switch(a3)
      {
        case 'd':
          id v3 = +[ICTextStyle bulletStyle];
          break;
        case 'e':
          id v3 = +[ICTextStyle dashStyle];
          break;
        case 'f':
          id v3 = +[ICTextStyle numberedStyle];
          break;
        case 'g':
          id v4 = (void *)MEMORY[0x1E4F836F8];
          unsigned int v5 = @"Trying to access Todo style, but it doesn't exist";
          goto LABEL_13;
        default:
          goto LABEL_14;
      }
      break;
  }
  return v3;
}

- (id)icaxStyleDescription
{
  id v3 = objc_opt_class();
  uint64_t v4 = [(ICTextStyle *)self ttStyle];
  return (id)[v3 icaxStyleDescriptionForNamedStyle:v4];
}

+ (void)setAutoListInsertionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"ICTextStyleAutoListInsertionEnabled"];
}

+ (BOOL)autoListInsertionEnabled
{
  return 1;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttributes:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (unsigned)ttStyle
{
  return self->_ttStyle;
}

- (void)setTtStyle:(unsigned int)a3
{
  self->_ttStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
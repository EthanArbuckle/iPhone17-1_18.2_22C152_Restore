@interface ICAutoCompleteSuggestionsItem
- (BOOL)isCreationSuggestion;
- (BOOL)isEmptyPlaceholder;
- (BOOL)isSectionHeader;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 isSectionHeader:(BOOL)a4;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 representedObject:(id)a4 isEmptyPlaceholder:(BOOL)a5;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 representedObject:(id)a5;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 rightText:(id)a5 uuidString:(id)a6 isEmptyPlaceholder:(BOOL)a7 isSectionHeader:(BOOL)a8 isCreationSuggestion:(BOOL)a9 iconImage:(id)a10 parentNoteIdentifier:(id)a11 representedObject:(id)a12;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 iconImage:(id)a6;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 iconImage:(id)a7 representedObject:(id)a8;
- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 isSectionHeader:(BOOL)a7 iconImage:(id)a8 representedObject:(id)a9;
- (NSObject)representedObject;
- (NSString)displayText;
- (NSString)parentNoteIdentifier;
- (NSString)rightText;
- (NSString)shortText;
- (NSString)uuidString;
- (UIImage)iconImage;
@end

@implementation ICAutoCompleteSuggestionsItem

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 rightText:(id)a5 uuidString:(id)a6 isEmptyPlaceholder:(BOOL)a7 isSectionHeader:(BOOL)a8 isCreationSuggestion:(BOOL)a9 iconImage:(id)a10 parentNoteIdentifier:(id)a11 representedObject:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id obj = a5;
  id v19 = a5;
  id v27 = a6;
  id v30 = a6;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v31.receiver = self;
  v31.super_class = (Class)ICAutoCompleteSuggestionsItem;
  v23 = [(ICAutoCompleteSuggestionsItem *)&v31 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_displayText, a3);
    objc_storeStrong((id *)&v24->_shortText, a4);
    objc_storeStrong((id *)&v24->_rightText, obj);
    objc_storeStrong((id *)&v24->_uuidString, v27);
    v24->_isEmptyPlaceholder = a7;
    v24->_isSectionHeader = a8;
    v24->_isCreationSuggestion = a9;
    objc_storeStrong((id *)&v24->_iconImage, a10);
    objc_storeStrong((id *)&v24->_parentNoteIdentifier, a11);
    objc_storeStrong((id *)&v24->_representedObject, a12);
  }

  return v24;
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 isSectionHeader:(BOOL)a7 iconImage:(id)a8 representedObject:(id)a9
{
  LOBYTE(v10) = 0;
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:a4 rightText:0 uuidString:a5 isEmptyPlaceholder:a6 isSectionHeader:a7 isCreationSuggestion:v10 iconImage:a8 parentNoteIdentifier:0 representedObject:a9];
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 iconImage:(id)a6
{
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:a4 uuidString:a5 isEmptyPlaceholder:0 iconImage:a6 representedObject:0];
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 representedObject:(id)a4 isEmptyPlaceholder:(BOOL)a5
{
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:0 uuidString:0 isEmptyPlaceholder:a5 isSectionHeader:0 iconImage:0 representedObject:a4];
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 isSectionHeader:(BOOL)a4
{
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:0 uuidString:0 isEmptyPlaceholder:0 isSectionHeader:a4 iconImage:0 representedObject:0];
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 representedObject:(id)a5
{
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:a4 uuidString:0 isEmptyPlaceholder:0 iconImage:0 representedObject:a5];
}

- (ICAutoCompleteSuggestionsItem)initWithDisplayText:(id)a3 shortText:(id)a4 uuidString:(id)a5 isEmptyPlaceholder:(BOOL)a6 iconImage:(id)a7 representedObject:(id)a8
{
  return [(ICAutoCompleteSuggestionsItem *)self initWithDisplayText:a3 shortText:a4 uuidString:a5 isEmptyPlaceholder:a6 isSectionHeader:0 iconImage:a7 representedObject:a8];
}

- (NSString)displayText
{
  return self->_displayText;
}

- (NSString)shortText
{
  return self->_shortText;
}

- (NSString)rightText
{
  return self->_rightText;
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (NSString)parentNoteIdentifier
{
  return self->_parentNoteIdentifier;
}

- (BOOL)isEmptyPlaceholder
{
  return self->_isEmptyPlaceholder;
}

- (BOOL)isCreationSuggestion
{
  return self->_isCreationSuggestion;
}

- (BOOL)isSectionHeader
{
  return self->_isSectionHeader;
}

- (NSObject)representedObject
{
  return self->_representedObject;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_parentNoteIdentifier, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_storeStrong((id *)&self->_rightText, 0);
  objc_storeStrong((id *)&self->_shortText, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end
@interface ICAttachmentsFilterTypeSelection
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICAttachmentsFilterTypeSelection:(id)a3;
- (ICAttachmentsFilterTypeSelection)initWithAttachmentSection:(signed __int16)a3;
- (ICAttachmentsFilterTypeSelection)initWithSelectionType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)filterName;
- (id)rawFilterValue;
- (int64_t)filterType;
- (unint64_t)hash;
- (unint64_t)selectionType;
- (void)setSelectionType:(unint64_t)a3;
@end

@implementation ICAttachmentsFilterTypeSelection

- (ICAttachmentsFilterTypeSelection)initWithSelectionType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentsFilterTypeSelection;
  result = [(ICAttachmentsFilterTypeSelection *)&v5 init];
  if (result) {
    result->_selectionType = a3;
  }
  return result;
}

- (ICAttachmentsFilterTypeSelection)initWithAttachmentSection:(signed __int16)a3
{
  unsigned int v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentsFilterTypeSelection;
  v4 = [(ICAttachmentsFilterTypeSelection *)&v8 init];
  objc_super v5 = v4;
  if (v4) {
    BOOL v6 = v3 > 7;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    [(ICAttachmentsFilterTypeSelection *)v4 setSelectionType:qword_1C3DD3CE0[v3]];
  }
  return v5;
}

- (id)debugDescription
{
  v2 = NSString;
  unint64_t v3 = [(ICAttachmentsFilterTypeSelection *)self selectionType];
  if (v3 - 1 > 8) {
    v4 = @"Unknown";
  }
  else {
    v4 = off_1E64A9AE0[v3 - 1];
  }
  return (id)[v2 stringWithFormat:@"selectionType: %@", v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ICAttachmentsFilterTypeSelection allocWithZone:a3] init];
  [(ICAttachmentsFilterTypeSelection *)v4 setSelectionType:[(ICAttachmentsFilterTypeSelection *)self selectionType]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICAttachmentsFilterTypeSelection *)a3;
  objc_super v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ICAttachmentsFilterTypeSelection *)self isEqualToICAttachmentsFilterTypeSelection:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[ICAttachmentsFilterTypeSelection selectionType](self, "selectionType"));
  uint64_t v3 = [v2 hash];
  unint64_t v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (int64_t)filterType
{
  return 6;
}

- (id)filterName
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Attachments" value:@"Attachments" table:0 allowSiri:1];
}

- (id)rawFilterValue
{
  unint64_t v2 = [(ICAttachmentsFilterTypeSelection *)self selectionType];
  if (v2 - 1 > 8) {
    return @"Unknown";
  }
  else {
    return off_1E64A9AE0[v2 - 1];
  }
}

- (BOOL)isEqualToICAttachmentsFilterTypeSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICAttachmentsFilterTypeSelection *)self selectionType];
  uint64_t v6 = [v4 selectionType];

  return v5 == v6;
}

- (unint64_t)selectionType
{
  return self->_selectionType;
}

- (void)setSelectionType:(unint64_t)a3
{
  self->_selectionType = a3;
}

@end
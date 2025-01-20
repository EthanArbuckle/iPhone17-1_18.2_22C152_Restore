@interface ICNoteTimelineSectionIdentifier
+ (id)sortDescriptorsWithDirection:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToICNoteTimelineSectionIdentifier:(id)a3;
- (ICNoteTimelineSectionIdentifier)initWithTimelineSectionType:(int64_t)a3 referenceDate:(id)a4 title:(id)a5 sortOrder:(unint64_t)a6;
- (NSDate)referenceDate;
- (NSString)sectionTitle;
- (id)description;
- (id)typeString;
- (int64_t)timelineSectionType;
- (unint64_t)hash;
- (unint64_t)sortOrder;
- (void)setReferenceDate:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setSortOrder:(unint64_t)a3;
- (void)setTimelineSectionType:(int64_t)a3;
@end

@implementation ICNoteTimelineSectionIdentifier

- (ICNoteTimelineSectionIdentifier)initWithTimelineSectionType:(int64_t)a3 referenceDate:(id)a4 title:(id)a5 sortOrder:(unint64_t)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICNoteTimelineSectionIdentifier;
  v13 = [(ICNoteSectionIdentifier *)&v16 initWithNoteSectionType:5];
  v14 = v13;
  if (v13)
  {
    v13->_timelineSectionType = a3;
    objc_storeStrong((id *)&v13->_referenceDate, a4);
    objc_storeStrong((id *)&v14->_sectionTitle, a5);
    v14->_sortOrder = a6;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteTimelineSectionIdentifier;
  if ([(ICNoteSectionIdentifier *)&v8 isEqual:v4])
  {
    objc_opt_class();
    v5 = ICDynamicCast();
    BOOL v6 = [(ICNoteTimelineSectionIdentifier *)self isEqualToICNoteTimelineSectionIdentifier:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqualToICNoteTimelineSectionIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(ICNoteTimelineSectionIdentifier *)self timelineSectionType];
  if (v5 == [v4 timelineSectionType])
  {
    BOOL v6 = [(ICNoteTimelineSectionIdentifier *)self sectionTitle];
    v7 = [v4 sectionTitle];
    if ([v6 isEqualToString:v7])
    {
      unint64_t v8 = [(ICNoteTimelineSectionIdentifier *)self sortOrder];
      BOOL v9 = v8 == [v4 sortOrder];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v15.receiver = self;
  v15.super_class = (Class)ICNoteTimelineSectionIdentifier;
  id v3 = [(ICNoteSectionIdentifier *)&v15 hash];
  char v4 = [(ICNoteTimelineSectionIdentifier *)self timelineSectionType];
  int64_t v5 = [(ICNoteTimelineSectionIdentifier *)self sectionTitle];
  [v5 hash];
  [(ICNoteTimelineSectionIdentifier *)self sortOrder];
  unint64_t v13 = ICHashWithHashKeys((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12, v4);

  return v13;
}

- (int64_t)timelineSectionType
{
  return self->_timelineSectionType;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

+ (id)sortDescriptorsWithDirection:(int64_t)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3 == 0;
  char v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timelineSectionType" ascending:v3];
  v8[0] = v4;
  int64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"sortOrder" ascending:v3];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

- (id)description
{
  BOOL v3 = NSString;
  char v4 = [(ICNoteTimelineSectionIdentifier *)self typeString];
  int64_t v5 = [(ICNoteTimelineSectionIdentifier *)self sectionTitle];
  uint64_t v6 = [v3 stringWithFormat:@"type: %@, title: %@, sortOrder: %lu", v4, v5, -[ICNoteTimelineSectionIdentifier sortOrder](self, "sortOrder")];

  return v6;
}

- (id)typeString
{
  int64_t v2 = [(ICNoteTimelineSectionIdentifier *)self timelineSectionType];
  if ((unint64_t)(v2 - 1) > 8) {
    return @"Invitations";
  }
  else {
    return off_1E5FD9AE8[v2 - 1];
  }
}

- (void)setTimelineSectionType:(int64_t)a3
{
  self->_timelineSectionType = a3;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (void)setSectionTitle:(id)a3
{
}

- (void)setSortOrder:(unint64_t)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
}

@end
@interface ICActivityStreamSelection
+ (id)objc_selectionFromData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICActivityStreamSelection)initWithFilter:(id)a3 displayDate:(id)a4;
- (ICActivityStreamSelection)initWithItemIDs:(id)a3 filter:(id)a4 displayDate:(id)a5;
- (ICActivityStreamSelection)initWithMentions:(id)a3;
- (ICTTTextEditFilter)filter;
- (NSDate)displayDate;
- (NSSet)itemIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objc_encodedData;
- (id)objc_initWithMentions:(id)a3;
- (unint64_t)hash;
- (void)setDisplayDate:(id)a3;
- (void)setFilter:(id)a3;
- (void)setItemIDs:(id)a3;
@end

@implementation ICActivityStreamSelection

- (ICActivityStreamSelection)initWithItemIDs:(id)a3 filter:(id)a4 displayDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICActivityStreamSelection;
  v12 = [(ICActivityStreamSelection *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_itemIDs, a3);
    objc_storeStrong((id *)&v13->_filter, a4);
    objc_storeStrong((id *)&v13->_displayDate, a5);
  }

  return v13;
}

- (ICActivityStreamSelection)initWithFilter:(id)a3 displayDate:(id)a4
{
  return [(ICActivityStreamSelection *)self initWithItemIDs:0 filter:a3 displayDate:a4];
}

- (ICActivityStreamSelection)initWithMentions:(id)a3
{
  v4 = [(ICActivityStreamSelection *)self objc_initWithMentions:a3];

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICActivityStreamSelection *)self itemIDs];
  v7 = [(ICActivityStreamSelection *)self filter];
  v8 = [(ICActivityStreamSelection *)self displayDate];
  id v9 = [v3 stringWithFormat:@"<%@: %p, itemIDs: %@, filter: %@, displayDate: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [(ICActivityStreamSelection *)self itemIDs];
    v7 = [v5 itemIDs];
    v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      id v9 = 0;
    }
    else {
      id v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      id v11 = 0;
    }
    else {
      id v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        goto LABEL_17;
      }
      int v15 = [(id)v10 isEqual:v12];

      if (!v15)
      {
        char v18 = 0;
        goto LABEL_19;
      }
    }
    uint64_t v10 = [v5 filter];
    v13 = [(ICActivityStreamSelection *)self filter];
    if ([(id)v10 isEqual:v13])
    {
      v16 = [v5 displayDate];
      v17 = [(ICActivityStreamSelection *)self displayDate];
      char v18 = [v16 isEqual:v17];

LABEL_18:
LABEL_19:

      return v18;
    }
LABEL_17:
    char v18 = 0;
    goto LABEL_18;
  }
  return 1;
}

- (unint64_t)hash
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICActivityStreamSelection *)self itemIDs];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v5 hash];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v6 += ICHashWithObject(*(void **)(*((void *)&v24 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  unint64_t v12 = [(ICActivityStreamSelection *)self filter];
  char v13 = [v12 hash];
  BOOL v14 = [(ICActivityStreamSelection *)self displayDate];
  [v14 hash];
  unint64_t v22 = ICHashWithHashKeys(v6, v15, v16, v17, v18, v19, v20, v21, v13);

  return v22;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ICActivityStreamSelection allocWithZone:a3];
  v5 = [(ICActivityStreamSelection *)self itemIDs];
  uint64_t v6 = [(ICActivityStreamSelection *)self filter];
  id v7 = [(ICActivityStreamSelection *)self displayDate];
  uint64_t v8 = [(ICActivityStreamSelection *)v4 initWithItemIDs:v5 filter:v6 displayDate:v7];

  return v8;
}

- (NSSet)itemIDs
{
  return self->_itemIDs;
}

- (void)setItemIDs:(id)a3
{
}

- (ICTTTextEditFilter)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (void)setDisplayDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

- (id)objc_initWithMentions:(id)a3
{
  sub_1B0A2E124(0, (unint64_t *)&qword_1E9B4BBB8);
  unint64_t v3 = sub_1B0B825CC();
  return ICActivityStreamSelection.init(mentions:)(v3);
}

+ (id)objc_selectionFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1B0B7FC1C();
  unint64_t v6 = v5;

  id v7 = _sSo25ICActivityStreamSelectionC7NotesUIE4from4dataABSg10Foundation4DataV_tFZ_0();
  sub_1B0A8E238(v4, v6);
  return v7;
}

- (id)objc_encodedData
{
  uint64_t v3 = type metadata accessor for ICActivityStreamSelection.Model();
  MEMORY[0x1F4188790](v3);
  unint64_t v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1B0B7F77C();
  swift_allocObject();
  unint64_t v6 = self;
  sub_1B0B7F76C();
  id v7 = v6;
  uint64_t v8 = [(ICActivityStreamSelection *)v7 itemIDs];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = sub_1B0B8273C();
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t *v5 = v10;
  id v11 = [(ICActivityStreamSelection *)v7 filter];
  sub_1B0B829EC();
  unint64_t v12 = [(ICActivityStreamSelection *)v7 displayDate];
  sub_1B0B7FDAC();

  sub_1B0B4ECB0(&qword_1E9B4CB88, (void (*)(uint64_t))type metadata accessor for ICActivityStreamSelection.Model);
  uint64_t v13 = sub_1B0B7F75C();
  unint64_t v15 = v14;
  sub_1B0B4ED5C((uint64_t)v5);

  swift_release();
  uint64_t v16 = (void *)sub_1B0B7FC0C();
  sub_1B0A8E238(v13, v15);
  return v16;
}

@end
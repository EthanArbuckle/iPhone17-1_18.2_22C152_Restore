@interface TwoLinesHistoryEntryRecentsItemOutlineCellModel
- (BOOL)isEqual:(id)a3;
- (HistoryEntryRecentsItem)recentsItem;
- (TwoLinesHistoryEntryRecentsItemOutlineCellModel)initWithHistoryEntryRecentsItem:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5;
- (id)accessoryModels;
- (unint64_t)hash;
@end

@implementation TwoLinesHistoryEntryRecentsItemOutlineCellModel

- (TwoLinesHistoryEntryRecentsItemOutlineCellModel)initWithHistoryEntryRecentsItem:(id)a3 accessoryModels:(id)a4 backgroundModel:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100D34300;
  v16[3] = &unk_1013228B0;
  id v11 = v9;
  id v17 = v11;
  v15.receiver = self;
  v15.super_class = (Class)TwoLinesHistoryEntryRecentsItemOutlineCellModel;
  v12 = [(TwoLinesBasicOutlineCellModel *)&v15 initWithBackgroundModel:a5 contentModelBlock:v16];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recentsItem, a3);
    objc_storeStrong((id *)&v13->_accessoryModels, a4);
  }

  return v13;
}

- (unint64_t)hash
{
  return [(HistoryEntryRecentsItem *)self->_recentsItem hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TwoLinesHistoryEntryRecentsItemOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v13.receiver = self;
    v13.super_class = (Class)TwoLinesHistoryEntryRecentsItemOutlineCellModel;
    if ([(TwoLinesBasicOutlineCellModel *)&v13 isEqual:v6])
    {
      v7 = [(TwoLinesHistoryEntryRecentsItemOutlineCellModel *)v6 recentsItem];
      v8 = v7;
      if (v7 == self->_recentsItem || -[HistoryEntryRecentsItem isEqual:](v7, "isEqual:"))
      {
        id v9 = [(TwoLinesHistoryEntryRecentsItemOutlineCellModel *)v6 accessoryModels];
        id v10 = v9;
        if (v9 == self->_accessoryModels) {
          unsigned __int8 v11 = 1;
        }
        else {
          unsigned __int8 v11 = -[NSArray isEqual:](v9, "isEqual:");
        }
      }
      else
      {
        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)accessoryModels
{
  return self->_accessoryModels;
}

- (HistoryEntryRecentsItem)recentsItem
{
  return self->_recentsItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsItem, 0);

  objc_storeStrong((id *)&self->_accessoryModels, 0);
}

@end
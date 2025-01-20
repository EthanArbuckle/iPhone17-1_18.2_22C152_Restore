@interface NTKCFaceDetailComplicationCellProvider
- (NTKCFaceDetailComplicationCellProvider)initWithTableView:(id)a3 listProvider:(id)a4;
- (NTKComplicationPickerListProvider)listProvider;
- (UITableView)tableView;
- (id)cellForItem:(id)a3 atIndexPath:(id)a4;
- (void)setListProvider:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation NTKCFaceDetailComplicationCellProvider

- (NTKCFaceDetailComplicationCellProvider)initWithTableView:(id)a3 listProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKCFaceDetailComplicationCellProvider;
  v9 = [(NTKCFaceDetailComplicationCellProvider *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_listProvider, a4);
  }

  return v10;
}

- (id)cellForItem:(id)a3 atIndexPath:(id)a4
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(NTKCFaceDetailComplicationCellProvider *)self tableView];
  unint64_t v7 = objc_msgSend(v5, "ntk_itemType");
  if (v7 > 6) {
    id v8 = 0;
  }
  else {
    id v8 = off_1E62C7158[v7];
  }
  v9 = [v6 dequeueReusableCellWithIdentifier:v8];
  if (!v9) {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v8];
  }
  switch(objc_msgSend(v5, "ntk_itemType"))
  {
    case 0:
      v10 = [v9 textLabel];
      [v10 setText:&stru_1F1635E90];
      goto LABEL_17;
    case 1:
    case 2:
      v10 = [(NTKCFaceDetailComplicationCellProvider *)self listProvider];
      v11 = objc_msgSend(v5, "ntk_localizedNameWithOptions:forRichComplicationSlot:", 1, objc_msgSend(v10, "pickerListProviderSlotIsRich"));
      objc_super v12 = [v9 textLabel];
      [v12 setText:v11];

      goto LABEL_16;
    case 3:
      uint64_t v13 = NTKCompanionClockFaceLocalizedString(@"EDIT_MODE_LABEL_COMPLICATIONS_COMPANION_MORE", @"More…");
      goto LABEL_14;
    case 4:
      v14 = objc_msgSend(v5, "ntk_contactIdentifier");
      v15 = +[NTKPeopleComplicationContactsCache sharedCache];
      v16 = [v15 contactForId:v14];

      v17 = [v9 textLabel];
      v18 = [v17 font];

      v19 = +[NTKPeopleDetailComplicationPickerDataSource sharedFormatter];
      uint64_t v35 = *MEMORY[0x1E4FB06F8];
      v36[0] = v18;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
      v21 = [v19 attributedStringFromContact:v16 defaultAttributes:v20];

      if (![v21 length])
      {
        v22 = NTKClockFaceLocalizedString(@"COMPLICATION_PICKER_PEOPLE_NO_NAME", @"No Name");
        uint64_t v23 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v22];

        v21 = (void *)v23;
      }
      v24 = [v9 textLabel];
      [v24 setAttributedText:v21];

      [v9 setAccessoryType:0];
      break;
    case 5:
      uint64_t v13 = [v5 homeLocalizedName];
LABEL_14:
      v25 = (void *)v13;
      v26 = [v9 textLabel];
      [v26 setText:v25];

      v27 = v9;
      uint64_t v28 = 1;
      goto LABEL_18;
    case 6:
      v10 = [v5 localizedName];
      v11 = [v9 textLabel];
      [v11 setText:v10];
LABEL_16:

LABEL_17:
      v27 = v9;
      uint64_t v28 = 0;
LABEL_18:
      [v27 setAccessoryType:v28];
      break;
    default:
      break;
  }
  v29 = objc_msgSend(v5, "ntk_identifier");
  v30 = [(NTKCFaceDetailComplicationCellProvider *)self listProvider];
  v31 = [v30 pickerSelectedItem];
  v32 = objc_msgSend(v31, "ntk_identifier");
  uint64_t v33 = [v29 isEqualToString:v32];

  objc_msgSend(v9, "ntk_setPickerSelected:", v33);
  return v9;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NTKComplicationPickerListProvider)listProvider
{
  return self->_listProvider;
}

- (void)setListProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
@interface NTKFaceSlotComplicationDetailListProvider
- (BOOL)pickerListProviderSlotIsRich;
- (NSArray)complications;
- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot;
- (NTKComplicationItem)pickerSelectedItem;
- (NTKFaceSlotComplicationDetailListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6;
- (int64_t)pickerComplicationFamily;
- (void)_buildDataIfNeeded;
- (void)setComplications:(id)a3;
- (void)setPickerListDataSourceSnapshot:(id)a3;
@end

@implementation NTKFaceSlotComplicationDetailListProvider

- (NTKFaceSlotComplicationDetailListProvider)initWithRichSlot:(BOOL)a3 complicationFamily:(int64_t)a4 complications:(id)a5 selectedComplication:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)NTKFaceSlotComplicationDetailListProvider;
  v12 = [(NTKFaceSlotComplicationDetailListProvider *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    complications = v12->_complications;
    v12->_complications = (NSArray *)v13;

    objc_storeStrong((id *)&v12->_pickerSelectedItem, a6);
    v12->_pickerListProviderSlotIsRich = a3;
    v12->_pickerComplicationFamily = a4;
  }

  return v12;
}

- (NSDiffableDataSourceSnapshot)pickerListDataSourceSnapshot
{
  [(NTKFaceSlotComplicationDetailListProvider *)self _buildDataIfNeeded];
  pickerListDataSourceSnapshot = self->_pickerListDataSourceSnapshot;
  return pickerListDataSourceSnapshot;
}

- (void)_buildDataIfNeeded
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!self->_pickerListDataSourceSnapshot)
  {
    v3 = [[NTKFaceSlotComplicationDetailListProviderStringSectionInfo alloc] initWithGroupName:&stru_1F1635E90];
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    v7[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v4 appendSectionsWithIdentifiers:v5];

    v6 = [(NTKFaceSlotComplicationDetailListProvider *)self complications];
    [v4 appendItemsWithIdentifiers:v6 intoSectionWithIdentifier:v3];

    [(NTKFaceSlotComplicationDetailListProvider *)self setPickerListDataSourceSnapshot:v4];
  }
}

- (NTKComplicationItem)pickerSelectedItem
{
  return self->_pickerSelectedItem;
}

- (BOOL)pickerListProviderSlotIsRich
{
  return self->_pickerListProviderSlotIsRich;
}

- (int64_t)pickerComplicationFamily
{
  return self->_pickerComplicationFamily;
}

- (NSArray)complications
{
  return self->_complications;
}

- (void)setComplications:(id)a3
{
}

- (void)setPickerListDataSourceSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerListDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_complications, 0);
  objc_storeStrong((id *)&self->_pickerSelectedItem, 0);
}

@end
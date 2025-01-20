@interface MIUIRelationshipPickerDataSource
- (MIUIRelationshipPickerDataSource)initWithContact:(id)a3;
- (NSArray)relationships;
- (void)setRelationships:(id)a3;
@end

@implementation MIUIRelationshipPickerDataSource

- (MIUIRelationshipPickerDataSource)initWithContact:(id)a3
{
  v21[10] = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)MIUIRelationshipPickerDataSource;
  v3 = [(MIUIRelationshipPickerDataSource *)&v20 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    medicalIDBundle = v3->_medicalIDBundle;
    v3->_medicalIDBundle = (NSBundle *)v4;

    v6 = [MEMORY[0x263EFEAD0] builtinLabelsForProperty:*MEMORY[0x263EFE0F8]];
    v7 = (void *)[v6 mutableCopy];

    v19 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_roommate" value:&stru_2704A7C80 table:0];
    v21[0] = v19;
    v18 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_doctor" value:&stru_2704A7C80 table:0];
    v21[1] = v18;
    v17 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_emergency" value:&stru_2704A7C80 table:0];
    v21[2] = v17;
    v8 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_family_member" value:&stru_2704A7C80 table:0];
    v21[3] = v8;
    v9 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_teacher" value:&stru_2704A7C80 table:0];
    v21[4] = v9;
    v10 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_caretaker" value:&stru_2704A7C80 table:0];
    v21[5] = v10;
    v11 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_guardian" value:&stru_2704A7C80 table:0];
    v21[6] = v11;
    v12 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_social_worker" value:&stru_2704A7C80 table:0];
    v21[7] = v12;
    v13 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_school" value:&stru_2704A7C80 table:0];
    v21[8] = v13;
    v14 = [(NSBundle *)v3->_medicalIDBundle localizedStringForKey:@"relationship_daycare" value:&stru_2704A7C80 table:0];
    v21[9] = v14;
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:10];
    [v7 addObjectsFromArray:v15];

    [(MIUIRelationshipPickerDataSource *)v3 setRelationships:v7];
  }
  return v3;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void)setRelationships:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);
  objc_storeStrong((id *)&self->_medicalIDBundle, 0);
}

@end
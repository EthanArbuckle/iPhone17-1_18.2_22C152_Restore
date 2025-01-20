@interface PKAccountInvitationChooseMemberRow
- (BOOL)isEligible;
- (BOOL)isEqual:(id)a3;
- (PKAccountInvitationChooseMemberRow)initWithFamilyMember:(id)a3 photoImage:(id)a4 eligibility:(BOOL)a5;
- (PKFamilyMember)familyMember;
- (id)cellForTableView:(id)a3 atIndexPath:(id)a4;
- (unint64_t)hash;
- (void)_updateConfiguration:(id)a3;
@end

@implementation PKAccountInvitationChooseMemberRow

- (PKAccountInvitationChooseMemberRow)initWithFamilyMember:(id)a3 photoImage:(id)a4 eligibility:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKAccountInvitationChooseMemberRow;
  v11 = [(PKAccountInvitationChooseMemberRow *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_familyMember, a3);
    v12->_eligible = a5;
    objc_storeStrong((id *)&v12->_photoImage, a4);
    v13 = (NSPersonNameComponentsFormatter *)objc_alloc_init(MEMORY[0x1E4F28F38]);
    nameFormatter = v12->_nameFormatter;
    v12->_nameFormatter = v13;

    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    ageFormatter = v12->_ageFormatter;
    v12->_ageFormatter = v15;

    [(NSNumberFormatter *)v12->_ageFormatter setNumberStyle:1];
    [(NSNumberFormatter *)v12->_ageFormatter setDecimalSeparator:0];
    [(NSNumberFormatter *)v12->_ageFormatter setGroupingSeparator:0];
  }

  return v12;
}

- (id)cellForTableView:(id)a3 atIndexPath:(id)a4
{
  v5 = [a3 dequeueReusableCellWithIdentifier:@"FamilyMemberCellReuseIdentifier" forIndexPath:a4];
  v6 = [v5 defaultContentConfiguration];
  [(PKAccountInvitationChooseMemberRow *)self _updateConfiguration:v6];
  [v5 setContentConfiguration:v6];
  v7 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
  v8 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
  [v7 setBackgroundColor:v8];

  [v5 setBackgroundConfiguration:v7];
  if (self->_eligible) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }
  [v5 setSelectionStyle:v9];
  [v5 setAccessoryType:self->_eligible];
  [v5 setAccessibilityIdentifier:*MEMORY[0x1E4F85548]];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKAccountInvitationChooseMemberRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (PKEqualObjects()) {
      BOOL v7 = self->_eligible == v6[32];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_familyMember];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (void)_updateConfiguration:(id)a3
{
  id v27 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  v5 = [(PKFamilyMember *)self->_familyMember firstName];
  [v4 setGivenName:v5];

  v6 = [(PKFamilyMember *)self->_familyMember lastName];
  [v4 setFamilyName:v6];

  BOOL v7 = [(NSPersonNameComponentsFormatter *)self->_nameFormatter stringFromPersonNameComponents:v4];
  if ([v7 length])
  {
    [v27 setText:v7];
  }
  else
  {
    v8 = [(PKFamilyMember *)self->_familyMember inviteEmail];
    if (v8)
    {
      [v27 setText:v8];
    }
    else
    {
      uint64_t v9 = [(PKFamilyMember *)self->_familyMember appleID];
      [v27 setText:v9];
    }
  }
  id v10 = [v27 textProperties];
  v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 2, 0);
  [v10 setFont:v11];

  if (!self->_eligible)
  {
    v12 = [v27 textProperties];
    v13 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v12 setColor:v13];
  }
  uint64_t v14 = [(PKFamilyMember *)self->_familyMember memberType];
  uint64_t v15 = [(PKFamilyMember *)self->_familyMember status];
  switch(v15)
  {
    case 2:
      goto LABEL_32;
    case 1:
      v16 = @"FAMILY_MEMBER_PENDING";
      goto LABEL_21;
    case 0:
LABEL_32:
      if ([(PKFamilyMember *)self->_familyMember isOrganizer])
      {
        v16 = @"FAMILY_MEMBER_ORGANIZER";
LABEL_21:
        v21 = PKLocalizedMadisonString(&v16->isa);
        goto LABEL_26;
      }
      if ([(PKFamilyMember *)self->_familyMember isParent])
      {
        v16 = @"FAMILY_MEMBER_PARENT_GUARDIAN";
        goto LABEL_21;
      }
      if (!v14)
      {
        v16 = @"FAMILY_MEMBER_ADULT";
        goto LABEL_21;
      }
      uint64_t v17 = [(PKFamilyMember *)self->_familyMember age];
      if (v17)
      {
        ageFormatter = self->_ageFormatter;
        v19 = [NSNumber numberWithUnsignedInteger:v17];
        v20 = [(NSNumberFormatter *)ageFormatter stringFromNumber:v19];
        v21 = PKLocalizedMadisonString(&cfstr_FamilyMemberAg.isa, &stru_1EF1B4C70.isa, v20);

        goto LABEL_26;
      }
      if (v14 == 2)
      {
        v16 = @"FAMILY_MEMBER_CHILD";
        goto LABEL_21;
      }
      if (v14 == 1)
      {
        v16 = @"FAMILY_MEMBER_TEEN";
        goto LABEL_21;
      }
      break;
  }
  v21 = 0;
LABEL_26:
  [v27 setSecondaryText:v21];
  v22 = [v27 secondaryTextProperties];
  v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v22 setColor:v23];

  v24 = [v27 secondaryTextProperties];
  v25 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB2950], 0);
  [v24 setFont:v25];

  [v27 setImage:self->_photoImage];
  v26 = [v27 imageProperties];
  objc_msgSend(v26, "setMaximumSize:", 50.0, 50.0);
}

- (PKFamilyMember)familyMember
{
  return self->_familyMember;
}

- (BOOL)isEligible
{
  return self->_eligible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_ageFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);

  objc_storeStrong((id *)&self->_photoImage, 0);
}

@end
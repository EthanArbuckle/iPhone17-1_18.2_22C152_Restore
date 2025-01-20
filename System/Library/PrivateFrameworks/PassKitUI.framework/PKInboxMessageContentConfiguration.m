@interface PKInboxMessageContentConfiguration
+ (id)configurationWithInboxMessage:(id)a3;
@end

@implementation PKInboxMessageContentConfiguration

+ (id)configurationWithInboxMessage:(id)a3
{
  id v4 = a3;
  v5 = [a1 subtitleCellConfiguration];
  v6 = [v4 familyMember];
  v7 = [v4 accountUserInvitation];

  v8 = [v7 invitationDetails];

  v9 = (void *)MEMORY[0x1E4F845E8];
  v10 = [v8 originatorNameComponents];
  v11 = [v9 contactForFamilyMember:v6 nameComponents:v10 imageData:0];

  v12 = [v11 pkFullName];
  v13 = PKLocalizedMadisonString(&cfstr_InvitationFrom.isa, &stru_1EF1B4C70.isa, v12);

  v14 = PKUIImageNamed(@"Hero_Apply-CCS");
  [v5 setImage:v14];

  v15 = PKLocalizedMadisonString(&cfstr_InvitationTitl.isa);
  [v5 setText:v15];

  [v5 setSecondaryText:v13];
  v16 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28D8], 0);
  objc_msgSend(v5, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  v17 = [v5 imageProperties];
  objc_msgSend(v17, "setMaximumSize:", 1.79769313e308, 40.0);
  [v17 setCornerRadius:3.0];
  v18 = [v5 secondaryTextProperties];
  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v18 setColor:v19];

  [v18 setFont:v16];

  return v5;
}

@end
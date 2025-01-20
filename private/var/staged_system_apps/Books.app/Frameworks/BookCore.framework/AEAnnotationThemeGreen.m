@interface AEAnnotationThemeGreen
- (BOOL)isUnderline;
- (id)highlightColor;
- (id)noteBorderColor;
- (id)noteFillColor;
- (id)noteMarkerBorderColor;
- (id)noteMarkerFillColor;
- (id)noteTextColor;
- (id)notesSidebarBarColor;
- (int)annotationStyle;
@end

@implementation AEAnnotationThemeGreen

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_EB66C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_345D88 != -1) {
        dispatch_once(&qword_345D88, block);
      }
      v3 = &qword_345D90;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_EB6D4;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_345D98 != -1) {
        dispatch_once(&qword_345D98, v21);
      }
      v3 = &qword_345DA0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EB73C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_345DA8 != -1) {
        dispatch_once(&qword_345DA8, v20);
      }
      v3 = &qword_345DB0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EB7A4;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_345DB8 != -1) {
        dispatch_once(&qword_345DB8, v19);
      }
      v3 = &qword_345DC0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EB80C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_345DC8 != -1) {
        dispatch_once(&qword_345DC8, v18);
      }
      v3 = &qword_345DD0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EB874;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_345DD8 != -1) {
        dispatch_once(&qword_345DD8, v17);
      }
      v3 = &qword_345DE0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EB8DC;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_345DE8 != -1) {
        dispatch_once(&qword_345DE8, v16);
      }
      v3 = &qword_345DF0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EB944;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_345DF8 != -1) {
        dispatch_once(&qword_345DF8, v15);
      }
      v3 = &qword_345E00;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EB9AC;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_345E08 != -1) {
        dispatch_once(&qword_345E08, v14);
      }
      v3 = &qword_345E10;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EBA14;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_345E18 != -1) {
        dispatch_once(&qword_345E18, v13);
      }
      v3 = &qword_345E20;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EBA7C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_345E28 != -1) {
        dispatch_once(&qword_345E28, v12);
      }
      v3 = &qword_345E30;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EBAE4;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_345E38 != -1) {
        dispatch_once(&qword_345E38, v11);
      }
      v3 = &qword_345E40;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EBB4C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_345E48 != -1) {
        dispatch_once(&qword_345E48, v10);
      }
      v3 = &qword_345E50;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EBBB4;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_345E58 != -1) {
        dispatch_once(&qword_345E58, v9);
      }
      v3 = &qword_345E60;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EBC1C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_345E68 != -1) {
        dispatch_once(&qword_345E68, v8);
      }
      v3 = &qword_345E70;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EBC84;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_345E78 != -1) {
        dispatch_once(&qword_345E78, v7);
      }
      v3 = &qword_345E80;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EBCEC;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_345E88 != -1) {
        dispatch_once(&qword_345E88, v6);
      }
      v3 = &qword_345E90;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteBorderColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_EC650;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_345E98 != -1) {
        dispatch_once(&qword_345E98, block);
      }
      v3 = &qword_345EA0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_EC6B8;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_345EA8 != -1) {
        dispatch_once(&qword_345EA8, v21);
      }
      v3 = &qword_345EB0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EC720;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_345EB8 != -1) {
        dispatch_once(&qword_345EB8, v20);
      }
      v3 = &qword_345EC0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EC788;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_345EC8 != -1) {
        dispatch_once(&qword_345EC8, v19);
      }
      v3 = &qword_345ED0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EC7F0;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_345ED8 != -1) {
        dispatch_once(&qword_345ED8, v18);
      }
      v3 = &qword_345EE0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EC858;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_345EE8 != -1) {
        dispatch_once(&qword_345EE8, v17);
      }
      v3 = &qword_345EF0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EC8C0;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_345EF8 != -1) {
        dispatch_once(&qword_345EF8, v16);
      }
      v3 = &qword_345F00;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EC928;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_345F08 != -1) {
        dispatch_once(&qword_345F08, v15);
      }
      v3 = &qword_345F10;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EC990;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_345F18 != -1) {
        dispatch_once(&qword_345F18, v14);
      }
      v3 = &qword_345F20;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EC9F8;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_345F28 != -1) {
        dispatch_once(&qword_345F28, v13);
      }
      v3 = &qword_345F30;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_ECA60;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_345F38 != -1) {
        dispatch_once(&qword_345F38, v12);
      }
      v3 = &qword_345F40;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_ECAC8;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_345F48 != -1) {
        dispatch_once(&qword_345F48, v11);
      }
      v3 = &qword_345F50;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_ECB30;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_345F58 != -1) {
        dispatch_once(&qword_345F58, v10);
      }
      v3 = &qword_345F60;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_ECB98;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_345F68 != -1) {
        dispatch_once(&qword_345F68, v9);
      }
      v3 = &qword_345F70;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_ECC00;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_345F78 != -1) {
        dispatch_once(&qword_345F78, v8);
      }
      v3 = &qword_345F80;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_ECC68;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_345F88 != -1) {
        dispatch_once(&qword_345F88, v7);
      }
      v3 = &qword_345F90;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_ECCD0;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_345F98 != -1) {
        dispatch_once(&qword_345F98, v6);
      }
      v3 = &qword_345FA0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteTextColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_ED634;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_345FA8 != -1) {
        dispatch_once(&qword_345FA8, block);
      }
      v3 = &qword_345FB0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_ED69C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_345FB8 != -1) {
        dispatch_once(&qword_345FB8, v21);
      }
      v3 = &qword_345FC0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_ED704;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_345FC8 != -1) {
        dispatch_once(&qword_345FC8, v20);
      }
      v3 = &qword_345FD0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_ED76C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_345FD8 != -1) {
        dispatch_once(&qword_345FD8, v19);
      }
      v3 = &qword_345FE0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_ED7D4;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_345FE8 != -1) {
        dispatch_once(&qword_345FE8, v18);
      }
      v3 = &qword_345FF0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_ED83C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_345FF8 != -1) {
        dispatch_once(&qword_345FF8, v17);
      }
      v3 = &qword_346000;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_ED8A4;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346008 != -1) {
        dispatch_once(&qword_346008, v16);
      }
      v3 = &qword_346010;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_ED90C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346018 != -1) {
        dispatch_once(&qword_346018, v15);
      }
      v3 = &qword_346020;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_ED974;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346028 != -1) {
        dispatch_once(&qword_346028, v14);
      }
      v3 = &qword_346030;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_ED9DC;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346038 != -1) {
        dispatch_once(&qword_346038, v13);
      }
      v3 = &qword_346040;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EDA44;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346048 != -1) {
        dispatch_once(&qword_346048, v12);
      }
      v3 = &qword_346050;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EDAAC;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346058 != -1) {
        dispatch_once(&qword_346058, v11);
      }
      v3 = &qword_346060;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EDB14;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346068 != -1) {
        dispatch_once(&qword_346068, v10);
      }
      v3 = &qword_346070;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EDB7C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346078 != -1) {
        dispatch_once(&qword_346078, v9);
      }
      v3 = &qword_346080;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EDBE4;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346088 != -1) {
        dispatch_once(&qword_346088, v8);
      }
      v3 = &qword_346090;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EDC4C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346098 != -1) {
        dispatch_once(&qword_346098, v7);
      }
      v3 = &qword_3460A0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EDCB4;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3460A8 != -1) {
        dispatch_once(&qword_3460A8, v6);
      }
      v3 = &qword_3460B0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)highlightColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_EE618;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3460B8 != -1) {
        dispatch_once(&qword_3460B8, block);
      }
      v3 = &qword_3460C0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_EE680;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3460C8 != -1) {
        dispatch_once(&qword_3460C8, v21);
      }
      v3 = &qword_3460D0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EE6E8;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3460D8 != -1) {
        dispatch_once(&qword_3460D8, v20);
      }
      v3 = &qword_3460E0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EE750;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_3460E8 != -1) {
        dispatch_once(&qword_3460E8, v19);
      }
      v3 = &qword_3460F0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EE7B8;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_3460F8 != -1) {
        dispatch_once(&qword_3460F8, v18);
      }
      v3 = &qword_346100;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EE820;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346108 != -1) {
        dispatch_once(&qword_346108, v17);
      }
      v3 = &qword_346110;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EE888;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346118 != -1) {
        dispatch_once(&qword_346118, v16);
      }
      v3 = &qword_346120;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EE8F0;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346128 != -1) {
        dispatch_once(&qword_346128, v15);
      }
      v3 = &qword_346130;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EE958;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346138 != -1) {
        dispatch_once(&qword_346138, v14);
      }
      v3 = &qword_346140;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EE9C0;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346148 != -1) {
        dispatch_once(&qword_346148, v13);
      }
      v3 = &qword_346150;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EEA28;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346158 != -1) {
        dispatch_once(&qword_346158, v12);
      }
      v3 = &qword_346160;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EEA90;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346168 != -1) {
        dispatch_once(&qword_346168, v11);
      }
      v3 = &qword_346170;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EEAF8;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346178 != -1) {
        dispatch_once(&qword_346178, v10);
      }
      v3 = &qword_346180;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EEB60;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346188 != -1) {
        dispatch_once(&qword_346188, v9);
      }
      v3 = &qword_346190;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EEBC8;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346198 != -1) {
        dispatch_once(&qword_346198, v8);
      }
      v3 = &qword_3461A0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EEC30;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3461A8 != -1) {
        dispatch_once(&qword_3461A8, v7);
      }
      v3 = &qword_3461B0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EEC98;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3461B8 != -1) {
        dispatch_once(&qword_3461B8, v6);
      }
      v3 = &qword_3461C0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteMarkerFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_EF5FC;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3461C8 != -1) {
        dispatch_once(&qword_3461C8, block);
      }
      v3 = &qword_3461D0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_EF664;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3461D8 != -1) {
        dispatch_once(&qword_3461D8, v21);
      }
      v3 = &qword_3461E0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_EF6CC;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3461E8 != -1) {
        dispatch_once(&qword_3461E8, v20);
      }
      v3 = &qword_3461F0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_EF734;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_3461F8 != -1) {
        dispatch_once(&qword_3461F8, v19);
      }
      v3 = &qword_346200;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_EF79C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346208 != -1) {
        dispatch_once(&qword_346208, v18);
      }
      v3 = &qword_346210;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_EF804;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346218 != -1) {
        dispatch_once(&qword_346218, v17);
      }
      v3 = &qword_346220;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_EF86C;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346228 != -1) {
        dispatch_once(&qword_346228, v16);
      }
      v3 = &qword_346230;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_EF8D4;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346238 != -1) {
        dispatch_once(&qword_346238, v15);
      }
      v3 = &qword_346240;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_EF93C;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346248 != -1) {
        dispatch_once(&qword_346248, v14);
      }
      v3 = &qword_346250;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_EF9A4;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346258 != -1) {
        dispatch_once(&qword_346258, v13);
      }
      v3 = &qword_346260;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_EFA0C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346268 != -1) {
        dispatch_once(&qword_346268, v12);
      }
      v3 = &qword_346270;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_EFA74;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346278 != -1) {
        dispatch_once(&qword_346278, v11);
      }
      v3 = &qword_346280;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_EFADC;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346288 != -1) {
        dispatch_once(&qword_346288, v10);
      }
      v3 = &qword_346290;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_EFB44;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346298 != -1) {
        dispatch_once(&qword_346298, v9);
      }
      v3 = &qword_3462A0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_EFBAC;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3462A8 != -1) {
        dispatch_once(&qword_3462A8, v8);
      }
      v3 = &qword_3462B0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_EFC14;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3462B8 != -1) {
        dispatch_once(&qword_3462B8, v7);
      }
      v3 = &qword_3462C0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_EFC7C;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3462C8 != -1) {
        dispatch_once(&qword_3462C8, v6);
      }
      v3 = &qword_3462D0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)noteMarkerBorderColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F05E0;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3462D8 != -1) {
        dispatch_once(&qword_3462D8, block);
      }
      v3 = &qword_3462E0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F0648;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3462E8 != -1) {
        dispatch_once(&qword_3462E8, v21);
      }
      v3 = &qword_3462F0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F06B0;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3462F8 != -1) {
        dispatch_once(&qword_3462F8, v20);
      }
      v3 = &qword_346300;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F0718;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346308 != -1) {
        dispatch_once(&qword_346308, v19);
      }
      v3 = &qword_346310;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F0780;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346318 != -1) {
        dispatch_once(&qword_346318, v18);
      }
      v3 = &qword_346320;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F07E8;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346328 != -1) {
        dispatch_once(&qword_346328, v17);
      }
      v3 = &qword_346330;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F0850;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346338 != -1) {
        dispatch_once(&qword_346338, v16);
      }
      v3 = &qword_346340;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F08B8;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346348 != -1) {
        dispatch_once(&qword_346348, v15);
      }
      v3 = &qword_346350;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F0920;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346358 != -1) {
        dispatch_once(&qword_346358, v14);
      }
      v3 = &qword_346360;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F0988;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346368 != -1) {
        dispatch_once(&qword_346368, v13);
      }
      v3 = &qword_346370;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F09F0;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346378 != -1) {
        dispatch_once(&qword_346378, v12);
      }
      v3 = &qword_346380;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F0A58;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346388 != -1) {
        dispatch_once(&qword_346388, v11);
      }
      v3 = &qword_346390;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F0AC0;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346398 != -1) {
        dispatch_once(&qword_346398, v10);
      }
      v3 = &qword_3463A0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F0B28;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3463A8 != -1) {
        dispatch_once(&qword_3463A8, v9);
      }
      v3 = &qword_3463B0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F0B90;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3463B8 != -1) {
        dispatch_once(&qword_3463B8, v8);
      }
      v3 = &qword_3463C0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F0BF8;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3463C8 != -1) {
        dispatch_once(&qword_3463C8, v7);
      }
      v3 = &qword_3463D0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F0C60;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3463D8 != -1) {
        dispatch_once(&qword_3463D8, v6);
      }
      v3 = &qword_3463E0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)notesSidebarBarColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F15C4;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3463E8 != -1) {
        dispatch_once(&qword_3463E8, block);
      }
      v3 = &qword_3463F0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F162C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3463F8 != -1) {
        dispatch_once(&qword_3463F8, v21);
      }
      v3 = &qword_346400;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F1694;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346408 != -1) {
        dispatch_once(&qword_346408, v20);
      }
      v3 = &qword_346410;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F16FC;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346418 != -1) {
        dispatch_once(&qword_346418, v19);
      }
      v3 = &qword_346420;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F1764;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346428 != -1) {
        dispatch_once(&qword_346428, v18);
      }
      v3 = &qword_346430;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F17CC;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346438 != -1) {
        dispatch_once(&qword_346438, v17);
      }
      v3 = &qword_346440;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F1834;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346448 != -1) {
        dispatch_once(&qword_346448, v16);
      }
      v3 = &qword_346450;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F189C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346458 != -1) {
        dispatch_once(&qword_346458, v15);
      }
      v3 = &qword_346460;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F1904;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346468 != -1) {
        dispatch_once(&qword_346468, v14);
      }
      v3 = &qword_346470;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F196C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346478 != -1) {
        dispatch_once(&qword_346478, v13);
      }
      v3 = &qword_346480;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F19D4;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346488 != -1) {
        dispatch_once(&qword_346488, v12);
      }
      v3 = &qword_346490;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F1A3C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346498 != -1) {
        dispatch_once(&qword_346498, v11);
      }
      v3 = &qword_3464A0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F1AA4;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3464A8 != -1) {
        dispatch_once(&qword_3464A8, v10);
      }
      v3 = &qword_3464B0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F1B0C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3464B8 != -1) {
        dispatch_once(&qword_3464B8, v9);
      }
      v3 = &qword_3464C0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F1B74;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3464C8 != -1) {
        dispatch_once(&qword_3464C8, v8);
      }
      v3 = &qword_3464D0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F1BDC;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3464D8 != -1) {
        dispatch_once(&qword_3464D8, v7);
      }
      v3 = &qword_3464E0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F1C44;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3464E8 != -1) {
        dispatch_once(&qword_3464E8, v6);
      }
      v3 = &qword_3464F0;
LABEL_54:
      id v4 = (id)*v3;
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (BOOL)isUnderline
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F1D3C;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_3464F8 != -1) {
    dispatch_once(&qword_3464F8, block);
  }
  return byte_346500;
}

- (int)annotationStyle
{
  return 1;
}

@end
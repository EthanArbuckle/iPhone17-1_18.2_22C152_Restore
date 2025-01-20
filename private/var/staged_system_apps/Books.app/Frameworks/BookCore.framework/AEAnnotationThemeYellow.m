@interface AEAnnotationThemeYellow
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

@implementation AEAnnotationThemeYellow

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F96F4;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346C88 != -1) {
        dispatch_once(&qword_346C88, block);
      }
      v3 = &qword_346C90;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F975C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346C98 != -1) {
        dispatch_once(&qword_346C98, v21);
      }
      v3 = &qword_346CA0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F97C4;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346CA8 != -1) {
        dispatch_once(&qword_346CA8, v20);
      }
      v3 = &qword_346CB0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F982C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346CB8 != -1) {
        dispatch_once(&qword_346CB8, v19);
      }
      v3 = &qword_346CC0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F9894;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346CC8 != -1) {
        dispatch_once(&qword_346CC8, v18);
      }
      v3 = &qword_346CD0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F98FC;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346CD8 != -1) {
        dispatch_once(&qword_346CD8, v17);
      }
      v3 = &qword_346CE0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F9964;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346CE8 != -1) {
        dispatch_once(&qword_346CE8, v16);
      }
      v3 = &qword_346CF0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F99CC;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346CF8 != -1) {
        dispatch_once(&qword_346CF8, v15);
      }
      v3 = &qword_346D00;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F9A34;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346D08 != -1) {
        dispatch_once(&qword_346D08, v14);
      }
      v3 = &qword_346D10;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F9A9C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346D18 != -1) {
        dispatch_once(&qword_346D18, v13);
      }
      v3 = &qword_346D20;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F9B04;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346D28 != -1) {
        dispatch_once(&qword_346D28, v12);
      }
      v3 = &qword_346D30;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F9B6C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346D38 != -1) {
        dispatch_once(&qword_346D38, v11);
      }
      v3 = &qword_346D40;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F9BD4;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346D48 != -1) {
        dispatch_once(&qword_346D48, v10);
      }
      v3 = &qword_346D50;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F9C3C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346D58 != -1) {
        dispatch_once(&qword_346D58, v9);
      }
      v3 = &qword_346D60;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F9CA4;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346D68 != -1) {
        dispatch_once(&qword_346D68, v8);
      }
      v3 = &qword_346D70;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F9D0C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346D78 != -1) {
        dispatch_once(&qword_346D78, v7);
      }
      v3 = &qword_346D80;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F9D74;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346D88 != -1) {
        dispatch_once(&qword_346D88, v6);
      }
      v3 = &qword_346D90;
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
      block[2] = sub_FA6D8;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346D98 != -1) {
        dispatch_once(&qword_346D98, block);
      }
      v3 = &qword_346DA0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FA740;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346DA8 != -1) {
        dispatch_once(&qword_346DA8, v21);
      }
      v3 = &qword_346DB0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FA7A8;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346DB8 != -1) {
        dispatch_once(&qword_346DB8, v20);
      }
      v3 = &qword_346DC0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FA810;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346DC8 != -1) {
        dispatch_once(&qword_346DC8, v19);
      }
      v3 = &qword_346DD0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FA878;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346DD8 != -1) {
        dispatch_once(&qword_346DD8, v18);
      }
      v3 = &qword_346DE0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FA8E0;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346DE8 != -1) {
        dispatch_once(&qword_346DE8, v17);
      }
      v3 = &qword_346DF0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FA948;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346DF8 != -1) {
        dispatch_once(&qword_346DF8, v16);
      }
      v3 = &qword_346E00;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FA9B0;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346E08 != -1) {
        dispatch_once(&qword_346E08, v15);
      }
      v3 = &qword_346E10;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FAA18;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346E18 != -1) {
        dispatch_once(&qword_346E18, v14);
      }
      v3 = &qword_346E20;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FAA80;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346E28 != -1) {
        dispatch_once(&qword_346E28, v13);
      }
      v3 = &qword_346E30;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FAAE8;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346E38 != -1) {
        dispatch_once(&qword_346E38, v12);
      }
      v3 = &qword_346E40;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FAB50;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346E48 != -1) {
        dispatch_once(&qword_346E48, v11);
      }
      v3 = &qword_346E50;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FABB8;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346E58 != -1) {
        dispatch_once(&qword_346E58, v10);
      }
      v3 = &qword_346E60;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FAC20;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346E68 != -1) {
        dispatch_once(&qword_346E68, v9);
      }
      v3 = &qword_346E70;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FAC88;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346E78 != -1) {
        dispatch_once(&qword_346E78, v8);
      }
      v3 = &qword_346E80;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FACF0;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346E88 != -1) {
        dispatch_once(&qword_346E88, v7);
      }
      v3 = &qword_346E90;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FAD58;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346E98 != -1) {
        dispatch_once(&qword_346E98, v6);
      }
      v3 = &qword_346EA0;
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
      block[2] = sub_FB6BC;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346EA8 != -1) {
        dispatch_once(&qword_346EA8, block);
      }
      v3 = &qword_346EB0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FB724;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346EB8 != -1) {
        dispatch_once(&qword_346EB8, v21);
      }
      v3 = &qword_346EC0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FB78C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346EC8 != -1) {
        dispatch_once(&qword_346EC8, v20);
      }
      v3 = &qword_346ED0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FB7F4;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346ED8 != -1) {
        dispatch_once(&qword_346ED8, v19);
      }
      v3 = &qword_346EE0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FB85C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346EE8 != -1) {
        dispatch_once(&qword_346EE8, v18);
      }
      v3 = &qword_346EF0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FB8C4;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346EF8 != -1) {
        dispatch_once(&qword_346EF8, v17);
      }
      v3 = &qword_346F00;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FB92C;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346F08 != -1) {
        dispatch_once(&qword_346F08, v16);
      }
      v3 = &qword_346F10;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FB994;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346F18 != -1) {
        dispatch_once(&qword_346F18, v15);
      }
      v3 = &qword_346F20;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FB9FC;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346F28 != -1) {
        dispatch_once(&qword_346F28, v14);
      }
      v3 = &qword_346F30;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FBA64;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346F38 != -1) {
        dispatch_once(&qword_346F38, v13);
      }
      v3 = &qword_346F40;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FBACC;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346F48 != -1) {
        dispatch_once(&qword_346F48, v12);
      }
      v3 = &qword_346F50;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FBB34;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346F58 != -1) {
        dispatch_once(&qword_346F58, v11);
      }
      v3 = &qword_346F60;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FBB9C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346F68 != -1) {
        dispatch_once(&qword_346F68, v10);
      }
      v3 = &qword_346F70;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FBC04;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346F78 != -1) {
        dispatch_once(&qword_346F78, v9);
      }
      v3 = &qword_346F80;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FBC6C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346F88 != -1) {
        dispatch_once(&qword_346F88, v8);
      }
      v3 = &qword_346F90;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FBCD4;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346F98 != -1) {
        dispatch_once(&qword_346F98, v7);
      }
      v3 = &qword_346FA0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FBD3C;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346FA8 != -1) {
        dispatch_once(&qword_346FA8, v6);
      }
      v3 = &qword_346FB0;
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
      block[2] = sub_FC6A0;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346FB8 != -1) {
        dispatch_once(&qword_346FB8, block);
      }
      v3 = &qword_346FC0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FC708;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346FC8 != -1) {
        dispatch_once(&qword_346FC8, v21);
      }
      v3 = &qword_346FD0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FC770;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346FD8 != -1) {
        dispatch_once(&qword_346FD8, v20);
      }
      v3 = &qword_346FE0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FC7D8;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346FE8 != -1) {
        dispatch_once(&qword_346FE8, v19);
      }
      v3 = &qword_346FF0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FC840;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346FF8 != -1) {
        dispatch_once(&qword_346FF8, v18);
      }
      v3 = &qword_347000;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FC8A8;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347008 != -1) {
        dispatch_once(&qword_347008, v17);
      }
      v3 = &qword_347010;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FC910;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347018 != -1) {
        dispatch_once(&qword_347018, v16);
      }
      v3 = &qword_347020;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FC978;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347028 != -1) {
        dispatch_once(&qword_347028, v15);
      }
      v3 = &qword_347030;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FC9E0;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347038 != -1) {
        dispatch_once(&qword_347038, v14);
      }
      v3 = &qword_347040;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FCA48;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347048 != -1) {
        dispatch_once(&qword_347048, v13);
      }
      v3 = &qword_347050;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FCAB0;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347058 != -1) {
        dispatch_once(&qword_347058, v12);
      }
      v3 = &qword_347060;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FCB18;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347068 != -1) {
        dispatch_once(&qword_347068, v11);
      }
      v3 = &qword_347070;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FCB80;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347078 != -1) {
        dispatch_once(&qword_347078, v10);
      }
      v3 = &qword_347080;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FCBE8;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347088 != -1) {
        dispatch_once(&qword_347088, v9);
      }
      v3 = &qword_347090;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FCC50;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347098 != -1) {
        dispatch_once(&qword_347098, v8);
      }
      v3 = &qword_3470A0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FCCB8;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3470A8 != -1) {
        dispatch_once(&qword_3470A8, v7);
      }
      v3 = &qword_3470B0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FCD20;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3470B8 != -1) {
        dispatch_once(&qword_3470B8, v6);
      }
      v3 = &qword_3470C0;
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
      block[2] = sub_FD684;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3470C8 != -1) {
        dispatch_once(&qword_3470C8, block);
      }
      v3 = &qword_3470D0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FD6EC;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3470D8 != -1) {
        dispatch_once(&qword_3470D8, v21);
      }
      v3 = &qword_3470E0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FD754;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3470E8 != -1) {
        dispatch_once(&qword_3470E8, v20);
      }
      v3 = &qword_3470F0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FD7BC;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_3470F8 != -1) {
        dispatch_once(&qword_3470F8, v19);
      }
      v3 = &qword_347100;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FD824;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347108 != -1) {
        dispatch_once(&qword_347108, v18);
      }
      v3 = &qword_347110;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FD88C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347118 != -1) {
        dispatch_once(&qword_347118, v17);
      }
      v3 = &qword_347120;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FD8F4;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347128 != -1) {
        dispatch_once(&qword_347128, v16);
      }
      v3 = &qword_347130;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FD95C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347138 != -1) {
        dispatch_once(&qword_347138, v15);
      }
      v3 = &qword_347140;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FD9C4;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347148 != -1) {
        dispatch_once(&qword_347148, v14);
      }
      v3 = &qword_347150;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FDA2C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347158 != -1) {
        dispatch_once(&qword_347158, v13);
      }
      v3 = &qword_347160;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FDA94;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347168 != -1) {
        dispatch_once(&qword_347168, v12);
      }
      v3 = &qword_347170;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FDAFC;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347178 != -1) {
        dispatch_once(&qword_347178, v11);
      }
      v3 = &qword_347180;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FDB64;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347188 != -1) {
        dispatch_once(&qword_347188, v10);
      }
      v3 = &qword_347190;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FDBCC;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347198 != -1) {
        dispatch_once(&qword_347198, v9);
      }
      v3 = &qword_3471A0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FDC34;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3471A8 != -1) {
        dispatch_once(&qword_3471A8, v8);
      }
      v3 = &qword_3471B0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FDC9C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3471B8 != -1) {
        dispatch_once(&qword_3471B8, v7);
      }
      v3 = &qword_3471C0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FDD04;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3471C8 != -1) {
        dispatch_once(&qword_3471C8, v6);
      }
      v3 = &qword_3471D0;
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
      block[2] = sub_FE668;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3471D8 != -1) {
        dispatch_once(&qword_3471D8, block);
      }
      v3 = &qword_3471E0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FE6D0;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3471E8 != -1) {
        dispatch_once(&qword_3471E8, v21);
      }
      v3 = &qword_3471F0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FE738;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3471F8 != -1) {
        dispatch_once(&qword_3471F8, v20);
      }
      v3 = &qword_347200;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FE7A0;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347208 != -1) {
        dispatch_once(&qword_347208, v19);
      }
      v3 = &qword_347210;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FE808;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347218 != -1) {
        dispatch_once(&qword_347218, v18);
      }
      v3 = &qword_347220;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FE870;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347228 != -1) {
        dispatch_once(&qword_347228, v17);
      }
      v3 = &qword_347230;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FE8D8;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347238 != -1) {
        dispatch_once(&qword_347238, v16);
      }
      v3 = &qword_347240;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FE940;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347248 != -1) {
        dispatch_once(&qword_347248, v15);
      }
      v3 = &qword_347250;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FE9A8;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347258 != -1) {
        dispatch_once(&qword_347258, v14);
      }
      v3 = &qword_347260;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FEA10;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347268 != -1) {
        dispatch_once(&qword_347268, v13);
      }
      v3 = &qword_347270;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FEA78;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347278 != -1) {
        dispatch_once(&qword_347278, v12);
      }
      v3 = &qword_347280;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FEAE0;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347288 != -1) {
        dispatch_once(&qword_347288, v11);
      }
      v3 = &qword_347290;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FEB48;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347298 != -1) {
        dispatch_once(&qword_347298, v10);
      }
      v3 = &qword_3472A0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FEBB0;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3472A8 != -1) {
        dispatch_once(&qword_3472A8, v9);
      }
      v3 = &qword_3472B0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FEC18;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3472B8 != -1) {
        dispatch_once(&qword_3472B8, v8);
      }
      v3 = &qword_3472C0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FEC80;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3472C8 != -1) {
        dispatch_once(&qword_3472C8, v7);
      }
      v3 = &qword_3472D0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FECE8;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3472D8 != -1) {
        dispatch_once(&qword_3472D8, v6);
      }
      v3 = &qword_3472E0;
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
      block[2] = sub_FF64C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3472E8 != -1) {
        dispatch_once(&qword_3472E8, block);
      }
      v3 = &qword_3472F0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_FF6B4;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3472F8 != -1) {
        dispatch_once(&qword_3472F8, v21);
      }
      v3 = &qword_347300;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_FF71C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347308 != -1) {
        dispatch_once(&qword_347308, v20);
      }
      v3 = &qword_347310;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_FF784;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347318 != -1) {
        dispatch_once(&qword_347318, v19);
      }
      v3 = &qword_347320;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_FF7EC;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347328 != -1) {
        dispatch_once(&qword_347328, v18);
      }
      v3 = &qword_347330;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_FF854;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347338 != -1) {
        dispatch_once(&qword_347338, v17);
      }
      v3 = &qword_347340;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_FF8BC;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347348 != -1) {
        dispatch_once(&qword_347348, v16);
      }
      v3 = &qword_347350;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_FF924;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347358 != -1) {
        dispatch_once(&qword_347358, v15);
      }
      v3 = &qword_347360;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_FF98C;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347368 != -1) {
        dispatch_once(&qword_347368, v14);
      }
      v3 = &qword_347370;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_FF9F4;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347378 != -1) {
        dispatch_once(&qword_347378, v13);
      }
      v3 = &qword_347380;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_FFA5C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347388 != -1) {
        dispatch_once(&qword_347388, v12);
      }
      v3 = &qword_347390;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_FFAC4;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347398 != -1) {
        dispatch_once(&qword_347398, v11);
      }
      v3 = &qword_3473A0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_FFB2C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3473A8 != -1) {
        dispatch_once(&qword_3473A8, v10);
      }
      v3 = &qword_3473B0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_FFB94;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3473B8 != -1) {
        dispatch_once(&qword_3473B8, v9);
      }
      v3 = &qword_3473C0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FFBFC;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3473C8 != -1) {
        dispatch_once(&qword_3473C8, v8);
      }
      v3 = &qword_3473D0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_FFC64;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3473D8 != -1) {
        dispatch_once(&qword_3473D8, v7);
      }
      v3 = &qword_3473E0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_FFCCC;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3473E8 != -1) {
        dispatch_once(&qword_3473E8, v6);
      }
      v3 = &qword_3473F0;
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
  block[2] = sub_FFDC4;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_3473F8 != -1) {
    dispatch_once(&qword_3473F8, block);
  }
  return byte_347400;
}

- (int)annotationStyle
{
  return 3;
}

@end
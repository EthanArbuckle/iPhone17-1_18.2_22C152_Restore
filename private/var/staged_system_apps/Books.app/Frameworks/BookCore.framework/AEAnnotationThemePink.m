@interface AEAnnotationThemePink
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

@implementation AEAnnotationThemePink

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10777C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347B88 != -1) {
        dispatch_once(&qword_347B88, block);
      }
      v3 = &qword_347B90;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1077E4;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347B98 != -1) {
        dispatch_once(&qword_347B98, v21);
      }
      v3 = &qword_347BA0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10784C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347BA8 != -1) {
        dispatch_once(&qword_347BA8, v20);
      }
      v3 = &qword_347BB0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1078B4;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347BB8 != -1) {
        dispatch_once(&qword_347BB8, v19);
      }
      v3 = &qword_347BC0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10791C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347BC8 != -1) {
        dispatch_once(&qword_347BC8, v18);
      }
      v3 = &qword_347BD0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_107984;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347BD8 != -1) {
        dispatch_once(&qword_347BD8, v17);
      }
      v3 = &qword_347BE0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1079EC;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347BE8 != -1) {
        dispatch_once(&qword_347BE8, v16);
      }
      v3 = &qword_347BF0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_107A54;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347BF8 != -1) {
        dispatch_once(&qword_347BF8, v15);
      }
      v3 = &qword_347C00;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_107ABC;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347C08 != -1) {
        dispatch_once(&qword_347C08, v14);
      }
      v3 = &qword_347C10;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_107B24;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347C18 != -1) {
        dispatch_once(&qword_347C18, v13);
      }
      v3 = &qword_347C20;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_107B8C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347C28 != -1) {
        dispatch_once(&qword_347C28, v12);
      }
      v3 = &qword_347C30;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_107BF4;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347C38 != -1) {
        dispatch_once(&qword_347C38, v11);
      }
      v3 = &qword_347C40;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_107C5C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347C48 != -1) {
        dispatch_once(&qword_347C48, v10);
      }
      v3 = &qword_347C50;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_107CC4;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347C58 != -1) {
        dispatch_once(&qword_347C58, v9);
      }
      v3 = &qword_347C60;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_107D2C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347C68 != -1) {
        dispatch_once(&qword_347C68, v8);
      }
      v3 = &qword_347C70;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_107D94;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347C78 != -1) {
        dispatch_once(&qword_347C78, v7);
      }
      v3 = &qword_347C80;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_107DFC;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347C88 != -1) {
        dispatch_once(&qword_347C88, v6);
      }
      v3 = &qword_347C90;
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
      block[2] = sub_108760;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347C98 != -1) {
        dispatch_once(&qword_347C98, block);
      }
      v3 = &qword_347CA0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1087C8;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347CA8 != -1) {
        dispatch_once(&qword_347CA8, v21);
      }
      v3 = &qword_347CB0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_108830;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347CB8 != -1) {
        dispatch_once(&qword_347CB8, v20);
      }
      v3 = &qword_347CC0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_108898;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347CC8 != -1) {
        dispatch_once(&qword_347CC8, v19);
      }
      v3 = &qword_347CD0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_108900;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347CD8 != -1) {
        dispatch_once(&qword_347CD8, v18);
      }
      v3 = &qword_347CE0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_108968;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347CE8 != -1) {
        dispatch_once(&qword_347CE8, v17);
      }
      v3 = &qword_347CF0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1089D0;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347CF8 != -1) {
        dispatch_once(&qword_347CF8, v16);
      }
      v3 = &qword_347D00;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_108A38;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347D08 != -1) {
        dispatch_once(&qword_347D08, v15);
      }
      v3 = &qword_347D10;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_108AA0;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347D18 != -1) {
        dispatch_once(&qword_347D18, v14);
      }
      v3 = &qword_347D20;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_108B08;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347D28 != -1) {
        dispatch_once(&qword_347D28, v13);
      }
      v3 = &qword_347D30;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_108B70;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347D38 != -1) {
        dispatch_once(&qword_347D38, v12);
      }
      v3 = &qword_347D40;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_108BD8;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347D48 != -1) {
        dispatch_once(&qword_347D48, v11);
      }
      v3 = &qword_347D50;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_108C40;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347D58 != -1) {
        dispatch_once(&qword_347D58, v10);
      }
      v3 = &qword_347D60;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_108CA8;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347D68 != -1) {
        dispatch_once(&qword_347D68, v9);
      }
      v3 = &qword_347D70;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_108D10;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347D78 != -1) {
        dispatch_once(&qword_347D78, v8);
      }
      v3 = &qword_347D80;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_108D78;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347D88 != -1) {
        dispatch_once(&qword_347D88, v7);
      }
      v3 = &qword_347D90;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_108DE0;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347D98 != -1) {
        dispatch_once(&qword_347D98, v6);
      }
      v3 = &qword_347DA0;
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
      block[2] = sub_109744;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347DA8 != -1) {
        dispatch_once(&qword_347DA8, block);
      }
      v3 = &qword_347DB0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1097AC;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347DB8 != -1) {
        dispatch_once(&qword_347DB8, v21);
      }
      v3 = &qword_347DC0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_109814;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347DC8 != -1) {
        dispatch_once(&qword_347DC8, v20);
      }
      v3 = &qword_347DD0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10987C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347DD8 != -1) {
        dispatch_once(&qword_347DD8, v19);
      }
      v3 = &qword_347DE0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1098E4;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347DE8 != -1) {
        dispatch_once(&qword_347DE8, v18);
      }
      v3 = &qword_347DF0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10994C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347DF8 != -1) {
        dispatch_once(&qword_347DF8, v17);
      }
      v3 = &qword_347E00;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1099B4;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347E08 != -1) {
        dispatch_once(&qword_347E08, v16);
      }
      v3 = &qword_347E10;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_109A1C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347E18 != -1) {
        dispatch_once(&qword_347E18, v15);
      }
      v3 = &qword_347E20;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_109A84;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347E28 != -1) {
        dispatch_once(&qword_347E28, v14);
      }
      v3 = &qword_347E30;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_109AEC;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347E38 != -1) {
        dispatch_once(&qword_347E38, v13);
      }
      v3 = &qword_347E40;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_109B54;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347E48 != -1) {
        dispatch_once(&qword_347E48, v12);
      }
      v3 = &qword_347E50;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_109BBC;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347E58 != -1) {
        dispatch_once(&qword_347E58, v11);
      }
      v3 = &qword_347E60;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_109C24;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347E68 != -1) {
        dispatch_once(&qword_347E68, v10);
      }
      v3 = &qword_347E70;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_109C8C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347E78 != -1) {
        dispatch_once(&qword_347E78, v9);
      }
      v3 = &qword_347E80;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_109CF4;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347E88 != -1) {
        dispatch_once(&qword_347E88, v8);
      }
      v3 = &qword_347E90;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_109D5C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347E98 != -1) {
        dispatch_once(&qword_347E98, v7);
      }
      v3 = &qword_347EA0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_109DC4;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347EA8 != -1) {
        dispatch_once(&qword_347EA8, v6);
      }
      v3 = &qword_347EB0;
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
      block[2] = sub_10A728;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347EB8 != -1) {
        dispatch_once(&qword_347EB8, block);
      }
      v3 = &qword_347EC0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10A790;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347EC8 != -1) {
        dispatch_once(&qword_347EC8, v21);
      }
      v3 = &qword_347ED0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10A7F8;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347ED8 != -1) {
        dispatch_once(&qword_347ED8, v20);
      }
      v3 = &qword_347EE0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10A860;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347EE8 != -1) {
        dispatch_once(&qword_347EE8, v19);
      }
      v3 = &qword_347EF0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10A8C8;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347EF8 != -1) {
        dispatch_once(&qword_347EF8, v18);
      }
      v3 = &qword_347F00;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10A930;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347F08 != -1) {
        dispatch_once(&qword_347F08, v17);
      }
      v3 = &qword_347F10;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10A998;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347F18 != -1) {
        dispatch_once(&qword_347F18, v16);
      }
      v3 = &qword_347F20;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10AA00;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347F28 != -1) {
        dispatch_once(&qword_347F28, v15);
      }
      v3 = &qword_347F30;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10AA68;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347F38 != -1) {
        dispatch_once(&qword_347F38, v14);
      }
      v3 = &qword_347F40;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10AAD0;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347F48 != -1) {
        dispatch_once(&qword_347F48, v13);
      }
      v3 = &qword_347F50;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10AB38;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347F58 != -1) {
        dispatch_once(&qword_347F58, v12);
      }
      v3 = &qword_347F60;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10ABA0;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347F68 != -1) {
        dispatch_once(&qword_347F68, v11);
      }
      v3 = &qword_347F70;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10AC08;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347F78 != -1) {
        dispatch_once(&qword_347F78, v10);
      }
      v3 = &qword_347F80;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10AC70;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347F88 != -1) {
        dispatch_once(&qword_347F88, v9);
      }
      v3 = &qword_347F90;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10ACD8;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347F98 != -1) {
        dispatch_once(&qword_347F98, v8);
      }
      v3 = &qword_347FA0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10AD40;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347FA8 != -1) {
        dispatch_once(&qword_347FA8, v7);
      }
      v3 = &qword_347FB0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10ADA8;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347FB8 != -1) {
        dispatch_once(&qword_347FB8, v6);
      }
      v3 = &qword_347FC0;
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
      block[2] = sub_10B70C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347FC8 != -1) {
        dispatch_once(&qword_347FC8, block);
      }
      v3 = &qword_347FD0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10B774;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347FD8 != -1) {
        dispatch_once(&qword_347FD8, v21);
      }
      v3 = &qword_347FE0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10B7DC;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347FE8 != -1) {
        dispatch_once(&qword_347FE8, v20);
      }
      v3 = &qword_347FF0;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10B844;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347FF8 != -1) {
        dispatch_once(&qword_347FF8, v19);
      }
      v3 = &qword_348000;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10B8AC;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348008 != -1) {
        dispatch_once(&qword_348008, v18);
      }
      v3 = &qword_348010;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10B914;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348018 != -1) {
        dispatch_once(&qword_348018, v17);
      }
      v3 = &qword_348020;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10B97C;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348028 != -1) {
        dispatch_once(&qword_348028, v16);
      }
      v3 = &qword_348030;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10B9E4;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348038 != -1) {
        dispatch_once(&qword_348038, v15);
      }
      v3 = &qword_348040;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10BA4C;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_348048 != -1) {
        dispatch_once(&qword_348048, v14);
      }
      v3 = &qword_348050;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10BAB4;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_348058 != -1) {
        dispatch_once(&qword_348058, v13);
      }
      v3 = &qword_348060;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10BB1C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_348068 != -1) {
        dispatch_once(&qword_348068, v12);
      }
      v3 = &qword_348070;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10BB84;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_348078 != -1) {
        dispatch_once(&qword_348078, v11);
      }
      v3 = &qword_348080;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10BBEC;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_348088 != -1) {
        dispatch_once(&qword_348088, v10);
      }
      v3 = &qword_348090;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10BC54;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_348098 != -1) {
        dispatch_once(&qword_348098, v9);
      }
      v3 = &qword_3480A0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10BCBC;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3480A8 != -1) {
        dispatch_once(&qword_3480A8, v8);
      }
      v3 = &qword_3480B0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10BD24;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3480B8 != -1) {
        dispatch_once(&qword_3480B8, v7);
      }
      v3 = &qword_3480C0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10BD8C;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3480C8 != -1) {
        dispatch_once(&qword_3480C8, v6);
      }
      v3 = &qword_3480D0;
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
      block[2] = sub_10C6F0;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3480D8 != -1) {
        dispatch_once(&qword_3480D8, block);
      }
      v3 = &qword_3480E0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10C758;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3480E8 != -1) {
        dispatch_once(&qword_3480E8, v21);
      }
      v3 = &qword_3480F0;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10C7C0;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_3480F8 != -1) {
        dispatch_once(&qword_3480F8, v20);
      }
      v3 = &qword_348100;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10C828;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348108 != -1) {
        dispatch_once(&qword_348108, v19);
      }
      v3 = &qword_348110;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10C890;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348118 != -1) {
        dispatch_once(&qword_348118, v18);
      }
      v3 = &qword_348120;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10C8F8;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348128 != -1) {
        dispatch_once(&qword_348128, v17);
      }
      v3 = &qword_348130;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10C960;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348138 != -1) {
        dispatch_once(&qword_348138, v16);
      }
      v3 = &qword_348140;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10C9C8;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348148 != -1) {
        dispatch_once(&qword_348148, v15);
      }
      v3 = &qword_348150;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10CA30;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_348158 != -1) {
        dispatch_once(&qword_348158, v14);
      }
      v3 = &qword_348160;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10CA98;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_348168 != -1) {
        dispatch_once(&qword_348168, v13);
      }
      v3 = &qword_348170;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10CB00;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_348178 != -1) {
        dispatch_once(&qword_348178, v12);
      }
      v3 = &qword_348180;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10CB68;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_348188 != -1) {
        dispatch_once(&qword_348188, v11);
      }
      v3 = &qword_348190;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10CBD0;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_348198 != -1) {
        dispatch_once(&qword_348198, v10);
      }
      v3 = &qword_3481A0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10CC38;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3481A8 != -1) {
        dispatch_once(&qword_3481A8, v9);
      }
      v3 = &qword_3481B0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10CCA0;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3481B8 != -1) {
        dispatch_once(&qword_3481B8, v8);
      }
      v3 = &qword_3481C0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10CD08;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3481C8 != -1) {
        dispatch_once(&qword_3481C8, v7);
      }
      v3 = &qword_3481D0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10CD70;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3481D8 != -1) {
        dispatch_once(&qword_3481D8, v6);
      }
      v3 = &qword_3481E0;
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
      block[2] = sub_10D6D4;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_3481E8 != -1) {
        dispatch_once(&qword_3481E8, block);
      }
      v3 = &qword_3481F0;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10D73C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_3481F8 != -1) {
        dispatch_once(&qword_3481F8, v21);
      }
      v3 = &qword_348200;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10D7A4;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348208 != -1) {
        dispatch_once(&qword_348208, v20);
      }
      v3 = &qword_348210;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10D80C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348218 != -1) {
        dispatch_once(&qword_348218, v19);
      }
      v3 = &qword_348220;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10D874;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348228 != -1) {
        dispatch_once(&qword_348228, v18);
      }
      v3 = &qword_348230;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10D8DC;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348238 != -1) {
        dispatch_once(&qword_348238, v17);
      }
      v3 = &qword_348240;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10D944;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348248 != -1) {
        dispatch_once(&qword_348248, v16);
      }
      v3 = &qword_348250;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10D9AC;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348258 != -1) {
        dispatch_once(&qword_348258, v15);
      }
      v3 = &qword_348260;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10DA14;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_348268 != -1) {
        dispatch_once(&qword_348268, v14);
      }
      v3 = &qword_348270;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10DA7C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_348278 != -1) {
        dispatch_once(&qword_348278, v13);
      }
      v3 = &qword_348280;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10DAE4;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_348288 != -1) {
        dispatch_once(&qword_348288, v12);
      }
      v3 = &qword_348290;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10DB4C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_348298 != -1) {
        dispatch_once(&qword_348298, v11);
      }
      v3 = &qword_3482A0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10DBB4;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3482A8 != -1) {
        dispatch_once(&qword_3482A8, v10);
      }
      v3 = &qword_3482B0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10DC1C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3482B8 != -1) {
        dispatch_once(&qword_3482B8, v9);
      }
      v3 = &qword_3482C0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10DC84;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3482C8 != -1) {
        dispatch_once(&qword_3482C8, v8);
      }
      v3 = &qword_3482D0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10DCEC;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3482D8 != -1) {
        dispatch_once(&qword_3482D8, v7);
      }
      v3 = &qword_3482E0;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10DD54;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_3482E8 != -1) {
        dispatch_once(&qword_3482E8, v6);
      }
      v3 = &qword_3482F0;
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
  block[2] = sub_10DE4C;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_3482F8 != -1) {
    dispatch_once(&qword_3482F8, block);
  }
  return byte_348300;
}

- (int)annotationStyle
{
  return 4;
}

@end
@interface AEAnnotationThemeBlue
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

@implementation AEAnnotationThemeBlue

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_F26B0;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346508 != -1) {
        dispatch_once(&qword_346508, block);
      }
      v3 = &qword_346510;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F2718;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346518 != -1) {
        dispatch_once(&qword_346518, v21);
      }
      v3 = &qword_346520;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F2780;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346528 != -1) {
        dispatch_once(&qword_346528, v20);
      }
      v3 = &qword_346530;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F27E8;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346538 != -1) {
        dispatch_once(&qword_346538, v19);
      }
      v3 = &qword_346540;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F2850;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346548 != -1) {
        dispatch_once(&qword_346548, v18);
      }
      v3 = &qword_346550;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F28B8;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346558 != -1) {
        dispatch_once(&qword_346558, v17);
      }
      v3 = &qword_346560;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F2920;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346568 != -1) {
        dispatch_once(&qword_346568, v16);
      }
      v3 = &qword_346570;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F2988;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346578 != -1) {
        dispatch_once(&qword_346578, v15);
      }
      v3 = &qword_346580;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F29F0;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346588 != -1) {
        dispatch_once(&qword_346588, v14);
      }
      v3 = &qword_346590;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F2A58;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346598 != -1) {
        dispatch_once(&qword_346598, v13);
      }
      v3 = &qword_3465A0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F2AC0;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3465A8 != -1) {
        dispatch_once(&qword_3465A8, v12);
      }
      v3 = &qword_3465B0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F2B28;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3465B8 != -1) {
        dispatch_once(&qword_3465B8, v11);
      }
      v3 = &qword_3465C0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F2B90;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3465C8 != -1) {
        dispatch_once(&qword_3465C8, v10);
      }
      v3 = &qword_3465D0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F2BF8;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3465D8 != -1) {
        dispatch_once(&qword_3465D8, v9);
      }
      v3 = &qword_3465E0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F2C60;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3465E8 != -1) {
        dispatch_once(&qword_3465E8, v8);
      }
      v3 = &qword_3465F0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F2CC8;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3465F8 != -1) {
        dispatch_once(&qword_3465F8, v7);
      }
      v3 = &qword_346600;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F2D30;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346608 != -1) {
        dispatch_once(&qword_346608, v6);
      }
      v3 = &qword_346610;
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
      block[2] = sub_F3694;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346618 != -1) {
        dispatch_once(&qword_346618, block);
      }
      v3 = &qword_346620;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F36FC;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346628 != -1) {
        dispatch_once(&qword_346628, v21);
      }
      v3 = &qword_346630;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F3764;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346638 != -1) {
        dispatch_once(&qword_346638, v20);
      }
      v3 = &qword_346640;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F37CC;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346648 != -1) {
        dispatch_once(&qword_346648, v19);
      }
      v3 = &qword_346650;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F3834;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346658 != -1) {
        dispatch_once(&qword_346658, v18);
      }
      v3 = &qword_346660;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F389C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346668 != -1) {
        dispatch_once(&qword_346668, v17);
      }
      v3 = &qword_346670;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F3904;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346678 != -1) {
        dispatch_once(&qword_346678, v16);
      }
      v3 = &qword_346680;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F396C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346688 != -1) {
        dispatch_once(&qword_346688, v15);
      }
      v3 = &qword_346690;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F39D4;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346698 != -1) {
        dispatch_once(&qword_346698, v14);
      }
      v3 = &qword_3466A0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F3A3C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3466A8 != -1) {
        dispatch_once(&qword_3466A8, v13);
      }
      v3 = &qword_3466B0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F3AA4;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3466B8 != -1) {
        dispatch_once(&qword_3466B8, v12);
      }
      v3 = &qword_3466C0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F3B0C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3466C8 != -1) {
        dispatch_once(&qword_3466C8, v11);
      }
      v3 = &qword_3466D0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F3B74;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3466D8 != -1) {
        dispatch_once(&qword_3466D8, v10);
      }
      v3 = &qword_3466E0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F3BDC;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3466E8 != -1) {
        dispatch_once(&qword_3466E8, v9);
      }
      v3 = &qword_3466F0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F3C44;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3466F8 != -1) {
        dispatch_once(&qword_3466F8, v8);
      }
      v3 = &qword_346700;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F3CAC;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346708 != -1) {
        dispatch_once(&qword_346708, v7);
      }
      v3 = &qword_346710;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F3D14;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346718 != -1) {
        dispatch_once(&qword_346718, v6);
      }
      v3 = &qword_346720;
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
      block[2] = sub_F4678;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346728 != -1) {
        dispatch_once(&qword_346728, block);
      }
      v3 = &qword_346730;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F46E0;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346738 != -1) {
        dispatch_once(&qword_346738, v21);
      }
      v3 = &qword_346740;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F4748;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346748 != -1) {
        dispatch_once(&qword_346748, v20);
      }
      v3 = &qword_346750;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F47B0;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346758 != -1) {
        dispatch_once(&qword_346758, v19);
      }
      v3 = &qword_346760;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F4818;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346768 != -1) {
        dispatch_once(&qword_346768, v18);
      }
      v3 = &qword_346770;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F4880;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346778 != -1) {
        dispatch_once(&qword_346778, v17);
      }
      v3 = &qword_346780;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F48E8;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346788 != -1) {
        dispatch_once(&qword_346788, v16);
      }
      v3 = &qword_346790;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F4950;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346798 != -1) {
        dispatch_once(&qword_346798, v15);
      }
      v3 = &qword_3467A0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F49B8;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3467A8 != -1) {
        dispatch_once(&qword_3467A8, v14);
      }
      v3 = &qword_3467B0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F4A20;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3467B8 != -1) {
        dispatch_once(&qword_3467B8, v13);
      }
      v3 = &qword_3467C0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F4A88;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3467C8 != -1) {
        dispatch_once(&qword_3467C8, v12);
      }
      v3 = &qword_3467D0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F4AF0;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3467D8 != -1) {
        dispatch_once(&qword_3467D8, v11);
      }
      v3 = &qword_3467E0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F4B58;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3467E8 != -1) {
        dispatch_once(&qword_3467E8, v10);
      }
      v3 = &qword_3467F0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F4BC0;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3467F8 != -1) {
        dispatch_once(&qword_3467F8, v9);
      }
      v3 = &qword_346800;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F4C28;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346808 != -1) {
        dispatch_once(&qword_346808, v8);
      }
      v3 = &qword_346810;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F4C90;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346818 != -1) {
        dispatch_once(&qword_346818, v7);
      }
      v3 = &qword_346820;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F4CF8;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346828 != -1) {
        dispatch_once(&qword_346828, v6);
      }
      v3 = &qword_346830;
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
      block[2] = sub_F565C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346838 != -1) {
        dispatch_once(&qword_346838, block);
      }
      v3 = &qword_346840;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F56C4;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346848 != -1) {
        dispatch_once(&qword_346848, v21);
      }
      v3 = &qword_346850;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F572C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346858 != -1) {
        dispatch_once(&qword_346858, v20);
      }
      v3 = &qword_346860;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F5794;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346868 != -1) {
        dispatch_once(&qword_346868, v19);
      }
      v3 = &qword_346870;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F57FC;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346878 != -1) {
        dispatch_once(&qword_346878, v18);
      }
      v3 = &qword_346880;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F5864;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346888 != -1) {
        dispatch_once(&qword_346888, v17);
      }
      v3 = &qword_346890;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F58CC;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346898 != -1) {
        dispatch_once(&qword_346898, v16);
      }
      v3 = &qword_3468A0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F5934;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3468A8 != -1) {
        dispatch_once(&qword_3468A8, v15);
      }
      v3 = &qword_3468B0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F599C;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3468B8 != -1) {
        dispatch_once(&qword_3468B8, v14);
      }
      v3 = &qword_3468C0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F5A04;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3468C8 != -1) {
        dispatch_once(&qword_3468C8, v13);
      }
      v3 = &qword_3468D0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F5A6C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3468D8 != -1) {
        dispatch_once(&qword_3468D8, v12);
      }
      v3 = &qword_3468E0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F5AD4;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3468E8 != -1) {
        dispatch_once(&qword_3468E8, v11);
      }
      v3 = &qword_3468F0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F5B3C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3468F8 != -1) {
        dispatch_once(&qword_3468F8, v10);
      }
      v3 = &qword_346900;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F5BA4;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346908 != -1) {
        dispatch_once(&qword_346908, v9);
      }
      v3 = &qword_346910;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F5C0C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346918 != -1) {
        dispatch_once(&qword_346918, v8);
      }
      v3 = &qword_346920;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F5C74;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346928 != -1) {
        dispatch_once(&qword_346928, v7);
      }
      v3 = &qword_346930;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F5CDC;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346938 != -1) {
        dispatch_once(&qword_346938, v6);
      }
      v3 = &qword_346940;
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
      block[2] = sub_F6640;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346948 != -1) {
        dispatch_once(&qword_346948, block);
      }
      v3 = &qword_346950;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F66A8;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346958 != -1) {
        dispatch_once(&qword_346958, v21);
      }
      v3 = &qword_346960;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F6710;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346968 != -1) {
        dispatch_once(&qword_346968, v20);
      }
      v3 = &qword_346970;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F6778;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346978 != -1) {
        dispatch_once(&qword_346978, v19);
      }
      v3 = &qword_346980;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F67E0;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346988 != -1) {
        dispatch_once(&qword_346988, v18);
      }
      v3 = &qword_346990;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F6848;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346998 != -1) {
        dispatch_once(&qword_346998, v17);
      }
      v3 = &qword_3469A0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F68B0;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3469A8 != -1) {
        dispatch_once(&qword_3469A8, v16);
      }
      v3 = &qword_3469B0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F6918;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3469B8 != -1) {
        dispatch_once(&qword_3469B8, v15);
      }
      v3 = &qword_3469C0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F6980;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3469C8 != -1) {
        dispatch_once(&qword_3469C8, v14);
      }
      v3 = &qword_3469D0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F69E8;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3469D8 != -1) {
        dispatch_once(&qword_3469D8, v13);
      }
      v3 = &qword_3469E0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F6A50;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3469E8 != -1) {
        dispatch_once(&qword_3469E8, v12);
      }
      v3 = &qword_3469F0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F6AB8;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3469F8 != -1) {
        dispatch_once(&qword_3469F8, v11);
      }
      v3 = &qword_346A00;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F6B20;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346A08 != -1) {
        dispatch_once(&qword_346A08, v10);
      }
      v3 = &qword_346A10;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F6B88;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346A18 != -1) {
        dispatch_once(&qword_346A18, v9);
      }
      v3 = &qword_346A20;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F6BF0;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346A28 != -1) {
        dispatch_once(&qword_346A28, v8);
      }
      v3 = &qword_346A30;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F6C58;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346A38 != -1) {
        dispatch_once(&qword_346A38, v7);
      }
      v3 = &qword_346A40;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F6CC0;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346A48 != -1) {
        dispatch_once(&qword_346A48, v6);
      }
      v3 = &qword_346A50;
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
      block[2] = sub_F7624;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346A58 != -1) {
        dispatch_once(&qword_346A58, block);
      }
      v3 = &qword_346A60;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F768C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346A68 != -1) {
        dispatch_once(&qword_346A68, v21);
      }
      v3 = &qword_346A70;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F76F4;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346A78 != -1) {
        dispatch_once(&qword_346A78, v20);
      }
      v3 = &qword_346A80;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F775C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346A88 != -1) {
        dispatch_once(&qword_346A88, v19);
      }
      v3 = &qword_346A90;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F77C4;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346A98 != -1) {
        dispatch_once(&qword_346A98, v18);
      }
      v3 = &qword_346AA0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F782C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346AA8 != -1) {
        dispatch_once(&qword_346AA8, v17);
      }
      v3 = &qword_346AB0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F7894;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346AB8 != -1) {
        dispatch_once(&qword_346AB8, v16);
      }
      v3 = &qword_346AC0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F78FC;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346AC8 != -1) {
        dispatch_once(&qword_346AC8, v15);
      }
      v3 = &qword_346AD0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F7964;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346AD8 != -1) {
        dispatch_once(&qword_346AD8, v14);
      }
      v3 = &qword_346AE0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F79CC;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346AE8 != -1) {
        dispatch_once(&qword_346AE8, v13);
      }
      v3 = &qword_346AF0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F7A34;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346AF8 != -1) {
        dispatch_once(&qword_346AF8, v12);
      }
      v3 = &qword_346B00;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F7A9C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346B08 != -1) {
        dispatch_once(&qword_346B08, v11);
      }
      v3 = &qword_346B10;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F7B04;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346B18 != -1) {
        dispatch_once(&qword_346B18, v10);
      }
      v3 = &qword_346B20;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F7B6C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346B28 != -1) {
        dispatch_once(&qword_346B28, v9);
      }
      v3 = &qword_346B30;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F7BD4;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346B38 != -1) {
        dispatch_once(&qword_346B38, v8);
      }
      v3 = &qword_346B40;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F7C3C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346B48 != -1) {
        dispatch_once(&qword_346B48, v7);
      }
      v3 = &qword_346B50;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F7CA4;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346B58 != -1) {
        dispatch_once(&qword_346B58, v6);
      }
      v3 = &qword_346B60;
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
      block[2] = sub_F8608;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_346B68 != -1) {
        dispatch_once(&qword_346B68, block);
      }
      v3 = &qword_346B70;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_F8670;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_346B78 != -1) {
        dispatch_once(&qword_346B78, v21);
      }
      v3 = &qword_346B80;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_F86D8;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_346B88 != -1) {
        dispatch_once(&qword_346B88, v20);
      }
      v3 = &qword_346B90;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_F8740;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_346B98 != -1) {
        dispatch_once(&qword_346B98, v19);
      }
      v3 = &qword_346BA0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_F87A8;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_346BA8 != -1) {
        dispatch_once(&qword_346BA8, v18);
      }
      v3 = &qword_346BB0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_F8810;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_346BB8 != -1) {
        dispatch_once(&qword_346BB8, v17);
      }
      v3 = &qword_346BC0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_F8878;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_346BC8 != -1) {
        dispatch_once(&qword_346BC8, v16);
      }
      v3 = &qword_346BD0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_F88E0;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_346BD8 != -1) {
        dispatch_once(&qword_346BD8, v15);
      }
      v3 = &qword_346BE0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_F8948;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_346BE8 != -1) {
        dispatch_once(&qword_346BE8, v14);
      }
      v3 = &qword_346BF0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_F89B0;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_346BF8 != -1) {
        dispatch_once(&qword_346BF8, v13);
      }
      v3 = &qword_346C00;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_F8A18;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_346C08 != -1) {
        dispatch_once(&qword_346C08, v12);
      }
      v3 = &qword_346C10;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_F8A80;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_346C18 != -1) {
        dispatch_once(&qword_346C18, v11);
      }
      v3 = &qword_346C20;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_F8AE8;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_346C28 != -1) {
        dispatch_once(&qword_346C28, v10);
      }
      v3 = &qword_346C30;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_F8B50;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_346C38 != -1) {
        dispatch_once(&qword_346C38, v9);
      }
      v3 = &qword_346C40;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_F8BB8;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_346C48 != -1) {
        dispatch_once(&qword_346C48, v8);
      }
      v3 = &qword_346C50;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_F8C20;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_346C58 != -1) {
        dispatch_once(&qword_346C58, v7);
      }
      v3 = &qword_346C60;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_F8C88;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_346C68 != -1) {
        dispatch_once(&qword_346C68, v6);
      }
      v3 = &qword_346C70;
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
  block[2] = sub_F8D80;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_346C78 != -1) {
    dispatch_once(&qword_346C78, block);
  }
  return byte_346C80;
}

- (int)annotationStyle
{
  return 2;
}

@end
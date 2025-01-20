@interface AEAnnotationThemePurple
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

@implementation AEAnnotationThemePurple

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100738;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347408 != -1) {
        dispatch_once(&qword_347408, block);
      }
      v3 = &qword_347410;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1007A0;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347418 != -1) {
        dispatch_once(&qword_347418, v21);
      }
      v3 = &qword_347420;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100808;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347428 != -1) {
        dispatch_once(&qword_347428, v20);
      }
      v3 = &qword_347430;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100870;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347438 != -1) {
        dispatch_once(&qword_347438, v19);
      }
      v3 = &qword_347440;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1008D8;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347448 != -1) {
        dispatch_once(&qword_347448, v18);
      }
      v3 = &qword_347450;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100940;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347458 != -1) {
        dispatch_once(&qword_347458, v17);
      }
      v3 = &qword_347460;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1009A8;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347468 != -1) {
        dispatch_once(&qword_347468, v16);
      }
      v3 = &qword_347470;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100A10;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347478 != -1) {
        dispatch_once(&qword_347478, v15);
      }
      v3 = &qword_347480;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100A78;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347488 != -1) {
        dispatch_once(&qword_347488, v14);
      }
      v3 = &qword_347490;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100AE0;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347498 != -1) {
        dispatch_once(&qword_347498, v13);
      }
      v3 = &qword_3474A0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100B48;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3474A8 != -1) {
        dispatch_once(&qword_3474A8, v12);
      }
      v3 = &qword_3474B0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100BB0;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3474B8 != -1) {
        dispatch_once(&qword_3474B8, v11);
      }
      v3 = &qword_3474C0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100C18;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3474C8 != -1) {
        dispatch_once(&qword_3474C8, v10);
      }
      v3 = &qword_3474D0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100C80;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3474D8 != -1) {
        dispatch_once(&qword_3474D8, v9);
      }
      v3 = &qword_3474E0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100CE8;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3474E8 != -1) {
        dispatch_once(&qword_3474E8, v8);
      }
      v3 = &qword_3474F0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100D50;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3474F8 != -1) {
        dispatch_once(&qword_3474F8, v7);
      }
      v3 = &qword_347500;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100DB8;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347508 != -1) {
        dispatch_once(&qword_347508, v6);
      }
      v3 = &qword_347510;
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
      block[2] = sub_10171C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347518 != -1) {
        dispatch_once(&qword_347518, block);
      }
      v3 = &qword_347520;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_101784;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347528 != -1) {
        dispatch_once(&qword_347528, v21);
      }
      v3 = &qword_347530;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1017EC;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347538 != -1) {
        dispatch_once(&qword_347538, v20);
      }
      v3 = &qword_347540;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_101854;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347548 != -1) {
        dispatch_once(&qword_347548, v19);
      }
      v3 = &qword_347550;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1018BC;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347558 != -1) {
        dispatch_once(&qword_347558, v18);
      }
      v3 = &qword_347560;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_101924;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347568 != -1) {
        dispatch_once(&qword_347568, v17);
      }
      v3 = &qword_347570;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10198C;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347578 != -1) {
        dispatch_once(&qword_347578, v16);
      }
      v3 = &qword_347580;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1019F4;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347588 != -1) {
        dispatch_once(&qword_347588, v15);
      }
      v3 = &qword_347590;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_101A5C;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347598 != -1) {
        dispatch_once(&qword_347598, v14);
      }
      v3 = &qword_3475A0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_101AC4;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3475A8 != -1) {
        dispatch_once(&qword_3475A8, v13);
      }
      v3 = &qword_3475B0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_101B2C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3475B8 != -1) {
        dispatch_once(&qword_3475B8, v12);
      }
      v3 = &qword_3475C0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_101B94;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3475C8 != -1) {
        dispatch_once(&qword_3475C8, v11);
      }
      v3 = &qword_3475D0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_101BFC;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3475D8 != -1) {
        dispatch_once(&qword_3475D8, v10);
      }
      v3 = &qword_3475E0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_101C64;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3475E8 != -1) {
        dispatch_once(&qword_3475E8, v9);
      }
      v3 = &qword_3475F0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_101CCC;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3475F8 != -1) {
        dispatch_once(&qword_3475F8, v8);
      }
      v3 = &qword_347600;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_101D34;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347608 != -1) {
        dispatch_once(&qword_347608, v7);
      }
      v3 = &qword_347610;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_101D9C;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347618 != -1) {
        dispatch_once(&qword_347618, v6);
      }
      v3 = &qword_347620;
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
      block[2] = sub_102700;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347628 != -1) {
        dispatch_once(&qword_347628, block);
      }
      v3 = &qword_347630;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_102768;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347638 != -1) {
        dispatch_once(&qword_347638, v21);
      }
      v3 = &qword_347640;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1027D0;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347648 != -1) {
        dispatch_once(&qword_347648, v20);
      }
      v3 = &qword_347650;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_102838;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347658 != -1) {
        dispatch_once(&qword_347658, v19);
      }
      v3 = &qword_347660;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1028A0;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347668 != -1) {
        dispatch_once(&qword_347668, v18);
      }
      v3 = &qword_347670;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_102908;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347678 != -1) {
        dispatch_once(&qword_347678, v17);
      }
      v3 = &qword_347680;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_102970;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347688 != -1) {
        dispatch_once(&qword_347688, v16);
      }
      v3 = &qword_347690;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1029D8;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347698 != -1) {
        dispatch_once(&qword_347698, v15);
      }
      v3 = &qword_3476A0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_102A40;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3476A8 != -1) {
        dispatch_once(&qword_3476A8, v14);
      }
      v3 = &qword_3476B0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_102AA8;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3476B8 != -1) {
        dispatch_once(&qword_3476B8, v13);
      }
      v3 = &qword_3476C0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_102B10;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3476C8 != -1) {
        dispatch_once(&qword_3476C8, v12);
      }
      v3 = &qword_3476D0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_102B78;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3476D8 != -1) {
        dispatch_once(&qword_3476D8, v11);
      }
      v3 = &qword_3476E0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_102BE0;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3476E8 != -1) {
        dispatch_once(&qword_3476E8, v10);
      }
      v3 = &qword_3476F0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_102C48;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3476F8 != -1) {
        dispatch_once(&qword_3476F8, v9);
      }
      v3 = &qword_347700;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_102CB0;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347708 != -1) {
        dispatch_once(&qword_347708, v8);
      }
      v3 = &qword_347710;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_102D18;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347718 != -1) {
        dispatch_once(&qword_347718, v7);
      }
      v3 = &qword_347720;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_102D80;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347728 != -1) {
        dispatch_once(&qword_347728, v6);
      }
      v3 = &qword_347730;
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
      block[2] = sub_1036E4;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347738 != -1) {
        dispatch_once(&qword_347738, block);
      }
      v3 = &qword_347740;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10374C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347748 != -1) {
        dispatch_once(&qword_347748, v21);
      }
      v3 = &qword_347750;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1037B4;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347758 != -1) {
        dispatch_once(&qword_347758, v20);
      }
      v3 = &qword_347760;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10381C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347768 != -1) {
        dispatch_once(&qword_347768, v19);
      }
      v3 = &qword_347770;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_103884;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347778 != -1) {
        dispatch_once(&qword_347778, v18);
      }
      v3 = &qword_347780;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1038EC;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347788 != -1) {
        dispatch_once(&qword_347788, v17);
      }
      v3 = &qword_347790;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_103954;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347798 != -1) {
        dispatch_once(&qword_347798, v16);
      }
      v3 = &qword_3477A0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1039BC;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3477A8 != -1) {
        dispatch_once(&qword_3477A8, v15);
      }
      v3 = &qword_3477B0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_103A24;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3477B8 != -1) {
        dispatch_once(&qword_3477B8, v14);
      }
      v3 = &qword_3477C0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_103A8C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3477C8 != -1) {
        dispatch_once(&qword_3477C8, v13);
      }
      v3 = &qword_3477D0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_103AF4;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3477D8 != -1) {
        dispatch_once(&qword_3477D8, v12);
      }
      v3 = &qword_3477E0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_103B5C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3477E8 != -1) {
        dispatch_once(&qword_3477E8, v11);
      }
      v3 = &qword_3477F0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_103BC4;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3477F8 != -1) {
        dispatch_once(&qword_3477F8, v10);
      }
      v3 = &qword_347800;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_103C2C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347808 != -1) {
        dispatch_once(&qword_347808, v9);
      }
      v3 = &qword_347810;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_103C94;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347818 != -1) {
        dispatch_once(&qword_347818, v8);
      }
      v3 = &qword_347820;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_103CFC;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347828 != -1) {
        dispatch_once(&qword_347828, v7);
      }
      v3 = &qword_347830;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_103D64;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347838 != -1) {
        dispatch_once(&qword_347838, v6);
      }
      v3 = &qword_347840;
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
      block[2] = sub_1046C8;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347848 != -1) {
        dispatch_once(&qword_347848, block);
      }
      v3 = &qword_347850;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_104730;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347858 != -1) {
        dispatch_once(&qword_347858, v21);
      }
      v3 = &qword_347860;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_104798;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347868 != -1) {
        dispatch_once(&qword_347868, v20);
      }
      v3 = &qword_347870;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_104800;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347878 != -1) {
        dispatch_once(&qword_347878, v19);
      }
      v3 = &qword_347880;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_104868;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347888 != -1) {
        dispatch_once(&qword_347888, v18);
      }
      v3 = &qword_347890;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1048D0;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347898 != -1) {
        dispatch_once(&qword_347898, v17);
      }
      v3 = &qword_3478A0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_104938;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3478A8 != -1) {
        dispatch_once(&qword_3478A8, v16);
      }
      v3 = &qword_3478B0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1049A0;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3478B8 != -1) {
        dispatch_once(&qword_3478B8, v15);
      }
      v3 = &qword_3478C0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_104A08;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3478C8 != -1) {
        dispatch_once(&qword_3478C8, v14);
      }
      v3 = &qword_3478D0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_104A70;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3478D8 != -1) {
        dispatch_once(&qword_3478D8, v13);
      }
      v3 = &qword_3478E0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_104AD8;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3478E8 != -1) {
        dispatch_once(&qword_3478E8, v12);
      }
      v3 = &qword_3478F0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_104B40;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3478F8 != -1) {
        dispatch_once(&qword_3478F8, v11);
      }
      v3 = &qword_347900;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_104BA8;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347908 != -1) {
        dispatch_once(&qword_347908, v10);
      }
      v3 = &qword_347910;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_104C10;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347918 != -1) {
        dispatch_once(&qword_347918, v9);
      }
      v3 = &qword_347920;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_104C78;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347928 != -1) {
        dispatch_once(&qword_347928, v8);
      }
      v3 = &qword_347930;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_104CE0;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347938 != -1) {
        dispatch_once(&qword_347938, v7);
      }
      v3 = &qword_347940;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_104D48;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347948 != -1) {
        dispatch_once(&qword_347948, v6);
      }
      v3 = &qword_347950;
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
      block[2] = sub_1056AC;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347958 != -1) {
        dispatch_once(&qword_347958, block);
      }
      v3 = &qword_347960;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_105714;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347968 != -1) {
        dispatch_once(&qword_347968, v21);
      }
      v3 = &qword_347970;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10577C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347978 != -1) {
        dispatch_once(&qword_347978, v20);
      }
      v3 = &qword_347980;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1057E4;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347988 != -1) {
        dispatch_once(&qword_347988, v19);
      }
      v3 = &qword_347990;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10584C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347998 != -1) {
        dispatch_once(&qword_347998, v18);
      }
      v3 = &qword_3479A0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1058B4;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_3479A8 != -1) {
        dispatch_once(&qword_3479A8, v17);
      }
      v3 = &qword_3479B0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10591C;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3479B8 != -1) {
        dispatch_once(&qword_3479B8, v16);
      }
      v3 = &qword_3479C0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_105984;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3479C8 != -1) {
        dispatch_once(&qword_3479C8, v15);
      }
      v3 = &qword_3479D0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1059EC;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3479D8 != -1) {
        dispatch_once(&qword_3479D8, v14);
      }
      v3 = &qword_3479E0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_105A54;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3479E8 != -1) {
        dispatch_once(&qword_3479E8, v13);
      }
      v3 = &qword_3479F0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_105ABC;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3479F8 != -1) {
        dispatch_once(&qword_3479F8, v12);
      }
      v3 = &qword_347A00;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_105B24;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347A08 != -1) {
        dispatch_once(&qword_347A08, v11);
      }
      v3 = &qword_347A10;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_105B8C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347A18 != -1) {
        dispatch_once(&qword_347A18, v10);
      }
      v3 = &qword_347A20;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_105BF4;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347A28 != -1) {
        dispatch_once(&qword_347A28, v9);
      }
      v3 = &qword_347A30;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_105C5C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347A38 != -1) {
        dispatch_once(&qword_347A38, v8);
      }
      v3 = &qword_347A40;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_105CC4;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347A48 != -1) {
        dispatch_once(&qword_347A48, v7);
      }
      v3 = &qword_347A50;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_105D2C;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347A58 != -1) {
        dispatch_once(&qword_347A58, v6);
      }
      v3 = &qword_347A60;
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
      block[2] = sub_106690;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_347A68 != -1) {
        dispatch_once(&qword_347A68, block);
      }
      v3 = &qword_347A70;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1066F8;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_347A78 != -1) {
        dispatch_once(&qword_347A78, v21);
      }
      v3 = &qword_347A80;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_106760;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_347A88 != -1) {
        dispatch_once(&qword_347A88, v20);
      }
      v3 = &qword_347A90;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1067C8;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_347A98 != -1) {
        dispatch_once(&qword_347A98, v19);
      }
      v3 = &qword_347AA0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_106830;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_347AA8 != -1) {
        dispatch_once(&qword_347AA8, v18);
      }
      v3 = &qword_347AB0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_106898;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_347AB8 != -1) {
        dispatch_once(&qword_347AB8, v17);
      }
      v3 = &qword_347AC0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_106900;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_347AC8 != -1) {
        dispatch_once(&qword_347AC8, v16);
      }
      v3 = &qword_347AD0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_106968;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_347AD8 != -1) {
        dispatch_once(&qword_347AD8, v15);
      }
      v3 = &qword_347AE0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1069D0;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_347AE8 != -1) {
        dispatch_once(&qword_347AE8, v14);
      }
      v3 = &qword_347AF0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_106A38;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_347AF8 != -1) {
        dispatch_once(&qword_347AF8, v13);
      }
      v3 = &qword_347B00;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_106AA0;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_347B08 != -1) {
        dispatch_once(&qword_347B08, v12);
      }
      v3 = &qword_347B10;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_106B08;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_347B18 != -1) {
        dispatch_once(&qword_347B18, v11);
      }
      v3 = &qword_347B20;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_106B70;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_347B28 != -1) {
        dispatch_once(&qword_347B28, v10);
      }
      v3 = &qword_347B30;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_106BD8;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_347B38 != -1) {
        dispatch_once(&qword_347B38, v9);
      }
      v3 = &qword_347B40;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_106C40;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_347B48 != -1) {
        dispatch_once(&qword_347B48, v8);
      }
      v3 = &qword_347B50;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_106CA8;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_347B58 != -1) {
        dispatch_once(&qword_347B58, v7);
      }
      v3 = &qword_347B60;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_106D10;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_347B68 != -1) {
        dispatch_once(&qword_347B68, v6);
      }
      v3 = &qword_347B70;
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
  block[2] = sub_106E08;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_347B78 != -1) {
    dispatch_once(&qword_347B78, block);
  }
  return byte_347B80;
}

- (int)annotationStyle
{
  return 5;
}

@end
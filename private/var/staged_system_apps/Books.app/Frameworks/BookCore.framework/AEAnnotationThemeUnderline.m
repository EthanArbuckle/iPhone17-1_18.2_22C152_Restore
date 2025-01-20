@interface AEAnnotationThemeUnderline
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

@implementation AEAnnotationThemeUnderline

- (id)noteFillColor
{
  switch([(AEAnnotationTheme *)self pageTheme])
  {
    case 0:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10E7C0;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348308 != -1) {
        dispatch_once(&qword_348308, block);
      }
      v3 = &qword_348310;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10E828;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348318 != -1) {
        dispatch_once(&qword_348318, v21);
      }
      v3 = &qword_348320;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10E890;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348328 != -1) {
        dispatch_once(&qword_348328, v20);
      }
      v3 = &qword_348330;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10E8F8;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348338 != -1) {
        dispatch_once(&qword_348338, v19);
      }
      v3 = &qword_348340;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10E960;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348348 != -1) {
        dispatch_once(&qword_348348, v18);
      }
      v3 = &qword_348350;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10E9C8;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348358 != -1) {
        dispatch_once(&qword_348358, v17);
      }
      v3 = &qword_348360;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10EA30;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348368 != -1) {
        dispatch_once(&qword_348368, v16);
      }
      v3 = &qword_348370;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10EA98;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348378 != -1) {
        dispatch_once(&qword_348378, v15);
      }
      v3 = &qword_348380;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10EB00;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_348388 != -1) {
        dispatch_once(&qword_348388, v14);
      }
      v3 = &qword_348390;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10EB68;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_348398 != -1) {
        dispatch_once(&qword_348398, v13);
      }
      v3 = &qword_3483A0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10EBD0;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3483A8 != -1) {
        dispatch_once(&qword_3483A8, v12);
      }
      v3 = &qword_3483B0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10EC38;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3483B8 != -1) {
        dispatch_once(&qword_3483B8, v11);
      }
      v3 = &qword_3483C0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10ECA0;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3483C8 != -1) {
        dispatch_once(&qword_3483C8, v10);
      }
      v3 = &qword_3483D0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10ED08;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3483D8 != -1) {
        dispatch_once(&qword_3483D8, v9);
      }
      v3 = &qword_3483E0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10ED70;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3483E8 != -1) {
        dispatch_once(&qword_3483E8, v8);
      }
      v3 = &qword_3483F0;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10EDD8;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_3483F8 != -1) {
        dispatch_once(&qword_3483F8, v7);
      }
      v3 = &qword_348400;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10EE40;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348408 != -1) {
        dispatch_once(&qword_348408, v6);
      }
      v3 = &qword_348410;
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
      block[2] = sub_10F7A4;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348418 != -1) {
        dispatch_once(&qword_348418, block);
      }
      v3 = &qword_348420;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10F80C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348428 != -1) {
        dispatch_once(&qword_348428, v21);
      }
      v3 = &qword_348430;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10F874;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348438 != -1) {
        dispatch_once(&qword_348438, v20);
      }
      v3 = &qword_348440;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10F8DC;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348448 != -1) {
        dispatch_once(&qword_348448, v19);
      }
      v3 = &qword_348450;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10F944;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348458 != -1) {
        dispatch_once(&qword_348458, v18);
      }
      v3 = &qword_348460;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10F9AC;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348468 != -1) {
        dispatch_once(&qword_348468, v17);
      }
      v3 = &qword_348470;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10FA14;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348478 != -1) {
        dispatch_once(&qword_348478, v16);
      }
      v3 = &qword_348480;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10FA7C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348488 != -1) {
        dispatch_once(&qword_348488, v15);
      }
      v3 = &qword_348490;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10FAE4;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_348498 != -1) {
        dispatch_once(&qword_348498, v14);
      }
      v3 = &qword_3484A0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10FB4C;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3484A8 != -1) {
        dispatch_once(&qword_3484A8, v13);
      }
      v3 = &qword_3484B0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10FBB4;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3484B8 != -1) {
        dispatch_once(&qword_3484B8, v12);
      }
      v3 = &qword_3484C0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10FC1C;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3484C8 != -1) {
        dispatch_once(&qword_3484C8, v11);
      }
      v3 = &qword_3484D0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10FC84;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3484D8 != -1) {
        dispatch_once(&qword_3484D8, v10);
      }
      v3 = &qword_3484E0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10FCEC;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3484E8 != -1) {
        dispatch_once(&qword_3484E8, v9);
      }
      v3 = &qword_3484F0;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10FD54;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_3484F8 != -1) {
        dispatch_once(&qword_3484F8, v8);
      }
      v3 = &qword_348500;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10FDBC;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348508 != -1) {
        dispatch_once(&qword_348508, v7);
      }
      v3 = &qword_348510;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10FE24;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348518 != -1) {
        dispatch_once(&qword_348518, v6);
      }
      v3 = &qword_348520;
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
      block[2] = sub_110788;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348528 != -1) {
        dispatch_once(&qword_348528, block);
      }
      v3 = &qword_348530;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1107F0;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348538 != -1) {
        dispatch_once(&qword_348538, v21);
      }
      v3 = &qword_348540;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_110858;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348548 != -1) {
        dispatch_once(&qword_348548, v20);
      }
      v3 = &qword_348550;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1108C0;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348558 != -1) {
        dispatch_once(&qword_348558, v19);
      }
      v3 = &qword_348560;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_110928;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348568 != -1) {
        dispatch_once(&qword_348568, v18);
      }
      v3 = &qword_348570;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_110990;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348578 != -1) {
        dispatch_once(&qword_348578, v17);
      }
      v3 = &qword_348580;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1109F8;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348588 != -1) {
        dispatch_once(&qword_348588, v16);
      }
      v3 = &qword_348590;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_110A60;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_348598 != -1) {
        dispatch_once(&qword_348598, v15);
      }
      v3 = &qword_3485A0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_110AC8;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3485A8 != -1) {
        dispatch_once(&qword_3485A8, v14);
      }
      v3 = &qword_3485B0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_110B30;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3485B8 != -1) {
        dispatch_once(&qword_3485B8, v13);
      }
      v3 = &qword_3485C0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_110B98;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3485C8 != -1) {
        dispatch_once(&qword_3485C8, v12);
      }
      v3 = &qword_3485D0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_110C00;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3485D8 != -1) {
        dispatch_once(&qword_3485D8, v11);
      }
      v3 = &qword_3485E0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_110C68;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3485E8 != -1) {
        dispatch_once(&qword_3485E8, v10);
      }
      v3 = &qword_3485F0;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_110CD0;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_3485F8 != -1) {
        dispatch_once(&qword_3485F8, v9);
      }
      v3 = &qword_348600;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_110D38;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_348608 != -1) {
        dispatch_once(&qword_348608, v8);
      }
      v3 = &qword_348610;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_110DA0;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348618 != -1) {
        dispatch_once(&qword_348618, v7);
      }
      v3 = &qword_348620;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_110E08;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348628 != -1) {
        dispatch_once(&qword_348628, v6);
      }
      v3 = &qword_348630;
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
      block[2] = sub_11176C;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348638 != -1) {
        dispatch_once(&qword_348638, block);
      }
      v3 = &qword_348640;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1117D4;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348648 != -1) {
        dispatch_once(&qword_348648, v21);
      }
      v3 = &qword_348650;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_11183C;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348658 != -1) {
        dispatch_once(&qword_348658, v20);
      }
      v3 = &qword_348660;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1118A4;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348668 != -1) {
        dispatch_once(&qword_348668, v19);
      }
      v3 = &qword_348670;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_11190C;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348678 != -1) {
        dispatch_once(&qword_348678, v18);
      }
      v3 = &qword_348680;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_111974;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348688 != -1) {
        dispatch_once(&qword_348688, v17);
      }
      v3 = &qword_348690;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1119DC;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_348698 != -1) {
        dispatch_once(&qword_348698, v16);
      }
      v3 = &qword_3486A0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_111A44;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3486A8 != -1) {
        dispatch_once(&qword_3486A8, v15);
      }
      v3 = &qword_3486B0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_111AAC;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3486B8 != -1) {
        dispatch_once(&qword_3486B8, v14);
      }
      v3 = &qword_3486C0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_111B14;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3486C8 != -1) {
        dispatch_once(&qword_3486C8, v13);
      }
      v3 = &qword_3486D0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_111B7C;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3486D8 != -1) {
        dispatch_once(&qword_3486D8, v12);
      }
      v3 = &qword_3486E0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_111BE4;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3486E8 != -1) {
        dispatch_once(&qword_3486E8, v11);
      }
      v3 = &qword_3486F0;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_111C4C;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_3486F8 != -1) {
        dispatch_once(&qword_3486F8, v10);
      }
      v3 = &qword_348700;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_111CB4;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_348708 != -1) {
        dispatch_once(&qword_348708, v9);
      }
      v3 = &qword_348710;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_111D1C;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_348718 != -1) {
        dispatch_once(&qword_348718, v8);
      }
      v3 = &qword_348720;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_111D84;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348728 != -1) {
        dispatch_once(&qword_348728, v7);
      }
      v3 = &qword_348730;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_111DEC;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348738 != -1) {
        dispatch_once(&qword_348738, v6);
      }
      v3 = &qword_348740;
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
      block[2] = sub_112750;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348748 != -1) {
        dispatch_once(&qword_348748, block);
      }
      v3 = &qword_348750;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1127B8;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348758 != -1) {
        dispatch_once(&qword_348758, v21);
      }
      v3 = &qword_348760;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_112820;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348768 != -1) {
        dispatch_once(&qword_348768, v20);
      }
      v3 = &qword_348770;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_112888;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348778 != -1) {
        dispatch_once(&qword_348778, v19);
      }
      v3 = &qword_348780;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1128F0;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348788 != -1) {
        dispatch_once(&qword_348788, v18);
      }
      v3 = &qword_348790;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_112958;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_348798 != -1) {
        dispatch_once(&qword_348798, v17);
      }
      v3 = &qword_3487A0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1129C0;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3487A8 != -1) {
        dispatch_once(&qword_3487A8, v16);
      }
      v3 = &qword_3487B0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_112A28;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3487B8 != -1) {
        dispatch_once(&qword_3487B8, v15);
      }
      v3 = &qword_3487C0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_112A90;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3487C8 != -1) {
        dispatch_once(&qword_3487C8, v14);
      }
      v3 = &qword_3487D0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_112AF8;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3487D8 != -1) {
        dispatch_once(&qword_3487D8, v13);
      }
      v3 = &qword_3487E0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_112B60;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3487E8 != -1) {
        dispatch_once(&qword_3487E8, v12);
      }
      v3 = &qword_3487F0;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_112BC8;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_3487F8 != -1) {
        dispatch_once(&qword_3487F8, v11);
      }
      v3 = &qword_348800;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_112C30;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_348808 != -1) {
        dispatch_once(&qword_348808, v10);
      }
      v3 = &qword_348810;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_112C98;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_348818 != -1) {
        dispatch_once(&qword_348818, v9);
      }
      v3 = &qword_348820;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_112D00;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_348828 != -1) {
        dispatch_once(&qword_348828, v8);
      }
      v3 = &qword_348830;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_112D68;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348838 != -1) {
        dispatch_once(&qword_348838, v7);
      }
      v3 = &qword_348840;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_112DD0;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348848 != -1) {
        dispatch_once(&qword_348848, v6);
      }
      v3 = &qword_348850;
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
      block[2] = sub_113734;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348858 != -1) {
        dispatch_once(&qword_348858, block);
      }
      v3 = &qword_348860;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_11379C;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348868 != -1) {
        dispatch_once(&qword_348868, v21);
      }
      v3 = &qword_348870;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_113804;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348878 != -1) {
        dispatch_once(&qword_348878, v20);
      }
      v3 = &qword_348880;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_11386C;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348888 != -1) {
        dispatch_once(&qword_348888, v19);
      }
      v3 = &qword_348890;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1138D4;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_348898 != -1) {
        dispatch_once(&qword_348898, v18);
      }
      v3 = &qword_3488A0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_11393C;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_3488A8 != -1) {
        dispatch_once(&qword_3488A8, v17);
      }
      v3 = &qword_3488B0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1139A4;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3488B8 != -1) {
        dispatch_once(&qword_3488B8, v16);
      }
      v3 = &qword_3488C0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_113A0C;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3488C8 != -1) {
        dispatch_once(&qword_3488C8, v15);
      }
      v3 = &qword_3488D0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_113A74;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3488D8 != -1) {
        dispatch_once(&qword_3488D8, v14);
      }
      v3 = &qword_3488E0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_113ADC;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3488E8 != -1) {
        dispatch_once(&qword_3488E8, v13);
      }
      v3 = &qword_3488F0;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_113B44;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_3488F8 != -1) {
        dispatch_once(&qword_3488F8, v12);
      }
      v3 = &qword_348900;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_113BAC;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_348908 != -1) {
        dispatch_once(&qword_348908, v11);
      }
      v3 = &qword_348910;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_113C14;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_348918 != -1) {
        dispatch_once(&qword_348918, v10);
      }
      v3 = &qword_348920;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_113C7C;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_348928 != -1) {
        dispatch_once(&qword_348928, v9);
      }
      v3 = &qword_348930;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_113CE4;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_348938 != -1) {
        dispatch_once(&qword_348938, v8);
      }
      v3 = &qword_348940;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_113D4C;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348948 != -1) {
        dispatch_once(&qword_348948, v7);
      }
      v3 = &qword_348950;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_113DB4;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348958 != -1) {
        dispatch_once(&qword_348958, v6);
      }
      v3 = &qword_348960;
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
      block[2] = sub_114718;
      block[3] = &unk_2C3C28;
      block[4] = self;
      block[5] = 0;
      if (qword_348968 != -1) {
        dispatch_once(&qword_348968, block);
      }
      v3 = &qword_348970;
      goto LABEL_54;
    case 1:
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_114780;
      v21[3] = &unk_2C3C28;
      v21[4] = self;
      v21[5] = 1;
      if (qword_348978 != -1) {
        dispatch_once(&qword_348978, v21);
      }
      v3 = &qword_348980;
      goto LABEL_54;
    case 2:
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1147E8;
      v20[3] = &unk_2C3C28;
      v20[4] = self;
      v20[5] = 2;
      if (qword_348988 != -1) {
        dispatch_once(&qword_348988, v20);
      }
      v3 = &qword_348990;
      goto LABEL_54;
    case 3:
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_114850;
      v19[3] = &unk_2C3C28;
      v19[4] = self;
      v19[5] = 3;
      if (qword_348998 != -1) {
        dispatch_once(&qword_348998, v19);
      }
      v3 = &qword_3489A0;
      goto LABEL_54;
    case 4:
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1148B8;
      v18[3] = &unk_2C3C28;
      v18[4] = self;
      v18[5] = 4;
      if (qword_3489A8 != -1) {
        dispatch_once(&qword_3489A8, v18);
      }
      v3 = &qword_3489B0;
      goto LABEL_54;
    case 5:
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_114920;
      v17[3] = &unk_2C3C28;
      v17[4] = self;
      v17[5] = 5;
      if (qword_3489B8 != -1) {
        dispatch_once(&qword_3489B8, v17);
      }
      v3 = &qword_3489C0;
      goto LABEL_54;
    case 6:
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_114988;
      v16[3] = &unk_2C3C28;
      v16[4] = self;
      v16[5] = 6;
      if (qword_3489C8 != -1) {
        dispatch_once(&qword_3489C8, v16);
      }
      v3 = &qword_3489D0;
      goto LABEL_54;
    case 7:
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1149F0;
      v15[3] = &unk_2C3C28;
      v15[4] = self;
      v15[5] = 7;
      if (qword_3489D8 != -1) {
        dispatch_once(&qword_3489D8, v15);
      }
      v3 = &qword_3489E0;
      goto LABEL_54;
    case 8:
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_114A58;
      v14[3] = &unk_2C3C28;
      v14[4] = self;
      v14[5] = 8;
      if (qword_3489E8 != -1) {
        dispatch_once(&qword_3489E8, v14);
      }
      v3 = &qword_3489F0;
      goto LABEL_54;
    case 9:
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_114AC0;
      v13[3] = &unk_2C3C28;
      v13[4] = self;
      v13[5] = 9;
      if (qword_3489F8 != -1) {
        dispatch_once(&qword_3489F8, v13);
      }
      v3 = &qword_348A00;
      goto LABEL_54;
    case 0xALL:
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_114B28;
      v12[3] = &unk_2C3C28;
      v12[4] = self;
      v12[5] = 10;
      if (qword_348A08 != -1) {
        dispatch_once(&qword_348A08, v12);
      }
      v3 = &qword_348A10;
      goto LABEL_54;
    case 0xBLL:
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_114B90;
      v11[3] = &unk_2C3C28;
      v11[4] = self;
      v11[5] = 11;
      if (qword_348A18 != -1) {
        dispatch_once(&qword_348A18, v11);
      }
      v3 = &qword_348A20;
      goto LABEL_54;
    case 0xCLL:
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_114BF8;
      v10[3] = &unk_2C3C28;
      v10[4] = self;
      v10[5] = 12;
      if (qword_348A28 != -1) {
        dispatch_once(&qword_348A28, v10);
      }
      v3 = &qword_348A30;
      goto LABEL_54;
    case 0xDLL:
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_114C60;
      v9[3] = &unk_2C3C28;
      v9[4] = self;
      v9[5] = 13;
      if (qword_348A38 != -1) {
        dispatch_once(&qword_348A38, v9);
      }
      v3 = &qword_348A40;
      goto LABEL_54;
    case 0xELL:
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_114CC8;
      v8[3] = &unk_2C3C28;
      v8[4] = self;
      v8[5] = 14;
      if (qword_348A48 != -1) {
        dispatch_once(&qword_348A48, v8);
      }
      v3 = &qword_348A50;
      goto LABEL_54;
    case 0xFLL:
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_114D30;
      v7[3] = &unk_2C3C28;
      v7[4] = self;
      v7[5] = 15;
      if (qword_348A58 != -1) {
        dispatch_once(&qword_348A58, v7);
      }
      v3 = &qword_348A60;
      goto LABEL_54;
    case 0x10:
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_114D98;
      v6[3] = &unk_2C3C28;
      v6[4] = self;
      v6[5] = 16;
      if (qword_348A68 != -1) {
        dispatch_once(&qword_348A68, v6);
      }
      v3 = &qword_348A70;
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
  block[2] = sub_114E90;
  block[3] = &unk_2C3C50;
  block[4] = self;
  if (qword_348A78 != -1) {
    dispatch_once(&qword_348A78, block);
  }
  return byte_348A80;
}

- (int)annotationStyle
{
  return 6;
}

@end
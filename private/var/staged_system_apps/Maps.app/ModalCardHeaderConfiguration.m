@interface ModalCardHeaderConfiguration
+ (id)defaultModalCardHeaderConfiguration;
+ (id)leadingAlignedTitleModalCardHeaderConfiguration;
+ (id)leadingInsetConfiguration;
+ (id)leadingNavigationModalCardHeaderCompactConfiguration;
+ (id)libraryCenteredConfiguration;
+ (id)navigationModalCardHeaderCompactConfiguration;
+ (id)navigationModalCardHeaderConfiguration;
+ (id)popoverCardHeaderConfiguration;
+ (id)routePlanningTimingPickerConfiguration;
- (BOOL)leadingAlignedTitle;
- (double)baselineToBottomDistance;
- (double)hairlineLeadingInset;
- (double)hairlineTrailingInset;
- (double)topToTitleBaselineUnscaledDistance;
- (id)adaptiveLeadingButtonFontProvider;
- (id)adaptiveTitleFontProvider;
- (id)adaptiveTrailingButtonFontProvider;
- (id)baselineDistanceFontProvider;
- (id)leadingButtonFontProvider;
- (id)titleFontProvider;
- (id)trailingButtonFontProvider;
@end

@implementation ModalCardHeaderConfiguration

+ (id)defaultModalCardHeaderConfiguration
{
  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100AED0A8;
  v24[3] = &unk_101317178;
  v24[4] = 0x4031000000000000;
  v3 = objc_retainBlock(v24);
  id titleFontProvider = v2->_titleFontProvider;
  v2->_id titleFontProvider = v3;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100AED0BC;
  v23[3] = &unk_101317178;
  v23[4] = 0x4031000000000000;
  v5 = objc_retainBlock(v23);
  id adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_id adaptiveTitleFontProvider = v5;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100AED0D4;
  v22[3] = &unk_101317178;
  v22[4] = 0x4031000000000000;
  v7 = objc_retainBlock(v22);
  id leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_id leadingButtonFontProvider = v7;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100AED0E8;
  v21[3] = &unk_101317178;
  v21[4] = 0x4031000000000000;
  v9 = objc_retainBlock(v21);
  id adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_id adaptiveLeadingButtonFontProvider = v9;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100AED100;
  v20[3] = &unk_101317178;
  v20[4] = 0x4031000000000000;
  v11 = objc_retainBlock(v20);
  id trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_id trailingButtonFontProvider = v11;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AED114;
  v19[3] = &unk_101317178;
  v19[4] = 0x4031000000000000;
  v13 = objc_retainBlock(v19);
  id adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_id adaptiveTrailingButtonFontProvider = v13;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100AED12C;
  v18[3] = &unk_101317178;
  v18[4] = 0x4031000000000000;
  v15 = objc_retainBlock(v18);
  id baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_id baselineDistanceFontProvider = v15;

  v2->_topToTitleBaselineUnscaledDistance = 37.0;
  v2->_baselineToBottomDistance = 23.0;

  return v2;
}

+ (id)leadingAlignedTitleModalCardHeaderConfiguration
{
  id result = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  *((unsigned char *)result + 8) = 1;
  return result;
}

+ (id)navigationModalCardHeaderConfiguration
{
  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  id titleFontProvider = v2->_titleFontProvider;
  v2->_id titleFontProvider = &stru_101317198;

  id adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_id adaptiveTitleFontProvider = 0;

  id leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_id leadingButtonFontProvider = &stru_1013171B8;

  id adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_id adaptiveLeadingButtonFontProvider = 0;

  id trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_id trailingButtonFontProvider = &stru_1013171D8;

  id adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_id adaptiveTrailingButtonFontProvider = 0;

  id baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_id baselineDistanceFontProvider = &stru_1013171F8;

  v2->_topToTitleBaselineUnscaledDistance = 46.0;
  v2->_baselineToBottomDistance = 29.0;

  return v2;
}

+ (id)navigationModalCardHeaderCompactConfiguration
{
  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  id titleFontProvider = v2->_titleFontProvider;
  v2->_id titleFontProvider = &stru_101317218;

  id adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_id adaptiveTitleFontProvider = 0;

  id leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_id leadingButtonFontProvider = &stru_101317238;

  id adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_id adaptiveLeadingButtonFontProvider = 0;

  id trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_id trailingButtonFontProvider = &stru_101317258;

  id adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_id adaptiveTrailingButtonFontProvider = 0;

  id baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_id baselineDistanceFontProvider = &stru_101317278;

  v2->_topToTitleBaselineUnscaledDistance = 36.0;
  v2->_baselineToBottomDistance = 17.0;

  return v2;
}

+ (id)leadingNavigationModalCardHeaderCompactConfiguration
{
  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  id titleFontProvider = v2->_titleFontProvider;
  v2->_id titleFontProvider = &stru_101317298;

  id adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_id adaptiveTitleFontProvider = 0;

  id trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_id trailingButtonFontProvider = &stru_1013172B8;

  id adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_id adaptiveTrailingButtonFontProvider = 0;

  id baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_id baselineDistanceFontProvider = &stru_1013172D8;

  v2->_topToTitleBaselineUnscaledDistance = 40.0;
  v2->_baselineToBottomDistance = 9.0;
  v2->_leadingAlignedTitle = 1;

  return v2;
}

+ (id)popoverCardHeaderConfiguration
{
  v2 = objc_alloc_init(ModalCardHeaderConfiguration);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100AED6E4;
  v24[3] = &unk_101317178;
  v24[4] = 0x4034000000000000;
  v3 = objc_retainBlock(v24);
  id titleFontProvider = v2->_titleFontProvider;
  v2->_id titleFontProvider = v3;

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100AED6F8;
  v23[3] = &unk_101317178;
  v23[4] = 0x4034000000000000;
  v5 = objc_retainBlock(v23);
  id adaptiveTitleFontProvider = v2->_adaptiveTitleFontProvider;
  v2->_id adaptiveTitleFontProvider = v5;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100AED710;
  v22[3] = &unk_101317178;
  v22[4] = 0x4034000000000000;
  v7 = objc_retainBlock(v22);
  id leadingButtonFontProvider = v2->_leadingButtonFontProvider;
  v2->_id leadingButtonFontProvider = v7;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100AED724;
  v21[3] = &unk_101317178;
  v21[4] = 0x4034000000000000;
  v9 = objc_retainBlock(v21);
  id adaptiveLeadingButtonFontProvider = v2->_adaptiveLeadingButtonFontProvider;
  v2->_id adaptiveLeadingButtonFontProvider = v9;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100AED73C;
  v20[3] = &unk_101317178;
  v20[4] = 0x4034000000000000;
  v11 = objc_retainBlock(v20);
  id trailingButtonFontProvider = v2->_trailingButtonFontProvider;
  v2->_id trailingButtonFontProvider = v11;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AED750;
  v19[3] = &unk_101317178;
  v19[4] = 0x4034000000000000;
  v13 = objc_retainBlock(v19);
  id adaptiveTrailingButtonFontProvider = v2->_adaptiveTrailingButtonFontProvider;
  v2->_id adaptiveTrailingButtonFontProvider = v13;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100AED768;
  v18[3] = &unk_101317178;
  v18[4] = 0x4034000000000000;
  v15 = objc_retainBlock(v18);
  id baselineDistanceFontProvider = v2->_baselineDistanceFontProvider;
  v2->_id baselineDistanceFontProvider = v15;

  v2->_topToTitleBaselineUnscaledDistance = 32.0;
  v2->_baselineToBottomDistance = 12.0;
  v2->_leadingAlignedTitle = 1;

  return v2;
}

+ (id)leadingInsetConfiguration
{
  id result = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
  *((void *)result + 11) = 0x4030000000000000;
  return result;
}

+ (id)routePlanningTimingPickerConfiguration
{
  v2 = [a1 leadingInsetConfiguration];
  v3 = (void *)v2[7];
  v2[7] = &stru_1013172F8;

  v4 = (void *)v2[8];
  v2[8] = 0;

  return v2;
}

+ (id)libraryCenteredConfiguration
{
  uint64_t v2 = [a1 defaultModalCardHeaderConfiguration];
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = &stru_101317318;

  id v4 = objc_retainBlock(*(id *)(v2 + 56));
  v5 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = v4;

  return (id)v2;
}

- (BOOL)leadingAlignedTitle
{
  return self->_leadingAlignedTitle;
}

- (double)topToTitleBaselineUnscaledDistance
{
  return self->_topToTitleBaselineUnscaledDistance;
}

- (id)baselineDistanceFontProvider
{
  return self->_baselineDistanceFontProvider;
}

- (double)baselineToBottomDistance
{
  return self->_baselineToBottomDistance;
}

- (id)leadingButtonFontProvider
{
  return self->_leadingButtonFontProvider;
}

- (id)adaptiveLeadingButtonFontProvider
{
  return self->_adaptiveLeadingButtonFontProvider;
}

- (id)titleFontProvider
{
  return self->_titleFontProvider;
}

- (id)adaptiveTitleFontProvider
{
  return self->_adaptiveTitleFontProvider;
}

- (id)trailingButtonFontProvider
{
  return self->_trailingButtonFontProvider;
}

- (id)adaptiveTrailingButtonFontProvider
{
  return self->_adaptiveTrailingButtonFontProvider;
}

- (double)hairlineLeadingInset
{
  return self->_hairlineLeadingInset;
}

- (double)hairlineTrailingInset
{
  return self->_hairlineTrailingInset;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_adaptiveTrailingButtonFontProvider, 0);
  objc_storeStrong(&self->_trailingButtonFontProvider, 0);
  objc_storeStrong(&self->_adaptiveTitleFontProvider, 0);
  objc_storeStrong(&self->_titleFontProvider, 0);
  objc_storeStrong(&self->_adaptiveLeadingButtonFontProvider, 0);
  objc_storeStrong(&self->_leadingButtonFontProvider, 0);

  objc_storeStrong(&self->_baselineDistanceFontProvider, 0);
}

@end
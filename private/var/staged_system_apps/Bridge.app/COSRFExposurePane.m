@interface COSRFExposurePane
- (id)markupString;
- (id)title;
@end

@implementation COSRFExposurePane

- (id)title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"RF_EXPOSURE" value:&stru_100249230 table:@"Legal"];

  return v3;
}

- (id)markupString
{
  [UIApp activeWatch];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030B44;
  v13[3] = &unk_100243F30;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v2;
  v3 = objc_retainBlock(v13);
  id WeakRetained = objc_loadWeakRetained(&qword_10029AF10);
  v5 = [WeakRetained rfExposureMarkup];

  id v6 = objc_loadWeakRetained(&qword_10029AF10);
  LOBYTE(WeakRetained) = [v6 sarURLAdded];

  if ((WeakRetained & 1) == 0)
  {
    v7 = ((void (*)(void *))v3[2])(v3);
    uint64_t v8 = [v5 stringByAppendingString:v7];

    v5 = (void *)v8;
  }
  if (BPSDeviceHasCellularDataCapability())
  {
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"CELLULAR_INFO" value:&stru_100249230 table:@"About"];
    uint64_t v11 = [v5 stringByAppendingString:v10];

    v5 = (void *)v11;
  }

  return v5;
}

@end
@interface BKPictureBookWebViewAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BKPictureBookWebViewAccessibility)initWithFrame:(CGRect)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (id)_imaxPageStatus:(BOOL)a3 window:(id)a4;
@end

@implementation BKPictureBookWebViewAccessibility

+ (id)imaxTargetClassName
{
  return @"BKPictureBookWebView";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BKPictureBookWebViewAccessibility)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)BKPictureBookWebViewAccessibility;
  v3 = -[BKPictureBookWebViewAccessibility initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = [(BKPictureBookWebViewAccessibility *)v3 imaxValueForKey:@"_internal"];
  v5 = [v4 imaxValueForKey:@"browserView"];

  v6 = [(BKPictureBookWebViewAccessibility *)v3 imaxValueForKey:@"_internal"];
  v7 = [v6 imaxValueForKey:@"scroller"];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013A498;
  v11[3] = &unk_100A43DD8;
  id v12 = v5;
  id v13 = v7;
  id v8 = v7;
  id v9 = v5;
  sub_1000B8460(v11);

  return v3;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  LOBYTE(v19) = 0;
  objc_opt_class();
  v5 = [(BKPictureBookWebViewAccessibility *)self imaxValueForKey:@"bkWebViewDelegate"];
  v6 = __IMAccessibilityCastAsClass();

  v7 = [v6 parentViewController];

  if (v7)
  {
    id v8 = [v7 viewIfLoaded];
    id v9 = [v8 window];

    v10 = (char *)[v7 safeIntegerForKey:@"pageOffset"];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_100007004;
    v23 = sub_1000071EC;
    id v24 = 0;
    int64_t v11 = a3 - 1;
    id v12 = v10 + 1;
    switch(v11)
    {
      case 0:
      case 5:
        id v13 = v17;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10013A818;
        v17[3] = &unk_100A47C88;
        v17[7] = &v19;
        v17[4] = self;
        v17[5] = v9;
        v17[6] = v7;
        v17[8] = v12;
        if (__IMAccessibilityPerformSafeBlock()) {
          abort();
        }
        goto LABEL_7;
      case 1:
      case 4:
        id v13 = v18;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10013A7B0;
        v18[3] = &unk_100A47C88;
        v18[7] = &v19;
        v18[4] = self;
        v18[5] = v9;
        v18[6] = v7;
        v18[8] = v12;
        if (__IMAccessibilityPerformSafeBlock()) {
          abort();
        }
LABEL_7:

        break;
      default:
        break;
    }
    v15 = (void *)v20[5];
    BOOL v14 = v15 != 0;
    if (v15) {
      UIAccessibilityPostNotification(UIAccessibilityPageScrolledNotification, v15);
    }
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_imaxPageStatus:(BOOL)a3 window:(id)a4
{
  int v4 = a3;
  id v5 = a4;
  v6 = sub_1000B84FC(v5);
  v30 = [v6 imaxValueForKey:@"paginationController"];
  v7 = [v30 imaxValueForKey:@"_chapterInfo"];
  id v8 = (char *)sub_1000B8628(v5);
  v29 = v7;
  if ([v7 count])
  {
    uint64_t v9 = 0;
    while (1)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3010000000;
      v35 = (uint64_t (*)(uint64_t, uint64_t))&unk_10092E1A3;
      v36 = 0;
      id v37 = 0;
      id v31 = v30;
      if (__IMAccessibilityPerformSafeBlock()) {
        abort();
      }

      v10 = (char *)v33[4];
      uint64_t v11 = v33[5];
      _Block_object_dispose(&v32, 8);
      if (v8 >= v10 && v8 < &v10[v11]) {
        break;
      }
      if (++v9 >= (unint64_t)[v7 count])
      {
        v10 = 0;
        uint64_t v11 = 0;
        break;
      }
    }
    if (!v4) {
      goto LABEL_13;
    }
  }
  else
  {
    v10 = 0;
    uint64_t v11 = 0;
    if (!v4)
    {
LABEL_13:
      int v12 = (v10 == v8) & ~v4;
      goto LABEL_14;
    }
  }
  if (&v10[v11] != v8 + 1) {
    goto LABEL_13;
  }
  int v12 = 1;
LABEL_14:
  id v13 = [v6 imaxValueForKey:@"pageCountIncludingUpsell"];
  BOOL v14 = (char *)[v13 unsignedIntegerValue];

  v15 = [v5 windowScene];
  v16 = (char *)[v15 interfaceOrientation];

  if ((unint64_t)(v16 - 3) <= 1
    && (+[UIDevice currentDevice],
        v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = [v17 userInterfaceIdiom],
        v17,
        v18 == (id)1))
  {
    BOOL v19 = v4 == 0;
    uint64_t v20 = 2;
  }
  else
  {
    BOOL v19 = v4 == 0;
    uint64_t v20 = 1;
  }
  if (v19) {
    uint64_t v20 = -v20;
  }
  uint64_t v21 = &v8[v20];
  if (v21 >= v14)
  {
    v25 = @" ";
  }
  else
  {
    if (v12)
    {
      if (v4) {
        v22 = @"chapter.change.next";
      }
      else {
        v22 = @"chapter.change.previous";
      }
      v23 = sub_1000B86A8(v22);
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x3032000000;
      v35 = sub_100007004;
      v36 = sub_1000071EC;
      id v37 = 0;
      id v24 = v23;
      if (__IMAccessibilityPerformSafeBlock()) {
        abort();
      }

      v25 = (__CFString *)(id)v33[5];
      _Block_object_dispose(&v32, 8);
    }
    else
    {
      sub_1000B86A8(@"page.num.of %@ %@");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v26 = +[NSNumber numberWithUnsignedInteger:v21];
      v27 = +[NSNumber numberWithUnsignedInteger:v14];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v26, v27);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v25;
}

@end
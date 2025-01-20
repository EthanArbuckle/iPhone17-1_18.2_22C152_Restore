@interface MapsRadarScreenshotAttachmentHelper
+ (void)generateScreenshotAttachments:(unint64_t)a3 fromWindow:(id)a4 withName:(id)a5 radarDraft:(id)a6 completion:(id)a7;
+ (void)generateScreenshotAttachmentsFromWindow:(id)a3 withName:(id)a4 radarDraft:(id)a5 completion:(id)a6;
@end

@implementation MapsRadarScreenshotAttachmentHelper

+ (void)generateScreenshotAttachmentsFromWindow:(id)a3 withName:(id)a4 radarDraft:(id)a5 completion:(id)a6
{
}

+ (void)generateScreenshotAttachments:(unint64_t)a3 fromWindow:(id)a4 withName:(id)a5 radarDraft:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = (void (**)(void))a7;
  if (v15)
  {
    if (v12)
    {
      if (v13)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100A57134;
        v26[3] = &unk_101315260;
        id v27 = v12;
        unint64_t v31 = a3;
        id v32 = a1;
        id v28 = v13;
        id v29 = v14;
        v30 = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);

        goto LABEL_23;
      }
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSString stringWithFormat:@"name is necessary for screenshot generation"];
        *(_DWORD *)buf = 136315906;
        v34 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
        __int16 v35 = 2080;
        v36 = "MapsRadarScreenshotAttachmentHelper.m";
        __int16 v37 = 1024;
        int v38 = 43;
        __int16 v39 = 2112;
        v40 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (!sub_100BB36BC())
      {
LABEL_22:
        v15[2](v15);
        goto LABEL_23;
      }
      v22 = sub_1005762E4();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSString stringWithFormat:@"window is necessary for screenshot generation"];
        *(_DWORD *)buf = 136315906;
        v34 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
        __int16 v35 = 2080;
        v36 = "MapsRadarScreenshotAttachmentHelper.m";
        __int16 v37 = 1024;
        int v38 = 37;
        __int16 v39 = 2112;
        v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
      }
      if (!sub_100BB36BC()) {
        goto LABEL_22;
      }
      v22 = sub_1005762E4();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
    }
    v25 = +[NSThread callStackSymbols];
    *(_DWORD *)buf = 138412290;
    v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    goto LABEL_21;
  }
  v16 = sub_1005762E4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v17 = +[NSString stringWithFormat:@"completion block is necessary for screenshot generation"];
    *(_DWORD *)buf = 136315906;
    v34 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
    __int16 v35 = 2080;
    v36 = "MapsRadarScreenshotAttachmentHelper.m";
    __int16 v37 = 1024;
    int v38 = 32;
    __int16 v39 = 2112;
    v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);
  }
  if (sub_100BB36BC())
  {
    v18 = sub_1005762E4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
  }
LABEL_23:
}

@end
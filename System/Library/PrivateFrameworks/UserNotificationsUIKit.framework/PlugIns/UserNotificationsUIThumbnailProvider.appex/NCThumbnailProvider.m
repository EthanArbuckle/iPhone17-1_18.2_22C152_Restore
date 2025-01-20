@interface NCThumbnailProvider
+ (void)initialize;
- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation NCThumbnailProvider

+ (void)initialize
{
  if (qword_100008180 != -1) {
    dispatch_once(&qword_100008180, &stru_100004268);
  }
}

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v59 = _os_activity_create((void *)&_mh_execute_header, "com.apple.UserNotificationsUI.ThumbnailProvider.provideThumbnail", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v59, &state);
  [v5 maximumSize];
  double v8 = v7;
  double v10 = v9;
  [v5 scale];
  double v12 = v11;
  v13 = [v5 fileURL];
  inTag = [v13 pathExtension];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, inTag, 0);
  uint64_t v14 = UNNotificationAttachmentFamilyFromTypeIdentifier();
  v15 = [v5 generationData];
  objc_msgSend(v15, "bs_safeDictionaryForKey:", UNNotificationAttachmentOptionsThumbnailClippingRectKey);
  CFDictionaryRef dict = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  rect.CGPoint origin = CGRectZero.origin;
  rect.CGSize size = size;
  if (!CGRectMakeWithDictionaryRepresentation(dict, &rect))
  {
    rect.CGPoint origin = origin;
    rect.CGSize size = size;
  }
  if (CGRectIsEmpty(rect))
  {
    rect.origin.double x = 0.0;
    rect.origin.double y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    rect.CGSize size = _Q0;
  }
  v21 = (void *)NCLogThumbnailProvider;
  if (os_log_type_enabled((os_log_t)NCLogThumbnailProvider, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v21;
    v23 = UNNotificationAttachmentFamilyToString();
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2114;
    v67 = PreferredIdentifierForTag;
    __int16 v68 = 2114;
    v69 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will generate thumbnail for attachment: fileURL=%{public}@ family=%{public}@, typeIdentifier=%{public}@, generatorOptions=%{public}@", buf, 0x2Au);
  }
  double v24 = v8 * v12;
  double v25 = v10 * v12;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  v67 = 0;
  if (v14 == 3)
  {
    v36 = objc_msgSend(v15, "bs_safeDictionaryForKey:", UNNotificationAttachmentOptionsThumbnailTimeKey);
    double x = rect.origin.x;
    double y = rect.origin.y;
    double width = rect.size.width;
    double height = rect.size.height;
    id v56 = v13;
    CFDictionaryRef v31 = v36;
    v73 = AVURLAssetReferenceRestrictionsKey;
    v41 = +[NSNumber numberWithUnsignedInteger:0xFFFFLL];
    CFStringRef v74 = v41;
    v58 = +[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];

    id v42 = [objc_alloc((Class)AVURLAsset) initWithURL:v56 options:v58];
    v43 = [v42 tracksWithMediaType:AVMediaTypeVideo];
    v44 = [v43 firstObject];

    if (v44)
    {
      v45 = +[AVAssetImageGenerator assetImageGeneratorWithAsset:v42];
      memset(&v72, 0, sizeof(v72));
      if (v31) {
        CMTimeMakeFromDictionary(&v72, v31);
      }
      else {
        CMTime v72 = kCMTimeInvalid;
      }
      if ((v72.flags & 1) == 0)
      {
        if (v42) {
          [v42 duration];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        CMTimeMultiplyByFloat64(&v71, &time, 0.5);
        CMTime v72 = v71;
      }
      CMTime v71 = v72;
      v51 = (CGImage *)[v45 copyCGImageAtTime:&v71 actualTime:0 error:0];
      v52 = v51;
      if (v51)
      {
        CGImageRef v46 = sub_100003498(v51, x, y, width, height, v24, v25);
        CFRelease(v52);
      }
      else
      {
        CGImageRef v46 = 0;
      }
    }
    else
    {
      CGImageRef v46 = 0;
    }
  }
  else
  {
    if (v14 != 2) {
      goto LABEL_35;
    }
    v26 = objc_msgSend(v15, "bs_safeNumberForKey:", UNNotificationAttachmentOptionsThumbnailTimeKey);
    double v27 = rect.origin.x;
    double v28 = rect.origin.y;
    double v29 = rect.size.width;
    double v30 = rect.size.height;
    CFDictionaryRef v31 = v26;
    CFStringRef v74 = kCGImageSourceShouldCache;
    time.value = (CMTimeValue)kCFBooleanFalse;
    CFURLRef v32 = v13;
    CFDictionaryRef v33 = +[NSDictionary dictionaryWithObjects:&time forKeys:&v74 count:1];
    v34 = CGImageSourceCreateWithURL(v32, v33);

    if (v34)
    {
      if (v31) {
        double v35 = (double)(unint64_t)[(__CFDictionary *)v31 unsignedIntegerValue];
      }
      else {
        double v35 = (double)CGImageSourceGetCount(v34) * 0.5;
      }
      v71.value = (CMTimeValue)kCGImageSourceThumbnailMaxPixelSize;
      v47 = +[NSNumber numberWithDouble:v24];
      v72.value = (CMTimeValue)v47;
      *(void *)&v72.timescale = kCFBooleanTrue;
      *(void *)&v71.timescale = kCGImageSourceCreateThumbnailFromImageAlways;
      v71.epoch = (CMTimeEpoch)kCGImageSourceCreateThumbnailWithTransform;
      v72.epoch = (CMTimeEpoch)kCFBooleanTrue;
      CFDictionaryRef v48 = +[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:3];

      ThumbnailAtIndedouble x = CGImageSourceCreateThumbnailAtIndex(v34, (unint64_t)v35, v48);
      v50 = ThumbnailAtIndex;
      if (ThumbnailAtIndex)
      {
        CGImageRef v46 = sub_100003498(ThumbnailAtIndex, v27, v28, v29, v30, v24, v25);
        CFRelease(v50);
      }
      else
      {
        CGImageRef v46 = 0;
      }
      CFRelease(v34);
    }
    else
    {
      CGImageRef v46 = 0;
    }
  }
  *(void *)(*(void *)&buf[8] + 24) = v46;

LABEL_35:
  if (*(void *)(*(void *)&buf[8] + 24))
  {
    [v5 maximumSize];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100003440;
    v63[3] = &unk_100004290;
    *(double *)&v63[5] = v24;
    *(double *)&v63[6] = v25;
    v63[4] = buf;
    v53 = +[QLThumbnailReply replyWithContextSize:drawingBlock:](QLThumbnailReply, "replyWithContextSize:drawingBlock:", v63);
    v6[2](v6, v53, 0);
  }
  else
  {
    v6[2](v6, 0, 0);
  }
  os_activity_scope_leave(&state);
  _Block_object_dispose(buf, 8);
}

@end
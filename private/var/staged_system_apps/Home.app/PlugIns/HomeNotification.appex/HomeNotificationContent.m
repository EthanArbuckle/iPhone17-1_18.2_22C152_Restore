@interface HomeNotificationContent
+ (id)contentWithSnapshot:(id)a3 loadingStream:(BOOL)a4 actionResultText:(id)a5 errorContent:(id)a6;
+ (id)contentWithSpinner;
+ (id)contentWithStream:(id)a3 microphoneMuted:(BOOL)a4 actionResultText:(id)a5;
- (HMCameraSource)cameraSource;
- (HUCameraErrorContent)errorContent;
- (HomeNotificationContent)initWithMode:(unint64_t)a3;
- (NSString)actionResultText;
- (NSString)statusText;
- (UIImage)statusAccessoryImage;
- (unint64_t)mode;
- (unint64_t)statusDisplayStyle;
- (void)setActionResultText:(id)a3;
- (void)setCameraSource:(id)a3;
- (void)setErrorContent:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setStatusAccessoryImage:(id)a3;
- (void)setStatusDisplayStyle:(unint64_t)a3;
- (void)setStatusText:(id)a3;
@end

@implementation HomeNotificationContent

- (HomeNotificationContent)initWithMode:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HomeNotificationContent;
  result = [(HomeNotificationContent *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

+ (id)contentWithSpinner
{
  v2 = [[HomeNotificationContent alloc] initWithMode:0];

  return v2;
}

+ (id)contentWithSnapshot:(id)a3 loadingStream:(BOOL)a4 actionResultText:(id)a5 errorContent:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v12 = [[HomeNotificationContent alloc] initWithMode:1];
  [(HomeNotificationContent *)v12 setCameraSource:v11];

  if (v7)
  {
    v13 = HomeNotificationBundle([(HomeNotificationContent *)v12 setStatusDisplayStyle:1]);
    v14 = [v13 localizedStringForKey:@"HONStreamStatusLoading" value:&stru_100019140 table:@"HONLocalizable"];
    [(HomeNotificationContent *)v12 setStatusText:v14];
  }
  else
  {
    [(HomeNotificationContent *)v12 setStatusDisplayStyle:0];
  }
  [(HomeNotificationContent *)v12 setActionResultText:v10];

  [(HomeNotificationContent *)v12 setErrorContent:v9];

  return v12;
}

+ (id)contentWithStream:(id)a3 microphoneMuted:(BOOL)a4 actionResultText:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [[HomeNotificationContent alloc] initWithMode:2];
  [(HomeNotificationContent *)v9 setCameraSource:v8];

  id v11 = HomeNotificationBundle(v10);
  v12 = v11;
  if (v5) {
    CFStringRef v13 = @"HONMicrophoneStatusOff";
  }
  else {
    CFStringRef v13 = @"HONMicrophoneStatusOn";
  }
  if (v5) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = 2;
  }
  v15 = [v11 localizedStringForKey:v13 value:&stru_100019140 table:@"HONLocalizable"];
  [(HomeNotificationContent *)v9 setStatusText:v15];

  [(HomeNotificationContent *)v9 setStatusDisplayStyle:v14];
  v16 = HUImageNamed();
  [(HomeNotificationContent *)v9 setStatusAccessoryImage:v16];

  [(HomeNotificationContent *)v9 setActionResultText:v7];

  return v9;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HMCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (void)setCameraSource:(id)a3
{
}

- (UIImage)statusAccessoryImage
{
  return self->_statusAccessoryImage;
}

- (void)setStatusAccessoryImage:(id)a3
{
}

- (unint64_t)statusDisplayStyle
{
  return self->_statusDisplayStyle;
}

- (void)setStatusDisplayStyle:(unint64_t)a3
{
  self->_statusDisplayStyle = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (HUCameraErrorContent)errorContent
{
  return self->_errorContent;
}

- (void)setErrorContent:(id)a3
{
}

- (NSString)actionResultText
{
  return self->_actionResultText;
}

- (void)setActionResultText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionResultText, 0);
  objc_storeStrong((id *)&self->_errorContent, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_statusAccessoryImage, 0);

  objc_storeStrong((id *)&self->_cameraSource, 0);
}

@end
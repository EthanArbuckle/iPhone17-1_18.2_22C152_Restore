@interface MFCategoryTriageInteraction
+ (OS_os_log)log;
- (BOOL)isRecategorizationAction;
- (BOOL)shouldFileRadar;
- (ECEmailAddressConvertible)sender;
- (EFPair)radarContent;
- (MUIAvatarImageGenerator)avatarGenerator;
- (NSString)extraLogging;
- (id)cardActionWithCompletion:(id)a3;
- (int64_t)bucket;
- (unint64_t)changeOptions;
- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4;
- (void)setAvatarGenerator:(id)a3;
- (void)setBucket:(int64_t)a3;
- (void)setChangeOptions:(unint64_t)a3;
- (void)setExtraLogging:(id)a3;
- (void)setIsRecategorizationAction:(BOOL)a3;
- (void)setRadarContent:(id)a3;
- (void)setSender:(id)a3;
- (void)setShouldFileRadar:(BOOL)a3;
@end

@implementation MFCategoryTriageInteraction

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017BF1C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006999E8 != -1) {
    dispatch_once(&qword_1006999E8, block);
  }
  v2 = (void *)qword_1006999E0;

  return (OS_os_log *)v2;
}

- (id)cardActionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(MFTriageInteraction *)self title];
  v6 = [(MFTriageInteraction *)self _iconImageName];
  v7 = +[MFRecategorizationHeaderCardAction cardActionWithTitle:v5 shortTitle:0 imageName:v6 tintColor:0 handler:&stru_10060AC90];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017C1B8;
  v14[3] = &unk_10060ACE0;
  v14[4] = self;
  id v8 = v4;
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  v10 = +[NSMutableArray array];
  v13 = v9;
  id v12 = v10;
  MUIBucketEnumerateAllBuckets();
  [v7 setChildren:v12, _NSConcreteStackBlock, 3221225472, sub_10017C340, &unk_1006089E0];

  return v7;
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)MFCategoryTriageInteraction;
  [(MFTriageInteraction *)&v31 _performInteractionAfterPreparation:a3 completion:a4];
  v5 = [(MFTriageInteraction *)self messageListItemSelection];
  v6 = [v5 messageListItems];
  id v7 = [v6 count];

  if (v7)
  {
    int64_t v8 = [(MFCategoryTriageInteraction *)self bucket];
    unsigned int v9 = [(MFCategoryTriageInteraction *)self isRecategorizationAction];
    v10 = @"message feedback";
    if (v9) {
      v10 = @"sender recategorization";
    }
    v11 = v10;
    id v12 = [(MFTriageInteraction *)self messageListItemSelection];
    v13 = [v12 messageListItems];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10017C714;
    v27[3] = &unk_10060AD08;
    v14 = v11;
    v29 = self;
    int64_t v30 = v8;
    v28 = v14;
    [v13 enumerateObjectsUsingBlock:v27];

    if ([(MFCategoryTriageInteraction *)self shouldFileRadar])
    {
      id v15 = [(MFCategoryTriageInteraction *)self radarContent];
      v16 = [v15 first];

      v17 = [(MFCategoryTriageInteraction *)self radarContent];
      v18 = [v17 second];
      v19 = +[NSString stringWithFormat:@"%@\n\n NOTE: The full content of the message you acted on will be included in this radar.", v18];

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10017C920;
      v24[3] = &unk_10060AD30;
      id v20 = v16;
      id v25 = v20;
      id v21 = v19;
      id v26 = v21;
      v22 = +[MSRadarURLBuilder radarURLWithBuilder:v24];
      id v23 = [objc_alloc((Class)MSRadarInteraction) initWithTitle:&stru_100619928 message:&stru_100619928 radarURL:v22];
      [v23 openTapToRadar];
    }
  }
  else
  {
    v14 = +[MFCategoryTriageInteraction log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10045C4BC(v14);
    }
  }
}

- (int64_t)bucket
{
  return self->_bucket;
}

- (void)setBucket:(int64_t)a3
{
  self->_bucket = a3;
}

- (unint64_t)changeOptions
{
  return self->_changeOptions;
}

- (void)setChangeOptions:(unint64_t)a3
{
  self->_changeOptions = a3;
}

- (ECEmailAddressConvertible)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (MUIAvatarImageGenerator)avatarGenerator
{
  return self->_avatarGenerator;
}

- (void)setAvatarGenerator:(id)a3
{
}

- (BOOL)shouldFileRadar
{
  return self->_shouldFileRadar;
}

- (void)setShouldFileRadar:(BOOL)a3
{
  self->_shouldFileRadar = a3;
}

- (BOOL)isRecategorizationAction
{
  return self->_isRecategorizationAction;
}

- (void)setIsRecategorizationAction:(BOOL)a3
{
  self->_isRecategorizationAction = a3;
}

- (EFPair)radarContent
{
  return self->_radarContent;
}

- (void)setRadarContent:(id)a3
{
}

- (NSString)extraLogging
{
  return self->_extraLogging;
}

- (void)setExtraLogging:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLogging, 0);
  objc_storeStrong((id *)&self->_radarContent, 0);
  objc_storeStrong((id *)&self->_avatarGenerator, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end
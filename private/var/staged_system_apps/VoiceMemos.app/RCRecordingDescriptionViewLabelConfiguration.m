@interface RCRecordingDescriptionViewLabelConfiguration
+ (id)emptyConfiguration;
+ (id)playbackViewConfiguration;
+ (id)recordingCollectionViewCellConfiguration;
+ (id)recordingViewConfiguration;
+ (id)selectedRecordingCollectionViewCellConfiguration;
- (RCRecordingDescriptionViewLabelConfiguration)initWithRecordingTitleTextColor:(id)a3 recordingTitleEditingTintColor:(id)a4 subtitleTextColor:(id)a5;
- (UIColor)recordingTitleEditingTintColor;
- (UIColor)recordingTitleTextColor;
- (UIColor)subtitleTextColor;
- (id)_initWithStyle:(unint64_t)a3;
- (void)setRecordingTitleEditingTintColor:(id)a3;
- (void)setRecordingTitleTextColor:(id)a3;
- (void)setSubtitleTextColor:(id)a3;
@end

@implementation RCRecordingDescriptionViewLabelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_recordingTitleEditingTintColor, 0);

  objc_storeStrong((id *)&self->_recordingTitleTextColor, 0);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (UIColor)recordingTitleTextColor
{
  return self->_recordingTitleTextColor;
}

- (UIColor)recordingTitleEditingTintColor
{
  return self->_recordingTitleEditingTintColor;
}

- (id)_initWithStyle:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)RCRecordingDescriptionViewLabelConfiguration;
  v4 = [(RCRecordingDescriptionViewLabelConfiguration *)&v25 init];
  if (v4)
  {
    v5 = +[RCRecorderStyleProvider sharedStyleProvider];
    v6 = v5;
    switch(a3)
    {
      case 1uLL:
        uint64_t v7 = [v5 recordingCollectionViewCellTextColor];
        recordingTitleTextColor = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v7;

        uint64_t v9 = [v6 recordingCollectionViewCellTextColor];
        recordingTitleEditingTintColor = v4->_recordingTitleEditingTintColor;
        v4->_recordingTitleEditingTintColor = (UIColor *)v9;

        uint64_t v11 = [v6 recordingCollectionViewCellTextColor];
        goto LABEL_6;
      case 2uLL:
        uint64_t v12 = [v5 recordingCollectionViewSelectedCellTextColor];
        v13 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v12;

        uint64_t v14 = [v6 recordingCollectionViewSelectedCellTextColor];
        v15 = v4->_recordingTitleEditingTintColor;
        v4->_recordingTitleEditingTintColor = (UIColor *)v14;

        uint64_t v11 = [v6 recordingCollectionViewSelectedCellTextColor];
        goto LABEL_6;
      case 3uLL:
        uint64_t v16 = [v5 playbackCardPrimaryLabelFontColor];
        v17 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v16;

        uint64_t v11 = [v6 playbackCardPrimaryLabelFontColor];
LABEL_6:
        v18 = (void *)v11;
        [v6 descriptionViewSecondaryLabelAlpha];
        uint64_t v19 = [v18 colorWithAlphaComponent:];
        subtitleTextColor = v4->_subtitleTextColor;
        v4->_subtitleTextColor = (UIColor *)v19;

        goto LABEL_8;
      case 4uLL:
        uint64_t v21 = [v5 playbackCardPrimaryLabelFontColor];
        v22 = v4->_recordingTitleTextColor;
        v4->_recordingTitleTextColor = (UIColor *)v21;

        uint64_t v23 = [v6 playbackCardSecondaryLabelFontColor];
        v18 = v4->_subtitleTextColor;
        v4->_subtitleTextColor = (UIColor *)v23;
LABEL_8:

        break;
      default:
        break;
    }
  }
  return v4;
}

+ (id)recordingCollectionViewCellConfiguration
{
  id v2 = [[RCRecordingDescriptionViewLabelConfiguration alloc] _initWithStyle:1];

  return v2;
}

+ (id)recordingViewConfiguration
{
  id v2 = [[RCRecordingDescriptionViewLabelConfiguration alloc] _initWithStyle:3];

  return v2;
}

+ (id)emptyConfiguration
{
  id v2 = [[RCRecordingDescriptionViewLabelConfiguration alloc] _initWithStyle:0];

  return v2;
}

+ (id)selectedRecordingCollectionViewCellConfiguration
{
  id v2 = [[RCRecordingDescriptionViewLabelConfiguration alloc] _initWithStyle:2];

  return v2;
}

+ (id)playbackViewConfiguration
{
  id v2 = [[RCRecordingDescriptionViewLabelConfiguration alloc] _initWithStyle:4];

  return v2;
}

- (RCRecordingDescriptionViewLabelConfiguration)initWithRecordingTitleTextColor:(id)a3 recordingTitleEditingTintColor:(id)a4 subtitleTextColor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RCRecordingDescriptionViewLabelConfiguration;
  uint64_t v12 = [(RCRecordingDescriptionViewLabelConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_recordingTitleTextColor, a3);
    objc_storeStrong((id *)&v13->_recordingTitleEditingTintColor, a4);
    objc_storeStrong((id *)&v13->_subtitleTextColor, a5);
  }

  return v13;
}

- (void)setRecordingTitleTextColor:(id)a3
{
}

- (void)setRecordingTitleEditingTintColor:(id)a3
{
}

- (void)setSubtitleTextColor:(id)a3
{
}

@end
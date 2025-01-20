@interface MTATonePickerCell
- (MTATonePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTAlarm)alarm;
- (NSString)title;
- (void)reload;
- (void)setAlarm:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MTATonePickerCell

- (MTATonePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)MTATonePickerCell;
  v4 = [(MTATonePickerCell *)&v15 initWithStyle:1 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTATonePickerCell *)v4 setAccessoryType:1];
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v7 = [(MTATonePickerCell *)v5 textLabel];
    [v7 setFont:v6];

    v8 = [(MTATonePickerCell *)v5 textLabel];
    [v8 setAdjustsFontForContentSizeCategory:1];

    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v10 = [(MTATonePickerCell *)v5 detailTextLabel];
    [v10 setFont:v9];

    v11 = [(MTATonePickerCell *)v5 detailTextLabel];
    [v11 setAdjustsFontForContentSizeCategory:1];

    v12 = +[UIColor mtui_cellHighlightColor];
    [(MTATonePickerCell *)v5 setSelectedBackgroundColor:v12];

    v13 = v5;
  }

  return v5;
}

- (void)setAlarm:(id)a3
{
  v4 = (MTAlarm *)[a3 copy];
  alarm = self->_alarm;
  self->_alarm = v4;

  [(MTATonePickerCell *)self reload];
}

- (NSString)title
{
  v2 = [(MTATonePickerCell *)self textLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTATonePickerCell *)self textLabel];
  [v5 setText:v4];
}

- (void)reload
{
  v3 = [(MTATonePickerCell *)self alarm];
  id v4 = [v3 sound];
  id v5 = [v4 soundType];

  if (v5 == (id)2)
  {
    id v6 = +[TLToneManager sharedToneManager];
    v7 = [(MTATonePickerCell *)self alarm];
    v8 = [v7 sound];
    v9 = [(__CFString *)v8 toneIdentifier];
    v10 = [v6 nameForToneIdentifier:v9];
    v11 = [(MTATonePickerCell *)self detailTextLabel];
    [v11 setText:v10];
  }
  else
  {
    v12 = [(MTATonePickerCell *)self alarm];
    v13 = [v12 sound];
    id v14 = [v13 soundType];

    if (v14 != (id)3) {
      goto LABEL_8;
    }
    id v15 = objc_alloc((Class)MPMediaItem);
    v16 = [(MTATonePickerCell *)self alarm];
    v17 = [v16 sound];
    v18 = [v17 mediaItemIdentifier];
    id v6 = [v15 initWithPersistentID:[v18 longLongValue]];

    uint64_t v19 = [v6 valueForProperty:MPMediaItemPropertyTitle];
    v20 = (void *)v19;
    v21 = &stru_1000A2560;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    v8 = v21;

    v7 = [(MTATonePickerCell *)self detailTextLabel];
    [v7 setText:v8];
  }

LABEL_8:
  id v22 = [(MTATonePickerCell *)self detailTextLabel];
  [v22 sizeToFit];
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (void).cxx_destruct
{
}

@end
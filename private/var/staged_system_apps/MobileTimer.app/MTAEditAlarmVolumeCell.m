@interface MTAEditAlarmVolumeCell
- (MTAEditAlarmVolumeCell)initWithFrame:(CGRect)a3;
- (MTAEditAlarmVolumeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTAEditAlarmVolumeCellDelegate)delegate;
- (MTAlarm)alarm;
- (UISlider)volumeSlider;
- (float)alarmVolume;
- (void)buildVolumeSlider;
- (void)commonInit;
- (void)drawDebugFrames;
- (void)setAlarm:(id)a3;
- (void)setAlarmVolume:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setVolumeSlider:(id)a3;
- (void)setupConstraints;
- (void)soundVolumeChanged:(id)a3;
@end

@implementation MTAEditAlarmVolumeCell

- (MTAEditAlarmVolumeCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTAEditAlarmVolumeCell;
  v3 = -[MTAEditAlarmVolumeCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MTAEditAlarmVolumeCell *)v3 commonInit];
    v5 = v4;
  }

  return v4;
}

- (MTAEditAlarmVolumeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTAEditAlarmVolumeCell;
  v4 = [(MTAEditAlarmVolumeCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTAEditAlarmVolumeCell *)v4 commonInit];
    v6 = v5;
  }

  return v5;
}

- (void)commonInit
{
  [(MTAEditAlarmVolumeCell *)self buildVolumeSlider];

  [(MTAEditAlarmVolumeCell *)self setupConstraints];
}

- (void)buildVolumeSlider
{
  id v3 = objc_alloc_init((Class)UISlider);
  [(MTAEditAlarmVolumeCell *)self setVolumeSlider:v3];

  id v15 = +[UIColor colorWithRed:0.556862745 green:0.556862745 blue:0.576470588 alpha:1.0];
  v4 = [(MTAEditAlarmVolumeCell *)self detailTextLabel];
  v5 = [v4 font];
  [v5 pointSize];
  v6 = +[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", @"volume.fill", v15);
  objc_super v7 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v7 setMinimumValueImage:v6];

  objc_super v8 = [(MTAEditAlarmVolumeCell *)self detailTextLabel];
  v9 = [v8 font];
  [v9 pointSize];
  v10 = +[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", @"volume.3.fill", v15);
  v11 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v11 setMaximumValueImage:v10];

  v12 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v12 addTarget:self action:"soundVolumeChanged:" forControlEvents:4096];

  v13 = [(MTAEditAlarmVolumeCell *)self contentView];
  v14 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v13 addSubview:v14];
}

- (void)setupConstraints
{
  id v3 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v23 = +[NSMutableArray array];
  v4 = [(MTAEditAlarmVolumeCell *)self contentView];
  v5 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  v6 = [v5 topAnchor];
  objc_super v7 = [v4 topAnchor];
  objc_super v8 = [v6 constraintEqualToAnchor:v7 constant:5.0];
  [v23 addObject:v8];

  v9 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  v10 = [v9 centerYAnchor];
  v11 = [v4 centerYAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v23 addObject:v12];

  v13 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  v14 = [v13 leadingAnchor];
  id v15 = [v4 layoutMarginsGuide];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:0.0];
  [v23 addObject:v17];

  v18 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  v19 = [v18 trailingAnchor];
  v20 = [v4 layoutMarginsGuide];
  v21 = [v20 trailingAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:0.0];
  [v23 addObject:v22];

  +[NSLayoutConstraint activateConstraints:v23];
}

- (void)drawDebugFrames
{
  id v3 = +[UIColor redColor];
  id v4 = [v3 CGColor];
  v5 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  v6 = [v5 layer];
  [v6 setBorderColor:v4];

  objc_super v7 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  objc_super v8 = [v7 layer];
  [v8 setBorderWidth:2.0];

  v9 = [(MTAEditAlarmVolumeCell *)self layer];
  [v9 setBorderWidth:2.0];

  id v12 = +[UIColor blueColor];
  id v10 = [v12 CGColor];
  v11 = [(MTAEditAlarmVolumeCell *)self layer];
  [v11 setBorderColor:v10];
}

- (void)soundVolumeChanged:(id)a3
{
  id v4 = [(MTAEditAlarmVolumeCell *)self delegate];
  [v4 cellDidEditAlarmVolume:self];
}

- (void)setAlarm:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_alarm, a3);
  v5 = [v12 sound];
  unsigned int v6 = [v5 isSilent];

  if (v6)
  {
    [(MTAEditAlarmVolumeCell *)self setAlarmVolume:0.0];
    objc_super v7 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
    objc_super v8 = v7;
    uint64_t v9 = 0;
  }
  else
  {
    id v10 = [(MTAlarm *)self->_alarm sound];
    v11 = [v10 soundVolume];
    [v11 floatValue];
    -[MTAEditAlarmVolumeCell setAlarmVolume:](self, "setAlarmVolume:");

    objc_super v7 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
    objc_super v8 = v7;
    uint64_t v9 = 1;
  }
  [v7 setEnabled:v9];
}

- (float)alarmVolume
{
  v2 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  [v2 value];
  float v4 = v3;

  return v4;
}

- (void)setAlarmVolume:(float)a3
{
  id v5 = [(MTAEditAlarmVolumeCell *)self volumeSlider];
  *(float *)&double v4 = a3;
  [v5 setValue:v4];
}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (MTAEditAlarmVolumeCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAEditAlarmVolumeCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
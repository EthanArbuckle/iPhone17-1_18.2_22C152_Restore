@interface WFAlarmTableViewCell
- (BOOL)enabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTUIAlarmView)alarmView;
- (WFAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)refreshUI:(id)a3 animated:(BOOL)a4;
- (void)setEnabled:(BOOL)a3;
@end

@implementation WFAlarmTableViewCell

- (void).cxx_destruct
{
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (MTUIAlarmView)alarmView
{
  return self->_alarmView;
}

- (void)refreshUI:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  self->_enabled = [v5 isEnabled];
  uint64_t v6 = [v5 repeatSchedule];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  v7 = (void (*)(uint64_t))getDetailDateMaskToStringSymbolLoc_ptr;
  v22 = getDetailDateMaskToStringSymbolLoc_ptr;
  if (!getDetailDateMaskToStringSymbolLoc_ptr)
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __getDetailDateMaskToStringSymbolLoc_block_invoke;
    v18[3] = &unk_2649CC0B8;
    v18[4] = &v19;
    __getDetailDateMaskToStringSymbolLoc_block_invoke(v18);
    v7 = (void (*)(uint64_t))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    v8 = v7(v6);
    v9 = [(MTUIAlarmView *)self->_alarmView timeLabel];
    objc_msgSend(v9, "setHour:minute:", objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"));

    v10 = [MEMORY[0x263F825C8] labelColor];
    v11 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v12 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(WFAlarmTableViewCell *)self setBackgroundColor:v12];

    v13 = [(MTUIAlarmView *)self->_alarmView timeLabel];
    [v13 setTextColor:v10];

    alarmView = self->_alarmView;
    v15 = [v5 displayTitle];
    [(MTUIAlarmView *)alarmView setName:v15 andRepeatText:v8 textColor:v11];

    [(MTUIAlarmView *)self->_alarmView setNeedsLayout];
  }
  else
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSString * _Nonnull WFDetailDateMaskToString(uint32_t)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"WFAlarmTableViewCell.m", 23, @"%s", dlerror());

    __break(1u);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  if (*(double *)&sizeThatFits__width == a3.width)
  {
    double v8 = *(double *)&sizeThatFits__result_0;
    double v9 = *(double *)&sizeThatFits__result_1;
  }
  else
  {
    sizeThatFits__width = *(void *)&a3.width;
    id v5 = [(WFAlarmTableViewCell *)self contentView];
    [v5 bounds];
    double v7 = v6;

    -[MTUIAlarmView effectiveLayoutSizeFittingSize:](self->_alarmView, "effectiveLayoutSizeFittingSize:", v7, height);
    sizeThatFits__result_0 = *(void *)&v8;
    sizeThatFits__result_1 = *(void *)&v9;
  }
  result.double height = v9;
  result.width = v8;
  return result;
}

- (WFAlarmTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v5 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFAlarmTableViewCell;
  double v6 = [(WFAlarmTableViewCell *)&v16 initWithStyle:0 reuseIdentifier:v5];
  if (v6)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2050000000;
    double v7 = (void *)getMTUIAlarmViewClass_softClass;
    uint64_t v21 = getMTUIAlarmViewClass_softClass;
    if (!getMTUIAlarmViewClass_softClass)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __getMTUIAlarmViewClass_block_invoke;
      v17[3] = &unk_2649CC0B8;
      v17[4] = &v18;
      __getMTUIAlarmViewClass_block_invoke((uint64_t)v17);
      double v7 = (void *)v19[3];
    }
    double v8 = v7;
    _Block_object_dispose(&v18, 8);
    id v9 = [v8 alloc];
    v10 = [(WFAlarmTableViewCell *)v6 contentView];
    [v10 bounds];
    uint64_t v11 = objc_msgSend(v9, "initWithFrame:");
    alarmView = v6->_alarmView;
    v6->_alarmView = (MTUIAlarmView *)v11;

    [(MTUIAlarmView *)v6->_alarmView setAutoresizingMask:18];
    [(MTUIAlarmView *)v6->_alarmView setSwitchVisible:0];
    [(MTUIAlarmView *)v6->_alarmView setStyle:0];
    v13 = [(WFAlarmTableViewCell *)v6 contentView];
    [v13 addSubview:v6->_alarmView];

    v14 = v6;
  }

  return v6;
}

@end
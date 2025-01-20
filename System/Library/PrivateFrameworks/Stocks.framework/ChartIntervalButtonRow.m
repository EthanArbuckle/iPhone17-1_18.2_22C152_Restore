@interface ChartIntervalButtonRow
- (ChartIntervalButton)selectedButton;
- (ChartIntervalButtonRow)initWithMaxChartInterval:(int64_t)a3 chartIntervalButtonRowDelegate:(id)a4;
- (ChartIntervalButtonRowDelegate)delegate;
- (NSArray)intervalButtons;
- (int64_t)intervalForTouchLocation:(CGPoint)a3;
- (int64_t)maxChartInterval;
- (void)intervalButtonsTapped:(id)a3;
- (void)layoutSubviews;
- (void)selectChartIntervalButtonForInterval:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setIntervalButtons:(id)a3;
- (void)setMaxChartInterval:(int64_t)a3;
- (void)setSelectedButton:(id)a3;
- (void)sizeToBoldLabels;
@end

@implementation ChartIntervalButtonRow

- (ChartIntervalButtonRow)initWithMaxChartInterval:(int64_t)a3 chartIntervalButtonRowDelegate:(id)a4
{
  id v6 = a4;
  v7 = [(ChartIntervalButtonRow *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_maxChartInterval = a3;
    v9 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:9];
    uint64_t v10 = 0;
    double v11 = *MEMORY[0x263F001A8];
    double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
    do
    {
      v15 = -[ChartIntervalButton initWithFrame:]([ChartIntervalButton alloc], "initWithFrame:", v11, v12, v13, v14);
      v16 = +[ChartIntervalButton titleForInterval:v10];
      [(ChartIntervalButton *)v15 setText:v16];

      [(ChartIntervalButton *)v15 setTag:v10];
      [(ChartIntervalButton *)v15 setUserInteractionEnabled:0];
      [(ChartIntervalButton *)v15 setTextAlignment:1];
      [(NSArray *)v9 addObject:v15];
      [(ChartIntervalButtonRow *)v8 addSubview:v15];

      ++v10;
    }
    while (v10 != 9);
    intervalButtons = v8->_intervalButtons;
    v8->_intervalButtons = v9;
    v18 = v9;

    [(ChartIntervalButtonRow *)v8 sizeToBoldLabels];
    v19 = (void *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v8 action:sel_intervalButtonsTapped_];

    [(ChartIntervalButtonRow *)v8 addGestureRecognizer:v19];
  }

  return v8;
}

- (void)sizeToBoldLabels
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_intervalButtons;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setSelected:", 1, (void)v8);
        [v7 sizeToFit];
        [v7 setSelected:0];
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)layoutSubviews
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  [(ChartIntervalButtonRow *)self bounds];
  double v4 = v3;
  double v6 = v5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v7 = self->_intervalButtons;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    float v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = [v13 tag];
        if (v14 <= [(ChartIntervalButtonRow *)self maxChartInterval])
        {
          [v13 bounds];
          float v11 = v15 + v11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v9);
  }
  else
  {
    float v11 = 0.0;
  }

  int v16 = [(ChartIntervalButtonRow *)self maxChartInterval];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v17 = self->_intervalButtons;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    double v20 = (v4 - v11 + -32.0) / (double)v16;
    uint64_t v21 = *(void *)v39;
    double v22 = v6 + -5.0;
    double v23 = 16.0;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v17);
        }
        v25 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v26 = objc_msgSend(v25, "tag", (void)v38);
        int64_t v27 = [(ChartIntervalButtonRow *)self maxChartInterval];
        double v28 = 0.0;
        if (v26 <= v27)
        {
          int v29 = objc_msgSend(v25, "isSelected", 0.0);
          double v28 = 1.0;
          if (!v29) {
            double v28 = 0.8;
          }
        }
        [v25 setAlpha:v28];
        [v25 frame];
        double v31 = v30;
        double v33 = v32;
        double v34 = RoundToPixel(v23);
        v35 = [v25 font];
        [v35 ascender];
        double v37 = v22 - RoundToPixel(v36);

        objc_msgSend(v25, "setFrame:", v34, v37, v31, v33);
        double v23 = v23 + v20 + v31;
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v19);
  }
}

- (int64_t)intervalForTouchLocation:(CGPoint)a3
{
  double x = a3.x;
  int v5 = [(ChartIntervalButtonRow *)self maxChartInterval];
  [(ChartIntervalButtonRow *)self bounds];
  float v7 = x / v6 * (float)(v5 + 1);
  float v8 = floorf(v7);
  if (v8 >= (float)v5) {
    float v8 = (float)v5;
  }
  return (uint64_t)fmaxf(v8, 0.0);
}

- (void)intervalButtonsTapped:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 3)
  {
    [v9 locationInView:self];
    int64_t v4 = -[ChartIntervalButtonRow intervalForTouchLocation:](self, "intervalForTouchLocation:");
    int v5 = [(ChartIntervalButtonRow *)self intervalButtons];
    double v6 = [(ChartIntervalButtonRow *)self selectedButton];
    uint64_t v7 = [v5 indexOfObject:v6];

    if (v4 != v7)
    {
      float v8 = [(ChartIntervalButtonRow *)self delegate];
      [v8 chartIntervalButtonRow:self didSelectChartInterval:v4];

      [(ChartIntervalButtonRow *)self selectChartIntervalButtonForInterval:v4];
    }
  }
}

- (void)selectChartIntervalButtonForInterval:(int64_t)a3
{
  if (a3 != -1)
  {
    double v6 = [(ChartIntervalButtonRow *)self selectedButton];
    [v6 setSelected:0];

    uint64_t v7 = [(ChartIntervalButtonRow *)self intervalButtons];
    id v8 = [v7 objectAtIndexedSubscript:a3];

    [v8 setSelected:1];
    [(ChartIntervalButtonRow *)self setSelectedButton:v8];
    [(ChartIntervalButtonRow *)self setNeedsLayout];
  }
}

- (ChartIntervalButtonRowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChartIntervalButtonRowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)intervalButtons
{
  return self->_intervalButtons;
}

- (void)setIntervalButtons:(id)a3
{
}

- (ChartIntervalButton)selectedButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectedButton);

  return (ChartIntervalButton *)WeakRetained;
}

- (void)setSelectedButton:(id)a3
{
}

- (int64_t)maxChartInterval
{
  return self->_maxChartInterval;
}

- (void)setMaxChartInterval:(int64_t)a3
{
  self->_maxChartInterval = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_selectedButton);
  objc_storeStrong((id *)&self->_intervalButtons, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end